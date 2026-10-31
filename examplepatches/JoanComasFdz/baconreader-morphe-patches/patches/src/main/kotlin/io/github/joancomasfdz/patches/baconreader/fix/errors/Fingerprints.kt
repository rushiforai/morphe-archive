// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.errors

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

/** The task of every Reddit API request (an anonymous class in RedditApi.request). */
internal object RedditRequestRunTaskFingerprint : Fingerprint(
    name = "runTask",
    filters = listOf(
        string("bittersweet news", StringComparisonType.CONTAINS),
    ),
)
