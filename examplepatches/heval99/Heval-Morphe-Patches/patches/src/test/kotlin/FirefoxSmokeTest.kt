import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "org.mozilla.firefox"
private const val SETTINGS = "Lorg/mozilla/fenix/utils/Settings;"
private const val HTTP_STATUS = "Lmozilla/telemetry/glean/internal/UploadResult\$HttpStatus;"
private const val PING_UPLOADER = "Lmozilla/telemetry/glean/net/PingUploader;"
private const val UPLOAD_REQUEST = "Lmozilla/telemetry/glean/net/CapablePingUploadRequest;"
private const val CRASH_REPORTER_SERVICE = "Lmozilla/components/lib/crash/service/CrashReporterService;"
private const val INSTANCE_INFO = "Lorg/mozilla/gecko/process/ServiceAllocator\$InstanceInfo;"
private const val PRIORITY_LEVEL = "Lorg/mozilla/gecko/process/ServiceAllocator\$PriorityLevel;"
private const val GECKO_PROCESS_TYPE = "Lorg/mozilla/gecko/process/GeckoProcessType;"
private const val ONBOARDING_CARD_TYPE = "Lorg/mozilla/fenix/nimbus/OnboardingCardType;"
private const val CUSTOM_EXTENSION_COLLECTION = "customExtensionCollectionFeature"

class FirefoxSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.methodRef(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference
    private fun Instruction.fieldRef(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference
    private fun Instruction.typeRef(): String? = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type
    private fun Instruction.registerA(): Int = (this as OneRegisterInstruction).registerA
    private fun Instruction.literal(): Int = (this as NarrowLiteralInstruction).narrowLiteral
    private fun Method.params(): List<String> = parameterTypes.map(CharSequence::toString)
    private fun Method.p(index: Int): Int = implementation!!.registerCount - params().size - 1 + index

    private fun assertReturnsNull(method: Method, label: String) {
        val insns = method.instructions()
        assertTrue(
            insns.getOrNull(0)?.opcode == Opcode.CONST_4 && insns[0].literal() == 0 &&
                insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT && insns[1].registerA() == insns[0].registerA(),
            "$label does not return null at once: ${insns.take(2).map { it.opcode }}",
        )
    }

    private fun assertReturnsStatic(method: Method, owner: String, field: String, label: String) {
        val insns = method.instructions()
        val ref = insns.getOrNull(0)?.fieldRef()
        assertTrue(
            insns.getOrNull(0)?.opcode == Opcode.SGET_OBJECT && ref?.definingClass == owner && ref.name == field &&
                insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT && insns[1].registerA() == insns[0].registerA(),
            "$label does not return $owner->$field at once: ${insns.take(2).map { it.opcode }} $ref",
        )
    }

    /** `new-instance vX, type` + `invoke-direct {vX, ...}, type-><init>` + ... + `return-object vX` at entry. */
    private fun assertReturnsNew(method: Method, type: String, label: String, constructorParams: List<String>) {
        val insns = method.instructions()
        assertTrue(insns.getOrNull(0)?.opcode == Opcode.NEW_INSTANCE && insns[0].typeRef() == type, "$label does not start with new $type")
        val register = insns[0].registerA()
        val init = insns.indexOfFirst { it.opcode == Opcode.INVOKE_DIRECT }
        val ctor = insns[init].methodRef()!!
        assertTrue(
            ctor.definingClass == type && ctor.name == "<init>" && ctor.parameterTypes.map(CharSequence::toString) == constructorParams &&
                (insns[init] as FiveRegisterInstruction).registerC == register,
            "$label does not construct $type($constructorParams): $ctor",
        )
        assertTrue(
            insns.getOrNull(init + 1)?.opcode == Opcode.RETURN_OBJECT && insns[init + 1].registerA() == register,
            "$label does not return the new $type",
        )
    }

    @Test
    fun `Firefox telemetry, sponsored content, about-config, secret settings, prompts and background tabs are patched`() {
        val root = repoRoot()
        val apk = File(root, "apks/firefox/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "158.0.2",
            patchNames = setOf(
                "Disable telemetry",
                "Hide sponsored content",
                "Enable about:config",
                "Unlock secret settings",
                "Hide promotional prompts",
                "Keep background tabs loaded",
            ),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }
        fun classDef(type: String): ClassDef = byType[type] ?: error("$type not found in emitted dexes")
        fun method(type: String, name: String, params: List<String>): Method = classDef(type).method(name, params)
        val settings = classDef(SETTINGS)

        // ── Disable telemetry ──────────────────────────────────────────────────────────────
        // 1. Every PingUploader that builds an HttpStatus answers HttpStatus(200) at once.
        val uploaders = classes.filter { PING_UPLOADER in it.interfaces }
        val hooked = uploaders.mapNotNull { uploader ->
            uploader.methods.singleOrNull { it.name == "upload" && it.params() == listOf(UPLOAD_REQUEST) && it.implementation != null }
                ?.takeIf { upload -> upload.instructions().any { it.opcode == Opcode.NEW_INSTANCE && it.typeRef() == HTTP_STATUS } }
                ?.let { uploader.type to it }
        }
        assertTrue(
            hooked.map { it.first }.containsAll(
                listOf("Lmozilla/components/service/glean/net/ConceptFetchHttpUploader;", "Lmozilla/telemetry/glean/net/HttpURLConnectionUploader;"),
            ),
            "expected the ConceptFetch and HttpURLConnection uploaders, found ${hooked.map { it.first }}",
        )
        for ((type, upload) in hooked) {
            assertReturnsNew(upload, HTTP_STATUS, "$type->upload", listOf("I"))
            val insns = upload.instructions()
            assertTrue(insns[1].opcode == Opcode.CONST_16 && insns[1].literal() == 200, "$type->upload status is not 200")
            assertEquals(insns[1].registerA(), (insns[2] as FiveRegisterInstruction).registerD, "$type->upload status register")
        }
        // BaseUploader only delegates and is left alone.
        assertEquals(
            Opcode.INVOKE_VIRTUAL,
            method("Lmozilla/telemetry/glean/net/BaseUploader;", "upload", listOf(UPLOAD_REQUEST)).instructions().first().opcode,
            "BaseUploader.upload changed",
        )

        // 2. Telemetry, daily usage ping, marketing and Studies read as off.
        listOf("isTelemetryEnabled", "isDailyUsagePingEnabled", "isMarketingTelemetryEnabled", "isExperimentationEnabled")
            .forEach { assertForcedBoolean(settings.method(it, emptyList()), false, "Settings.$it") }

        // 3. The Adjust statics Fenix calls return at once.
        val adjust = classDef("Lcom/adjust/sdk/Adjust;")
        mapOf(
            "initSdk" to listOf("Lcom/adjust/sdk/AdjustConfig;"),
            "enable" to emptyList(),
            "trackEvent" to listOf("Lcom/adjust/sdk/AdjustEvent;"),
            "trackThirdPartySharing" to listOf("Lcom/adjust/sdk/AdjustThirdPartySharing;"),
            "gdprForgetMe" to listOf("Landroid/content/Context;"),
        ).forEach { (name, params) -> assertReturnsEarlyVoid(adjust.method(name, params), "Adjust.$name") }

        // 4. Sentry never initialises; every concrete report overload on every crash service answers at once.
        assertReturnsEarlyVoid(method("Lmozilla/components/lib/crash/sentry/SentryService;", "initIfNeeded", emptyList()), "SentryService.initIfNeeded")
        val services = classes.filter { CRASH_REPORTER_SERVICE in it.interfaces }
        assertEquals(
            setOf("Lmozilla/components/lib/crash/sentry/SentryService;", "Lmozilla/components/lib/crash/service/socorro/MozillaSocorroService;"),
            services.map { it.type }.toSet(),
            "crash services",
        )
        for (service in services) {
            val reports = service.methods.filter { it.name == "report" && it.implementation != null }
            assertTrue(reports.size >= 3, "${service.type} has ${reports.size} report overloads")
            assertTrue(
                reports.any { it.params() == listOf("Lmozilla/components/lib/crash/Crash\$UncaughtExceptionCrash;") },
                "${service.type} has no report(UncaughtExceptionCrash)",
            )
            for (report in reports) {
                val label = "${service.type}->report(${report.params().joinToString()})"
                if (report.returnType == "V") assertReturnsEarlyVoid(report, label) else assertReturnsNull(report, label)
            }
        }

        // 5. Nimbus downloads no experiments.
        assertReturnsEarlyVoid(method("Lorg/mozilla/experiments/nimbus/Nimbus;", "fetchExperiments", emptyList()), "Nimbus.fetchExperiments")

        // ── Hide sponsored content ─────────────────────────────────────────────────────────
        listOf("getShowContileFeature", "getShowPocketSponsoredStories", "getShowSponsoredSuggestions")
            .forEach { assertForcedBoolean(settings.method(it, emptyList()), false, "Settings.$it") }
        // Non-sponsored suggestions are not touched.
        assertTrue(
            settings.method("getShowNonSponsoredSuggestions", emptyList()).instructions().first().opcode != Opcode.CONST_4,
            "getShowNonSponsoredSuggestions was changed",
        )
        assertForcedBoolean(
            method("Lorg/mozilla/fenix/home/pocket/ContentRecommendationsFeatureHelper;", "isPocketSponsoredStoriesFeatureEnabled", listOf("Landroid/content/Context;")),
            false,
            "isPocketSponsoredStoriesFeatureEnabled",
        )
        val getTopSites = classDef("Lmozilla/components/service/mars/MacTopSitesProvider;").methods
            .filter { it.name == "getTopSites" && it.implementation != null }
        assertTrue(getTopSites.isNotEmpty(), "MacTopSitesProvider has no getTopSites")
        getTopSites.forEach { assertReturnsStatic(it, "Lkotlin/collections/EmptyList;", "INSTANCE", "MacTopSitesProvider.getTopSites") }

        // ── Enable about:config ────────────────────────────────────────────────────────────
        val aboutConfig = method("Lorg/mozilla/geckoview/GeckoRuntimeSettings\$Builder;", "aboutConfigEnabled", listOf("Z"))
        val first = aboutConfig.instructions().first()
        assertTrue(
            first.opcode == Opcode.CONST_4 && first.literal() == 1 && first.registerA() == aboutConfig.p(1),
            "aboutConfigEnabled does not set p1 to true first: ${first.opcode}",
        )

        // ── Unlock secret settings ─────────────────────────────────────────────────────────
        assertForcedBoolean(settings.method("getShowSecretDebugMenuThisSession", emptyList()), true, "Settings.getShowSecretDebugMenuThisSession")
        val clinit = method("Lorg/mozilla/fenix/FeatureFlags;", "<clinit>", emptyList()).instructions()
        val stores = clinit.indices.filter { clinit[it].opcode == Opcode.SPUT_BOOLEAN && clinit[it].fieldRef()?.name == CUSTOM_EXTENSION_COLLECTION }
        assertEquals(2, stores.size, "customExtensionCollectionFeature stores")
        val (stock, forced) = stores
        assertEquals(stock + 2, forced, "the forced store does not follow the stock one")
        assertTrue(
            clinit[forced - 1].opcode == Opcode.CONST_16 && clinit[forced - 1].literal() == 1 &&
                clinit[forced - 1].registerA() == clinit[forced].registerA(),
            "customExtensionCollectionFeature is not forced to true",
        )

        // ── Hide promotional prompts ───────────────────────────────────────────────────────
        // 1-3. No next message, no microsurveys, the notification worker succeeds at once.
        assertReturnsNull(
            method("Lmozilla/components/service/nimbus/messaging/NimbusMessagingStorage;", "getNextMessage", listOf("Ljava/lang/String;", "Ljava/util/List;")),
            "NimbusMessagingStorage.getNextMessage(String, List)",
        )
        assertForcedBoolean(settings.method("getMicrosurveyFeatureEnabled", emptyList()), false, "Settings.getMicrosurveyFeatureEnabled")
        assertReturnsNew(
            method("Lorg/mozilla/fenix/messaging/MessageNotificationWorker;", "doWork", listOf("Lkotlin/coroutines/Continuation;")),
            "Landroidx/work/ListenableWorker\$Result\$Success;",
            "MessageNotificationWorker.doWork",
            emptyList(),
        )

        // 4. HomeActivity.onCreate: the isDefaultBrowser result is set to true right after its move-result.
        val onCreate = method("Lorg/mozilla/fenix/HomeActivity;", "onCreate", listOf("Landroid/os/Bundle;")).instructions()
        val isDefault = onCreate.indices.single { onCreate[it].methodRef()?.name == "isDefaultBrowser" }
        assertEquals(Opcode.MOVE_RESULT, onCreate[isDefault + 1].opcode, "isDefaultBrowser result")
        assertTrue(
            onCreate[isDefault + 2].opcode == Opcode.CONST_16 && onCreate[isDefault + 2].literal() == 1 &&
                onCreate[isDefault + 2].registerA() == onCreate[isDefault + 1].registerA(),
            "isDefaultBrowser is not forced to true",
        )

        // 5. Onboarding: the card filter lambda (found by shape, like the patch) gets no default browser card and drops SYNC_SIGN_IN.
        val lambda = classes.single { classDef ->
            classDef.type.startsWith("Lorg/mozilla/fenix/onboarding/view/OnboardingMapperKt\$\$") &&
                "Lkotlin/jvm/functions/Function1;" in classDef.interfaces &&
                classDef.methods.any { it.name == "<init>" && it.params() == listOf("Z", "Z", "Z", "Z") }
        }
        val lambdaInit = lambda.method("<init>", listOf("Z", "Z", "Z", "Z"))
        val initFirst = lambdaInit.instructions().first()
        assertTrue(
            initFirst.opcode == Opcode.CONST_4 && initFirst.literal() == 0 && initFirst.registerA() == lambdaInit.p(1),
            "the onboarding default browser flag is not forced to false",
        )
        val filter = lambda.method("invoke", listOf("Ljava/lang/Object;")).instructions()
        val cast = filter.indexOfFirst { it.opcode == Opcode.CHECK_CAST && it.typeRef() == ONBOARDING_CARD_TYPE }
        val syncSignIn = filter[cast + 1]
        val compare = filter[cast + 2]
        assertTrue(
            syncSignIn.opcode == Opcode.SGET_OBJECT && syncSignIn.fieldRef()?.let { it.definingClass == ONBOARDING_CARD_TYPE && it.name == "SYNC_SIGN_IN" } == true,
            "the onboarding filter does not load SYNC_SIGN_IN after the card type",
        )
        assertTrue(
            compare.opcode == Opcode.IF_NE && (compare as TwoRegisterInstruction).registerA == filter[cast].registerA() &&
                compare.registerB == syncSignIn.registerA(),
            "the onboarding filter does not compare the card type with SYNC_SIGN_IN",
        )
        assertEquals(
            listOf(Opcode.CONST_4, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT),
            filter.subList(cast + 3, cast + 7).map { it.opcode },
            "the onboarding filter does not answer false for SYNC_SIGN_IN",
        )
        assertEquals(0, filter[cast + 3].literal(), "SYNC_SIGN_IN answer")

        // 6-7. Follow-up onboarding and the automatic rating prompt.
        assertReturnsEarlyVoid(method("Lorg/mozilla/fenix/onboarding/continuous/ContinuousOnboardingFeature;", "start", emptyList()), "ContinuousOnboardingFeature.start")
        assertReturnsStatic(
            method("Lorg/mozilla/fenix/reviewprompt/ShowReviewPromptBinding;", "onState", listOf("Lkotlinx/coroutines/flow/Flow;", "Lkotlin/coroutines/Continuation;")),
            "Lkotlin/Unit;",
            "INSTANCE",
            "ShowReviewPromptBinding.onState",
        )

        // ── Keep background tabs loaded ────────────────────────────────────────────────────
        val instanceInfo = classDef(INSTANCE_INFO)
        val helper = instanceInfo.methods.single { it.name == "morpheKeepContentProcessPriority" }
        assertTrue(
            AccessFlags.STATIC.isSet(helper.accessFlags) && helper.params() == listOf(INSTANCE_INFO, PRIORITY_LEVEL) &&
                helper.returnType == PRIORITY_LEVEL,
            "the priority helper is not static PriorityLevel(InstanceInfo, PriorityLevel)",
        )
        val helperFields = helper.instructions().mapNotNull { it.fieldRef() }.map { "${it.definingClass}->${it.name}" }
        assertEquals(
            listOf("$INSTANCE_INFO->mType") +
                listOf("CONTENT", "CONTENT_ISOLATED", "CONTENT_ISOLATED_WITH_ZYGOTE").map { "$GECKO_PROCESS_TYPE->$it" } +
                listOf("$PRIORITY_LEVEL->IDLE", "$PRIORITY_LEVEL->BACKGROUND"),
            helperFields,
            "priority helper fields",
        )
        val setPriority = instanceInfo.method("setPriorityLevel", listOf(PRIORITY_LEVEL, "I"))
        val setInsns = setPriority.instructions()
        val call = setInsns[0] as FiveRegisterInstruction
        assertTrue(
            setInsns[0].opcode == Opcode.INVOKE_STATIC && setInsns[0].methodRef()?.name == helper.name &&
                call.registerCount == 2 && call.registerC == setPriority.p(0) && call.registerD == setPriority.p(1),
            "setPriorityLevel does not pass (this, level) to the helper first",
        )
        assertTrue(
            setInsns[1].opcode == Opcode.MOVE_RESULT_OBJECT && setInsns[1].registerA() == setPriority.p(1),
            "setPriorityLevel does not take the helper's level",
        )
        assertForcedBoolean(settings.method("getTabReloadCoverEnabled", emptyList()), true, "Settings.getTabReloadCoverEnabled")
    }
}
