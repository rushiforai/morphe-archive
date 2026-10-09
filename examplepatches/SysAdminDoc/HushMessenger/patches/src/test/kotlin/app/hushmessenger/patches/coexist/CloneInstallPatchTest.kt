package app.hushmessenger.patches.coexist

import app.hushmessenger.patches.MessengerTarget
import app.hushmessenger.patches.controls.SETTINGS_AUTHORITY_SUFFIX
import app.hushmessenger.patches.controls.SHORTCUT_HOST
import app.hushmessenger.patches.controls.addSettingsEntry
import app.hushmessenger.patches.controls.collectLifecycle
import app.hushmessenger.patches.controls.fixtureClass
import app.hushmessenger.patches.controls.fixtureMethod
import app.hushmessenger.patches.controls.hookId
import app.hushmessenger.patches.controls.lifecycleApk
import app.hushmessenger.patches.controls.lifecycleClasses
import app.hushmessenger.patches.controls.lifecycleExtension
import app.hushmessenger.patches.controls.lifecycleManifest
import app.hushmessenger.patches.controls.menuSettingsPatch
import app.hushmessenger.patches.controls.withLifecycleExtension
import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.PatcherContext
import app.morphe.patcher.dex.BytecodeMode
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.StringReader
import java.io.StringWriter
import java.nio.file.Files
import java.nio.file.Path
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.xml.sax.InputSource
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertTrue

private const val COPY = "com.example.copy"
private const val LAUNCHER = """<intent-filter><action android:name="android.intent.action.MAIN"/>
    <category android:name="android.intent.category.LAUNCHER"/></intent-filter>"""

/** Messenger's manifest cut down to one of each thing the rename touches, after Install beside Meta apps. */
private val STOCK = """
    <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.facebook.orca">
      <permission android:name="com.facebook.orca.provider.ACCESS" android:protectionLevel="signature"/>
      <permission android:name="com.facebook.orca.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION" android:protectionLevel="signature"/>
      <permission android:name="app.hushfacebook.permission.prod.FB_APP_COMMUNICATION" android:protectionLevel="signature"/>
      <uses-permission android:name="com.facebook.orca.provider.ACCESS"/>
      <uses-permission android:name="com.facebook.orca.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"/>
      <uses-permission android:name="com.facebook.katana.provider.ACCESS"/>
      <uses-permission android:name="app.hushfacebook.permission.prod.FB_APP_COMMUNICATION"/>
      <queries><provider android:authorities="androidx.car.app.connection"/><package android:name="com.facebook.katana"/></queries>
      <application android:label="@string/app_name">
        <meta-data android:name="android.telephony.PROPERTY_SATELLITE_DATA_OPTIMIZED" android:value="com.facebook.orca"/>
        <activity android:name="com.facebook.messenger.neue.MainActivity" android:taskAffinity="com.facebook.orca.Main">
          <meta-data android:name="android.support.PARENT_ACTIVITY" android:value="com.facebook.orca.prefs.Parent"/>
        </activity>
        <activity android:name="com.facebook.bugreporter.BugReportActivity" android:taskAffinity="com.facebook.bugreporter"/>
        <activity android:name="$SHORTCUT_HOST" android:exported="false" android:taskAffinity=""/>
        <activity-alias android:name="com.facebook.orca.auth.StartScreenActivity" android:targetActivity="com.facebook.messenger.neue.MainActivity">
          $LAUNCHER
        </activity-alias>
        <activity-alias android:name="com.facebook.orca.LauncherAliasDreamy" android:label="@string/icon" android:enabled="false"
            android:targetActivity="com.facebook.messenger.neue.MainActivity">
          $LAUNCHER
        </activity-alias>
        <provider android:name="stock.Messages" android:authorities="com.facebook.orca.messages; com.facebook.orca.contacts"
            android:permission="com.facebook.orca.provider.ACCESS"/>
        <provider android:name="stock.Attachments" android:authorities="com.facebook.orca.tam-attachment"
            android:readPermission="com.facebook.orca.provider.ACCESS"/>
        <receiver android:name="stock.Push" android:permission="com.google.android.c2dm.permission.SEND">
          <intent-filter><action android:name="com.google.android.c2dm.intent.RECEIVE"/><category android:name="com.facebook.orca"/></intent-filter>
        </receiver>
        <receiver android:name="stock.Notify" android:permission="app.hushfacebook.permission.prod.FB_APP_COMMUNICATION">
          <intent-filter><action android:name="com.facebook.orca.notify.ACTION_NEW_MESSAGE"/></intent-filter>
        </receiver>
      </application>
    </manifest>
""".trimIndent()

private fun xml(text: String): Document =
    DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(InputSource(StringReader(text)))

