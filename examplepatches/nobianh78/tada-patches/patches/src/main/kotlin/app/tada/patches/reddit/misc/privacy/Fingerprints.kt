/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.tada.patches.reddit.misc.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

internal object ShareLinkFormatterFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/Map;"),
    filters = listOf(
        methodCall(smali = $$"Landroid/net/Uri$Builder;->clearQuery()Landroid/net/Uri$Builder;")
    )
)
