// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.layout.fixpostthumbnails

import app.edbfi.patches.shared.isDeclaredIn
import app.edbfi.patches.shared.uniqueMethod
import app.revanced.patcher.accessFlags
import app.revanced.patcher.custom
import app.revanced.patcher.parameterTypes
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.returnType
import com.android.tools.smali.dexlib2.AccessFlags

/** `PostThumbnailHelper` picks a post's thumbnail URL from its listing JSON. */
internal fun BytecodePatchContext.thumbnailMethod() = uniqueMethod("the post thumbnail method", "thumbnail") {
    accessFlags(AccessFlags.PUBLIC, AccessFlags.STATIC)
    returnType("Ljava/lang/String;")
    parameterTypes("Lorg/json/JSONObject;")
    custom { isDeclaredIn(this, "PostThumbnailHelper.java") }
}
