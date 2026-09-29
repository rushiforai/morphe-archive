/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.coexist

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The code half of the clone support: each place Facebook's code spells out one of its own
 * provider authorities hands it to the extension, which answers the running app's, and nothing
 * that only looks like one is touched.
 */
class ClonedPackageLiteralsTest {
    private val facebook = "com.facebook.katana"
    private val dedup = "$facebook.ClientMessagePushDedupInfoProvider"
    private val authorities = setOf(dedup, "$facebook.provider.UserValuesProvider")

    private fun load(register: Int, literal: String): Instruction =
        ImmutableInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(literal))

    private fun method(type: String, registers: Int, vararg instructions: Instruction) = ImmutableMethod(
        type, "uris", emptyList(), "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
        ImmutableMethodImplementation(registers, instructions.toList(), null, null),
    )

    private fun classDef(type: String, method: Method): ClassDef =
        ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null, listOf(method))

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Instruction.literal() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    @Test
    fun anAuthorityOrAnAddressOnOneIsOwn() {
        assertEquals(dedup, dedup.ownAuthority(authorities))
        assertEquals(dedup, "content://$dedup/mutestatus".ownAuthority(authorities))
        assertEquals(dedup, "content://$dedup".ownAuthority(authorities))
        assertEquals(dedup, "content://$dedup?x=1".ownAuthority(authorities))
        // Another app's, a longer name, a class name, the package, and an authority not at the start.
        assertNull("content://com.facebook.orca.ClientMessagePushDedupInfoProvider/mutestatus".ownAuthority(authorities))
        assertNull("content://${dedup}2/mutestatus".ownAuthority(authorities))
        assertNull("$dedup.Impl".ownAuthority(authorities))
        assertNull(facebook.ownAuthority(authorities))
        assertNull("vnd.android.cursor.item/vnd.$dedup".ownAuthority(authorities))
    }

    /**
     * Facebook's code is routed, into the register each load wrote, a jumbo load and a register
     * above v15 included, and the extension's own classes are left alone.
     */
    @Test
    fun ownAuthoritiesInFacebooksCodeGoThroughTheExtension() {
        val uris = "LX/7b3;"
        val extension = AUTHORITY_CALL.substringBefore("->")
        val context = PatchContexts.of(
            listOf(
                classDef(uris, method(uris, 40,
                    load(0, "content://$dedup/mutestatus"),
                    ImmutableInstruction31c(Opcode.CONST_STRING_JUMBO, 33, ImmutableStringReference(dedup)),
                    load(1, "content://com.facebook.orca.ClientMessagePushDedupInfoProvider/mutestatus"),
                    load(2, "$facebook.LoginActivity"),
                    ImmutableInstruction10x(Opcode.RETURN_VOID))),
                classDef(extension, method(extension, 1, load(0, dedup), ImmutableInstruction10x(Opcode.RETURN_VOID))),
            ),
        )

        assertEquals(2, context.routeOwnAuthorities(facebook, authorities))

        val routed = context.mutableClassDefBy(uris).methods.single().instructions()
        assertEquals(9, routed.size)
        for (index in listOf(0, 3)) {
            val register = (routed[index] as OneRegisterInstruction).registerA
            val call = routed[index + 1]
            assertEquals(AUTHORITY_CALL, (call as ReferenceInstruction).reference.toString())
            assertEquals(register to 1, (call as RegisterRangeInstruction).startRegister to call.registerCount)
            assertEquals(register, (routed[index + 2] as OneRegisterInstruction).registerA)
        }
        assertEquals(listOf("content://com.facebook.orca.ClientMessagePushDedupInfoProvider/mutestatus", "$facebook.LoginActivity"),
            routed.drop(6).mapNotNull { it.literal() })
        assertEquals("the extension's literal was routed", 2,
            context.mutableClassDefBy(extension).methods.single().instructions().size)
    }

    /** The call the patch writes is a public static method of the payload, moving names under Facebook's package. */
    @Test
    fun theExtensionDeclaresTheCall() {
        val type = AUTHORITY_CALL.substringBefore("->")
        val call = AUTHORITY_CALL.substringAfter("->")
        val declared = ExtensionDex.classDef(type).methods.filter {
            AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags)
        }.map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        assertTrue("the extension declares no public static $call: $declared", call in declared)
        assertEquals(AppCompatibilities.FACEBOOK_PACKAGE, ExtensionDex.stringConstant(type, "FACEBOOK"))
    }
}
