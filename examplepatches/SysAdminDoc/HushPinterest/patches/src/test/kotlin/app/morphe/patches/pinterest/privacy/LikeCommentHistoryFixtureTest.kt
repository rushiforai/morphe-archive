/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.privacy

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinterest.misc.extension.localRegisterCount
import app.morphe.patches.pinterest.misc.extension.parameterRegisterNumber
import app.morphe.patches.pinterest.ui.PinPageKit
import app.morphe.patches.pinterest.ui.instructions
import app.morphe.patches.pinterest.ui.passed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderPackedSwitchPayload
import com.android.tools.smali.dexlib2.builder.instruction.BuilderSparseSwitchPayload
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.MethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/** The flags the patch turns on: its switch and its two parts. */
private val HISTORY_FLAGS = listOf("likeCommentHistory", "likeHistory", "commentHistory")

/** The instructions whose offset points at a table after the code rather than at code. */
private val TABLE_USERS = setOf(Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH, Opcode.FILL_ARRAY_DATA)

/** #48: Pinterest's API calls for a reaction sent or taken back and a comment or reply posted, and the hooks in front of them. */
@Category(FixtureTests::class)
class LikeCommentHistoryFixtureTest {
    /** Pinterest's API interfaces that declare a reaction or comment path, and every class that calls one of those methods. */
    private fun read(build: File): List<ClassDef> {
        val paths = COMMENT_POST_PATHS + REACT_PATH
        val services = FixtureDex.classesWhere(build, { true }) { method ->
            method.annotations.any { annotation ->
                annotation.elements.any { element -> (element.value as? StringEncodedValue)?.value?.let { it in paths } == true }
            }
        }
        val keys = PatchContexts.of(services).historyEndpoints().all().map { it.method.identity() }.toSet()
        val callers = FixtureDex.classesWhere(build, { true }) { method ->
            method.implementation?.instructions?.any { instruction ->
                (instruction.opcode == Opcode.INVOKE_INTERFACE || instruction.opcode == Opcode.INVOKE_INTERFACE_RANGE) &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).identity() in keys
            } == true
        }
        return (services + callers).distinctBy { it.type }
    }

    private fun mutableOf(context: BytecodePatchContext, method: Method) =
        context.mutableClassDefBy(method.definingClass).methods.single {
            it.name == method.name && it.returnType == method.returnType &&
                it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
        }

    /**
     * Where each branch and switch case of [code] lands, in the order they appear. A switch's own
     * offset names its table, data after the code, not a place anything jumps to: the table sits on
     * a four-byte boundary, so added code of an odd length moves it by an alignment nop.
     */
    private fun targets(code: MethodImplementation): List<Int> = MutableMethodImplementation(code).instructions.flatMap { instruction ->
        when (instruction) {
            is BuilderOffsetInstruction ->
                if (instruction.opcode in TABLE_USERS) emptyList() else listOf(instruction.target.location.index)
            is BuilderPackedSwitchPayload -> instruction.switchElements.map { it.target.location.index }
            is BuilderSparseSwitchPayload -> instruction.switchElements.map { it.target.location.index }
            else -> emptyList()
        }
    }

    /** The register the stock call passes [site]'s declared parameter [parameter] in. */
    private fun stockArgument(site: HistorySite, parameter: Int): Int {
        val call = site.method.instructions()[site.at]
        return call.passed()[1 + site.endpoint.method.parameterTypes.take(parameter).sumOf { historySlots(it) }]
    }

    @Test
    fun `each declared APK tells the extension about each like, unlike, comment and reply right before Pinterest sends it`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = read(build)
            val clean = PatchContexts.of(classes)
            val endpoints = clean.historyEndpoints()
            val sites = clean.historySites(endpoints.all())
            val likes = likeSites(endpoints, sites)
            val comments = sites.filter { site -> endpoints.comments.any { it === site.endpoint } }
            assertTrue("${build.name}: a comment on a pin", comments.any { it.endpoint.path == PIN_COMMENT_PATH })
            assertTrue("${build.name}: a reply", comments.any { it.endpoint.path == REPLY_PATH })

            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            likeCommentHistoryPatch.execute(context)
            for (flag in HISTORY_FLAGS) assertEquals("${build.name}: $flag", 1, PinPageKit.flag(context, flag))

            // How many instructions go in front of each site: two for the reaction sent, one for the rest.
            val all = listOf(likes.react, likes.unreact) + comments
            fun size(site: HistorySite) = if (site === likes.react) 2 else 1
            for (group in all.groupBy { it.method.identity() }.values) {
                val method = group.first().method
                val before = method.instructions()
                val after = PinPageKit.patched(context, method)
                val injected = mutableSetOf<Int>()
                var shift = 0
                for (site in group.sortedBy { it.at }) {
                    val start = site.at + shift
                    val stock = before[site.at]
                    val where = "${build.name}: ${method.name} at ${site.at}"
                    when {
                        site === likes.react -> {
                            val copy = after[start] as TwoRegisterInstruction
                            assertEquals(where, Opcode.MOVE_OBJECT_FROM16, after[start].opcode)
                            assertEquals("$where: the pin model parameter is copied", method.parameterRegisterNumber(likes.model), copy.registerB)
                            val scratch = copy.registerA
                            assertTrue("$where: v$scratch is a local", scratch < method.localRegisterCount())
                            assertTrue("$where: v$scratch is none of the call's own", scratch !in stock.passed())
                            assertEquals(where, LIKE_SENT_HOOK, PinPageKit.target(after[start + 1]))
                            assertEquals("$where: the model, the pin's id and the reaction type",
                                listOf(scratch, stockArgument(site, site.endpoint.pin), stockArgument(site, site.endpoint.extra!!)),
                                after[start + 1].passed())
                        }
                        site === likes.unreact -> {
                            assertEquals(where, LIKE_REMOVED_HOOK, PinPageKit.target(after[start]))
                            assertEquals("$where: the pin's id", listOf(stockArgument(site, site.endpoint.pin)), after[start].passed())
                        }
                        else -> {
                            val hook = if (site.endpoint.path == REPLY_PATH) REPLY_POSTED_HOOK else COMMENT_POSTED_HOOK
                            assertEquals(where, hook, PinPageKit.target(after[start]))
                            assertEquals("$where: the pin's id and the text",
                                listOf(stockArgument(site, site.endpoint.pin), stockArgument(site, site.endpoint.extra!!)),
                                after[start].passed())
                        }
                    }
                    val call = after[start + size(site)]
                    assertEquals("$where: Pinterest's call follows", PinPageKit.target(stock), PinPageKit.target(call))
                    assertEquals("$where: with its own registers", stock.passed(), call.passed())
                    injected += start until start + size(site)
                    shift += size(site)
                }
                assertEquals("${build.name}: ${method.name} is otherwise Pinterest's", PinPageKit.kinds(before),
                    PinPageKit.kinds(after.filterIndexed { index, _ -> index !in injected }))
                // Every branch lands where it did, moved past the hooks above it. One that landed on a
                // call lands on its hook, so the hook can't be jumped over.
                val stockTargets = targets(method.implementation!!)
                val expected = stockTargets.map { target -> target + group.filter { it.at < target }.sumOf { size(it) } }
                assertEquals("${build.name}: ${method.name}'s branches", expected, targets(mutableOf(context, method).implementation!!))
                for (site in group) {
                    val hookStart = site.at + group.filter { it.at < site.at }.sumOf { size(it) }
                    assertTrue("${build.name}: a branch skips the hook at ${site.at}",
                        expected.none { it in hookStart + 1..hookStart + size(site) })
                }
            }
        }
    }

    @Test
    fun `a missing stub or no reaction or comment calls refuse with Pinterest's code untouched`() {
        val classes = read(Fixtures.declaredBuilds().last())
        val endpoints = PatchContexts.of(classes).historyEndpoints()
        val services = endpoints.all().map { it.method.definingClass }.toSet()
        val cases = linkedMapOf(
            "no likeCommentHistory stub" to (PinPageKit.extensionWithout("likeCommentHistory") + classes to "likeCommentHistory"),
            "no likeHistory stub" to (PinPageKit.extensionWithout("likeHistory") + classes to "likeHistory"),
            "no commentHistory stub" to (PinPageKit.extensionWithout("commentHistory") + classes to "commentHistory"),
            "no hooks in the extension" to (ExtensionDex.classes().filter { it.type != ACTIVITY_HISTORY } + classes to ACTIVITY_HISTORY),
            "no API interfaces" to (ExtensionDex.classes() + classes.filter { it.type !in services } to "neither part"),
        )
        for ((reason, case) in cases) {
            val (input, message) = case
            val context = PatchContexts.of(input)
            val thrown = assertThrows(reason, PatchException::class.java) { likeCommentHistoryPatch.execute(context) }
            assertTrue("$reason: ${thrown.message}", thrown.message.orEmpty().contains(message))
            for (flag in HISTORY_FLAGS) assertEquals("$reason: $flag", 0, PinPageKit.flagOrZero(context, flag))
            assertUntouched(reason, context, classes, input)
        }
    }

    @Test
    fun `without the reaction calls the comments still go in, and without the comment calls the likes do`() {
        val classes = read(Fixtures.declaredBuilds().last())
        val endpoints = PatchContexts.of(classes).historyEndpoints()
        val likeServices = (endpoints.react + endpoints.unreact).map { it.method.definingClass }.toSet()
        val commentServices = endpoints.comments.map { it.method.definingClass }.toSet()
        assertTrue("the reaction and comment calls share an interface, so neither can go alone", likeServices.intersect(commentServices).isEmpty())
        for ((gone, left) in listOf(likeServices to "commentHistory", commentServices to "likeHistory")) {
            val input = ExtensionDex.classes() + classes.filter { it.type !in gone }
            val context = PatchContexts.of(input)
            likeCommentHistoryPatch.execute(context)
            assertEquals("$left without $gone", 1, PinPageKit.flag(context, "likeCommentHistory"))
            assertEquals("$left without $gone", 1, PinPageKit.flag(context, left))
            val missing = if (left == "likeHistory") "commentHistory" else "likeHistory"
            assertEquals("$missing without $gone", 0, PinPageKit.flag(context, missing))
            // The part left out leaves its call sites as Pinterest wrote them.
            val sites = PatchContexts.of(classes).historySites(endpoints.all()).filter { site ->
                site.endpoint.method.definingClass in gone
            }
            assertTrue(sites.isNotEmpty())
            val unwanted = if (missing == "likeHistory") setOf(LIKE_SENT_HOOK, LIKE_REMOVED_HOOK)
                else setOf(COMMENT_POSTED_HOOK, REPLY_POSTED_HOOK)
            for (site in sites) {
                val hooks = PinPageKit.patched(context, site.method).map { PinPageKit.target(it) }
                assertTrue("$missing: ${site.method.name} got a hook", hooks.none { it in unwanted })
            }
        }
    }

    private fun assertUntouched(reason: String, context: BytecodePatchContext, classes: List<ClassDef>, input: List<ClassDef>) {
        val present = input.map { it.type }.toSet()
        for (method in classes.filter { it.type in present }.flatMap { it.methods }.filter { it.implementation != null }) {
            assertEquals("$reason changed ${method.definingClass}->${method.name}",
                method.instructions().map { it.opcode }, PinPageKit.patched(context, method).map { it.opcode })
        }
    }
}
