import app.template.patches.transfermarkt.ads.AD_METHODS
import app.template.patches.transfermarkt.ads.AD_SLOT_STYLE
import app.template.patches.transfermarkt.ads.INDEX_HTML
import app.template.patches.transfermarkt.ads.MAIN_BUNDLE_REGEX
import app.template.patches.transfermarkt.ads.OUTBRAIN_FEATURE
import app.template.patches.transfermarkt.ads.OUTBRAIN_FEATURE_OFF
import app.template.patches.transfermarkt.ads.WWW_DIR
import app.template.patches.transfermarkt.ads.adMethodRegex
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File
import java.util.zip.ZipFile

private const val PKG = "de.transfermarkt.v2"
private const val EXTENSION = "Lapp/template/extension/transfermarkt/WebViewBlocklistPatch;"
private const val SYSTEM_WEBVIEW_CLIENT = "Lorg/apache/cordova/engine/SystemWebViewClient;"
private const val IONIC_SERVER_CLIENT = "Lcom/ionicframework/cordova/webview/IonicWebViewEngine\$ServerClient;"
private const val IN_APP_BROWSER_CLIENT = "Lorg/apache/cordova/inappbrowser/InAppBrowser\$InAppBrowserClient;"
private const val WEB_RESOURCE_RESPONSE = "Landroid/webkit/WebResourceResponse;"
private const val WEB_RESOURCE_REQUEST = "Landroid/webkit/WebResourceRequest;"
private const val JSON_OBJECT = "Lorg/json/JSONObject;"
private const val CALLBACK_CONTEXT = "Lorg/apache/cordova/CallbackContext;"
private val INTERCEPT_PARAMETERS = listOf("Landroid/webkit/WebView;", WEB_RESOURCE_REQUEST)

class TransfermarktSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.methodRef(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
    private fun Instruction.stringRef(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
    private fun Method.params(): List<String> = parameterTypes.map(CharSequence::toString)
    private fun Method.strings(): List<String> = instructions().mapNotNull { it.stringRef() }
    private fun Method.calls(definingClass: String, name: String) =
        instructions().any { it.methodRef()?.let { ref -> ref.definingClass == definingClass && ref.name == name } == true }

    private fun Method.shouldInterceptRequest(): Boolean =
        name == "shouldInterceptRequest" && returnType == WEB_RESOURCE_RESPONSE && params() == INTERCEPT_PARAMETERS &&
            implementation != null

    /**
     * The extension hooks at the start of [method]: blocks of invoke-static/range {p2} hook,
     * move-result-object r, if-eqz r, return-object r. Returns the hook names in order.
     */
    private fun hooksOf(method: Method, label: String): List<String> {
        val insns = method.instructions()
        val p2 = method.implementation!!.registerCount - 1
        val hooks = mutableListOf<String>()
        var i = 0
        while (true) {
            val call = insns.getOrNull(i)?.methodRef()
            if (call?.definingClass != EXTENSION) break
            val invoke = insns[i] as RegisterRangeInstruction
            assertTrue(
                insns[i].opcode == Opcode.INVOKE_STATIC_RANGE && invoke.startRegister == p2 && invoke.registerCount == 1,
                "$label: ${call.name} is not invoke-static/range on p2 (v$p2)",
            )
            assertEquals(listOf(WEB_RESOURCE_REQUEST), call.parameterTypes.map(CharSequence::toString), "$label: ${call.name} parameters")
            assertEquals(WEB_RESOURCE_RESPONSE, call.returnType, "$label: ${call.name} return type")
            val result = insns.getOrNull(i + 1)
            val check = insns.getOrNull(i + 2)
            val ret = insns.getOrNull(i + 3)
            assertTrue(result?.opcode == Opcode.MOVE_RESULT_OBJECT, "$label: ${call.name} result is not moved")
            val register = (result as OneRegisterInstruction).registerA
            assertTrue(
                check?.opcode == Opcode.IF_EQZ && (check as OneRegisterInstruction).registerA == register,
                "$label: ${call.name} result is not null-checked",
            )
            assertTrue(
                ret?.opcode == Opcode.RETURN_OBJECT && (ret as OneRegisterInstruction).registerA == register,
                "$label: ${call.name} result is not returned",
            )
            hooks += call.name
            i += 4
        }
        return hooks
    }

    @Test
    fun `Disable ads and Disable telemetry hook the WebView client, the ad plugins, the idfa plugin and the web app`() {
        val root = repoRoot()
        val apk = File(root, "apks/transfermarkt/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val stockWww = ZipFile(apk).use { zip ->
            zip.entries().asSequence()
                .filter { !it.isDirectory && it.name.startsWith("$WWW_DIR/") }
                .associate { it.name to zip.getInputStream(it).use { input -> input.readBytes() } }
        }

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "4.3.3",
            patchNames = setOf("Disable ads", "Disable telemetry"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }
        fun classDef(type: String): ClassDef = byType[type] ?: error("$type not found in emitted dexes")

        // The extension is merged once, with both hooks.
        val extension = classDef(EXTENSION)
        for (name in listOf("blockAds", "blockTelemetry")) {
            val hook = extension.methods.singleOrNull { it.name == name }
                ?: error("$EXTENSION has no single $name")
            assertTrue(
                AccessFlags.STATIC.isSet(hook.accessFlags) && AccessFlags.PUBLIC.isSet(hook.accessFlags) &&
                    hook.params() == listOf(WEB_RESOURCE_REQUEST) && hook.returnType == WEB_RESOURCE_RESPONSE,
                "$EXTENSION->$name is not public static WebResourceResponse(WebResourceRequest)",
            )
        }

        // Both patches, step 3 / step 1: every concrete shouldInterceptRequest(WebView, WebResourceRequest)
        // on SystemWebViewClient and its subclasses asks both hooks first (found by hierarchy, like the patch).
        fun isClient(type: String?): Boolean =
            type != null && (type == SYSTEM_WEBVIEW_CLIENT || isClient(byType[type]?.superclass))
        val clientMethods = classes.filter { isClient(it.type) }.flatMap { client ->
            client.methods.filter { it.shouldInterceptRequest() }.map { client.type to it }
        }
        assertTrue(
            clientMethods.map { it.first }.containsAll(listOf(SYSTEM_WEBVIEW_CLIENT, IONIC_SERVER_CLIENT)),
            "expected shouldInterceptRequest on SystemWebViewClient and the Ionic ServerClient, found ${clientMethods.map { it.first }}",
        )
        for ((type, method) in clientMethods) {
            val hooks = hooksOf(method, "$type->shouldInterceptRequest")
            assertEquals(setOf("blockAds", "blockTelemetry"), hooks.toSet(), "$type->shouldInterceptRequest hooks")
            assertEquals(2, hooks.size, "$type->shouldInterceptRequest hooks")
        }
        // The InAppBrowser (external pages) is not hooked.
        classDef(IN_APP_BROWSER_CLIENT).methods.filter { it.shouldInterceptRequest() }.forEach {
            assertTrue(hooksOf(it, "InAppBrowserClient->shouldInterceptRequest").isEmpty(), "InAppBrowserClient was hooked")
        }

        // Disable ads 1: the webview-ad lambda (MobileAds.registerWebView + the log) returns at once.
        val integrations = classes.flatMap { it.methods }.filter { method ->
            method.returnType == "V" && method.calls("Lcom/google/android/gms/ads/MobileAds;", "registerWebView") &&
                method.strings().any { it.startsWith("Integrated the WebView API for Ads in ") }
        }
        val integration = integrations.singleOrNull()
            ?: error("expected one WebView API for Ads integration method, found ${integrations.size}")
        assertReturnsEarlyVoid(integration, "${integration.definingClass}->${integration.name}")

        // Disable ads 2 (rule 9): every MobileAds static void returns at once.
        assertMobileAdsStaticsNeutralised(
            classDef("Lcom/google/android/gms/ads/MobileAds;"),
            GMA_THROWING_STATICS + "registerWebView",
        )

        // Disable telemetry 2: IdfaPlugin.getInfo (found by shape, like the patch) answers
        // {aaid:"", trackingLimited:true} through CallbackContext.success and returns.
        val getInfos = classes.flatMap { it.methods }.filter { method ->
            method.returnType == "V" && method.params() == listOf(CALLBACK_CONTEXT) &&
                method.calls("Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;", "getAdvertisingIdInfo") &&
                method.strings().containsAll(listOf("aaid", "trackingLimited"))
        }
        val getInfo = getInfos.singleOrNull() ?: error("expected one idfa getInfo, found ${getInfos.size}")
        val insns = getInfo.instructions()
        val expected = listOf(
            Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT, Opcode.CONST_STRING, Opcode.CONST_STRING, Opcode.INVOKE_VIRTUAL,
            Opcode.CONST_STRING, Opcode.CONST_4, Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID,
        )
        assertEquals(expected, insns.take(expected.size).map { it.opcode }, "idfa getInfo prologue")
        assertEquals(JSON_OBJECT, ((insns[0] as ReferenceInstruction).reference as TypeReference).type, "idfa getInfo result type")
        assertEquals(listOf("aaid", "", "trackingLimited"), listOf(insns[2], insns[3], insns[5]).map { it.stringRef() }, "idfa getInfo keys")
        assertEquals(1, (insns[6] as NarrowLiteralInstruction).narrowLiteral, "trackingLimited is not true")
        assertEquals(
            listOf("Ljava/lang/String;", "Ljava/lang/Object;"),
            insns[4].methodRef()!!.parameterTypes.map(CharSequence::toString),
            "aaid is not put as a String",
        )
        assertEquals(listOf("Ljava/lang/String;", "Z"), insns[7].methodRef()!!.parameterTypes.map(CharSequence::toString), "trackingLimited put")
        val success = insns[8].methodRef()!!
        assertTrue(
            success.definingClass == CALLBACK_CONTEXT && success.name == "success" &&
                success.parameterTypes.map(CharSequence::toString) == listOf(JSON_OBJECT),
            "idfa getInfo does not call CallbackContext.success(JSONObject): $success",
        )

        // Disable ads, raw-resource step: compare the patched web app with the stock one.
        val patchedIndex = workDir.walkTopDown()
            .filter { it.isFile && it.invariantSeparatorsPath.endsWith(INDEX_HTML) }
            .singleOrNull() ?: error("no single patched $INDEX_HTML under $workDir")
        val patchedWww = patchedIndex.parentFile
        val stockIndex = String(stockWww.getValue(INDEX_HTML))
        val index = patchedIndex.readText()

        // 1. The ad slot style sits right before the only </head>.
        assertEquals(stockIndex.replace("</head>", "$AD_SLOT_STYLE</head>"), index, "index.html edit")
        assertEquals(1, Regex("</head>").findAll(index).count(), "index.html </head> count")

        // 2-3. main.<hash>.js: each AdtagService ad method starts with return; and Outbrain is allowed nowhere.
        val bundleName = MAIN_BUNDLE_REGEX.findAll(stockIndex).single().groupValues[1]
        val stockJs = String(stockWww.getValue("$WWW_DIR/$bundleName"))
        val js = File(patchedWww, bundleName).readText()
        for (name in AD_METHODS) {
            val stockDefinitions = adMethodRegex(name).findAll(stockJs).toList()
            assertEquals(1, stockDefinitions.size, "stock $name(...){ definitions")
            val definitions = adMethodRegex(name).findAll(js).toList()
            assertEquals(1, definitions.size, "patched $name(...){ definitions")
            val body = js.substring(definitions.single().range.last + 1)
            assertTrue(body.startsWith("return;"), "$name does not return at once: ${body.take(40)}")
        }
        assertTrue(OUTBRAIN_FEATURE !in js, "the Outbrain feature is still allowed on transfermarkt.de")
        assertEquals(1, Regex(Regex.escape(OUTBRAIN_FEATURE_OFF)).findAll(js).count(), "Outbrain feature entry")
        // Nothing else in main.js changed: four "return;" in, the "de" of allow:["de"] out.
        assertEquals(stockJs.length + AD_METHODS.size * "return;".length - "\"de\"".length, js.length, "main.js length")
        var expectedJs = stockJs.replace(OUTBRAIN_FEATURE, OUTBRAIN_FEATURE_OFF)
        for (name in AD_METHODS) {
            val bodyStart = adMethodRegex(name).find(expectedJs)!!.range.last + 1
            expectedJs = expectedJs.substring(0, bodyStart) + "return;" + expectedJs.substring(bodyStart)
        }
        assertEquals(expectedJs, js, "main.js edits")

        // The patch reads and writes only those two files. The lazy chunks hold no definition the
        // regex would take either: the gallery's own refreshAds() has no parameter list.
        val chunks = stockWww.filterKeys { it.endsWith(".js") && it != "$WWW_DIR/$bundleName" }
        assertTrue(chunks.keys.any { "refreshAds()" in String(stockWww.getValue(it)) }, "no lazy chunk defines refreshAds()")
        for ((path, bytes) in chunks) {
            val text = String(bytes)
            for (name in AD_METHODS) {
                assertTrue(adMethodRegex(name).find(text) == null, "$path also defines $name(...){")
            }
        }
    }
}
