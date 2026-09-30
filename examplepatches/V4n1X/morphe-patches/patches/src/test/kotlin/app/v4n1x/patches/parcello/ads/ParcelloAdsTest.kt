package app.v4n1x.patches.parcello.ads

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.ResourcePatch
import app.morphe.patcher.patch.loadPatchesFromJar
import app.v4n1x.patches.parcello.shared.Constants.COMPATIBILITY_PARCELLO
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.runBlocking
import java.io.ByteArrayInputStream
import java.io.File
import java.util.zip.ZipFile
import javax.xml.parsers.DocumentBuilderFactory

/** No test framework required: these checks run through :patches:testParcelloAds and check. */
fun main(args: Array<String>) {
    check(COMPATIBILITY_PARCELLO.packageName == "org.parcello")
    check(COMPATIBILITY_PARCELLO.targets.single().version == "2.2.20")
    check(COMPATIBILITY_PARCELLO.targets.single().isExperimental)
    check(disableAdsPatch.default)
    testJavaScriptTransformations()
    testHtmlTransformation()
    testManifestTransformation()
    println("Parcello resource regression checks passed.")
    args.singleOrNull()?.let { testOriginalApk(File(it)) }
}

private fun expectFailure(block: () -> Unit) {
    check(runCatching(block).isFailure) { "An unsupported structure was silently accepted." }
}

private fun testJavaScriptTransformations() {
    val prefix = "class User{premium=false;getDeliveries(){return 'unchanged';}"
    val suffix = "getAdId(){return 'id';}getUser(){return this.premium;}}"
    val source = prefix + "showAdMobAd(){loadAds();}showInterstitial(){loadInterstitial();}" + suffix +
        "class Helper{interstitialAllowed(){return true;}presentAlert(message){return message;}}"
    val patched = ParcelloAdsResources.patchMainScript(source)
    check(patched.startsWith(prefix) && suffix in patched)
    check("loadAds" !in patched && "loadInterstitial" !in patched)
    check("initPushNotification" in patched && "Promise.resolve(false)" in patched)
    check("this.premium=" !in patched && "presentAlert(message){return message;}" in patched)
    expectFailure { ParcelloAdsResources.patchMainScript(source.replace("showAdMobAd(){", "renamed(){")) }
    expectFailure { ParcelloAdsResources.patchMainScript(source + "showAdMobAd(){duplicate();}") }

    val sponsor = "const sponsor=['https://drinkcheck.de/products/sponsor'," +
        listOf(4, 2, 1, 1).joinToString(",") { "'https://www.parcello.org/business/blog/wp-content/uploads/2025/03/A${it}a-final.webp'" } +
        "];const api='https://api-v4.parcello.org/v1';"
    val withoutSponsors = ParcelloAdsResources.patchSponsoredScript(sponsor)
    check("drinkcheck.de" !in withoutSponsors && "A1a-final.webp" !in withoutSponsors)
    check(withoutSponsors.split(ParcelloAdsResources.EMPTY_IMAGE).size - 1 == 4)
    check("https://api-v4.parcello.org/v1" in withoutSponsors)
    expectFailure { ParcelloAdsResources.patchSponsoredScript("const sponsor='new-layout';") }
}

private fun testHtmlTransformation() {
    val source = """
        <html><head><script>const safeBootstrap = 1;</script>
        <script>function createCookieSymplr(){track();}</script>
        <script>const ritToken = localStorage.getItem('CapacitorStorage.rit');
        const adUrl = 'https://cdns.symplr.de/parcello.org/parcello.js';
        const consentUrl = 'https://cdn.privacy-mgmt.com/unified/wrapperMessagingWithoutDetection.js';</script>
        </head><body><script>if(ritToken){document.body.classList.add('rit');}</script>
        <script src="main.js" type="module"></script><app-root></app-root></body></html>
    """.trimIndent()
    val patched = ParcelloAdsResources.patchIndexHtml(source)
    check("createCookieSymplr" !in patched && "cdns.symplr.de" !in patched && "privacy-mgmt.com" !in patched)
    check("const safeBootstrap = 1" in patched && "if(ritToken)" in patched && "src=\"main.js\"" in patched)
    check("window.symplrScriptLoaded = false" in patched && "morphe-parcello-no-ads" in patched)
    check(".horizontal-ad-space-dash" in patched && "app-promo-slides" in patched)
    // Package tracking path information must not be hidden together with advertisements.
    check(".inline-path" !in patched && ".disclaimer" !in patched)
    expectFailure { ParcelloAdsResources.patchIndexHtml("<html><head></head></html>") }
    expectFailure { ParcelloAdsResources.patchIndexHtml(patched) }
}

