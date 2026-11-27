/*
 * Copyright 2026 pixel10pro-camera-patches contributors
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
package app.morphe.patches.pixelcamera.photos

import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNull

class RetargetPhotosStringTest {
    private val pkg = MORPHE_PHOTOS_PACKAGE
    private val mars = "$pkg.api.mars"
    private fun r(s: String) = retargetPhotosString(s, pkg, mars)

    @Test fun packageName() = assertEquals(pkg, r("com.google.android.apps.photos"))
    @Test fun packageUri() = assertEquals("package:$pkg", r("package:com.google.android.apps.photos"))

    @Test fun reviewActions() {
        assertEquals("$pkg.mars.api.ACTION_REVIEW", r("com.google.android.apps.photos.mars.api.ACTION_REVIEW"))
        assertEquals("$pkg.mars.api.ACTION_REVIEW_SECURE", r("com.google.android.apps.photos.mars.api.ACTION_REVIEW_SECURE"))
    }

    @Test fun marsAuthority() {
        assertEquals(mars, r("com.google.android.libraries.photos.api.mars"))
        assertEquals("content://$mars", r("content://com.google.android.libraries.photos.api.mars"))
    }

    @Test fun untouched() {
        // Extras, creator actions, class names and Play Store links keep their stock value.
        for (s in listOf(
            "com.google.android.apps.photos.api.secure_mode",
            "com.google.android.apps.photos.api.secure_mode_ids",
            "com.google.android.apps.photos.jetty.action.OPEN_CREATOR_CANVAS",
            "com.google.android.apps.photos.cameraassistant.CameraAssistantService",
            "grpc:///com.google.android.apps.photos.pixel.pact.PactPhotosService",
            "http://play.google.com/store/apps/details?id=com.google.android.apps.photos",
            "com.google.android.apps.photosx",
        )) assertNull(r(s), s)
    }

    @Test fun stockTargetIsNoOp() =
        assertNull(retargetPhotosString("com.google.android.apps.photos", "com.google.android.apps.photos", mars))
}
