package app.template.patches.sofascore.spoiler

import app.morphe.patcher.Fingerprint

// Sofascore's push receiver: FCMListenerService keeps its name (it is a manifest service) and the
// method is the FirebaseMessagingService override, so both names are stable. It parses the data
// key "notification" (JSON) and posts the notification, the widget refresh and the TTS readout.
internal object FcmMessageReceivedFingerprint : Fingerprint(
    definingClass = "Lcom/sofascore/results/firebase/push/FCMListenerService;",
    name = "onMessageReceived",
    returnType = "V",
    parameters = listOf("Lcom/google/firebase/messaging/RemoteMessage;"),
)
