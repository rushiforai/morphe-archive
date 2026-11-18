// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.misc.fixslinks

import app.edbfi.patches.shared.isDeclaredIn
import app.edbfi.patches.shared.uniqueMethod
import app.revanced.patcher.accessFlags
import app.revanced.patcher.custom
import app.revanced.patcher.parameterTypes
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.returnType
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * `LinkHelper` routes every link the app opens, in-app taps and links from other apps alike (`IntentActivity` hands
 * them over). Its fourth parameter is the URL, which it logs after "Opening link: ".
 */
internal fun BytecodePatchContext.linkRouterMethod() = uniqueMethod("the link router", "Link title: ") {
    accessFlags(AccessFlags.PUBLIC, AccessFlags.STATIC)
    returnType("Z")
    parameterTypes(
        "Landroid/content/Context;",
        "[L",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Z",
        "Z",
        "Z",
    )
    custom { isDeclaredIn(this, "LinkHelper.java") }
}
