/*
 * Forked from:
 * https://github.com/andrewliang25/morphe-patches/blob/5db2e57e133aede5297c48b419168cf30fd89953/patches/src/main/kotlin/app/andrewliang/patches/facebook/resignedtrust/Fingerprints.kt
 * Copyright 2026 Andrew Liang (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026.
 */
package app.morphe.patches.facebook.misc.resignedtrust

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * Facebook's push service package check (582: `LX/0J4;->A00(Context, PackageInfo holder)V`), which
 * hashes a package's one signer with SHA-256 and looks the hash up among Meta's. Its log tag and
 * error strings are literals Facebook keeps; the class and method names are Redex names.
 */
internal object FbnsPackageCheckFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        fieldAccess(
            definingClass = "Landroid/content/pm/PackageInfo;",
            name = "signatures",
        ),
        string("PackageInfoUtil"),
        string("Failed to create SHA-256 hash"),
    ),
)

/**
 * Facebook's family intent scope filter (585: `LX/00ZK;->A00(Context, Intent, String, List)Intent`).
 * It keeps the targets whose signer Meta trusts and answers null when none is left, which is how a
 * patched Instagram's links get dropped (#287). Its log line is a literal Facebook keeps; the class
 * and method names are Redex names.
 */
internal object FamilyScopeFilterFingerprint : Fingerprint(
    returnType = "Landroid/content/Intent;",
    parameters = listOf("Landroid/content/Context;", "Landroid/content/Intent;", "Ljava/lang/String;", "Ljava/util/List;"),
    filters = listOf(
        string("Components matching the intent were found but none match the given scope. ["),
    ),
)

/**
 * The method that gives Facebook's security code the signers of a package.
 *
 * Facebook's trust checks read the signers through this method. It prefers the
 * `SigningInfo` of the package and falls back to the old `signatures` array. It is the only method
 * with no parameters that reads both signer lists of `SigningInfo` and the old array too. Its class
 * and its name are Redex names, so the fingerprint uses only framework references.
 */
internal object PackageSignersFingerprint : Fingerprint(
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/content/pm/SigningInfo;",
            name = "getApkContentsSigners",
        ),
        methodCall(
            definingClass = "Landroid/content/pm/SigningInfo;",
            name = "getSigningCertificateHistory",
        ),
        fieldAccess(
            definingClass = "Landroid/content/pm/PackageInfo;",
            name = "signatures",
        ),
    ),
)
