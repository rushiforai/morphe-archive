// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.rifisfun.layout.fixmarkdownlinks

import app.edbfi.patches.shared.uniqueMethod
import app.revanced.patcher.accessFlags
import app.revanced.patcher.custom
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.returnType
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Every body the app shows (comments, posts, messages, wikis) goes from Reddit's HTML to text through one method,
 * which parses the HTML with TagSoup. R8 renamed it and its second parameter, a class of the app's, so this matches
 * on the parser's class name and the error it logs.
 */
internal fun BytecodePatchContext.parseHtmlMethod() = uniqueMethod("the HTML parse method", "org.ccil.cowan.tagsoup.Parser", "Error parsing HTML") {
    accessFlags(AccessFlags.STATIC)
    returnType("Ljava/lang/String;")
    custom { parameterTypes.size == 2 && parameterTypes[0].toString() == "Ljava/lang/String;" }
}
