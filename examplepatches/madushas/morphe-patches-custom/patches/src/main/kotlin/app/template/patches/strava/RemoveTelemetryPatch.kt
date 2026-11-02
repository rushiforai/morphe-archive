package app.template.patches.strava

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.STRAVA_COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Element

// ─────────────────────────────────────────────────────────────────────────────
// Telemetry removal (P2e, 2026-10-23). User decisions: keep FCM push, strip
// everything else telemetry-shaped. Staged: this v1 kills the third-party
// SDKs that are SAFE by construction (verified in smali):
//
//   io.sentry    — SentryInitProvider + SentryPerformanceProvider removed from
//                  the manifest. Sentry is designed to no-op without init:
//                  StravaApplication's direct performance hook
//                  (io/sentry/android/core/performance/f.g()) starts with an
//                  iget-boolean guard and the util holder returns the empty
//                  default state, so every Sentry.* call site is inert.
//   io.embrace   — Embrace.start(Context) → return-void. The gradle-plugin
//                  injected hooks (OnClickBytecodeEntrypoint etc.) null-guard
//                  on the runtime delegate (tq9.b) and no-op when start never
//                  ran. AutoSdkInitializationBytecodeEntrypoint only calls
//                  start(), so it becomes inert too.
//   facebook     — FacebookInitProvider + 2 token receivers removed (no
//                  auto-init). AppEventsLogger.newLogger just constructs the
//                  object (no SDK init), and all logEvent/logPurchase/
//                  logPushNotificationOpen/logProductItem overloads are
//                  no-oped so no event ever flows even if the SDK wakes.
//                  StravaApplication's setLegacyTokenUpgradeSupported is a
//                  plain field set — safe.
//   firebase     — analytics disabled via the OFFICIAL switch (meta-data
//                  firebase_analytics_collection_enabled=false) so FCM push
//                  (FirebaseInitProvider + FirebaseMessagingService + IID
//                  receiver) keeps working.
//
// v2 additions (2026-10-23, recon in strava_patch/recon/p2e-telemetry-senders.md):
//   gms ads id   — AdvertisingIdClient.getAdvertisingIdInfo → Info("",
//                  limitAdTracking=true). Branch 486.9 is ALIVE (share deep
//                  links + SplashActivity branchInitializer) and fetches
//                  Google/Huawei/Amazon ad ids via io.branch.coroutines.
//                  AdvertisingIdsKt; Firebase measurement has its own path.
//                  One choke point empties the GAID for every consumer while
//                  keeping Branch link creation working.
//   manifest     — drop ACCESS_ADSERVICES_AD_ID + ACCESS_ADSERVICES_ATTRIBUTION
//                  (Privacy-Sandbox ad-id grants; unused once the GAID is
//                  empty).
//
// Kotlin top-level properties initialize in DECLARATION ORDER — the
// sub-patch val must be declared BEFORE the main patch that depends on it
// (a forward reference yields null at bundle-scan time and morphe-desktop
// NPEs in Patch.getDependencies()).
//
// Deliberately NOT touched (v1 + v2):
//   io.branch           — share deep-link builder (caliber.app.link/strava);
//                         killing it breaks a user-facing feature. The GAID
//                         emptying above strips its ad-id telemetry while
//                         link creation keeps working.
//   com.strava.analytics — first-party pipeline (Room AnalyticsCacheDatabase
//                         + deeply obfuscated sender + experiment/remote-config
//                         system). Ripping it blind risks feature-gate breakage
//                         (LoggedOutExperiment drives real behavior). Accepted
//                         residual — see recon doc §2.
// ─────────────────────────────────────────────────────────────────────────────

internal val removeTelemetryManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement
            val application = doc.getElementsByTagName("application").item(0) as Element

            // Third-party auto-init components to remove entirely.
            val removeComponents = setOf(
                "io.sentry.android.core.SentryInitProvider",
                "io.sentry.android.core.SentryPerformanceProvider",
                "com.facebook.internal.FacebookInitProvider",
                "com.facebook.CurrentAccessTokenExpirationBroadcastReceiver",
                "com.facebook.AuthenticationTokenManager\$CurrentAuthenticationTokenChangedBroadcastReceiver",
            )

            // Ad-id permissions to drop (Privacy Sandbox; GAID emptied in
            // bytecode — see getAdvertisingIdInfo no-op).
            val removePermissions = setOf(
                "android.permission.ACCESS_ADSERVICES_AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
            )

            // Iterate snapshots — removing nodes while walking a live NodeList
            // skips nodes. NOTE: repo convention for apktool-decoded manifests —
            // prefixed attribute access ("android:name"), NOT getAttributeNS.

            var removedComponents = 0
            val appChildren = (0 until application.childNodes.length)
                .map { application.childNodes.item(it) }
                .filterIsInstance<Element>()
            for (child in appChildren) {
                if (child.getAttribute("android:name") in removeComponents) {
                    application.removeChild(child)
                    removedComponents++
                }
            }

            var removedPermissions = 0
            val manifestChildren = (0 until manifest.childNodes.length)
                .map { manifest.childNodes.item(it) }
                .filterIsInstance<Element>()
            for (child in manifestChildren) {
                if (child.tagName == "uses-permission" &&
                    child.getAttribute("android:name") in removePermissions
                ) {
                    manifest.removeChild(child)
                    removedPermissions++
                }
            }

            // Official Firebase switch: analytics off, messaging (FCM) stays on.
            val analyticsOff = doc.createElement("meta-data")
            analyticsOff.setAttribute("android:name", "firebase_analytics_collection_enabled")
            analyticsOff.setAttribute("android:value", "false")
            application.appendChild(analyticsOff)

            if (removedComponents != removeComponents.size) {
                throw PatchException(
                    "Manifest telemetry removal: expected ${removeComponents.size} components, removed $removedComponents — " +
                        "manifest layout changed, re-audit before shipping.",
                )
            }
            println(
                "Remove telemetry: removed $removedComponents components, " +
                    "$removedPermissions ad permissions + firebase_analytics_collection_enabled=false",
            )
        }
    }
}

