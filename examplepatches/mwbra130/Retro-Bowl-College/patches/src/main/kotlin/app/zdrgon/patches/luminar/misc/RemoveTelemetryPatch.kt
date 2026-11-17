package app.zdrgon.patches.luminar.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.zdrgon.patches.luminar.shared.Constants.COMPATIBILITY_LUMINAR
import java.util.logging.Logger
import org.w3c.dom.Element

/**
 * Luminar — Remove telemetry.
 *
 * Census (verified 2026-11-16 against the exact 4.6 base APK;
 * full detail in Fingerprints.kt). Nearly everything is wired
 * from LuminarApplication.onCreate. Per component:
 *
 * 1. AppsFlyer — PINNED AT THE SDK IMPLEMENTATION.
 *    AppsFlyerLib is abstract; the concrete implementation
 *    (Lcom/appsflyer/internal/AFa1tSDK;) holds the bodies. Its
 *    init is pinned to return the receiver and both start
 *    overloads to return immediately, so the SDK never
 *    initializes, never starts, and its event sends, uninstall
 *    token updates and launcher-data collection never run.
 *
 * 2. Skylum first-party stats — PINNED AT THE SENDERS.
 *    Lw29; posts usage events, batch events, AppsFlyer
 *    attribution, hardware info and survey votes to
 *    stats-api.skylum.com from its methods a/b/c/d — the only
 *    callers of the shared static sender Lw29;->e. All four are
 *    pinned to return Unit immediately; stats-api is never
 *    contacted. (Events still stage in the local Room DB; with
 *    no sender they go nowhere.) This reporting is not on the
 *    entitlement path.
 *
 * 3. TikTok Business SDK — PINNED AT ITS ENTRY POINTS.
 *    onCreate builds a TTConfig (with automatic IAP event
 *    tracking enabled) and calls initializeSdk + startTrack.
 *    Both initializeSdk overloads and startTrack are pinned to
 *    return immediately, so the SDK never initializes: no GAID
 *    collection, no install-referrer read, no IAP tracking.
 *
 * 4. Firebase Analytics / Crashlytics / Performance and
 *    Sentry — KILLED IN THE MANIFEST (inline resource patch in
 *    dependsOn below, so the Manager lists exactly one
 *    "Remove telemetry" entry). The three Firebase collection
 *    flags are set to false (none existed — collection defaulted
 *    on; this build's FirebaseAnalytics class has no logEvent
 *    method to pin, the manifest flag is the kill). Sentry's
 *    io.sentry.dsn meta-data is removed and its three auto-init
 *    providers (Init, NdkPreload, Performance) are disabled, so
 *    Sentry never starts — including its native crash handler.
 *    Missing manifest targets are a hard failure: a build that
 *    changed the manifest must not silently ship with the
 *    reporting still enabled.
 *
 * Deliberately left alone, and why:
 * - Adapty, Superwall, Play Billing: the entitlement path
 *   itself (see "Enable Lifetime").
 * - Firebase core / FCM / Remote Config: push messaging and
 *   config delivery are app function, not reporting.
 * - Skylum account / storage APIs (auth.macphun.com,
 *   storage.skylum.com): sign-in and the portfolio are the app.
 * - Amplitude: this build contains no Amplitude event API at
 *   all — the SDK's public class and every logEvent method are
 *   absent from both dexes. The only traces are two internal
 *   compose helper classes and the Amplitude device/session ID
 *   strings the analytics router forwards to AppsFlyer, which
 *   is dead after component 1. There is nothing to pin.
 * - Iterable: Skylum's email/push channel. Its startup init is
 *   R8-inlined into LuminarApplication.onCreate across ~50
 *   instructions with monitor and exception-handler structure;
 *   there is no init call or entry method left to cut or pin
 *   without rewriting the Application's onCreate, so it stays.
 */
