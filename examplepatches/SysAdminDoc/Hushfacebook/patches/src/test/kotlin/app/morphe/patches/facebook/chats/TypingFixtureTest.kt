/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.chats

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.shared.redexOriginalName
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Test

/**
 * Hide typing indicator on every declared build: one Mailbox typing setter and one "typing"
 * runnable each for chats and comments, and after the hooks the setter hands its flag to the
 * extension first and each runnable asks first whether to send.
 *
 * Read from 581 (2026-10-06): the setter is `LX/5LX;->A0K`, the runnables `LX/FuH` and `LX/qS2`.
 * None of those names is used here.
 */
class TypingFixtureTest {
    private val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Instruction.called() = ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()

    /** The classes the patch looks through: each setter's owner and each runnable Redex names. */
    private fun targets(bundle: java.io.File): List<ClassDef> {
        val found = mutableListOf<ClassDef>()
        FixtureDex.forEach(bundle) { dex ->
            if (dex.stringSection.none { it == MAILBOX_TYPING || it == CHAT_SEND_TYPING || it == COMMENT_SEND_TYPING }) {
                return@forEach
            }
            for (classDef in dex.classes) {
                val named = redexOriginalName(classDef) in setOf(CHAT_SEND_TYPING, COMMENT_SEND_TYPING)
                if (named || classDef.methods.any(::isMailboxTypingSetter)) found += ImmutableClassDef.of(classDef)
            }
        }
        return found
    }

    @Test
    fun `the typing setter and both typing runnables ask the extension first, on each declared build`() {
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val classes = targets(bundle)
                val setters = classes.flatMap { owner -> owner.methods.filter(::isMailboxTypingSetter) }
                assertEquals("$name: one Mailbox typing setter", 1, setters.size)
                val setter = setters.single()
                val runnables = mapOf(CHAT_SEND_TYPING to HOLDS_CHAT_TYPING, COMMENT_SEND_TYPING to HOLDS_COMMENT_TYPING)
                    .mapKeys { (original, _) -> classes.single { redexOriginalName(it) == original } }

                val context = PatchContexts.of(classes)
                with(context) { hideTypingIndicator() }

                val after = context.mutableClassDefBy(setter.definingClass).methods
                    .single { it.name == setter.name && isMailboxTypingSetter(it) }.body()
                val flag = setter.implementation!!.registerCount - 1
                assertEquals("$name: the flag goes to the extension first", CHAT_TYPING, after[0].called())
                assertEquals("$name: on the flag's register", flag, (after[0] as RegisterRangeInstruction).startRegister)
                assertEquals("$name: and comes back there", flag, (after[1] as OneRegisterInstruction).registerA)
                assertEquals("$name: the setter is otherwise as it was", setter.body().size + 2, after.size)

                for ((runnable, holds) in runnables) {
                    val run = runnable.methods.single(::isRunMethod)
                    val hooked = context.mutableClassDefBy(runnable.type).methods.single(::isRunMethod).body()
                    assertEquals("$name ${runnable.type}: asks first", holds, hooked[0].called())
                    assertEquals("$name ${runnable.type}: tests the answer", Opcode.IF_EQZ, hooked[2].opcode)
                    assertEquals("$name ${runnable.type}: and returns when held", Opcode.RETURN_VOID, hooked[3].opcode)
                    assertEquals("$name ${runnable.type}: the send is otherwise as it was", run.body().size + 4, hooked.size)
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
