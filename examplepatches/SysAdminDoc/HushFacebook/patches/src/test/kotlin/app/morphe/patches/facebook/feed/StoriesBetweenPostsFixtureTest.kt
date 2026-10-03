/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed

import app.morphe.Fixtures
import app.morphe.RepoFiles
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The kinds of Stories between posts that Hide Stories tray's feed rule names (issue #45), found in
 * the Facebook builds the bundle declares.
 *
 * Every declared build has to carry exactly one `getTypeName()` answering DiscoverFeedUnit, the
 * shared Stories model that also answers StoriesTrayFeedUnit, and that model has to answer the
 * large Stories tile and the single person's Stories viewer for their type tags, through its string
 * table on 577 and 580 and with literals of its own on 581. Its reels showcase case is the
 * control: the same switch, another answer. The
 * extension's rule has to name the same types. Reads the fixture bundles from
 * HUSHFACEBOOK_FIXTURE_DIR and skips without them.
 */
class StoriesBetweenPostsFixtureTest {
    private val storiesTypes = listOf("StoriesOneColumnOneRowLargeTileFeedUnit", "StoriesSingleBucketInlineViewerFeedUnit")
    private val showcase = "ShowcaseFeedUnit"

    private fun isTypeName(method: Method) =
        method.name == "getTypeName" && method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/String;"

    @Test
    fun `every declared build answers the single Stories tile and viewer on the shared Stories model`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableMapOf<String, String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val models = FixtureDex.methodsWhere(bundle, { true }) { method ->
                    isTypeName(method) && holdsString(method, DISCOVER_FEED_UNIT_TYPE)
                }
                assertEquals("${bundle.name}: getTypeName() answering $DISCOVER_FEED_UNIT_TYPE", 1, models.size)
                val model = models.single()
                assertTrue("${bundle.name}: the $DISCOVER_FEED_UNIT_TYPE model isn't the shared Stories one",
                    holdsString(model, "StoriesTrayFeedUnit"))

                val tables = model.implementation!!.instructions.mapNotNull { instruction ->
                    if (instruction.opcode != Opcode.INVOKE_STATIC) return@mapNotNull null
                    (instruction as? ReferenceInstruction)?.reference as? MethodReference
                }.toSet()
                assertTrue("${bundle.name}: the string tables ${model.definingClass} asks: $tables", tables.size <= 1)
                val owners = FixtureDex.classes(bundle, tables.map { it.definingClass }.toSet())
                val resolve = { call: MethodReference -> owners[call.definingClass]?.let { resolveStatic(it, call) } }

                for (type in storiesTypes) {
                    assertTrue("${bundle.name}: ${model.definingClass} doesn't answer $type for its tag",
                        answersTaggedTypeName(model, type, resolve))
                }
                assertEquals("${bundle.name}: the showcase case", showcase,
                    taggedTypeName(model, treeTypeTag(showcase), resolve))
                checked[version] = "${model.definingClass}->getTypeName via ${tables.singleOrNull() ?: "literals"}"
            }
        }
        assertEquals("a declared build went unchecked: $checked", versions.toSet(), checked.keys)
    }

    @Test
    fun `the extension's Stories rule names the same types`() {
        val text = File(RepoFiles.root,
            "extensions/facebook/src/main/java/app/morphe/extension/facebook/feed/FeedFilter.java").readText()
        for (type in storiesTypes) assertTrue("FeedFilter.java doesn't name $type", text.contains("\"$type\""))
    }
}
