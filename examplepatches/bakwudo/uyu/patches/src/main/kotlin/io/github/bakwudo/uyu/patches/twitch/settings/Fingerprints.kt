package io.github.bakwudo.uyu.patches.twitch.settings

import app.morphe.patcher.Fingerprint

/**
 * Twitch's settings screen (opened by the gear on the profile page). The class and method
 * names are not obfuscated. The screen is a single ComposeView.
 */
internal object MainSettingsOnCreateViewFingerprint : Fingerprint(
    definingClass = "Ltv/twitch/android/settings/main/MainSettingsFragmentV2;",
    name = "onCreateView",
    returnType = "Landroid/view/View;",
)
