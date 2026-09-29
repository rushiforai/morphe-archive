package io.github.bakwudo.uyu.patches.twitch.shared

import app.morphe.patcher.Fingerprint

/** Twitch's Application class. Its name is not obfuscated. */
internal object TwitchApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Ltv/twitch/android/app/consumer/TwitchApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)
