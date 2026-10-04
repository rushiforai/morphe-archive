package app.hushmessenger.patches.controls

import app.morphe.patcher.Patcher
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.PatchResult
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.ByteArrayInputStream
import java.io.Closeable
import java.io.File
import java.io.Reader
import java.io.StringReader
import java.lang.reflect.Proxy
import java.nio.file.Files
import java.nio.file.Path
import java.util.concurrent.CountDownLatch
import java.util.concurrent.TimeUnit
import java.util.function.Supplier
import java.util.zip.ZipEntry
import java.util.zip.ZipFile
import java.util.zip.ZipOutputStream
import javax.xml.parsers.DocumentBuilderFactory
import org.w3c.dom.Document
import org.xml.sax.InputSource
import kotlin.coroutines.Continuation
import kotlin.coroutines.EmptyCoroutineContext
import kotlin.coroutines.intrinsics.COROUTINE_SUSPENDED
import kotlin.test.assertTrue

internal fun lifecycleDex(classes: Collection<ClassDef>): ByteArray {
    val store = MemoryDataStore()
    return try {
        DexPool.writeTo(store, ImmutableDexFile(Opcodes.forApi(28), classes))
        store.data
    } finally { store.close() }
}

/** Native fixture contracts only; the real MPE supplies every runtime helper. */
internal fun lifecycleClasses(brokenMenu: Boolean = false, brokenPeople: Boolean = false): List<ClassDef> {
    val people = pluginGates.getValue("people").anchors.single()
    val listEnd = pluginGates.getValue("people_list_end").anchors.single()
    val peopleMethods = listOf(
        fixtureMethod("LX/1pm;->A0C()Z", pluginBody(people)),
        fixtureMethod("LX/1pm;->A0B()Z", pluginBody(listEnd)),
        fixtureMethod("LX/2Wl;->A04()Z", pluginBody(people, if (brokenPeople) "if-ne" else "if-eq")),
        fixtureMethod("LX/2Wl;->A03()Z", pluginBody(listEnd)),
        peopleJewelMethod(), peopleTabMethod(), peopleTabFetchMethod(), peopleSearchMethod(), peopleStoryMethod(),
    )
    val theme = listOf(
        fixtureClass(DARK_SCHEME, listOf(fixtureMethod("$DARK_SCHEME->DCz(LX/Token;)I", """
            const/4 v0, 0x0
            invoke-static {p1, v0}, LX/33W;->A0j(Ljava/lang/Object;I)V
            invoke-interface {p1}, LX/Token;->color()I
            move-result v0
            return v0
        """.trimIndent(), 3))),
        fixtureClass(FDS_COLORS, listOf(fixtureMethod("$FDS_COLORS->A00(Landroid/content/Context;II)I", """
            invoke-static {p0}, LX/DarkCheck;->dark(Landroid/content/Context;)Z
            move-result v0
            const v0, -0xf7f7f7
            return v0
        """.trimIndent(), flags = 9))),
        fixtureClass("LX/DarkCheck;", listOf(fixtureMethod("LX/DarkCheck;->dark(Landroid/content/Context;)Z",
            "const/4 v0, 0x1\nreturn v0", flags = 9))),
        fixtureClass("LX/ThemeColors;", listOf(fixtureMethod("LX/ThemeColors;->color()I", """
            const-string v0, "#333334"
            invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I
            move-result v0
            return v0
        """.trimIndent(), flags = 9))),
    )
    return (legacyDrawerFixture(BASE_PROFILE, if (brokenMenu) "bind" else "none").classes +
        peopleMethods.groupBy { it.definingClass }.map { (type, methods) -> fixtureClass(type, methods) } +
        peopleJewelKeyHolder() + theme).filterNot { it.type.startsWith("Lapp/hushmessenger/extension/") }
}

/** ARSCLib is provided at runtime by the pinned patcher, so keep it out of the bundle's compile graph. */
private fun fixtureCall(target: Any, name: String, vararg arguments: Any): Any? = target.javaClass.methods.single {
    it.name == name && it.parameterTypes.size == arguments.size && it.parameterTypes.zip(arguments).all { (type, value) ->
        type.isInstance(value) || type == Int::class.javaPrimitiveType && value is Int ||
            type == Boolean::class.javaPrimitiveType && value is Boolean
    }
}.invoke(target, *arguments)

