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
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "club.boxbox.android"

class BoxBoxSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `premium, ads and telemetry patches apply to every entry point`() {
        val root = repoRoot()
        val apk = File(root, "apks/boxbox/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "5.4.18",
            patchNames = setOf("Enable Premium", "Disable ads", "Disable telemetry"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        fun klass(type: String) = classes.firstOrNull { it.type == type }
            ?: error("$type not found in emitted dexes")

        fun Method.strings() = instructions()
            .mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }

        fun Method.calls(definingClass: String) = instructions().any {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == definingClass
        }

        // Premium 1: the RevenueCat entitlement predicate.
        assertForcedBoolean(
            klass("Lcom/revenuecat/purchases/EntitlementInfo;").method("isActive"),
            expected = true,
            label = "EntitlementInfo.isActive()",
        )

        // The plan enum and its Pro constant, found as the patch does: the enum whose
        // <clinit> names "Free" and "Pro", and the constant stored after "Pro".
        val planEnum = classes.single { cls ->
            cls.superclass == "Ljava/lang/Enum;" &&
                cls.methods.any { it.name == "<clinit>" && it.strings().containsAll(listOf("Free", "Pro")) }
        }
        val clinit = planEnum.method("<clinit>").instructions()
        val proField = clinit
            .drop(clinit.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "Pro" })
            .first { it.opcode == Opcode.SPUT_OBJECT }
            .let { (it as ReferenceInstruction).reference as FieldReference }
        fun isPro(field: FieldReference?) =
            field != null && field.definingClass == planEnum.type && field.name == proField.name
        val entries = planEnum.fields.single {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.type != planEnum.type && !it.type.startsWith("[")
        }

        // Premium 2: the cached plan decode, entries.get(ordinal), is overwritten with Pro. Only
        // get(I) calls whose receiver was loaded from the entries field count.
        fun isEntries(insn: Instruction?) = insn?.opcode == Opcode.SGET_OBJECT &&
            ((insn as ReferenceInstruction).reference as FieldReference).let {
                it.definingClass == entries.definingClass && it.name == entries.name
            }
        val cachedReads = classes.flatMap { it.methods }.filter { method -> method.instructions().any(::isEntries) }
        assertTrue(cachedReads.isNotEmpty(), "no reader of ${planEnum.type} entries found")
        cachedReads.forEach { method ->
            val insns = method.instructions()
            val decodes = insns.indices.filter { i ->
                val ref = (insns[i] as? ReferenceInstruction)?.reference as? MethodReference
                if (insns[i].opcode != Opcode.INVOKE_VIRTUAL || ref?.name != "get" ||
                    ref.parameterTypes.map(CharSequence::toString) != listOf("I")
                ) return@filter false
                val receiver = (insns[i] as FiveRegisterInstruction).registerC
                isEntries(insns.subList(0, i).lastOrNull { w ->
                    w.opcode.setsRegister() && (w as? OneRegisterInstruction)?.registerA == receiver
                })
            }
            assertTrue(decodes.isNotEmpty(), "${method.definingClass}.${method.name} reads entries but never decodes")
            decodes.forEach { i ->
                val moved = insns[i + 1] as OneRegisterInstruction
                val forced = insns.getOrNull(i + 2)
                assertTrue(
                    moved.opcode == Opcode.MOVE_RESULT_OBJECT && forced?.opcode == Opcode.SGET_OBJECT &&
                        (forced as OneRegisterInstruction).registerA == moved.registerA &&
                        isPro((forced as ReferenceInstruction).reference as FieldReference),
                    "${method.definingClass}.${method.name}: entries.get(I) result is not overwritten with Pro",
                )
            }
        }

        // Premium 3: every PlanDataStore method that returns the plan returns Pro, and none
        // that reads the RevenueCat entitlement is left out (5.4.17: the live CustomerInfo check
        // and the cache read; 5.4.16 has neither, its store only exposes the flow).
        val store = classes.single { cls ->
            cls.methods.any { it.name == "<clinit>" && it.strings().containsAll(listOf("plans_data_store", "plan_type")) }
        }
        val planReturns = store.methods.filter {
            it.implementation != null && (it.returnType == "Ljava/lang/Enum;" || it.returnType == planEnum.type)
        }
        planReturns.forEach { method ->
            val insns = method.instructions()
            assertTrue(
                insns.getOrNull(0)?.opcode == Opcode.SGET_OBJECT &&
                    isPro((insns[0] as ReferenceInstruction).reference as FieldReference) &&
                    insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT &&
                    (insns[1] as OneRegisterInstruction).registerA == (insns[0] as OneRegisterInstruction).registerA,
                "${store.type}.${method.name} does not return Pro",
            )
        }
        val entitlementReaders = store.methods.filter { it.calls("Lcom/revenuecat/purchases/EntitlementInfos;") }
        assertTrue(
            planReturns.containsAll(entitlementReaders),
            "PlanDataStore reads the entitlement outside the patched methods: ${entitlementReaders.map { it.name }}",
        )
        if (entitlementReaders.isNotEmpty()) {
            assertTrue(planReturns.size >= 2, "expected the live check and the cache read, found ${planReturns.map { it.name }}")
        }

