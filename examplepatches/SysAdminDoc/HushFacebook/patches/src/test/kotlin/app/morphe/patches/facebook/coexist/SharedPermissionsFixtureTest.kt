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
import com.android.tools.smali.dexlib2.iface.reference.StringReference
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
 * such as a static field's value or another spelling. Both are pinned here, build by build. So is
 * the same for a copy renamed with Morphe's Clone app, which has to install and start beside the
 * Facebook it was cloned from.
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

    /**
     * Each declared build as Morphe's Clone app leaves it after the default patches, with each of
     * its two options on and off, then followed by this bundle: nothing names a permission only the
     * stock app declares, no authority is one the stock app claims, and nothing it declares is one
     * Meta's own Facebook declares, so it installs beside that too (#60). Two things the runtime half
     * takes for granted are pinned too: every authority is under Facebook's package, which is what
     * the extension moves, and every process is named after the package, which is how it learns
     * the clone's name before Facebook has a context.
     */
    @Test
    fun eachDeclaredBuildClonedWithEitherOptionIsSelfConsistent() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val clone = "$FACEBOOK.morphe"
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val xml = manifestOf(bundle)
                val stock = documentOf(xml.duplicate()).apply { renameSharedPermissions() }
                val stockDeclared = stock.elements("permission").map { it.getAttribute("android:name") }.toSet()
                val stockAuthorities = stock.ownAuthorities(FACEBOOK)
                val stockPermissions = stock.ownPermissions(FACEBOOK)
                val metaDeclared = documentOf(xml.duplicate()).elements("permission").map { it.getAttribute("android:name") }.toSet()
                assertEquals("${bundle.name}: Facebook's own permissions", 5, stockPermissions.size)
                assertEquals("${bundle.name}: authorities outside $FACEBOOK", emptyList<String>(),
                    stock.authorities().filterNot { it.trim() in stockAuthorities })
                assertTrue("${bundle.name}: the dedup provider", "$FACEBOOK.ClientMessagePushDedupInfoProvider" in stockAuthorities)
                assertEquals("${bundle.name}: processes not named after the package", emptyList<String>(),
                    stock.elements("*").map { it.getAttribute("android:process") }.filter { it.isNotEmpty() && !it.startsWith(":") })

                for (permissions in listOf(true, false)) {
                    for (providers in listOf(true, false)) {
                        val where = "${bundle.name}, Update permissions $permissions, Update providers $providers"
                        val document = documentOf(xml.duplicate())
                        document.renameSharedPermissions()
                        document.cloneApp(clone, permissions, providers)

                        document.followRenamedPackage(FACEBOOK, stockAuthorities, stockPermissions)

                        val declared = document.elements("permission").map { it.getAttribute("android:name") }.toSet()
                        assertEquals("$where: declarations Meta's Facebook owns", emptySet<String>(), declared.intersect(metaDeclared))
                        assertEquals("$where: declarations", stockDeclared.size, declared.size)
                        val strays = document.elements("*").flatMap { element ->
                            (0 until element.attributes.length).map { element.attributes.item(it) as Attr }
                                .filterNot { element.tagName == "permission" && it.name == "android:name" }
                                .filter { it.value in stockDeclared && it.value !in declared }
                                .map { "<${element.tagName}> ${element.getAttribute("android:name")} ${it.name}=${it.value}" }
                        }
                        assertEquals("$where: mentions of a permission only the stock app declares", emptyList<String>(), strays)
                        assertEquals("$where: authorities the stock app claims", emptyList<String>(),
                            document.authorities().filter { it.trim() in stockAuthorities })
                    }
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    /**
     * Facebook's code spells some of its own authorities out, and a clone's code would reach the
     * stock app's providers through them. Every one is a load the routing reaches: a method loads
     * it with const-string, no field keeps one, and no other string names one.
     */
    @Test
    fun eachDeclaredBuildsOwnAuthoritiesAreLoadsTheRoutingReaches() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val authorities = documentOf(manifestOf(bundle)).ownAuthorities(FACEBOOK)
                fun Instruction.authority() = ((this as? ReferenceInstruction)?.reference as? StringReference)
                    ?.string?.ownAuthority(authorities)
                val literals = sortedSetOf<String>()
                val elsewhere = sortedSetOf<String>()
                val fields = mutableListOf<String>()
                val callers = mutableListOf<ClassDef>()
                FixtureDex.forEach(bundle) { dex ->
                    val strings = dex.stringSection.filter { text -> authorities.any { text.contains(it) } }
                    strings.filterTo(literals) { it.ownAuthority(authorities) != null }
                    strings.filterTo(elsewhere) { it.ownAuthority(authorities) == null }
                    if (strings.none { it.ownAuthority(authorities) != null }) return@forEach
                    for (classDef in dex.classes) {
                        classDef.staticFields
                            .filter { (it.initialValue as? StringEncodedValue)?.value?.ownAuthority(authorities) != null }
                            .forEach { fields += "${classDef.type}->${it.name}" }
                        if (classDef.methods.any { method -> method.instructions().any { it.authority() != null } }) {
                            callers += ImmutableClassDef.of(classDef)
                        }
                    }
                }

                assertTrue("${bundle.name}: the stock dedup address a clone deleted through",
                    "content://$FACEBOOK.ClientMessagePushDedupInfoProvider/mutestatus" in literals)
                assertEquals("${bundle.name}: fields holding an authority", emptyList<String>(), fields)
                assertEquals("${bundle.name}: other strings naming an authority", emptySet<String>(), elsewhere)
                val context = PatchContexts.of(callers)
                assertEquals("${bundle.name}: loads routed", AUTHORITY_LOADS.getValue(version),
                    context.routeOwnAuthorities(FACEBOOK, authorities))
                for (before in callers) {
                    val after = context.mutableClassDefBy(before.type).methods
                    for (original in before.methods) {
                        val was = original.instructions()
                        val loads = was.count { it.authority() != null }
                        if (loads == 0) continue
                        val where = "${bundle.name}: ${original.definingClass}->${original.name}"
                        val now = after.single { it.sameSignatureAs(original) }.instructions()
                        assertEquals("$where: two instructions per load", was.size + 2 * loads, now.size)
                        now.withIndex().filter { it.value.authority() != null }.forEach { (index, load) ->
                            val register = (load as OneRegisterInstruction).registerA
                            val call = now[index + 1]
                            assertEquals("$where at $index", AUTHORITY_CALL, (call as ReferenceInstruction).reference.toString())
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

    /**
     * The rows under Supported links for Meta App Manager (issue #30), Messenger and Instagram (#78)
     * read each app's package without QUERY_ALL_PACKAGES. Android 11 and later only answer for a
     * package `<queries>` covers, so a build that drops it would hide the row on every phone,
     * silently. App Manager is named. Messenger and Instagram aren't: Facebook sees them through its
     * bare MAIN intent query, which any app with a launcher activity matches (on a phone, `dumpsys
     * package queries` lists them under "queries via component").
     */
    @Test
    fun eachDeclaredBuildQueriesTheLinkHolders() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val document = documentOf(manifestOf(bundle))
                val queried = document.elements("queries").flatMap { queries ->
                    val packages = queries.getElementsByTagName("package")
                    (0 until packages.length).map { (packages.item(it) as Element).getAttribute("android:name") }
                }
                assertTrue("${bundle.name}: <queries> doesn't name $APP_MANAGER", APP_MANAGER in queried)
                val launchable = document.elements("queries").flatMap { queries ->
                    val intents = queries.getElementsByTagName("intent")
                    (0 until intents.length).map { intents.item(it) as Element }
                }.any { intent ->
                    val actions = intent.getElementsByTagName("action")
                    actions.length == 1 &&
                        (actions.item(0) as Element).getAttribute("android:name") == "android.intent.action.MAIN" &&
                        intent.getElementsByTagName("category").length == 0 &&
                        intent.getElementsByTagName("data").length == 0
                }
                assertTrue("${bundle.name}: no bare MAIN intent query, so Messenger and Instagram are hidden", launchable)
                assertTrue("${bundle.name}: asks for every package, so <queries> isn't what makes the holders visible",
                    document.elements("uses-permission").none {
                        it.getAttribute("android:name") == "android.permission.QUERY_ALL_PACKAGES"
                    })
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private fun Document.authorities(): List<String> =
        elements("provider").flatMap { it.getAttribute("android:authorities").split(';') }

    private companion object {
        const val FACEBOOK = AppCompatibilities.FACEBOOK_PACKAGE

        /** SupportedLinks.APP_MANAGER in the extension. */
        const val APP_MANAGER = "com.facebook.appmanager"

        /** Loads of an own authority per build, counted off the fixtures with a separate dex scan. */
        val AUTHORITY_LOADS = mapOf("581.0.0.45.58" to 13, "580.0.0.51.74" to 13, "577.0.0.50.72" to 13)
    }
}
