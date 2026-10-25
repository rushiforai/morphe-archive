import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

private const val PKG = "com.shazam.android"
private const val FIREBASE_ANALYTICS = "Lcom/google/firebase/analytics/FirebaseAnalytics;"
private const val CRASHLYTICS = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;"
private const val CRASHLYTICS_COLLECTION_KEY = "firebase_crashlytics_collection_enabled"
private const val OPEN_IN_EXTENSION = "Lapp/template/extension/shazam/OpenInMorpheAppsPatch;"
private const val STREAMING_PROVIDER_TO_STRING = "StreamingProvider(streamingProviderId="
private const val STRING = "Ljava/lang/String;"
private const val SPOTIFY_NATIVE_AUTH_UTIL = "Lcom/spotify/sdk/android/auth/app/SpotifyNativeAuthUtil;"
private const val SPOTIFY_AUTHORIZATION_CLIENT = "Lcom/spotify/sdk/android/auth/AuthorizationClient;"
private const val SPOTIFY_WEBVIEW_AUTH_HANDLER = "Lcom/spotify/sdk/android/auth/webview/WebViewAuthHandler;"
private const val SPOTIFY_AUTHORIZATION_REQUEST = "Lcom/spotify/sdk/android/auth/AuthorizationRequest;"
private const val SPOTIFY_AUTHORIZATION_RESPONSE = "Lcom/spotify/sdk/android/auth/AuthorizationResponse;"
private const val SPOTIFY_ON_COMPLETE_LISTENER = "Lcom/spotify/sdk/android/auth/AuthorizationHandler\$OnCompleteListener;"
private const val SPOTIFY_LOGIN_DIALOG = "Lcom/spotify/sdk/android/auth/webview/LoginDialog;"
private const val SPOTIFY_BROWSER_LOGIN = "Lapp/template/extension/shazam/SpotifyBrowserLoginPatch;"
private const val SPOTIFY_REDIRECT_RECEIVER = "Lapp/template/extension/shazam/SpotifyRedirectReceiverActivity;"
private const val SPLASH_ACTIVITY = "Lcom/shazam/android/activities/SplashActivity;"
private const val SIGNATURE_SHA1 = "b804e188301813b5d8d47d0bb2280607c16fd8b6"

class ShazamSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun loadClasses(): List<ClassDef> {
        val root = repoRoot()
        val apk = File(root, "apks/shazam/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        return applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "16.64.0-261015",
            patchNames = setOf("Disable telemetry", "Open in Morphe YouTube apps", "Spoof signature", "GmsCore support"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
    }

    @Test
    fun `Shazam patches neuter telemetry, remap Open in YouTube providers, spoof the signature and add GmsCore support`() {
        val classes = loadClasses()
        val byType = classes.associateBy { it.type }

        // --- Disable telemetry ---

        // Firebase Analytics event logging.
        val analytics = byType[FIREBASE_ANALYTICS]
            ?: error("$FIREBASE_ANALYTICS not found in emitted dexes")
        val logEvent = analytics.method("logEvent", listOf("Ljava/lang/String;", "Landroid/os/Bundle;"))
        assertReturnsEarlyVoid(logEvent, label = "FirebaseAnalytics.logEvent()")

        // Crashlytics collection flag forced off.
        val crashlytics = byType[CRASHLYTICS]
            ?: error("$CRASHLYTICS not found in emitted dexes")
        assertForcedBoolean(
            crashlytics.method("isCrashlyticsCollectionEnabled", emptyList()),
            expected = false,
            label = "FirebaseCrashlytics.isCrashlyticsCollectionEnabled()",
        )

        // The data-collection arbiter (public in this build; found like the patch, by the
        // SharedPreferences key its class reads) reports automatic collection as off, so no
        // crash report is sent even through the readers that bypass the public getter.
        val arbiterGetters = classes
            .filter { cls -> cls.methods.any { m -> m.instructions().any { it.stringOrNull() == CRASHLYTICS_COLLECTION_KEY } } }
            .flatMap { cls -> cls.methods }
            .filter { it.implementation != null && it.returnType == "Z" && it.parameterTypes.isEmpty() }
        check(arbiterGetters.isNotEmpty()) {
            "no ()Z getter on the class reading \"$CRASHLYTICS_COLLECTION_KEY\" was found"
        }
        check(arbiterGetters.any { it.name == "isAutomaticDataCollectionEnabled" }) {
            "the Crashlytics arbiter's isAutomaticDataCollectionEnabled() was not found"
        }
        arbiterGetters.forEach { method ->
            assertForcedBoolean(
                method,
                expected = false,
                label = "${method.definingClass}.${method.name}() (Crashlytics data collection arbiter)",
            )
        }

        // Every concrete recordException/log overload neutered.
        val reporting = crashlytics.methods.filter { method ->
            method.implementation != null &&
                (method.name == "recordException" || method.name == "log")
        }
        check(reporting.isNotEmpty()) { "no recordException/log methods found on $CRASHLYTICS" }
        for (method in reporting) {
            val first = method.instructions().firstOrNull()
            check(first?.opcode == Opcode.RETURN_VOID) {
                "${crashlytics.type}.${method.name} not neutered; first instruction is ${first?.opcode}"
            }
        }

        // --- Open in Morphe YouTube apps ---

        // The extension class is merged into the emitted dex, with the option defaults injected.
        val extension = byType[OPEN_IN_EXTENSION]
            ?: error("$OPEN_IN_EXTENSION (shazam extension) not merged into the emitted dexes")
        val remap = extension.method("remap", listOf(STRING))
        check(remap.returnType == STRING && remap.implementation != null) {
            "$OPEN_IN_EXTENSION.remap(String) has the wrong shape"
        }
        for ((getter, expected) in listOf(
            "getYouTubeMusicPackage" to "app.morphe.android.apps.youtube.music",
            "getYouTubePackage" to "app.morphe.android.youtube",
        )) {
            val insns = extension.method(getter, emptyList()).instructions()
            val value = ((insns.getOrNull(0) as? ReferenceInstruction)?.reference as? StringReference)?.string
            check(insns.getOrNull(0)?.opcode == Opcode.CONST_STRING && value == expected) {
                "$getter() does not return the injected option value; got ${insns.getOrNull(0)?.opcode} $value"
            }
            check(insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT) {
                "$getter() does not return immediately; second instruction is ${insns.getOrNull(1)?.opcode}"
            }
        }

        // StreamingProvider (R8-renamed) is found the same way the patch finds it: by its toString
        // string, matched by prefix.
        val provider = classes.singleOrNull { classDef ->
            classDef.methods.any { method ->
                method.instructions().any { insn ->
                    ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string
                        ?.startsWith(STREAMING_PROVIDER_TO_STRING) == true
                }
            }
        } ?: error("no single class contains \"$STREAMING_PROVIDER_TO_STRING\"")

        val constructor = provider.methods.singleOrNull { method ->
            method.name == "<init>" &&
                method.parameterTypes.map(CharSequence::toString).let { params ->
                    params.size == 7 &&
                        params[0].startsWith("L") &&
                        params.subList(1, 6).all { it == STRING } &&
                        params[6] == "Z"
                }
        } ?: error("${provider.type}.<init>(obj, String x5, Z) not found")

        // Parameters are all single-width, so p0 = this sits at registerCount - 8.
        val firstParamRegister = constructor.implementation!!.registerCount - 8
        val insns = constructor.instructions()
        for ((slot, p) in (3..6).withIndex()) {
            val register = firstParamRegister + p
            val invoke = insns.getOrNull(slot * 2)
            val call = (invoke as? ReferenceInstruction)?.reference as? MethodReference
            val invokedRegister = when (invoke) {
                is RegisterRangeInstruction -> invoke.startRegister.takeIf { invoke.registerCount == 1 }
                is FiveRegisterInstruction -> invoke.registerC.takeIf { invoke.registerCount == 1 }
                else -> null
            }
            check(
                (invoke?.opcode == Opcode.INVOKE_STATIC || invoke?.opcode == Opcode.INVOKE_STATIC_RANGE) &&
                    call?.definingClass == OPEN_IN_EXTENSION && call.name == "remap" &&
                    invokedRegister == register
            ) {
                "${provider.type}.<init> instruction ${slot * 2} is not remap(p$p); got ${invoke?.opcode} $call"
            }
            val move = insns.getOrNull(slot * 2 + 1)
            check(move?.opcode == Opcode.MOVE_RESULT_OBJECT && (move as OneRegisterInstruction).registerA == register) {
                "${provider.type}.<init> does not store remap() back into p$p; got ${move?.opcode}"
            }
        }

        // All four remaps happen before the super constructor and the field stores.
        val superCall = insns.indexOfFirst { insn ->
            insn.opcode == Opcode.INVOKE_DIRECT &&
                ((insn as ReferenceInstruction).reference as? MethodReference)?.let {
                    it.definingClass == "Ljava/lang/Object;" && it.name == "<init>"
                } == true
        }
        check(superCall >= 8) { "${provider.type}.<init> calls Object.<init> at $superCall, before the remaps" }

        // Without the <queries> entries the Morphe apps are invisible to getApplicationInfo on
        // Android 11+, so remap() would silently keep the stock packages.
        val manifest = workDir.walkTopDown()
            .filter { it.name == "AndroidManifest.xml" }
            .map { it.readText() }
            .firstOrNull { it.contains("<queries") }
            ?: error("no decoded AndroidManifest.xml with <queries> under $workDir")
        for (pkg in listOf("app.morphe.android.apps.youtube.music", "app.morphe.android.youtube")) {
            check(manifest.contains("<package android:name=\"$pkg\"")) { "<queries> is missing $pkg" }
        }
        check(manifest.contains("<package android:name=\"com.google.android.apps.youtube.music\"")) {
            "<queries> lost the original stock YouTube Music entry"
        }

        // --- GmsCore support ---

        // No Google ad SDK in Shazam, and R8 removed ensurePlayServicesAvailable (its message is
        // left only in the exception constructor). androidx.credentials picks the Identity
        // Credentials API by version, so those tests must read false.
        assertGmsCoreSupport(
            classes, workDir, PKG, SPLASH_ACTIVITY, SIGNATURE_SHA1,
            expectCredentialRouting = true, expectAdsClasses = false, expectServiceCheck = false,
        )

        // Its silent Google sign-in entry (R8-renamed; found like the patch: the pref string and the
        // (Context, String, Z, continuation) shape) returns Boolean.FALSE first when silent (p3) is set.
        val silentSignIn = classes.flatMap { cls -> cls.methods.map { cls to it } }.filter { (_, m) ->
            m.returnType == "Ljava/lang/Object;" &&
                m.parameterTypes.map(CharSequence::toString).let { p ->
                    p.size == 4 && p[0] == "Landroid/content/Context;" && p[1] == STRING && p[2] == "Z" && p[3].startsWith("L")
                } &&
                m.instructions().any { it.stringOrNull() == "prefkey_should_attempt_silent_sign_in" }
        }
        check(silentSignIn.size == 1) { "expected one silent sign-in entry, found ${silentSignIn.map { (c, m) -> "${c.type}.${m.name}" }}" }
        val (silentClass, silentMethod) = silentSignIn.single()
        val silentLabel = "${silentClass.type}.${silentMethod.name} (silent sign-in)"
        val silentInsns = silentMethod.instructions()
        val silentRegister = silentMethod.implementation!!.registerCount - 5 + 3 // this + 4 params; p3
        val branch = silentInsns.getOrNull(0)
        check(branch?.opcode == Opcode.IF_EQZ && (branch as OneRegisterInstruction).registerA == silentRegister) {
            "$silentLabel does not start with if-eqz p3; got ${branch?.opcode}"
        }
        val falseRef = (silentInsns.getOrNull(1) as? ReferenceInstruction)?.reference as? FieldReference
        check(
            silentInsns.getOrNull(1)?.opcode == Opcode.SGET_OBJECT &&
                falseRef?.definingClass == "Ljava/lang/Boolean;" && falseRef.name == "FALSE"
        ) { "$silentLabel does not load Boolean.FALSE; got ${silentInsns.getOrNull(1)?.opcode} $falseRef" }
        val ret = silentInsns.getOrNull(2)
        check(
            ret?.opcode == Opcode.RETURN_OBJECT &&
                (ret as OneRegisterInstruction).registerA == (silentInsns[1] as OneRegisterInstruction).registerA
        ) { "$silentLabel does not return Boolean.FALSE at once; got ${ret?.opcode}" }
        // The branch skips exactly the early return: the stock code continues right after it.
        val target = (branch as OffsetInstruction).codeOffset
        val earlyReturnUnits = silentInsns.take(3).sumOf { it.codeUnits }
        check(target == earlyReturnUnits) { "$silentLabel: if-eqz p3 jumps $target code units, expected $earlyReturnUnits" }

        // --- Spoof signature ---

        assertSpoofSignature(classes, PKG, SIGNATURE_SHA1)

        // Its Spotify login fallback: the Spotify-app SSO hand-off reports "not available" at once...
        val nativeAuthUtil = byType[SPOTIFY_NATIVE_AUTH_UTIL]
            ?: error("$SPOTIFY_NATIVE_AUTH_UTIL not found in emitted dexes")
        val startAuthActivity = nativeAuthUtil.method("startAuthActivity", emptyList())
        assertForcedBoolean(startAuthActivity, expected = false, label = "SpotifyNativeAuthUtil.startAuthActivity()")
        check(startAuthActivity.returnType == "Z") { "startAuthActivity() no longer returns boolean" }

        // ...so AuthorizationClient must still register WebViewAuthHandler as the next handler,
        // otherwise the patch would leave Shazam with no way to log in at all.
        val authorizationClient = byType[SPOTIFY_AUTHORIZATION_CLIENT]
            ?: error("$SPOTIFY_AUTHORIZATION_CLIENT not found in emitted dexes")
        val registersWebView = authorizationClient.methods
            .filter { it.name == "<init>" }
            .any { constructor ->
                constructor.instructions().any { insn ->
                    insn.opcode == Opcode.INVOKE_DIRECT &&
                        ((insn as ReferenceInstruction).reference as? MethodReference)?.let {
                            it.definingClass == SPOTIFY_WEBVIEW_AUTH_HANDLER && it.name == "<init>"
                        } == true
                }
            }
        check(registersWebView) { "$SPOTIFY_AUTHORIZATION_CLIENT no longer builds $SPOTIFY_WEBVIEW_AUTH_HANDLER" }

        // WebViewAuthHandler.start first offers the login to a browser tab, passing the handler's
        // completion listener, and only falls through to the stock LoginDialog on false.
        val webViewHandler = byType[SPOTIFY_WEBVIEW_AUTH_HANDLER]
            ?: error("$SPOTIFY_WEBVIEW_AUTH_HANDLER not found in emitted dexes")
        val start = webViewHandler.method("start", listOf("Landroid/app/Activity;", SPOTIFY_AUTHORIZATION_REQUEST))
        val startInsns = start.instructions()
        val listenerRead = (startInsns.getOrNull(0) as? ReferenceInstruction)?.reference as? FieldReference
        check(startInsns.getOrNull(0)?.opcode == Opcode.IGET_OBJECT && listenerRead?.type == SPOTIFY_ON_COMPLETE_LISTENER) {
            "WebViewAuthHandler.start does not read its completion listener first; got ${startInsns.getOrNull(0)?.opcode} $listenerRead"
        }
        val openCall = (startInsns.getOrNull(1) as? ReferenceInstruction)?.reference as? MethodReference
        check(
            startInsns.getOrNull(1)?.opcode == Opcode.INVOKE_STATIC &&
                openCall?.definingClass == SPOTIFY_BROWSER_LOGIN && openCall.name == "openInBrowser"
        ) { "WebViewAuthHandler.start does not call openInBrowser second; got ${startInsns.getOrNull(1)?.opcode} $openCall" }
        val openArgs = startInsns[1] as FiveRegisterInstruction
        val firstParam = start.implementation!!.registerCount - 3 // this + 2 params
        check(
            openArgs.registerCount == 3 &&
                openArgs.registerC == firstParam + 1 && openArgs.registerD == firstParam + 2 &&
                openArgs.registerE == (startInsns[0] as TwoRegisterInstruction).registerA
        ) { "openInBrowser does not get (activity, request, listener)" }
        check(startInsns.getOrNull(2)?.opcode == Opcode.MOVE_RESULT) { "openInBrowser's result is not read" }
        check(startInsns.getOrNull(3)?.opcode == Opcode.IF_EQZ && startInsns.getOrNull(4)?.opcode == Opcode.RETURN) {
            "WebViewAuthHandler.start does not return early when the browser opened"
        }
        val fallbackTarget = (startInsns[3] as OffsetInstruction).codeOffset
        check(fallbackTarget == startInsns.drop(3).take(2).sumOf { it.codeUnits }) {
            "the false branch does not jump straight to the stock dialog code"
        }
        check(startInsns.drop(5).any { (it as? ReferenceInstruction)?.reference?.toString() == SPOTIFY_LOGIN_DIALOG }) {
            "the stock LoginDialog fallback is gone from WebViewAuthHandler.start"
        }

        // The extension classes are merged, with the shapes the hook and manifest rely on.
        val browserLogin = byType[SPOTIFY_BROWSER_LOGIN]
            ?: error("$SPOTIFY_BROWSER_LOGIN not merged into the emitted dexes")
        val openInBrowser = browserLogin.method(
            "openInBrowser",
            listOf("Landroid/app/Activity;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
        )
        check(openInBrowser.returnType == "Z" && openInBrowser.implementation != null) { "openInBrowser has the wrong shape" }
        val receiver = byType[SPOTIFY_REDIRECT_RECEIVER]
            ?: error("$SPOTIFY_REDIRECT_RECEIVER not merged into the emitted dexes")
        check(receiver.superclass == "Landroid/app/Activity;") { "$SPOTIFY_REDIRECT_RECEIVER is not an Activity" }

        // The SDK API the extension reaches by reflection is still there.
        val response = byType[SPOTIFY_AUTHORIZATION_RESPONSE] ?: error("$SPOTIFY_AUTHORIZATION_RESPONSE not found")
        response.method("fromUri", listOf("Landroid/net/Uri;"))
        val request = byType[SPOTIFY_AUTHORIZATION_REQUEST] ?: error("$SPOTIFY_AUTHORIZATION_REQUEST not found")
        request.method("toUri", emptyList())
        val listenerType = byType[SPOTIFY_ON_COMPLETE_LISTENER] ?: error("$SPOTIFY_ON_COMPLETE_LISTENER not found")
        listenerType.method("onComplete", listOf(SPOTIFY_AUTHORIZATION_RESPONSE))
        listenerType.method("onCancel", emptyList())

        // The manifest declares the exported receiver for Shazam's Spotify redirect URI.
        val manifestFile = workDir.walkTopDown().first { it.name == "AndroidManifest.xml" && it.readText().contains("<queries") }
        val activities = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(manifestFile)
            .getElementsByTagName("activity")
        val receiverEntry = (0 until activities.length).map { activities.item(it) as Element }
            .singleOrNull { it.getAttribute("android:name") == "app.template.extension.shazam.SpotifyRedirectReceiverActivity" }
            ?: error("the Spotify redirect receiver is not declared exactly once in the manifest")
        check(receiverEntry.getAttribute("android:exported") == "true") { "the redirect receiver is not exported" }
        val data = receiverEntry.getElementsByTagName("data").item(0) as? Element
            ?: error("the redirect receiver has no <data> filter")
        check(data.getAttribute("android:scheme") == "shazam-spotifyoauth" && data.getAttribute("android:host") == "spotifylogincallback") {
            "the redirect receiver filters ${data.getAttribute("android:scheme")}://${data.getAttribute("android:host")}"
        }
        fun names(tag: String) = receiverEntry.getElementsByTagName(tag).let { nodes ->
            (0 until nodes.length).map { (nodes.item(it) as Element).getAttribute("android:name") }
        }
        check("android.intent.action.VIEW" in names("action")) { "the redirect receiver does not handle VIEW" }
        for (category in listOf("android.intent.category.DEFAULT", "android.intent.category.BROWSABLE")) {
            check(category in names("category")) { "the redirect receiver lacks $category, so browsers cannot open it" }
        }
    }
}
