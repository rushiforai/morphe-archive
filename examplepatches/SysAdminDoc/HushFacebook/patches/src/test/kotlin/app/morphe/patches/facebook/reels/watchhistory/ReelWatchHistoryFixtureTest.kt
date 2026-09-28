/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels.watchhistory

import app.morphe.Fixtures
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.shared.redexOriginalName
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.literalReads
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * The send point of Don't send reel watch history on every Facebook build the bundle declares, and
 * where the hook sits in it: after the batcher has emptied its queue and chosen and built the
 * mutation, and before the request is handed to the network layer, which only the send the hook
 * decides on ever does. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class ReelWatchHistoryFixtureTest {
    private class Found {
        /** Every class with a method loading the mutation's name, and how many such methods. */
        val holders = mutableListOf<ClassDef>()
        var holdingMethods = 0

        /** Every class Redex left the send's name on, by type. */
        val sends = mutableMapOf<String, ClassDef>()
    }

    private val paramSet = "Lcom/facebook/graphql/query/GraphQlQueryParamSet;"
    private val futures = setOf(
        "Lcom/google/common/util/concurrent/SettableFuture;",
        "Lcom/google/common/util/concurrent/ListenableFuture;",
    )

    /** One pass over the bundle; only the dex files holding either literal are walked. */
    private fun scan(bundle: File): Found {
        val found = Found()
        FixtureDex.forEach(bundle) { dex ->
            val strings = dex.stringSection.filterTo(HashSet()) { it == SEEN_STATE_MUTATION || it == SEEN_STATE_SEND }
            if (strings.isEmpty()) return@forEach
            for (classDef in dex.classes) {
                if (SEEN_STATE_MUTATION in strings) {
                    val holding = classDef.methods.count { holdsString(it, SEEN_STATE_MUTATION) }
                    if (holding > 0) {
                        found.holdingMethods += holding
                        found.holders += ImmutableClassDef.of(classDef)
                    }
                }
                if (SEEN_STATE_SEND in strings && redexOriginalName(classDef) == SEEN_STATE_SEND) {
                    found.sends[classDef.type] = ImmutableClassDef.of(classDef)
                }
            }
        }
        return found
    }

    private val Instruction.call: MethodReference?
        get() = (this as? ReferenceInstruction)?.reference as? MethodReference

    /** An instruction as text: its opcode, registers, reference and any literal or offset. */
    private fun render(instruction: Instruction): String = buildString {
        append(instruction.opcode.name).append(' ').append(instruction.namedRegisters())
        (instruction as? ReferenceInstruction)?.let { append(' ').append(it.reference) }
        (instruction as? NarrowLiteralInstruction)?.let { append(" #").append(it.narrowLiteral) }
        (instruction as? WideLiteralInstruction)?.let { append(" #").append(it.wideLiteral) }
        (instruction as? OffsetInstruction)?.let { append(" ->").append(it.codeOffset) }
    }

    @Test
    fun `each declared build hands the seen-state send over once, after the mutation is chosen and before the network`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val found = scan(bundle)

                // The anchors: one method names the mutation, one class carries the send's Redex
                // name, and the patch's own lookup finds exactly one send point.
                assertEquals("$name: methods loading \"$SEEN_STATE_MUTATION\"", 1, found.holdingMethods)
                assertEquals("$name: classes Redex named $SEEN_STATE_SEND", 1, found.sends.size)
                val points = found.holders.flatMap { owner ->
                    owner.methods.mapNotNull { method -> sendPoint(method) { found.sends[it] }?.let { Triple(owner, method, it) } }
                }
                assertEquals("$name: send points", 1, points.size)
                val (owner, flush, send) = points.single()
                val code = flush.implementation!!.instructions.toList()

                // The queue is emptied before anything else: every Set the batcher keeps is cleared,
                // and every clear comes before the mutation is named. A batch the hook holds back is
                // already out of the queue, so nothing keeps it for a later send.
                val named = code.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == SEEN_STATE_MUTATION }
                val queues = owner.fields.filter { it.type == "Ljava/util/Set;" && !AccessFlags.STATIC.isSet(it.accessFlags) }
                val clears = code.indices.filter { code[it].call?.let { c -> c.definingClass == "Ljava/util/Set;" && c.name == "clear" } == true }
                assertTrue("$name: the batcher keeps no queue", queues.isNotEmpty())
                assertEquals("$name: queues cleared", queues.size, clears.size)
                assertTrue("$name: a queue is cleared after the mutation is named", clears.all { it < named })

                // The mutation is chosen: its name goes into the query's constructor and nowhere else.
                val nameReads = flush.literalReads(named)
                assertEquals("$name: readers of the mutation's name", 1, nameReads.size)
                val queryInit = nameReads.single()
                val query = code[queryInit].call!!
                assertEquals("$name: the name isn't a constructor argument", "<init>", query.name)

                // The request is built from the query, by one static call taking the parameter set
                // and the query, and it goes nowhere but into the send's constructor.
                val builds = code.indices.filter { index ->
                    code[index].opcode == Opcode.INVOKE_STATIC &&
                        code[index].call!!.parameterTypes.map { it.toString() } == listOf(paramSet, query.definingClass)
                }
                assertEquals("$name: request builds", 1, builds.size)
                val build = builds.single()
                assertEquals("$name: the request isn't kept", Opcode.MOVE_RESULT_OBJECT, code[build + 1].opcode)
                val request = code[build].call!!.returnType
                val requestReads = flush.literalReads(build + 1)
                assertEquals("$name: readers of the request", 1, requestReads.size)
                val sendInit = requestReads.single()
                val sendType = code[sendInit].call!!.definingClass
                assertEquals("$name: the request goes into something other than a constructor", "<init>", code[sendInit].call!!.name)
                assertTrue("$name: $sendType isn't the send Redex named", sendType in found.sends)

                // The send is a new instance of that runnable, built with the request and handed to
                // the executor at the send point, and read by nothing else.
                val created = code.indices.filter { index ->
                    code[index].opcode == Opcode.NEW_INSTANCE && ((code[index] as ReferenceInstruction).reference as TypeReference).type == sendType
                }
                assertEquals("$name: sends built", 1, created.size)
                assertEquals("$name: readers of the send", listOf(sendInit, send), flush.literalReads(created.single()))
                assertTrue("$name: out of order", named < queryInit && queryInit < build && build < sendInit && sendInit < send)

                // Nothing before the send point reaches the network: no call in the flush answers a
                // future, which is what Facebook's GraphQL layer hands back for a request.
                val futureCalls = code.mapNotNull { it.call?.takeIf { call -> call.returnType in futures } }
                assertEquals("$name: the flush sends something itself", emptyList<MethodReference>(), futureCalls)

                // The send's run() is where the request is handed to the network layer: it reads the
                // request back and passes it straight to one static call answering a SettableFuture.
                val sender = found.sends.getValue(sendType)
                val run = sender.methods.single { it.name == "run" && it.parameterTypes.isEmpty() && it.returnType == "V" }
                val runCode = run.implementation!!.instructions.toList()
                val reads = runCode.indices.filter { index ->
                    runCode[index].opcode == Opcode.IGET_OBJECT &&
                        ((runCode[index] as ReferenceInstruction).reference as FieldReference).type == request
                }
                assertEquals("$name: reads of the request in run()", 1, reads.size)
                val handOff = run.literalReads(reads.single())
                assertEquals("$name: readers of the request in run()", 1, handOff.size)
                val network = runCode[handOff.single()]
                assertEquals("$name: the hand-off to the network", Opcode.INVOKE_STATIC, network.opcode)
                assertEquals("$name: the hand-off to the network", "Lcom/google/common/util/concurrent/SettableFuture;", network.call!!.returnType)

                // The hook, put in the way the patch puts it: it takes the hand-over's place with the
                // same two registers, the executor call is gone, and nothing else in the flush moves.
                val patched = MutableMethod(flush)
                patched.withholdSendAt(send)
                val after = patched.implementation!!.instructions.toList()
                assertEquals("$name: instructions added", code.size, after.size)
                assertEquals("$name: the hook", SEND, after[send].call!!.let {
                    it.definingClass + "->" + it.name + it.parameterTypes.joinToString("", "(", ")") + it.returnType
                })
                assertEquals("$name: the hook's registers", code[send].callRegisters(), after[send].callRegisters())
                assertTrue("$name: an executor call is left", after.none { it.isExecute() })
                for (index in code.indices) {
                    if (index != send) assertEquals("$name: instruction $index changed", render(code[index]), render(after[index]))
                }
                // So the only way the send reaches the executor is the hook, after the mutation is
                // chosen and built.
                assertEquals("$name: readers of the patched send", listOf(sendInit, send), patched.literalReads(created.single()))
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
