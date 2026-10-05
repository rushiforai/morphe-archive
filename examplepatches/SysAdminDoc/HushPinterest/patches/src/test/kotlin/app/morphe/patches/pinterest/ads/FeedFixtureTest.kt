/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ads

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.PatchLogCapture
import app.morphe.patches.pinterest.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Hide ads and Hide AI-labeled pins against the Pinterest builds the bundle declares: each list
 * holder text names exactly one class, all three holders and all four ad-only views are hooked,
 * and nothing is warned about. Reads the real dex, so a renamed class or a moved literal in a new
 * build fails here before it reaches a phone.
 */
class FeedFixtureTest {
    private val literals = listOf(", _items count:", "PagedResponse(bookmark=", "ModelListWithBookmark(models=")

    @Test
    fun `every list holder and ad-only view in each declared build is hooked without a warning`() {
        val builds = Fixtures.declaredBuilds()
        assertTrue("no declared build to read", builds.isNotEmpty())
        for (build in builds) {
            val (classes, holders) = read(build)
            for (literal in literals) {
                assertEquals("${build.name}: classes whose toString writes \"$literal\"", 1, holders[literal]?.size ?: 0)
            }
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val warnings = PatchLogCapture.warnings {
                feedListHookPatch.execute(context)
                hideAdsPatch.execute(context)
                hideAiPinsPatch.execute(context)
                hideShoppingPatch.execute(context)
            }
            assertEquals("${build.name} warnings", emptyList<String>(), warnings)
            assertEquals(build.name, 3, feedListHoldersHooked)
            for (flag in listOf("hideAds", "feedAds", "adViews", "hideAiPins", "feedAiPins", "hideShopping", "feedShopping")) assertFlag(context, flag)

            val filter = "$EXTENSION_PACKAGE/ads/FeedFilter;->filter(Ljava/util/List;)Ljava/util/List;"
            for (holder in holders.values.flatten()) {
                val constructors = context.mutableClassDefBy(holder).methods.filter { method ->
                    method.name == "<init>" && method.parameterTypes.count { it.toString() == "Ljava/util/List;" } == 1
                }
                assertTrue("${build.name}: $holder has no list constructor", constructors.isNotEmpty())
                for (constructor in constructors) {
                    val first = constructor.implementation!!.instructions.first()
                    assertEquals("${build.name}: $holder ${constructor.parameterTypes}", filter,
                        (first as? ReferenceInstruction)?.reference?.toString())
                }
            }
            for (view in AD_ONLY_VIEWS) {
                val methods = context.mutableClassDefBy(view).methods
                for ((name, helper) in listOf("setVisibility" to "adViewVisibility", "onMeasure" to "adViewMeasureSpec")) {
                    val method = methods.singleOrNull { it.name == name && it.returnType == "V" }
                    assertTrue("${build.name}: $view has no $name of its own", method != null)
                    assertTrue("${build.name}: $view.$name doesn't call $helper", method!!.implementation!!.instructions.any {
                        (it as? ReferenceInstruction)?.reference?.toString() == "$EXTENSION_PACKAGE/ads/Ads;->$helper(I)I"
                    })
                }
            }
        }
    }

    /** The holder classes by literal, and those classes with the ad-only views and every app class above them. */
    private fun read(build: File): Pair<List<ClassDef>, Map<String, List<String>>> {
        val wanted = mutableMapOf<String, ClassDef>()
        val holders = mutableMapOf<String, MutableList<String>>()
        FixtureDex.forEach(build) { dex ->
            for (classDef in dex.classes) {
                val written = classDef.methods.filter { it.name == "toString" }.flatMap { method ->
                    (method.implementation?.instructions?.toList() ?: emptyList()).mapNotNull {
                        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
                    }
                }
                val matched = literals.filter { it in written }
                matched.forEach { holders.getOrPut(it) { mutableListOf() } += classDef.type }
                if (matched.isNotEmpty() || classDef.type in AD_ONLY_VIEWS) wanted[classDef.type] = ImmutableClassDef.of(classDef)
            }
        }
        var above = wanted.values.mapNotNull { it.superclass }.toSet() - wanted.keys
        while (above.isNotEmpty()) {
            val found = FixtureDex.classes(build, above)
            wanted += found
            above = found.values.mapNotNull { it.superclass }.toSet() - wanted.keys
        }
        return wanted.values.toList() to holders
    }

    private fun assertFlag(context: BytecodePatchContext, name: String) {
        val instructions = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }
            .implementation!!.instructions.toList()
        assertEquals(Opcode.CONST_4, instructions[0].opcode)
        assertEquals("$name coverage", 1, (instructions[0] as NarrowLiteralInstruction).narrowLiteral)
    }
}
