/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed

import app.morphe.Fixtures
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * What the "Stories you might like" rule reads, found in the Facebook builds the bundle declares
 * the way the "Hide suggested and promoted posts" patch finds it.
 *
 * Every declared build has to carry exactly one `getTypeName()` answering DiscoverFeedUnit, the
 * shared model that also answers StoriesTrayFeedUnit; DiscoverUnitComponent's kept layout manager
 * has to take exactly one class that reads the unconnected flag; that class has to be the only
 * place in the APK the flag is read; and every method that builds it has to check the unit's type
 * tag is DiscoverFeedUnit first, which ties the flag to that unit. Reads the fixture bundles from
 * HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class StoriesYouMightLikeFixtureTest {
    private fun isTypeName(method: Method) =
        method.name == "getTypeName" && method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/String;"

    private fun builds(method: Method, type: String) = method.implementation?.instructions?.any {
        it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == type
    } == true

    private fun loads(method: Method, literal: Int) = method.implementation?.instructions?.any {
        it is NarrowLiteralInstruction && it.opcode.name.startsWith("const") && it.narrowLiteral == literal
    } == true

    @Test
    fun `every declared build reads the unconnected flag once, in the Discover unit's component`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableMapOf<String, String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val layout = FixtureDex.classes(bundle, setOf(DISCOVER_UNIT_LAYOUT))[DISCOVER_UNIT_LAYOUT]
                    ?: throw AssertionError("${bundle.name} has no $DISCOVER_UNIT_LAYOUT")
                val parameters = layout.methods.filter { it.name == "<init>" }
                    .flatMap { constructor -> constructor.parameterTypes.map { it.toString() } }.toSet()
                val parameterClasses = FixtureDex.classes(bundle, parameters)
                val readers = unconnectedStoriesReaders(layout) { parameterClasses[it] }
                assertEquals("${bundle.name}: layout parameters reading $UNCONNECTED_STORIES_FLAG: ${readers.map { it.type }}",
                    1, readers.size)
                val component = readers.single().type

                val typeNames = mutableListOf<Method>()
                val flagReads = mutableListOf<Method>()
                val builders = mutableListOf<Method>()
                FixtureDex.methodsWhere(bundle, { true }) { method ->
                    if (isTypeName(method) && holdsString(method, DISCOVER_FEED_UNIT_TYPE)) typeNames += method
                    if (readsUnconnectedStoriesFlag(method)) flagReads += method
                    if (builds(method, component)) builders += method
                    false
                }
                assertEquals("${bundle.name}: getTypeName() answering $DISCOVER_FEED_UNIT_TYPE", 1, typeNames.size)
                assertTrue("${bundle.name}: the $DISCOVER_FEED_UNIT_TYPE model isn't the shared Stories one",
                    holdsString(typeNames.single(), "StoriesTrayFeedUnit"))
                assertEquals("${bundle.name}: classes reading $UNCONNECTED_STORIES_FLAG",
                    setOf(component), flagReads.map { it.definingClass }.toSet())
                // The control that ties the flag to the unit: the component is built only after a
                // check of the DiscoverFeedUnit type tag.
                assertTrue("${bundle.name}: nothing outside $component builds it",
                    builders.any { it.definingClass != component })
                for (builder in builders.filter { it.definingClass != component }) {
                    assertTrue("${bundle.name}: ${builder.definingClass}->${builder.name} builds $component " +
                        "without checking the $DISCOVER_FEED_UNIT_TYPE tag",
                        loads(builder, treeTypeTag(DISCOVER_FEED_UNIT_TYPE)))
                }
                checked[version] = "$component, built by ${builders.map { it.definingClass + "->" + it.name }}"
            }
        }
        assertEquals("a declared build went unchecked: $checked", versions.toSet(), checked.keys)
    }
}