private fun Document.text(): String = StringWriter().also {
    TransformerFactory.newInstance().newTransformer().transform(DOMSource(this), StreamResult(it))
}.toString()

private fun Document.elements(tag: String) = getElementsByTagName(tag).let { nodes -> (0 until nodes.length).map { nodes.item(it) as Element } }

private fun Document.named(tag: String, name: String) = elements(tag).single { it.getAttribute("android:name") == name }

private fun Document.values() = elements("*").flatMap { element ->
    (0 until element.attributes.length).map { element.attributes.item(it).nodeValue }
}

/** Authorities of the providers the app declares, not the ones it asks for under queries. */
private fun Document.authorities() = elements("application").single().let { app ->
    (0 until app.childNodes.length).mapNotNull { app.childNodes.item(it) as? Element }
}.filter { it.tagName == "provider" }.flatMap { provider -> provider.getAttribute("android:authorities").split(';').map { it.trim() } }

/** 346013440's backup lookup cut down: Messenger's own name read, then compared with the names it knows. */
private fun backupLookup(body: String = LOOKUP_BODY) = fixtureMethod("LX/E6y;-><init>()V", body, 9,
    AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value)

private val LOOKUP_BODY = """
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    invoke-static {}, LX/0eo;->A00()Landroid/app/Application;
    move-result-object v4
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v7
    const-string v0, "com.facebook.orca"
    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    const-string v1, "$BACKUP_PREFS"
    const-string v1, "$FACEBOOK_BACKUP_PREFS"
    return-void
""".trimIndent()

/** 346013440's attachment authority check, as Messenger ships it. */
private fun attachmentCheck(body: String = CHECK_BODY) = fixtureMethod("LX/4M6;->A00(Ljava/lang/String;)Z", body, 3,
    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value)

private val CHECK_BODY = """
    const/4 v1, 0x0
    if-eqz p0, :done
    const-string v0, "$TAM_SUFFIX"
    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v0
    if-eqz v0, :done
    const-string v0, "$TAM_AUTHORITY"
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-nez v0, :yes
    const-string v0, "$FACEBOOK_TAM_AUTHORITY"
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v0
    if-eqz v0, :done
    :yes
    const/4 v1, 0x1
    :done
    return v1
""".trimIndent()

private const val SET_PACKAGE = "Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;"
private const val SENDER = "LX/38C;->A00(Landroid/content/Intent;Landroid/content/Context;)V"
private const val STORY_LINK = "LX/JgF;->onClick(Landroid/view/View;)V"
private const val POOL = "LX/000;->A00(I)Ljava/lang/String;"

/** 346013440's in-app broadcast sender: Messenger's name, as Redex inlined it, then the send. */
private fun broadcastSender(body: String = SENDER_BODY) = fixtureMethod(SENDER, body, 4)

private val SENDER_BODY = """
    const-string v0, "com.facebook.orca"
    invoke-virtual {p1, v0}, $SET_PACKAGE
    invoke-static {}, LX/08Z;->A00()LX/08Z;
    move-result-object v0
    invoke-virtual {v0}, LX/0ev;->A06()LX/08g;
    move-result-object v0
    invoke-virtual {v0, p2, p1}, LX/0KF;->A0H(Landroid/content/Context;Landroid/content/Intent;)V
    return-void
""".trimIndent()

/** A string pool cut down to two keys, 0x51 giving Messenger's name. */
private fun stringPool() = fixtureMethod(POOL, """
    packed-switch p0, :keys
    const-string v0, ""
    return-object v0
    :lite
    const-string v0, "com.facebook.lite"
    return-object v0
    :orca
    const-string v0, "com.facebook.orca"
    return-object v0
    :keys
    .packed-switch 0x50
        :lite
        :orca
    .end packed-switch
""".trimIndent(), 1, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)

/**
 * 346013440's story link button cut down: Messenger's name from the pool, checked as installed, a store page when it
 * isn't, and otherwise the link sent to it.
 */
private fun storyLink(body: String = STORY_BODY) = fixtureMethod(STORY_LINK, body, 16)

