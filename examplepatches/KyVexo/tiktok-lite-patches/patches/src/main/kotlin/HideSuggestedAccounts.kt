package app.tiktoklitepatches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideSuggestedAccounts = bytecodePatch(
    name = "Hide suggested accounts",
    description = "Adds an off-by-default Mod settings switch to hide suggested accounts in Profile and Inbox.",
    default = false,
) {
    compatibleWith(tikTokLiteCompatibility)
    dependsOn(inboxRowFilter)
    execute {
        enableModSetting("profileSuggestionsAvailable")

        // Profile's recommendation card uses state 0 to collapse its own container.
        Fingerprint(
            definingClass = "LX/Hrd;",
            name = "L",
            parameters = listOf("I", "Ljava/lang/String;", "Ljava/util/List;"),
            returnType = "V",
        ).method.addInstructionsWithLabels(0, """
            invoke-static {}, Lapp/tiktoklitepatches/extension/ModSettings;->hideProfileSuggestions()Z
            move-result v0
            if-eqz v0, :original_state
            const/4 p1, 0x0
            :original_state
            nop
        """.trimIndent())
    }
}
