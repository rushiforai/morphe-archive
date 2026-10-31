package app.kurageno8156lgtm

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object SplashAdFingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/ies/ugc/aweme/commercialize/splash/core/SplashAdServiceImpl;",
    name = "LJIILL",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

object AutoScrollFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/feed/platform/panel/autoscroll/FypAutoScrollServiceImpl;",
    name = "LJIILL",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf()
)

object AutoScrollFeatureGateFingerprint : Fingerprint(
    definingClass = "Lwyb/g1;",
    name = "LIZ",
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("fyp_auto_scroll")
)

object AutoScrollActionFactoryFingerprint : Fingerprint(
    definingClass = "LX/0erI;",
    name = "LJFF",
    returnType = "LX/0YWg;",
    parameters = listOf("LX/0YI3;"),
    strings = listOf("panel_auto_scroll", "auto_scroll")
)
