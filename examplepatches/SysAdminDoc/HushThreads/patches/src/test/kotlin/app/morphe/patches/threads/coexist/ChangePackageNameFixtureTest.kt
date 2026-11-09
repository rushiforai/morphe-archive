/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.coexist

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.shared.compat.AppCompatibilities.THREADS_PACKAGE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
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
     * on into Threads' own comparison, kept whole.
     */
    @Test
    fun `each declared build's copy passes Threads' own package check`() {
        for (build in Fixtures.declaredBuilds()) {
            val checkClasses = checkClasses(build)
            val stock = checkClasses.flatMap { it.methods }.single { it.isOwnPackageCheck() }
            val stockCode = stock.implementation!!.instructions.map { it.opcode }.filter { it != Opcode.NOP }
            val context = PatchContexts.of(ExtensionDex.classes() + checkClasses)
            assertEquals(build.name, "${stock.definingClass}->${stock.name}", context.countCopyAsThreads())

            val body = context.mutableClassDefBy(stock.definingClass).methods.single { it.isOwnPackageCheck() }
                .implementation!!.instructions.toList()
            assertEquals(build.name, OWN_PACKAGE_CALL, (body[0] as ReferenceInstruction).reference.toString())
            val name = body[0] as FiveRegisterInstruction
            assertEquals(build.name, 1 to stock.implementation!!.registerCount - 1, name.registerCount to name.registerC)
            assertEquals(build.name, listOf(Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN), body.subList(1, 5).map { it.opcode })
            assertEquals(build.name, 5, (body[2] as BuilderOffsetInstruction).target.location.index)
            assertEquals(build.name, 1, (body[3] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(build.name, stockCode, body.drop(5).map { it.opcode }.filter { it != Opcode.NOP })
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

    /** The class holding Threads' check for its own package. */
    private fun checkClasses(build: File): List<ClassDef> = checkCache.getOrPut(build) {
        FixtureDex.classesWhere(build, { true }) { it.isOwnPackageCheck() }
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

        val cache = HashMap<File, List<ClassDef>>()
        val checkCache = HashMap<File, List<ClassDef>>()
    }
}
