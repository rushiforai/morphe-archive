/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.versioncode

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureResources
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Change version code on every declared build: Threads' reads of its own code are found and sent
 * through the extension, its start-up and job scheduler checks among them, the component manager's
 * check against its own APK's manifest and the code handed to Play's update check stay raised, and
 * each hook takes the read's own registers
 * and no other. Then the decoded manifest takes the highest code and nothing else in it moves, and
 * a manifest the patcher didn't read is refused.
 */
class ChangeVersionCodeFixtureTest {
    private val own = "com.instagram.barcelona"
    private val manager = "Landroid/content/pm/PackageManager;"
    private val helper = READ.substringBefore("->")

    @Test
    fun everyDeclaredBuildHasItsChecksHookedAndItsManifestRaised() {
        val builds = Fixtures.declaredBuilds()
        for (build in builds) {
            val code = realVersionCode(build.nameWithoutExtension.substringAfterLast('-'))
            val context = PatchContexts.of(packageInfoClasses(build) + ExtensionDex.classDef(helper) + ExtensionDex.classDef(SETTINGS_STATUS))
            val reads = context.versionCodeReads(own)
            println("[${build.name}] ${reads.size} reads: ${reads.count { it.verdict == Verdict.REAL }} own, " +
                "${reads.count { it.verdict == Verdict.KEPT }} kept, ${reads.count { it.verdict == Verdict.OTHER }} other")
            reads.forEach { println("[${build.name}]   $it") }
            val prepared = context.prepareVersionCode(own, code)
            val before = prepared.reads.associateWith { read ->
                read.method.implementation!!.instructions.toList()[read.index]
            }

            fun readsIn(string: String) = prepared.reads.filter { read ->
                read.method.implementation!!.instructions.any { it.string()?.startsWith(string) == true }
            }
            assertTrue("${build.name}: the start-up check", readsIn(START_CHECK).isNotEmpty())
            assertEquals("${build.name}: the job scheduler check's two reads", 2, readsIn(SCHEDULER_CHECK).size)
            assertEquals("${build.name}: the two reads meant to see the raised code", listOf(
                "held against the manifest of Threads' own APK file, which is raised too",
                "sent to Google Play's update check, which is what the raised code is for",
            ), reads.filter { it.verdict == Verdict.KEPT }.map { it.why }.sorted())

            context.applyVersionCode(prepared)
            for ((read, original) in before) {
                val code = context.code(read.method.definingClass, read.method.name, read.method.parameterTypes.map(Any::toString))
                // Earlier reads in the same method each added a move-result in front of this one.
                val shift = prepared.reads.count { it.method == read.method && !it.long && it.index < read.index }
                val call = code[read.index + shift]
                val where = "${build.name}: ${read.method.definingClass}->${read.method.name} @${read.index}"
                assertEquals(where, if (read.long) READ_LONG else READ, call.reference())
                assertEquals("$where reads the PackageInfo the read did", listOf(read.holder), call.registers())
                if (read.long) {
                    assertEquals("$where keeps its move-result-wide", Opcode.MOVE_RESULT_WIDE, code[read.index + shift + 1].opcode)
                } else {
                    val result = code[read.index + shift + 1]
                    assertEquals(where, Opcode.MOVE_RESULT, result.opcode)
                    assertEquals("$where writes only the register the read wrote",
                        (original as OneRegisterInstruction).registerA, (result as OneRegisterInstruction).registerA)
                }
            }
            for (read in reads.filter { it.verdict != Verdict.REAL }) {
                val code = context.code(read.method.definingClass, read.method.name, read.method.parameterTypes.map(Any::toString))
                if (reads.none { it.verdict == Verdict.REAL && it.method == read.method }) {
                    assertTrue("${build.name}: $read is left alone", code.none { it.reference()?.startsWith(helper) == true })
                }
            }
            assertEquals(code, context.stub("real"))
            assertEquals(HIGHEST_VERSION_CODE, context.stub("raised"))

            FixtureResources.of(build).use { resources ->
                val manifest = resources.document("AndroidManifest.xml")
                val stock = FixtureResources.text(manifest)
                raiseVersionCode(manifest, code)
                assertEquals("${build.name}: only the version code changes",
                    stock.replaceFirst("android:versionCode=\"$code\"", "android:versionCode=\"$HIGHEST_VERSION_CODE\""),
                    FixtureResources.text(manifest))
                val refused = runCatching { raiseVersionCode(resources.document("AndroidManifest.xml"), code - 1) }.exceptionOrNull()
                assertTrue("${build.name}: ${refused?.message}", refused is PatchException && refused.message!!.startsWith("$PATCH: "))
            }
        }
        assertEquals("one build of each declared version", 3, builds.size)
    }

    /**
     * Every class of [build] that calls getPackageInfo, with the classes its reads can lead through:
     * the helpers it calls with a name or a PackageInfo, the Contexts it asks, and their superclasses.
     * One pass over the bundle's dex files, which stay in memory while the closure is taken.
     */
    private fun packageInfoClasses(build: java.io.File): List<ClassDef> {
        val all = HashMap<String, ClassDef>()
        val asking = mutableListOf<ClassDef>()
        FixtureDex.forEach(build) { dex ->
            val calls = dex.methodSection.any { it.definingClass == manager && it.name == "getPackageInfo" }
            dex.classes.forEach { if (all.putIfAbsent(it.type, it) == null && calls) asking += it }
        }
        val found = mutableMapOf<String, ClassDef>()
        val wanted = ArrayDeque<String>()
        for (classDef in asking) {
            val calls = classDef.methods.flatMap { it.implementation?.instructions?.toList().orEmpty() }
                .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            if (calls.none { it.definingClass == manager && it.name == "getPackageInfo" }) continue
            found[classDef.type] = classDef
            calls.filter {
                it.name == "getPackageName" || it.name == "getApplicationInfo" ||
                    it.parameterTypes.map(Any::toString).let { p -> p == listOf(PACKAGE_INFO) || p == listOf("Ljava/lang/String;") }
            }.mapTo(wanted) { it.definingClass }
            classDef.superclass?.let(wanted::add)
        }
        while (wanted.isNotEmpty()) {
            val type = wanted.removeFirst()
            if (type in found) continue
            val classDef = all[type] ?: continue
            found[type] = classDef
            classDef.superclass?.let(wanted::add)
        }
        return found.values.map(ImmutableClassDef::of)
    }

    private fun BytecodePatchContext.code(type: String, name: String, parameters: List<String>): List<Instruction> =
        classDefBy(type).methods.single { it.name == name && it.parameterTypes.map(Any::toString) == parameters }
            .implementation!!.instructions.toList()

    private fun BytecodePatchContext.stub(name: String): Int =
        (classDefBy(helper).methods.single { it.name == name }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral

    private fun Instruction.reference(): String? = (this as? ReferenceInstruction)?.reference?.toString()

    private fun Instruction.string(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    private fun Instruction.registers(): List<Int> = when (this) {
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        else -> emptyList()
    }
}
