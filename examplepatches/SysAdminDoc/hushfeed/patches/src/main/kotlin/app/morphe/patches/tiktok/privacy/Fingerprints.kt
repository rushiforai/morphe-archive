/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.privacy

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object PitayaInitFingerprint : Fingerprint(
    strings = listOf("pitaya_ab_info.json"),
)

internal object PitayaCoreStartFingerprint : Fingerprint(
    strings = listOf("PitayaCore", "start"),
)

internal object WebViewTrackingFingerprint : Fingerprint(
    strings = listOf("addJavascriptInterface"),
    definingClass = "Lcom/bytedance/hybrid/",
)
