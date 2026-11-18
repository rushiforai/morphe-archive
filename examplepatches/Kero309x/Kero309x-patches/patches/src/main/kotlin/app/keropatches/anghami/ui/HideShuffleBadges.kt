// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.anghami.ui

import app.keropatches.anghami.AnghamiApp
import app.keropatches.core.PatchCategory
import app.keropatches.core.replaceBooleanFieldReadsWithFalse
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * The flag an item carries to say the server expects it to be played shuffled.
 *
 * It is filled in reflectively from the response, so there is no assignment in
 * the bytecode to change. Every place that draws a badge reads the field directly
 * instead of going through a getter.
 */
private const val SHUFFLE_FLAG = "Lcom/anghami/ghost/pojo/PossiblyGenericModel;->isShuffleMode:Z"

/**
 * Card and row layouts put the shuffle glyph in front of the subtitle.
 *
 * Three card shapes ask for the glyph as the subtitle's leading drawable; three
 * row shapes prepend it as an image span while building the subtitle text. The
 * answer and the layout branches are the only use of the flag in each method.
 */
private object AlbumCardFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/AlbumCardModel;",
    name = "getSubtitleStartingDrawable",
    isStatic = false,
    returnType = "I",
    parameters = emptyList(),
)

private object PlaylistCardFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/PlaylistCardModel;",
    name = "getSubtitleStartingDrawable",
    isStatic = false,
    returnType = "I",
    parameters = emptyList(),
)

private object LinkCardFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/LinkCardModel;",
    name = "getSubtitleStartingDrawable",
    isStatic = false,
    returnType = "I",
    parameters = emptyList(),
)

private object AlbumRowFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/AlbumRowModel;",
    name = "getSubtitleText",
    isStatic = false,
    returnType = "Ljava/lang/CharSequence;",
    parameters = emptyList(),
)

private object PlaylistRowFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/PlaylistRowModel;",
    name = "getSubtitleText",
    isStatic = false,
    returnType = "Ljava/lang/CharSequence;",
    parameters = emptyList(),
)

private object LinkRowFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/LinkModel;",
    name = "setSubtitleView",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Lcom/anghami/model/adapter/LinkModel${'$'}LinkViewHolder;"),
)

/**
 * The two layouts that own a dedicated shuffle badge view.
 *
 * One is the concertina header card; the other is the horizontally scrolling
 * store carousel. Each reads the flag only to decide whether that view is shown.
 */
private object LinkHeaderCardFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/LinkNewCardModel;",
    name = "_bind",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Lcom/anghami/model/adapter/LinkNewCardModel${'$'}HeaderLinkHolder;"),
)

private object StoreCarouselFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/store/StoreCarouselSubModel;",
    name = "_bind",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Lcom/anghami/model/adapter/store/StoreCarouselSubModel${'$'}StoreSubViewHolder;"),
)

/**
 * The header badge predicate, declared on the base class and overridden by the
 * two header models that compute it from their own item.
 *
 * Patching the base declaration covers every header type that does not override
 * it; patching the two overrides covers the album and playlist headers.
 */
private object BaseHeaderFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/headers/BaseHeaderModel;",
    name = "getHasShuffleBadge",
    isStatic = false,
    returnType = "Z",
    parameters = emptyList(),
)

private object AlbumHeaderFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/headers/AlbumHeaderModel;",
    name = "getHasShuffleBadge",
    isStatic = false,
    returnType = "Z",
    parameters = emptyList(),
)

private object PlaylistHeaderFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/headers/PlaylistHeaderModel;",
    name = "getHasShuffleBadge",
    isStatic = false,
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Stops every list surface from drawing a shuffle badge.
 *
 * The badge takes three shapes: a leading glyph in a card subtitle, an image span
 * inside a row subtitle, and a dedicated view in a header or carousel card. The
 * patch targets each shape where the flag is read, so the badge is never built
 * and no empty space is left where it would have been.
 *
 * The flag itself is not cleared. It is part of the model, is written to and read
 * from storage, and is compared when a list is diffed, so changing the stored
 * value would touch work that has nothing to do with drawing. Only the drawing
 * decisions change: rows, cards and headers keep their items, subtitles and
 * actions, and a list that did not show a badge is unaffected.
 */
@Suppress("unused")
val hideShuffleBadgesPatch = bytecodePatch(
    name = "Hide shuffle badges",
    description = "Stops list cards, rows and headers from drawing the badge that marks shuffled playback.",
    default = true,
) {
    compatibleWith(AnghamiApp.compatibility)
    category(PatchCategory.INTERFACE.label)

    execute {
        listOf(
            AlbumCardFingerprint,
            PlaylistCardFingerprint,
            LinkCardFingerprint,
            AlbumRowFingerprint,
            PlaylistRowFingerprint,
            LinkRowFingerprint,
            LinkHeaderCardFingerprint,
            StoreCarouselFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.replaceBooleanFieldReadsWithFalse(SHUFFLE_FLAG)
        }

        BaseHeaderFingerprint.method.returnEarly(false)
        AlbumHeaderFingerprint.method.returnEarly(false)
        PlaylistHeaderFingerprint.method.returnEarly(false)
    }
}
