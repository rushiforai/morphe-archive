/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.ads

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Hide ads on each declared build: the messages controller's `getSponsoredMessages(long)`,
 * `VideoAds.load()` and global search's sponsored accounts request are all there, found by what
 * they build rather than by name, and the patch, run over the build's own classes, puts the
 * extension's question in front of each one and leaves the rest of the method alone.
 */
class HideAdsFixtureTest {
    private val videoAds = "Lorg/telegram/messenger/video/VideoAds;"
    private val ads = "Lapp/hushtelegram/extension/telegram/ads/Ads;"

    @Test
    fun `each declared build has all three ad requests, and the patch hooks them with nothing left to warn about`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val classes = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER, videoAds))
            assertEquals("$where: the messages controller and VideoAds", setOf(MESSAGES_CONTROLLER, videoAds), classes.keys)
            val searchClass = FixtureDex.classesWhere(build, { true }, ::asksForSponsoredPeers).single()

            val sponsored = classes.getValue(MESSAGES_CONTROLLER).methods.single { method ->
                method.returnType == "Lorg/telegram/messenger/MessagesController\$SponsoredMessagesInfo;" &&
                    method.parameterTypes == listOf("J")
            }
            val video = classes.getValue(videoAds).methods.single { it.name == "load" && it.parameterTypes.isEmpty() }
            val search = searchClass.methods.single(::asksForSponsoredPeers)

            val context = PatchContexts.of(ExtensionDex.classes() + classes.values + searchClass)
            val warnings = PatchLogCapture.warnings { hideAdsPatch.execute(context) }
            assertEquals("$where: the patch log", emptyList<String>(), warnings)

            assertSearchHooked(
                "$where: search", search,
                context.mutableClassDefBy(searchClass.type).methods.single { it.sameSignatureAs(search) },
            )

            assertHooked(
                "$where: getSponsoredMessages", sponsored,
                context.mutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.sameSignatureAs(sponsored) },
                "$ads->skipSponsoredMessages()Z", listOf(Opcode.CONST_4, Opcode.RETURN_OBJECT),
            )
            assertHooked(
                "$where: VideoAds.load", video,
                context.mutableClassDefBy(videoAds).methods.single { it.sameSignatureAs(video) },
                "$ads->skipVideoAds()Z", listOf(Opcode.RETURN_VOID),
            )

            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hideAds" }.instructions()
            assertEquals("$where: SettingsStatus.hideAds() answers true first", Opcode.CONST_4, status[0].opcode)
            assertEquals(1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.RETURN, status[1].opcode)
            // A family flag alone can't prove all three independent targets were inserted.
            for (target in listOf("channelAds", "videoAds", "searchAds")) {
                val capability = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == target }.instructions()
                assertEquals("$where: $target is an injected build fact", Opcode.CONST_4, capability[0].opcode)
                assertEquals("$where: missing $target coverage", 1, (capability[0] as NarrowLiteralInstruction).narrowLiteral)
                assertEquals(Opcode.RETURN, capability[1].opcode)
            }
        }
    }

    /**
     * [patched] starts with a call to [hook], reads its answer, skips the early return when it's
     * false, and otherwise runs [earlyReturn] before falling into every instruction [original] had,
     * unmoved.
     */
    private fun assertHooked(where: String, original: Method, patched: Method, hook: String, earlyReturn: List<Opcode>) {
        val before = original.instructions()
        val after = patched.instructions()
        val head = earlyReturn.size + 3
        assertEquals("$where: instructions added", before.size + head, after.size)
        assertEquals("$where: asks the extension first", Opcode.INVOKE_STATIC, after[0].opcode)
        assertEquals(hook, (after[0] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.MOVE_RESULT, after[1].opcode)
        assertEquals(Opcode.IF_EQZ, after[2].opcode)
        assertEquals("$where: the early return", earlyReturn, after.subList(3, head).map { it.opcode })
        assertEquals("$where: nothing else moved", before.map { it.opcode }, after.subList(head, after.size).map { it.opcode })
    }

    /**
     * [patched] asks the extension just before it builds `contacts.getSponsoredPeers`, and on true
     * jumps to the `goto` right above, Telegram's own way past the request. Every branch that led
     * to the request leads to the question now, so none can reach the request without asking, and
     * nothing else moved.
     */
    private fun assertSearchHooked(where: String, original: Method, patched: Method) {
        val before = original.instructions()
        val after = patched.instructions()
        assertEquals("$where: instructions added", before.size + 3, after.size)
        val hook = after.indexOfFirst { it.opcode == Opcode.INVOKE_STATIC && (it as ReferenceInstruction).reference.toString() == "$ads->skipSearchAds()Z" }
        assertTrue("$where: asks the extension", hook > 0)
        assertEquals(listOf(Opcode.MOVE_RESULT, Opcode.IF_NEZ, Opcode.NEW_INSTANCE), after.subList(hook + 1, hook + 4).map { it.opcode })
        assertEquals(GET_SPONSORED_PEERS, (after[hook + 3] as ReferenceInstruction).reference.toString())
        assertEquals("$where: the skip is Telegram's own goto", Opcode.GOTO, after[hook - 1].opcode)

        val targets = branchTargets(patched)
        assertEquals("$where: true jumps to that goto", hook - 1, targets.getValue(hook + 2))
        val sendIndex = after.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString()?.contains("ConnectionsManager;->sendRequest(") == true }
        assertTrue("$where: the goto lands past the send", targets.getValue(hook - 1) > sendIndex)
        assertTrue("$where: no branch reaches the request without asking", targets.values.none { it == hook + 3 })
        assertEquals("$where: the branches that led to the request lead to the question", branchTargets(original).values.count { it == hook }, targets.values.count { it == hook })
        assertEquals("$where: nothing else moved", before.map { it.opcode }, (after.subList(0, hook) + after.subList(hook + 3, after.size)).map { it.opcode })
    }

    /** Each branch or goto's index, mapped to the index it jumps to. */
    private fun branchTargets(method: Method): Map<Int, Int> {
        val instructions = method.instructions()
        val address = IntArray(instructions.size + 1)
        instructions.forEachIndexed { i, it -> address[i + 1] = address[i] + it.codeUnits }
        return instructions.withIndex()
            .filter { (_, it) -> it is OffsetInstruction && it.opcode != Opcode.FILL_ARRAY_DATA && it.opcode != Opcode.PACKED_SWITCH && it.opcode != Opcode.SPARSE_SWITCH }
            .associate { (i, it) -> i to address.indexOf(address[i] + (it as OffsetInstruction).codeOffset) }
    }

    private fun asksForSponsoredPeers(method: Method) = method.parameterTypes.map { it.toString() } == listOf("I", "Ljava/lang/String;") &&
        method.instructions().any { it.opcode == Opcode.NEW_INSTANCE && (it as ReferenceInstruction).reference.toString() == GET_SPONSORED_PEERS }

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Method.sameSignatureAs(other: Method) = name == other.name && returnType == other.returnType &&
        parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }
}
