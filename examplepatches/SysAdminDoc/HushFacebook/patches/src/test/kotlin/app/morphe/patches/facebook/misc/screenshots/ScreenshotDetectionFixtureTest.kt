/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.screenshots

import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Block screenshot detection on every Facebook build the bundle declares: the shared screenshot
 * observer has one onChange with a free local, every detector extends the class that starts it,
 * and every Android 14 screen capture and Android 15 recording call is one the patch sends.
 * Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class ScreenshotDetectionFixtureTest {
    private val detectors = listOf(
        "Lcom/facebook/screenshotdetection/FeedScreenshotDetector;",
        "Lcom/facebook/screenshotlogging/reels/ReelsScreenshotDetector;",
        "Lcom/facebook/messaging/screenshotdetection/ThreadScreenshotDetector;",
        "Lcom/facebook/quicksilver/screenshot/QuicksilverScreenshotDetector;",
        "Lcom/facebook/screenshotlogging/detector/ScreenshotLoggingScreenshotDetector;",
        "Lcom/facebook/ads/AdsScreenshotDetector;",
    )

    @Test
    fun `each declared build has one screenshot observer and sends every capture call`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val classes = FixtureDex.classes(bundle, (detectors + SCREENSHOT_OBSERVER).toSet())
                val observer = classes[SCREENSHOT_OBSERVER]
                val changes = observer?.methods?.filter(::isObserverChange).orEmpty()
                assertEquals("${bundle.name}: the observer's onChange", 1, changes.size)
                assertTrue("${bundle.name}: onChange has a local", changes.single().localRegisterCount() >= 1)
                val bases = detectors.map { type -> classes[type]?.superclass }
                assertEquals("${bundle.name}: detectors on one base, $bases", 1, bases.toSet().size)
                val base = FixtureDex.classes(bundle, setOfNotNull(bases.first())).values.single()
                assertTrue("${bundle.name}: the base holds the observer", base.fields.any { it.type == SCREENSHOT_OBSERVER })

                // Each class's superclass, for the activity check along a chain, and a copy of each call
                // named like a detection call, since a dex's classes don't outlive its visit.
                val superclasses = HashMap<String, String?>()
                val named = mutableListOf<Instruction>()
                FixtureDex.forEach(bundle) { dex ->
                    for (classDef in dex.classes) {
                        superclasses.putIfAbsent(classDef.type, classDef.superclass)
                        for (method in classDef.methods) {
                            for (instruction in method.implementation?.instructions ?: emptyList()) {
                                val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                                if (DetectionCall.entries.any { it.method == call.name }) named += ImmutableInstruction.of(instruction)
                            }
                        }
                    }
                }
                fun isActivity(type: String): Boolean {
                    var at: String? = type
                    repeat(20) {
                        if (at == null) return false
                        if (at == ACTIVITY) return true
                        at = superclasses[at]
                    }
                    return false
                }
                val calls = named.mapNotNull { detectionCall(it, ::isActivity) }
                assertEquals("${bundle.name}: detection calls the patch can't send", named.size, calls.size)
                assertTrue("${bundle.name}: screen capture registrations", DetectionCall.CAPTURE in calls)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
