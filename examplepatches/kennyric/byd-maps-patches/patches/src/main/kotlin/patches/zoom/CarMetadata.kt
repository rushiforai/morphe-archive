package patches.zoom

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

internal const val CAR_TRACKING = "Lcom/zipow/videobox/auto/a;"

/** Keep Zoom's original unknown-car labels when optional CarValue data is null. */
internal fun tolerateMissingCarMetadata(method: MutableMethod) {
    val (field, fallback) = when (method.name) {
        "e" -> "b" to "Android_Auto_make"
        "f" -> "c" to "Android_Auto_model"
        else -> error("Zoom car metadata setter changed")
    }
    check(method.definingClass == CAR_TRACKING && method.returnType == "V" &&
        method.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") &&
        AccessFlags.STATIC.isSet(method.accessFlags)) { "Zoom car metadata signature changed" }
    val body = method.implementation ?: error("Zoom car metadata setter has no code")
    val code = body.instructions.toList()
    check(code.map { it.opcode } == listOf(Opcode.SPUT_OBJECT, Opcode.RETURN_VOID) &&
        (code[0] as ReferenceInstruction).reference.toString() == "$CAR_TRACKING->$field:Ljava/lang/String;" &&
        (code[0] as OneRegisterInstruction).registerA == body.registerCount - 1) {
        "Zoom car metadata store changed or patch already applied"
    }
    method.addInstructionsWithLabels(0, """
        if-nez p0, :car_metadata
        const-string p0, "$fallback"
    """, ExternalLabel("car_metadata", method.getInstruction(0)))
}

internal val carMetadataCompatibility = bytecodePatch {
    dependsOn(originalInput)
    execute {
        val owner = mutableClassDefBy(CAR_TRACKING)
        for (name in listOf("e", "f")) tolerateMissingCarMetadata(owner.methods.single { it.name == name })
    }
}
