// SPDX-License-Identifier: AGPL-3.0-or-later
// Named like every patch's fingerprint file, however many it holds.
@file:Suppress("ktlint:standard:filename")

package app.edbfi.patches.syncforreddit.misc.fixtenor

import app.edbfi.patches.syncforreddit.SourceStringsFingerprint

// The app must still load Tenor links' previews in comments and posts through the URL `ImageServer` answers:
// `SpannableTextViewStringBuilder` asks `WebsitePreviewHelper` for it.

/** The Tenor link preview in `SpannableTextViewStringBuilder`. */
internal object TenorPreviewFingerprint : SourceStringsFingerprint("SpannableTextViewStringBuilder.java", "tenor.com")

/** The image server URL in `WebsitePreviewHelper`. */
internal object WebsitePreviewUrlFingerprint :
    SourceStringsFingerprint("WebsitePreviewHelper.java", "https://ap.syncforreddit.com/image?url=")
