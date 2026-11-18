// SPDX-License-Identifier: AGPL-3.0-or-later
// Named like every patch's fingerprint file, however many it holds.
@file:Suppress("ktlint:standard:filename")

package app.edbfi.patches.syncforreddit.api.fixgalleries

import app.edbfi.patches.syncforreddit.SourceStringsFingerprint

/** The app's gallery request, which must still ask the endpoint the extension answers. */
internal object GalleryRequestFingerprint : SourceStringsFingerprint("OAuthGalleryRequest.java", "https://oauth.reddit.com/api/info.json?id=t3_")
