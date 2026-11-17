import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "de.motain.iliga"
private const val GMA = "Lcom/google/android/gms/ads/"
private const val COMPONENT_MODEL = "Lcom/onefootball/experience/core/model/ComponentModel;"
private const val ADS_PROTO = "Lcom/onefootball/experience/component/ads/generated/Ads\$"

class OneFootballSmokeTest {

    private fun Instruction.methodRef(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

    // Finds an ad component parser the way the patch's fingerprints do: parse shape
    // (String, I, ComponentModel, protobuf Any) -> ComponentModel plus the call to the generated
    // properties class's parseFrom (still in the body, after the injected return).
    private fun adComponentParse(classes: List<ClassDef>, properties: String): Method {
        val matches = classes.flatMap { it.methods }.filter { method ->
            method.returnType == COMPONENT_MODEL &&
                method.parameterTypes.size == 4 &&
                method.parameterTypes.take(3).map(CharSequence::toString) ==
                listOf("Ljava/lang/String;", "I", COMPONENT_MODEL) &&
                method.parameterTypes[3].startsWith("L") &&
                method.instructions().any {
                    it.methodRef()?.let { ref -> ref.definingClass == ADS_PROTO + properties && ref.name == "parseFrom" } == true
                }
        }
        return matches.singleOrNull() ?: error("expected one parse for $properties, found ${matches.size}")
    }

    /** Asserts `const/4 v0, 0x0` + `return-object v0` at the top. */
    private fun assertReturnsNull(method: Method, label: String) {
        val insns = method.instructions()
        val first = insns.getOrNull(0)
        val second = insns.getOrNull(1)
        assertTrue(
            first?.opcode == Opcode.CONST_4 && (first as NarrowLiteralInstruction).narrowLiteral == 0 &&
                (first as OneRegisterInstruction).registerA == 0 &&
                second?.opcode == Opcode.RETURN_OBJECT && (second as OneRegisterInstruction).registerA == 0,
            "$label does not return null; starts with ${first?.opcode}, ${second?.opcode}"
        )
    }

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Disable ads, Disable telemetry and Hide betting content change the intended code`() {
        val root = repoRoot()
        val apk = File(root, "apks/onefootball/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "15.150.0",
            patchNames = setOf("Disable ads", "Disable telemetry", "Hide betting content"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        fun klass(type: String) = classes.firstOrNull { it.type == type }
            ?: error("$type not found in emitted dexes")

        // Every MobileAds static void (initialize among them, renamed by R8 from 15.150.0) is a
        // no-op, so nothing can throw for lack of init (rule 9: openDebugMenu is reachable from
        // the internal feature-flag screen). The init entry point is the static void taking a
        // Context first.
        val mobileAds = klass(GMA + "MobileAds;")
        assertMobileAdsStaticsNeutralised(mobileAds, required = emptyList())
        val initLike = mobileAds.methods.filter {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" && it.implementation != null &&
                it.parameterTypes.firstOrNull()?.toString() == "Landroid/content/Context;"
        }
        assertTrue(initLike.isNotEmpty(), "MobileAds has no static void taking a Context")

        // Every Flutter google_mobile_ads plugin load reports NO_FILL (shared helper).
        assertTrue(assertFlutterGmaPluginLoadsFail(classes).isNotEmpty(), "no plugin load methods found")

        // Native load entry points found by signature: both banner loads (BaseAdView, which AdView
        // extends, and AdManagerAdView) and every other void taking one request in the SDK package
        // or static (Context, String, request, ...) load are no-ops.
        val requests = setOf(GMA + "AdRequest;", GMA + "admanager/AdManagerAdRequest;")
        val bannerBase = klass(GMA + "AdView;").superclass!!
        for (owner in listOf(bannerBase, GMA + "admanager/AdManagerAdView;")) {
            val loadAd = klass(owner).methods.filter { it.name == "loadAd" && it.returnType == "V" && it.implementation != null }
            assertTrue(loadAd.isNotEmpty(), "$owner has no loadAd")
            loadAd.forEach { assertReturnsEarlyVoid(it, label = "$owner.loadAd") }
        }
        var otherLoads = 0
        var instanceLoadsOutsideBanners = 0 // the AdLoader request loads: the app's own native ad path
        var staticLoads = 0 // the full-screen loads (Interstitial, Rewarded, AppOpen, ...)
        for (classDef in classes) for (method in classDef.methods) {
            if (method.implementation == null || method.returnType != "V" || method.name == "<init>" || method.name == "<clinit>") continue
            val p = method.parameterTypes.map(CharSequence::toString)
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val single = !isStatic && classDef.type.startsWith(GMA) && p.size == 1 && p[0] in requests
            val staticLoad = isStatic && p.size >= 3 && p[0] == "Landroid/content/Context;" &&
                p[1] == "Ljava/lang/String;" && p[2] in requests
            if (single || staticLoad) {
                otherLoads++
                if (staticLoad) staticLoads++
                if (single && classDef.type != bannerBase && classDef.type != GMA + "admanager/AdManagerAdView;") {
                    instanceLoadsOutsideBanners++
                }
                assertReturnsEarlyVoid(method, label = "${classDef.type}->${method.name}(${p.joinToString("")})")
            }
        }
        // 15.150.0 has 11 sites: 2 banner loads, 3 AdLoader-style instance loads, 6 static loads.
        assertTrue(otherLoads >= 3, "expected at least 3 load entry points by signature, found $otherLoads")
        assertTrue(instanceLoadsOutsideBanners >= 1, "no AdLoader-style instance load found outside the banner classes")
        assertTrue(staticLoads >= 5, "expected at least 5 static full-screen loads, found $staticLoads")
        // Both native feed ad component parsers return null, so those ad slots are dropped.
        for (properties in listOf("AdComponentProperties;", "PlaceholderAdComponentProperties;")) {
            val parse = adComponentParse(classes, properties)
            assertReturnsNull(parse, label = "${parse.definingClass}->parse ($properties)")
        }

        // The Flutter ad bridge handlers reply "Ad Blocked" before their own code: the injected
        // block (name check, Result.error, return-void) comes before the original method-name
        // comparison. Found the way the fingerprints find them: handle(MethodCall, Result)V
        // holding the channel method name.
        val bridgeParams = listOf("Lio/flutter/plugin/common/MethodCall;", "Lio/flutter/plugin/common/MethodChannel\$Result;")
        for (channelMethod in listOf("getAdData", "getOMPAdData")) {
            val handle = classes.flatMap { it.methods }.single { method ->
                method.returnType == "V" &&
                    method.parameterTypes.map(CharSequence::toString) == bridgeParams &&
                    method.instructions().any { (it as? ReferenceInstruction)?.reference?.toString() == channelMethod }
            }
            val insns = handle.instructions()
            val error = insns.indexOfFirst {
                it.methodRef()?.let { ref -> ref.name == "error" && ref.definingClass == bridgeParams[1] } == true
            }
            val blocked = insns.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == "Ad Blocked" }
            val firstReturn = insns.indexOfFirst { it.opcode == Opcode.RETURN_VOID }
            val equals = insns.indexOfFirst { it.methodRef()?.let { ref -> ref.definingClass == "Ljava/lang/String;" && ref.name == "equals" } == true }
            assertTrue(
                insns.first().opcode == Opcode.CONST_STRING && equals in 0 until blocked &&
                    blocked in 0 until error && error < firstReturn && firstReturn <= 10,
                "$channelMethod handler does not reply \"Ad Blocked\" first " +
                    "(equals=$equals, blocked=$blocked, error=$error, return=$firstReturn)"
            )
        }

        assertTelemetry(classes)
        assertBetting(classes)
    }

    private fun Instruction.ref(): Any? = (this as? ReferenceInstruction)?.reference

    private fun Instruction.refString(): String? = ref()?.toString()

    private fun Method.referencesString(value: String) = instructions().any { it.refString() == value }

    private fun Method.params() = parameterTypes.map(CharSequence::toString)

    /** True when the instruction is `sget-object <reg>, Ljava/lang/Boolean;-><field>`. */
    private fun Instruction.isBooleanField(field: String) =
        opcode == Opcode.SGET_OBJECT && refString() == "Ljava/lang/Boolean;->$field:Ljava/lang/Boolean;"

    private fun assertTelemetry(classes: List<ClassDef>) {
        val byType = classes.associateBy { it.type }
        fun klass(type: String) = byType[type] ?: error("$type not found in emitted dexes")
        val allMethods = classes.flatMap { it.methods }

        // 1. The tracking opt-out reads true (const/4 + return, found by class and name).
        assertForcedBoolean(
            klass("Lcom/onefootball/repository/preferences/PreferencesImpl;").method("isTrackingOptedOut", emptyList()),
            expected = true,
            label = "PreferencesImpl.isTrackingOptedOut",
        )

        // 2. Adjust: the sending statics return at once, the listener-taking ones keep their bodies,
        // and initSdk starts by calling Adjust.disable().
        val adjust = klass("Lcom/adjust/sdk/Adjust;")
        val adjustNoOps = mapOf(
            "trackEvent" to listOf("Lcom/adjust/sdk/AdjustEvent;"),
            "trackAdRevenue" to listOf("Lcom/adjust/sdk/AdjustAdRevenue;"),
            "trackPlayStoreSubscription" to listOf("Lcom/adjust/sdk/AdjustPlayStoreSubscription;"),
            "trackThirdPartySharing" to listOf("Lcom/adjust/sdk/AdjustThirdPartySharing;"),
            "trackMeasurementConsent" to listOf("Z"),
            "onResume" to emptyList(),
            "onPause" to emptyList(),
            "setPushToken" to listOf("Ljava/lang/String;", "Landroid/content/Context;"),
            "setReferrer" to listOf("Ljava/lang/String;", "Landroid/content/Context;"),
            "processDeeplink" to listOf("Lcom/adjust/sdk/AdjustDeeplink;", "Landroid/content/Context;"),
            "enable" to emptyList(),
        )
        for ((name, parameters) in adjustNoOps) {
            assertReturnsEarlyVoid(adjust.method(name, parameters), label = "Adjust.$name")
        }
        val initSdk = adjust.method("initSdk", listOf("Lcom/adjust/sdk/AdjustConfig;")).instructions()
        assertTrue(
            initSdk.first().opcode == Opcode.INVOKE_STATIC &&
                initSdk.first().refString() == "Lcom/adjust/sdk/Adjust;->disable()V" &&
                initSdk.any { it.refString()?.startsWith("Lcom/adjust/sdk/AdjustInstance;->initSdk") == true },
            "Adjust.initSdk does not call disable() before the stock body",
        )
        for ((name, parameters) in listOf(
            "getAdid" to listOf("Lcom/adjust/sdk/OnAdidReadListener;"),
            "getAttribution" to listOf("Lcom/adjust/sdk/OnAttributionReadListener;"),
            "isEnabled" to listOf("Landroid/content/Context;", "Lcom/adjust/sdk/OnIsEnabledListener;"),
        )) {
            assertTrue(
                adjust.method(name, parameters).instructions().first().opcode != Opcode.RETURN_VOID,
                "Adjust.$name (callback path) was neutered",
            )
        }

        // 3. comScore Analytics.start(Context) returns at once.
        assertReturnsEarlyVoid(
            klass("Lcom/comscore/Analytics;").method("start", listOf("Landroid/content/Context;")),
            label = "comScore Analytics.start",
        )

        // 4. Firebase switches. Analytics: every read of the deactivated flag is followed by a
        // Boolean.TRUE overwrite and every adid read by Boolean.FALSE; Crashlytics: the arbiter's
        // synchronized getter returns false; Sessions and Performance: Boolean.FALSE first.
        for ((key, field) in listOf(
            "firebase_analytics_collection_deactivated" to "TRUE",
            "google_analytics_adid_collection_enabled" to "FALSE",
        )) {
            val readers = allMethods.filter { it.referencesString(key) }
            assertTrue(readers.isNotEmpty(), "no reader of $key found")
            for (reader in readers) {
                val insns = reader.instructions()
                val at = insns.indexOfFirst { it.refString() == key }
                val forced = insns.drop(at).any { it.isBooleanField(field) }
                assertTrue(forced, "${reader.definingClass}->${reader.name} does not overwrite $key with Boolean.$field")
            }
        }
        val crashlytics = allMethods.filter { it.referencesString("firebase_crashlytics_collection_enabled") }
            .map { it.definingClass }.distinct()
            .flatMap { klass(it).methods }
            .filter {
                AccessFlags.DECLARED_SYNCHRONIZED.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) &&
                    it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null
            }
        assertTrue(crashlytics.size == 1, "expected one Crashlytics collection getter, found ${crashlytics.size}")
        assertForcedBoolean(crashlytics.single(), expected = false, label = "Crashlytics data collection getter")
        val sessions = allMethods.filter {
            it.returnType == "Ljava/lang/Boolean;" && it.parameterTypes.isEmpty() && it.referencesString("firebase_sessions_enabled")
        }
        assertTrue(sessions.size == 1, "expected one Sessions override, found ${sessions.size}")
        assertTrue(sessions.single().instructions().first().isBooleanField("FALSE"), "Sessions override does not return Boolean.FALSE")
        val flagTypes = listOf("firebase_performance_collection_deactivated", "firebase_performance_collection_enabled").map { key ->
            allMethods.single { m ->
                m.returnType == "Ljava/lang/String;" && m.parameterTypes.isEmpty() && m.instructions().let {
                    it.size == 2 && it[0].refString() == key
                }
            }.definingClass
        }
        val performance = allMethods.filter { m ->
            m.returnType == "Ljava/lang/Boolean;" && m.parameterTypes.isEmpty() &&
                flagTypes.all { type -> m.instructions().any { it.refString()?.contains(type) == true } }
        }
        assertTrue(performance.size == 1, "expected one Performance collection reader, found ${performance.size}")
        assertTrue(performance.single().instructions().first().isBooleanField("FALSE"), "Performance reader does not return Boolean.FALSE")

        // 5. The Flutter tracking handlers reply success(Integer 0) on their own method name before
        // the stock body, and still chain: the stock getNext().handle(...) call is intact.
        val bridgeParams = listOf("Lio/flutter/plugin/common/MethodCall;", "Lio/flutter/plugin/common/MethodChannel\$Result;")
        for ((handlerClass, channelMethod) in listOf(
            "LogEventMethodHandler" to "logEvent",
            "TrackXpaEventMethodHandler" to "trackXpaEvent",
            "TrackMatchesStreamFilterEventMethodHandler" to "trackMatchesStreamFilterEvent",
        )) {
            val type = "Lcom/onefootball/core/flutter/methodhandlers/$handlerClass;"
            val handle = klass(type).method("handle", bridgeParams)
            val insns = handle.instructions()
            val named = insns.indexOfFirst { it.opcode == Opcode.CONST_STRING && it.refString() == channelMethod }
            val equals = insns.indexOfFirst { it.methodRefOrNull()?.let { r -> r.definingClass == "Ljava/lang/String;" && r.name == "equals" } == true }
            val valueOf = insns.indexOfFirst { it.methodRefOrNull()?.let { r -> r.definingClass == "Ljava/lang/Integer;" && r.name == "valueOf" } == true }
            val success = insns.indexOfFirst { it.methodRefOrNull()?.let { r -> r.definingClass == bridgeParams[1] && r.name == "success" } == true }
            val firstReturn = insns.indexOfFirst { it.opcode == Opcode.RETURN_VOID }
            assertTrue(
                named == 0 && equals in 1 until valueOf && valueOf in 1 until success && success < firstReturn && firstReturn <= 12,
                "$handlerClass does not reply success(0) first (named=$named, equals=$equals, valueOf=$valueOf, success=$success, return=$firstReturn)",
            )
            assertTrue(
                insns.any { it.methodRefOrNull()?.let { r -> r.name == "getNext" && r.definingClass == type } == true } &&
                    insns.any { it.methodRefOrNull()?.let { r -> r.definingClass == "Lcom/onefootball/core/flutter/methodhandlers/MethodHandler;" && r.name == "handle" } == true },
                "$handlerClass no longer chains to getNext().handle",
            )
        }

        // 6. Facebook App Events: logEvent (shape plus the kill-switch string) and the App Events enqueue.
        val facebookLog = allMethods.filter {
            it.returnType == "V" && it.referencesString("app_events_killswitch") &&
                it.params() == listOf("Ljava/lang/String;", "Ljava/lang/Double;", "Landroid/os/Bundle;", "Z", "Ljava/util/UUID;")
        }
        assertTrue(facebookLog.size == 1, "expected one Facebook logEvent, found ${facebookLog.size}")
        assertReturnsEarlyVoid(facebookLog.single(), label = "Facebook logEvent")
        val enqueue = allMethods.filter {
            it.returnType == "V" && it.referencesString("fb_mobile_activate_app") && it.params().size == 2 &&
                it.params().all { p -> p.startsWith("L") }
        }
        assertTrue(enqueue.size == 1, "expected one Facebook App Events enqueue, found ${enqueue.size}")
        assertReturnsEarlyVoid(enqueue.single(), label = "Facebook App Events enqueue")
    }

    private fun Instruction.methodRefOrNull() = methodRef()

    private fun assertBetting(classes: List<ClassDef>) {
        val byType = classes.associateBy { it.type }
        fun klass(type: String) = byType[type] ?: error("$type not found in emitted dexes")

        // The registry's key lookup (Flutter) answers "false" for both betting flags first and keeps
        // the stock switch body behind the :stock label.
        val lookup = klass("Lcom/onefootball/opt/featureflag/generated/AllRemoteFeatureFlags;")
            .method("getFeatureFlagValueByFeatureFlagKeyAsString", listOf("Ljava/lang/String;")).instructions()
        val strings = lookup.take(14).mapNotNull { if (it.opcode == Opcode.CONST_STRING) it.refString() else null }
        assertTrue(
            strings == listOf("betting_card_enabled", "legacy_betting_card_enabled", "false"),
            "key lookup does not start with the betting flag check: $strings",
        )
        assertTrue(
            lookup.take(14).any { it.opcode == Opcode.RETURN_OBJECT } &&
                lookup.any { it.methodRef()?.name == "hashCode" },
            "key lookup lost its return or its stock body",
        )

        // The native flags all read through AbstractFeatureFlag.getValue(); it answers
        // Boolean.FALSE for betting_card_enabled and "false" for the legacy key, then the stock body.
        val getValue = klass("Lcom/onefootball/opt/featureflag/AbstractFeatureFlag;").method("getValue", emptyList()).instructions()
        val head = getValue.take(16)
        assertTrue(
            head.first().methodRef()?.name == "getKey" &&
                head.mapNotNull { if (it.opcode == Opcode.CONST_STRING) it.refString() else null } ==
                listOf("betting_card_enabled", "legacy_betting_card_enabled", "false") &&
                head.any { it.isBooleanField("FALSE") } && head.count { it.opcode == Opcode.RETURN_OBJECT } == 2,
            "AbstractFeatureFlag.getValue does not force the betting flags first",
        )
        assertTrue(
            getValue.any { it.methodRef()?.name == "invoke" },
            "AbstractFeatureFlag.getValue lost its stock body",
        )
    }
}
