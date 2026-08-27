package app.template.patches.ozon.notifications

import app.morphe.patcher.Fingerprint

/** Matches the shared Ozon Push SDK handler used by FCM, RuStore Push, and HMS. */
object OzonPushServiceDelegateFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Lru/ozon/push/sdk/external/service/RemoteMessage;",
        "L",
        "Ljava/lang/String;",
    ),
    strings = listOf(
        "OzonPushServiceDelegate",
        "The received push message isn't an Ozon push message.",
        "pw_msg_tag",
    ),
)
