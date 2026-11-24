/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.todaii

import app.fakh.patches.shared.disableFacebookAppEvents
import app.fakh.patches.shared.disableProviders
import app.fakh.patches.shared.firebase.firebaseManifestPatch
import app.fakh.patches.todaii.shared.Constants.COMPATIBILITY_TODAII
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch

/**
 * Disables Adjust's lifecycle content provider and turns off Facebook App Events and advertiser ID collection.
 * FacebookInitProvider stays enabled because SpeakTextHelper uses FacebookSdk.getCacheDir() for temporary TTS audio.
 */
private val analyticsManifestPatch = patch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            manifest.disableProviders("com.adjust.sdk.SystemLifecycleContentProvider")

            manifest.disableFacebookAppEvents()
        }
    }
}

/** BaseActivity.k1: logs screen and action events to the activity's FirebaseAnalytics instance. */
private object BaseActivityLogEventFingerprint : Fingerprint(
    definingClass = "Lmobi/eup/jpnews/activity/d;",
    name = "k1",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"),
)

@Suppress("unused")
val disableAnalyticsPatch = patch(
    name = "Disable analytics",
    description = "Turns off analytics and tracking.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TODAII)
    category("Privacy")
    dependsOn(firebaseManifestPatch(), analyticsManifestPatch)

    execute {
        // TrackEventHelper.a(Context) initializes FirebaseAnalytics and b(String, HashMap) logs events.
        val trackMethods = mutableClassDefBy("Lcp/z;").methods
            .filter { (it.name == "a" || it.name == "b") && it.returnType == "V" }
        if (trackMethods.size != 2) {
            throw PatchException("Todaii: expected 2 TrackEventHelper methods, found ${trackMethods.size}")
        }
        trackMethods.forEach { it.addInstructions(0, "return-void") }

        BaseActivityLogEventFingerprint.method.addInstructions(0, "return-void")

        // AdjustHelper.i(Context) starts Adjust, l logs push tokens, m logs ad revenue, o logs purchases.
        val adjustHelperCalls = setOf("i", "l", "m", "o")
        val adjustMethods = mutableClassDefBy("Lcp/g;").methods
            .filter { it.name in adjustHelperCalls && it.returnType == "V" }
        if (adjustMethods.size != 4) {
            throw PatchException("Todaii: expected 4 AdjustHelper methods, found ${adjustMethods.size}")
        }
        adjustMethods.forEach { it.addInstructions(0, "return-void") }

        // Facebook AppEventsLogger.Companion.activateApp (Lu7/o$a;->a/b) and AppEventsLogger.logEvent (Lu7/o;->b).
        val fbActivate = mutableClassDefBy("Lu7/o\$a;").methods
            .filter { (it.name == "a" || it.name == "b") && it.returnType == "V" }
        if (fbActivate.size != 2) {
            throw PatchException("Todaii: expected 2 Facebook activateApp methods, found ${fbActivate.size}")
        }
        fbActivate.forEach { it.addInstructions(0, "return-void") }

        val fbLogEvent = mutableClassDefBy("Lu7/o;").methods.singleOrNull {
            it.name == "b" && it.returnType == "V"
        } ?: throw PatchException("Todaii: Facebook AppEventsLogger.logEvent not found.")
        fbLogEvent.addInstructions(0, "return-void")
    }
}
