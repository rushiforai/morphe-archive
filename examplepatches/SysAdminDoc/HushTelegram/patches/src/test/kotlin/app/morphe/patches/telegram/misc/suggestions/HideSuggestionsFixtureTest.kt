/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.suggestions

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/** Declared-build presentation hooks, untouched storage, and truthful partial-build flags. */
class HideSuggestionsFixtureTest {
    private val controller = "Lorg/telegram/messenger/MessagesController;"
    private val filter = "Lapp/hushtelegram/extension/telegram/misc/Suggestions;->filterChatList(Ljava/util/Set;)Ljava/util/Set;"
    private val birthday = "Lapp/hushtelegram/extension/telegram/misc/Suggestions;->birthdayGiftBannerDismissed(Z)Z"
    private val flags = listOf("hidePromotionalBanners", "promotionalSuggestions", "birthdayGiftBanner")

    @Test
    fun `each declared build hooks every presentation read and birthday gift check without changing stored suggestions`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val hosts = FixtureDex.classesWhere(build, { true }) { method ->
                method.definingClass.startsWith("Lorg/telegram/ui/") && method.returnType == "V" &&
                    method.parameterTypes.isEmpty() && method.instructions().any { it.reference() == SUGGESTION_FILL } &&
                    method.instructions().any { (it as? ReferenceInstruction)?.reference.let { it as? StringReference }?.string == "BIRTHDAY_SETUP" }
            }
            assertEquals("$where: one independently anchored chat-list renderer", 1, hosts.size)
            val host = hosts.single()
            val original = host.methods.single { it.instructions().any { instruction -> instruction.reference() == SUGGESTION_FILL } }
            val messages = FixtureDex.classes(build, setOf(controller)).getValue(controller)
            assertEquals("$where: pendingSuggestions is a Set", "Ljava/util/Set;", messages.fields.single { it.name == "pendingSuggestions" }.type)
            val context = PatchContexts.of(ExtensionDex.classes() + listOf(host, messages))
            assertEquals("$where: no missing targets", emptyList<String>(), PatchLogCapture.warnings { hideSuggestionsPatch.execute(context) })
            val patched = context.mutableClassDefBy(host.type).methods.single { it.sameSignatureAs(original) }
            val before = original.instructions()
            val after = patched.instructions()
            val reads = before.count { it.opcode == Opcode.IGET_OBJECT && it.reference() == PENDING_SUGGESTIONS }
            assertTrue("$where: the renderer has pending suggestions", reads > 0)
            assertEquals("$where: every read is filtered", reads, after.count { it.reference() == filter })
            assertEquals("$where: one separate birthday gift guard", 1, after.count { it.reference() == birthday })
            assertEquals("$where: only hook pairs are added", before.size + 2 * (reads + 1), after.size)

