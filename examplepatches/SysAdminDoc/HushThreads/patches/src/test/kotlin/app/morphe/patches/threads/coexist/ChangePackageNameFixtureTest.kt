/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.coexist

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.shared.compat.AppCompatibilities.THREADS_PACKAGE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Change package name on the Threads builds the bundle declares: the provider addresses Threads'
 * code spells out go through the extension, and Threads' check for its own package asks the
 * extension first, so a copy doesn't take itself for Instagram.
 */
class ChangePackageNameFixtureTest {
    /**
     * Every literal of the stock build that names one of Threads' own providers: its file
     * providers where it shares files, the Hatch chat's, the family-app tables and the usdid
     * values. Meta compiles each variant's code on its own, so the count differs between them: 18
     * on ARMv7 635, 19 on arm64 636 and 23 on x86 622.
     */
    @Test
    fun `each declared build hands its own provider addresses to the extension`() {
        for (build in Fixtures.declaredBuilds()) {
            val literals = classes(build).sumOf { type ->
                type.methods.sumOf { method -> method.implementation?.instructions?.count { it.namesOwnProvider() } ?: 0 }
            }
            assertTrue("${build.name} spells none of them out", literals > 0)
            val context = context(build)
            assertEquals(build.name, literals, context.routeOwnAuthorities("test", THREADS_PACKAGE, AUTHORITIES))
            // Each literal is followed by one call now.
            val calls = ownSites(build).sumOf { type ->
                context.mutableClassDefBy(type).methods.sumOf { method ->
                    method.implementation?.instructions?.count { (it as? ReferenceInstruction)?.reference?.toString() == AUTHORITY_CALL } ?: 0
                }
            }
            assertEquals(build.name, literals, calls)
        }
    }

