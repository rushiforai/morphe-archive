/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.resignedtrust

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import app.morphe.patches.shared.compat.AppCompatibilities

/**
 * FBNS's package check on each declared build reads the signers it hashes through the extension,
 * straight after its own read, and a check shaped so the call can't be placed stops the patch.
 */
class RestoreTrustFbnsFixtureTest {
    private val fbnsSigners = "Lapp/morphe/extension/hushthreads/misc/ThreadsSignature;->" +
        "fbnsSigners(Landroid/content/pm/PackageInfo;[Landroid/content/pm/Signature;)[Landroid/content/pm/Signature;"
    private val marker = "Failed to create SHA-256 hash"

    @Test
    fun `each declared build's FBNS check hashes the signers the extension answers`() {
        val builds = Fixtures.declaredBuilds()
        val declaredVersions = AppCompatibilities.threads().single().targets.mapNotNull { it.version }.distinct().size
        assertEquals("one build of each declared version", declaredVersions, builds.size)
        for (build in builds) {
            FbnsPackageCheckFingerprint.clearMatch()
            val classes = FixtureDex.classesWhere(build, { marker in it.stringSection }) { method ->
                method.instructions().any { it.string() == marker }
            }
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val method = with(context) { FbnsPackageCheckFingerprint.method }
            val stock = method.instructions()
            val readAt = stock.indexOfFirst { it.isSignaturesRead() }

            method.routeFbnsSigners()
            val body = method.instructions()
            val read = body[readAt] as TwoRegisterInstruction
            assertTrue(build.name, body[readAt].isSignaturesRead())
            val call = body[readAt + 1]
            assertEquals(build.name, Opcode.INVOKE_STATIC, call.opcode)
            assertEquals(build.name, fbnsSigners, (call as ReferenceInstruction).reference.toString())
            assertEquals("${build.name}: the package", read.registerB, (call as FiveRegisterInstruction).registerC)
            assertEquals("${build.name}: the signers", read.registerA, call.registerD)
            assertEquals(build.name, Opcode.MOVE_RESULT_OBJECT, body[readAt + 2].opcode)
            assertEquals(build.name, read.registerA, (body[readAt + 2] as OneRegisterInstruction).registerA)
            assertEquals("${build.name}: nothing else moved", stock.size + 2, body.size)
        }
    }

    /** A second read, or one that overwrites the package it reads from, has no single safe place for the call. */
    @Test
    fun `a check the call can't be placed in stops the patch`() {
        val twice = check("iget-object v1, v0, $SIGNATURES\niget-object v1, v0, $SIGNATURES")
        assertTrue(assertThrows(PatchException::class.java) { twice.routeFbnsSigners() }.message!!.contains("found 2"))
        val none = check("const/4 v1, 0x0")
        assertTrue(assertThrows(PatchException::class.java) { none.routeFbnsSigners() }.message!!.contains("found 0"))
        val overwrites = check("iget-object v0, v0, $SIGNATURES")
        assertTrue(assertThrows(PatchException::class.java) { overwrites.routeFbnsSigners() }.message!!.contains("can't name"))
    }

    /** A static check taking the package in v0, with [read] where its signatures are read. */
    private fun check(read: String): MutableMethod = MutableMethod(
        ImmutableMethod(
            "Lfixture/Fbns;",
            "check",
            emptyList(),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            ImmutableMethodImplementation(2, emptyList(), null, null),
        ),
    ).apply { addInstructions(0, "const/4 v0, 0x0\n$read\nreturn-void") }

    private fun Instruction.isSignaturesRead(): Boolean = opcode == Opcode.IGET_OBJECT &&
        ((this as ReferenceInstruction).reference as FieldReference).let {
            it.definingClass == "Landroid/content/pm/PackageInfo;" && it.name == "signatures"
        }

    private fun Instruction.string(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private companion object {
        const val SIGNATURES = "Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;"
    }
}
