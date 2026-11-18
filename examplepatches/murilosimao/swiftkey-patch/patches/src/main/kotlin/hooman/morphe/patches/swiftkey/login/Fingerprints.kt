package hooman.morphe.patches.swiftkey.login

import app.morphe.patcher.Fingerprint

// 9.13.19.3 inlines the cloud-prompt helper into LauncherActivity.onCreate.
// Match all three preference keys before modifying just the two automatic prompt decisions.
internal object CloudSignInPromptFingerprint : Fingerprint(
    definingClass = "Lcom/touchtype/LauncherActivity;",
    name = "onCreate",
    returnType = "V",
    strings = listOf(
        "onboarding_cloud_sign_in_enabled",
        "onboarding_cloud_sign_in_shown",
        "onboarding_onetime_bypass",
    ),
    parameters = listOf("Landroid/os/Bundle;"),
)
