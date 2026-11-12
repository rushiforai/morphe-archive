package app.mitrosoft.patches.bergfex

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_BERGFEX

private const val APPSFLYER_STARTER = "Lrc0;"
private const val SENTRY_DSN_PROVIDER = "Lb2j;"
private const val AMPLITUDE_CLIENT = "Lco;"
private const val AMPLITUDE_WRAPPER = "Lrn;"
private const val FIREBASE_WRAPPER = "Lol6;"

@Suppress("unused")
val disableTrackersPatch = bytecodePatch(
    name = "Disable trackers",
    description = "Stops AppsFlyer, Amplitude, Sentry, and Firebase Analytics from starting or sending events. " +
        "GPS tracking, push notifications, and feature flags are unaffected.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BERGFEX)

    execute {
        fun method(descriptor: String, name: String) =
            mutableClassDefBy(descriptor).methods.first { it.name == name }

        method(APPSFLYER_STARTER, "e").returnEarly()

        // Null DSN disables the Sentry client.
        method(SENTRY_DSN_PROVIDER, "a").addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        method(AMPLITUDE_CLIENT, "d").returnEarly()
        method(AMPLITUDE_WRAPPER, "a").returnEarly()
        method(AMPLITUDE_WRAPPER, "b").returnEarly()
        method(AMPLITUDE_WRAPPER, "c").returnEarly()

        method(FIREBASE_WRAPPER, "a").returnEarly()
        method(FIREBASE_WRAPPER, "b").returnEarly()
        method(FIREBASE_WRAPPER, "c").returnEarly()
    }
}
