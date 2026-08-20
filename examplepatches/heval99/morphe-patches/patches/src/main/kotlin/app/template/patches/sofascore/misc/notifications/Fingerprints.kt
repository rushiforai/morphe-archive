package app.template.patches.sofascore.misc.notifications

import app.morphe.patcher.Fingerprint

// UTR promotion modal display check
object UtrPromotionModalFingerprint : Fingerprint(
    custom = { method, classDef -> classDef.type.contains("PromotionModal") && method.name.contains("show", ignoreCase = true) }
)

// Marketing notification flag
object IsMarketingNotificationFingerprint : Fingerprint(
    custom = { method, classDef -> method.name.contains("marketing", ignoreCase = true) || method.name.contains("promo", ignoreCase = true) }
)

// Notification settings promo toggle
object NotificationPromoToggleFingerprint : Fingerprint(
    custom = { method, classDef -> classDef.type.contains("NotificationSettings") && method.name.contains("promo", ignoreCase = true) }
)