@Suppress("unused")
val removeTelemetryPatch = bytecodePatch(
    name = "Remove telemetry",
    description = "Strips Sentry, Embrace and Facebook analytics, disables Firebase analytics, and empties the advertising ID (push notifications keep working).",
    default = true,
) {
    compatibleWith(STRAVA_COMPATIBILITY)

    dependsOn(removeTelemetryManifestPatch)

    execute {
        // ── Embrace: never start ──────────────────────────────────────────
        mutableClassDefBy("Lio/embrace/android/embracesdk/Embrace;")
            .methods
            .first {
                it.name == "start" &&
                    it.returnType == "V" &&
                    it.parameters.size == 1 &&
                    it.parameters[0].type == "Landroid/content/Context;"
            }
            .apply {
                clearBody()
                // instance method (p0=this, p1=context) — return-void only
                addInstructions(0, "return-void")
            }

        // ── Facebook AppEvents: never log ─────────────────────────────────
        // All log* overloads are instance methods returning V. newLogger only
        // constructs the object, so a logger may exist but never emits.
        mutableClassDefBy("Lcom/facebook/appevents/AppEventsLogger;")
            .methods
            .filter { it.name.startsWith("log") && it.returnType == "V" }
            .forEach { m ->
                m.apply {
                    clearBody()
                    addInstructions(0, "return-void")
                }
            }

        // ── GAID: never provide a real advertising id (v2) ────────────────
        // One choke point covers Branch (SplashActivity → AdvertisingIdsKt
        // fetchGoogleAdId/fetchHuaweiAdId) AND Firebase measurement. Callers
        // consume the Info object normally — they just see an empty id.
        mutableClassDefBy(
            "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;",
        )
            .methods
            .first {
                it.name == "getAdvertisingIdInfo" &&
                    it.parameters.size == 1 &&
                    it.parameters[0].type == "Landroid/content/Context;"
            }
            .apply {
                clearBody()
                addInstructions(
                    0,
                    """
                        new-instance v0, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;
                        const-string v1, ""
                        const/4 v2, 0x1
                        invoke-direct {v0, v1, v2}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient${'$'}Info;-><init>(Ljava/lang/String;Z)V
                        return-object v0
                    """.trimIndent(),
                )
            }

        // ── Google Analytics (GA4 measurement engine) ─────────────────────
        // AppMeasurement.logEventInternal is the single funnel every GA
        // event goes through (FirebaseAnalytics facade included). Events
        // never register → the measurement worker has nothing to upload.
        mutableClassDefBy(
            "Lcom/google/android/gms/measurement/AppMeasurement;",
        )
            .methods
            .first {
                it.name == "logEventInternal" &&
                    it.returnType == "V" &&
                    it.parameters.size == 3
            }
            .apply {
                clearBody()
                addInstructions(0, "return-void")
            }

        // ── First-party Strava analytics gateway ──────────────────────────
        // AnalyticsEventEntry Room DAO (wy0) insert c(Lnz0;)V — events are
        // never persisted, so the periodic flush ships an empty queue. The
        // Room callers just continue (insert is fire-and-forget).
        mutableClassDefBy("Lwy0;")
            .methods
            .first {
                it.name == "c" && it.returnType == "V" &&
                    it.parameters.size == 1 && it.parameters[0].type == "Lnz0;"
            }
            .apply {
                clearBody()
                addInstructions(0, "return-void")
            }

        // ── Mapbox telemetry (events.mapbox.com) ──────────────────────────
        // MapboxOkHttpService gates every send through allowAlways(url)
        // (private, .locals 1 → v0 free). Prefix-check for the telemetry
        // host and deny: needToPauseRequest = !allowAlways → telemetry
        // requests are queued forever and never drained, even in foreground.
        // Map tiles (api.mapbox.com) keep flowing through the normal
        // allowlist path.
        mutableClassDefBy(
            "Lcom/mapbox/common/module/okhttp/MapboxOkHttpService;",
        )
            .methods
            .first {
                it.name == "allowAlways" && it.returnType == "Z" &&
                    it.parameters.size == 1 && it.parameters[0].type == "Ljava/lang/String;"
            }
            .apply {
                addInstructions(
                    0,
                    """
                        const-string v0, "events.mapbox.com"
                        invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                        move-result v0
                        if-eqz v0, :mapbox_allow
                        const/4 p0, 0x0
                        return p0
                        :mapbox_allow
                        nop
                    """.trimIndent(),
                )
            }
    }
}
