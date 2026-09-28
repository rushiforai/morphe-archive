package io.github.trivisa_itihasa.uyu.patches.twitch.shared

import app.morphe.patcher.Fingerprint

/** Twitch's Application class. Its name is not obfuscated. */
internal object TwitchApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Ltv/twitch/android/app/consumer/TwitchApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)
