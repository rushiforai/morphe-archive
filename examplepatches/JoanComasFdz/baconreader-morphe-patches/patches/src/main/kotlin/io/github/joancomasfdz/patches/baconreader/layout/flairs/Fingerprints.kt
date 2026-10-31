// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.layout.flairs

import app.morphe.patcher.Fingerprint

/** Opens the feed of MainActivity.linksetKey: on start, and when the subreddit, sort or query changes. */
internal object OpenLinksetFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/ui/main/MainActivity;",
    name = "openLinkset",
    returnType = "V",
    parameters = listOf(),
)

/** Adds a page of posts from Reddit to a feed. */
internal object AddToLinksetFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/data/LinksetManager;",
    name = "addToLinkset",
    returnType = "Z",
    parameters = listOf(
        "Lcom/onelouder/baconreader/data/LinksetKey;",
        "Lcom/onelouder/baconreader/reddit/Listing;",
        "I",
        "J",
    ),
)