        // Ads 1: AppConfigModel's constructor stores false as isAdsEnabled (Boolean.FALSE from
        // 5.4.16, a primitive 0 in 5.4.9).
        val appConfig = classes.single { cls ->
            cls.methods.any { m ->
                m.name == "toString" && m.strings().any { it.startsWith("AppConfigModel(") } &&
                    m.strings().contains(", isAdsEnabled=")
            }
        }
        val toString = appConfig.method("toString").instructions()
        val isAdsEnabled = toString
            .drop(toString.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == ", isAdsEnabled=" })
            .first { it.opcode == Opcode.IGET_OBJECT || it.opcode == Opcode.IGET_BOOLEAN }
            .let { (it as ReferenceInstruction).reference as FieldReference }
        val boxed = isAdsEnabled.type == "Ljava/lang/Boolean;"
        val constructors = appConfig.methods.filter { it.name == "<init>" }
        val stores = constructors.flatMap { ctor ->
            val insns = ctor.instructions()
            insns.indices.filter { i ->
                insns[i].opcode == (if (boxed) Opcode.IPUT_OBJECT else Opcode.IPUT_BOOLEAN) &&
                    ((insns[i] as ReferenceInstruction).reference as FieldReference).name == isAdsEnabled.name
            }.map { i -> insns to i }
        }
        assertTrue(stores.isNotEmpty(), "no constructor of ${appConfig.type} stores ${isAdsEnabled.name}")
        stores.forEach { (insns, i) ->
            val forced = insns.getOrNull(i - 1)
            val isFalse = if (boxed) {
                forced?.opcode == Opcode.SGET_OBJECT &&
                    ((forced as ReferenceInstruction).reference as FieldReference).let {
                        it.definingClass == "Ljava/lang/Boolean;" && it.name == "FALSE"
                    }
            } else {
                forced is NarrowLiteralInstruction && forced.narrowLiteral == 0
            }
            assertTrue(
                isFalse && (forced as OneRegisterInstruction).registerA == (insns[i] as TwoRegisterInstruction).registerA,
                "${appConfig.type}.<init> does not store false as isAdsEnabled; found ${forced?.opcode}",
            )
        }

        // Ads 2 (AppLovin MAX, 5.4.16 and older): the load and every showAd overload,
        // including the terminal showAd(String, String, Activity) that displays the ad.
        classes.firstOrNull { it.type == "Lcom/applovin/mediation/ads/MaxInterstitialAd;" }?.let { interstitial ->
            assertReturnsEarlyVoid(interstitial.method("loadAd"), label = "MaxInterstitialAd.loadAd()")
            assertReturnsEarlyVoid(
                interstitial.method(
                    "showAd",
                    listOf("Ljava/lang/String;", "Ljava/lang/String;", "Landroid/app/Activity;"),
                ),
                label = "MaxInterstitialAd.showAd(String, String, Activity)",
            )
        }

        // Ads 3 (Google Mobile Ads, 5.4.17+): when GMA is bundled, its init, every full-screen
        // load and BaseAdView.loadAd return early. Found by the SDK's own messages and shape.
        classes.firstOrNull { it.type == "Lcom/google/android/gms/ads/MobileAds;" }?.let { mobileAds ->
            // R8 inlines initialize: into a static on MobileAds in 5.4.17, into the app's ad init
            // helper in 5.4.18. Every static void carrying the SDK init log returns at once.
            val inits = classes.flatMap { it.methods }.filter {
                AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" && it.implementation != null &&
                    it.strings().any { s -> s.startsWith("Initializing on calling thread") }
            }
            assertTrue(inits.isNotEmpty(), "no inlined MobileAds.initialize found")
            inits.forEach { assertReturnsEarlyVoid(it, label = "${it.definingClass}.${it.name} (MobileAds.initialize)") }
            // Rule 9: every other static void (the private setPlugin, stop) returns at once too.
            assertMobileAdsStaticsNeutralised(mobileAds, required = listOf("setPlugin"))
            // The shared helper's fallback for a renamed MobileAds takes the static-only holder
            // owning that init; on this R8 build it would pick this same class.
            assertTrue(
                mobileAds.superclass == "Ljava/lang/Object;" && mobileAds.interfaces.isEmpty() &&
                    mobileAds.instanceFields.none() &&
                    mobileAds.methods.all { AccessFlags.STATIC.isSet(it.accessFlags) || it.name == "<init>" },
                "MobileAds is not a static-only holder",
            )

            // Every static full-screen load (interstitial, rewarded, rewarded interstitial, app
            // open), found by the SDK's Context and main-thread checks. In 5.4.18 only the
            // interstitial one still checks "AdRequest cannot be null.".
            val fullScreenLoads = classes.flatMap { it.methods }.filter { m ->
                AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" && m.implementation != null &&
                    m.parameterTypes.take(2).map(CharSequence::toString) ==
                    listOf("Landroid/content/Context;", "Ljava/lang/String;") &&
                    m.parameterTypes.size == 4 &&
                    m.strings().containsAll(listOf("Context cannot be null.", "#008 Must be called on the main UI thread."))
            }
            assertTrue(
                fullScreenLoads.any { "AdRequest cannot be null." in it.strings() },
                "no GMA InterstitialAd.load found",
            )
            assertTrue(
                fullScreenLoads.size >= 4,
                "expected the interstitial, rewarded, rewarded interstitial and app open loads, found " +
                    fullScreenLoads.map { "${it.definingClass}.${it.name}" },
            )
            fullScreenLoads.forEach { assertReturnsEarlyVoid(it, label = "${it.definingClass}.${it.name} (GMA load)") }

            val baseAdView = classes.single { cls ->
                AccessFlags.ABSTRACT.isSet(cls.accessFlags) && cls.superclass == "Landroid/view/ViewGroup;" &&
                    cls.methods.any { it.name == "setAdUnitId" }
            }
            val loadAd = baseAdView.methods.single {
                AccessFlags.FINAL.isSet(it.accessFlags) && it.returnType == "V" && it.parameterTypes.size == 1 &&
                    "#008 Must be called on the main UI thread." in it.strings()
            }
            assertReturnsEarlyVoid(loadAd, label = "BaseAdView.loadAd")
        }

        // Telemetry: the AppsFlyer implementation class is R8-renamed every release, so the
        // patch scans by package prefix; every concrete logEvent must be neutered.
        val appsFlyerLogEvent = classes
            .filter { it.type.startsWith("Lcom/appsflyer/") }
            .flatMap { cls -> cls.methods.filter { m -> m.name == "logEvent" && m.implementation != null } }
        assertTrue(appsFlyerLogEvent.isNotEmpty(), "no concrete AppsFlyer logEvent methods found")
        appsFlyerLogEvent.forEach { assertReturnsEarlyVoid(it, label = "${it.definingClass}.logEvent") }

        // Firebase Analytics: FirebaseAnalytics.logEvent is inlined away, so every app event
        // reaches the measurement service logEvent(String, String, Bundle, Z, Z, J). Both the
        // local AppMeasurementDynamiteService and the R8-renamed Binder proxy must be neutered.
        val measurementParams = listOf(
            "Ljava/lang/String;", "Ljava/lang/String;", "Landroid/os/Bundle;", "Z", "Z", "J",
        )
        val measurementLogEvent = classes.flatMap { cls ->
            cls.methods.filter { m ->
                m.name == "logEvent" && m.implementation != null &&
                    m.parameterTypes.map(CharSequence::toString) == measurementParams
            }
        }
        assertTrue(
            measurementLogEvent.any {
                it.definingClass == "Lcom/google/android/gms/measurement/internal/AppMeasurementDynamiteService;"
            },
            "AppMeasurementDynamiteService.logEvent not found; found ${measurementLogEvent.map { it.definingClass }}",
        )
        assertTrue(measurementLogEvent.size >= 2, "expected the local service and the Binder proxy, found ${measurementLogEvent.map { it.definingClass }}")
        measurementLogEvent.forEach { assertReturnsEarlyVoid(it, label = "${it.definingClass}.logEvent (measurement)") }

        assertReturnsEarlyVoid(
            klass("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;")
                .method("recordException", listOf("Ljava/lang/Throwable;")),
            label = "FirebaseCrashlytics.recordException(Throwable)",
        )
    }
}
