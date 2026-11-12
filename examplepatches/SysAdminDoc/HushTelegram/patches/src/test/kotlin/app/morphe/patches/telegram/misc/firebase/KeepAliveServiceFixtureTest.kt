/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.firebase

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.names.origName
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.reandroid.apk.ApkModule
import com.reandroid.arsc.chunk.xml.AndroidManifestBlock
import java.io.File
import java.io.StringReader
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.xml.sax.InputSource

private const val LOADER = "Lorg/telegram/messenger/ApplicationLoader;"
private const val ANDROID = "http://schemas.android.com/apk/res/android"

/** The Keep-Alive Service start on both 13.2 builds, and the manifest entry that lets it run in front. */
class KeepAliveServiceFixtureTest {
    @Rule @JvmField val temporary = TemporaryFolder()

    @Test
    fun `startPushService hands its intent to the extension inside Telegram's own catch and the service reports each start`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val start = context.startPushService()
            val before = start.controlBody()
            val at = before.indexOfFirst { it.controlRef() == START_SERVICE }
            assertEquals("$name: one startService call", 1, before.count { it.controlRef() == START_SERVICE })
            assertEquals("$name: the call is a plain virtual call", Opcode.INVOKE_VIRTUAL, before[at].opcode)
            assertTrue("$name: Telegram ignores the result", before.getOrNull(at + 1)?.opcode !in MOVE_RESULTS)
            val address = before.take(at).sumOf { it.codeUnits }
            val catchAll = start.implementation!!.tryBlocks.filter {
                address >= it.startCodeAddress && address < it.startCodeAddress + it.codeUnitCount
            }.flatMap { it.exceptionHandlers }.filter { it.exceptionType == null }
            assertEquals("$name: the call sits inside one catch-all", 1, catchAll.size)
            val onStartBefore = context.onStartCommand().controlBody().map { it.shape() }
            assertEquals("$name: the switch starts off", 0L, context.flag("keepAliveRunning"))

            assertEquals(name, emptyList<String>(), PatchLogCapture.warnings { keepAliveServicePatch.execute(context) })

            val after = context.startPushService().controlBody()
            assertEquals("$name: no instruction added or dropped", before.size, after.size)
            assertEquals("$name: every other instruction is stock", before.map { it.shape() }.filterIndexed { i, _ -> i != at },
                after.map { it.shape() }.filterIndexed { i, _ -> i != at })
            assertEquals("$name: the extension's start", Opcode.INVOKE_STATIC, after[at].opcode)
            assertEquals(name, KEEP_ALIVE_START, after[at].controlRef())
            assertEquals("$name: the same context and intent registers", before[at].namedRegisters(), after[at].namedRegisters())
            assertEquals("$name: the call keeps its size, so the catch still covers it", before[at].codeUnits, after[at].codeUnits)

