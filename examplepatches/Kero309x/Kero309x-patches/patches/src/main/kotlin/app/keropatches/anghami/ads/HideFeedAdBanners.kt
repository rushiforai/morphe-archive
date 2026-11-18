// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.anghami.ads

import app.keropatches.anghami.AnghamiApp
import app.keropatches.core.PatchCategory
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/** The construction that creates a banner slot in a list. */
private const val BANNER_MODEL_CONSTRUCTION =
    "Lcom/anghami/model/adapter/AdTagModel;-><init>(Ljava/lang/String;[Lcom/google/android/gms/ads/AdSize;)V"

/** The ad exemption check the same method consults before creating the slot. */
private const val AD_EXEMPTION_CALL =
    "Lcom/anghami/ghost/objectbox/models/ads/AdSettings;->noAd(Lcom/anghami/ghost/pojo/Song;)Z"

/**
 * The runnable that inserts a banner into a list, found by what it builds.
 *
 * Its class and method name are obfuscated, so neither is used to find it. The
 * method is identified by the two references that make it the banner inserter:
 * the banner model construction and the per-song ad exemption check. Requiring
 * both keeps a same-named runnable in another class from matching.
 */
private object FeedBannerInserterFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    custom = { method, _ ->
        val references = method.implementation?.instructions
            ?.toList()
            .orEmpty()
            .mapNotNull { instruction ->
                (instruction as? ReferenceInstruction)?.reference?.toString()
            }

        method.name == "run" &&
            BANNER_MODEL_CONSTRUCTION in references &&
            AD_EXEMPTION_CALL in references
    },
)

/**
 * Stops a list from inserting an advertising banner between its cells.
 *
 * The stock build posts a runnable after the list is built. That runnable checks
 * three things before it appends the banner: that no banner model already exists,
 * that the server supplied an ad tag, and that the current song is not exempt.
 * When all three pass it creates the banner model and asks the advertising SDK to
 * fill it.
 *
 * Answering the runnable with an early return takes the same path the list takes
 * when the server supplies no ad tag, so the list is assembled exactly as it is
 * for a request without a banner. No placeholder is left behind, because the
 * banner model is only ever appended inside this method. The advertising SDK is
 * never asked to load anything for this slot, so no request is made for it.
 *
 * The method does nothing else: it does not build ordinary cells, restore state or
 * start loading. That is why the whole method can be skipped rather than one
 * branch inside it.
 */
@Suppress("unused")
val hideFeedAdBannersPatch = bytecodePatch(
    name = "Hide in-feed ad banners",
    description = "Stops lists from inserting advertising banners between their cells.",
    default = true,
) {
    compatibleWith(AnghamiApp.compatibility)
    category(PatchCategory.ADS.label)

    execute {
        FeedBannerInserterFingerprint.method.returnEarly()
    }
}
