/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.sponsoredreels

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertSame
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The Reels ad pool's vends, found in each declared build the way the patch finds them, and the
 * no-ad answer put first in each.
 */
class ReelsAdPoolTest {
    private val hold = "Lapp/morphe/extension/facebook/ads/ReelsAdFilter;->holdPoolAd()Z"

    /** The pool class and its two vends in each declared build. */
    private val expected = mapOf(
        AppCompatibilities.FACEBOOK_TARGET_VERSION to ("LX/5eK;" to listOf("A0H", "A0J")),
        AppCompatibilities.FACEBOOK_PREVIOUS_VERSION to ("LX/5e6;" to listOf("A0J", "A0L")),
        AppCompatibilities.FACEBOOK_ORIGINAL_VERSION to ("LX/5bF;" to listOf("A0G", "A0I")),
    )

    private fun method(
        returnType: String,
        registers: Int,
        static: Boolean = false,
        smali: String,
    ): MutableMethod = MutableMethod(
        ImmutableMethod(
            "Lfixture/Pool;",
            "vend",
            listOf(ImmutableMethodParameter("I", null, null)),
            returnType,
            AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0),
            null,
            null,
            ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, smali) }

    private val vendSmali = """
        const-string v0, "$POOL_NO_AD"
        const/4 v0, 0x0
        return-object v0
    """

    /** The five instructions in front of Facebook's first: ask, read, skip to Facebook's code on no, else null. */
    private fun MutableMethod.assertHeldFirst(where: String, before: Int) {
        val body = implementation!!.instructions.toList()
        assertEquals("$where: five added", before + 5, body.size)
        assertEquals("$where: the ask", Opcode.INVOKE_STATIC, body[0].opcode)
        assertEquals("$where: the ask", hold, ((body[0] as ReferenceInstruction).reference as MethodReference).toString())
        assertEquals("$where: the answer", listOf(Opcode.MOVE_RESULT, 0), listOf(body[1].opcode, (body[1] as OneRegisterInstruction).registerA))
        assertEquals("$where: no hold", Opcode.IF_EQZ, body[2].opcode)
        assertSame("$where: no hold goes on with Facebook's first instruction", body[5],
            (body[2] as BuilderOffsetInstruction).target.location.instruction)
        assertEquals("$where: null", listOf(Opcode.CONST_4, 0, 0), listOf(body[3].opcode, (body[3] as OneRegisterInstruction).registerA, (body[3] as NarrowLiteralInstruction).narrowLiteral))
        assertEquals("$where: answered", listOf(Opcode.RETURN_OBJECT, 0), listOf(body[4].opcode, (body[4] as OneRegisterInstruction).registerA))
    }

    @Test
    fun `the pool's two vends answer no ad first in each declared build`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertEquals("the declared builds", expected.keys, versions)
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val context = PatchContexts.of(FixtureDex.classesHolding(bundle, POOL_NO_AD))
                val vends = with(context) { reelsAdPoolVends() }
                val (pool, names) = expected.getValue(version)
                assertEquals("${bundle.name}: the pool", setOf(pool), vends.map { it.definingClass }.toSet())
                assertEquals("${bundle.name}: the vends", names, vends.map { it.name }.sorted())

                for (vend in vends) {
                    val before = vend.implementation!!.instructions.size
                    vend.holdPoolAdFirst()
                    vend.assertHeldFirst("${bundle.name}: $pool->${vend.name}", before)
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    @Test
    fun `a vend is an instance method handing back an object that logs the no-ad literal`() {
        assertTrue(isPoolVend(method("Lfixture/Ad;", 3, smali = vendSmali)))
        assertFalse("static", isPoolVend(method("Lfixture/Ad;", 3, static = true, smali = vendSmali)))
        assertFalse("a primitive answer", isPoolVend(method("I", 3, smali = "const-string v0, \"$POOL_NO_AD\"\nconst/4 v0, 0x0\nreturn v0")))
        assertFalse("a longer literal", isPoolVend(method("Lfixture/Ad;", 3, smali = vendSmali.replace(POOL_NO_AD, "$POOL_NO_AD-2"))))
    }

    @Test
    fun `a vend with no local to ask in is refused`() {
        // Two registers, both parameters: this and the int.
        val vend = method("Lfixture/Ad;", 2, smali = "const/4 p1, 0x0\nreturn-object p0")
        assertThrows(PatchException::class.java) { vend.holdPoolAdFirst() }
    }
}
