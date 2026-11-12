package app.template.patches.yousee.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_YOUSEE
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.misc.telemetry.forceFirebaseManifestSwitches

// Push notifications must keep working, so nothing here touches Firebase Messaging, Firebase
// Installations or the app's notification services.

// The Firebase component that registers Google Analytics. The app's own classes never call an
// analytics API, but the component collects automatically once Firebase initialises.
private const val ANALYTICS_REGISTRAR =
    "Lcom/google/firebase/analytics/connector/internal/AnalyticsConnectorRegistrar;"

/**
 * YouSee Play has no ad SDK and its own classes never call an analytics API, but Firebase
 * Analytics, Crashlytics, Performance Monitoring and Sessions are registered as Firebase
 * components and collect automatically. Mixpanel is bundled but referenced only by its own
 * classes; AppsFlyer, Adjust, Branch and Amplitude exist only as strings.
 *
 * The Firebase manifest switches are what stop the SDKs at startup; they are applied in the
 * bytecode, where each SDK reads them, so the resource table is not re-encoded (rule 12). The
 * patch also removes the Google Analytics component from Firebase's component list, so it cannot
 * initialise even if the app starts calling it in a later version. Firebase Messaging and
 * Installations stay untouched.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_YOUSEE)

    execute {
        // Firebase Analytics, Crashlytics, Performance, Sessions and ad-ID collection off, as the
        // manifest switches would set them.
        forceFirebaseManifestSwitches(
            app = "YouSee Play",
            analytics = true,
            crashlytics = true,
            sessions = true,
            performance = true,
        )

        val registrar = mutableClassDefBy(ANALYTICS_REGISTRAR)
        val getComponents = registrar.methods.singleOrNull {
            it.name == "getComponents" && it.parameterTypes.isEmpty() &&
                it.returnType == "Ljava/util/List;" && it.implementation != null
        } ?: throw PatchException("$ANALYTICS_REGISTRAR.getComponents() not found")

        // Registering no components leaves Firebase Analytics uninitialised; everything else
        // (Messaging, Installations) is registered by its own components.
        getComponents.addInstructionsChecked(
            0,
            """
                sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;
                return-object v0
            """,
        )
    }
}
