/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at 2cb2182 (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.pinterest.coexist

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.shared.compat.AppCompatibilities.PINTEREST_PACKAGE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.ByteArrayInputStream
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category
import org.w3c.dom.Document

/**
 * Change package name on the Pinterest builds the bundle declares: the manifest's own permissions
 * and providers all move, and the provider addresses Pinterest's code spells out go through the
 * extension.
 */
@Category(FixtureTests::class)
class ChangePackageNameFixtureTest {
    private val copy = "org.example.pinboard"

    /** Pinterest's own permissions and providers, as the manifests of the declared builds list them, read off by hand. */
    @Test
    fun `each declared build's own names are the ones the patch moves`() {
        for (build in Fixtures.declaredBuilds()) {
            val document = manifest(build)
            assertEquals(build.name, AUTHORITIES, document.ownAuthorities(PINTEREST_PACKAGE))
            assertEquals(build.name, PERMISSIONS, document.ownPermissions(PINTEREST_PACKAGE))

            document.renameCopy(copy, DEFAULT_APP_NAME, document.ownAuthorities(PINTEREST_PACKAGE), document.ownPermissions(PINTEREST_PACKAGE))
            assertEquals(build.name, AUTHORITIES.map { copy + it.removePrefix(PINTEREST_PACKAGE) }.toSet(), document.ownAuthorities(copy))
            assertEquals(build.name, PERMISSIONS.map { copy + it.removePrefix(PINTEREST_PACKAGE) }.toSet(), document.ownPermissions(copy))
            assertTrue(build.name, document.ownAuthorities(PINTEREST_PACKAGE).isEmpty())
            // Nothing declares, asks for or requires a permission under Pinterest's name any more.
            val permissions = (document.elements("permission") + document.elements("uses-permission")).map { it.getAttribute("android:name") } +
                document.elements("*").flatMap { element ->
                    listOf("android:permission", "android:readPermission", "android:writePermission").map { element.getAttribute(it) }
                }
            assertEquals(build.name, emptyList<String>(), permissions.filter { it.startsWith("$PINTEREST_PACKAGE.") })
            assertEquals(build.name, DEFAULT_APP_NAME, document.elements("application").single().getAttribute("android:label"))
        }
    }

    /** Every literal of the stock build that names one of Pinterest's own providers: the FileProvider's, where it shares and saves its own files. */
    @Test
    fun `each declared build hands its own provider addresses to the extension`() {
        for (build in Fixtures.declaredBuilds()) {
            val literals = classes(build).sumOf { type ->
                type.methods.sumOf { method -> method.implementation?.instructions?.count { it.namesOwnProvider() } ?: 0 }
            }
            assertTrue("${build.name} spells none of them out", literals > 0)
            val context = PatchContexts.of(ExtensionDex.classes() + classes(build))
            assertEquals(build.name, literals, context.routeOwnAuthorities("test", PINTEREST_PACKAGE, AUTHORITIES))
            // Each literal is followed by one call now.
            val calls = classes(build).sumOf { type ->
                context.mutableClassDefBy(type.type).methods.sumOf { method ->
                    method.implementation?.instructions?.count { (it as? ReferenceInstruction)?.reference?.toString() == AUTHORITY_CALL } ?: 0
                }
            }
            assertEquals(build.name, literals, calls)
        }
    }

    private fun manifest(build: File): Document = DocumentBuilderFactory.newInstance().newDocumentBuilder()
        .parse(ByteArrayInputStream(Fixtures.manifest(build).toByteArray()))

    /** The classes that spell one of Pinterest's own provider addresses out. */
    private fun classes(build: File): List<ClassDef> = cache.getOrPut(build) {
        FixtureDex.classesWhere(build, { true }) { it.loadsOwnName() }
    }

    private fun Method.loadsOwnName(): Boolean = implementation?.instructions?.any { it.namesOwnProvider() } == true

    /**
     * Whether this loads a provider address of Pinterest's own, bare or as a `content://` link, read
     * here without the patch's own matching.
     */
    private fun Instruction.namesOwnProvider(): Boolean {
        if (opcode != Opcode.CONST_STRING && opcode != Opcode.CONST_STRING_JUMBO) return false
        val text = ((this as ReferenceInstruction).reference as StringReference).string
        return AUTHORITIES.any { text == it || Regex("""content://${Regex.escape(it)}([/?#].*)?""").matches(text) }
    }

    private companion object {
        val AUTHORITIES = setOf("CredentialsProvider", "androidx-startup", "provider").map { "$PINTEREST_PACKAGE.$it" }.toSet()
        val PERMISSIONS = setOf("account.Credentials", "DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION").map { "$PINTEREST_PACKAGE.$it" }.toSet()
        val cache = HashMap<File, List<ClassDef>>()
    }
}
