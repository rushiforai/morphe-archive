import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Element
import java.io.File
import java.nio.ByteBuffer
import java.util.zip.ZipFile
import javax.xml.parsers.DocumentBuilderFactory

private const val PKG = "easy.launcher"
private const val ANALYTICS_SERVICE = "Lcom/eet/core/analytics/AnalyticsService;"
private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"
private const val EMPTY_LIST_OWNER = "Lkotlin/collections/CollectionsKt;"
private val SEND_METHODS = setOf(
    "logEvent", "logException", "setUserId", "setUserProperties", "setUserProperty",
    "setCustomKey", "dropBreadcrumb", "sendScreenshot",
)
private val KEPT_ANALYTICS_METHODS = setOf("getAppInstanceId", "generateUserId", "isTestLabDevice", "getName")
private val PROMO_CONFIGS = listOf(
    "Lcom/eet/promos/getjar/config/GetJarRemoteConfig\$BannerConfig;",
    "Lcom/eet/promos/getjar/config/GetJarRemoteConfig\$SearchConfig;",
    "Lcom/eet/promos/sportspass/config/SportsPassRemoteConfig\$BannerConfig;",
    "Lcom/eet/promos/sportspass/config/SportsPassRemoteConfig\$IconConfig;",
    "Lcom/eet/promos/sportspass/config/SportsPassRemoteConfig\$TileConfig;",
    "Lcom/eet/promos/sportspass/config/SportsPassRemoteConfig\$SearchConfig;",
)

private val EASYLAUNCHER_PATCHES = setOf(
    "Disable ads",
    "Disable default launcher reminder",
    "Disable promotions",
    "Disable rating prompts",
    "Disable telemetry",
    "Hide sponsored content",
)

class EasyLauncherSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.strings(): List<String> =
        instructions().mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }

    private fun Method.hasStringStartingWith(prefix: String) = strings().any { it.startsWith(prefix) }

    private fun Method.params(): List<String> = parameterTypes.map(CharSequence::toString)

    private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)

    private fun methodRef(insn: Any?) = (insn as? ReferenceInstruction)?.reference as? MethodReference

    /** The unpatched classes, read straight from the APK's dex files. */
    private fun originalClasses(apk: File): List<ClassDef> = ZipFile(apk).use { zip ->
        zip.entries().toList()
            .filter { Regex("classes\\d*\\.dex").matches(it.name) }
            .flatMap { entry ->
                val bytes = zip.getInputStream(entry).use { it.readBytes() }
                DexBackedDexFile(Opcodes.forApi(36), ByteBuffer.wrap(bytes)).classes.toList()
            }
    }

    @Test
    fun `all Easy Launcher patches apply and mutate the expected bytecode`() {
        val root = repoRoot()
        val apk = File(root, "apks/easylauncher/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "1.10.29",
            patchNames = EASYLAUNCHER_PATCHES,
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }
        val diagnostics = "emitted classes=${classes.size}"
        val original = originalClasses(apk).associateBy { it.type }

        fun klass(type: String) = byType[type] ?: error("$type not found in emitted dexes\n$diagnostics")
        fun allMethods(pkg: String = "") = classes.filter { it.type.startsWith(pkg) }.flatMap { it.methods }
        fun label(method: Method) = "${method.definingClass}.${method.name}(${method.params().joinToString()})"

        // Disable ads: the static (Context)Z gate reading "ads.enabled" + "INSIDE_WALDO".
        val adsGate = allMethods().single {
            it.isStatic() && it.returnType == "Z" && it.params() == listOf("Landroid/content/Context;") &&
                it.strings().containsAll(listOf("ads.enabled", "INSIDE_WALDO"))
        }
        assertForcedBoolean(adsGate, expected = false, label = "ads gate ${label(adsGate)}", diagnostics)

        // GMA/CloudX startup and the UMP consent request return at once.
        val consent = allMethods("Lcom/eet/core/ads/consent/").filter { it.isStatic() && it.returnType == "V" }
        val initSdk = consent.single {
            it.params() == listOf("Landroid/content/Context;") && it.hasStringStartingWith("initializeMobileAdsSdk: ")
        }
        assertReturnsEarlyVoid(initSdk, label = "initializeMobileAdsSdk ${label(initSdk)}", diagnostics)
        val consentUpdate = consent.single {
            it.params() == listOf("Landroid/app/Activity;") && it.hasStringStartingWith("requestConsentInfoUpdate: activity=")
        }
        assertReturnsEarlyVoid(consentUpdate, label = "requestConsentInfoUpdate ${label(consentUpdate)}", diagnostics)

        // App-open ads: loadAd returns; showAd runs only its Function0 (p4) and returns.
        val appOpen = allMethods("Lcom/eet/core/ads/activity/")
        val loadAd = appOpen.single { it.hasStringStartingWith("loadAd: new ad wrapper created for key, ") }
        assertReturnsEarlyVoid(loadAd, label = "app-open loadAd ${label(loadAd)}", diagnostics)
        val showAd = appOpen.single {
            it.params() == listOf("Landroid/app/Activity;", "Ljava/lang/String;", "Ljava/lang/String;", FUNCTION0) &&
                it.hasStringStartingWith("showAd: failed to show ad, ")
        }
        val showInsns = showAd.instructions()
        val invokeCallback = showInsns.firstOrNull()
        val callbackRegister = showAd.implementation!!.registerCount - 1 // p4, the last parameter
        assertTrue(
            invokeCallback is RegisterRangeInstruction && invokeCallback.opcode == Opcode.INVOKE_INTERFACE_RANGE &&
                invokeCallback.startRegister == callbackRegister && invokeCallback.registerCount == 1 &&
                methodRef(invokeCallback)?.definingClass == FUNCTION0 && methodRef(invokeCallback)?.name == "invoke",
            "${label(showAd)} does not invoke its Function0 (v$callbackRegister) first; got ${invokeCallback?.opcode} ${methodRef(invokeCallback)}\n$diagnostics"
        )
        assertTrue(
            showInsns.getOrNull(1)?.opcode == Opcode.RETURN_VOID,
            "${label(showAd)} does not return after the callback; got ${showInsns.getOrNull(1)?.opcode}\n$diagnostics"
        )

        // The native ad cache never replenishes; the ad-free view model's gate is off.
        val replenish = allMethods("Lcom/eet/core/ads/nativead/").single {
            it.returnType == "V" && it.parameterTypes.isEmpty() && it.hasStringStartingWith("replenishAds: size=")
        }
        assertReturnsEarlyVoid(replenish, label = "native cache ${label(replenish)}", diagnostics)
        assertForcedBoolean(
            klass("Lcom/eet/core/iap/AdFreeViewModel;").method("isAdsEnabled", emptyList()),
            expected = false, label = "AdFreeViewModel.isAdsEnabled()", diagnostics
        )

        // Disable telemetry: every send method of every AnalyticsService subclass returns at once,
        // and the value getters are byte-for-byte the stock code.
        val services = classes.filter { it.superclass == ANALYTICS_SERVICE }
        assertTrue(services.size >= 3, "only ${services.size} AnalyticsService subclasses\n$diagnostics")
        val sends = services.flatMap { cls ->
            cls.methods.filter { it.name in SEND_METHODS && it.returnType == "V" && it.implementation != null }
        }
        assertTrue(sends.count { it.name == "logEvent" } >= 3, "fewer than 3 concrete logEvent methods\n$diagnostics")
        sends.forEach { assertReturnsEarlyVoid(it, label = label(it), diagnostics) }
        for (cls in services) {
            val stock = original[cls.type] ?: error("${cls.type} not in the stock APK")
            for (method in cls.methods.filter { it.name in KEPT_ANALYTICS_METHODS }) {
                val before = stock.methods.single { it.name == method.name && it.params() == method.params() }
                assertTrue(
                    before.instructions().map { it.opcode } == method.instructions().map { it.opcode },
                    "${label(method)} changed; it must stay untouched\n$diagnostics"
                )
            }
        }

        // Amplitude was removed from the app in 1.10.29, so there is no client to initialise.

        // Rudderstack: the write key's length is overwritten with 0 before the "key empty" guard.
        val rudderInit = klass("Lcom/eet/service/rudderstack/analytics/RudderstackAnalyticsService;").methods.single {
            it.name == "<init>" && it.hasStringStartingWith("init: failed to initialize Rudderstack")
        }
        val rudderInsns = rudderInit.instructions()
        val lengthCall = rudderInsns.indexOfFirst {
            methodRef(it)?.definingClass == "Ljava/lang/String;" && methodRef(it)?.name == "length"
        }
        val lengthResult = rudderInsns.getOrNull(lengthCall + 1) as? OneRegisterInstruction
        val zeroed = rudderInsns.getOrNull(lengthCall + 2)
        assertTrue(
            lengthCall >= 0 && lengthResult != null && zeroed is NarrowLiteralInstruction &&
                zeroed.opcode == Opcode.CONST_4 && zeroed.narrowLiteral == 0 &&
                (zeroed as OneRegisterInstruction).registerA == lengthResult.registerA,
            "Rudderstack <init> does not zero the write key length; got ${zeroed?.opcode}\n$diagnostics"
        )
        assertTrue(
            rudderInsns.getOrNull(lengthCall + 3)?.opcode in setOf(Opcode.IF_LEZ, Opcode.IF_EQZ),
            "Rudderstack <init> key guard moved; got ${rudderInsns.getOrNull(lengthCall + 3)?.opcode}\n$diagnostics"
        )

        // Singular: both init overloads report failure.
        val singularInits = klass("Lcom/singular/sdk/Singular;").methods.filter {
            it.name == "init" && it.returnType == "Z" && it.implementation != null
        }
        assertTrue(singularInits.size == 2, "expected 2 Singular.init overloads, found ${singularInits.size}\n$diagnostics")
        singularInits.forEach { assertForcedBoolean(it, expected = false, label = label(it), diagnostics) }

        // Braze: initialize returns Unit.INSTANCE without enqueuing its init worker.
        val brazeInit = klass("Lcom/eet/service/braze/push/BrazePushService;")
            .method("initialize", listOf("Landroid/content/Context;", "Lkotlin/coroutines/Continuation;"))
        val unitField = (brazeInit.instructions().firstOrNull() as? ReferenceInstruction)?.reference as? FieldReference
        assertTrue(
            brazeInit.instructions().firstOrNull()?.opcode == Opcode.SGET_OBJECT &&
                unitField?.definingClass == "Lkotlin/Unit;" && unitField.type == "Lkotlin/Unit;",
            "BrazePushService.initialize does not load kotlin.Unit first; got $unitField\n$diagnostics"
        )
        assertTrue(
            brazeInit.instructions().getOrNull(1)?.opcode == Opcode.RETURN_OBJECT,
            "BrazePushService.initialize does not return Unit at once\n$diagnostics"
        )

        // Firebase: setCrashCollectionEnabled always passes false (p1 is the last register).
        val setCrash = klass("Lcom/eet/core/analytics/service/firebase/FirebaseAnalyticsService;")
            .method("setCrashCollectionEnabled", listOf("Z"))
        val forcedArg = setCrash.instructions().firstOrNull()
        assertTrue(
            forcedArg is NarrowLiteralInstruction && forcedArg.opcode == Opcode.CONST_4 && forcedArg.narrowLiteral == 0 &&
                (forcedArg as OneRegisterInstruction).registerA == setCrash.implementation!!.registerCount - 1,
            "FirebaseAnalyticsService.setCrashCollectionEnabled does not force p1 = false; got ${forcedArg?.opcode}\n$diagnostics"
        )

        // Disable rating prompts.
        val reviewOnResume = allMethods().single {
            it.name == "onResume" && it.returnType == "V" && "app_launch_count_for_review" in it.strings() &&
                it.hasStringStartingWith("getDaysSinceInstall")
        }
        assertReturnsEarlyVoid(reviewOnResume, label = "review observer ${label(reviewOnResume)}", diagnostics)
        for (prefix in listOf("isUserPrimedForReview -> true", "shouldRequestAppReview -> true")) {
            val check = allMethods().single {
                it.returnType == "Z" && it.parameterTypes.isEmpty() && it.hasStringStartingWith(prefix)
            }
            assertForcedBoolean(check, expected = false, label = "\"$prefix\" ${label(check)}", diagnostics)
        }

        // Disable promotions.
        for (type in PROMO_CONFIGS) {
            val getters = klass(type).methods.filter {
                it.name in setOf("getEnabled", "getActionCardEnabled", "getSuggestEnabled") && it.returnType == "Z"
            }
            assertTrue(getters.isNotEmpty(), "$type has no enabled getter\n$diagnostics")
            getters.forEach { assertForcedBoolean(it, expected = false, label = label(it), diagnostics) }
        }
        assertForcedBoolean(
            klass("Lcom/eet/feature/cpa/action/CpaOffersActionCardProvider;")
                .method("isEnabled", listOf("Landroid/content/Context;")),
            expected = false, label = "CpaOffersActionCardProvider.isEnabled(Context)", diagnostics
        )
        assertReturnsEarlyVoid(
            klass("Leasy/launcher/ime/promo/ImePromoHandler;").methods.single { it.name == "pitchIme" },
            label = "ImePromoHandler.pitchIme", diagnostics
        )

        // Disable default launcher reminder: right after the role-held check (the helper method
        // whose RoleManager implementation calls isRoleHeld) the result is forced to 1.
        val roleHeldChecks = classes.flatMap { cls ->
            cls.methods.filter { method ->
                method.returnType == "Z" && method.parameterTypes.isEmpty() && method.instructions().any {
                    methodRef(it)?.definingClass == "Landroid/app/role/RoleManager;" && methodRef(it)?.name == "isRoleHeld"
                }
            }.flatMap { listOfNotNull(cls.type to it.name, cls.superclass?.let { sup -> sup to it.name }) }
        }.toSet()
        val work = klass("Leasy/launcher/role/HomeRoleReminderWorker;").methods.single {
            it.returnType == "Ljava/lang/Object;" && it.hasStringStartingWith("doWork: Home role is already held")
        }
        val workInsns = work.instructions()
        val heldCall = workInsns.indices.single { index ->
            val ref = methodRef(workInsns[index])
            ref != null && ref.returnType == "Z" && ref.parameterTypes.isEmpty() && (ref.definingClass to ref.name) in roleHeldChecks
        }
        val heldResult = workInsns[heldCall + 1] as OneRegisterInstruction
        val forcedHeld = workInsns.getOrNull(heldCall + 2)
        assertTrue(
            forcedHeld is NarrowLiteralInstruction && forcedHeld.opcode == Opcode.CONST_4 && forcedHeld.narrowLiteral == 1 &&
                (forcedHeld as OneRegisterInstruction).registerA == heldResult.registerA,
            "HomeRoleReminderWorker does not force the role-held result to true; got ${forcedHeld?.opcode}\n$diagnostics"
        )

        // Hide sponsored content: all four sources return an empty list.
        val model = "Lcom/eet/core/search/data/model/"
        for ((method, name) in listOf(
            klass("${model}SponsoredLinksResponse;").method("getData", emptyList()) to "SponsoredLinksResponse.getData",
            klass("${model}SponsoredSites;").method("getSponsoredSites", emptyList()) to "SponsoredSites.getSponsoredSites",
            klass("${model}SponsoredPostsResponse;").method("getArticles", emptyList()) to "SponsoredPostsResponse.getArticles",
            klass("Lcom/eet/feature/search2/suggest/SponsoredLinkSuggestionProvider;").method(
                "getSuggestions",
                listOf("Ljava/lang/String;", "Ljava/util/List;", "I", "Lkotlin/coroutines/Continuation;"),
            ) to "SponsoredLinkSuggestionProvider.getSuggestions",
        )) {
            assertReturnsMethodCall(method, EMPTY_LIST_OWNER, "emptyList", label = name, diagnostics)
        }

        // Disable telemetry (manifest): the collection switches are set on <application>.
        val manifestFile = workDir.walkTopDown()
            .filter { it.name == "AndroidManifest.xml" && it.readText().contains("firebase_analytics_collection_deactivated") }
            .firstOrNull() ?: error("no decoded AndroidManifest.xml with the telemetry meta-data under $workDir")
        val manifest = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(manifestFile).documentElement
        fun Element.children(tag: String) =
            getElementsByTagName(tag).let { list -> (0 until list.length).map { list.item(it) as Element } }
        val application = manifest.children("application").single()
        val metaData = application.children("meta-data")
            .filter { it.parentNode == application }
            .groupBy({ it.getAttribute("android:name") }, { it.getAttribute("android:value") })
        for ((name, value) in mapOf(
            "firebase_crashlytics_collection_enabled" to "false",
            "firebase_analytics_collection_deactivated" to "true",
            "google_analytics_adid_collection_enabled" to "false",
            "google_analytics_deferred_deep_link_enabled" to "false",
            "com.facebook.sdk.AutoInitEnabled" to "false",
            "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
            // Not ours: FCM's installation ID switch keeps its stock value.
            "firebase_messaging_installation_id_enabled" to "true",
        )) {
            check(metaData[name] == listOf(value)) { "meta-data $name is ${metaData[name]}, expected [$value]" }
        }

        // Push must keep working: the app's MESSAGING_EVENT service is the stock code.
        val messagingServices = application.children("service").filter { service ->
            service.children("action").any { it.getAttribute("android:name") == "com.google.firebase.MESSAGING_EVENT" }
        }.map { "L" + it.getAttribute("android:name").replace('.', '/') + ";" }
        val appService = messagingServices.singleOrNull { it != "Lcom/google/firebase/messaging/FirebaseMessagingService;" }
            ?: error("no single app MESSAGING_EVENT service in $messagingServices")
        val stockService = original[appService] ?: error("$appService not in the stock APK")
        for (method in klass(appService).methods) {
            val before = stockService.methods.single { it.name == method.name && it.params() == method.params() }
            assertTrue(
                before.instructions().map { it.opcode } == method.instructions().map { it.opcode },
                "$appService.${method.name} changed; push handling must stay untouched\n$diagnostics"
            )
        }
    }
}
