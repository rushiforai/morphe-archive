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

    @Test fun controlsOpenDirectlyAndKeepShareTargetsAndAlternateIcons() {
        val manifest = manifest()
        val shortcuts = shortcuts("""<shortcut android:shortcutId="stock_action"/>$share""")
        val originalShare = shortcuts.nodes("share-target").single().cloneNode(true)
        manifest.addSettingsAccess(shortcuts)
        val entry = shortcuts.nodes("shortcut").first()
        assertEquals("hushmessenger_controls", entry.getAttribute("android:shortcutId"))
        assertEquals("@string/hushmessenger_patch_controls", entry.getAttribute("android:shortcutShortLabel"))
        val intent = shortcuts.nodes("intent").first()
        assertEquals("android.intent.action.VIEW", intent.getAttribute("android:action"))
        assertEquals("com.facebook.orca", intent.getAttribute("android:targetPackage"))
        // Both shortcuts start the see-through stock host, which opens the right screen for the install.
        assertEquals(SHORTCUT_HOST, intent.getAttribute("android:targetClass"))
        assertEquals(listOf(SCREEN_EXTRA to "settings", SCREEN_EXTRA to "restart"), shortcuts.nodes("extra").map {
            it.getAttribute("android:name") to it.getAttribute("android:value")
        })
        assertTrue(originalShare.isEqualNode(shortcuts.nodes("share-target").single()))
        val restart = shortcuts.nodes("shortcut")[1]
        assertEquals("hushmessenger_restart", restart.getAttribute("android:shortcutId"))
        assertEquals("@string/hushmessenger_restart", restart.getAttribute("android:shortcutShortLabel"))
        assertEquals(SHORTCUT_HOST, shortcuts.nodes("intent")[1].getAttribute("android:targetClass"))
        val restartActivity = manifest.nodes("activity").single { it.getAttribute("android:name").endsWith(".RestartActivity") }
        // Shortcuts launch as Messenger itself; another app must not be able to kill and relaunch it.
        assertEquals("false", restartActivity.getAttribute("android:exported"))
        assertTrue(restartActivity.getAttribute("android:permission").isEmpty())
        assertEquals("true", restartActivity.getAttribute("android:noHistory"))
        assertEquals(0, restartActivity.getElementsByTagName("intent-filter").length)
        assertEquals("stock_action", shortcuts.nodes("shortcut")[2].getAttribute("android:shortcutId"))
        assertEquals(2, manifest.nodes("meta-data").count { it.getAttribute("android:resource") == "@xml/stock_shortcuts" })
        assertEquals("false", manifest.nodes("activity-alias")[1].getAttribute("android:enabled"))
        assertEquals("stock.permission", manifest.nodes("activity")[0].getAttribute("android:permission"))
        assertEquals(listOf("Patch controls", "Restart Messenger"), shortcutLabels.values.toList())
    }

    @Test fun separateIntentFiltersDoNotMakeAnEntryALauncher() {
        val split = """<activity android:name="stock.NonLauncher"><intent-filter><action android:name="android.intent.action.MAIN"/></intent-filter><intent-filter><category android:name="android.intent.category.LAUNCHER"/></intent-filter></activity>"""
        val manifest = manifest(primary + split)
        manifest.addSettingsAccess(shortcuts())
        assertEquals(1, manifest.nodes("meta-data").count { it.getAttribute("android:name") == "android.app.shortcuts" })
    }

    private fun assertRejected(manifest: Document, shortcuts: Document) {
        val original = manifest.snapshot() to shortcuts.snapshot()
        assertFailsWith<PatchException> { manifest.addSettingsAccess(shortcuts) }
        assertEquals(original, manifest.snapshot() to shortcuts.snapshot())
    }

    @Test fun missingPrimaryOrChangedShortcutReferenceFailsBeforeMutation() {
        assertRejected(manifest(alternate), shortcuts())
        assertRejected(manifest(primary.replace(metadata, "")), shortcuts())
        assertRejected(manifest(primary.replace("@xml/stock_shortcuts", "invalid")), shortcuts())
        assertRejected(manifest(primary.replace(metadata, metadata + metadata)), shortcuts())
        assertRejected(manifest(primary + alternate.replace(filter, filter + metadata.replace("stock_shortcuts", "other"))), shortcuts())
    }

    @Test fun aMissingOrChangedScreenHostFailsBeforeMutation() {
        assertRejected(manifest(application = ""), shortcuts())
        assertRejected(manifest(application = factory.replace("M4aAppComponentFactory", "Other")), shortcuts())
        assertRejected(manifest(hosts = shortcutHost), shortcuts())
        assertRejected(manifest(hosts = screenHost), shortcuts())
        assertRejected(manifest(hosts = screenHost + shortcutHost + screenHost), shortcuts())
        for (change in listOf(
            """android:theme="@style/Other"""", """android:taskAffinity="app.other"""", """android:launchMode="singleTop"""",
            """android:process=":other"""", """android:enabled="false"""", """android:excludeFromRecents="true"""",
        )) assertRejected(manifest(hosts = screenHost.replace("android:exported", "$change android:exported") + shortcutHost), shortcuts())
        assertRejected(manifest(hosts = screenHost.replace("<meta-data", "$filter<meta-data") + shortcutHost), shortcuts())
        assertRejected(manifest(hosts = screenHost.replace("\"false\"", "\"true\"") + shortcutHost), shortcuts())
        assertRejected(manifest(hosts = screenHost.replace("activity", "activity-alias") + shortcutHost), shortcuts())
        // The shortcut host must stay affinity-free, see-through and standard, or a shortcut would clear Messenger's task.
        for ((from, to) in listOf(
            """android:taskAffinity=""""" to "", """android:taskAffinity=""""" to """android:taskAffinity="com.facebook.orca"""",
            "Theme.Translucent.NoTitleBar" to "Theme.Material", """android:exported="false"""" to """android:exported="false" android:launchMode="singleTop"""",
            "/>" to ">$filter</activity>",
        )) assertRejected(manifest(hosts = screenHost + shortcutHost.replace(from, to)), shortcuts())
    }

    @Test fun changedXmlOrMissingShareTargetFailsBeforeMutation() {
        assertRejected(manifest(), shortcuts(""))
        assertRejected(manifest(), shortcuts(share.replace("ShareIntentHandler", "OtherHandler")))
        assertRejected(manifest(), shortcuts(share + share))
        assertRejected(manifest(), xml("<resources/>"))
    }

    @Test fun duplicateSettingsOrShortcutFailsBeforeMutation() {
        val existing = manifest()
        existing.addSettingsEntry()
        assertRejected(existing, shortcuts())
        assertRejected(manifest(), shortcuts("""<shortcut android:shortcutId="hushmessenger_controls"/>$share"""))
        assertRejected(manifest(), shortcuts("""<shortcut android:shortcutId="hushmessenger_restart"/>$share"""))
    }

    @Test fun labelsKeepExistingStringsAndRejectDuplicatesBeforeMutation() {
        val strings = xml("""<resources><string name="stock">Keep &amp; preserve</string></resources>""")
        val original = strings.nodes("string").single().cloneNode(true)
        strings.addShortcutLabels()
        assertTrue(original.isEqualNode(strings.nodes("string").first()))
        assertEquals(3, strings.nodes("string").size)
        val snapshot = strings.snapshot()
        assertFailsWith<PatchException> { strings.addShortcutLabels() }
        assertEquals(snapshot, strings.snapshot())
        assertFailsWith<PatchException> { xml("<wrong/>").addShortcutLabels() }
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
