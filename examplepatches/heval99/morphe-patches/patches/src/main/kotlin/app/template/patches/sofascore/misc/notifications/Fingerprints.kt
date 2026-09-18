package app.template.patches.sofascore.misc.notifications

import app.morphe.patcher.Fingerprint

// The promo bottom sheets are created by call sites buried in huge shared R8-synthetic
// lambdas (svf.invoke) that also drive unrelated UI, so they cannot be blocked at the
// caller. onViewCreated is a Fragment lifecycle override - R8 must keep the name - and
// is the first callback that can dismiss the dialog.
object PromotionModalFingerprint : Fingerprint(
    definingClass = "Lcom/sofascore/results/event/details/view/promotion/PromotionModal;",
    name = "onViewCreated",
)

object TennisPromoSheetFingerprint : Fingerprint(
    definingClass = "Lcom/sofascore/results/event/aiInsights/SofascoreAnalystTennisPromoBottomSheet;",
    name = "onViewCreated",
)
