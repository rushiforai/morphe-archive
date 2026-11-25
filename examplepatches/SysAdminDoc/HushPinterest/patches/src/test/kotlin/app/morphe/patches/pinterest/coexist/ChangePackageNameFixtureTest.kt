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
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.util.MethodUtil
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

    /**
     * Where each declared build sends the app's package to reCAPTCHA, read here without the patch's
     * own matching: a getPackageName whose result lands, a few instructions on, in the SDK's signals
     * map or in a String field of an SDK request. The init request is one, and its builder sits
     * outside the SDK's package after R8, which is the read the server refused a copy on. Each of
     * those now asks the extension, on the same register, and the SDK's other reads of the package,
     * the PackageManager lookups that need the real name, stay as they were.
     */
    @Test
    fun `each declared build's reCAPTCHA reports the package through the extension`() {
        for (build in Fixtures.declaredBuilds()) {
            val sdk = recaptcha(build)
            val stock = sdk.flatMap { type -> type.methods.flatMap { method -> packageReads(method).map { Triple(method, it, reportsIt(method, it)) } } }
            val reports = stock.count { it.third }
            assertTrue("${build.name}: reCAPTCHA reports the package nowhere", reports > 0)
            assertTrue("${build.name}: reCAPTCHA looks the app up nowhere", stock.any { !it.third })
            assertTrue(
                "${build.name}: no request field outside the SDK's package gets the package",
                stock.any { (method, at, report) -> report && !method.definingClass.startsWith(SDK) && fieldSet(method, at) },
            )
            val context = PatchContexts.of(ExtensionDex.classes() + sdk)
            assertEquals(build.name, reports, context.reportPinterestToRecaptcha())
            for ((method, at, report) in stock) {
                val register = (method.implementation!!.instructions.toList()[at] as FiveRegisterInstruction).registerC
                val now = context.mutableClassDefBy(method.definingClass).methods.single { MethodUtil.methodSignaturesMatch(it, method) }
                    .implementation!!.instructions.toList()[at]
                val where = "${build.name} ${method.definingClass}->${method.name} @$at"
                if (report) {
                    assertEquals(where, Opcode.INVOKE_STATIC, now.opcode)
                    assertEquals(where, REPORTED_PACKAGE_CALL, (now as ReferenceInstruction).reference.toString())
                    assertEquals(where, 1, (now as FiveRegisterInstruction).registerCount)
                    assertEquals(where, register, now.registerC)
                } else {
                    assertEquals(where, Opcode.INVOKE_VIRTUAL, now.opcode)
                    assertTrue(where, (now as ReferenceInstruction).reference.toString().endsWith(GET_PACKAGE_NAME))
                }
            }
        }
    }

    /** A build whose reCAPTCHA only looks the app up gives the patch nothing to change, and the patch refuses such a build. */
    @Test
    fun `reCAPTCHA's package lookups alone give the patch nothing`() {
        for (build in Fixtures.declaredBuilds()) {
            val lookups = recaptcha(build).filter { type -> type.methods.none { method -> packageReads(method).any { reportsIt(method, it) } } }
            assertTrue("${build.name}: reCAPTCHA looks the app up nowhere", lookups.isNotEmpty())
            assertEquals(build.name, 0, PatchContexts.of(ExtensionDex.classes() + lookups).reportPinterestToRecaptcha())
        }
    }

    /** The classes with a method that reads the package and is the SDK's or calls into it. */
    private fun recaptcha(build: File): List<ClassDef> = recaptchaCache.getOrPut(build) {
        FixtureDex.classesWhere(build, { true }) { method ->
            packageReads(method).isNotEmpty() && (method.definingClass.startsWith(SDK) ||
                method.implementation!!.instructions.any { (it as? ReferenceInstruction)?.reference?.toString()?.contains(SDK) == true })
        }
    }

    private fun packageReads(method: Method): List<Int> {
        val body = method.implementation?.instructions?.toList() ?: return emptyList()
        return body.indices.filter { at ->
            body[at].opcode == Opcode.INVOKE_VIRTUAL && (body[at] as ReferenceInstruction).reference.toString().endsWith(GET_PACKAGE_NAME)
        }
    }

    /** The call the package read at [at] is handed to: the first call within ten instructions that passes the moved register. */
    private fun handedTo(method: Method, at: Int): Pair<FiveRegisterInstruction, MethodReference>? {
        val body = method.implementation!!.instructions.toList()
        val kept = body.getOrNull(at + 1) as? OneRegisterInstruction ?: return null
        if (kept.opcode != Opcode.MOVE_RESULT_OBJECT) return null
        return body.subList(at + 2, minOf(body.size, at + 10)).firstNotNullOfOrNull { next ->
            val call = next as? FiveRegisterInstruction
            val to = (next as? ReferenceInstruction)?.reference as? MethodReference
            if (call != null && to != null && (0 until call.registerCount).any { call.register(it) == kept.registerA }) call to to else null
        }
    }

    private fun FiveRegisterInstruction.register(n: Int) = listOf(registerC, registerD, registerE, registerF, registerG)[n]

    /** Whether the package read at [at] is sent: put as the value of the SDK's signals, or set as a String field of an SDK request. */
    private fun reportsIt(method: Method, at: Int): Boolean {
        val (call, to) = handedTo(method, at) ?: return false
        val value = (method.implementation!!.instructions.toList()[at + 1] as OneRegisterInstruction).registerA
        val signal = to.name == "put" && to.parameterTypes.size == 2 && call.registerCount == 3 && call.registerE == value &&
            method.definingClass.startsWith(SDK)
        return signal || fieldSet(method, at)
    }

    /** Whether the package read at [at] goes into a String field of an SDK request: a one-String, void setter of an SDK class. */
    private fun fieldSet(method: Method, at: Int): Boolean {
        val (call, to) = handedTo(method, at) ?: return false
        return to.definingClass.startsWith(SDK) && call.registerCount == 2 && to.returnType == "V" &&
            to.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;")
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
        val recaptchaCache = HashMap<File, List<ClassDef>>()
        const val GET_PACKAGE_NAME = "->getPackageName()Ljava/lang/String;"
        const val SDK = "Lcom/google/android/recaptcha/"
    }
}
