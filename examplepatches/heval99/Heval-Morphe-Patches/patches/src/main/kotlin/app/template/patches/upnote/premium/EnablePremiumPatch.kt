package app.template.patches.upnote.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_UPNOTE
import app.template.patches.shared.addInstructionsChecked

/**
 * UpNote Premium is decided by the account's subscription record: the account API returns
 * `valid`, `cancelled` and `expiresDateMs`, and a single no-arg Boolean getter turns them into
 * "is premium". The settings singleton reads that getter once at startup and stores the answer,
 * so the patch makes the getter answer true.
 *
 * Local-only: cloud sync still needs a real UpNote account and is left to the server. The billing
 * screen, the account API and the rest of the app are untouched.
 *
 * Verified 2026-10-27 against 9.22.8 (versionCode 360): see COMPATIBILITY_UPNOTE.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks UpNote Premium features locally (cloud sync still needs an account).",
) {
    compatibleWith(COMPATIBILITY_UPNOTE)

    execute {
        UpNoteSubscriptionFingerprint.method.addInstructionsChecked(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """,
        )
    }
}