internal fun lifecycleApk(directory: Path, classes: List<ClassDef>): File {
    Files.createDirectories(directory)
    val resourceFixture = Path.of("../extensions/messenger/build/intermediates/linked_resources_binary_format/release/" +
        "processReleaseResources/linked-resources-binary-format-release.ap_").toFile()
    assertTrue(resourceFixture.isFile, "The compiled extension resource fixture is missing")
    val moduleType = Class.forName("com.reandroid.apk.ApkModule")
    val module = moduleType.getMethod("loadApkFile", File::class.java).invoke(null, resourceFixture)
    val resources = directory.resolve("resources.apk")
    (module as Closeable).use {
        val table = fixtureCall(module, "getTableBlock")!!
        val pkg = fixtureCall(table, "getOrCreatePackage", 0x7f, "com.facebook.orca")!!
        fixtureCall(fixtureCall(pkg, "getOrCreate", "", "string", "stock")!!, "setValueAsString", "Stock")
        // The full resource writer reads ids.xml even when these patches introduce no new IDs.
        fixtureCall(fixtureCall(pkg, "getOrCreate", "", "id", "stock_id")!!, "setValueAsBoolean", false)
        fixtureCall(fixtureCall(pkg, "getOrCreate", "", "xml", "stock_shortcuts")!!,
            "setValueAsString", "res/xml/stock_shortcuts.xml")
        moduleType.getMethod("initializeAndroidFramework", Int::class.javaObjectType).invoke(module, null)
        val parser = Class.forName("com.reandroid.xml.XMLFactory").getMethod("newPullParser", Reader::class.java)
        val manifest = fixtureCall(module, "getAndroidManifest")!!
        fixtureCall(manifest, "clear")
        fixtureCall(manifest, "setPackageBlock", pkg)
        fixtureCall(manifest, "parse", parser.invoke(null, StringReader("""
            <manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.facebook.orca"
                android:versionCode="346013440" android:versionName="580.0.0.49.91">
              <uses-sdk android:minSdkVersion="28" android:targetSdkVersion="36"/>
              <application android:appComponentFactory="$APP_COMPONENT_FACTORY">
                <activity android:name="stock.Main"/>
                <activity android:name="$SCREEN_HOST" android:exported="false"
                    android:parentActivityName="com.facebook.messenger.neue.MainActivity">
                  <meta-data android:name="android.support.PARENT_ACTIVITY" android:value="com.facebook.messenger.neue.MainActivity"/>
                </activity>
                <activity android:name="$SHORTCUT_HOST" android:exported="false" android:taskAffinity=""
                    android:theme="@android:style/Theme.Translucent.NoTitleBar"
                    android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|screenSize"/>
                <activity-alias android:name="com.facebook.orca.auth.StartScreenActivity"
                    android:targetActivity="stock.Main" android:exported="true">
                  <intent-filter><action android:name="android.intent.action.MAIN"/>
                    <category android:name="android.intent.category.LAUNCHER"/></intent-filter>
                  <meta-data android:name="android.app.shortcuts" android:resource="@xml/stock_shortcuts"/>
                </activity-alias>
              </application>
            </manifest>
        """.trimIndent())))
        val shortcuts = Class.forName("com.reandroid.arsc.chunk.xml.ResXmlDocument").getConstructor().newInstance()
        fixtureCall(shortcuts, "setPackageBlock", pkg)
        fixtureCall(shortcuts, "parse", parser.invoke(null, StringReader("""
            <shortcuts xmlns:android="http://schemas.android.com/apk/res/android">
              <share-target android:targetClass="com.facebook.messenger.intents.ShareIntentHandler">
                <category android:name="stock.share"/><data android:mimeType="*/*"/>
              </share-target>
            </shortcuts>
        """.trimIndent())))
        val source = Class.forName("com.reandroid.archive.BlockInputSource")
            .getConstructor(String::class.java, Class.forName("com.reandroid.arsc.base.Block"))
            .newInstance("res/xml/stock_shortcuts.xml", shortcuts)
        fixtureCall(module, "add", source)
        fixtureCall(table, "refreshFull")
        fixtureCall(module, "writeApk", resources.toFile())
    }
    val apk = directory.resolve("input.apk")
    ZipOutputStream(Files.newOutputStream(apk)).use { output ->
        ZipFile(resources.toFile()).use { source ->
            source.entries().asSequence().forEach { entry ->
                output.putNextEntry(ZipEntry(entry.name))
                source.getInputStream(entry).use { it.copyTo(output) }
                output.closeEntry()
            }
        }
        output.putNextEntry(ZipEntry("classes.dex"))
        output.write(lifecycleDex(classes))
        output.closeEntry()
    }
    return apk.toFile()
}

