package app.template.patches.yahoosports.betting

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

// The betting image banner controller's CardCtrl data override (12.26.1:
// ui/card/bettingimagebanner/control/a.M2(Object), was BettingImageBannerCtrl.m2(Object) in
// 12.10.3; the controller class is R8-renamed since 12.26.1). It is the only (Object)V method
// with the "placement" key, which it passes to the betting-promo data service to request the
// server bettingPromo banner. The CardCtrl call (the kept card base class) is a second safety
// net: no other (Object)V method holds "placement" today, but a future card would also have to
// be a CardCtrl override to match. 12.26.1 dropped SportsbookPromotionHelper and its
// sponsored-moments promotion, so the server request is now the banner's only source.
internal object BettingImageBannerBindFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf(string("placement", StringComparisonType.CONTAINS)),
    filters = listOf(
        methodCall(definingClass = "Lcom/yahoo/mobile/ysports/common/ui/card/control/CardCtrl;"),
    ),
)
