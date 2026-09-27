/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.starttab

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.facebook.misc.settings.MAIN_TAB_ACTIVITY
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21s
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Open on a chosen tab over a few stand-in classes: which method counts as Facebook's start tab
 * picker, what the patch refuses, and the one call it puts first in the main screen's onCreate.
 */
class StartTabPatchTest {
    private val fragmentActivity = "Lcom/facebook/base/activity/FbFragmentActivity;"
    private val context = "Landroid/content/Context;"
    private val session = "Lcom/facebook/auth/usersession/FbUserSession;"
    private val hasExtra = ImmutableMethodReference(INTENT, "hasExtra", listOf("Ljava/lang/String;"), "Z")
    private val getLongExtra = ImmutableMethodReference(INTENT, "getLongExtra", listOf("Ljava/lang/String;", "J"), "J")

    private fun parameters(types: List<String>) = types.map { ImmutableMethodParameter(it, null, null) }

    /**
     * A picker as Facebook writes it, trimmed: this, the context, the intent in v5 and the session;
     * the literal, the two reads of it, and the long it answers. Each part can be left out.
     */
    private fun picker(
        owner: String = "Lfixture/StartTabPicker;",
        literal: String = TARGET_TAB_ID,
        asks: Boolean = true,
        reads: Boolean = true,
        returnType: String = "J",
        parameterTypes: List<String> = listOf(context, INTENT, session),
    ): Method {
        val body = mutableListOf<Instruction>(ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(literal)))
        if (asks) {
            body += ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 5, 0, 0, 0, 0, hasExtra)
            body += ImmutableInstruction11x(Opcode.MOVE_RESULT, 1)
        }
        body += ImmutableInstruction21s(Opcode.CONST_WIDE_16, 1, -1)
        if (reads) {
            body += ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 4, 5, 0, 1, 2, 0, getLongExtra)
            body += ImmutableInstruction11x(Opcode.MOVE_RESULT_WIDE, 1)
        }
        body += ImmutableInstruction11x(Opcode.RETURN_WIDE, 1)
        return ImmutableMethod(
            owner, "A00", parameters(parameterTypes), returnType, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            null, null, ImmutableMethodImplementation(7, body, null, null),
        )
    }

    private fun classOf(vararg methods: Method): ClassDef = ImmutableClassDef(
        methods.first().definingClass, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null,
        methods.toList(),
    )

    /** The main screen with no onCreate of its own, and the base activity that declares it. */
    private fun activities(): List<ClassDef> {
        val onCreate = ImmutableMethod(
            fragmentActivity, "onCreate", parameters(listOf("Landroid/os/Bundle;")), "V", AccessFlags.PUBLIC.value,
            null, null, ImmutableMethodImplementation(6, listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), null, null),
        )
        return listOf(
            ImmutableClassDef(MAIN_TAB_ACTIVITY, AccessFlags.PUBLIC.value, fragmentActivity, null, null, null, null,
                emptyList<Method>()),
            ImmutableClassDef(fragmentActivity, AccessFlags.PUBLIC.value, "Landroidx/fragment/app/FragmentActivity;",
                null, null, null, null, listOf(onCreate)),
        )
    }

    @Test
    fun `the picker answers a long from an intent's target_tab_id, asked for and read`() {
        assertTrue(picksStartTab(picker()))
        assertFalse("another literal", picksStartTab(picker(literal = "target_tab")))
        assertFalse("never asks whether the intent has it", picksStartTab(picker(asks = false)))
        assertFalse("never reads it as a long", picksStartTab(picker(reads = false)))
        assertFalse("answers no tab id", picksStartTab(picker(returnType = "Z")))
        assertFalse("takes no intent", picksStartTab(picker(parameterTypes = listOf(context, session))))
        // The extension loads the same literal to write it, and must never be taken for Facebook's.
        assertFalse(picksStartTab(picker(owner = "Lapp/morphe/extension/facebook/navigation/Fixture;")))
    }

    @Test
    fun `the patch goes first in the onCreate the main screen inherits, with the parameters as they come`() {
        val context = PatchContexts.of(activities() + classOf(picker()) + ExtensionDex.classDef(SETTINGS_STATUS))

        openOnChosenTabPatch.execute(context)

        val onCreate = context.mutableClassDefBy(fragmentActivity).methods.single { it.name == "onCreate" }
        val body = onCreate.implementation!!.instructions.toList()
        assertEquals(2, body.size)
        val call = body.first()
        assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
        assertEquals(ROUTE, (call as ReferenceInstruction).reference.toString())
        // p0 and p1 of a six-register method: this and the saved state, nothing borrowed.
        assertEquals(4 to 2, (call as RegisterRangeInstruction).startRegister to call.registerCount)
        assertEquals(Opcode.RETURN_VOID, body.last().opcode)

        val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "startTab" }
        val answer = status.implementation!!.instructions.first { it is NarrowLiteralInstruction }
        assertEquals("the settings screen isn't told the patch is in", 1, (answer as NarrowLiteralInstruction).narrowLiteral)
    }

    @Test
    fun `a build whose picker can't be told apart is refused, naming the extra`() {
        val none = assertThrows(PatchException::class.java) {
            openOnChosenTabPatch.execute(PatchContexts.of(activities() + ExtensionDex.classDef(SETTINGS_STATUS)))
        }
        assertTrue(none.message, none.message!!.contains("\"$TARGET_TAB_ID\", found 0"))

        val two = assertThrows(PatchException::class.java) {
            openOnChosenTabPatch.execute(
                PatchContexts.of(
                    activities() + classOf(picker()) + classOf(picker(owner = "Lfixture/SecondPicker;")) +
                        ExtensionDex.classDef(SETTINGS_STATUS),
                ),
            )
        }
        assertTrue(two.message, two.message!!.contains("found 2"))
    }
}
