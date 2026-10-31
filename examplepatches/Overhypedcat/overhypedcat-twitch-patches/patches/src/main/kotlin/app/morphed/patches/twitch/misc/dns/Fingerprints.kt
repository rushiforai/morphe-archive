package app.morphed.patches.twitch.misc.dns

import app.morphe.patcher.Fingerprint

/**
 * OkHttp's route selection, where the host name of every connection is looked up. Twitch's build
 * inlines OkHttp's system DNS into it; its error message identifies the method.
 */
object OkHttpRouteLookupFingerprint : Fingerprint(
    strings = listOf("Broken system behaviour for dns lookup of "),
)
