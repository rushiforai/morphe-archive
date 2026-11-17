package app.zdrgon.patches.appfinder.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.zdrgon.patches.appfinder.shared.Constants.COMPATIBILITY_APP_FINDER
import java.util.logging.Logger
import org.w3c.dom.Element

/**
 * App Finder — Remove telemetry.
 *
 * What telemetry this app actually has (full census in
 * Fingerprints.kt and in the workdir RECON.md, verified 2026-11-16
 * against the exact 1.5.1 XAPK): no third-party analytics, crash or
 * ads SDK at all, no advertising ID, no install referrer, no device
 * ID reads. The reporting surface is first-party, to the developer's
 * backend (the same hosts the search feature uses), plus one piece
 * of inert Google upload plumbing. This patch neutralizes all of
 * it, per component:
 *
 * 1. Persistent install ID — PINNED AT THE READER.
 *    The backend assigns a per-install ID (`iid`) in its /inf
 *    startup exchange; the app stores it on the user-state object
 *    and attaches it to every search query and every later /inf
 *    post, always by reading UU.getIid(). The iid field has no
 *    other reader (dex census: field touched only inside UU,
 *    getter called only by the payload classes Qn/Qq/Qu). This
 *    patch pins getIid() to return "", so the ID — even though the
 *    server may still hand one out and the app still stores it —
 *    can never be read back out: no outbound payload can carry it,
 *    and the backend cannot correlate an install across requests.
 *
 * 2. Settings-diff usage log — PINNED AT THE SOURCE.
 *    UU.log(Sli, boolean) builds a "field=value" string of every
 *    user-state change since the previous search and the search
 *    builder attaches it to every query (Qn.uu). The full query
 *    state already travels in the same request, so the diff serves
 *    no search function; it is a usage report. This patch pins
 *    log() to return "", leaving uu as the caller's bare " |"
 *    prefix. log()'s only other caller is its own Kotlin
 *    log$default bridge; the snapshot refresh inside log() is
 *    consumed only by log() itself, so pinning it starves nothing.
 *
 * 3. Google datatransport upload plumbing — DISABLED IN THE
 *    MANIFEST (inline resource patch in dependsOn below, so the
 *    Manager lists exactly one "Remove telemetry" entry).
 *    The app ships the datatransport library with its CCT backend
 *    (a transitive Firebase-encoders dependency), but nothing in
 *    the app ever initializes TransportRuntime or produces an
 *    event for it — it is dead plumbing, and its three manifest
 *    components are the only background phone-home machinery
 *    declared. The patch sets android:enabled="false" on all
 *    three (TransportBackendDiscovery, JobInfoSchedulerService,
 *    AlarmManagerSchedulerBroadcastReceiver) so the system can
 *    never start them. A missing component is a hard failure: a
 *    build that changed the manifest must not silently ship with
 *    the plumbing still enabled.
 *
 * Deliberately left alone, and why:
 * - The /inf startup exchange itself, and the ipwho.is geo-IP
 *   lookup that feeds it. Dual-use: on a fresh install the /inf
 *   response handler is what sets the main content view (stubbing
 *   the exchange risks hanging a clean install on its waiting
 *   view), and the country it detects drives core features
 *   (country selection, other-country apps). The exchange stays,
 *   but after this patch its payload carries iid="" like
 *   everything else.
 * - The search backend traffic (afapi.org / intcon.appquery.org
 *   search and info endpoints): that IS the app's function.
 * - RsltsKt.idf (Qn.i): not an identifier — a session-scoped
 *   category-context token rebuilt from the user's category picks
 *   each time the category screen opens and overwritten by search
 *   responses. Functional request context, left as is.
 * - The play-services location library in the dex: transitive
 *   code with zero references from app code and no location
 *   permission in the manifest. Unreachable; nothing to patch.
 *
 * Composes with "Enable Professional": that patch pins UU.getF()
 * in the same class; the methods and mechanisms are disjoint.
 */
@Suppress("unused")
val removeTelemetryPatch = bytecodePatch(
    name = "Remove telemetry",
    description = "Stops the app reporting usage to the developer's backend: the persistent install ID is never attached to searches, the settings-change log built into every search query is emptied, and the unused Google datatransport upload services are disabled. Search and all other features are unaffected.",
    default = true
) {
    compatibleWith(COMPATIBILITY_APP_FINDER)

    // The manifest half of this patch, defined INLINE inside
    // dependsOn() so PatchLoader never discovers it as a separate
    // top-level entry and the Manager shows exactly one
    // "Remove telemetry" patch (same one-entry pattern as the
    // DroidCam and Crossy Road sets).
    dependsOn(
        resourcePatch(
            name = "Remove telemetry (manifest)",
            description = "Disables the unused Google datatransport upload components in the manifest. Part of 'Remove telemetry'; the two are applied together.",
            default = true,
        ) {
            compatibleWith(COMPATIBILITY_APP_FINDER)

            execute {
                val logger = Logger.getLogger(this::class.java.name)

                val targets = setOf(
                    "com.google.android.datatransport.runtime.backends.TransportBackendDiscovery",
                    "com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService",
                    "com.google.android.datatransport.runtime.scheduling.jobscheduling.AlarmManagerSchedulerBroadcastReceiver"
                )

                document("AndroidManifest.xml").use { doc ->
                    var disabled = 0
                    for (tag in listOf("service", "receiver", "activity", "provider")) {
                        val elements = doc.getElementsByTagName(tag)
                        for (i in 0 until elements.length) {
                            val element = elements.item(i) as Element
                            if (element.getAttribute("android:name") in targets) {
                                element.setAttribute("android:enabled", "false")
                                disabled++
                            }
                        }
                    }
                    if (disabled != targets.size) {
                        throw PatchException(
                            "App Finder telemetry: disabled $disabled of ${targets.size} datatransport " +
                                "components in the manifest; refusing to ship with the upload plumbing " +
                                "partly enabled."
                        )
                    }
                    logger.info("App Finder telemetry: all ${targets.size} datatransport components disabled in the manifest.")
                }
            }
        }
    )

    execute {
        // 1. The persistent install ID is never read out again.
        InstallIdFingerprint.method.addInstructions(
            0,
            """
                const-string v0, ""
                return-object v0
            """.trimIndent()
        )

        // 2. The settings-diff usage log attached to every search
        // query is emptied at its source.
        SettingsDiffLogFingerprint.method.addInstructions(
            0,
            """
                const-string v0, ""
                return-object v0
            """.trimIndent()
        )
    }
}