private val STORY_BODY = """
    iget-object v5, p0, LX/JgF;->A02:Landroid/content/Context;
    iget-object v3, p0, LX/JgF;->A05:Ljava/lang/String;
    const/16 v2, 0x51
    invoke-static {v2}, $POOL
    move-result-object v7
    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
    move-result-object v2
    invoke-static {v2, v7}, LX/0Gb;->A05(Landroid/content/pm/PackageManager;Ljava/lang/String;)Z
    move-result v2
    if-nez v2, :installed
    iget-object v6, p0, LX/JgF;->A03:LX/7Q3;
    const/4 v8, 0x0
    move-object v9, v8
    move-object v10, v8
    move-object v11, v8
    const/4 v12, 0x0
    invoke-virtual/range {v6 .. v12}, LX/7Q3;->A04(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;
    move-result-object v2
    invoke-static {v5, v2}, LX/0gQ;->A0A(Landroid/content/Context;Landroid/content/Intent;)Z
    return-void
    :installed
    invoke-static {v3}, LX/08r;->A04(Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v2
    invoke-static {v2}, LX/CW6;->A06(Landroid/net/Uri;)Landroid/content/Intent;
    move-result-object v2
    invoke-virtual {v2, v7}, $SET_PACKAGE
    move-result-object v2
    invoke-static {v5, v2}, LX/0gQ;->A06(Landroid/content/Context;Landroid/content/Intent;)Z
    return-void
""".trimIndent()

/** Messenger opening Facebook, and a screen sending to whatever package is running: neither is a clone site. */
private fun otherIntents() = fixtureMethod("LX/A5j;->BkS(Landroid/content/Context;Landroid/content/Intent;)V", """
    const-string v0, "com.facebook.katana"
    invoke-virtual {p2, v0}, $SET_PACKAGE
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    move-result-object v0
    invoke-virtual {p2, v0}, $SET_PACKAGE
    const/16 v1, 0x50
    invoke-static {v1}, $POOL
    move-result-object v0
    invoke-virtual {p2, v0}, $SET_PACKAGE
    return-void
""".trimIndent(), 5)

private fun MutableMethod.code() = implementation!!.instructions.toList()

private fun MutableMethod.calls() = code().indices.filter { (code()[it] as? ReferenceInstruction)?.reference?.toString() == SET_PACKAGE }

private fun MutableMethod.loads(index: Int): Pair<Int, String> = code()[index].let {
    (it as OneRegisterInstruction).registerA to ((it as ReferenceInstruction).reference as StringReference).string
}

class CloneInstallPatchTest {
    @Test fun theManifestMovesWholeToTheNewPackageAndKeepsClassNames() {
        val manifest = xml(STOCK).apply { addSettingsEntry() }
        val result = manifest.renameForClone(COPY, "Copy")

        assertEquals(COPY, manifest.documentElement.getAttribute("package"))
        assertEquals(listOf("$COPY.provider.ACCESS", "$COPY.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION",
            "app.hushfacebook.permission.prod.FB_APP_COMMUNICATION"), manifest.elements("permission").map { it.getAttribute("android:name") })
        assertEquals(listOf("$COPY.provider.ACCESS", "$COPY.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION", "com.facebook.katana.provider.ACCESS",
            "app.hushfacebook.permission.prod.FB_APP_COMMUNICATION"), manifest.elements("uses-permission").map { it.getAttribute("android:name") })
        assertEquals("$COPY.messages;$COPY.contacts", manifest.named("provider", "stock.Messages").getAttribute("android:authorities"))
        assertEquals("$COPY.provider.ACCESS", manifest.named("provider", "stock.Messages").getAttribute("android:permission"))
        assertEquals("$COPY.provider.ACCESS", manifest.named("provider", "stock.Attachments").getAttribute("android:readPermission"))
        assertEquals("$COPY$TAM_SUFFIX", manifest.named("provider", "stock.Attachments").getAttribute("android:authorities"))
        // The extension asks for its provider as its own package name plus the suffix.
        assertEquals(COPY + SETTINGS_AUTHORITY_SUFFIX,
            manifest.named("provider", "app.hushmessenger.extension.SettingsProvider").getAttribute("android:authorities"))
        assertEquals(mapOf("com.facebook.orca.messages" to "$COPY.messages", "com.facebook.orca.contacts" to "$COPY.contacts",
            TAM_AUTHORITY to "$COPY$TAM_SUFFIX", "com.facebook.orca.hush.settings" to "$COPY.hush.settings"), result.authorities)
        assertEquals("androidx.car.app.connection", manifest.elements("queries").single().getElementsByTagName("provider")
            .let { (it.item(0) as Element).getAttribute("android:authorities") })

        assertEquals("$COPY.Main", manifest.named("activity", "com.facebook.messenger.neue.MainActivity").getAttribute("android:taskAffinity"))
        assertEquals("$COPY.com.facebook.bugreporter",
            manifest.named("activity", "com.facebook.bugreporter.BugReportActivity").getAttribute("android:taskAffinity"))
        assertEquals("", manifest.named("activity", SHORTCUT_HOST).getAttribute("android:taskAffinity"))
        assertEquals("$COPY.app.hushmessenger.settings",
            manifest.named("activity", "app.hushmessenger.extension.SettingsActivity").getAttribute("android:taskAffinity"))
        assertEquals(3, result.affinities)

        assertEquals(1, result.pushCategories)
        assertEquals(COPY, manifest.named("receiver", "stock.Push").getElementsByTagName("category")
            .let { (it.item(0) as Element).getAttribute("android:name") })
        // Actions are what Messenger's code sends, so they keep Messenger's names.
        assertEquals("com.facebook.orca.notify.ACTION_NEW_MESSAGE", manifest.named("receiver", "stock.Notify")
            .getElementsByTagName("action").let { (it.item(0) as Element).getAttribute("android:name") })
        assertEquals(COPY, manifest.named("meta-data", "android.telephony.PROPERTY_SATELLITE_DATA_OPTIMIZED").getAttribute("android:value"))
        assertEquals("com.facebook.orca.prefs.Parent", manifest.named("meta-data", "android.support.PARENT_ACTIVITY").getAttribute("android:value"))

        assertEquals("Copy", manifest.elements("application").single().getAttribute("android:label"))
        assertEquals("Copy", manifest.named("activity-alias", "com.facebook.orca.LauncherAliasDreamy").getAttribute("android:label"))
        assertEquals("Copy", manifest.named("activity-alias", "com.facebook.orca.auth.StartScreenActivity").getAttribute("android:label"))
        assertEquals("Copy settings", manifest.named("activity", "app.hushmessenger.extension.SettingsActivity").getAttribute("android:label"))
        assertEquals("Copy settings", manifest.named("activity-alias", "app.hushmessenger.extension.SettingsLauncher").getAttribute("android:label"))
        assertEquals("Restart Messenger", manifest.named("activity", "app.hushmessenger.extension.RestartActivity").getAttribute("android:label"))
        assertEquals(4, result.labels)
        // Android resolves alias names against the new package only when they're relative, and none are.
        assertTrue(manifest.elements("activity-alias").none { it.getAttribute("android:name").startsWith(COPY) })
        assertFalse("com.facebook.orca" in manifest.values())
    }

