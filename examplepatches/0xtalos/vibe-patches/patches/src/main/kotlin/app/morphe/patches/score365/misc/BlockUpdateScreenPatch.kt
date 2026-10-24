package app.morphe.patches.score365.misc

import app.morphe.patches.score365.utils.COMPATIBILITY_365SCORE
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private val UPDATE_EXTRAS = setOf("ForceUpdateDialog", "NewVersionPopup")

private object BaseActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/Design/Activities/BaseActivity;",
    name = "onCreate",
    strings = listOf("ForceUpdateDialog"),
)

private object BaseActionBarActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/Design/Activities/BaseActionBarActivity;",
    name = "onCreate",
    strings = listOf("ForceUpdateDialog"),
)

private object MainDashboardActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/scores365/dashboard/MainDashboardActivity;",
    name = "onCreate",
    strings = listOf("PLAY_SERVICES_ERROR_CODE"),
)

/**
 * Blocks the "update required" / "this app is out of date" dialog from being shown on launch
 * by defusing the "ForceUpdateDialog" and "NewVersionPopup" intent checks, as well as the
 * Google Play services update prompt.
 */
@Suppress("unused")
val blockUpdateScreenPatch = bytecodePatch(
    name = "Block update screen",
    description = "Hides the 'This app is out of date' update screen, new version popup, and Google Play services update prompt.",
) {
    compatibleWith(*COMPATIBILITY_365SCORE)

    execute {
        // 1. Defuse ForceUpdateDialog and NewVersionPopup in BaseActivity and BaseActionBarActivity
        val targets = listOf(
            BaseActivityOnCreateFingerprint,
            BaseActionBarActivityOnCreateFingerprint,
        )

        for (target in targets) {
            val method = target.methodOrNull ?: continue
            val instructions = method.implementation?.instructions?.toList() ?: continue
            for ((index, instruction) in instructions.withIndex()) {
                if (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                    val stringValue = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
                    if (stringValue in UPDATE_EXTRAS) {
                        val register = (instruction as OneRegisterInstruction).registerA
                        method.replaceInstruction(
                            index,
                            "const-string v$register, \"morphe_disabled_$stringValue\"",
                        )
                    }
                }
            }
        }

        // 2. Defuse Google Play Services update dialog in MainDashboardActivity.onCreate
        MainDashboardActivityOnCreateFingerprint.methodOrNull?.let { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@let
            val errorCodeIndex = instructions.indexOfFirst {
                (it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO) &&
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "PLAY_SERVICES_ERROR_CODE"
            }
            if (errorCodeIndex >= 0) {
                // Find the move-result right before errorCodeIndex that captures the isGooglePlayServicesAvailable result
                val moveResultIndex = (errorCodeIndex - 1 downTo 0).firstOrNull {
                    instructions[it].opcode == Opcode.MOVE_RESULT
                }
                if (moveResultIndex != null) {
                    val register = (instructions[moveResultIndex] as OneRegisterInstruction).registerA
                    method.replaceInstruction(
                        moveResultIndex,
                        "const/4 v$register, 0x0",
                    )
                }
            }

            // Also rename GOOGLE_PLAY_SERVICES_UPDATE_TITLE if present as safeguard
            val titleIndex = instructions.indexOfFirst {
                (it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO) &&
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "GOOGLE_PLAY_SERVICES_UPDATE_TITLE"
            }
            if (titleIndex >= 0) {
                val register = (instructions[titleIndex] as OneRegisterInstruction).registerA
                method.replaceInstruction(
                    titleIndex,
                    "const-string v$register, \"morphe_disabled_GOOGLE_PLAY_SERVICES_UPDATE_TITLE\"",
                )
            }
        }
    }
}
