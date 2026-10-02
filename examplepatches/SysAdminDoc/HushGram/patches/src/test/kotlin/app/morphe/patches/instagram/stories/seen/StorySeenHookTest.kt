/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.stories.seen

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.instagram.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class StorySeenHookTest {
    private val batch = "Lfixture/PendingReelSeenState;"
    private val store = "Lfixture/PendingReelSeenStateStore;"
    private val requestType = "Lfixture/Request;"
    private val seenPath = "media/seen/?reel=%s&live_vod=0"

    /** The hook the patch writes is in the StorySeen the bundle ships, public and static. */
    @Test
    fun theHookIsInTheExtension() {
        val type = HOLD_BACK.substringBefore("->")
        val declared = ExtensionDex.classDef(type).methods
            .filter { AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) }
            .map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        assertTrue("$HOLD_BACK is not in the extension: $declared", HOLD_BACK.substringAfter("->") in declared)
    }

    /**
     * The send asks first and goes on to its own first instruction when told not to hold back. The
     * store's other methods taking a batch, and the rebuild for a retry, stay as they are.
     */
    @Test
    fun theSendAsksBeforeItBuildsTheRequest() {
        val context = PatchContexts.of(classes())

        context.holdBackStoryViews()

        val patched = context.mutableClassDefBy(store)
        assertGuardFirst("the send", patched.methods.single { it.name == "A0O" }.code())
        for (name in listOf("A0P", "A0Q", "A0J", "A0L")) {
            assertTrue("$name was touched", patched.methods.single { it.name == name }.code().none { it.referenceText() == HOLD_BACK })
        }
    }

    /** A build the patch can't read fails at patch time, with what it found, before anything is written. */
    @Test
    fun aBuildWithoutOneSendFailsBeforeAnythingChanges() {
        val cases = listOf(
            classes(sends = 0) to "found 0",
            classes(sends = 2) to "found 2",
            classes(request = false) to "story seen request",
            classes(storeReader = false) to "pending story seen store",
        )
        for ((classes, expected) in cases) {
            val context = PatchContexts.of(classes)
            val failure = assertThrows(PatchException::class.java) { context.holdBackStoryViews() }
            assertTrue(failure.message!!, failure.message!!.contains(expected))
            val methods = context.classDefByOrNull(store)?.methods?.toList().orEmpty()
            assertTrue("$expected: something was written", methods.none { method -> method.code().any { it.referenceText() == HOLD_BACK } })
        }
    }

    /** In each declared build the one send is found, and it gets the guard first thing. */
    @Test
    fun eachDeclaredBuildHoldsBackTheSend() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
                val holders = (FixtureDex.classesHolding(bundle, seenPath) + FixtureDex.classesHolding(bundle, "pending_reel_seen_states_"))
                    .distinctBy { it.type }
                val context = PatchContexts.of(holders)
                val requestClass = holders.single { holder -> holder.methods.any { method -> method.code().any { it.string() == seenPath } } }
                val storeClass = holders.single { holder -> holder.methods.any { method -> method.code().any { it.string() == "pending_reel_seen_states_" } } }

                context.holdBackStoryViews()

                val guarded = context.mutableClassDefBy(storeClass.type).methods.filter { method ->
                    method.code().any { it.referenceText() == HOLD_BACK }
                }
                assertEquals("${bundle.name}: one method holds the guard", 1, guarded.size)
                val send = guarded.single()
                assertEquals("${bundle.name}: the send takes the batch", listOf(requestClass.type), send.parameterTypes.map(Any::toString))
                val before = storeClass.methods.single { it.name == send.name && it.parameterTypes.map(Any::toString) == listOf(requestClass.type) }
                assertEquals("${bundle.name}: the send's size", before.code().size + 4, send.code().size)
                assertGuardFirst("${bundle.name}: the send", send.code())
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private fun assertGuardFirst(what: String, code: List<Instruction>) {
        assertEquals(
            "$what: the guard's opcodes",
            listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID),
            code.take(4).map { it.opcode },
        )
        assertEquals("$what: the hook called", HOLD_BACK, code[0].referenceText())
        val jump = code[2] as OffsetInstruction
        assertEquals("$what: a no lands on the send's own first instruction", code.take(4).sumOf { it.codeUnits } - code.take(2).sumOf { it.codeUnits }, jump.codeOffset)
    }

    // ---- stand-ins shaped like Instagram 449's -------------------------------------------------

    /**
     * The batch, whose request builder holds the seen path and the force-seen key and whose empty
     * check the send asks first. Then the store: the send, an instance method taking the batch that
     * builds nothing, a static one that does, the rebuild for a retry, which takes an Object, and the
     * disk reader holding the store's strings.
     */
    private fun classes(request: Boolean = true, sends: Int = 1, storeReader: Boolean = true): List<ClassDef> {
        val batchClass = classDef(
            batch,
            listOfNotNull(
                if (request) method(batch, "A04", listOf("Ljava/lang/Object;"), requestType, 3, static = false, body = """
                    const-string v0, "$seenPath"
                    const-string v0, "force_seen_story_ids"
                    const/4 v0, 0x0
                    return-object v0
                """) else null,
                method(batch, "A0A", emptyList(), "Z", 2, static = false, body = """
                    const/4 v0, 0x0
                    return v0
                """),
            ),
        )
        val sendBody = """
            invoke-virtual { p1 }, $batch->A0A()Z
            move-result v0
            if-nez v0, :done
            const/4 v0, 0x0
            invoke-virtual { p1, v0 }, $batch->A04(Ljava/lang/Object;)$requestType
            :done
            return-void
        """
        val storeClass = classDef(
            store,
            listOfNotNull(
                if (storeReader) method(store, "A0L", emptyList(), "V", 2, static = false, body = """
                    const-string v0, "pending_reel_seen_states_"
                    const-string v0, "PendingReelSeenStateStore.deserializeFromDisk"
                    return-void
                """) else null,
                method(store, "A0J", listOf("Ljava/lang/Object;"), requestType, 3, static = false, body = """
                    check-cast p1, $batch
                    const/4 v0, 0x0
                    invoke-virtual { p1, v0 }, $batch->A04(Ljava/lang/Object;)$requestType
                    move-result-object v0
                    return-object v0
                """),
                method(store, "A0P", listOf(batch), "V", 3, static = false, body = """
                    invoke-virtual { p1 }, $batch->A0A()Z
                    return-void
                """),
                method(store, "A0Q", listOf(batch), "V", 2, static = true, body = sendBody.replace("p1", "p0")),
            ) + (0 until sends).map { copy -> method(store, if (copy == 0) "A0O" else "A0R", listOf(batch), "V", 3, static = false, body = sendBody) },
        )
        return listOf(batchClass, storeClass)
    }

    private fun method(owner: String, name: String, parameters: List<String>, returns: String, registers: Int, static: Boolean, body: String): Method {
        val flags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or (if (static) AccessFlags.STATIC.value else 0)
        val mutable = MutableMethod(
            ImmutableMethod(
                owner, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returns, flags, null, null,
                ImmutableMethodImplementation(registers, emptyList(), null, null),
            ),
        )
        mutable.addInstructionsWithLabels(0, body.trimIndent())
        return ImmutableMethod.of(mutable)
    }

    private fun classDef(type: String, methods: List<Method>): ClassDef =
        ImmutableClassDef(type, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, "Ljava/lang/Object;", null, null, null, emptyList(), methods)

    private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Instruction.referenceText(): String? = (this as? ReferenceInstruction)?.reference?.toString()

    private fun Instruction.string(): String? =
        ((this as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.StringReference)?.string
}
