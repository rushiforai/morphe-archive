package app.zdrgon.patches.moises.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.zdrgon.patches.moises.shared.Constants.COMPATIBILITY_MOISES
import java.util.logging.Logger
import org.w3c.dom.Element

/**
 * Moises — Remove telemetry.
 *
 * Census (verified 2026-11-16 against the exact 2.141.0 XAPK;
 * full table in Fingerprints.kt and the workdir RECON.md).
 * Per component:
 *
 * 1. Singular (install attribution + event reporting) — PINNED
 *    AT THE SDK. Singular is the attribution SDK the app
 *    actually drives: defpackage/w1g builds a SingularConfig
 *    (with an SDID accessor — Singular's own device ID) and
 *    calls Singular.init, and defpackage/sw dispatches its
 *    events and user-ID calls. Both init overloads are pinned
 *    to return false, so the SDK never starts: no install-
 *    referrer read, no SDID, no session or event upload. The
 *    event entry points (event x3, eventJSON) are pinned to
 *    return false and the user-ID setters to return immediately
 *    as defense in depth — with init refused they would no-op
 *    anyway, and now they cannot send even if some other path
 *    started the SDK.
 *
 * 2. Firebase Analytics / Crashlytics — KILLED IN THE MANIFEST
 *    (inline resource patch in dependsOn below, so the Manager
 *    lists exactly one "Remove telemetry" entry). This build's
 *    FirebaseAnalytics exposes no logEvent surface to pin (the
 *    Luminar situation), so the vendor collection flags are
 *    used: firebase_analytics_collection_enabled and
 *    firebase_crashlytics_collection_enabled are added or
 *    corrected to false under <application>. A manifest that
 *    does not parse to exactly one <application> element is a
 *    hard failure rather than a silent ship.
 *
 * Deliberately left alone, and why:
 * - AppsFlyer and PostHog: both SDKs are in the dexes (262 /
 *   118 classes), but neither public entry class (AppsFlyerLib,
 *   PostHog) is defined in any dex — they were consumed with
 *   their public APIs renamed — and no SDK capture call sites
 *   exist in app code. There is no verifiable funnel to pin;
 *   shipping a guessed fingerprint would be worse than the
 *   documented residual. (The app-facing attribution path,
 *   Singular, is cut above.)
 * - RudderStack / Segment: endpoint and name strings only, zero
 *   SDK classes in the dexes — nothing present to cut.
 * - Customer.io: the app's push / in-app messaging channel —
 *   app function, not reporting.
 * - Facebook SDK: present for login/share; its GraphRequest
 *   surface is the social feature, not a reporting funnel we
 *   can sever without breaking sign-in.
 * - Chucker: an on-device HTTP inspector (local storage, no
 *   upload endpoint) — a stock-build privacy smell, not
 *   telemetry exfiltration.
 * - api.moises.ai, RevenueCat / Play Billing, FCM: account,
 *   separation jobs, downloads and push — the app's function.
 *   The credit fields on the User object are entitlement state,
 *   not usage reporting.
 */
@Suppress("unused")
val removeTelemetryPatch = bytecodePatch(
    name = "Remove telemetry",
    description = "Stops the app reporting usage: the Singular attribution SDK never initializes and its events are refused, and Firebase Analytics/Crashlytics collection is turned off in the manifest. Separation jobs, account, purchases and push are unaffected.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MOISES)

    // The manifest half of this patch, defined INLINE inside
    // dependsOn() so PatchLoader never discovers it as a separate
    // top-level entry and the Manager shows exactly one
    // "Remove telemetry" patch (same one-entry pattern as the
    // App Finder and Luminar sets).
    dependsOn(
        resourcePatch(
            name = "Remove telemetry (manifest)",
            description = "Turns off Firebase Analytics/Crashlytics collection in the manifest. Part of 'Remove telemetry'; the two are applied together.",
            default = true,
        ) {
            compatibleWith(COMPATIBILITY_MOISES)

            execute {
                val logger = Logger.getLogger(this::class.java.name)

                document("AndroidManifest.xml").use { doc ->
                    val applications = doc.getElementsByTagName("application")
                    if (applications.length != 1) {
                        throw PatchException(
                            "Moises telemetry: expected exactly one <application> element, " +
                                "found ${applications.length}."
                        )
                    }
                    val app = applications.item(0) as Element

                    // Firebase collection flags: add or correct
                    // both under <application>.
                    val firebaseFlags = listOf(
                        "firebase_analytics_collection_enabled",
                        "firebase_crashlytics_collection_enabled"
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
                    logger.info("Moises telemetry: Firebase Analytics/Crashlytics collection disabled in the manifest.")
                }
            }
        }
    )

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        // 1. Singular never initializes: both init overloads
        // refuse, so the SDK never starts.
        val returnFalse =
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent()

        SingularInitConfigFingerprint.method.addInstructions(0, returnFalse)
        SingularInitKeysFingerprint.method.addInstructions(0, returnFalse)
        logger.info("Moises telemetry: Singular init pinned to false (SDK never starts).")

        // 2. Singular's event and identity entry points refuse
        // as well, in case any other path starts the SDK.
        SingularEventFingerprint.method.addInstructions(0, returnFalse)
        SingularEventNamedFingerprint.method.addInstructions(0, returnFalse)
        SingularEventVarargsFingerprint.method.addInstructions(0, returnFalse)
        SingularEventJsonFingerprint.method.addInstructions(0, returnFalse)
        SingularSetCustomUserIdFingerprint.method.addInstructions(0, "return-void")
        SingularUnsetCustomUserIdFingerprint.method.addInstructions(0, "return-void")
        logger.info("Moises telemetry: Singular event/identity entry points pinned (events refused, user ID never set).")
    }
}
