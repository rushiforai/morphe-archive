// SPDX-License-Identifier: AGPL-3.0-or-later
// Named like every patch's fingerprint file, however many it holds.
@file:Suppress("ktlint:standard:filename")

package app.edbfi.patches.rifisfun.layout.fixmarkdownlinks

import app.morphe.patcher.Fingerprint

/**
 * Every body the app shows (comments, posts, messages, wikis) goes from Reddit's HTML to text through one method,
 * which parses the HTML with TagSoup. R8 renamed it and its second parameter, a class of the app's, so this matches
 * on the parser's class name and the error it logs.
 */
internal object ParseHtmlFingerprint : Fingerprint(
    isStatic = true,
    returnType = "Ljava/lang/String;",
    strings = listOf("org.ccil.cowan.tagsoup.Parser", "Error parsing HTML"),
    custom = { method, _ -> method.parameterTypes.size == 2 && method.parameterTypes[0].toString() == "Ljava/lang/String;" },
)