private fun testManifestTransformation() {
    val manifest = """
        <manifest xmlns:android="http://schemas.android.com/apk/res/android">
          <uses-permission android:name="android.permission.INTERNET"/>
          <uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
          <uses-permission android:name="android.permission.CAMERA"/>
          <uses-permission android:name="com.android.vending.BILLING"/>
          <uses-permission android:name="com.google.android.gms.permission.AD_ID"/>
          <uses-permission android:name="android.permission.ACCESS_ADSERVICES_TOPICS"/>
          <application>
            <provider android:name="com.google.android.gms.ads.MobileAdsInitProvider"/>
            <service android:name="com.google.android.gms.ads.AdService"/>
            <activity android:name="com.google.android.gms.ads.AdActivity"/>
            <meta-data android:name="com.google.android.gms.ads.APPLICATION_ID"/>
            <uses-library android:name="android.ext.adservices" android:required="false"/>
            <activity android:name="org.parcello.MainActivity"/>
            <service android:name="com.capacitorjs.plugins.pushnotifications.MessagingService"/>
            <provider android:name="com.google.mlkit.common.internal.MlKitInitProvider"/>
          </application>
        </manifest>
    """.trimIndent()
    val document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
        ByteArrayInputStream(manifest.toByteArray()),
    )
    ParcelloAdsResources.patchManifest(document.documentElement)
    val names = document.getElementsByTagName("*").let { nodes ->
        (0 until nodes.length).mapNotNull { nodes.item(it).attributes?.getNamedItem("android:name")?.nodeValue }
    }
    check(names.none { "gms.ads" in it || "AD_ID" in it || "ADSERVICES" in it || it == "android.ext.adservices" })
    check(names.containsAll(listOf(
        "android.permission.INTERNET", "android.permission.POST_NOTIFICATIONS", "android.permission.CAMERA",
        "com.android.vending.BILLING", "org.parcello.MainActivity",
        "com.capacitorjs.plugins.pushnotifications.MessagingService", "com.google.mlkit.common.internal.MlKitInitProvider",
    )))
}

