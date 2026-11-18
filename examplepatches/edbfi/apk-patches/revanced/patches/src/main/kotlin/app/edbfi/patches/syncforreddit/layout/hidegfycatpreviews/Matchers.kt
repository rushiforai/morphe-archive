// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.layout.hidegfycatpreviews

import app.edbfi.patches.shared.isCallTo
import app.edbfi.patches.shared.isDeclaredIn
import app.edbfi.patches.shared.uniqueMethod
import app.revanced.patcher.accessFlags
import app.revanced.patcher.custom
import app.revanced.patcher.extensions.instructions
import app.revanced.patcher.extensions.methodReference
import app.revanced.patcher.parameterTypes
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.returnType
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

/** `LinkTypeHelper`'s check for a Gfycat link: a gfycat.com host other than the bare site. */
internal fun BytecodePatchContext.isGfycatMethod() = uniqueMethod("the Gfycat link check", "https://gfycat.com/") {
    accessFlags(AccessFlags.PUBLIC, AccessFlags.STATIC)
    returnType("Z")
    parameterTypes("Ljava/lang/String;")
    custom { isDeclaredIn(this, "LinkTypeHelper.java") }
}

/** Whether [method] calls [callee]. */
private fun calls(
    method: Method,
    callee: Method,
) = method.implementation?.instructions?.any { instruction -> instruction.methodReference?.let { isCallTo(it, callee) } == true } == true

/**
 * The method of `SyncHtmlToSpannedConverter` that adds a preview after a link in comments and posts. A Gfycat link
 * gets one, loaded from the developer's image server, which can only fail now.
 */
internal fun BytecodePatchContext.linkPreviewMethod(isGfycat: Method) = uniqueMethod("the link preview in SyncHtmlToSpannedConverter", "tenor.com") {
    custom { isDeclaredIn(this, "SyncHtmlToSpannedConverter.java") && calls(this, isGfycat) }
}
