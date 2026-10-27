/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

// Modified for Heval's Morphe Patches (2026-10-11): only the two Google Play services library
// fingerprints are kept. The GNP registration and extension-getter fingerprints are not needed
// (no Google-app package rename, and the extension hard-codes the MicroG RE vendor).

package app.template.patches.shared.misc.gms

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

// Both fingerprints anchor on play-services-basement library code (stable strings + shape), not
// on app code. They are optional in the builder because an app only contains them when it
// bundles that library (most apps using any Google API do). They also match on the
// "com.google.android.gms" string, so they must be resolved before the string rewrite.

// GooglePlayServicesUtilLight.isGooglePlayServicesAvailable(Context, int). It checks that
// "com.google.android.gms" is installed and signed by Google; after the rewrite it would check
// MicroG RE, which is not Google-signed, and report SERVICE_INVALID. Forced to SUCCESS (0).
// No access flags (upstream requires public static): R8 may inline the static helper into the
// instance method GoogleApiAvailabilityLight.isGooglePlayServicesAvailable(Context, int), as in
// Bluecoins 13.1.149 ("public c(Context, int)"). R8 may also reorder the parameters, as in
// 365Scores 14.9.6 ("public static c(int, Context)"), so either order matches. Upstream anchors on
// "MetadataValueReader" and "This should never happen." as well, but R8 can drop those: in
// Sofascore 26.09.28 the method is inlined into GoogleApiAvailabilityLight.b(Context, int) without
// them. The signature warning it logs is kept in every build seen, and shape plus these strings
// stay unique.
internal const val GOOGLE_SIGNATURE_INVALID_WARNING = " requires Google Play services, but their signature is invalid."

internal object GooglePlayUtilityFingerprint : Fingerprint(
    returnType = "I",
    strings = listOf(
        string(GOOGLE_SIGNATURE_INVALID_WARNING, StringComparisonType.CONTAINS),
        string("com.google.android.gms", StringComparisonType.CONTAINS),
    ),
    custom = { method, _ ->
        method.parameterTypes.map { if (it.startsWith("L")) "L" else it.toString() }.sorted() == listOf("I", "L")
    },
)

// GooglePlayServicesUtilLight.ensurePlayServicesAvailable(Context, int): throws "Google Play
// Services not available" when the availability check fails; returned early. Upstream expects
// (Context, int), but R8 reorders or drops the constant version parameter: Truecaller 26.40.5 and
// Gmail keep (Context, int), 365Scores 14.9.6 has "a(int, Context)" and Sofascore 26.09.28 and
// 26.10.05 have "a(Context)" with the version inlined. The old (L, I) shape missed the last two, so
// the hook silently did nothing there (2026-10-17). Any of the three shapes matches now. No access
// flags, for the same R8 reason as above. Gmail also holds the message in a non-void
// ListenableFuture method, which the return type excludes.
internal const val SERVICE_CHECK_MESSAGE = "Google Play Services not available"

/** True for (Context), (Context, int) and (int, Context). */
internal fun isServiceCheckParameters(parameterTypes: List<CharSequence>) =
    parameterTypes.map(CharSequence::toString).sorted() in listOf(
        listOf("Landroid/content/Context;"),
        listOf("I", "Landroid/content/Context;"),
    )

internal object ServiceCheckFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf(string(SERVICE_CHECK_MESSAGE, StringComparisonType.CONTAINS)),
    custom = { method, _ -> isServiceCheckParameters(method.parameterTypes) },
)
