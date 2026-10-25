package app.template.patches.flashscore.misc.rating

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.COMPATIBILITY_FLASHSCORE
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// Settings keys that decide whether the rating banner and the in-app rating dialog may show.
// Enum constant names survive R8 (Enum.name() is backed by the constructor's string argument).
private val RATING_SETTINGS = listOf("CAN_SHOW_RATING_BANNER", "CAN_SHOW_INAPP_RATING")

@Suppress("unused")
val disableRatingPromptsPatch = bytecodePatch(
    name = "Disable rating prompts",
    description = "Disables the rating prompts.",
) {
    compatibleWith(COMPATIBILITY_FLASHSCORE)

    execute {
        val getBool = SettingsGetBoolFingerprint.method

        // The key enum must still define both constants, or the name check below is dead code.
        val keyEnum = classDefBy(getBool.parameterTypes.first().toString())
        val enumNames = keyEnum.methods.filter { it.name == "<clinit>" }
            .flatMap { it.implementation?.instructions?.toList().orEmpty() }
            .mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
            .toSet()
        if (keyEnum.superclass != "Ljava/lang/Enum;" || !enumNames.containsAll(RATING_SETTINGS)) {
            throw PatchException("${keyEnum.type} is not the settings enum with $RATING_SETTINGS")
        }

        // p1 is the key; v0 and v1 are locals the method writes before reading.
        getBool.addInstructionsWithLabelsChecked(
            0,
            """
                invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;
                move-result-object v0
                const-string v1, "${RATING_SETTINGS[0]}"
                invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v1
                if-nez v1, :rating_disabled
                const-string v1, "${RATING_SETTINGS[1]}"
                invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v1
                if-eqz v1, :read_setting
                :rating_disabled
                const/4 v0, 0x0
                return v0
            """,
            ExternalLabel("read_setting", getBool.getInstruction(0)),
        )
    }
}
