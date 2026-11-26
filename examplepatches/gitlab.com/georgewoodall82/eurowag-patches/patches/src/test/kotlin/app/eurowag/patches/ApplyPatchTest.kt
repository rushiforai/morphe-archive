package app.eurowag.patches

import app.eurowag.patches.premium.unlockPremiumPatch
import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.MethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.runBlocking
import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/**
 * Applies the patch to the real 4.18.1 base APK and re-reads the patched dex
 * to prove every injected instruction is actually present.
 *
 * The base APK is used instead of the XAPK because Morphe's split merge is a
 * manager/CLI step; the patcher itself only needs the classes. The bundle is
 * still published with XAPK compatibility so the manager merges the splits.
 *
 * Run with:
 *   ./gradlew :patches:test -PeurowagApk=/path/to/com.roadlords.android.apk
 */
class ApplyPatchTest {
    @Test
    fun `patch applies to the pinned apk`() = runBlocking {
        val apkPath = System.getProperty("eurowag.apk")
            ?: "/tmp/eurowag/xapk/com.roadlords.android.apk"
        val apk = File(apkPath)
        assertTrue(apk.isFile, "APK not found at $apkPath")

        val workspace = File("/tmp/eurowag/patch-harness").apply {
            deleteRecursively()
            mkdirs()
        }
        val config = PatcherConfig(
            apkFile = apk,
            temporaryFilesPath = workspace,
        )

        val result = Patcher(config).use { patcher ->
            patcher += setOf(unlockPremiumPatch)
            val results = patcher().toList()
            results.forEach { r ->
                println("RESULT ${r.patch.name} -> ${if (r.exception == null) "OK" else "FAILED: ${r.exception?.message}"}")
            }
            val failures = results.filter { it.exception != null }
            assertTrue(failures.isEmpty(), failures.joinToString("\n") { "${it.patch.name}: ${it.exception}" })
            patcher.get()
        }

        val dexDir = File("/tmp/eurowag/patched-dex").apply {
            deleteRecursively()
            mkdirs()
        }
        val dexFiles = result.dexFiles.map { patched ->
            val out = File(dexDir, patched.name)
            patched.stream.use { input -> out.outputStream().use { input.copyTo(it) } }
            DexFileFactory.loadDexFile(out, Opcodes.getDefault())
        }
        println("PATCHED DEX FILES: " + result.dexFiles.map { it.name })

        fun classDef(type: String): ClassDef =
            dexFiles.asSequence().flatMap { it.classes }.firstOrNull { it.type == type }
                ?: error("class $type missing from patched dex")

        fun method(classType: String, name: String, returnType: String, params: List<String> = emptyList()): Method {
            val cls = classDef(classType)
            return cls.methods.firstOrNull { m ->
                m.name == name && m.returnType == returnType && m.parameterTypes.map { it.toString() } == params
            } ?: error("method $classType->$name($params)$returnType missing")
        }

        fun impl(m: Method): MethodImplementation =
            m.implementation ?: error("method ${m.definingClass}->${m.name} has no code")

        fun ref(ins: Instruction): String = when (val r =
            (ins as? ReferenceInstruction)?.reference
        ) {
            is StringReference -> r.string
            null -> ""
            else -> r.toString()
        }

        fun ops(m: Method): List<Instruction> = impl(m).instructions.toList()

        fun dump(lines: List<Instruction>) = lines.joinToString("\n") { "${it.opcode.name} ${ref(it)}" }

        fun assertRef(label: String, lines: List<Instruction>, needle: String) {
            assertTrue(lines.any { ref(it).contains(needle) }, "$label: expected '$needle' in\n" + dump(lines))
        }

        fun assertNoRef(label: String, lines: List<Instruction>, needle: String) {
            assertTrue(lines.none { ref(it).contains(needle) }, "$label: did not expect '$needle' in\n" + dump(lines))
        }

        fun assertOpcode(label: String, lines: List<Instruction>, needle: Opcode) {
            assertTrue(lines.any { it.opcode == needle }, "$label: expected opcode $needle in\n" + dump(lines))
        }

        // 1. Feature resolver -> upgraded fallback feature set.
        for ((label, type) in listOf(
            "feature resolver" to "Lfra;",
            "anonymous feature set" to "Lxhn;",
        )) {
            val lines = when (type) {
                "Lfra;" -> ops(method(type, "resolve", "Lfd7;", listOf("Ljava/lang/String;")))
                else -> ops(method(type, "x", "Lfd7;"))
            }
            assertRef(label, lines.take(3), "Larn;->v()Lfd7;")
            assertOpcode(label, lines.take(4), Opcode.RETURN_OBJECT)
        }

        // 2. Fallback feature set: no premium locks, full traffic and all
        //    vehicle parameters.
        val fallback = ops(method("Larn;", "v", "Lfd7;"))
        assertNoRef("fallback", fallback, "Lpva;")
        assertNoRef("fallback", fallback, "Leqk;")
        assertNoRef("fallback", fallback, "Lhqk;")
        assertNoRef("fallback", fallback, "Lvdm;")
        assertNoRef("fallback", fallback, "Ltcd;")
        assertNoRef("fallback", fallback, "Ltsl;")
        assertRef("fallback", fallback, "Lrva;")
        assertRef("fallback", fallback, "Ldqk;")
        assertRef("fallback", fallback, "Lkqk;")
        assertRef("fallback", fallback, "Lwdm;")
        assertRef("fallback", fallback, "Lucd;")
        assertRef("fallback", fallback, "Lrsl;")
        assertTrue(
            fallback.count { it.opcode == Opcode.SGET_OBJECT && ref(it) == "Lucd;->a:Lucd;" } >= 2,
            "expected the two Disabled(tcd) models to become Enabled(ucd):\n" + dump(fallback),
        )
        assertRef("fallback", fallback, "Lq3m;-><init>")
        assertRef("fallback", fallback, "Lq87;-><init>")

        // Offline maps: wkb(online, offline, lock) must receive two true flags.
        val mapCall = fallback.indexOfFirst { ref(it).contains("Lwkb;-><init>") }
        assertTrue(mapCall >= 0, "wkb constructor missing")
        assertTrue(
            fallback.subList(maxOf(0, mapCall - 4), mapCall).count {
                it.opcode == Opcode.CONST_4 &&
                    (it as com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction).narrowLiteral == 1
            } == 2,
            "expected online=true and offline=true before wkb:\n" +
                dump(fallback.subList(maxOf(0, mapCall - 5), mapCall + 1)),
        )

        // 3. Subscription status -> Premium.
        val monetization = ops(method("Lam9;", "i", "Ljava/lang/Object;", listOf("Ljava/lang/Object;")))
        assertRef("monetization", monetization.take(8), "Lchc;")
        assertRef("monetization", monetization.take(12), "Lzgc;-><init>")
        assertRef("monetization", monetization, "eurowag_premium")
        assertEquals(
            2,
            monetization.take(12).count { it.opcode == Opcode.RETURN_OBJECT },
            "expected both Premium return paths:\n" + dump(monetization.take(12)),
        )

        println("VERIFIED: feature resolver, upgraded fixture and Premium status present")
    }
}
