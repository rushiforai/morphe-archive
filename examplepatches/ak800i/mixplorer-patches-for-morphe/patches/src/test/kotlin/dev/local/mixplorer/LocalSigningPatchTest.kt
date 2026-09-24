package dev.local.mixplorer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

class LocalSigningPatchTest {
    private fun fixture(marker: String = "Unknown Fingerprint!"): MutableClass {
        val method = ImmutableMethod(
            "Ltest/Signing;", "selfFingerprint", null, "Ljava/lang/String;",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null, null, MutableMethodImplementation(3),
        ).toMutable()
        method.addInstructionsWithLabels(
            0,
            """
                const-string v1, "CRC-32"
                invoke-static {v1, v0}, Ltest/Hashes;->digest(Ljava/lang/String;[B)Ljava/lang/String;
                move-result-object v0
                sput-object v0, Ltest/Signing;->fingerprint:Ljava/lang/String;
                sget-object v0, Ltest/Allowed;->fingerprints:Ljava/util/ArrayList;
                const-string v1, "87ed1907"
                invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
                const-string v1, "9eccce78"
                invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
                const-string v1, "d725ce3f"
                invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
                const-string v1, "$marker"
                sget-object v0, Ltest/Signing;->fingerprint:Ljava/lang/String;
                return-object v0
            """.trimIndent(),
        )
        return ImmutableClassDef(
            "Ltest/Signing;", AccessFlags.PUBLIC.value, "Ljava/lang/Object;",
            null, null, null, null, listOf(method),
        ).toMutable()
    }

    @Test
    fun `adds actual cached self fingerprint without removing original checks`() {
        val owner = fixture()
        val method = owner.methods.single()
        val original = method.implementation!!.instructions.toList()
        patchLocalSigning(owner)
        val instructions = method.implementation!!.instructions
        assertEquals(original.size + 2, instructions.size)
        assertTrue(original.all { old -> instructions.any { it === old } })
        assertEquals(Opcode.SGET_OBJECT, instructions[5].opcode)
        val fingerprint = (instructions[5] as ReferenceInstruction).reference as FieldReference
        assertEquals("Ltest/Signing;", fingerprint.definingClass)
        assertEquals("fingerprint", fingerprint.name)
        val addedCall = (instructions[6] as ReferenceInstruction).reference as MethodReference
        assertEquals("Ljava/util/List;->add(Ljava/lang/Object;)Z", addedCall.toString())
    }

    @Test
    fun `rejects unexpected signing helpers`() {
        val owner = fixture(marker = "unrelated")
        val before = owner.methods.single().implementation!!.instructions.toList()
        assertFailsWith<IllegalStateException> { patchLocalSigning(owner) }
        assertEquals(before, owner.methods.single().implementation!!.instructions)
    }

    @Test
    fun `rejects signing support applied twice`() {
        val owner = fixture()
        patchLocalSigning(owner)
        assertFailsWith<IllegalStateException> { patchLocalSigning(owner) }
    }
}