private fun testOriginalApk(apk: File) = runBlocking {
    check(apk.isFile) { "APK not found: $apk" }
    val output = File("patches/build/parcello-verification").apply { mkdirs() }
    val bundle = File(checkNotNull(System.getProperty("parcelloPatchBundle")))
    check(bundle.isFile) { "Built patch bundle not found: $bundle" }
    val loaded = loadPatchesFromJar(setOf(bundle))
    check(loaded.count { it.name != null } == 6) { "Bundle must contain all five SoundCloud patches and the Parcello patch." }
    val parcelloPatch = loaded.single { it.name == "Disable ads" }
    check(parcelloPatch.compatibility?.single()?.packageName == "org.parcello")
    val selectedPatch = parcelloPatch as ResourcePatch
    println("Morphe bundle discovery passed (6 public patches).")

    Patcher(PatcherConfig(
        apkFile = apk,
        temporaryFilesPath = File(output, "temporary"),
    )).use { patcher ->
        patcher += setOf(selectedPatch)
        check(patcher.context.packageMetadata.packageName == "org.parcello")
        check(patcher.context.packageMetadata.versionName == "2.2.20")
        patcher().collect { result ->
            check(result.exception == null) { "Patch failed: ${result.patch}: ${result.exception}" }
            println("Patch execution passed: ${result.patch}")
        }
        val result = patcher.get() // Also compile the modified resources and DEX files.
        val resources = checkNotNull(result.resources)
        check(checkNotNull(resources.resourcesApk).isFile)
        val assets = File(output, "resources").apply { mkdirs() }
        ZipFile(checkNotNull(resources.resourcesApk)).use { rebuilt ->
            // Arsclib includes assets inside resources.apk, not otherResources.
            rebuilt.entries().asSequence().filter { !it.isDirectory && it.name.startsWith("assets/") }.forEach { entry ->
                val target = File(assets, entry.name)
                check(target.canonicalPath.startsWith(assets.canonicalPath + File.separator))
                target.parentFile.mkdirs()
                rebuilt.getInputStream(entry).use { input -> target.outputStream().use { input.copyTo(it) } }
            }
        }
        ZipFile(apk).use { original ->
            fun originalText(path: String) = original.getInputStream(checkNotNull(original.getEntry(path))).bufferedReader().use { it.readText() }
            check(File(assets, ParcelloAdsResources.MAIN_SCRIPT).readText() ==
                ParcelloAdsResources.patchMainScript(originalText(ParcelloAdsResources.MAIN_SCRIPT)))
            check(File(assets, ParcelloAdsResources.INDEX_HTML).readText() ==
                ParcelloAdsResources.patchIndexHtml(originalText(ParcelloAdsResources.INDEX_HTML)))
            ParcelloAdsResources.SPONSORED_SCRIPTS.forEach { path ->
                check(File(assets, path).readText() == ParcelloAdsResources.patchSponsoredScript(originalText(path)))
            }
            listOf("assets/capacitor.config.json", "assets/capacitor.plugins.json").forEach { path ->
                check(File(assets, path).readText() == originalText(path)) { "Unrelated Capacitor configuration changed." }
            }
        }

        var foundAdMob = false
        checkNotNull(result.dexFiles).forEach { dex ->
            val file = File(output, dex.name)
            dex.stream.use { input -> file.outputStream().use { input.copyTo(it) } }
            val parsed = file.inputStream().buffered().use { DexBackedDexFile.fromInputStream(Opcodes.getDefault(), it) }
            parsed.classes.singleOrNull { it.type == ADMOB_CLASS }?.let { adMob ->
                foundAdMob = true
                adMobResponses.forEach { (name, response) ->
                    val method = adMob.methods.single { it.name == name && it.parameterTypes == listOf(PLUGIN_CALL_CLASS) }
                    val implementation = checkNotNull(method.implementation)
                    val instructions = implementation.instructions.toList()
                    check(implementation.tryBlocks.isEmpty())
                    check(instructions.last().opcode == Opcode.RETURN_VOID)
                    check(instructions.size == if (response == null) 2 else 5)
                    val calls = instructions.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
                    check(calls.last().definingClass == PLUGIN_CALL_CLASS && calls.last().name == "resolve")
                    check(calls.none { "admob" in it.definingClass || "gms/ads" in it.definingClass })
                }
            }
        }
        check(foundAdMob) { "Rebuilt AdMob class not found." }
        println("Real APK patching, resource compilation, and all 19 rebuilt AdMob method checks passed.")

        // Optional additional syntax/behavior checks using Node.js, already used
        // by this repository's release tooling. No app API/network calls are made.
        val nodeAvailable = runCatching { ProcessBuilder("node", "--version").start().waitFor() == 0 }.getOrDefault(false)
        if (nodeAvailable) {
            check(ProcessBuilder("node", "patches/src/test/js/parcello-ads.test.cjs", assets.absolutePath)
                .inheritIO().start().waitFor() == 0) { "Patched JavaScript behavior checks failed." }
        } else {
            println("Node.js not available: JavaScript execution checks skipped.")
        }
    }
}
