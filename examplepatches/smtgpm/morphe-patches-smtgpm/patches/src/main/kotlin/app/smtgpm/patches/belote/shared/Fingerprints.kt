/*
 * Copyright 2026 smtgpm.
 * https://github.com/smtgpm/morphe-patches-smtgpm
 *
 * See the included NOTICE file for GPLv3 Section 7 terms.
 */

package app.smtgpm.patches.belote.shared

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object LoginWithAmazonLogoutFingerprint : Fingerprint(
    definingClass = "Lcom/gameduell/mobile/belote/plugin/LoginWithAmazon;",
    name = "logout",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Lcom/gameduell/mobile/belote/plugin/LogoutListener;"),
)
