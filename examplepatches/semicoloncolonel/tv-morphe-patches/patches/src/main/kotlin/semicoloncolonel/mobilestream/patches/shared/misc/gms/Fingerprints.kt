/*
 * Ported from Morphe's "GmsCore support" patch (GPL-3.0):
 * https://github.com/MorpheApp/morphe-patches/tree/main/patches/src/main/kotlin/app/morphe/patches/shared/misc/gms
 * Copyright 2026 Morphe. Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 * See the NOTICE file for the GPLv3 Section 7 terms that apply to Morphe contributions.
 * ALL CREDIT FOR THE GMSCORE SUPPORT DESIGN AND FINGERPRINTS GOES TO MORPHE AND REVANCED.
 */

package semicoloncolonel.mobilestream.patches.shared.misc.gms

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal const val GMS_EXTENSION_CLASS =
    "Lsemicoloncolonel/mobilestream/extension/shared/misc/GmsCoreSupport;"

// GooglePlayServicesUtil.isGooglePlayServicesAvailable (qbh.a(Context, I)I).
internal object GooglePlayUtilityFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf("L", "I"),
    filters = listOf(
        string("MetadataValueReader"),
        string("This should never happen."),
        string("com.google.android.gms"),
    )
)

// GooglePlayServicesUtil.ensurePlayServicesAvailable (qbh.c(Context, I)V).
internal object ServiceCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("L", "I"),
    strings = listOf("Google Play Services not available"),
)

internal object GmsCoreVendorGroupIdFingerprint : Fingerprint(
    definingClass = GMS_EXTENSION_CLASS,
    name = "getGmsCoreVendorGroupId",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)

internal object OriginalPackageNameFingerprint : Fingerprint(
    definingClass = GMS_EXTENSION_CLASS,
    name = "getOriginalPackageName",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
)
