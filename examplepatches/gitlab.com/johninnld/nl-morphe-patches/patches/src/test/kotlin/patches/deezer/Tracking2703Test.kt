package patches.deezer

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import java.io.File
import java.io.ByteArrayInputStream
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test

/** Actual original 9.0.27.3 only; no shipped app classes or credentials are fixtures. */
class Tracking2703Test {
    private fun classes(): List<ClassDef> {
        val path = System.getenv("DEEZER_ORIGINAL_2703_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        return dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
    }

    private fun persistence(classes: List<ClassDef>): Method = classes
        .single { it.type == "LIIIllllIllIIIllI;" }.methods.single {
            it.name == "lIlIIllIIlI" && it.parameterTypes == listOf("Landroid/content/Context;", "Z")
        }

    private fun roundtrip(owner: ClassDef, method: Method): Method {
        val replaced = ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces,
            owner.sourceFile, owner.annotations, owner.fields,
            owner.methods.map { if (it.toString() == method.toString()) method else it })
        val pool = DexPool(Opcodes.getDefault()); pool.internClass(replaced)
        val memory = MemoryDataStore()
        val bytes = try { pool.writeTo(memory); memory.data } finally { memory.close() }
        return DexBackedDexFile.fromInputStream(Opcodes.getDefault(), ByteArrayInputStream(bytes))
            .classes.single().methods.single { it.toString() == method.toString() }
    }

