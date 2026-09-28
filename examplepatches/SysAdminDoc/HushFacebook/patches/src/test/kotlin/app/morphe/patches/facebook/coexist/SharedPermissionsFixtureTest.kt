/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.coexist

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.apksig.internal.apk.AndroidBinXmlParser
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import java.io.File
import java.nio.ByteBuffer
import java.util.zip.ZipFile
import java.util.zip.ZipInputStream
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.w3c.dom.Attr
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.Node

/**
 * Install beside Meta's apps against each declared Facebook build: what the manifest declares,
 * every mention the rename moves, and every place the code names either permission.
 *
 * The patch renames two names and routes three literals. That's only enough if the build declares
 * nothing else another Meta app could declare, and names the two nowhere the routing can't reach,
 * such as a static field's value or another spelling. Both are pinned here, build by build.
 */
class SharedPermissionsFixtureTest {
    private val android = "http://schemas.android.com/apk/res/android"

    /** The base APK's binary manifest. */
    private fun manifestOf(bundle: File): ByteBuffer {
        ZipFile(bundle).use { zip ->
            val base = checkNotNull(zip.getEntry("base.apk")) { "${bundle.name} holds no base.apk" }
            ZipInputStream(zip.getInputStream(base).buffered()).use { apk ->
                while (true) {
                    val entry = apk.nextEntry ?: break
                    if (entry.name == "AndroidManifest.xml") return ByteBuffer.wrap(apk.readBytes())
                }
            }
        }
        throw AssertionError("${bundle.name}: the base APK has no manifest")
    }

    /**
     * The binary manifest as the kind of document the resource patch is handed: elements by tag,
     * Android's attributes as `android:<name>`, every value as text.
     */
    private fun documentOf(xml: ByteBuffer): Document {
        val document = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument()
        val parser = AndroidBinXmlParser(xml)
        val open = ArrayDeque<Node>().apply { addLast(document) }
        while (true) {
            when (parser.next()) {
                AndroidBinXmlParser.EVENT_START_ELEMENT -> {
                    val element = document.createElement(parser.name)
                    for (at in 0 until parser.attributeCount) {
                        val name = parser.getAttributeName(at)
                        check(name.isNotEmpty()) { "attribute $at of <${parser.name}> has no name" }
                        val qualified = if (parser.getAttributeNamespace(at) == android) "android:$name" else name
                        val value = when (parser.getAttributeValueType(at)) {
                            AndroidBinXmlParser.VALUE_TYPE_STRING -> parser.getAttributeStringValue(at)
                            AndroidBinXmlParser.VALUE_TYPE_BOOLEAN -> parser.getAttributeBooleanValue(at).toString()
                            else -> runCatching { parser.getAttributeIntValue(at).toString() }.getOrDefault("")
                        }
                        element.setAttribute(qualified, value)
                    }
                    open.last().appendChild(element)
                    open.addLast(element)
                }
                AndroidBinXmlParser.EVENT_END_ELEMENT -> open.removeLast()
                AndroidBinXmlParser.EVENT_END_DOCUMENT -> return document
            }
        }
    }

    private fun Document.elements(tag: String): List<Element> {
        val nodes = getElementsByTagName(tag)
        return (0 until nodes.length).map { nodes.item(it) as Element }
    }