            val onStart = context.onStartCommand()
            val body = onStart.controlBody()
            assertEquals("$name: the report comes first", Opcode.INVOKE_STATIC, body[0].opcode)
            assertEquals(name, KEEP_ALIVE_STARTED, body[0].controlRef())
            val parameters = onStart.implementation!!.registerCount - 4
            assertEquals("$name: the service and its intent", listOf(parameters, parameters + 1), body[0].namedRegisters())
            assertEquals("$name: Telegram's own start follows unchanged", onStartBefore, body.drop(1).map { it.shape() })
            assertEquals("$name: the switch's capability", 1L, context.flag("keepAliveRunning"))
        }
    }

    @Test
    fun `a build without the service or the start keeps Telegram's stock start and says why`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val noService = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, setOf(LOADER)).values)
            val stock = noService.startPushService().controlBody().map { it.shape() }
            val warnings = PatchLogCapture.warnings { keepAliveServicePatch.execute(noService) }
            assertEquals(name, listOf("Repair Firebase push registration: the Keep-Alive Service is missing. " +
                "The patch goes on without keeping the Keep-Alive Service running."), warnings)
            assertEquals("$name: start untouched", stock, noService.startPushService().controlBody().map { it.shape() })
            assertEquals("$name: no capability", 0L, noService.flag("keepAliveRunning"))

            // Telegram moving to its own foreground start: neither half goes in.
            val moved = context(build)
            val start = moved.startPushService()
            val at = start.controlBody().indexOfFirst { it.controlRef() == START_SERVICE }
            val registers = start.controlBody()[at].namedRegisters()
            start.replaceInstruction(at, "invoke-virtual {v${registers[0]}, v${registers[1]}}, " +
                "Landroid/content/Context;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;")
            val movedStart = start.controlBody().map { it.shape() }
            val movedService = moved.onStartCommand().controlBody().map { it.shape() }
            assertEquals(name, "startPushService has no single startService call", moved.resolveKeepAlive().missing)
            assertEquals(name, 1, PatchLogCapture.warnings { keepAliveServicePatch.execute(moved) }.size)
            assertEquals(name, movedStart, moved.startPushService().controlBody().map { it.shape() })
            assertEquals(name, movedService, moved.onStartCommand().controlBody().map { it.shape() })
            assertEquals(name, 0L, moved.flag("keepAliveRunning"))
        }
    }

    @Test
    fun `remote messaging joins the service's types in the form they came in`() {
        assertEquals("remoteMessaging", withRemoteMessaging(""))
        assertEquals("dataSync|remoteMessaging", withRemoteMessaging("dataSync"))
        assertEquals("dataSync|remoteMessaging", withRemoteMessaging("dataSync|remoteMessaging"))
        // FOREGROUND_SERVICE_TYPE_DATA_SYNC is 0x1 and FOREGROUND_SERVICE_TYPE_REMOTE_MESSAGING is 0x200.
        assertEquals("0x00000201", withRemoteMessaging("0x00000001"))
        assertEquals("0x00000201", withRemoteMessaging("1"))
        assertEquals("0x201", withRemoteMessaging("0x201"))
    }

    @Test
    fun `the manifest gains the type and asks for its permission once`() {
        val play = parse(manifest(permissions = "", types = "dataSync"))
        assertNull(keepAliveManifest(play))
        assertEquals("dataSync|remoteMessaging", service(play).getAttribute("android:foregroundServiceType"))
        assertEquals(listOf(REMOTE_MESSAGING_PERMISSION), permissions(play))
        val first = play.documentElement.childNodes.let { nodes -> (0 until nodes.length).map { nodes.item(it) as Element } }
        assertEquals("the permission sits before the application", listOf("uses-sdk", "uses-permission", "application"), first.map { it.tagName })

        val web = parse(manifest(permissions = "<uses-permission android:name=\"$REMOTE_MESSAGING_PERMISSION\" />", types = "0x00000001"))
        assertNull(keepAliveManifest(web))
        assertEquals("0x00000201", service(web).getAttribute("android:foregroundServiceType"))
        assertEquals("no second permission", listOf(REMOTE_MESSAGING_PERMISSION), permissions(web))

        val without = parse(manifest(permissions = "", types = "dataSync", service = "org.telegram.messenger.OtherService"))
        val untouched = state(without.documentElement)
        assertEquals("the manifest has no single Keep-Alive Service", keepAliveManifest(without))
        assertEquals(untouched, state(without.documentElement))
    }

    @Test
    fun `the resource patch writes the changed manifest back`() {
        val work = temporary.newFolder()
        val apk = File(work, "input.apk")
        ApkModule().use { module ->
            module.setManifest(AndroidManifestBlock.empty().apply {
                setPackageName("org.telegram.messenger.web")
                setVersionName("13.2.2")
                setVersionCode(73039)
            })
            module.writeApk(apk)
        }
        val config = PatcherConfig(apkFile = apk, temporaryFilesPath = File(work, "patcher"))
        ResourcePatchContext::class.java.getConstructor(PatcherConfig::class.java).newInstance(config).use { context ->
            val file = context["AndroidManifest.xml"]
            file.parentFile.mkdirs()
            file.writeText(manifest(permissions = "", types = "dataSync"))
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { keepAliveManifestPatch.execute(context) })
            val written = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(file)
            assertEquals("dataSync|remoteMessaging", service(written).getAttribute("android:foregroundServiceType"))
            assertEquals(listOf(REMOTE_MESSAGING_PERMISSION), permissions(written))
        }
    }

    private fun context(build: File): BytecodePatchContext {
        val hosts = FixtureDex.classes(build, setOf(LOADER, NOTIFICATIONS_SERVICE))
        assertEquals("${build.name}: ApplicationLoader and the service", 2, hosts.size)
        return PatchContexts.of(ExtensionDex.classes() + hosts.values)
    }

    private fun BytecodePatchContext.startPushService(): MutableMethod =
        tgMutableClassDefBy(LOADER).methods.single { it.origName == "startPushService" && it.parameterTypes.isEmpty() }

    private fun BytecodePatchContext.onStartCommand(): Method =
        tgMutableClassDefBy(NOTIFICATIONS_SERVICE).methods.single { it.name == "onStartCommand" }

    private fun BytecodePatchContext.flag(name: String) =
        (tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.controlBody().first() as WideLiteralInstruction).wideLiteral

    private fun Instruction.shape() = listOf(opcode, namedRegisters(), controlRef())

    private fun manifest(permissions: String, types: String, service: String = "org.telegram.messenger.NotificationsService") =
        "<manifest xmlns:android=\"$ANDROID\" package=\"org.telegram.messenger.web\">" +
            "<uses-sdk android:minSdkVersion=\"28\" android:targetSdkVersion=\"36\" />$permissions" +
            "<application android:label=\"Telegram\"><service android:name=\"$service\" android:enabled=\"true\" " +
            "android:exported=\"true\" android:foregroundServiceType=\"$types\" /></application></manifest>"

    private fun parse(xml: String): Document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(InputSource(StringReader(xml)))

    private fun service(document: Document) = document.getElementsByTagName("service").item(0) as Element

    private fun permissions(document: Document) = document.getElementsByTagName("uses-permission").let { nodes ->
        (0 until nodes.length).map { (nodes.item(it) as Element).getAttribute("android:name") }
    }

    private fun state(element: Element): List<Any?> {
        val attributes = (0 until element.attributes.length).map { element.attributes.item(it) }.map { it.nodeName to it.nodeValue }.sortedBy { it.first }
        val children = (0 until element.childNodes.length).map { element.childNodes.item(it) }.filterIsInstance<Element>()
        return listOf(element.tagName, attributes, children.map { state(it) })
    }

    private companion object {
        val MOVE_RESULTS = setOf(Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_WIDE, Opcode.MOVE_RESULT_OBJECT)
    }
}
