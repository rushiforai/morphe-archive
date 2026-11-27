/*
 * Copyright 2026 Gamer92000 (https://github.com/Gamer92000/pixelcamera-patches)
 * Modified 2026-11-25 for pixel10pro-camera-patches: gate fingerprint updated for
 * Pixel Camera 11.1.040 (probes moved into a helper class).
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
 * In 11.1.040.982810059.19 the three Photos probes moved out of this method
 * into a small helper class (one instance field on the launcher), so the gate
 * itself no longer references the Photos package or PackageManager directly:
 *
 * ```
 * .method public final b(Lj$/util/Optional;)V
 *     000c: invoke-virtual {v0}, L<helper>;->a()Landroid/content/pm/PackageInfo;   # getPackageInfo(Photos)
 *     0018: if-nez v1, :0056                                    # null -> "install Photos" dialog
 *     0028: const-string v0, "Cannot find Photos package info. Canceling."
 *     0056: invoke-virtual {v0}, L<helper>;->c()Z               # enabled-state probe
 *     005b: if-nez v1, :0099                                    # false -> "Photos is disabled" dialog
 *     006b: const-string v0, "Photos is disabled. Canceling."
 *     0099: invoke-virtual {v0}, L<helper>;->d()Z               # isPackageSuspended(Photos)
 *     009d: if-eqz v0, :00c7                                    # true -> bounce to Photos launcher
 *     00ad: const-string v0, "Photos is suspended. Canceling."
 * .end method
 * ```
 *
 * (10.4.117.936816638.14 had the same three probes inline, as direct
 * `PackageManager` calls; this bundle targets 11.1 only.)
 *
 * The probes are identified by return type and by the log line that follows
 * each one, never by the helper's obfuscated name. Each is replaced with an
 * extension stand-in taking the same single register; everything else in the
 * method - transition setup, filmstrip lookup, bitmap handoff - is untouched.
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
        // [0] the helper returning Photos' PackageInfo (null when unavailable)
        methodCall(returnType = "Landroid/content/pm/PackageInfo;", parameters = listOf()),
        // [1] the log line of the "install Photos" branch
        string("Cannot find Photos package info. Canceling."),
        // [2] enabled-state probe: the first no-arg boolean call after [1]
        methodCall(returnType = "Z", parameters = listOf()),
        // [3] the log line of the "Photos is disabled" branch
        string("Photos is disabled. Canceling."),
        // [4] suspended-state probe: the first no-arg boolean call after [3]
        methodCall(returnType = "Z", parameters = listOf()),
        // [5] the log line of the "Photos is suspended" branch
        string("Photos is suspended. Canceling."),
    ),
)

/** Index into [PhotosAvailabilityGateFingerprint]'s filters. */
internal const val GATE_PACKAGE_INFO_FILTER = 0

/** Index into [PhotosAvailabilityGateFingerprint]'s filters. */
internal const val GATE_ENABLED_SETTING_FILTER = 2

/** Index into [PhotosAvailabilityGateFingerprint]'s filters. */
internal const val GATE_SUSPENDED_FILTER = 4
