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
 * on, through the shared list hook ([feedListHookPatch]). The label is the pin's `ai_disclosures`
 * list, read by its JSON name at run time; an AI image Pinterest hasn't labeled carries nothing to
 * go by, and stays.
 *
 * Off when you patch unless you pick it: it changes what you see, not just what's sold to you.
 *
 * Pinterest's label check reads `ai_disclosures` for 1 (AI modified) and 2 (synthetic performer).
 * 14.38.0 still names the field `ai_disclosures` and both labels.
 */
@Suppress("unused")
val hideAiPinsPatch = bytecodePatch(
    name = PATCH,
    description = "Removes pins that Pinterest labels as made or changed with AI from your home feed, search, " +
        "related pins and boards. AI images without the label still show. Starts off. Turn it on in " +
        "HushPinterest settings > Feed.",
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
