package dev.srwi.gintype.patches.gboard.registry

import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesSettingsPatch
import dev.srwi.gintype.patches.gboard.features.customholdpopups.gboardCustomHoldPopupsBytecodePatch
import dev.srwi.gintype.patches.gboard.features.customholdpopups.gboardCustomHoldPopupsFeatureMarkerPatch
import dev.srwi.gintype.patches.gboard.features.multiglide.gboardMultiGlideBytecodePatch
import dev.srwi.gintype.patches.gboard.features.multiglide.gboardMultiGlideFeatureMarkerPatch
import dev.srwi.gintype.patches.gboard.features.thicctopbar.gboardThiccTopBarBytecodePatch
import dev.srwi.gintype.patches.gboard.features.thicctopbar.gboardThiccTopBarFeatureMarkerPatch
import dev.srwi.gintype.patches.gboard.features.typingeffects.gboardTypingEffectsBytecodePatch
import dev.srwi.gintype.patches.gboard.features.typingeffects.gboardTypingEffectsFeatureMarkerPatch
import dev.srwi.gintype.patches.shared.Constants.COMPATIBILITY_GBOARD

/**
 * The GinType features offered by this bundle.
 *
 * GinType's own registry published these through its generated admission table, which this
 * repository does not have; the behaviour, runtime and settings entries are unchanged, only the
 * compatibility comes from this bundle's audited target set. `Package Rename` is deliberately not
 * ported: it duplicates this bundle's "Change package name", and two owners for one behaviour is
 * exactly what de-duplication is meant to prevent.
 */

@Suppress("unused")
val gintypeMultiglidePatch = bytecodePatch(
    name = "MultiGlide",
    description = "Two-finger swipe and tap+swipe chorded gesture typing powered by the Kinetica " +
        "algorithm and Gboard's own dictionary. Ported from GinType (srwi/GinType, GPLv3).",
    default = false,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardMultiGlideFeatureMarkerPatch,
        gboardMultiGlideBytecodePatch,
    )
}

@Suppress("unused")
val gintypeThiccTopBarPatch = bytecodePatch(
    name = "Thicc Top Bar",
    description = "Vertical word suggestions with up/down swipe and a 2D sentence matrix in " +
        "Gboard's own suggestion strip. Ported from GinType (srwi/GinType, GPLv3).",
    default = false,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardThiccTopBarFeatureMarkerPatch,
        gboardThiccTopBarBytecodePatch,
    )
}

@Suppress("unused")
val gintypeCustomHoldPopupsPatch = bytecodePatch(
    name = "Custom Hold Popups",
    description = "Edit and add custom characters, symbols, emojis and text snippets to the " +
        "long-press popups of keys, across all keyboard languages. " +
        "Ported from GinType (srwi/GinType, GPLv3).",
    default = false,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardCustomHoldPopupsFeatureMarkerPatch,
        gboardCustomHoldPopupsBytecodePatch,
    )
}

@Suppress("unused")
val gintypeTypingEffectsPatch = bytecodePatch(
    name = "Typing Effects",
    description = "Visual typing effects: rainbow swipe trail, glitter particles and " +
        "tap/release explosions, each tunable in Settings. " +
        "Ported from GinType (srwi/GinType, GPLv3).",
    default = false,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardTypingEffectsFeatureMarkerPatch,
        gboardTypingEffectsBytecodePatch,
    )
}
