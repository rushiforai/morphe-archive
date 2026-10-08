/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

private const val ACCENT = "Lapp/morphe/extension/facebook/theme/AccentColor;"
internal const val ACCENT_MIG = "$ACCENT->mig(ILjava/lang/Object;)I"
internal const val ACCENT_FDS = "$ACCENT->fds(ILjava/lang/Object;)I"

/**
 * An accent colour for Facebook's blue (links, buttons, switches). It rides route one of the
 * themes: the Mig dark scheme and the FDS colour resolvers, hooked the way AMOLED and Material You
 * hook them, so it adds no anchor of its own. The extension answers Facebook's blue unchanged
 * while the list says Facebook blue, while Hushfacebook is paused, and while Material You is in the
 * build, which decides every colour this would.
 */
@Suppress("unused")
val accentColorPatch = bytecodePatch(
    // The README table check reads this literal.
    name = "Accent color",
    description = "Lets you swap Facebook's blue on links, buttons, switches and the selected tab for another " +
        "color, picked under Appearance. It starts on Facebook's own blue, so turn it on and pick one.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    dependsOn(facebookExtensionPatch)

    execute {
        enableStatus("accentColor")
    }

    // After every patch's execute, as the themes do, so each hook here goes after theirs and gets
    // their colour.
    finalize {
        hookDarkModeAnswer()
        hookColourResolvers(mig = ACCENT_MIG, fds = ACCENT_FDS)
    }
}
