package app.afterglow.patches.tweaks

import app.afterglow.patches.litho.afterglowLithoFilterPatch
import app.afterglow.patches.settings.afterglowSettingsPatch
import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.markTweakInstalled
import app.afterglow.patches.tweaks.navigation.privacyHooksPatch
import app.afterglow.patches.tweaks.navigation.startupHooksPatch
import app.afterglow.patches.tweaks.navigation.tabBarHooksPatch
import app.morphe.patcher.patch.bytecodePatch

/*
 * Named tweak patches of the navigation batch (tools/tweaks.json): Tab bar, Startup tab and
 * animation, and Privacy. Their hooks are in tweaks/navigation/; the Navigation bar and Shorts
 * tweaks (TweakPatches.kt) depend on navigationBarHooksPatch and shortsHooksPatch.
 */

@Suppress("unused")
val tabBarTweakPatch = bytecodePatch(
    name = "Tab bar",
    description = "Customizes native tabs, the bonus row, centered anchors, labels, indicators and tab bar appearance in Afterglow settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch, afterglowSettingsPatch, afterglowLithoFilterPatch, tabBarHooksPatch,
        app.afterglow.patches.tweaks.navigation.nativeTabsHookPatch)
    execute { markTweakInstalled("tab-bar") }
}

@Suppress("unused")
val startupTweakPatch = bytecodePatch(
    name = "Startup tab and animation",
    description = "Opens YouTube on the startup tab you pick in Afterglow settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch, afterglowSettingsPatch, afterglowLithoFilterPatch, startupHooksPatch)
    execute { markTweakInstalled("startup") }
}

@Suppress("unused")
val privacyTweakPatch = bytecodePatch(
    name = "Privacy",
    description = "Lets you open links without Google and YouTube redirects, drop the share id from shared links and hide search suggestions.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch, afterglowSettingsPatch, afterglowLithoFilterPatch, privacyHooksPatch)
    execute { markTweakInstalled("privacy") }
}
