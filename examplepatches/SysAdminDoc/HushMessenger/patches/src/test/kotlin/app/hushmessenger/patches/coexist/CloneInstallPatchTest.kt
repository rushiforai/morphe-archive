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

private fun MutableMethod.code() = implementation!!.instructions.toList()

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

    @Test fun eachBuildFamilyHasItsOwnPinnedSites() {
        val families = MessengerTarget.VERSION_CODES.map { expectedCloneSitesFor(it.toString()) }.toSet()
        assertEquals(6, families.size)
        assertEquals(setOf("LX/E9W;-><init>()V", "LX/4Di;->A00(Ljava/lang/String;)Z"), expectedCloneSitesFor("346213585"))
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

    @Test fun everyStockBuildHasOneBackupLookupAndOneAttachmentCheck() {
        val apks = stockApks()
        val families = mutableSetOf<Set<String>>()
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes: List<ClassDef> = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val expected = expectedCloneSitesFor(code)
            assertEquals(expected, findCloneSites(classes), code)
            families += expected
            val methods = expected.map { id -> MutableMethod(classes.single { it.type == id.substringBefore("->") }.methods.single { it.hookId() == id }) }
            val lookup = methods.single { it.name == "<init>" }
            val check = methods.single { it.name != "<init>" }
            val (at, register) = lookup.backupLookupSite()
            val before = lookup.code()
            applyCloneSites(lookup, check, CLONE_DEFAULT_PACKAGE)
            assertEquals(register to "com.facebook.orca", lookup.loads(at), code)
            // The longer method can widen a goto or drop the padding before a switch table, so compare what each
            // instruction does, not which object holds it.
            fun List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>.shape() =
                filter { it.opcode != Opcode.NOP }.map { it.opcode.name.substringBefore('/') }
            assertEquals(before.shape(), lookup.code().filterIndexed { i, _ -> i != at }.shape(), code)
            assertEquals(1, check.code().count { (it as? ReferenceInstruction)?.reference.let { r -> r is StringReference && r.string == "$CLONE_DEFAULT_PACKAGE$TAM_SUFFIX" } }, code)
            assertTrue(check.code().none { (it as? ReferenceInstruction)?.reference.let { r -> r is StringReference && r.string == TAM_AUTHORITY } }, code)
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
