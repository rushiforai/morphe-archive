/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package me.toidicakhia.patches.terabox.tasks

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Hybrid bridge setup shared by every `DuboxWebView`: enables JavaScript and
 * registers the `dubox` interface used by the remote FE pages.
 */
internal object HybridBridgeFingerprint : Fingerprint(
    definingClass = "Lcom/dubox/drive/business/widget/webview/hybrid/_;",
    name = "c",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(
        "Landroid/app/Activity;",
        "Landroid/webkit/WebView;",
        "Ljava/lang/String;",
    ),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/webkit/WebView;",
            name = "addJavascriptInterface",
        ),
    ),
)
