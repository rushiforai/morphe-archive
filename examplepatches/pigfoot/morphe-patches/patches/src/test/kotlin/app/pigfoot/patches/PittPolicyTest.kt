package app.pigfoot.patches

import app.pigfoot.patches.pitt.*
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.immutable.debug.ImmutableLineNumber
import com.android.tools.smali.dexlib2.immutable.instruction.*
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import org.junit.Assert.*
import org.junit.Test

class PittPolicyTest {
    @Test fun exactArm64ApksTargetAndHiddenGuardAreIndependent() {
        val patch = pittLocalSponsoredPatch
        assertEquals("PiTT local sponsored features", patch.name)
        assertTrue(patch.default)
        assertEquals(setOf(pittInputPatch), patch.dependencies)
        assertNull(pittInputPatch.name)
        val compatibility = patch.compatibility!!.single()
        assertEquals(PITT_PACKAGE, compatibility.packageName)
        assertEquals(ApkFileType.APKS, compatibility.apkFileType)
        val target = compatibility.targets.single()
        assertEquals(PITT_VERSION, target.version)
        assertEquals(mapOf(SupportedAbi.ARM64_V8A to PITT_CODE), target.versionCodes)
        assertEquals(26, target.minSdk)
        assertFalse(target.isExperimental)
        requirePittVersion("12.0.0", "40892")
        for ((name, code) in listOf("12.0.0" to "40893", "12.0.0" to "40878",
            "11.12.3" to "40878", "11.12.3" to "40892"))
            assertThrows(IllegalArgumentException::class.java) { requirePittVersion(name, code) }
    }

    @Test fun writerInventoryRejectsMissingAddedAndReappliedSites() {
        requirePittWriterInventory(pittWriterCounts)
        assertEquals(5, pittWriterCounts.size)
        assertEquals(6, pittWriterCounts.values.sum())
        assertEquals(5, pittClassPins.size)
        assertTrue(pittClassPins.values.all { it.matches(Regex("[a-f0-9]{64}")) })
        for (bad in listOf(emptyMap(), pittWriterCounts - pittWriterCounts.keys.first(),
            pittWriterCounts + ("Lunknown;->reset()V" to 1),
            pittWriterCounts + ("Lcom/ihad/ptt/d;->g1(Ljava/lang/String;)V" to 1)))
            assertThrows(IllegalArgumentException::class.java) { requirePittWriterInventory(bad) }
    }

    private fun writer(field: String = PITT_SPONSORED_FIELD, count: Int = 1): ImmutableMethod {
        val instructions = mutableListOf<com.android.tools.smali.dexlib2.iface.instruction.Instruction>(
            ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
            ImmutableInstruction21t(Opcode.IF_EQZ, 0, 2 + 2 * count)
        )
        repeat(count) { instructions.add(ImmutableInstruction22c(Opcode.IPUT_BOOLEAN, 0, 2,
            ImmutableFieldReference(PITT_STATE, field, "Z"))) }
        instructions.add(ImmutableInstruction10x(Opcode.RETURN_VOID))
        instructions.add(ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, 1))
        instructions.add(ImmutableInstruction11x(Opcode.THROW, 1))
        return ImmutableMethod("Lcom/ihad/ptt/d;", "f1", emptyList(), "V", 1,
            setOf(ImmutableAnnotation(1, "Ltest/Kept;", emptyList())), emptySet(),
            ImmutableMethodImplementation(3, instructions,
                listOf(ImmutableTryBlock(3, count * 2, listOf(ImmutableExceptionHandler("Ljava/lang/Throwable;", 4 + count * 2)))),
                listOf(ImmutableLineNumber(0, 123))))
    }

    @Test fun rewritePreservesCallerRegistersMetadataAndLogicalBranchExceptionTargets() {
        val original = writer()
        val rewritten = MutableMethod(original)
        redirectPittWrites(rewritten)
        assertEquals(original.pittId(), rewritten.pittId())
        assertEquals(original.parameters, rewritten.parameters)
        assertEquals(original.annotations, rewritten.annotations)
        assertEquals(original.accessFlags, rewritten.accessFlags)
        assertEquals(original.implementation!!.registerCount, rewritten.implementation!!.registerCount)
        val code = rewritten.implementation!!.instructions.toList()
        assertEquals(listOf(Opcode.CONST_4, Opcode.IF_EQZ, Opcode.INVOKE_STATIC, Opcode.RETURN_VOID,
            Opcode.MOVE_EXCEPTION, Opcode.THROW), code.map { it.opcode })
        val call = code[2] as FiveRegisterInstruction
        assertEquals(2, call.registerCount)
        assertEquals(0, call.registerC)
        assertEquals(2, call.registerD)
        assertEquals("$PITT_STATE->$PITT_SETTER(Z$PITT_STATE)V", (code[2] as ReferenceInstruction).reference.toString())
        assertEquals(0, (code[0] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(5, (code[1] as OffsetInstruction).codeOffset)
        val block = rewritten.implementation!!.tryBlocks.single()
        assertEquals(3, block.startCodeAddress)
        assertEquals(3, block.codeUnitCount)
        assertEquals(7, block.exceptionHandlers.single().handlerCodeAddress)
        assertEquals("Ljava/lang/Throwable;", block.exceptionHandlers.single().exceptionType)
        assertEquals(1, rewritten.implementation!!.debugItems.count())
        assertTrue(pittWriteIndices(rewritten).isEmpty())
        assertThrows(IllegalArgumentException::class.java) { redirectPittWrites(rewritten) }
    }

    @Test fun wrongFieldOrUnexpectedCountFailsWithoutTouchingTheMethod() {
        for (original in listOf(writer("other"), writer(count = 2))) {
            val rewritten = MutableMethod(original)
            val before = rewritten.implementation!!.instructions.map { it.opcode }
            assertThrows(IllegalArgumentException::class.java) { redirectPittWrites(rewritten) }
            assertEquals(before, rewritten.implementation!!.instructions.map { it.opcode })
        }
    }

    @Test fun setterAlwaysWritesTrueWithoutReceiptsServicesOrCallerAliasing() {
        val method = pittSetterMethod()
        assertTrue(AccessFlags.STATIC.isSet(method.accessFlags))
        assertTrue(AccessFlags.PUBLIC.isSet(method.accessFlags))
        assertTrue(AccessFlags.SYNTHETIC.isSet(method.accessFlags))
        assertEquals(listOf("Z", PITT_STATE), method.parameterTypes.map { it.toString() })
        val implementation = method.implementation!!
        val code = implementation.instructions.toList()
        assertEquals(2, implementation.registerCount)
        assertEquals(listOf(Opcode.CONST_4, Opcode.IPUT_BOOLEAN, Opcode.RETURN_VOID), code.map { it.opcode })
        assertEquals(1, (code[0] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(0, (code[1] as TwoRegisterInstruction).registerA)
        assertEquals(1, (code[1] as TwoRegisterInstruction).registerB)
        assertEquals(PITT_FIELD, (code[1] as ReferenceInstruction).reference.toString())
        assertTrue(implementation.tryBlocks.isEmpty())
        assertFalse(implementation.debugItems.iterator().hasNext())
    }

    @Test fun fingerprintsDetectInstructionChangesRatherThanJustClassNames() {
        fun definition(method: ImmutableMethod) = ImmutableClassDef(method.definingClass, 1,
            "Ljava/lang/Object;", emptyList(), null, emptySet(), emptyList(), listOf(method))
        assertNotEquals(pittClassHash(definition(writer())), pittClassHash(definition(writer("other"))))
    }
}
