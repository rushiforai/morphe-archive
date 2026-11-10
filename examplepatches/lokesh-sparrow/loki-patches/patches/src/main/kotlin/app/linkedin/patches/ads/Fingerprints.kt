/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.patches.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall

private const val COLLECTION = "Lcom/linkedin/android/pegasus/gen/collection/CollectionTemplate;"

/**
 * The `ModelFilter` of the classic feed (MainFeedUpdatesConfigFactory.createSponsoredDuplicatesFilter):
 * it drops a promoted post only when the same campaign is already in the list, and otherwise ends with
 * `collection.copyWithNewElements(elements)`.
 *
 * R8 moves this lambda into an unrelated class, so the defining class cannot be matched; the ads fetch
 * counter it reads and the copy call it ends with identify it instead.
 */
internal val sponsoredDuplicatesFilter = Fingerprint(
    name = "filter",
    returnType = COLLECTION,
    parameters = listOf(COLLECTION),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/linkedin/android/sensors/CounterMetric;",
            name = "ADS_ADS_CLIENT_UPDATES_FETCH_COUNT",
        ),
        methodCall(
            definingClass = COLLECTION,
            name = "copyWithNewElements",
        ),
    ),
)
