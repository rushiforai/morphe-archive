package app.riky.patches.vn

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

/** PremiumServiceImpl.e() — stable keep-name facade over PremiumManage. */
internal object PremiumServiceIsProFingerprint : Fingerprint(
    definingClass = "Lcom/frontrow/vlog/service/PremiumServiceImpl;",
    name = "e",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

/**
 * PremiumManage.isPro (R8: o50.m.c). Used directly by CreateViewState / draft ads.
 * Matched via FORCE_PRO SharedPreferences key — obfuscated class name changes.
 */
internal object PremiumManageIsProFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("FORCE_PRO"),
)

internal object SetShowProItemFingerprint : Fingerprint(
    definingClass = "Lcom/frontrow/vlog/ui/widget/MainFragmentBottomNavigatorLayout;",
    name = "setShowProItem",
    returnType = "V",
    parameters = listOf("Z"),
)

/** ExportSuccessActivity.onCreate — shows ReviewEvaluateDialog after export. */
internal object ExportReviewDialogFingerprint : Fingerprint(
    definingClass = "Lcom/frontrow/common/ui/export/ExportSuccessActivity;",
    name = "onCreate",
    strings = listOf("ReviewEvaluateDialog"),
)

/**
 * ExportAdSectionConfig ctor — hardcodes guidance tips banner text.
 * Param p5 is showGuidanceBanner (written to field e).
 */
internal object ExportGuidanceBannerFingerprint : Fingerprint(
    strings = listOf("Enhance your videos with simple, inspiring tips"),
    parameters = listOf("Z", "Ljava/lang/String;", "Lnm0/a;", "Lnm0/a;", "Z", "Lnm0/a;"),
)

/** Shared ads host used by Projects / Create / Export banners. */
internal object SetupAdsBeanListFingerprint : Fingerprint(
    definingClass = "Lcom/frontrow/common/widget/ads/BaseAdsLayout;",
    name = "setupAdsBeanList",
    returnType = "V",
    parameters = listOf("Ljava/util/List;"),
)
