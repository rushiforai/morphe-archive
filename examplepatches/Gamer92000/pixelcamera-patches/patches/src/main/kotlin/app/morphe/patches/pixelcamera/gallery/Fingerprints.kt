/*
 * Copyright 2026
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
package app.morphe.patches.pixelcamera.gallery

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Google Photos' package name.
 *
 * This is matched, never emitted. The patch removes Pixel Camera's dependency
 * on this package; the replacement intent names no package at all.
 */
internal const val PHOTOS_PACKAGE_NAME = "com.google.android.apps.photos"

/*
 * Pixel Camera is R8-obfuscated: every class and method on this path has a
 * one-to-three letter name that changes on each release (in 10.4.117 the two
 * targets happen to be `Liho;->e(...)` and `Liho;->b(...)`). None of that is
 * fingerprinted. Both fingerprints below identify their method purely by
 * structure: access flags, return type, parameter types, and an ordered set of
 * framework calls and string constants that the method must contain.
 */

/**
 * The single funnel through which every camera-roll thumbnail launch passes.
 *
 * In 10.4.117.936816638.14 this is:
 *
 * ```
 * .method public final e(Landroid/content/Intent;Landroid/view/View;Landroid/graphics/Bitmap;)Z
 *     0000: iget-object v0, v5, L<obf>;-><obf>:Landroid/content/Context;
 *     0002: invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()...
 *     0006: invoke-virtual {v6, v0}, Landroid/content/Intent;->resolveActivity(...)
 *     000b: if-eqz v0, :00ab                     # no handler -> cancel
 *     0020: const-string v2, "photos_review_launch_timestamp"
 *     0029: const-string v0, "shared_element_return_transition"
 *     0088: invoke-virtual {v5, v6, v1, v7}, Landroid/app/Activity;->startActivityForResult(...)
 *     ...
 *     00bd: const-string v6, "Photos is disabled."   # thrown when resolveActivity == null
 * .end method
 * ```
 *
 * All three call sites that build a review intent
 * (thumbnail tap, filmstrip transition end, and the "open gallery" shortcut)
 * converge here, so a single injection at instruction 0 covers every path.
 *
 * The method's own `resolveActivity(...) == null` guard and the `try/catch`
 * around `startActivityForResult` are deliberately left intact - after the
 * redirect they become the graceful "no compatible activity installed" and
 * "target activity threw during launch" handling.
 */
internal object ThumbnailReviewLauncherFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(
        "Landroid/content/Intent;",
        "Landroid/view/View;",
        "Landroid/graphics/Bitmap;",
    ),
    filters = listOf(
        methodCall(definingClass = "Landroid/content/Intent;", name = "resolveActivity"),
        string("photos_review_launch_timestamp"),
        string("shared_element_return_transition"),
        methodCall(definingClass = "Landroid/app/Activity;", name = "startActivityForResult"),
    ),
)

/**
 * The Google Photos availability gate, run before the review transition starts.
 *
 * In 10.4.117.936816638.14 this is:
 *
 * ```
 * .method public final b(Lj$/util/Optional;)V
 *     0000: const-string v0, "com.google.android.apps.photos"
 *     0010: invoke-virtual {v2}, L<obf>;->a()Landroid/content/pm/PackageInfo;
 *     001a: if-nez v3, :0059                  # null  -> "install Photos" dialog
 *     005f: invoke-virtual {v2, v0}, Landroid/content/pm/PackageManager;->getApplicationEnabledSetting(...)I
 *     0066: if-ne v2, v3, :01d7               # not enabled -> "Photos is disabled" dialog
 *     0070: invoke-virtual {v2, v0}, Landroid/content/pm/PackageManager;->isPackageSuspended(...)Z
 *     0074: if-eqz v0, :00aa                  # suspended -> bounce to Photos launcher
 *     01e5: const-string v0, "Photos is disabled. Canceling."
 * .end method
 * ```
 *
 * This is the code that produces the prompt asking the user to re-enable Google
 * Photos. The three probes are replaced with extension stand-ins of identical
 * shape; everything else in the method - transition setup, filmstrip lookup,
 * bitmap handoff - is untouched.
 *
 * The parameter is declared as the bare object type `"L"` rather than
 * `Lj$/util/Optional;` because core-library-desugaring prefixes are a build
 * detail that may change between releases.
 */
internal object PhotosAvailabilityGateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        // [0] the only literal reference to the Photos package in this method
        string(PHOTOS_PACKAGE_NAME),
        // [1] the wrapper returning Photos' PackageInfo (null when unavailable)
        methodCall(returnType = "Landroid/content/pm/PackageInfo;"),
        // [2] enabled-state probe
        methodCall(
            definingClass = "Landroid/content/pm/PackageManager;",
            name = "getApplicationEnabledSetting",
        ),
        // [3] suspended-state probe
        methodCall(
            definingClass = "Landroid/content/pm/PackageManager;",
            name = "isPackageSuspended",
        ),
        // [4] the log line emitted immediately before the "Photos is disabled" dialog
        string("Photos is disabled. Canceling."),
    ),
)

/** Index into [PhotosAvailabilityGateFingerprint]'s filters. */
internal const val GATE_PACKAGE_INFO_FILTER = 1

/** Index into [PhotosAvailabilityGateFingerprint]'s filters. */
internal const val GATE_ENABLED_SETTING_FILTER = 2

/** Index into [PhotosAvailabilityGateFingerprint]'s filters. */
internal const val GATE_SUSPENDED_FILTER = 3
