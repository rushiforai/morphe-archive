package app.epxec.patches.elmwood.microg

import app.epxec.patches.shared.Constants.COMPATIBILITY_Elmwood
import app.morphe.patches.all.misc.string.replaceStringPatch
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.returnEarly
import org.w3c.dom.Element

// ── MicroG vendor package prefix ─────────────────────────────────────────────
// All "com.google.android.gms" references in the app's bytecode are redirected
// to this prefix so that service bindings, content-provider authorities, and
// broadcast receivers resolve against the installed MicroG package instead of
// the real Google Play Services.
private const val GMS_VENDOR = "app.revanced"

// ── Manifest patch ────────────────────────────────────────────────────────────
// 1. Rewrites permission, receiver, and intent-filter names that contain the
//    Firebase / C2DM package prefix from "com.google.android.c2dm" to the
//    MicroG equivalent so push notifications work.
// 2. Adds the meta-data entries MicroG requires:
//    - com.google.android.gms.version         (original key, before redirect)
//    - app.revanced.android.gms.version        (redirected key, after redirect)
//    Both are needed: the replaceStringPatch rewrites the const-string key inside
//    c42.c() from the original to the redirected form, so the patched APK looks
//    up the redirected key at runtime.  Some Firebase threads (Analytics, etc.)
//    also call c42.c() and encounter the same redirected lookup.
//    Injecting both ensures every code path finds a match.
private val elmwoodMicroGResourcePatch = resourcePatch {
    execute {
        // ── Text-level C2DM/FCM permission rename ────────────────────────────
        val manifestFile = get("AndroidManifest.xml")
        manifestFile.writeText(
            manifestFile.readText()
                .replace(
                    "com.google.android.c2dm",
                    "$GMS_VENDOR.android.c2dm",
                )
        )

        // ── meta-data injection ──────────────────────────────────────────────
        document("AndroidManifest.xml").use { doc ->
            val app = doc.getElementsByTagName("application").item(0) as Element

            fun meta(name: String, value: String) {
                doc.createElement("meta-data").also { node ->
                    node.setAttribute("android:name", name)
                    node.setAttribute("android:value", value)
                    app.appendChild(node)
                }
            }

            // Original key — needed by any GMS path that is NOT rewritten
            meta("com.google.android.gms.version", "@integer/google_play_services_version")
            // Redirected key — needed by every path after replaceStringPatch rewrites
            // "com.google.android.gms" → "app.revanced.android.gms" in all CONST_STRINGs
            meta("$GMS_VENDOR.android.gms.version", "@integer/google_play_services_version")

            // Tell MicroG which APK package name it should spoof signatures for.
            meta("$GMS_VENDOR.android.gms.SPOOFED_PACKAGE_NAME", "com.techyonic.textbasedrpg")
        }
    }
}

// ── GMS availability bypass patch ────────────────────────────────────────────
// IMPORTANT: This patch must run BEFORE the string-redirect patches below.
// Fingerprint resolution in Morphe happens lazily inside execute {}, and
// dependsOn patches execute before the dependent patch's execute {} block.
// If the redirectGmsPackagePatch ran first, the string "com.google.android.gms"
// inside c42.c() would already be rewritten to "app.revanced.android.gms",
// making GooglePlayUtilityFingerprint (which matches on the original string)
// fail silently via methodOrNull.
//
// By making the redirect patches depend on THIS patch, we guarantee the
// fingerprint-based returnEarly calls happen against the original unmodified
// bytecode, before any strings are rewritten.
private val elmwoodGmsBypassPatch = bytecodePatch {
    execute {
        // c42.c(Context, I) → return 0 (ConnectionResult.SUCCESS)
        // Makes every isGooglePlayServicesAvailable check report success.
        GooglePlayUtilityFingerprint.methodOrNull?.returnEarly(0)

        // c42.d(Context) → return-void
        // Prevents the fatal "Google Play Services not available" exception throw.
        ServiceCheckFingerprint.methodOrNull?.returnEarly()

        // Ln42.g(PackageInfo, Z) → return true
        // The app bundles 5 hardcoded Google DER certs and compares them against
        // the installed GMS package signature. MicroG is not signed with any of
        // them, so this method would return false → error code 9 (SIGNATURE_CHECK_FAILED).
        // Bypass it to always return true.
        GmsSignatureCheckFingerprint.methodOrNull?.returnEarly(1)

        // b42 / c42 dialog methods → return-void
        // Suppress any "Install Google Play Services" AlertDialog.
        GmsAvailabilityDialogCheckFingerprint.methodOrNull?.returnEarly()
        GmsDialogShowFingerprint.methodOrNull?.returnEarly()
    }
}

// ── GMS string-redirect sub-patches ──────────────────────────────────────────
// Each replaceStringPatch scans every CONST_STRING instruction in every method
// and replaces occurrences so that service bindings, content URIs, and broadcast
// intents resolve to the installed MicroG package at runtime.
//
// These all depend on elmwoodGmsBypassPatch so they run AFTER the returnEarly
// patches while operating on the original bytecode strings.

/** Redirects the core GMS package identifier. */
private val redirectGmsPackagePatch = replaceStringPatch(
    from = "com.google.android.gms",
    to = "$GMS_VENDOR.android.gms",
    comparison = StringComparisonType.CONTAINS,
)

/** Redirects the Firebase Cloud Messaging / C2DM broadcast package. */
private val redirectC2dmPackagePatch = replaceStringPatch(
    from = "com.google.android.c2dm",
    to = "$GMS_VENDOR.android.c2dm",
    comparison = StringComparisonType.CONTAINS,
)

/** Redirects the GSF (Google Services Framework) content-provider authority. */
private val redirectGsfPackagePatch = replaceStringPatch(
    from = "com.google.android.providers.gsf",
    to = "$GMS_VENDOR.android.providers.gsf",
    comparison = StringComparisonType.CONTAINS,
)

/** Redirects the legacy GSF package name used in some binding intents. */
private val redirectGsfLegacyPatch = replaceStringPatch(
    from = "com.google.android.gsf",
    to = "$GMS_VENDOR.android.gsf",
    comparison = StringComparisonType.CONTAINS,
)

// ── Main patch ────────────────────────────────────────────────────────────────
@Suppress("unused")
val elmwoodMicroGPatch = bytecodePatch(
    name = "MicroG support",
    description = "Enables Google Sign-In and GMS-dependent features via MicroG without root.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_Elmwood)

    dependsOn(
        // 1. Manifest: C2DM rename + both gms.version meta-data keys
        elmwoodMicroGResourcePatch,

        // 2. Bytecode: GMS availability bypass (must run before redirects)
        elmwoodGmsBypassPatch,

        // 3. Bytecode: bulk GMS package-string redirects (run after bypass)
        redirectGmsPackagePatch,
        redirectC2dmPackagePatch,
        redirectGsfPackagePatch,
        redirectGsfLegacyPatch,
    )

    execute {
        // Nothing left to do here — all work is done by the dependsOn patches.
    }
}
