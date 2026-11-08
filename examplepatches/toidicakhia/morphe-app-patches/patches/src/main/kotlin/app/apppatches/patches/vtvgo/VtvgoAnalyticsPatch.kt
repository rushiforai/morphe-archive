package app.apppatches.patches.vtvgo

import app.apppatches.patches.shared.Constants.VTVGO_COMPATIBILITY
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.matchSingle
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

@Suppress("unused")
val vtvgoDisableAnalyticsPatch = bytecodePatch(
    name = "Disable Analytics / Telemetry",
    description = "Disables Firebase Analytics, Crashlytics and Performance, stops Sentry uploads and " +
        "turns off Facebook app events. The firebase_data_collection_default_enabled flag also " +
        "prevents the SDKs from re-enabling collection.",
    default = true
) {
    compatibleWith(VTVGO_COMPATIBILITY)
    dependsOn(vtvgoAnalyticsManifestPatch)
    dependsOn(vtvgoSentryDsnHexPatch)

    execute {
        // The Firebase Flutter plugin funnels every set*CollectionEnabled call
        // through one synthetic Runnable. Its constructor argument is copied to
        // the boolean field "I"; overwriting that register with 0 keeps
        // Analytics, Crashlytics and Performance disabled for the whole process.
        FirebaseCollectionToggleFingerprint.matchSingle().method.apply {
            val flagIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.IGET_BOOLEAN &&
                    getReference<FieldReference>()?.let { reference ->
                        reference.definingClass == "Les1;" && reference.name == "I"
                    } == true
            }
            val flagRegister = getInstruction<OneRegisterInstruction>(flagIndex).registerA
            val instruction = if (flagRegister < 16) {
                "const/4 v$flagRegister, 0x0"
            } else {
                "const/16 v$flagRegister, 0x0"
            }
            addInstruction(flagIndex + 1, instruction)
        }
    }
}