    @Test fun sessionDiagnosticKeepsValidBranchTargetsAndContainsNoAccountValues() {
        val method = sessionSaveTrace2703()
        assertBranchBoundaries(method)
        val references = method.implementation!!.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference?.toString()
        }
        assertTrue(references.any { it.contains("Log;->w(") })
        assertFalse(references.any { it.contains("getToken") || it.contains("getEmail") || it.contains("getString(") })
    }

    @Test fun onlyListeningRequestsGainTheExistingNullRequestPath() {
        val owner = classes().single { it.type == "LIIIIIlIllIllIII;" }
        for ((name, endpoint) in listOf("IIIIIllIlIIllll" to "log.listen", "llIIIIIIlIIIIll" to "log.batch_listen")) {
            val method = MutableMethod(owner.methods.single { it.name == name })
            val before = method.implementation!!.instructions.toList()
            skipListeningLog2703(method, endpoint)
            val after = method.implementation!!.instructions.toList()
            assertEquals(Opcode.CONST_4, after[0].opcode)
            assertEquals(0, (after[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.RETURN_OBJECT, after[1].opcode)
            before.indices.forEach { assertSame(before[it], after[it + 2]) }
            assertBranchBoundaries(roundtrip(owner, method))
        }
    }

    @Test fun original27SinksResolveUniquelyAndOnlyGainAnEarlyReturn() {
        val classes = classes()
        assertEquals(5, trackingMethods2703.size)
        trackingMethods2703.forEach { binding ->
            val owner = classes.single { it.type == binding.owner }
            val original = owner.methods.single { it.name == binding.name && it.returnType == "V" &&
                it.parameterTypes.map(CharSequence::toString) == binding.parameters }
            val method = MutableMethod(original)
            val before = method.implementation!!.instructions.toList()
            disableTracking2703(method, binding)
            val after = method.implementation!!.instructions.toList()
            assertEquals(Opcode.RETURN_VOID, after.first().opcode)
            assertEquals(before, after.drop(1))
            assertEquals(original.implementation!!.registerCount, method.implementation!!.registerCount)
            assertEquals(Opcode.RETURN_VOID, roundtrip(owner, method).implementation!!.instructions.first().opcode)
        }
    }

    @Test fun logoutAndPopulatedUserReachUnchangedNativePersistence() {
        val classes = classes(); val original = persistence(classes); val method = MutableMethod(original)
        val body = method.implementation!!.instructions.toList()
        guardColdStartPersistence2703(method)
        val code = method.implementation!!.instructions.toList()
        assertEquals(body, code.drop(7))
        assertEquals(7, (code[0] as BuilderOffsetInstruction).target.location.index)
        assertEquals(7, (code[5] as BuilderOffsetInstruction).target.location.index)
        val flag = method.implementation!!.registerCount - 1
        fun nativeBody(loggedOut: Boolean, id: String?): Boolean {
            val registers = mutableMapOf<Int, Any?>(flag to if (loggedOut) 1 else 0)
            var result = 0; var pc = 0
            while (pc < 7) {
                val instruction = code[pc]
                val register = (instruction as? OneRegisterInstruction)?.registerA
                when (instruction.opcode) {
                    Opcode.IF_NEZ -> if (registers[register] != 0) {
                        pc = (instruction as BuilderOffsetInstruction).target.location.index; continue
                    }
                    Opcode.SGET_OBJECT -> registers[register!!] = "native user state"
                    Opcode.IGET_OBJECT -> registers[register!!] = id
                    Opcode.INVOKE_STATIC -> result = if ((registers[0] as? String).isNullOrEmpty()) 1 else 0
                    Opcode.MOVE_RESULT -> registers[register!!] = result
                    Opcode.IF_EQZ -> if (registers[register] == 0) {
                        pc = (instruction as BuilderOffsetInstruction).target.location.index; continue
                    }
                    Opcode.RETURN_VOID -> return false
                    else -> fail("Unexpected persistence guard instruction")
                }
                pc++
            }
            return pc == 7
        }
        assertTrue(nativeBody(true, ""))
        assertTrue(nativeBody(true, null))
        assertTrue(nativeBody(true, "authorized-user"))
        assertTrue(nativeBody(false, "authorized-user"))
        assertFalse(nativeBody(false, ""))
        assertFalse(nativeBody(false, null))
        val rebuilt = roundtrip(classes.single { it.type == original.definingClass }, method)
        assertEquals(original.implementation!!.registerCount, rebuilt.implementation!!.registerCount)
        val instructions = rebuilt.implementation!!.instructions.toList()
        val addresses = instructions.runningFold(0) { address, i -> address + i.codeUnits }
        for (index in listOf(0, 5)) {
            assertEquals(addresses[7], addresses[index] + (instructions[index] as OffsetInstruction).codeOffset)
        }
    }

    @Test fun nativeLogoutStillCallsPersistenceWithTrue() {
        val user = classes().single { it.type == "LIIIllllIllIIIllI;" }
        val logout = user.methods.single { it.name == "IIlllIlIIlIlII" &&
            it.parameterTypes == listOf("Landroid/content/Context;") }
        val code = logout.implementation!!.instructions.toList()
        val index = code.indices.single { (code[it] as? ReferenceInstruction)?.reference?.toString() ==
            "LIIIllllIllIIIllI;->lIlIIllIIlI(Landroid/content/Context;Z)V" }
        val flag = (code[index] as FiveRegisterInstruction).registerD
        val constant = code.take(index).last { it is OneRegisterInstruction && it.registerA == flag &&
            it is NarrowLiteralInstruction } as NarrowLiteralInstruction
        assertEquals(1, constant.narrowLiteral)
    }

    @Test fun sessionsUsesTheNativeBooleanManifestOptOut() {
        val owner = classes().single { it.type == "LIIlIlllIIIlllIII;" }
        val getter = owner.methods.single { it.name == "llIIIIIIlIIIIll" && it.returnType == "Ljava/lang/Boolean;" }
        val refs = getter.implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        assertTrue("firebase_sessions_enabled" in refs)
        assertTrue("Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z" in refs)
        assertTrue("Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z" in refs)
        assertTrue(deezerDisableTracking.dependencies.contains(deezerKeepSessionOnColdStart))
        assertEquals("9.0.27.3", deezer.targets.single().version)
    }
}