@Suppress("unused")
val removeTelemetryPatch = bytecodePatch(
    name = "Remove telemetry",
    description = "Stops the app reporting usage: AppsFlyer and the TikTok Business SDK never initialize, Skylum's own stats sender (stats-api.skylum.com) is disabled, Firebase Analytics/Crashlytics/Performance collection is turned off, and Sentry is removed. Editing, purchases and sign-in are unaffected. Luminar 4.6 only.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LUMINAR)

    // The manifest half of this patch, defined INLINE inside
    // dependsOn() so PatchLoader never discovers it as a separate
    // top-level entry and the Manager shows exactly one
    // "Remove telemetry" patch (same one-entry pattern as the
    // App Finder set).
    dependsOn(
        resourcePatch(
            name = "Remove telemetry (manifest)",
            description = "Turns off Firebase Analytics/Crashlytics/Performance collection and removes Sentry in the manifest. Part of 'Remove telemetry'; the two are applied together.",
            default = true,
        ) {
            compatibleWith(COMPATIBILITY_LUMINAR)

            execute {
                val logger = Logger.getLogger(this::class.java.name)

                document("AndroidManifest.xml").use { doc ->
                    val applications = doc.getElementsByTagName("application")
                    if (applications.length != 1) {
                        throw PatchException(
                            "Luminar telemetry: expected exactly one <application> element, " +
                                "found ${applications.length}."
                        )
                    }
                    val app = applications.item(0) as Element

                    // Firebase collection flags: add or correct all
                    // three under <application>.
                    val firebaseFlags = listOf(
                        "firebase_analytics_collection_enabled",
                        "firebase_crashlytics_collection_enabled",
                        "firebase_performance_collection_enabled"
                    )
                    val metaData = app.getElementsByTagName("meta-data")
                    val byName = HashMap<String, Element>()
                    for (i in 0 until metaData.length) {
                        val el = metaData.item(i) as Element
                        byName[el.getAttribute("android:name")] = el
                    }
                    for (flag in firebaseFlags) {
                        val existing = byName[flag]
                        if (existing != null) {
                            existing.setAttribute("android:value", "false")
                        } else {
                            val el = doc.createElement("meta-data")
                            el.setAttribute("android:name", flag)
                            el.setAttribute("android:value", "false")
                            app.appendChild(el)
                        }
                    }
                    logger.info("Luminar telemetry: Firebase Analytics/Crashlytics/Performance collection disabled in the manifest.")

                    // Sentry: the DSN meta-data goes away entirely.
                    val dsn = byName["io.sentry.dsn"]
                        ?: throw PatchException(
                            "Luminar telemetry: io.sentry.dsn meta-data not found in the " +
                                "manifest; refusing to ship with Sentry possibly enabled."
                        )
                    dsn.parentNode.removeChild(dsn)
                    logger.info("Luminar telemetry: Sentry DSN removed from the manifest.")

                    // Sentry: its three auto-init providers are
                    // disabled so the SDK (and its NDK handler)
                    // never starts.
                    val sentryProviders = setOf(
                        "io.sentry.android.core.SentryInitProvider",
                        "io.sentry.android.core.SentryPerformanceProvider",
                        "io.sentry.ndk.SentryNdkPreloadProvider"
                    )
                    var disabled = 0
                    val providers = doc.getElementsByTagName("provider")
                    for (i in 0 until providers.length) {
                        val el = providers.item(i) as Element
                        if (el.getAttribute("android:name") in sentryProviders) {
                            el.setAttribute("android:enabled", "false")
                            disabled++
                        }
                    }
                    if (disabled != sentryProviders.size) {
                        throw PatchException(
                            "Luminar telemetry: disabled $disabled of ${sentryProviders.size} " +
                                "Sentry providers in the manifest; refusing to ship with " +
                                "Sentry partly enabled."
                        )
                    }
                    logger.info("Luminar telemetry: all ${sentryProviders.size} Sentry providers disabled in the manifest.")
                }
            }
        }
    )

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        // 1. AppsFlyer never initializes and never starts.
        AppsFlyerInitFingerprint.method.addInstructions(0, "return-object p0")
        logger.info("Luminar telemetry: AppsFlyer init pinned (returns the receiver, SDK stays uninitialized).")

        AppsFlyerStartFingerprint.method.addInstructions(0, "return-void")
        AppsFlyerStartListenerFingerprint.method.addInstructions(0, "return-void")
        logger.info("Luminar telemetry: AppsFlyer start overloads pinned (never starts).")

        // 2. Skylum's stats senders return Unit immediately.
        val returnUnit =
            """
                sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
                return-object v0
            """.trimIndent()

        StatsSenderAFingerprint.method.addInstructions(0, returnUnit)
        StatsSenderBFingerprint.method.addInstructions(0, returnUnit)
        StatsSenderCFingerprint.method.addInstructions(0, returnUnit)
        StatsSenderDFingerprint.method.addInstructions(0, returnUnit)
        logger.info("Luminar telemetry: Lw29; stats senders a/b/c/d pinned (stats-api.skylum.com never contacted).")

        // 3. TikTok Business SDK never initializes.
        TikTokInitializeSdkFingerprint.method.addInstructions(0, "return-void")
        TikTokInitializeSdkCallbackFingerprint.method.addInstructions(0, "return-void")
        TikTokStartTrackFingerprint.method.addInstructions(0, "return-void")
        logger.info("Luminar telemetry: TikTok Business SDK initializeSdk/startTrack pinned (never initializes).")
    }
}
