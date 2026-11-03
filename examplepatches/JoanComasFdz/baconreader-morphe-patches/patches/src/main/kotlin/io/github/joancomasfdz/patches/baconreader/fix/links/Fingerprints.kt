// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.links

import app.morphe.patcher.Fingerprint

/** The intent of a link BaconReader opens, from the comments, posts and LinkDispatcher. */
internal object LinkProcessorGetIntentFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/LinkProcessor;",
    name = "getIntent",
    returnType = "Landroid/content/Intent;",
    parameters = listOf(),
)

/** LinkDispatcher's handling of each link it receives, from onCreate and onNewIntent. */
internal object LinkDispatcherProcessingFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/LinkDispatcher;",
    name = "processing",
    returnType = "Z",
    parameters = listOf("Landroid/content/Intent;"),
)

/** The link next to a post's title, which starts LinkProcessor's intent only when it opens the browser. */
internal object ClickableLinkSpanOnClickFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/ClickableLinkSpan;",
    name = "onClick",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
)
