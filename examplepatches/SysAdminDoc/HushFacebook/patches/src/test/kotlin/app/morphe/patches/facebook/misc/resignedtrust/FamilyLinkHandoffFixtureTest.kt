/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.resignedtrust

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

/**
 * Facebook's family scope filter on each declared build asks the extension before it answers its
 * null refusal, with the intent and target list it was given, and keeps its fail-open answer after
 * it; a filter shaped so the call can't be placed is refused with a reason (#287).
 */
class FamilyLinkHandoffFixtureTest {
    @Before
    @After
    fun forgetTheMatch() = FamilyScopeFilterFingerprint.clearMatch()

    @Test
    fun `each declared build's scope filter asks the extension before refusing`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                forgetTheMatch()
                val context = PatchContexts.of(FixtureDex.classesHolding(bundle, FAMILY_SCOPE_DROP))
                val method = with(context) { FamilyScopeFilterFingerprint.method }
                val stock = method.implementation!!.instructions.toList()
                val (at, refusal) = method.familyScopeRefusal()
                val base = method.implementation!!.registerCount - 5

                method.handOffDroppedFamilyLinks()
                val body = method.implementation!!.instructions.toList()
                val call = body[at]
                assertEquals(bundle.name, Opcode.INVOKE_STATIC, call.opcode)
                assertEquals(bundle.name, FAMILY_LINK_HANDOFF, (call as ReferenceInstruction).reference.toString())
                assertEquals("${bundle.name}: the intent", base + 2, (call as FiveRegisterInstruction).registerC)
                assertEquals("${bundle.name}: the targets", base + 4, call.registerD)
                assertEquals(bundle.name, Opcode.MOVE_RESULT_OBJECT, body[at + 1].opcode)
                assertEquals(bundle.name, refusal, (body[at + 1] as OneRegisterInstruction).registerA)
                assertEquals("${bundle.name}: the refusal", Opcode.RETURN_OBJECT, body[at + 2].opcode)
                assertEquals("${bundle.name}: the refusal register", refusal, (body[at + 2] as OneRegisterInstruction).registerA)
                assertEquals("${bundle.name}: the fail-open answer", base + 2, (body[at + 3] as OneRegisterInstruction).registerA)
                assertEquals("${bundle.name}: nothing else moved", stock.size + 2, body.size)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    /** No drop line, nothing returned after it, or a refusal without its fail-open answer has no safe place for the call. */
    @Test
    fun `a filter the call can't be placed in is refused with the reason`() {
        val noLine = filter("const/4 v0, 0x0\nreturn-object v0")
        assertTrue(assertThrows(PatchException::class.java) { noLine.handOffDroppedFamilyLinks() }.message!!.contains("no drop log line"))
        val noReturn = filter("const-string v0, \"$FAMILY_SCOPE_DROP\"\nthrow v0")
        assertTrue(assertThrows(PatchException::class.java) { noReturn.handOffDroppedFamilyLinks() }.message!!.contains("nothing returns"))
        val noFailOpen = filter("const-string v0, \"$FAMILY_SCOPE_DROP\"\nconst/4 v0, 0x0\nreturn-object v0")
        assertTrue(assertThrows(PatchException::class.java) { noFailOpen.handOffDroppedFamilyLinks() }.message!!.contains("fail-open"))
    }

    @Test
    fun `a well-shaped filter gets the call before its refusal`() {
        val method = filter("const-string v0, \"$FAMILY_SCOPE_DROP\"\nconst/4 v0, 0x0\nreturn-object v0\nreturn-object p2")
        method.handOffDroppedFamilyLinks()
        val body = method.implementation!!.instructions.toList()
        assertEquals(Opcode.INVOKE_STATIC, body[2].opcode)
        assertEquals(Opcode.MOVE_RESULT_OBJECT, body[3].opcode)
        assertEquals(0, (body[3] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.RETURN_OBJECT, body[4].opcode)
    }

    /** A private filter shaped like Facebook's, one local, with [code] as its body. */
    private fun filter(code: String): MutableMethod = MutableMethod(
        ImmutableMethod(
            "Lfixture/Scope;",
            "A00",
            listOf("Landroid/content/Context;", "Landroid/content/Intent;", "Ljava/lang/String;", "Ljava/util/List;")
                .map { ImmutableMethodParameter(it, null, null) },
            "Landroid/content/Intent;",
            AccessFlags.PRIVATE.value,
            null,
            null,
            ImmutableMethodImplementation(6, emptyList(), null, null),
        ),
    ).apply { addInstructions(0, code) }
}
