package dev.jason.gboardpatches.patches.gboard

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.amoleddark.gboardAmoledDynamicDarkBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.customtheme.gboardCustomThemeAssetsPatch
import dev.jason.gboardpatches.patches.gboard.features.customtheme.gboardCustomThemeFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.customtheme.gboardCustomThemeManifestPatch
import dev.jason.gboardpatches.patches.gboard.features.customtheme.gboardCustomThemeOfficialImportPatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardKeyShapeSelectionFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardKeyShapeSelectionFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.frostedglass.gboardFrostedGlassFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.frostedglass.gboardFrostedGlassLifecyclePatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardCompatibility18_8
import dev.jason.gboardpatches.patches.gboard.features.roundedkeyboard.gboardRoundedKeyboardBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.roundedkeyboard.gboardRoundedKeyboardFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.spacebarlogo.gboardSpacebarLogoFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.spacebarlogo.gboardSpacebarLogoSoftKeyPatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesSettingsPatch

/*
 * Theming patches, ported from Gboard-patches 4.3.0 (jasonwu1994) to our 18.6.3 target.
 *
 * Each public patch here is the user-facing entry point; the building blocks live in the
 * vendored dev.jason.gboardpatches feature packages. Order within the patch list matters only
 * for readability: every patch pulls in Gboard's Patches settings page, so the feature toggle
 * has somewhere to appear.
 */

/**
 * Rounded keyboard panel corners and radii.
 *
 * Rewrites Gboard's own theme style resolution, so it applies to any installed theme and needs
 * no network or bundled assets.
 */
@Suppress("unused")
val gboardRoundedKeyboardPanelPatch = resourcePatch(
    name = "Rounded Keyboard Panel",
    description = "Customize which corners of the keyboard panel are rounded, and set the top and " +
        "bottom radii separately. Applies to whichever theme is active.",
    default = true,
) {
    compatibleWith(gboard)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardRoundedKeyboardFeatureMarkerPatch,
        gboardRoundedKeyboardBytecodePatch,
    )
}

/**
 * Live background blur behind the keyboard plus theme or custom opacity.
 *
 * The active theme still supplies the palette and alpha; this adds the blur and the transparency
 * policy, and extends the effect into the navigation bar.
 */
@Suppress("unused")
val gboardFrostedGlassPatch = resourcePatch(
    name = "Frosted Glass",
    description = "Add live background blur and custom theme transparency to the keyboard, with " +
        "separate background and key opacity and an option to extend into the navigation bar. " +
        "Blur needs Android 12 or newer.",
    default = true,
) {
    compatibleWith(gboardCompatibility18_8())

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardFrostedGlassFeatureMarkerPatch,
        gboardFrostedGlassLifecyclePatch,
    )
}

/**
 * ZIP theme import through Gboard's own theme screen, plus a browsable pack gallery.
 *
 * Imported themes are validated by Gboard itself and activated through its stock
 * `additional_keyboard_theme` preference, so they keep working after a Gboard update. Theme packs
 * are downloaded on demand from their published source and verified against pinned SHA-256
 * digests; only the catalog ships inside the APK.
 */
@Suppress("unused")
val gboardCustomThemePatch = resourcePatch(
    name = "Custom Theme",
    description = "Import custom ZIP themes from Gboard's own theme screen and browse ready-made " +
        "theme packs, downloaded on demand and verified by checksum. Adds the INTERNET permission.",
    default = true,
) {
    compatibleWith(gboard)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardCustomThemeFeatureMarkerPatch,
        gboardCustomThemeAssetsPatch,
        gboardCustomThemeManifestPatch,
        gboardCustomThemeOfficialImportPatch,
    )
}

/**
 * Pure black keyboard surfaces for Gboard's Material-coloured dark keyboards.
 *
 * Gboard resolves the dynamic (wallpaper coloured) theme's keys area, non-prime panels, title
 * frame and header panels from the Material 3 `surface_dim`, `surface_container`,
 * `surface_container_low` and `surface_container_lowest` palette entries, which Google fills from
 * the wallpaper neutral ramp (a grey) instead of black. This patch rewrites those four entries of
 * the dark palette only: with the system in light mode Gboard keeps its light dynamic theme, and
 * with the system in dark mode the keyboard goes #000000. Accent colours and the elevated surfaces
 * (keys, chips, dialogs) keep Gboard's own values.
 *
 * Marked experimental for its first release: the dark palette override is confirmed on an AOSP
 * Android 16 emulator, not yet on a physical phone with a wallpaper-derived palette.
 */
@Suppress("unused")
val gboardAmoledDynamicDarkPatch = bytecodePatch(
    name = "AMOLED dark keyboard",
    description = "Experimental. Turns Gboard's dark keyboard background pure black instead of " +
        "Google's grey, including the dynamic theme that follows the wallpaper. Light mode and " +
        "the light theme stay unchanged.",
    default = false,
) {
    compatibleWith(gboardExperimental)

    dependsOn(gboardAmoledDynamicDarkBytecodePatch)
}

/**
 * Spacebar image: the built-in G icon or an imported PNG/WebP/JPEG, with tinting and size.
 */
@Suppress("unused")
val gboardSpacebarLogoPatch = resourcePatch(
    name = "G Logo on Spacebar",
    description = "Show a built-in icon or your own PNG, WebP, or JPEG on the spacebar. Keep its " +
        "original colors or choose a single color, adjust its size, and hide the language label.",
    default = true,
) {
    compatibleWith(gboard)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardSpacebarLogoFeatureMarkerPatch,
        gboardSpacebarLogoSoftKeyPatch,
    )
}

/**
 * Unlocks Gboard's own key shape row in theme details.
 *
 * Stock behaviour only, no custom drawing: Gboard's theme details page gains the Key shape option
 * without forcing rounded keys on.
 */
@Suppress("unused")
val gboardKeyShapeSelectionPatch = resourcePatch(
    name = "Key Shape Selection",
    description = "Enables Gboard's Key shape option in theme details, so a theme's keys can follow " +
        "the theme's own shape instead of being forced square.",
    default = true,
) {
    compatibleWith(gboard)

    dependsOn(
        gboardPatchesExtensionCarrierPatch,
        gboardKeyShapeSelectionFlagValuePatch,
        gboardKeyShapeSelectionFeatureMarkerPatch,
    )
}
