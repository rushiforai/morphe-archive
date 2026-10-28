/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.direct.reels

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
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

class SwipeChatReelsHookTest {
    private val session = "Lcom/instagram/common/session/UserSession;"
    private val configs = "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;"
    private val gates = "Lfixture/Gates;"
    private val opener = "Lfixture/Opener;"
    private val flagHex = CHAT_REELS_FLAG.toString(16)

    /** The hook the patch writes is in the ChatReels the bundle ships, public and static. */
    @Test
    fun theHookIsInTheExtension() {
        val declared = ExtensionDex.classDef(CHAT_REELS).methods
            .filter { AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) }
            .map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        assertTrue("$CHAIN is not in the extension: $declared", CHAIN.substringAfter("->") in declared)
    }

    /** The chat reels test gets its flag answered through the extension, and nothing else changes. */
    @Test
    fun theTestIsAnswered() {
        val context = PatchContexts.of(classes())

        context.chainChatReels()

        assertAnswered("stand-in", context.mutableClassDefBy(gates).methods.single { it.name == "chain" })
        val asks = context.mutableClassDefBy(opener).methods.single().code()
        assertTrue("the opener was touched", asks.none { it.referenceText() == CHAIN })
    }

    /** A build the patch can't read fails at patch time, saying what it found, before anything is written. */
    @Test
    fun aBuildThePatchCantReadFailsBeforeAnythingChanges() {
        val test = "$gates->chain"
        val cases = listOf(
            classes(reads = 0) to "expected one read of the chat reels flag $flagHex, found 0",
            classes(reads = 2) to "expected one read of the chat reels flag $flagHex, found 2",
            classes(flag = CHAT_REELS_FLAG + 1) to "expected one read of the chat reels flag $flagHex, found 0",
            classes(sharedRead = true) to "the read of $flagHex in $test is shared with another flag",
            classes(takes = "Ljava/lang/Object;") to "$flagHex is read in $test(Ljava/lang/Object;)Z, not in a test of the session",
            classes(openerTakes = listOf(THREAD_KEY)) to "nothing handed a chat and a message asks $test, so it isn't the chat reels test",
            classes(openerAsks = false) to "nothing handed a chat and a message asks $test, so it isn't the chat reels test",
        )
        for ((classes, expected) in cases) {
            val context = PatchContexts.of(classes)
            val failure = assertThrows(expected, PatchException::class.java) { context.chainChatReels() }
            assertTrue("$expected: ${failure.message}", failure.message!!.contains(expected))
            val written = classes.map { it.type }.distinct().flatMap { type -> context.mutableClassDefBy(type).methods }
                .filter { method -> method.code().any { it.referenceText() == CHAIN } }
            assertTrue("$expected: something was written to $written", written.isEmpty())
        }
    }

    /**
     * In each declared build the flag's one read is in a test of the session that the opener of a
     * reel shared in a chat asks, and it's answered.
     */
    @Test
    fun eachDeclaredBuildChainsAChatsReels() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
                builds(bundle, bundle.name)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    @Test
    fun eachOtherBuildChainsAChatsReelsToo() {
        for (base in Fixtures.otherBuilds()) builds(base, base.parentFile.name)
    }

    private fun builds(bundle: File, label: String) {
        val holders = mutableListOf<ClassDef>()
        FixtureDex.forEach(bundle) { dex ->
            for (classDef in dex.classes) {
                val opens = classDef.methods.any { m ->
                    val takes = m.parameterTypes.map(CharSequence::toString)
                    THREAD_KEY in takes && MESSAGE_ID in takes
                }
                if (opens || classDef.methods.any { it.loadsTheFlag() }) holders += ImmutableClassDef.of(classDef)
            }
        }
        val loading = holders.filter { c -> c.methods.any { it.loadsTheFlag() } }
        assertEquals("${label}: classes loading $flagHex", 1, loading.size)
        val context = PatchContexts.of(holders)

        val read = context.findChatReels()
        context.chainChatReels()

        val patched = context.mutableClassDefBy(read.type).methods
        assertAnswered(label, patched.single { it.name == read.name && it.parameterTypes.map(CharSequence::toString) == listOf(session) })
        assertEquals("${label}: methods hooked", 1, patched.count { m -> m.code().any { it.referenceText() == CHAIN } })
    }

    /** Right after the flag's move-result: the range call with that register, and its answer back in it. */
    private fun assertAnswered(what: String, method: Method) {
        val code = method.code()
        val load = code.indexOfFirst { it.opcode == Opcode.CONST_WIDE && (it as WideLiteralInstruction).wideLiteral == CHAT_REELS_FLAG }
        assertTrue("$what: no load of $flagHex", load >= 0)
        val result = (load + 1 until code.size).first { code[it].opcode == Opcode.MOVE_RESULT }
        val register = (code[result] as OneRegisterInstruction).registerA
        assertEquals("$what: hooks", 1, code.count { it.referenceText() == CHAIN })
        assertEquals("$what: the call", Opcode.INVOKE_STATIC_RANGE, code[result + 1].opcode)
        assertEquals("$what: the hook", CHAIN, code[result + 1].referenceText())
        assertEquals("$what: what it's handed", register, (code[result + 1] as RegisterRangeInstruction).startRegister)
        assertEquals("$what: the answer", Opcode.MOVE_RESULT, code[result + 2].opcode)
        assertEquals("$what: the register", register, (code[result + 2] as OneRegisterInstruction).registerA)
    }

    /**
     * Gates shaped like Instagram 452.1's 02JG: a test taking the session reads [CHAT_REELS_FLAG]
     * through a cast config and answers it. An opener handed a chat and a message asks it.
     */
    private fun classes(
        reads: Int = 1,
        flag: Long = CHAT_REELS_FLAG,
        sharedRead: Boolean = false,
        takes: String = session,
        openerTakes: List<String> = listOf(THREAD_KEY, MESSAGE_ID),
        openerAsks: Boolean = true,
    ): List<ClassDef> {
        val readFlag = List(reads) {
            """
                invoke-static {v4}, Lfixture/Configs;->of(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v2
                ${if (sharedRead) "if-eqz v2, :cast$it" else ""}
                const-wide v0, 0x${flag.toString(16)}L
                ${if (sharedRead) ":cast$it" else ""}
                check-cast v2, $configs
                invoke-interface {v2, v0, v1}, $configs->Bae(J)Z
                move-result v0
            """.trimIndent()
        }.joinToString("\n")
        // Three locals, this in v3, the session in v4.
        val test = method(
            gates, "chain", listOf(takes), "Z", 3, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            if (reads == 0) "const/4 v0, 0x0\nreturn v0" else "$readFlag\nreturn v0",
        )
        // One local, this in v1, then the chat, the message and the gates.
        val open = method(
            opener, "open", openerTakes + gates, "V", 1, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            if (openerAsks) {
                "const/4 v0, 0x0\ninvoke-virtual {p${openerTakes.size + 1}, v0}, $gates->chain($takes)Z\nreturn-void"
            } else {
                "return-void"
            },
        )
        return listOf(classDef(gates, listOf(test)), classDef(opener, listOf(open)))
    }

    private fun method(owner: String, name: String, parameters: List<String>, returns: String, registers: Int, flags: Int, body: String): Method {
        val total = registers + 1 + parameters.size
        val mutable = MutableMethod(
            ImmutableMethod(
                owner, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returns, flags, null, null,
                ImmutableMethodImplementation(total, emptyList(), null, null),
            ),
        )
        mutable.addInstructionsWithLabels(0, body.lines().filter { it.isNotBlank() }.joinToString("\n") { it.trim() })
        return ImmutableMethod.of(mutable)
    }

    private fun classDef(type: String, methods: List<Method>): ClassDef =
        ImmutableClassDef(type, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, "Ljava/lang/Object;", null, null, null, null, methods)

    private fun Method.loadsTheFlag(): Boolean = code().any {
        it.opcode == Opcode.CONST_WIDE && (it as WideLiteralInstruction).wideLiteral == CHAT_REELS_FLAG
    }

    private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Instruction.referenceText(): String? = (this as? ReferenceInstruction)?.reference?.toString()
}
