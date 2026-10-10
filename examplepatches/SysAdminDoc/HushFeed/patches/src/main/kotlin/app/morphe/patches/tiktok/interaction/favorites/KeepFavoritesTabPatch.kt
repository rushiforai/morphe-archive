/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.patches.tiktok.interaction.favorites

import app.morphe.util.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.absettings.hookAppAbBooleanBoundary
import app.morphe.patches.tiktok.misc.absettings.hookAppAbIntBoundary
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.misc.settings.settingsPatch

private const val EXTENSION_CLASS_DESCRIPTOR = "Lapp/morphe/extension/tiktok/favorites/FavoritesTab;"

/**
 * The profile's Favorites tab builds its pages in `FavoritesFragmentV2.onCreate`, and two app
 * AB gates make it build none: `favorite_reverse` read as 1 and
 * `new_user_favorite_full_reversal_exp` read as true. Either one leaves the tab in place and
 * empty, which is what two people reported after patching. Both reads go through the app AB
 * class's typed getters, so the two boundary hooks see every read and answer those two.
 */
@Suppress("unused")
val keepFavoritesTabPatch = bytecodePatch(
    name = "Keep the Favorites tab",
    description = "Keeps the Favorites tab and your saved videos on your profile when TikTok " +
        "tries out a version of the app that hides them. On by default. Turn it off in Hushfeed " +
        "settings > App.",
    default = true,
) {
    category("Settings")
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, " +
                "Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableKeepFavoritesTab()V",
        )
        hookAppAbIntBoundary(EXTENSION_CLASS_DESCRIPTOR, "keepInt")
        hookAppAbBooleanBoundary(EXTENSION_CLASS_DESCRIPTOR, "keepBoolean")
    }
}
