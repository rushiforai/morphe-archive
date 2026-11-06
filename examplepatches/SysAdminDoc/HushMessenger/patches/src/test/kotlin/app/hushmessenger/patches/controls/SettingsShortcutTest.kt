package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import java.io.File
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

    private fun Document.strings() = nodes("string").associate { it.getAttribute("name") to it.textContent }

    /** #141: labels are string resources, added beside Messenger's own strings. */
    @Test fun labelStringsGoInBesideMessengersOwn() {
        val file = xml("""<resources><string name="app_name">Messenger</string></resources>""")
        file.addStrings(MANIFEST_STRINGS.getValue(DEFAULT_STRINGS))
        assertEquals(mapOf("app_name" to "Messenger", SETTINGS_LABEL to "HushMessenger settings", RESTART_LABEL to "Restart Messenger",
            BOLD_LABEL to "Bold", ITALIC_LABEL to "Italic"), file.strings())
        // A second run means the APK was patched before, and nothing more goes in.
        val before = file.snapshot()
        assertFailsWith<PatchException> { file.addStrings(mapOf("hush_new" to "x", SETTINGS_LABEL to "y")) }
        assertEquals(before, file.snapshot())
        assertFailsWith<PatchException> { xml("<other/>").addStrings(mapOf("hush_new" to "x")) }
        assertTrue(file.setString(SETTINGS_LABEL, "Copy settings"))
        assertEquals("Copy settings", file.strings()[SETTINGS_LABEL])
        assertFalse(file.setString("hush_missing", "x"))
    }

    /** The launcher and the text menu show what the settings page calls the same things, in its languages. */
    @Test fun labelsMatchTheSettingsPagesOwnWords() {
        val source = File("../extensions/messenger/src/main/java/app/hushmessenger/extension")
        val keys = mapOf(SETTINGS_LABEL to "settings", RESTART_LABEL to "restart", BOLD_LABEL to "text_style_bold", ITALIC_LABEL to "text_style_italic")
        val english = source.resolve("SettingsText.java").readText()
        val tables = mapOf("res/values-vi/strings.xml" to "SettingsTextViVN.java", "res/values-zh-rTW/strings.xml" to "SettingsTextZhTw.java")
        assertEquals(setOf(DEFAULT_STRINGS) + tables.keys, MANIFEST_STRINGS.keys)
        for ((path, texts) in MANIFEST_STRINGS) {
            assertEquals(keys.keys, texts.keys, path)
            // A clone puts its own name in place of this one.
            assertTrue(SETTINGS_LABEL_NAME in texts.getValue(SETTINGS_LABEL), path)
            val table = tables[path]?.let { source.resolve(it).readText() }
            for ((string, key) in keys) {
                val text = texts.getValue(string)
                if (table == null) assertTrue("ENGLISH.put(\"$key\", \"$text\");" in english, "$path $string")
                else assertTrue("{\"$key\", \"$text\"}" in table, "$path $string")
            }
        }
    }

    /** The settings icon is an adaptive icon of the APK's own, a white gear on HushMessenger's blue (#141). */
    @Test fun theSettingsIconIsAnAdaptiveGear() {
        assertEquals("res/drawable/$SETTINGS_ICON.xml", SETTINGS_ICON_PATH)
        val icon = xml(SETTINGS_ICON_XML)
        assertEquals("adaptive-icon", icon.documentElement.tagName)
        assertEquals(listOf("background", "foreground"), icon.documentElement.childNodes.let { n ->
            (0 until n.length).mapNotNull { (n.item(it) as? Element)?.tagName } })
        val path = icon.nodes("path").single()
        assertEquals(GEAR_PATH, path.getAttribute("android:pathData"))
        // Every command has whole sets of numbers, and every point the absolute ones reach sits in the 24 unit box.
        val arity = mapOf('M' to 2, 'L' to 2, 'H' to 1, 'V' to 1, 'C' to 6, 'S' to 4, 'Q' to 4, 'T' to 2, 'A' to 7, 'Z' to 0)
        val tokens = Regex("[A-Za-z]|-?\\d*\\.?\\d+").findAll(GEAR_PATH).map { it.value }.toList()
        assertEquals(GEAR_PATH.replace(Regex("[ ,]"), "").length, tokens.sumOf { it.length }, "Nothing but commands and numbers")
        var command = ' '
        var numbers = mutableListOf<Double>()
        fun close() {
            if (command == ' ') return
            val size = arity.getValue(command.uppercaseChar())
            assertTrue(if (size == 0) numbers.isEmpty() else numbers.isNotEmpty() && numbers.size % size == 0, "$command $numbers")
            if (command.isUpperCase()) assertTrue(numbers.all { it in 0.0..24.0 }, "$command $numbers")
        }
        for (token in tokens) {
            if (token.length == 1 && token[0].isLetter()) {
                close()
                command = token.single()
                numbers = mutableListOf()
            } else numbers += token.toDouble()
        }
        close()
        assertEquals('z', command)
    }

    @Test fun resolveSkipsUnreadableEntriesAndValuesDirectory() {
        val docs = mapOf("res/ok.xml" to shortcuts())
        val entries = listOf("res/values/strings.xml", "res/broken.xml", "res/ok.xml")
        assertEquals("res/ok.xml", resolveShortcutsPath(entries) { path ->
            docs[path] ?: throw RuntimeException("parse failure")
        })
    }
}