    @Test fun anythingThatWouldCollideStopsThePatchBeforeTheManifestChanges() {
        fun assertRefused(text: String, newPackage: String = COPY, label: String = "Copy") {
            val manifest = xml(text)
            val before = manifest.text()
            assertFailsWith<PatchException> { manifest.renameForClone(newPackage, label) }
            assertEquals(before, manifest.text())
        }
        // A provider that isn't named after Messenger would keep its authority, and Android refuses two of those.
        assertRefused(STOCK.replace("com.facebook.orca.tam-attachment", "androidx.startup"))
        assertRefused(STOCK.replace("com.facebook.orca.contacts", "com.facebook.orca.tam-attachment"))
        assertRefused(STOCK.replace("android:authorities=\"com.facebook.orca.tam-attachment\"", "android:authorities=\" \""))
        // A clone name inside Messenger's own could move one authority onto another.
        assertRefused(STOCK.replace("com.facebook.orca.contacts", "com.facebook.orca.x.messages"), "com.facebook.orca.x")
        // Without Install beside Meta apps both apps would declare Meta's own permission.
        assertRefused(STOCK.replace("app.hushfacebook.permission.prod", "com.facebook.permission.prod"))
        assertRefused(STOCK.replace("""<permission android:name="com.facebook.orca.provider.ACCESS"""", """<permission android:name="other.ACCESS""""))
        assertRefused(STOCK.replace("package=\"com.facebook.orca\"", "package=\"com.facebook.orca.hush\""))
        assertRefused(STOCK, "com.facebook.orca")
        assertRefused(STOCK, label = "@string/app_name")
    }

    @Test fun onlyUsablePackageNamesAndLabelsPass() {
        for (name in listOf(COPY, CLONE_DEFAULT_PACKAGE, "app.Messenger_2", "com.facebook.orca2")) assertTrue(isClonePackage(name), name)
        for (name in listOf(null, "", "orca", "com.facebook.orca", "COM.FACEBOOK.KATANA", "com.instagram.android", "com..orca",
            "1com.orca", "com.1orca", "com.orca.", "com.or-ca", "com.orca hush", "a." + "b".repeat(149))) assertFalse(isClonePackage(name), name)
        for (label in listOf(CLONE_DEFAULT_LABEL, "Copy", "Messenger 2", "Work (Hush)", "Chat+", "Messages, work")) assertTrue(isCloneLabel(label), label)
        for (label in listOf(null, "", " Copy", "Copy ", "@string/app_name", "?attr/label", "Copy\nTwo", "x".repeat(41), "<b>Copy</b>"))
            assertFalse(isCloneLabel(label), label)
    }

    @Test fun thePatchStartsOffAndItsOptionsRefuseUnusableValues() {
        assertEquals(CLONE_PATCH_NAME, cloneInstallPatch.name)
        assertFalse(cloneInstallPatch.default)
        assertTrue(installBesideMetaAppsPatch in cloneInstallPatch.dependencies)
        val packageName = assertNotNull(cloneInstallPatch.options["clonePackageName"])
        val label = assertNotNull(cloneInstallPatch.options["cloneAppName"])
        assertEquals(CLONE_DEFAULT_PACKAGE, packageName.default)
        assertEquals(CLONE_DEFAULT_LABEL, label.default)
        assertTrue(packageName.required && label.required)
        try {
            cloneInstallPatch.options.set("clonePackageName", COPY)
            assertEquals(COPY, packageName.value)
            assertFailsWith<Exception> { cloneInstallPatch.options.set("clonePackageName", "com.facebook.orca") }
            assertFailsWith<Exception> { cloneInstallPatch.options.set("cloneAppName", "@string/app_name") }
        } finally {
            packageName.reset()
            label.reset()
        }
    }

    @Test fun shortcutsFollowTheCloneAndOtherTargetsStay() {
        val shortcuts = xml("""
            <shortcuts xmlns:android="http://schemas.android.com/apk/res/android">
              <shortcut android:shortcutId="a"><intent android:targetPackage="com.facebook.orca" android:targetClass="$SHORTCUT_HOST"/></shortcut>
              <shortcut android:shortcutId="b"><intent android:targetPackage="com.facebook.orca" android:targetClass="$SHORTCUT_HOST"/></shortcut>
              <shortcut android:shortcutId="c"><intent android:targetPackage="com.example.other" android:targetClass="x.Y"/></shortcut>
            </shortcuts>
        """.trimIndent())
        assertEquals(2, shortcuts.retargetShortcuts(COPY))
        assertEquals(listOf(COPY, COPY, "com.example.other"), shortcuts.elements("intent").map { it.getAttribute("android:targetPackage") })
    }

    @Test fun theBackupLookupKeepsMessengersNameAndTheAttachmentCheckTakesTheClones() {
        val lookup = backupLookup()
        val check = attachmentCheck()
        val lookupBefore = lookup.code()
        val checkBefore = check.code()
        assertEquals(setOf("LX/E6y;-><init>()V", "LX/4M6;->A00(Ljava/lang/String;)Z"),
            findCloneSites(listOf(fixtureClass("LX/E6y;", listOf(lookup)), fixtureClass("LX/4M6;", listOf(check)))))
        applyCloneSites(lookup, check, COPY)

        val after = lookup.code()
        assertEquals(Opcode.CONST_STRING_JUMBO, after[5].opcode)
        assertEquals(7 to "com.facebook.orca", lookup.loads(5))
        assertEquals(lookupBefore.take(5), after.take(5))
        assertEquals(lookupBefore.drop(5), after.drop(6))

        val replaced = check.code()
        assertEquals(Opcode.CONST_STRING_JUMBO, replaced[6].opcode)
        assertEquals(0 to "$COPY$TAM_SUFFIX", check.loads(6))
        assertEquals(checkBefore.size, replaced.size)
        assertEquals(checkBefore.filterIndexed { i, _ -> i != 6 }, replaced.filterIndexed { i, _ -> i != 6 })
    }

    @Test fun aChangedLookupOrCheckStopsThePatchBeforeEitherChanges() {
        val readTwice = LOOKUP_BODY.replace("move-result-object v7\n", "move-result-object v7\n" +
            "invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;\nmove-result-object v6\n")
        for ((lookup, check) in listOf(
            backupLookup(readTwice) to attachmentCheck(),
            backupLookup(LOOKUP_BODY.replace("move-result-object v7\n", "")) to attachmentCheck(),
            backupLookup(LOOKUP_BODY.replace(FACEBOOK_BACKUP_PREFS, "otherprefs")) to attachmentCheck(),
            backupLookup() to attachmentCheck(CHECK_BODY.replace(FACEBOOK_TAM_AUTHORITY, "com.facebook.lite.tam-attachment")),
            backupLookup() to attachmentCheck(CHECK_BODY.replace("const-string v0, \"$TAM_AUTHORITY\"", "const-string v0, \"$TAM_AUTHORITY\"\n" +
                "const-string v0, \"$TAM_AUTHORITY\"")),
            backupLookup() to fixtureMethod("LX/4M6;->A00(Ljava/lang/String;)Z", CHECK_BODY, 3),
        )) {
            val lookupBefore = lookup.code()
            val checkBefore = check.code()
            assertFailsWith<PatchException> { applyCloneSites(lookup, check, COPY) }
            assertEquals(lookupBefore, lookup.code())
            assertEquals(checkBefore, check.code())
        }
        assertFailsWith<PatchException> { applyCloneSites(backupLookup(), attachmentCheck(), "com.facebook.orca") }
    }

    @Test fun messengersIntentsToItselfGoToTheClone() {
        val pool = fixtureClass("LX/000;", listOf(stringPool()))
        val pools = ownNamePoolKeys(listOf(pool))
        assertEquals(setOf("$POOL#81"), pools)
        val sender = broadcastSender()
        val story = storyLink()
        val call = story.calls().single()
        // Facebook's package, the running package and the pool's other key stay out.
        assertEquals(setOf("$SENDER@1", "$STORY_LINK@$call"), findCloneSites(listOf(pool, fixtureClass("LX/38C;", listOf(sender)),
            fixtureClass("LX/JgF;", listOf(story)), fixtureClass("LX/A5j;", listOf(otherIntents())))))
        val senderBefore = sender.code()
        val storyBefore = story.code()
        val load = storyBefore.indexOfFirst { it.opcode == Opcode.MOVE_RESULT_OBJECT && (it as OneRegisterInstruction).registerA == 7 }
        assertEquals(3, story.readersOf(load, 7).size)
        applyCloneSites(backupLookup(), attachmentCheck(), COPY, listOf(sender to 1, story to call), pools)

        // The broadcast now goes to the clone's own receivers.
        assertEquals(Opcode.CONST_STRING_JUMBO, sender.code()[0].opcode)
        assertEquals(0 to COPY, sender.loads(0))
        assertEquals(senderBefore.drop(1), sender.code().drop(1))
        // The story link's install check, store page and link all name the clone. The pool call stays, its result unread.
        assertEquals(7 to COPY, story.loads(load))
        assertEquals(storyBefore.size, story.code().size)
        assertEquals(storyBefore.filterIndexed { i, _ -> i != load }, story.code().filterIndexed { i, _ -> i != load })
    }

    @Test fun aChangedIntentSiteStopsThePatchBeforeAnythingChanges() {
        val pools = setOf("$POOL#81")
        val logs = "invoke-static {v0}, LX/0q1;->A0F(Ljava/lang/String;)V\n"
        for ((sites, keys) in listOf(
            // The name also goes to a log after the send.
            listOf(broadcastSender(SENDER_BODY.replace("invoke-static {}, LX/08Z;", "${logs}invoke-static {}, LX/08Z;")) to 1) to pools,
            listOf(broadcastSender() to 2) to pools,
            listOf(broadcastSender(SENDER_BODY.replace("com.facebook.orca", "com.facebook.katana")) to 1) to pools,
            // The pool key no longer gives Messenger's name, or the name also goes somewhere new.
            listOf(broadcastSender() to 1, storyLink().let { it to it.calls().single() }) to emptySet(),
            listOf(broadcastSender() to 1, storyLink(STORY_BODY.replace("move-result-object v7\n", "move-result-object v7\n${logs.replace("v0", "v7")}"))
                .let { it to it.calls().single() }) to pools,
            listOf(broadcastSender() to 1, broadcastSender() to 1) to pools,
        )) {
            val lookup = backupLookup()
            val check = attachmentCheck()
            val before = (listOf(lookup, check) + sites.map { it.first }).map { it.code() }
            assertFailsWith<PatchException> { applyCloneSites(lookup, check, COPY, sites, keys) }
            assertEquals(before, (listOf(lookup, check) + sites.map { it.first }).map { it.code() })
        }
    }

    @Test fun eachBuildFamilyHasItsOwnPinnedSites() {
        val families = MessengerTarget.VERSION_CODES.map { expectedCloneSitesFor(it.toString()) }.toSet()
        assertEquals(6, families.size)
        assertTrue(families.all { it.size == 7 && it.count { id -> '@' in id } == 5 })
        assertEquals(setOf("LX/E9W;-><init>()V", "LX/4Di;->A00(Ljava/lang/String;)Z",
            "LX/38G;->A00(Landroid/content/Intent;Landroid/content/Context;)V@1",
            "LX/8fw;->A04(Landroid/os/Bundle;)LX/9Op;@228", "LX/8fw;->A04(Landroid/os/Bundle;)LX/9Op;@324",
            "LX/BCY;->onClick(Landroid/view/View;)V@81", "LX/JTZ;->onClick(Landroid/view/View;)V@168"), expectedCloneSitesFor("346213585"))
        assertFailsWith<PatchException> { expectedCloneSitesFor("346013999") }
    }

    @Test fun theManifestMovesOnlyWhenACloneIsRequestedAndAfterSettingsAreAdded(@TempDir temporary: Path) {
        val extension = lifecycleExtension()
        val request = bytecodePatch(description = "Request a test clone") {
            dependsOn(cloneResources)
            execute { requestClone(COPY, "Copy") }
        }
        val permissions = """
            <permission android:name="com.facebook.orca.provider.ACCESS" android:protectionLevel="signature"/>
            <permission android:name="app.hushfacebook.receiver.permission.ACCESS" android:protectionLevel="signature"/>
            <uses-permission android:name="com.facebook.orca.provider.ACCESS"/>
        """.trimIndent()
        val components = """
            <provider android:name="stock.Messages" android:authorities="com.facebook.orca.messages" android:exported="false"
                android:permission="com.facebook.orca.provider.ACCESS"/>
            <receiver android:name="stock.Push" android:exported="true">
              <intent-filter><action android:name="com.google.android.c2dm.intent.RECEIVE"/>
                <category android:name="com.facebook.orca"/></intent-filter>
            </receiver>
        """.trimIndent()
        for ((name, selection) in listOf<Pair<String, Set<Patch<*>>>>("off" to setOf(menuSettingsPatch), "on" to setOf(menuSettingsPatch, request))) {
            val owner = if (name == "on") COPY else "com.facebook.orca"
            val apk = lifecycleApk(temporary.resolve("input-$name"), lifecycleClasses(), permissions, components)
            withLifecycleExtension(extension) { _ ->
                Patcher(PatcherConfig(apk, temporary.resolve("patcher-$name").toFile(), useBytecodeMode = BytecodeMode.FULL)).use { patcher ->
                    patcher += selection
                    val results = collectLifecycle(patcher)
                    assertEquals(selection, results.map { it.patch }.toSet(), name)
                    for (result in results) assertNull(result.exception, "$name: ${result.exception?.stackTraceToString()}")
                    val resources = PatcherContext::class.java.getMethod("getResourceContext\$morphe_patcher")
                        .invoke(patcher.context) as ResourcePatchContext
                    resources.document("AndroidManifest.xml").use { manifest ->
                        assertEquals(owner, manifest.documentElement.getAttribute("package"), name)
                        assertEquals(listOf("$owner.messages", owner + SETTINGS_AUTHORITY_SUFFIX), manifest.authorities(), name)
                        assertEquals(listOf("$owner.provider.ACCESS", "app.hushfacebook.receiver.permission.ACCESS"),
                            manifest.elements("permission").map { it.getAttribute("android:name") }, name)
                        assertEquals("$owner.provider.ACCESS", manifest.named("provider", "stock.Messages").getAttribute("android:permission"), name)
                        assertEquals(owner, manifest.named("receiver", "stock.Push").getElementsByTagName("category")
                            .let { (it.item(0) as Element).getAttribute("android:name") }, name)
                        assertEquals(if (name == "on") "$COPY.app.hushmessenger.settings" else "app.hushmessenger.settings",
                            manifest.named("activity", "app.hushmessenger.extension.SettingsActivity").getAttribute("android:taskAffinity"), name)
                    }
                    resources.document("res/xml/stock_shortcuts.xml").use { shortcuts ->
                        assertEquals(listOf(owner, owner), shortcuts.elements("intent").map { it.getAttribute("android:targetPackage") }, name)
                    }
                    val output = patcher.get()
                    // The written DEX streams hold the patcher's files open until they're read or closed.
                    output.dexFiles.forEach { it.stream.close() }
                    val built = lifecycleManifest(assertNotNull(output.resources.resourcesApk))
                    assertEquals(owner, built.documentElement.getAttribute("package"), name)
                    assertEquals(listOf("$owner.messages", owner + SETTINGS_AUTHORITY_SUFFIX), built.authorities(), name)
                }
            }
        }
    }

    @Test fun everyStockBuildHasItsBackupLookupAttachmentCheckAndIntentsToItself() {
        val apks = stockApks()
        val families = mutableSetOf<Set<String>>()
        // The longer method can widen a goto or drop the padding before a switch table, so compare what each
        // instruction does, not which object holds it.
        fun List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>.shape() =
            filter { it.opcode != Opcode.NOP }.map { it.opcode.name.substringBefore('/') }
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes: List<ClassDef> = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val expected = expectedCloneSitesFor(code)
            val pools = ownNamePoolKeys(classes)
            assertEquals(1, pools.size, code)
            assertEquals(expected, findCloneSites(classes, pools), code)
            families += expected
            val methods = expected.map { it.substringBefore('@') }.distinct().associateWith { id ->
                MutableMethod(classes.single { it.type == id.substringBefore("->") }.methods.single { it.hookId() == id })
            }
            val (calls, checks) = expected.partition { '@' in it }
            val lookup = methods.getValue(checks.single { it.endsWith("-><init>()V") })
            val check = methods.getValue(checks.single { !it.endsWith("-><init>()V") })
            val sites = calls.map { methods.getValue(it.substringBefore('@')) to it.substringAfter('@').toInt() }
            val loads = sites.map { (method, call) -> method.selfIntentSite(call, pools) }
            // Four calls only send the name. The story link button also checks it's installed and opens its store page.
            assertEquals(listOf(1, 1, 1, 1, 3), sites.zip(loads).map { (site, load) -> site.first.readersOf(load.first, load.second).size }.sorted(), code)
            val (at, register) = lookup.backupLookupSite()
            val before = lookup.code()
            val sitesBefore = sites.map { it.first }.distinct().associateWith { it.code() }
            applyCloneSites(lookup, check, CLONE_DEFAULT_PACKAGE, sites, pools)
            assertEquals(register to "com.facebook.orca", lookup.loads(at), code)
            assertEquals(before.shape(), lookup.code().filterIndexed { i, _ -> i != at }.shape(), code)
            assertEquals(1, check.code().count { (it as? ReferenceInstruction)?.reference.let { r -> r is StringReference && r.string == "$CLONE_DEFAULT_PACKAGE$TAM_SUFFIX" } }, code)
            assertTrue(check.code().none { (it as? ReferenceInstruction)?.reference.let { r -> r is StringReference && r.string == TAM_AUTHORITY } }, code)
            for ((site, load) in sites.zip(loads)) {
                assertEquals(load.second to CLONE_DEFAULT_PACKAGE, site.first.loads(load.first), "$code ${site.first.hookId()}@${site.second}")
            }
            for ((method, old) in sitesBefore) {
                val changed = sites.zip(loads).filter { it.first.first === method }.map { it.second.first }.toSet()
                assertEquals(old.filterIndexed { i, _ -> i !in changed }.shape(), method.code().filterIndexed { i, _ -> i !in changed }.shape(), code)
                // No setPackage call there sends to Messenger any more.
                assertTrue(findCloneSites(listOf(fixtureClass(method.definingClass, listOf(method))), pools).isEmpty(), code)
            }
        }
        assertEquals(6, families.size)
    }

    @Test fun everyStockManifestMovesWholeUnderTheDefaultClonePackage() {
        for (apk in stockApks()) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            val manifest = lifecycleManifest(apk.toFile())
            manifest.renameSharedPermissions()
            manifest.addSettingsEntry()
            val original = manifest.authorities()
            val queried = manifest.elements("queries").flatMap { it.getElementsByTagName("provider").let { nodes ->
                (0 until nodes.length).map { (nodes.item(it) as Element).getAttribute("android:authorities") } } }
            val result = manifest.renameForClone(CLONE_DEFAULT_PACKAGE, CLONE_DEFAULT_LABEL)

            val moved = manifest.authorities()
            assertEquals(CLONE_DEFAULT_PACKAGE, manifest.documentElement.getAttribute("package"), code)
            assertEquals(original.size, moved.size, code)
            assertEquals(moved.size, moved.toSet().size, code)
            assertTrue(moved.all { it.startsWith("$CLONE_DEFAULT_PACKAGE.") } && moved.none { it in original }, code)
            assertTrue(CLONE_DEFAULT_PACKAGE + SETTINGS_AUTHORITY_SUFFIX in moved && "$CLONE_DEFAULT_PACKAGE$TAM_SUFFIX" in moved, code)
            assertEquals(queried, manifest.elements("queries").flatMap { it.getElementsByTagName("provider").let { nodes ->
                (0 until nodes.length).map { (nodes.item(it) as Element).getAttribute("android:authorities") } } }, code)
            assertTrue(manifest.elements("permission").all { it.getAttribute("android:name").let { name ->
                name.startsWith("$CLONE_DEFAULT_PACKAGE.") || name.startsWith("app.hushfacebook.") } }, code)
            assertEquals(5, result.permissions.size, code)
            assertTrue(manifest.elements("*").all { element -> element.getAttribute("android:taskAffinity").let {
                it.isEmpty() || it.startsWith("$CLONE_DEFAULT_PACKAGE.") } }, code)
            assertTrue(result.pushCategories > 0, code)
            assertFalse("com.facebook.orca" in manifest.values(), code)
            val aliases = manifest.elements("activity-alias").filter { it.getAttribute("android:name").startsWith("com.facebook.orca.LauncherAlias") }
            assertEquals(7, aliases.size, code)
            assertTrue(aliases.all { it.getAttribute("android:label") == CLONE_DEFAULT_LABEL }, code)
        }
    }

    private fun stockApks(): List<Path> {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(MessengerTarget.VERSION_CODES.size, apks.size)
        return apks
    }
}
