import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

private const val PKG = "com.fyxtech.muslim"
private const val ATHAN_ENCRYPTION = "Lcom/common/support/encryption/AthanEncryption;"
private const val AUTHORITY_TYPE = "Lcom/fyxtech/muslim/protobuf/MembershipConfigProto\$AuthorityType;"
private const val WALLET_EXPORT = "Lcom/fyxtech/muslim/bizcore/router/export/IWalletExport;"
private const val OPEN_PAGE_MODEL = "Lcom/fyxtech/muslim/bizcore/resource/LocResourceOpenPageUiModel;"
private const val VIP_CARD_VIEW = "Lcom/fyxtech/muslim/about/module/main/VipCardView;"
private const val INFO_STREAM_UNIT = "Lcom/fyxtech/muslim/protobuf/InfoStreamProto\$InfoStreamUnit;"
private const val GMA = "Lcom/google/android/gms/ads/"

class WeMuslimSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.params() = parameterTypes.map(CharSequence::toString)

    private fun Method.referencesString(value: String) = instructions().any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
    }

    // Steps 1-2 of the NO_ADS guard: sget-object AUTHORITY_TYPE_NO_ADS, if-ne p1 against it.
    private fun assertNoAdsGuard(method: Method, label: String) {
        val insns = method.instructions()
        val field = (insns.getOrNull(0) as? ReferenceInstruction)?.reference as? FieldReference
        assertTrue(
            insns.getOrNull(0)?.opcode == Opcode.SGET_OBJECT &&
                field?.definingClass == AUTHORITY_TYPE && field.name == "AUTHORITY_TYPE_NO_ADS",
            "$label does not start by loading AUTHORITY_TYPE_NO_ADS; first instruction is ${insns.getOrNull(0)?.opcode} $field",
        )
        assertTrue(insns.getOrNull(1)?.opcode == Opcode.IF_NE, "$label does not compare p1 with NO_ADS; second is ${insns.getOrNull(1)?.opcode}")
    }

    @Test
    fun `WeMuslim ads, telemetry and premium banners are patched`() {
        val root = repoRoot()
        val apk = File(root, "apks/wemuslim/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "3.5.4",
            patchNames = setOf(
                "Fix native encryption check",
                "Disable ads",
                "Disable telemetry",
                "Hide premium banners",
                "Hide feed clutter",
            ),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        fun cls(type: String): ClassDef = classes.firstOrNull { it.type == type } ?: error("$type not found in emitted dexes")
        fun Method.label() = "$definingClass->$name(${params().joinToString()})"

        // Native encryption bypass: the static initializer never loads libagora-ey.so and every
        // Java call to its String getters now uses a constant from the developer-signed build.
        val athan = cls(ATHAN_ENCRYPTION)
        val athanClinit = athan.methods.singleOrNull {
            it.name == "<clinit>" && it.returnType == "V" && it.params().isEmpty()
        } ?: error("$ATHAN_ENCRYPTION has no <clinit>()V")
        assertReturnsEarlyVoid(athanClinit, "AthanEncryption.<clinit>")

        fun Method.callsAthanStringGetter(): Boolean = instructions().any { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == ATHAN_ENCRYPTION &&
                reference.returnType == "Ljava/lang/String;" && reference.parameterTypes.isEmpty()
        }

        val remainingKeyCalls = classes
            .filter { it.type != ATHAN_ENCRYPTION }
            .flatMap { it.methods }
            .filter { it.implementation != null && it.callsAthanStringGetter() }
            .map { it.label() }
        assertTrue(
            remainingKeyCalls.isEmpty(),
            "native AthanEncryption key calls remain in $remainingKeyCalls",
        )

        val emittedStrings = classes
            .flatMap { it.methods }
            .flatMap { method -> method.instructions() }
            .mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
            .toSet()
        for (value in listOf(
            "AreyoumySnowman?",
            "925906699745-gqq5o2nosortc7e97q5t9kroiruvrooo.apps.googleusercontent.com",
            "muslim-376506",
            "AIzaSyDq3pQfR6tWozuv1mDJO6tiVRBc7iddqTM",
        )) {
            assertTrue(value in emittedStrings, "dumped AthanEncryption value is missing: $value")
        }

        // Disable ads, step 1: the single IWalletExport implementation answers NO_ADS itself, in
        // both forms. Found like the patch: by the kept interface, then by method shape.
        val wallet = classes.filter { WALLET_EXPORT in it.interfaces && !AccessFlags.INTERFACE.isSet(it.accessFlags) }
            .singleOrNull() ?: error("no single $WALLET_EXPORT implementation")
        val hasAuthority = wallet.methods.single {
            it.returnType == "Z" && it.params() == listOf(AUTHORITY_TYPE) && it.implementation != null
        }
        assertNoAdsGuard(hasAuthority, hasAuthority.label())
        hasAuthority.instructions().let { insns ->
            val literal = insns.getOrNull(2) as? NarrowLiteralInstruction
            assertTrue(
                literal?.opcode == Opcode.CONST_4 && literal.narrowLiteral == 1 && insns.getOrNull(3)?.opcode == Opcode.RETURN,
                "${hasAuthority.label()} does not return true for NO_ADS",
            )
            // Every other privilege still reaches the stock check (in 3.5.4 through the clone that
            // gave the method a free register).
            assertTrue(
                insns.drop(4).any {
                    val call = (it as? ReferenceInstruction)?.reference as? MethodReference
                    it.opcode == Opcode.INVOKE_STATIC && call?.returnType == "Z" &&
                        call.parameterTypes.map(CharSequence::toString) == listOf(AUTHORITY_TYPE)
                },
                "${hasAuthority.label()} lost its stock (AuthorityType)Z check",
            )
        }
        val authorityFlow = wallet.methods.single {
            it.returnType == "Ljava/lang/Object;" && it.implementation != null &&
                it.params() == listOf(AUTHORITY_TYPE, "Lkotlin/coroutines/Continuation;")
        }
        assertNoAdsGuard(authorityFlow, authorityFlow.label())
        authorityFlow.instructions().let { insns ->
            val boxed = (insns.getOrNull(2) as? ReferenceInstruction)?.reference as? FieldReference
            val flow = (insns.getOrNull(3) as? ReferenceInstruction)?.reference as? MethodReference
            assertTrue(
                boxed?.definingClass == "Ljava/lang/Boolean;" && boxed.name == "TRUE" &&
                    flow?.definingClass == "Lkotlinx/coroutines/flow/StateFlowKt;" && flow.name == "MutableStateFlow" &&
                    insns.getOrNull(4)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
                    insns.getOrNull(5)?.opcode == Opcode.RETURN_OBJECT,
                "${authorityFlow.label()} does not return MutableStateFlow(TRUE) for NO_ADS; got $boxed / $flow",
            )
        }

        // Disable ads, step 2: the open-page ad gate answers false. Found like the patch: the
        // instance (LocResourceOpenPageUiModel)Z that reads the new-user grace period, inline
        // (3.5.0) or through its static ()Z helper (3.5.4).
        val allMethods = classes.flatMap { it.methods }
        val graceChecks = allMethods.filter {
            it.returnType == "Z" && it.params().isEmpty() && it.implementation != null &&
                it.referencesString("ad_new_user_first_show_days")
        }.map { it.label() }.toSet()
        val openPageGates = allMethods.filter {
            it.returnType == "Z" && it.params() == listOf(OPEN_PAGE_MODEL) && it.implementation != null &&
                !AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.instructions().any { insn ->
                    when (val reference = (insn as? ReferenceInstruction)?.reference) {
                        is StringReference -> reference.string == "ad_new_user_first_show_days"
                        is MethodReference ->
                            "${reference.definingClass}->${reference.name}(${reference.parameterTypes.joinToString()})" in graceChecks
                        else -> false
                    }
                }
        }
        assertTrue(openPageGates.size == 1, "expected one open-page ad gate, found ${openPageGates.map { it.label() }}")
        assertForcedBoolean(openPageGates.single(), expected = false, label = openPageGates.single().label())

        // Disable ads, step 3: every non-rewarded GMA load overload is a no-op.
        for ((owner, names) in mapOf(
            "${GMA}BaseAdView;" to setOf("loadAd"),
            "${GMA}AdLoader;" to setOf("loadAd", "loadAds"),
            "${GMA}interstitial/InterstitialAd;" to setOf("load"),
            "${GMA}appopen/AppOpenAd;" to setOf("load"),
        )) {
            for (name in names) {
                val targets = cls(owner).methods.filter { it.name == name && it.returnType == "V" && it.implementation != null }
                assertTrue(targets.isNotEmpty(), "$owner has no concrete void $name")
                targets.forEach { assertReturnsEarlyVoid(it, it.label()) }
            }
        }
        // Rewarded ads stay usable (make-up prayers, golds, point rewards), so the SDK still
        // initializes and RewardedAd.load still runs.
        for ((owner, name) in listOf("${GMA}MobileAds;" to "initialize", "${GMA}rewarded/RewardedAd;" to "load")) {
            cls(owner).methods.filter { it.name == name && it.implementation != null }.forEach {
                assertFalse(it.instructions().firstOrNull()?.opcode == Opcode.RETURN_VOID, "${it.label()} must stay intact")
            }
        }

        // Disable telemetry: the (String, Bundle) logEvent of FirebaseAnalytics' measurement client
        // (found by its field type), the AppMeasurementSdk logs, the AppsFlyer implementation and
        // Adjust.
        val client = cls("Lcom/google/firebase/analytics/FirebaseAnalytics;").fields
            .filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type.startsWith("Lcom/google/android/gms/internal/measurement/") }
            .map { it.type }.distinct().singleOrNull() ?: error("FirebaseAnalytics has no single measurement client field")
        val analyticsLog = cls(client).methods.singleOrNull {
            it.returnType == "V" && it.implementation != null && !AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.params() == listOf("Ljava/lang/String;", "Landroid/os/Bundle;")
        } ?: error("$client has no single (String, Bundle) logEvent")
        assertReturnsEarlyVoid(analyticsLog, analyticsLog.label())

        val measurement = cls("Lcom/google/android/gms/measurement/api/AppMeasurementSdk;")
        for (name in listOf("logEvent", "logEventNoInterceptor", "setUserProperty")) {
            measurement.methods.filter { it.name == name && it.implementation != null }
                .ifEmpty { error("AppMeasurementSdk has no $name") }
                .forEach { assertReturnsEarlyVoid(it, it.label()) }
        }

        val appsFlyer = classes.filter {
            it.superclass == "Lcom/appsflyer/AppsFlyerLib;" && !AccessFlags.ABSTRACT.isSet(it.accessFlags)
        }
        assertTrue(appsFlyer.isNotEmpty(), "no concrete AppsFlyerLib subclass")
        for (impl in appsFlyer) {
            for (name in listOf("start", "logEvent", "logSession", "logAdRevenue")) {
                impl.methods.filter { it.name == name && it.implementation != null }
                    .ifEmpty { error("${impl.type} has no $name") }
                    .forEach { assertReturnsEarlyVoid(it, it.label()) }
            }
            // Gone from the AppsFlyer SDK in 3.5.4; still patched where it exists.
            impl.methods.filter { it.name == "setCustomerIdAndLogSession" && it.implementation != null }
                .forEach { assertReturnsEarlyVoid(it, it.label()) }
            impl.methods.filter { it.name == "init" && it.implementation != null }.ifEmpty { error("${impl.type} has no init") }.forEach {
                assertTrue(it.instructions().firstOrNull()?.opcode == Opcode.RETURN_OBJECT, "${it.label()} does not return this at once")
            }
        }

        val adjust = cls("Lcom/adjust/sdk/Adjust;")
        for (name in listOf("initSdk", "trackEvent", "trackAdRevenue")) {
            assertReturnsEarlyVoid(adjust.methods.single { it.name == name }, "Adjust.$name")
        }

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
            "firebase_analytics_collection_deactivated" to "true",
            "google_analytics_adid_collection_enabled" to "false",
            "firebase_crashlytics_collection_enabled" to "false",
        )) {
            check(metaData[name] == listOf(value)) { "meta-data $name is ${metaData[name]}, expected [$value]" }
        }

        // Hide premium banners, step 1: the feed's membership unit is never recognised.
        assertForcedBoolean(
            cls("Lcom/fyxtech/muslim/protobuf/InfoStreamProto\$InfoStreamUnit;").method("hasMembershipInfo", listOf()),
            expected = false,
            label = "InfoStreamUnit.hasMembershipInfo()",
        )

        // Step 2: VipCardView forces GONE in setVisibility and hides itself in every constructor.
        val vipCard = cls(VIP_CARD_VIEW)
        val setVisibility = vipCard.method("setVisibility", listOf("I"))
        val gone = setVisibility.instructions().firstOrNull() as? NarrowLiteralInstruction
        assertTrue(gone != null && gone.narrowLiteral == 8, "VipCardView.setVisibility does not force GONE first")
        val constructors = vipCard.methods.filter { it.name == "<init>" && it.implementation != null }
        assertTrue(constructors.isNotEmpty(), "VipCardView has no constructor")
        for (constructor in constructors) {
            val insns = constructor.instructions()
            val returns = insns.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
            assertTrue(returns.isNotEmpty(), "${constructor.label()} has no return-void")
            for ((index, _) in returns) {
                val call = (insns.getOrNull(index - 1) as? ReferenceInstruction)?.reference as? MethodReference
                val literal = insns.getOrNull(index - 2) as? NarrowLiteralInstruction
                assertTrue(
                    call?.definingClass == VIP_CARD_VIEW && call.name == "setVisibility" && literal?.narrowLiteral == 8,
                    "${constructor.label()} does not hide the card before returning (found $call)",
                )
            }
        }

        // Hide feed clutter: each unit accessor answers false, so the stream builder drops it.
        val unit = cls("Lcom/fyxtech/muslim/protobuf/InfoStreamProto\$InfoStreamUnit;")
        for (name in listOf(
            "hasLoginGuide",
            "hasNearby",
            "hasPostInfo",
            "hasStore",
            "hasFirstRecharge",
            "hasWatchAdWinRewards",
        )) {
            val accessor = unit.methods.singleOrNull {
                it.name == name && it.returnType == "Z" && it.params().isEmpty()
            } ?: error("$INFO_STREAM_UNIT->$name()Z not found")
            assertForcedBoolean(accessor, expected = false, label = "${unit.type}->$name()")
        }
    }
}
