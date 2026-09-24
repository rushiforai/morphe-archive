/*
 * Copyright 2026
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
package app.morphe.patches.pixelcamera.gallery

import app.morphe.patches.pixelcamera.shared.Constants.COMPATIBILITY_PIXEL_CAMERA
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertTrue

/**
 * Structural self-checks for the fingerprint declarations.
 *
 * These run without an APK. They guard against the class of mistake that
 * silently produces a broken patch: a filter index constant drifting out of
 * range after someone edits the filter list, or the patch losing its
 * obfuscation-safe parameter declarations.
 *
 * Whether the fingerprints actually resolve against a real Pixel Camera build
 * is a separate question, answered by:
 *
 *     python tools/verify_fingerprints.py <base.apk>
 */
class FingerprintsTest {

    @Test
    fun `gate filter index constants stay inside the filter list`() {
        val filters = assertNotNull(
            PhotosAvailabilityGateFingerprint.filters,
            "the gate fingerprint must declare instruction filters",
        )

        for ((name, index) in listOf(
            "GATE_PACKAGE_INFO_FILTER" to GATE_PACKAGE_INFO_FILTER,
            "GATE_ENABLED_SETTING_FILTER" to GATE_ENABLED_SETTING_FILTER,
            "GATE_SUSPENDED_FILTER" to GATE_SUSPENDED_FILTER,
        )) {
            assertTrue(
                index in filters.indices,
                "$name = $index is outside the ${filters.size} declared filters",
            )
        }
    }

    @Test
    fun `gate filter index constants are distinct`() {
        val indices = listOf(
            GATE_PACKAGE_INFO_FILTER,
            GATE_ENABLED_SETTING_FILTER,
            GATE_SUSPENDED_FILTER,
        )
        assertEquals(
            indices.size,
            indices.toSet().size,
            "each mutated probe must map to its own filter",
        )
    }

    @Test
    fun `launcher fingerprint keeps its full parameter signature`() {
        val parameters = assertNotNull(ThumbnailReviewLauncherFingerprint.parameters)
        assertEquals(
            listOf(
                "Landroid/content/Intent;",
                "Landroid/view/View;",
                "Landroid/graphics/Bitmap;",
            ),
            parameters,
            "the patch injects `invoke-static { p1, p2 }` and relies on p1 being the " +
                "Intent and p2 being the View",
        )
        assertEquals("Z", ThumbnailReviewLauncherFingerprint.returnType)
    }

    @Test
    fun `gate fingerprint declares an obfuscation-safe parameter type`() {
        val parameters = assertNotNull(PhotosAvailabilityGateFingerprint.parameters)
        assertEquals(
            listOf("L"),
            parameters,
            "the desugared java.util.Optional descriptor is a build detail; match any " +
                "object type instead",
        )
        assertEquals("V", PhotosAvailabilityGateFingerprint.returnType)
    }

    @Test
    fun `both fingerprints avoid naming obfuscated classes and methods`() {
        for (fingerprint in listOf(
            ThumbnailReviewLauncherFingerprint,
            PhotosAvailabilityGateFingerprint,
        )) {
            assertEquals(
                null,
                fingerprint.definingClass,
                "Pixel Camera class names change on every release",
            )
            assertEquals(
                null,
                fingerprint.name,
                "Pixel Camera method names change on every release",
            )
            assertTrue(
                !fingerprint.filters.isNullOrEmpty(),
                "without a defining class the filters are the only identity",
            )
        }
    }

    @Test
    fun `extension descriptor is a well-formed smali class reference`() {
        assertTrue(
            EXTENSION_CLASS.startsWith("L") && EXTENSION_CLASS.endsWith(";"),
            "injected smali needs a type descriptor, not a Java class name: $EXTENSION_CLASS",
        )
        assertTrue(
            '.' !in EXTENSION_CLASS,
            "package separators in a descriptor must be '/', not '.': $EXTENSION_CLASS",
        )
        assertEquals(
            "Lapp/morphe/extension/pixelcamera/gallery/GalleryRedirect;",
            EXTENSION_CLASS,
            "must match the Java package and class of GalleryRedirect.java",
        )
    }

    @Test
    fun `lock screen switch method name matches the extension`() {
        // GalleryRedirect.redirectSecureReview() is the only thing the
        // lock-screen patch rewrites; a rename on either side silently breaks it.
        assertEquals("redirectSecureReview", SECURE_SWITCH_METHOD)
    }

    @Test
    fun `compatibility targets the official Pixel Camera package`() {
        assertEquals("com.google.android.GoogleCamera", COMPATIBILITY_PIXEL_CAMERA.packageName)
        assertTrue(
            COMPATIBILITY_PIXEL_CAMERA.targets.isNotEmpty(),
            "at least one verified app target must be recorded",
        )
        assertEquals(
            setOf("f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83"),
            COMPATIBILITY_PIXEL_CAMERA.signatures,
            "patching an APK signed by anyone other than Google is not supported",
        )
    }
}
