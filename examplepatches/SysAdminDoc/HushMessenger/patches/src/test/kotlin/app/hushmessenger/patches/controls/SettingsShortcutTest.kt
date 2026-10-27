package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import java.io.StringReader
import java.io.StringWriter
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.xml.sax.InputSource
import kotlin.test.*

class SettingsShortcutTest {
    private val filter = """<intent-filter><action android:name="android.intent.action.MAIN"/><category android:name="android.intent.category.LAUNCHER"/></intent-filter>"""
    private val metadata = """<meta-data android:name="android.app.shortcuts" android:resource="@xml/stock_shortcuts"/>"""
    private val primary = """<activity-alias android:name="com.facebook.orca.auth.StartScreenActivity" android:targetActivity="stock.Main">$filter$metadata</activity-alias>"""
    private val alternate = """<activity-alias android:name="stock.Alternate" android:enabled="false" android:targetActivity="stock.Main">$filter</activity-alias>"""
    private val share = """<share-target android:targetClass="com.facebook.messenger.intents.ShareIntentHandler"><category android:name="stock.share"/><data android:mimeType="*/*"/></share-target>"""
    private fun xml(body: String) = DocumentBuilderFactory.newInstance().newDocumentBuilder()
        .parse(InputSource(StringReader(body)))
    private val screenHost = """<activity android:name="$SCREEN_HOST" android:exported="false" android:parentActivityName="com.facebook.messenger.neue.MainActivity"><meta-data android:name="android.support.PARENT_ACTIVITY" android:value="com.facebook.messenger.neue.MainActivity"/></activity>"""
    private val shortcutHost = """<activity android:theme="@android:style/Theme.Translucent.NoTitleBar" android:name="$SHORTCUT_HOST" android:exported="false" android:taskAffinity="" android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|screenSize"/>"""
    private val factory = """android:appComponentFactory="$APP_COMPONENT_FACTORY""""
    private fun manifest(entries: String = primary + alternate, hosts: String = screenHost + shortcutHost, application: String = factory) =
        xml("""<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.facebook.orca"><application $application><activity android:name="stock.Main" android:permission="stock.permission"/>$hosts$entries</application></manifest>""")
    private fun shortcuts(body: String = share) = xml("""<shortcuts xmlns:android="http://schemas.android.com/apk/res/android">$body</shortcuts>""")
    private fun Document.snapshot() = StringWriter().also {
        TransformerFactory.newInstance().newTransformer().transform(DOMSource(this), StreamResult(it))
    }.toString()
    private fun Document.nodes(tag: String) = getElementsByTagName(tag).let { nodes ->
        (0 until nodes.length).map { nodes.item(it) as Element }
    }

    /** HushFacebook#146: the extension publishes Patch controls and Restart Messenger, so its switch can hide them. */
    @Test fun settingsGoInAndTheLauncherIconsStayStock() {
        val manifest = manifest()
        val launchers = manifest.nodes("activity-alias").map { it.cloneNode(true) }
        manifest.addSettingsAccess()
        val restartActivity = manifest.nodes("activity").single { it.getAttribute("android:name").endsWith(".RestartActivity") }
        // Shortcuts launch as Messenger itself; another app must not be able to kill and relaunch it.
        assertEquals("false", restartActivity.getAttribute("android:exported"))
        assertTrue(restartActivity.getAttribute("android:permission").isEmpty())
        assertEquals("true", restartActivity.getAttribute("android:noHistory"))
        assertEquals(0, restartActivity.getElementsByTagName("intent-filter").length)
        // Messenger's icons keep their own shortcuts file: no copy for the alternate icon, nothing added to the first.
        for ((index, launcher) in launchers.withIndex()) assertTrue(launcher.isEqualNode(manifest.nodes("activity-alias")[index]))
        assertEquals(1, manifest.nodes("meta-data").count { it.getAttribute("android:name") == "android.app.shortcuts" })
        assertEquals("stock.permission", manifest.nodes("activity")[0].getAttribute("android:permission"))
        assertEquals("app.hushmessenger.extension.SettingsLauncher", manifest.nodes("activity-alias").last().getAttribute("android:name"))
    }

