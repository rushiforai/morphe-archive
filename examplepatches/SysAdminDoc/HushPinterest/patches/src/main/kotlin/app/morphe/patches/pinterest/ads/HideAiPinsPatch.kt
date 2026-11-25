/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

private const val PATCH = "Hide AI-labeled pins"

/**
 * Takes the pins Pinterest labels as made or changed with AI out of the same lists Hide ads works
 * on, through the shared list hook ([feedListHookPatch]). The label is read by JSON name at run time;
 * an AI image Pinterest hasn't labeled carries nothing to go by, and stays.
 *
 * Off when you patch unless you pick it: it changes what you see, not just what's sold to you.
 *
 * 14.40.0 draws "AI modified" from `digital_media_source_type_label` and treats any
 * `digital_media_source_type` (an enum of AI kinds) as an AI pin; its old `ai_disclosures` readers
 * have no callers left. 14.39.0 read `ai_disclosures` for 1 (AI modified) and 2 (synthetic
 * performer). The extension takes any of the three.
 *
 * Hide pins that say they're AI is a second switch on the same hook: it also takes an unlabeled pin
 * whose own title or description uses one of a few AI art phrases, or whose site only hosts AI images.
 */
@Suppress("unused")
val hideAiPinsPatch = bytecodePatch(
    name = PATCH,
    description = "Removes pins that Pinterest labels as made or changed with AI from your home feed, search, " +
        "related pins and other people's boards. A second switch also takes unlabeled pins whose title or description calls " +
        "them AI art, or that come from an AI image site. Other AI images still show. Both start off. Turn " +
        "them on in HushPinterest settings > Feed.",
) {
    category("Feed")
    dependsOn(settingsPatch, pinterestExtensionPatch, feedListHookPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("hideAiPins")
        requireStatusMethod("feedAiPins")
        if (feedListHoldersHooked == 0) throw PatchException("$PATCH: no list holder was hooked")
        enableCapability("feedAiPins")
        enableStatus("hideAiPins")
    }
}