            val inserted = mutableSetOf<Int>()
            for (index in after.indices.filter { after[it].reference() == filter || after[it].reference() == birthday }) {
                val call = after[index] as RegisterRangeInstruction
                val result = after[index + 1] as OneRegisterInstruction
                assertEquals("$where: one input register", 1, call.registerCount)
                assertEquals("$where: writes back only that same register", call.startRegister, result.registerA)
                assertEquals("$where: correct result type", if (after[index].reference() == filter) Opcode.MOVE_RESULT_OBJECT else Opcode.MOVE_RESULT,
                    after[index + 1].opcode)
                if (after[index].reference() == filter) {
                    assertEquals("$where: filter follows a pending-set read", PENDING_SUGGESTIONS, after[index - 1].reference())
                    assertEquals("$where: filters the set just read", (after[index - 1] as OneRegisterInstruction).registerA, call.startRegister)
                } else {
                    assertEquals(Opcode.MOVE_RESULT, after[index - 1].opcode)
                    assertEquals("$where: preserves the original boolean register", (after[index - 1] as OneRegisterInstruction).registerA, call.startRegister)
                    assertEquals("$where: controls the existing dismissed branch", Opcode.IF_NEZ, after[index + 2].opcode)
                    assertEquals("$where: only the birthday gift membership is overridden", "BIRTHDAY_CONTACTS_TODAY",
                        ((after[index - 3] as ReferenceInstruction).reference as StringReference).string)
                    assertEquals("$where: dismissed set is still read unchanged", DISMISSED_SUGGESTIONS, after[index - 4].reference())
                }
                inserted += index
                inserted += index + 1
            }
            val kept = after.indices.filterNot { it in inserted }
            assertEquals("$where: all original opcodes remain", before.map { it.opcode }, kept.map { after[it].opcode })
            assertEquals("$where: all original references remain", before.map { it.reference() }, kept.map { after[it].reference() })
            assertEquals("$where: the frame is unchanged", original.implementation!!.registerCount, patched.implementation!!.registerCount)
            assertControlFlowUnchanged(where, original, patched, kept)
            for (method in messages.methods) {
                val untouched = context.mutableClassDefBy(controller).methods.single { it.sameSignatureAs(method) }
                assertEquals("$where: controller storage and RPC paths stay unchanged", method.instructions().map { it.opcode }, untouched.instructions().map { it.opcode })
                assertEquals("$where: controller references stay unchanged", method.instructions().map { it.reference() }, untouched.instructions().map { it.reference() })
            }
            flags.forEach { assertFlag(context, it, true) }
        }
    }

    @Test
    fun `each missing target preserves the other capability and warns once`() {
        for ((pending, gift) in listOf(true to false, false to true)) {
            val host = host(pending, gift)
            val context = PatchContexts.of(ExtensionDex.classes() + host)
            val warnings = PatchLogCapture.warnings { hideSuggestionsPatch.execute(context) }
            assertEquals(1, warnings.size)
            assertTrue(warnings.single(), warnings.single().contains(if (pending) "BIRTHDAY_CONTACTS_TODAY" else "pendingSuggestions"))
            assertFlag(context, "hidePromotionalBanners", true)
            assertFlag(context, "promotionalSuggestions", pending)
            assertFlag(context, "birthdayGiftBanner", gift)
        }
    }

    @Test
    fun `no targets refuses the family and changes no host bytecode`() {
        val host = host(pending = false, gift = false)
        val context = PatchContexts.of(ExtensionDex.classes() + host)
        val failure = assertThrows(PatchException::class.java) { hideSuggestionsPatch.execute(context) }
        assertTrue(failure.message, failure.message.orEmpty().contains("none of the 2 chat-list banner targets"))
        assertUnchanged(context, host)
        flags.forEach { assertFlag(context, it, false) }
    }

    @Test
    fun `every missing status method refuses before either presentation hook is inserted`() {
        for (flag in flags) {
            val host = host()
            val context = PatchContexts.of(ExtensionDex.classes() + host)
            context.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == flag }
            val failure = assertThrows(PatchException::class.java) { hideSuggestionsPatch.execute(context) }
            assertTrue(failure.message, failure.message.orEmpty().contains("no boolean method $flag()"))
            assertUnchanged(context, host)
            flags.filterNot { it == flag }.forEach { assertFlag(context, it, false) }
        }
    }

    @Test
    fun `a pending set that escapes refuses that target without suppressing the birthday guard`() {
        val host = host(escapePending = true)
        val context = PatchContexts.of(ExtensionDex.classes() + host)
        val warnings = PatchLogCapture.warnings { hideSuggestionsPatch.execute(context) }
        assertEquals(1, warnings.size)
        assertTrue(warnings.single(), warnings.single().contains("escape their membership check"))
        assertFlag(context, "promotionalSuggestions", false)
        assertFlag(context, "birthdayGiftBanner", true)
        assertFalse(context.mutableClassDefBy(host.type).methods.single().instructions().any { it.reference() == filter })
    }

    @Test
    fun `later Set aliases and iterators cannot escape the presentation filter`() {
        for (escape in listOf("after contains", "through alias", "iterator store", "iterator remove")) {
            val host = host(laterUse = escape)
            val context = PatchContexts.of(ExtensionDex.classes() + host)
            val warnings = PatchLogCapture.warnings { hideSuggestionsPatch.execute(context) }
            assertEquals(escape, 1, warnings.size)
            assertTrue(warnings.single(), warnings.single().contains("value escapes presentation"))
            assertFlag(context, "promotionalSuggestions", false)
            assertFlag(context, "birthdayGiftBanner", true)
            assertFalse(escape, context.mutableClassDefBy(host.type).methods.single().instructions().any { it.reference() == filter })
        }
    }

    @Test
    fun `read-only aliases and iterator loops retain both presentation capabilities`() {
        for (use in listOf("safe alias", "safe iterator alias")) {
            val host = host(laterUse = use)
            val context = PatchContexts.of(ExtensionDex.classes() + host)
            assertEquals(use, emptyList<String>(), PatchLogCapture.warnings { hideSuggestionsPatch.execute(context) })
            flags.forEach { assertFlag(context, it, true) }
            assertEquals(use, 1, context.mutableClassDefBy(host.type).methods.single().instructions().count { it.reference() == filter })
        }
    }

    @Test
    fun `a branch around a pending field read refuses the pending capability`() {
        val host = host(joinPending = true)
        val context = PatchContexts.of(ExtensionDex.classes() + host)
        val warnings = PatchLogCapture.warnings { hideSuggestionsPatch.execute(context) }
        assertEquals(1, warnings.size)
        assertTrue(warnings.single(), warnings.single().contains("path around the field read"))
        assertFlag(context, "promotionalSuggestions", false)
        assertFlag(context, "birthdayGiftBanner", true)
    }

    @Test
    fun `a birthday test with the opposite branch refuses that capability`() {
        val host = host(oppositeGift = true)
        val context = PatchContexts.of(ExtensionDex.classes() + host)
        val warnings = PatchLogCapture.warnings { hideSuggestionsPatch.execute(context) }
        assertEquals(1, warnings.size)
        assertTrue(warnings.single(), warnings.single().contains("doesn't test the dismissed key"))
        assertFlag(context, "promotionalSuggestions", true)
        assertFlag(context, "birthdayGiftBanner", false)
    }

    private fun assertControlFlowUnchanged(where: String, original: Method, patched: Method, kept: List<Int>) {
        val before = ControlFlow.of(original)
        val after = ControlFlow.of(patched)
        val originalIndex = kept.withIndex().associate { it.value to it.index }
        fun pastHooks(index: Int): Int {
            var next = index
            while (next !in originalIndex) next = after.normal[next].single()
            return originalIndex.getValue(next)
        }
        for ((old, current) in kept.withIndex()) {
            assertEquals("$where: original flow from instruction $old", before.normal[old], after.normal[current].map(::pastHooks))
            assertEquals("$where: original exception flow from instruction $old", before.exceptional[old], after.exceptional[current].map(::pastHooks))
        }
    }

    private fun assertFlag(context: BytecodePatchContext, name: String, enabled: Boolean) {
        val instructions = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.instructions()
        assertEquals(Opcode.CONST_4, instructions[0].opcode)
        assertEquals("$name coverage", if (enabled) 1 else 0, (instructions[0] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, instructions[1].opcode)
    }

    private fun assertUnchanged(context: BytecodePatchContext, host: ClassDef) {
        val original = host.methods.single()
        val patched = context.mutableClassDefBy(host.type).methods.single()
        assertEquals(original.instructions().map { it.opcode }, patched.instructions().map { it.opcode })
        assertEquals(original.instructions().map { it.reference() }, patched.instructions().map { it.reference() })
    }

    private fun host(
        pending: Boolean = true, gift: Boolean = true, escapePending: Boolean = false,
        joinPending: Boolean = false, oppositeGift: Boolean = false,
        laterUse: String? = null,
    ): ClassDef {
        val type = "Lorg/telegram/ui/FixtureDialogs;"
        val pendingBody = if (!pending) "" else """
            ${if (joinPending) "if-eqz v1, :pending_check" else ""}
            iget-object v0, v1, $PENDING_SUGGESTIONS
            :pending_check
            ${if (escapePending) "invoke-static {v0}, Lfixture/Escape;->save(Ljava/util/Set;)V" else ""}
            const-string v2, "BIRTHDAY_SETUP"
            invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
            move-result v${if (laterUse == null) 0 else 3}
            ${when (laterUse) {
                "after contains" -> "iput-object v0, v1, $PENDING_SUGGESTIONS"
                "through alias" -> "move-object v3, v0\nconst/4 v0, 0x0\niput-object v3, v1, $PENDING_SUGGESTIONS"
                "iterator store" -> "invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;\nmove-result-object v3\nconst/4 v0, 0x0\niput-object v3, v1, Lfixture/Escape;->iterator:Ljava/util/Iterator;"
                "iterator remove" -> "invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;\nmove-result-object v3\ninvoke-interface {v3}, Ljava/util/Iterator;->remove()V"
                "safe alias" -> "move-object v3, v0\nconst/4 v0, 0x0\ninvoke-interface {v3, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z\nmove-result v3"
                "safe iterator alias" -> """
                    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;
                    move-result-object v3
                    move-object v0, v3
                    const/4 v3, 0x0
                    :iterator_loop
                    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z
                    move-result v3
                    if-eqz v3, :iterator_done
                    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                    move-result-object v3
                    goto :iterator_loop
                    :iterator_done
                """
                null -> ""
                else -> error("Unknown presentation fixture: $laterUse")
            }}
        """
        val giftBody = if (!gift) "" else """
            iget-object v0, v1, $DISMISSED_SUGGESTIONS
            const-string v2, "BIRTHDAY_CONTACTS_TODAY"
            invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
            move-result v0
            ${if (oppositeGift) "if-eqz" else "if-nez"} v0, :filled
            nop
            :filled
        """
        val method = MutableMethod(ImmutableMethod(
            type, "render", emptyList(), "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null, null, ImmutableMethodImplementation(4, emptyList(), null, null),
        )).apply {
            addInstructionsWithLabels(0, """
                const/4 v1, 0x0
                $pendingBody
                $giftBody
                const/4 v0, 0x0
                const/4 v1, 0x0
                const/4 v2, 0x0
                const/4 v3, 0x0
                invoke-virtual {v0, v1, v2, v3}, $SUGGESTION_FILL
                move-result v0
                return-void
            """.trimIndent())
        }
        return ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null, listOf(method))
    }

    private fun Method.sameSignatureAs(other: Method) = name == other.name && returnType == other.returnType &&
        parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun Instruction.reference(): String? = (this as? ReferenceInstruction)?.reference?.toString()
}
