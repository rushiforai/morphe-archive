// SPDX-License-Identifier: AGPL-3.0-or-later
// Named like every patch's fingerprint file, however many it holds.
@file:Suppress("ktlint:standard:filename")

package app.edbfi.patches.syncforreddit.layout.hidegfycatpreviews

import app.edbfi.patches.shared.hasFlags
import app.edbfi.patches.shared.isCallTo
import app.edbfi.patches.syncforreddit.declaredIn
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** `LinkTypeHelper`'s check for a Gfycat link: a gfycat.com host other than the bare site. */
internal object IsGfycatFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("https://gfycat.com/"),
    custom = declaredIn("LinkTypeHelper.java") { it.hasFlags(AccessFlags.PUBLIC, AccessFlags.STATIC) },
)

/** Whether [method] calls [callee]. */
private fun calls(
    method: Method,
    callee: MethodReference,
) = method.implementation?.instructions?.any { isCallTo(it.getReference<MethodReference>(), callee) } == true

/**
 * The method of `SyncHtmlToSpannedConverter` that adds a preview after a link in comments and posts. A Gfycat link
 * gets one, loaded from the developer's image server, which can only fail now. It calls [isGfycat].
 */
internal class LinkPreviewFingerprint(isGfycat: MethodReference) :
    Fingerprint(
        strings = listOf("tenor.com"),
        custom = declaredIn("SyncHtmlToSpannedConverter.java") { calls(it, isGfycat) },
    )
