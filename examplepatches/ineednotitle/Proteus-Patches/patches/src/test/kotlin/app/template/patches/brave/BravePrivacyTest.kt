package app.template.patches.brave

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.BufferedInputStream
import java.io.ByteArrayInputStream

object BravePrivacyTest {
    @JvmStatic fun main(args: Array<String>) {
        for (value in listOf(false, true)) {
            val method = fixture("Z", 1)
            method.braveReturnBoolean(value)
            val ins = roundTrip(method).implementation!!.instructions.toList()
            check(ins[0].opcode == Opcode.CONST_4 && ins[1].opcode == Opcode.RETURN)
            check((ins[0] as com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction).narrowLiteral == if (value) 1 else 0)
        }
        val obj = fixture("Ljava/lang/Object;", 1).apply { braveReturnNull() }
        check(roundTrip(obj).implementation!!.instructions.toList()[1].opcode == Opcode.RETURN_OBJECT)
        val void = fixture("V", 0).apply { braveReturnVoid() }
        check(roundTrip(void).implementation!!.instructions.first().opcode == Opcode.RETURN_VOID)
        check(runCatching { fixture("Z", 0).braveReturnBoolean(false) }.isFailure)
        check(runCatching { fixture("V", 0).braveReturnNull() }.isFailure)
        check(runCatching { fixture("Z", 1).braveReturnVoid() }.isFailure)
        val keep = braveLocalesToKeep("hi, pt-BR, fr")
        check(braveShouldKeepLocale("en-US.pak", keep))
        check(braveShouldKeepLocale("hi.pak", keep))
        check(braveShouldKeepLocale("pt-PT.pak", keep))
        check(braveShouldKeepLocale("fr_feminine.pak", keep))
        check(!braveShouldKeepLocale("de.pak", keep))
        check(runCatching { braveLocalesToKeep("../oops") }.isFailure)
        check(canonicalizeHex("#FFF") == "#ffffff")
        check(canonicalizeHex("#000000") == "#000000")
        check(canonicalizeHex("#FF0000FF") == "#0000ff") // opaque alpha flattens to 6-hex
        check(canonicalizeHex("#80FF0000") == null) // non-opaque alpha rejected
        check(canonicalizeHex("red") == null)
        check(isSurfaceCandidate("#121212"))
        check(!isSurfaceCandidate("#f0f2ff"))
        check(isLegibleInkColor("#f0f2ff"))
        val (rewritten, rewriteStats) = rewriteXmlSurfaces(
            """<resources><color name="bg">#131221</color></resources>""",
            "#000000", "#000000",
        )
        check(rewritten.contains(">#000000<"))
        check(rewriteStats.baseCount == 1)
        println("Brave helper DEX round trips, locale selection and theme hex math passed")
    }

    private fun fixture(type: String, registers: Int): MutableMethod {
        val body = MutableMethodImplementation(registers).apply {
            if (type == "V") addInstruction(BuilderInstruction10x(Opcode.RETURN_VOID))
            else if (registers > 0) {
                addInstruction(BuilderInstruction11n(Opcode.CONST_4, 0, 0))
                addInstruction(BuilderInstruction11x(if (type == "Z") Opcode.RETURN else Opcode.RETURN_OBJECT, 0))
            } else addInstruction(BuilderInstruction10x(Opcode.RETURN_VOID))
        }
        return MutableMethod(ImmutableMethod("LBraveTest;", "test", emptyList(), type,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, body))
    }

    private fun roundTrip(method: Method): Method {
        val cls = ImmutableClassDef("LBraveTest;", AccessFlags.PUBLIC.value, "Ljava/lang/Object;",
            emptyList(), null, emptyList(), emptyList(), listOf(method))
        val store = MemoryDataStore()
        val opcodes = Opcodes.getDefault()
        DexPool.writeTo(store, ImmutableDexFile(opcodes, listOf(cls)))
        return DexBackedDexFile.fromInputStream(opcodes, BufferedInputStream(ByteArrayInputStream(store.data)))
            .classes.single().methods.single()
    }
}
