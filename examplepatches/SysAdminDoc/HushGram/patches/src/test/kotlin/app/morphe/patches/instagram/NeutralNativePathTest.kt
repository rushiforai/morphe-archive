/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.*
import org.junit.Assert.assertThrows
import org.junit.Test

class NeutralNativePathTest {
    @Test fun aNeutralBlockPreservesNativeBranchesAndExceptionOwnership() {
        val method = native()
        val original = NeutralNativePath(method)
        method.addInstructions(1, "const/4 v1, 0x0")
        original.assertPreserved("neutral local", method, setOf(1))
    }

    @Test fun substitutedOperandsAndCatchTypesCannotPassTheStockComparison() {
        val method = native()
        val original = NeutralNativePath(method)
        method.replaceInstruction(1, "invoke-static { v1 }, Lfixture/Use;->read(I)V")
        assertThrows(AssertionError::class.java) { original.assertPreserved("wrong argument", method, emptySet()) }
        val stock = native()
        val differentCatch = native(listOf("Ljava/lang/Throwable;"))
        assertThrows(AssertionError::class.java) {
            NeutralNativePath(stock).assertPreserved("broader handler", differentCatch, emptySet())
        }
    }

    @Test fun branchEncodingCanWidenButItsNativeDestinationCannotChange() {
        val original = NeutralNativePath(branch())
        original.assertPreserved("wide encoding", branch(wide = true), emptySet())
        assertThrows(AssertionError::class.java) {
            original.assertPreserved("different destination", branch(wide = true, wrongTarget = true), emptySet())
        }
    }

    @Test fun sharedHandlerEdgesStillPreserveEveryCatchType() {
        val method = native(listOf("Ljava/lang/Exception;", "Ljava/lang/RuntimeException;"))
        val original = NeutralNativePath(method)
        method.addInstructions(1, "const/4 v1, 0x0")
        original.assertPreserved("shared handler", method, setOf(1))
        assertThrows(AssertionError::class.java) {
            original.assertPreserved("lost catch type", native(), emptySet())
        }
    }

    private fun branch(wide: Boolean = false, wrongTarget: Boolean = false): MutableMethod {
        val method = MutableMethod(ImmutableMethod("Lfixture/Native;", "branch", emptyList(), "I",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(2, emptyList(), null, null)))
        method.addInstructionsWithLabels(0, """
            const/4 v0, 0x1
            goto${if (wide) "/16" else ""} :${if (wrongTarget) "other" else "end"}
            :other
            const/4 v0, 0x2
            :end
            return v0
        """.trimIndent())
        return method
    }

    private fun native(catchTypes: List<String> = listOf("Ljava/lang/Exception;")): MutableMethod {
        val raw = MutableMethod(ImmutableMethod("Lfixture/Native;", "read", emptyList(), "I",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(2, emptyList(), null, null)))
        raw.addInstructionsWithLabels(0, """
            const/4 v0, 0x1
            invoke-static { v0 }, Lfixture/Use;->read(I)V
            if-eqz v0, :end
            const/4 v0, 0x0
            :end
            return v0
            move-exception v1
            const/4 v0, -0x1
            return v0
        """.trimIndent())
        return MutableMethod(ImmutableMethod(raw.definingClass, raw.name, raw.parameters, raw.returnType,
            raw.accessFlags, null, null, ImmutableMethodImplementation(2, raw.implementation!!.instructions,
                listOf(ImmutableTryBlock(1, 3, catchTypes.map { ImmutableExceptionHandler(it, 8) })), null)))
    }
}
