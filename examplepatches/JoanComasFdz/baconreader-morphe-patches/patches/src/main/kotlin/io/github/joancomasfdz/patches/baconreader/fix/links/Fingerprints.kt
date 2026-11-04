// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.links

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.Opcode

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

/** The intent that opens a post's media, from its thumbnail: LinkProcessor's intent, for a Reddit link. */
internal object LinkProcessorGetBrowserIntentFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/LinkProcessor;",
    name = "getBrowserIntent",
    returnType = "Landroid/content/Intent;",
    parameters = listOf("Landroid/content/Context;", "Lcom/onelouder/baconreader/reddit/Link;"),
)

/** Opens the media of the post shown, from the thumbnail in its header, through LinkProcessor's intent. */
internal object DetailLinkHelperOnOpenFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/adapters/DetailLinkFragment\$DetailLinkHelper;",
    name = "onOpen",
    returnType = "V",
    parameters = listOf("Lcom/onelouder/baconreader/reddit/Link;"),
)

/** The media viewer's lookup of a post it has only the address of, through the redirect Reddit used to send. */
internal object RedditMediaHandlerLookupFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/reddit/RedditMediaHandler\$2;",
    name = "runTask",
    returnType = "Lcom/onelouder/baconreader/reddit/Link;",
    parameters = listOf(),
)

private const val REDDIT_SPANNER_CLASS_DESCRIPTOR = "Lcom/onelouder/baconreader/parser/RedditSpanner;"
private const val ELEMENT_CLASS_DESCRIPTOR = "Lcom/onelouder/baconreader/parser/RedditParser\$Element;"

/** Reads "Open links inside app" for a link in the text of a post, comment or message. */
private fun readInternalBrowser() = fieldAccess(
    opcode = Opcode.IGET_BOOLEAN,
    definingClass = REDDIT_SPANNER_CLASS_DESCRIPTOR,
    name = "internalBrowser",
)

internal object RedditSpannerLinkFingerprint : Fingerprint(
    definingClass = REDDIT_SPANNER_CLASS_DESCRIPTOR,
    name = "appendElementInternal",
    returnType = "I",
    parameters = listOf("Landroid/text/SpannableStringBuilder;", ELEMENT_CLASS_DESCRIPTOR),
    filters = listOf(readInternalBrowser()),
)

/** The same for a relative link, /r/<sub>. */
internal object RedditSpannerRelativeLinkFingerprint : Fingerprint(
    definingClass = REDDIT_SPANNER_CLASS_DESCRIPTOR,
    name = "appendRelativeLink",
    returnType = "I",
    parameters = listOf("Landroid/text/SpannableStringBuilder;", ELEMENT_CLASS_DESCRIPTOR, "Ljava/lang/String;"),
    filters = listOf(readInternalBrowser()),
)
