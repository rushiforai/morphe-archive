package app.template.patches.nordjyske.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_NORDJYSKE
import app.template.patches.shared.Constants.COMPATIBILITY_FYENS
import app.template.patches.shared.Constants.COMPATIBILITY_STIFTEN
import app.template.patches.shared.Constants.COMPATIBILITY_JYDSKEVESTKYSTEN
import app.template.patches.shared.misc.telemetry.forceFirebaseManifestSwitches

// PugPig Bolt funnels every analytics event through AnalyticsDispatcher, which forwards to the
// configured providers (Firebase, Mixpanel, Facebook, and the publisher's own endpoint). The class
// and its public methods keep their names, so they are the stable anchors.
private const val DISPATCHER = "Lcom/kaldorgroup/pugpigbolt/net/analytics/AnalyticsDispatcher;"

/**
 * Nordjyske is a PugPig Bolt app. Its analytics dispatcher sends every event (screen views, user
 * info, the track* helpers) to Firebase, Mixpanel, Facebook and the publisher's endpoint. Making
 * the three send methods return at once drops all of it at one choke point; the per-feature
 * track* helpers keep running but end in a no-op. The storefront, subscription and push flows are
 * untouched.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics, crash reporting and session collection.",
) {
    compatibleWith(COMPATIBILITY_NORDJYSKE, COMPATIBILITY_FYENS, COMPATIBILITY_STIFTEN, COMPATIBILITY_JYDSKEVESTKYSTEN)

    execute {
        // 1. Firebase Analytics, Crashlytics, Sessions and ad-ID collection off, as the manifest
        // switches would set them but in the bytecode (no resource re-encode, rule 12). The four
        // PugPig apps bundle no Firebase Performance. OneSignal (push) and Firebase Messaging are
        // not touched.
        forceFirebaseManifestSwitches(
            app = "PugPig Bolt",
            analytics = true,
            crashlytics = true,
            sessions = true,
            performance = false,
        )

        // 2. Every analytics send of the dispatcher returns at once.
        val dispatcher = mutableClassDefBy(DISPATCHER)
        val sendMethods = dispatcher.methods.filter {
            it.name in setOf("sendEvent", "setScreen", "setUserInfo") &&
                it.returnType == "V" && it.implementation != null
        }
        val sendEvents = sendMethods.count { it.name == "sendEvent" }
        val setScreens = sendMethods.count { it.name == "setScreen" }
        if (sendEvents < 2 || setScreens < 2) {
            throw PatchException(
                "$DISPATCHER has $sendEvents sendEvent and $setScreens setScreen overloads; " +
                    "expected at least 2 of each",
            )
        }
        sendMethods.forEach { it.returnEarly() }
    }
}
