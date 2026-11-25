package app.sigstick.patches.login

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.sigstick.patches.shared.Constants.COMPATIBILITY_SIGSTICK
import app.sigstick.patches.shared.indexOfCall
import app.sigstick.patches.shared.nopCall

/**
 * `GoogleLoginBtn(SettingsViewModel, Composer, I)V` — the only entry to Credential Manager's
 * "Sign in with Google" (`launchCredManButtonUI`) → `AccountService.signInWithCredential`. Shown
 * in Settings and on the sticker / single detail screens. Returning before
 * `startRestartGroup` drops the whole composable group, so callers stay balanced.
 * The app keeps running on its Firebase anonymous account (`signInAnonymously`).
 */
private object GoogleLoginBtnFingerprint : Fingerprint(
    definingClass = "Lcom/sigstick/myapp/ui/components/settings/GoogleLoginBtnKt;",
    name = "GoogleLoginBtn",
    returnType = "V",
)

/**
 * Settings' account card: `GoogleLoginBtn` → `SectionDivider` → `CurrentSubscriptionButton`.
 * Matched on the call sequence rather than the `SettingsScreen$lambda$10$2$0` name.
 */
private object AccountSectionFingerprint : Fingerprint(
    definingClass = "Lcom/sigstick/myapp/ui/screen/account/SettingsScreenKt;",
    filters = listOf(
        methodCall(name = "GoogleLoginBtn"),
        methodCall(name = "SectionDivider"),
        methodCall(name = "CurrentSubscriptionButton"),
    ),
)

@Suppress("unused")
val removeGoogleLoginPatch = bytecodePatch(
    name = "Remove Google Login",
    description = "Removes the \"Sign in with Google\" button everywhere it appears. The app " +
        "keeps working with its anonymous account; anything that needs a Google account " +
        "(publishing under your name, synced collections) is no longer reachable.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SIGSTICK)

    execute {
        GoogleLoginBtnFingerprint.method.addInstruction(0, "return-void")

        // Without this the account card would open on a lone divider.
        AccountSectionFingerprint.method.apply {
            nopCall("SectionDivider", indexOfCall("GoogleLoginBtn"))
        }
    }
}