internal fun lifecycleExtension(): ByteArray = System.getenv("HUSH_LIFECYCLE_BUNDLE")?.let { bundle ->
    ZipFile(bundle).use { it.getInputStream(it.getEntry("extensions/messenger.mpe")).use { input -> input.readBytes() } }
} ?: ControlLifecycleTest::class.java.classLoader.getResourceAsStream("extensions/messenger.mpe")!!.use { it.readBytes() }

internal fun lifecycleManifest(apk: File): Document {
    val module = Class.forName("com.reandroid.apk.ApkModule").getMethod("loadApkFile", File::class.java).invoke(null, apk)
    return (module as Closeable).use {
        val table = fixtureCall(module, "getTableBlock")!!
        val manifest = fixtureCall(module, "getAndroidManifest")!!
        fixtureCall(manifest, "setPackageBlock", fixtureCall(table, "getPackageBlockById", 0x7f)!!)
        val xml = fixtureCall(manifest, "serializeToXml") as String
        DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(InputSource(StringReader(xml)))
    }
}

/** Count the real extension stream, restoring the singleton provider even when an assertion fails. */
internal fun <T> withLifecycleExtension(bytes: ByteArray, action: (() -> Int) -> T): T {
    val field = BytecodePatch::class.java.getDeclaredField("extensionStreamProviders").apply { isAccessible = true }
    val original = field.get(settingsExtension)
    var reads = 0
    val provider = Supplier { listOf(Supplier { reads++; ByteArrayInputStream(bytes) }) }
    field.set(settingsExtension, listOf(provider))
    return try { action { reads } } finally { field.set(settingsExtension, original) }
}

/** Collect the actual cold flow without adding the patcher's runtime coroutine library to compile dependencies. */
internal fun collectLifecycle(patcher: Patcher): List<PatchResult> {
    val results = mutableListOf<PatchResult>()
    val done = CountDownLatch(1)
    var completion: Result<Unit>? = null
    val continuation = object : Continuation<Unit> {
        override val context = EmptyCoroutineContext
        override fun resumeWith(result: Result<Unit>) { completion = result; done.countDown() }
    }
    val collectorType = Class.forName("kotlinx.coroutines.flow.FlowCollector")
    val collector = Proxy.newProxyInstance(collectorType.classLoader, arrayOf(collectorType)) { proxy, method, arguments ->
        when (method.name) {
            "emit" -> { results.add(arguments!![0] as PatchResult); Unit }
            "toString" -> "Lifecycle result collector"
            "hashCode" -> System.identityHashCode(proxy)
            "equals" -> proxy === arguments!![0]
            else -> error("Unexpected collector method ${method.name}")
        }
    }
    val flow = Patcher::class.java.getMethod("invoke").invoke(patcher)
    val outcome = Class.forName("kotlinx.coroutines.flow.Flow")
        .getMethod("collect", collectorType, Continuation::class.java).invoke(flow, collector, continuation)
    if (outcome === COROUTINE_SUSPENDED) {
        assertTrue(done.await(30, TimeUnit.SECONDS), "The Patcher lifecycle did not finish")
        completion!!.getOrThrow()
    }
    return results
}
