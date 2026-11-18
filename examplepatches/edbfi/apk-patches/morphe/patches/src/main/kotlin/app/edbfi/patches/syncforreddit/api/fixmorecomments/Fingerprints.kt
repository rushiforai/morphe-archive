// SPDX-License-Identifier: AGPL-3.0-or-later
// Named like every patch's fingerprint file, however many it holds.
@file:Suppress("ktlint:standard:filename")

package app.edbfi.patches.syncforreddit.api.fixmorecomments

import app.edbfi.patches.syncforreddit.SourceStringsFingerprint

/** The app's "View more" request, which must still post to the endpoint the extension answers. */
internal object MoreCommentsRequestFingerprint :
    SourceStringsFingerprint("OAuthCommentsMoreRequest.java", "api/morechildren?always_show_media=1&profile_img=true")