    private fun Document.values(): List<String> = elements("*").flatMap { element ->
        (0 until element.attributes.length).map { (element.attributes.item(it) as Attr).value }
    }

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    /** Parameters compared as text: dexlib2's lists of two kinds don't equal each other. */
    private fun Method.sameSignatureAs(other: Method) = name == other.name && returnType == other.returnType &&
        parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }

    @Test
    fun eachDeclaredBuildDeclaresNothingElseAMetaAppCouldAndRenamesEveryMention() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val document = documentOf(manifestOf(bundle))

                // Every permission Facebook declares, by name and protection level. The shared two are
                // signature-level, and everything else is named after Facebook's own package, which
                // no other app declares. A new name outside both has to be read before it ships.
                val declared = document.elements("permission")
                    .associate { it.getAttribute("android:name") to it.getAttribute("android:protectionLevel") }
                assertEquals("${bundle.name}: the shared permissions and their protection",
                    SHARED_PERMISSIONS.associateWith { "2" }, declared.filterKeys { it in SHARED_PERMISSIONS })
                assertEquals("${bundle.name}: declared permissions another app could declare too", emptyList<String>(),
                    declared.keys.filter { it !in SHARED_PERMISSIONS && !it.startsWith("com.facebook.katana.") })

                val moved = document.renameSharedPermissions()

                // FB_APP_COMMUNICATION guards 46 components on both builds (27 activities, 14 receivers,
                // 4 services and a provider on 580). The other guards only the device id receiver.
                assertEquals("${bundle.name}: FB_APP_COMMUNICATION", Mentions(1, 1, 46), moved[APP_COMMUNICATION])
                assertEquals("${bundle.name}: receiver.permission.ACCESS", Mentions(1, 1, 1), moved[RECEIVER_ACCESS])
                val values = document.values()
                assertEquals("${bundle.name}: shared names left", emptyList<String>(), values.filter { it in SHARED_PERMISSIONS })
                assertEquals(48, values.count { it == renamed(APP_COMMUNICATION) })
                assertEquals(3, values.count { it == renamed(RECEIVER_ACCESS) })
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    @Test
    fun eachDeclaredBuildNamesThePermissionsOnlyWhereTheRoutingReaches() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val spellings = sortedSetOf<String>()
                val fields = mutableListOf<String>()
                val methods = mutableMapOf<String, Int>()
                val callers = mutableListOf<ClassDef>()
                FixtureDex.forEach(bundle) { dex ->
                    dex.stringSection.filterTo(spellings) {
                        it.contains("FB_APP_COMMUNICATION") || it.contains("receiver.permission.ACCESS")
                    }
                    if (dex.stringSection.none { it in SHARED_LITERALS }) return@forEach
                    for (classDef in dex.classes) {
                        classDef.staticFields
                            .filter { (it.initialValue as? StringEncodedValue)?.value in SHARED_LITERALS }
                            .forEach { fields += "${classDef.type}->${it.name}" }
                        var loads = false
                        for (method in classDef.methods) {
                            val literals = method.instructions().mapNotNull { it.sharedLiteral() }.toSet()
                            literals.forEach { methods.merge(it, 1, Int::plus) }
                            loads = loads || literals.isNotEmpty()
                        }
                        if (loads) callers += ImmutableClassDef.of(classDef)
                    }
                }

                // No other spelling, and nothing kept in a field: every mention is a load the patch routes.
                assertEquals("${bundle.name}: spellings of the two names", emptyList<String>(),
                    spellings.filter { it !in SHARED_LITERALS })
                assertEquals("${bundle.name}: fields holding a name", emptyList<String>(), fields)
                // The cross-app broadcast manager, Profilo's trace control twice, and the login state
                // broadcast use the format; the MQTT service's receiver and the zero-rating switch the name.
                assertEquals("${bundle.name}: methods loading each literal",
                    mapOf(APP_COMMUNICATION to 2, APP_COMMUNICATION_FORMAT to 4), methods)

                val context = PatchContexts.of(callers)
                assertEquals("${bundle.name}: loads routed", 6, context.routeSharedLiterals())
                for (before in callers) {
                    val after = context.mutableClassDefBy(before.type).methods
                    for (original in before.methods) {
                        val was = original.instructions()
                        if (was.none { it.sharedLiteral() != null }) continue
                        val where = "${bundle.name}: ${original.definingClass}->${original.name}"
                        val now = after.single { it.sameSignatureAs(original) }.instructions()
                        assertEquals("$where: two instructions per load", was.size + 2 * was.count { it.sharedLiteral() != null },
                            now.size)
                        now.withIndex().filter { it.value.sharedLiteral() != null }.forEach { (index, load) ->
                            val register = (load as OneRegisterInstruction).registerA
                            val call = now[index + 1]
                            assertEquals("$where at $index", NAME_CALL, (call as ReferenceInstruction).reference.toString())
                            assertEquals("$where at $index: the call's register", register to 1,
                                (call as RegisterRangeInstruction).startRegister to call.registerCount)
                            assertEquals("$where at $index: the answer's register", register,
                                (now[index + 2] as OneRegisterInstruction).registerA)
                        }
                    }
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
