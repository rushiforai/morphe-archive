package app.template.patches.truecaller.misc.update

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.shared.addInstructionsChecked

@Suppress("unused")
val disableUpdatePromptsPatch = bytecodePatch(
    name = "Disable update prompts",
    description = "Disables the update prompts.",
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // The suspend function returns a boxed Boolean ("an update flow was started"); report
        // that none was.
        StartUpdateFingerprint.method.addInstructionsChecked(
            0,
            """
                sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object p0
            """,
        )

        // The server can also mark this version REQUIRED or DISCONTINUED, which shows a
        // full-screen page that blocks the app. Report that no update is needed.
        ForcedUpdateTypeFingerprint.method.addInstructionsChecked(
            0,
            """
                sget-object v0, Lcom/truecaller/forcedupdate/UpdateType;->NONE:Lcom/truecaller/forcedupdate/UpdateType;
                return-object v0
            """,
        )
    }
}