    /**
     * The check hands the name it was given to the extension. Yes answers yes; anything else carries
     * on into Threads' own comparison, kept whole. On the x86 builds the check asks Redex's table of
     * outlined strings for the debug name, and a check whose index finds another string is refused.
     */
    @Test
    fun `each declared build's copy passes Threads' own package check`() {
        for (build in Fixtures.declaredBuilds()) {
            val (signature, outlined) = CHECKS.entries.single { build.name.contains("-${it.key}.") }.value
            val checkClasses = checkClasses(build)
            val stock = checkClasses.flatMap { it.methods }.single { "${it.definingClass}->${it.name}" == signature }
            val stockCode = stock.implementation!!.instructions.map { it.opcode }.filter { it != Opcode.NOP }
            val strings = stock.implementation!!.instructions.mapNotNull { it.loadedString() }
            assertTrue(build.name, THREADS_PACKAGE in strings)
            assertEquals(build.name, outlined == null, "$THREADS_PACKAGE.debug" in strings)
            val context = PatchContexts.of(ExtensionDex.classes() + checkClasses)
            assertEquals(build.name, signature, context.countCopyAsThreads())

            val body = context.mutableClassDefBy(stock.definingClass).methods.single { it.name == stock.name && it.parameterTypes == stock.parameterTypes }
                .implementation!!.instructions.toList()
            assertEquals(build.name, OWN_PACKAGE_CALL, (body[0] as ReferenceInstruction).reference.toString())
            val name = body[0] as FiveRegisterInstruction
            assertEquals(build.name, 1 to stock.implementation!!.registerCount - 1, name.registerCount to name.registerC)
            assertEquals(build.name, listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN), body.subList(1, 5).map { it.opcode })
            assertEquals(build.name, 5, (body[2] as BuilderOffsetInstruction).target.location.index)
            assertEquals(build.name, 1, (body[3] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(build.name, stockCode, body.drop(5).map { it.opcode }.filter { it != Opcode.NOP })

            if (outlined == null) continue
            val elsewhere = PatchContexts.of(ExtensionDex.classes() + checkClasses)
            val check = elsewhere.mutableClassDefBy(stock.definingClass).methods.single { it.name == stock.name && it.parameterTypes == stock.parameterTypes }
            val index = check.implementation!!.instructions.indexOfFirst { it.opcode == Opcode.CONST_16 && (it as NarrowLiteralInstruction).narrowLiteral == outlined }
            check.replaceInstruction(index, "const/16 v${(check.implementation!!.instructions.elementAt(index) as OneRegisterInstruction).registerA}, ${outlined + 1}")
            val refused = assertThrows(build.name, PatchException::class.java) { elsewhere.countCopyAsThreads() }
            assertTrue(refused.message, refused.message!!.contains("found 0"))
        }
    }

    @Test
    fun `a build without the check is refused`() {
        val refused = assertThrows(PatchException::class.java) { PatchContexts.of(ExtensionDex.classes()).countCopyAsThreads() }
        assertTrue(refused.message, refused.message!!.contains("found 0"))
    }

    private fun context(build: File): BytecodePatchContext = PatchContexts.of(ExtensionDex.classes() + classes(build))

    /** The classes that spell one of Threads' own provider addresses out. */
    private fun classes(build: File): List<ClassDef> = cache.getOrPut(build) {
        FixtureDex.classesWhere(build, { true }) { it.loadsOwnName() }
    }

    /**
     * The classes holding a static (String)boolean that loads Threads' release package, and the
     * classes of the static (I)String tables those call, where Redex keeps outlined strings.
     */
    private fun checkClasses(build: File): List<ClassDef> = checkCache.getOrPut(build) {
        fun Method.comparesOwnName() = AccessFlags.STATIC.isSet(accessFlags) && returnType == "Z" &&
            parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;") &&
            implementation?.instructions?.any { it.loadedString() == THREADS_PACKAGE } == true
        val holders = FixtureDex.classesWhere(build, { true }) { it.comparesOwnName() }
        val tables = holders.flatMap { it.methods }.filter { it.comparesOwnName() }.flatMap { it.implementation!!.instructions }
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .filter { it.returnType == "Ljava/lang/String;" && it.parameterTypes.map { type -> type.toString() } == listOf("I") }
            .map { it.definingClass }.toSet()
        (holders + FixtureDex.classes(build, tables).values).distinctBy { it.type }
    }

    private fun ownSites(build: File): List<String> = classes(build).map { it.type }

    private fun Method.loadsOwnName(): Boolean = implementation?.instructions?.any { it.namesOwnProvider() } == true

    /**
     * Whether this loads a provider address of Threads' own, bare or as a `content://` link, read
     * here without the patch's own matching.
     */
    private fun Instruction.namesOwnProvider(): Boolean {
        if (opcode != Opcode.CONST_STRING && opcode != Opcode.CONST_STRING_JUMBO) return false
        val text = ((this as ReferenceInstruction).reference as StringReference).string
        return AUTHORITIES.any { text == it || Regex("""content://${Regex.escape(it)}([/?#].*)?""").matches(text) }
    }

    private companion object {
        /** Threads' own provider authorities, as the manifests of the declared builds list them. */
        val AUTHORITIES = setOf(
            "androidx-startup", "fileprovider", "hatch.chat.files", "hatch.files",
            "liteprovider.BarcelonaLiteContentProvider", "liteprovider.usdid.UsdidValuesProvider",
            "provider.AccessLibraryContentProvider", "provider.phoneid", "securefileprovider",
        ).map { "$THREADS_PACKAGE.$it" }.toSet()

        /**
         * Threads' check for its own package on each build, read off by hand, and the index it hands
         * Redex's table of outlined strings for the debug name where it does.
         */
        val CHECKS = mapOf(
            "512508344" to ("LX/122;->A0P" to null), "512508348" to ("LX/122;->A0P" to null),
            "512508358" to ("LX/128;->A0Q" to null), "512508359" to ("LX/167;->A0Q" to null),
            "512508360" to ("LX/11X;->A0Q" to 13), "512508368" to ("LX/11V;->A0Q" to null),
            "512508369" to ("LX/122;->A0P" to null), "512508370" to ("LX/122;->A0Q" to 10),
            "512508371" to ("LX/122;->A0P" to null),
        )

        val cache = HashMap<File, List<ClassDef>>()
        val checkCache = HashMap<File, List<ClassDef>>()
    }
}
