// SPDX-License-Identifier: AGPL-3.0-or-later
// Named like every patch's fingerprint file, however many it holds.
@file:Suppress("ktlint:standard:filename")

package app.edbfi.patches.syncforreddit.misc.fixslinks

import app.edbfi.patches.shared.hasFlags
import app.edbfi.patches.syncforreddit.declaredIn
import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * `LinkHelper` routes every link the app opens, in-app taps and links from other apps alike (`IntentActivity` hands
 * them over). Its fourth parameter is the URL, which it logs after "Opening link: ".
 */
internal object LinkRouterFingerprint : Fingerprint(
    returnType = "Z",
    parameters =
    listOf(
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
    ),
    strings = listOf("Link title: "),
    custom = declaredIn("LinkHelper.java") { it.hasFlags(AccessFlags.PUBLIC, AccessFlags.STATIC) },
)
