package patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val CAR_ACTIVITY = "Landroidx/car/app/activity/CarAppActivity;"
internal const val BASE_CAR_ACTIVITY = "Landroidx/car/app/activity/BaseCarAppActivity;"
internal const val RESULT_MANAGER = "Landroidx/car/app/managers/ResultManager;"

/** Preserve superclass initialization and the original Automotive path, including lifecycle cleanup. */
internal fun adaptCarLauncher(method: MutableMethod) {
    check(method.definingClass == CAR_ACTIVITY && method.name == "onCreate" &&
        method.parameterTypes.map(CharSequence::toString) == listOf("Landroid/os/Bundle;") &&
        method.returnType == "V" && !AccessFlags.STATIC.isSet(method.accessFlags)) { "Car launcher signature changed" }
    val body = method.implementation ?: error("Car launcher has no implementation")
    check(body.registerCount >= 3 && body.instructions.first().opcode == Opcode.INVOKE_SUPER &&
        (body.instructions.first() as? ReferenceInstruction)?.reference?.toString() ==
        "$BASE_CAR_ACTIVITY->onCreate(Landroid/os/Bundle;)V") { "Car launcher lifecycle contract changed" }
    check(body.instructions.none { (it as? ReferenceInstruction)?.reference?.toString()
        ?.contains("Lnl/johninnl/carports/") == true }) { "Car launcher already patched" }
    method.addInstructionsWithLabels(1, """
        invoke-static {p0}, Lnl/johninnl/carports/PortLaunchActivity;->redirectIfProjected(Landroid/app/Activity;)Z
        move-result v0
        if-eqz v0, :automotive_launcher
        return-void
    """, ExternalLabel("automotive_launcher", method.getInstruction(1)))
}

/** Match the projected library's unavailable-result semantics without changing the native car path. */
internal fun adaptCarResults(method: MutableMethod) {
    check(method.definingClass == RESULT_MANAGER && method.name == "create" &&
        method.parameterTypes.map(CharSequence::toString) == listOf("Landroidx/car/app/CarContext;") &&
        method.returnType == RESULT_MANAGER && AccessFlags.STATIC.isSet(method.accessFlags)) { "Car result factory signature changed" }
    val body = method.implementation ?: error("Car result factory has no implementation")
    check(body.registerCount >= 2 && body.instructions.any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string ==
            "androidx.car.app.CarAppMetadataHolderService.RESULT_MANAGER"
    }) { "Automotive result metadata contract changed" }
    check(body.instructions.none { (it as? ReferenceInstruction)?.reference?.toString()
        ?.contains("Lnl/johninnl/carports/") == true }) { "Car result factory already patched" }
    method.addInstructionsWithLabels(0, """
        invoke-static {p0}, Lnl/johninnl/carports/ProjectedResults;->isAutomotive(Landroid/content/Context;)Z
        move-result v0
        if-nez v0, :automotive_results
        invoke-static {}, Lnl/johninnl/carports/ProjectedResults;->get()$RESULT_MANAGER
        move-result-object v0
        return-object v0
    """, ExternalLabel("automotive_results", method.getInstruction(0)))
}

internal fun projectedCarBytecode(preflight: Patch<*>) = bytecodePatch {
    dependsOn(preflight)
    extendWith("extensions/car-app-ports.mpe")
    execute {
        check(classDefBy("Landroidx/car/app/hardware/CarHardwareManager;").methods.any {
            it.name == "create" && it.parameterTypes.map(CharSequence::toString) ==
                listOf("Landroidx/car/app/CarContext;", "Landroidx/car/app/HostDispatcher;")
        }) { "Car App Library hardware ABI changed" }
        check(classDefBy("Landroidx/car/app/hardware/ProjectedCarHardwareManager;").methods.any {
            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) ==
                listOf("Landroidx/car/app/CarContext;", "Landroidx/car/app/HostDispatcher;")
        }) { "Projected hardware implementation missing" }
        check(classDefBy("Landroidx/car/app/media/ProjectedCarAudioRecord;").methods.any {
            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroidx/car/app/CarContext;")
        }) { "Projected microphone implementation missing" }
        adaptCarLauncher(mutableClassDefBy(CAR_ACTIVITY).methods.single { it.name == "onCreate" })
        adaptCarResults(mutableClassDefBy(RESULT_MANAGER).methods.single { it.name == "create" })
    }
}