    private fun assertRejected(manifest: Document) {
        val original = manifest.snapshot()
        assertFailsWith<PatchException> { manifest.addSettingsAccess() }
        assertEquals(original, manifest.snapshot())
    }

    @Test fun aMissingOrChangedScreenHostFailsBeforeMutation() {
        assertRejected(manifest(application = ""))
        assertRejected(manifest(application = factory.replace("M4aAppComponentFactory", "Other")))
        assertRejected(manifest(hosts = shortcutHost))
        assertRejected(manifest(hosts = screenHost))
        assertRejected(manifest(hosts = screenHost + shortcutHost + screenHost))
        for (change in listOf(
            """android:theme="@style/Other"""", """android:taskAffinity="app.other"""", """android:launchMode="singleTop"""",
            """android:process=":other"""", """android:enabled="false"""", """android:excludeFromRecents="true"""",
        )) assertRejected(manifest(hosts = screenHost.replace("android:exported", "$change android:exported") + shortcutHost))
        assertRejected(manifest(hosts = screenHost.replace("<meta-data", "$filter<meta-data") + shortcutHost))
        assertRejected(manifest(hosts = screenHost.replace("\"false\"", "\"true\"") + shortcutHost))
        assertRejected(manifest(hosts = screenHost.replace("activity", "activity-alias") + shortcutHost))
        // The shortcut host must stay affinity-free, see-through and standard, or a shortcut would clear Messenger's task.
        for ((from, to) in listOf(
            """android:taskAffinity=""""" to "", """android:taskAffinity=""""" to """android:taskAffinity="com.facebook.orca"""",
            "Theme.Translucent.NoTitleBar" to "Theme.Material", """android:exported="false"""" to """android:exported="false" android:launchMode="singleTop"""",
            "/>" to ">$filter</activity>",
        )) assertRejected(manifest(hosts = screenHost + shortcutHost.replace(from, to)))
    }

    @Test fun duplicateSettingsFailBeforeMutation() {
        val existing = manifest()
        existing.addSettingsEntry()
        assertRejected(existing)
    }

    @Test fun resolveFindsTheShortcutsXmlUnderAnyShrunkName() {
        val docs = mapOf(
            "res/eve.xml" to shortcuts(),
            "res/values/strings.xml" to xml("<resources/>"),
            "res/abc.xml" to xml("<resources/>"),
        )
        assertEquals("res/eve.xml", resolveShortcutsPath(docs.keys.toList()) { docs.getValue(it) })
        assertEquals("res/los.xml", resolveShortcutsPath(listOf("res/los.xml")) { shortcuts() })
    }

    /** decode() takes decoded directories: a shrunk archive name like res/eve.xml matched nothing and left one APK load per read. */
    @Test fun shortcutsAreLookedUpAmongTheDecodedXmlDirectories() {
        assertEquals("res/xml*", SHORTCUTS_DIRECTORIES)
        val docs = mapOf("res/xml/eve.xml" to shortcuts(), "res/xml-v25/abc.xml" to xml("<resources/>"))
        val reads = mutableListOf<String>()
        val path = resolveShortcutsPath(listOf("res/xml/eve.xml", "res/xml-v25/abc.xml", "res/xml/raw.bin")) { reads += it; docs.getValue(it) }
        assertEquals("res/xml/eve.xml", path)
        assertEquals(listOf("res/xml/eve.xml", "res/xml-v25/abc.xml"), reads)
    }

    @Test fun resolveRejectsZeroOrMultipleShortcutsFiles() {
        assertFailsWith<PatchException> {
            resolveShortcutsPath(listOf("res/values/strings.xml")) { xml("<resources/>") }
        }
        assertFailsWith<PatchException> {
            resolveShortcutsPath(emptyList()) { error("unreachable") }
        }
        assertFailsWith<PatchException> {
            resolveShortcutsPath(listOf("res/a.xml", "res/b.xml")) { shortcuts() }
        }
    }

    @Test fun resolveSkipsUnreadableEntriesAndValuesDirectory() {
        val docs = mapOf("res/ok.xml" to shortcuts())
        val entries = listOf("res/values/strings.xml", "res/broken.xml", "res/ok.xml")
        assertEquals("res/ok.xml", resolveShortcutsPath(entries) { path ->
            docs[path] ?: throw RuntimeException("parse failure")
        })
    }
}
