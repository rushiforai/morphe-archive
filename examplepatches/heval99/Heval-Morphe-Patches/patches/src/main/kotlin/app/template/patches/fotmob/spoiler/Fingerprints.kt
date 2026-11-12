package app.template.patches.fotmob.spoiler

import app.morphe.patcher.Fingerprint

/**
 * FotMob's push handler (manifest-named service, Firebase override): every FCM data message,
 * including goal, card and result alerts, enters here before FotMob copies the data map into the
 * Bundle its notification pipeline reads ("m" match id, "lid"/"plid" league ids, "hs"/"as" score).
 */
internal object PushMessageReceivedFingerprint : Fingerprint(
    definingClass = "Lcom/fotmob/android/feature/notification/push/PushMessagingService;",
    name = "onMessageReceived",
    returnType = "V",
    parameters = listOf("Lcom/google/firebase/messaging/RemoteMessage;"),
)
