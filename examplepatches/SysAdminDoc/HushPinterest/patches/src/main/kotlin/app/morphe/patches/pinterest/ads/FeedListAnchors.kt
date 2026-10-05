/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * The three classes Pinterest hands a page of items to before anything is drawn: the feed, a paged
 * API response and a model list with a bookmark. Each is renamed in every build, but each still
 * describes itself in `toString()` with its Kotlin name, so that text finds the class.
 *
 * Found by reading 14.25.0 (2026-10-02), where they're `k12.e`, `mr1.g0` and `kh2.b`. In 14.38.0
 * they're `e52.d` (now with two list constructors), `gu1.l0` and `bm2.c`. The same
 * three texts mark them in 14.23 to 14.34 according to the Pinterest patch sources in
 * sources/pinterest-sources.json.
 */
internal object FeedToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string(", _items count:")),
)

internal object PagedResponseToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string("PagedResponse(bookmark=")),
)

internal object ModelListToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(string("ModelListWithBookmark(models=")),
)

/** Views that Pinterest only ever builds to show an ad. Each name is kept, being a layout's view class. */
internal val AD_ONLY_VIEWS = listOf(
    "Lcom/pinterest/featurelibrary/textads/TextAdView;",
    "Lcom/pinterest/activity/pin/view/modules/LegacyPromotedCloseupActionButtonModule;",
    "Lcom/pinterest/feature/pin/closeup/view/PromotedPinCloseupFloatingActionBarModule;",
    "Lcom/pinterest/feature/board/detail/header/view/lego/BoardSponsoredCuratorView;",
)
