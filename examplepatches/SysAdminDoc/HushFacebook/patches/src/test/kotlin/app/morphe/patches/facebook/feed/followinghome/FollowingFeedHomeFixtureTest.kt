/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.followinghome

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Following feed on Home on every Facebook build the bundle declares: the news feed parameter
 * builder found by the trace section it opens, static with the feed type second, the feed types
 * the extension looks up by name kept as public constants, and the hook first thing in the
 * builder, with the feed type through the extension and back into its parameter before any of
 * Facebook's code runs. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class FollowingFeedHomeFixtureTest {
    private fun bundles(check: (File) -> Unit) {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                check(bundle)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    @Test
    fun `each declared build asks the extension for Home's feed type first thing`() = bundles { bundle ->
        val name = bundle.name
        val holders = FixtureDex.classesHolding(bundle, PAGED_NEWSFEED_PARAMS).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        val builder = newsFeedParams(holders)
        val where = "$name: ${builder.definingClass}->${builder.name}"
        assertTrue("$where isn't static", AccessFlags.STATIC.isSet(builder.accessFlags))
        assertEquals("$where: the feed type isn't second", HOME_FEED_TYPE_CLASS, builder.parameterTypes[1].toString())
        // The feed style it sets for the Following feed is what makes the swap a Following request.
        assertTrue("$where sets no FOLLOWING_FEED style", holdsString(builder, "FOLLOWING_FEED"))
        assertTrue("$where has no local register for the hook", builder.localRegisterCount() >= 1)

        val feedTypes = FixtureDex.classes(bundle, setOf(HOME_FEED_TYPE_CLASS)).values.single()
        assertNull("$name: FeedType can't answer the lookup", feedTypeRefusal(feedTypes))
        // FeedType's toString is the name each feed type keeps, which is what the lookup compares.
        val toString = feedTypes.methods.single { it.name == "toString" && it.parameterTypes.isEmpty() }
        assertTrue("$name: FeedType's toString isn't the kept name's", toString.implementation!!.instructions.any {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { call ->
                call.name == "toString" && call.definingClass == "Ljava/lang/Object;"
            } == true
        })

        val context = PatchContexts.of(listOf(FixtureDex.classes(bundle, setOf(builder.definingClass)).values.single()))
        val method = context.mutableClassDefBy(builder.definingClass).methods.single {
            it.name == builder.name && it.parameterTypes.map(CharSequence::toString) == builder.parameterTypes.map(CharSequence::toString)
        }
        val original = method.implementation!!.instructions.toList()
        method.askForHomeFeed()
        val patched = method.implementation!!.instructions.toList()
        val feedType = method.implementation!!.registerCount - builder.parameterTypes.size + 1
        assertEquals("$where gains five instructions", original.size + 5, patched.size)
        assertEquals("$where: the feed type is read", listOf(Opcode.MOVE_OBJECT_FROM16, 0, feedType),
            (patched[0] as TwoRegisterInstruction).let { listOf(it.opcode, it.registerA, it.registerB) })
        assertEquals("$where: the extension is asked", FEED_TYPE_ASKED, (patched[1] as ReferenceInstruction).reference.toString())
        assertEquals("$where: with the feed type", listOf(1, 0), (patched[1] as FiveRegisterInstruction).let {
            listOf(it.registerCount, it.registerC)
        })
        assertEquals("$where: its answer is kept as a feed type", listOf(Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST),
            patched.subList(2, 4).map { it.opcode })
        assertEquals("$where: and put back where the feed type was", listOf(Opcode.MOVE_OBJECT_FROM16, feedType, 0),
            (patched[4] as TwoRegisterInstruction).let { listOf(it.opcode, it.registerA, it.registerB) })
        assertEquals("$where: Facebook's code stays", original.map { it.opcode }, patched.drop(5).map { it.opcode })
    }
}
