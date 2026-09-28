/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.updates

import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Every anchor of Stop update prompts, on every declared Facebook build, and the fact the patch
 * rests on: the build carries no installer of its own, so its prompts are all there is to stop.
 */
class UpdatePromptsFixtureTest {
    private val installer = "Landroid/content/pm/PackageInstaller;"
    private val sessions = setOf("createSession", "openSession")

    private fun locals(method: Method): Int {
        val self = if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
        return method.implementation!!.registerCount - self - method.parameterTypes.sumOf {
            if (it.toString() == "J" || it.toString() == "D") 2 else 1
        }
    }

    @Test
    fun `each declared build has every anchor once, with a local to borrow, and no installer`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val anchors = mapOf(
                    "update-over-cellular filter" to FixtureDex.classesHolding(bundle, LATEST_VERSION_AVAILABLE)
                        .flatMap { c -> c.methods.filter { isPromotionFilter(it, LATEST_VERSION_AVAILABLE, CELLULAR_PROVIDER) } },
                    "update-ownership filter" to FixtureDex.classesHolding(bundle, OWNERSHIP_NEEDED)
                        .flatMap { c -> c.methods.filter { isPromotionFilter(it, OWNERSHIP_NEEDED, OWNERSHIP_PROVIDER) } },
                    "force-sync push handler" to FixtureDex.classesHolding(bundle, FORCE_SYNC_SUCCESS)
                        .flatMap { c -> c.methods.filter(::isForceSyncHandler) },
                    "chat filter evaluator" to FixtureDex.classes(bundle, setOf(FILTER_DISPATCHER)).values
                        .flatMap { c -> c.methods.filter(::isFilterEvaluator) },
                )
                for ((what, found) in anchors) {
                    assertEquals("${bundle.name}: $what", 1, found.size)
                    assertTrue("${bundle.name}: $what has no local register", locals(found.single()) >= 1)
                }
                // The two filters are two classes: one predicate per promotion filter type.
                assertTrue(
                    "${bundle.name}: both filters on one class",
                    anchors.getValue("update-over-cellular filter").single().definingClass !=
                        anchors.getValue("update-ownership filter").single().definingClass,
                )
                // The evaluator is what the hook takes it for: a filter name comes first, and the
                // floor filter sits beside the ceiling, so a name check can't fail the wrong one.
                val evaluator = anchors.getValue("chat filter evaluator").single()
                assertTrue("${bundle.name}: the evaluator lost the floor filter", holds(evaluator, "app_min_version"))

                // Nothing in the build opens a PackageInstaller session. A build that starts to
                // has grown an installer of its own, which is more than prompts to stop.
                val installs = FixtureDex.methodsWhere(bundle, dexFilter = { dex ->
                    dex.methodSection.any { it.definingClass == installer && it.name in sessions }
                }) { method ->
                    method.implementation?.instructions?.any { instruction ->
                        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ref?.definingClass == installer && ref.name in sessions
                    } == true
                }
                assertEquals("${bundle.name}: methods opening an installer session", emptyList<String>(),
                    installs.map { it.definingClass + "->" + it.name })
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private fun holds(method: Method, literal: String): Boolean =
        method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.StringReference)
                ?.string == literal
        } == true
}
