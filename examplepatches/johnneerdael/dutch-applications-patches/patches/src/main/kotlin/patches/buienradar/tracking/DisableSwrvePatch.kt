package patches.buienradar.tracking

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import patches.buienradar.shared.Constants.COMPATIBILITY_BUIENRADAR

@Suppress("unused")
val disableSwrvePatch = bytecodePatch(
    name = "Disable Swrve and location upload",
    description = "Replaces the Swrve engagement SDK (device profile, sessions, user properties, marketing " +
        "messages) with its built-in no-op and stops uploading the background location with the Swrve ID. " +
        "Weather alerts are delivered through Swrve, so this also disables all push alerts.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_BUIENRADAR)
    dependsOn(disableTrackingPatch)

    execute {
        // App.onCreate: `if (config.modelBlacklist.contains(Build.MODEL)) SwrveEmpty else SwrveImp`.
        // Force the blacklist result so the SDK's own empty implementation is used.
        SwrveModelBlacklistFingerprint.method.apply {
            val messageIndex = instructions.indexOfFirst {
                it.opcode == Opcode.CONST_STRING &&
                    ((it as ReferenceInstruction).reference as StringReference).string ==
                    "Current device is part of the model blacklist"
            }
            val containsIndex = instructions.take(messageIndex).indexOfLast {
                val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                it.opcode == Opcode.INVOKE_VIRTUAL && ref?.name == "contains" && ref.returnType == "Z"
            }
            check(containsIndex >= 0 && instructions[containsIndex + 1].opcode == Opcode.MOVE_RESULT) {
                "Unexpected Swrve model blacklist check"
            }
            val register = getInstruction<OneRegisterInstruction>(containsIndex + 1).registerA
            check(register < 16) { "Unexpected Swrve blacklist register v$register" }
            addInstruction(containsIndex + 2, "const/4 v$register, 0x1")
        }

        // LocationIntelligenceWorker still stores the last location locally for the app,
        // but no longer POSTs lat/lon plus the Swrve user ID to userapi.buienradar.nl/2.0/userlocation.
        var uploads = 0
        classDefForEach { classDef ->
            val callers = classDef.methods.filter { method ->
                method.implementation?.instructions?.any { it.isLocationUpload() } == true
            }
            if (callers.isEmpty()) return@classDefForEach
            mutableClassDefBy(classDef).methods.filter { method -> callers.any { it.name == method.name &&
                it.parameterTypes == method.parameterTypes && it.returnType == method.returnType } }.forEach { method ->
                method.instructions.withIndex().filter { (_, instruction) -> instruction.isLocationUpload() }
                    .map { it.index }.sortedDescending().forEach { index ->
                        val result = method.getInstruction(index + 1)
                        check(result.opcode == Opcode.MOVE_RESULT_OBJECT) { "Unexpected location upload result" }
                        // The caller compares the result with COROUTINE_SUSPENDED; null means completed.
                        method.replaceInstruction(index + 1, "const/16 v${(result as OneRegisterInstruction).registerA}, 0x0")
                        method.replaceInstruction(index, "nop")
                        uploads++
                    }
            }
        }
        check(uploads == 1) { "Expected one background location upload, found $uploads" }
    }
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.isLocationUpload(): Boolean {
    val ref = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return opcode == Opcode.INVOKE_INTERFACE && ref.parameterTypes.firstOrNull()?.toString() == BACKGROUND_LOCATION_ENTITY
}
