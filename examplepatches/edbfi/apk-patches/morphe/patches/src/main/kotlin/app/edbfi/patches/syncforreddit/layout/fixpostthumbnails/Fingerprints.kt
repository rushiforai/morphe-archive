// SPDX-License-Identifier: AGPL-3.0-or-later
// Named like every patch's fingerprint file, however many it holds.
@file:Suppress("ktlint:standard:filename")

package app.edbfi.patches.syncforreddit.layout.fixpostthumbnails

import app.edbfi.patches.shared.hasFlags
import app.edbfi.patches.syncforreddit.declaredIn
import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/** `PostThumbnailHelper` picks a post's thumbnail URL from its listing JSON. */
internal object ThumbnailFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Lorg/json/JSONObject;"),
    strings = listOf("thumbnail"),
    custom = declaredIn("PostThumbnailHelper.java") { it.hasFlags(AccessFlags.PUBLIC, AccessFlags.STATIC) },
)
