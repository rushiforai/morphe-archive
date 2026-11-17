import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.livescore"

private const val SELF_RESTRICTED = "Lcom/livescore/odds/self_restricted/UserSelfRestrictedHelperImpl;"
private const val ANALYTICS = "Lcom/livescore/analytics/"
private const val APPSFLYER_LIB = "Lcom/appsflyer/AppsFlyerLib;"
private const val CLARITY = "Lcom/microsoft/clarity/Clarity;"

private val EXEMPT_KEYS = listOf(
    "lsm_vote_widget", "global_navigation", "global_shocks", "event_shocks",
    "live_section_shocks", "shocks_notifications", "ls6",
)

private fun Method.strings(): List<String> =
    instructions().mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }

private fun Method.params(): List<String> = parameterTypes.map(CharSequence::toString)

class LivescoreSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Hide betting content, Disable telemetry and Disable ads change the targets`() {
        val root = repoRoot()
        val apk = File(root, "apks/livescore/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "10.4.1",
            patchNames = setOf("Disable ads", "Hide betting content", "Disable telemetry"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }
        fun cls(type: String): ClassDef = byType[type] ?: error("$type not found in emitted dexes")

        // ---- Disable ads ----
        assertForcedBoolean(
            cls("Lcom/livescore/ads/config/AdsRemovalSettings;").method("areAdsDisabled"),
            expected = true,
            label = "AdsRemovalSettings.areAdsDisabled()",
        )
        val gma = "Lcom/google/android/gms/ads/"
        assertAllReturnEarly(classes, "${gma}BaseAdView;", "loadAd")
        assertAllReturnEarly(classes, "${gma}admanager/AdManagerAdView;", "loadAd")
        assertAllReturnEarly(classes, "${gma}AdLoader;", "loadAd", "loadAds")
        assertAllReturnEarly(classes, "${gma}interstitial/InterstitialAd;", "load")
        assertAllReturnEarly(classes, "${gma}admanager/AdManagerInterstitialAd;", "load")
        assertAllReturnEarly(classes, "${gma}rewarded/RewardedAd;", "load")
        assertAllReturnEarly(classes, "${gma}rewardedinterstitial/RewardedInterstitialAd;", "load")
        assertAllReturnEarly(classes, "${gma}appopen/AppOpenAd;", "load")
        // MobileAds.initialize stays (rule 9 does not apply).
        val initialize = cls("${gma}MobileAds;").method("initialize")
        assertTrue(
            initialize.instructions().firstOrNull()?.opcode != Opcode.RETURN_VOID,
            "MobileAds.initialize must be left alone",
        )
        assertAllReturnEarly(classes, "Lcom/blaze/ima/BlazeIMA;", "enableAds")
        assertAllReturnEarly(classes, "Lcom/blaze/gam/BlazeGAM;", "enableCustomNativeAds")
        assertEquals(
            2,
            cls("Lcom/blaze/ima/BlazeIMA;").methods.count { it.name == "enableAds" && it.implementation != null },
            "BlazeIMA.enableAds overloads",
        )
        assertEquals(
            3,
            cls("Lcom/blaze/gam/BlazeGAM;").methods.count { it.name == "enableCustomNativeAds" && it.implementation != null },
            "BlazeGAM.enableCustomNativeAds overloads",
        )

        // ---- Hide betting content ----
        val restricted = cls(SELF_RESTRICTED)
        val gate = restricted.method("isUserBettingSelfRestrictionPassed", listOf("Ljava/lang/String;"))
        val gateInsns = gate.instructions()
        val equalsCall = "Ljava/lang/String;->equals(Ljava/lang/Object;)Z"
        // Cumulative code-unit address of every instruction, to resolve the branch targets.
        val addresses = gateInsns.runningFold(0) { at, insn -> at + insn.codeUnits }
        val stockStart = EXEMPT_KEYS.size * 4 + 2
        EXEMPT_KEYS.forEachIndexed { i, key ->
            val base = i * 4
            assertEquals(
                key,
                ((gateInsns[base] as ReferenceInstruction).reference as StringReference).string,
                "gate check $i string",
            )
            assertEquals(
                equalsCall,
                ((gateInsns[base + 1] as ReferenceInstruction).reference as MethodReference).let {
                    "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}"
                },
                "gate check $i call",
            )
            assertEquals(Opcode.MOVE_RESULT, gateInsns[base + 2].opcode, "gate check $i result")
            val branch = gateInsns[base + 3]
            assertEquals(Opcode.IF_NEZ, branch.opcode, "gate check $i branch")
            assertEquals(
                addresses[stockStart],
                addresses[base + 3] + (branch as OffsetInstruction).codeOffset,
                "exempt key $key must fall through to the stock body",
            )
        }
        val hidden = gateInsns[EXEMPT_KEYS.size * 4]
        assertTrue(
            hidden is NarrowLiteralInstruction && hidden.opcode == Opcode.CONST_4 && hidden.narrowLiteral == 0 &&
                gateInsns[stockStart - 1].opcode == Opcode.RETURN &&
                (gateInsns[stockStart - 1] as OneRegisterInstruction).registerA == (hidden as OneRegisterInstruction).registerA,
            "any other key must return false",
        )
        val stockFirst = (gateInsns[stockStart] as ReferenceInstruction).reference as MethodReference
        assertEquals("getClass", stockFirst.name, "the stock body (p1.getClass()) must follow the injection")
        assertForcedBoolean(restricted.method("isAdultAndNotSelfRestricted"), expected = false, label = "isAdultAndNotSelfRestricted()")
        assertForcedBoolean(restricted.method("getBettingAdsHidden"), expected = true, label = "getBettingAdsHidden()")
        // Left alone: the user's odds toggles and the override.
        assertTrue(
            restricted.method("getEnabledOverride").instructions().firstOrNull()?.opcode != Opcode.CONST_4,
            "getEnabledOverride must be left alone",
        )

        // ---- Disable telemetry ----
        // 1. Funnel.
        val universal = cls("${ANALYTICS}UniversalAnalyticsImpl;")
        assertReturnsEarlyVoid(universal.method("track", listOf("${ANALYTICS}UniversalEvent;")), "UniversalAnalyticsImpl.track")
        assertReturnsEarlyVoid(
            universal.method("trackDeeplink", listOf("Landroid/content/Intent;", "Landroid/net/Uri;")),
            "UniversalAnalyticsImpl.trackDeeplink",
        )
        assertReturnsEarlyVoid(universal.method("trackMSClarityEvent", listOf("Ljava/lang/String;")), "UniversalAnalyticsImpl.trackMSClarityEvent")
        assertReturnsEarlyVoid(universal.method("trackScreen", listOf("${ANALYTICS}ScreenTrackData;")), "UniversalAnalyticsImpl.trackScreen")
        for (prefix in listOf("fireScreenViewEvent-", "updateIdentify-")) {
            val methods = universal.methods.filter { it.name.startsWith(prefix) }
            assertTrue(methods.isNotEmpty(), "no $prefix* method")
            methods.forEach { assertReturnsEarlyVoid(it, "UniversalAnalyticsImpl.${it.name}") }
        }
        // enableAnalytics hands the Segment anonymous id to push, so it keeps its body.
        assertTrue(
            universal.methods.filter { it.name == "enableAnalytics" }.all {
                it.instructions().firstOrNull()?.opcode != Opcode.RETURN_VOID
            },
            "UniversalAnalyticsImpl.enableAnalytics must be left alone",
        )

        // 2. SDK enables: the boolean arguments are false before the stock body.
        fun assertArgsForcedFalse(type: String, name: String, parameters: List<String>) {
            val method = cls(type).method(name, parameters)
            val insns = method.instructions()
            val first = method.implementation!!.registerCount - parameters.size
            parameters.indices.forEach { i ->
                val insn = insns[i]
                assertTrue(
                    insn is NarrowLiteralInstruction && insn.opcode == Opcode.CONST_4 && insn.narrowLiteral == 0 &&
                        (insn as OneRegisterInstruction).registerA == first + i,
                    "$type->$name argument ${i + 1} is not forced false; instruction $i is ${insn.opcode}",
                )
            }
            assertTrue(insns.size > parameters.size, "$type->$name lost its stock body")
        }
        assertArgsForcedFalse("${ANALYTICS}FirebaseAnalyticsImpl;", "enable", listOf("Z"))
        assertArgsForcedFalse("${ANALYTICS}SegmentAnalytics;", "enable", listOf("Z", "Z"))
        assertArgsForcedFalse("${ANALYTICS}AmplitudeAnalytics;", "enableAnalytics", listOf("Z", "Z"))
        assertArgsForcedFalse("${ANALYTICS}permutive/PermutiveAnalytics;", "enable", listOf("Z"))

        // 3. Firebase switches, found by the same library strings the patch uses.
        val allMethods = classes.flatMap { c -> c.methods.map { c to it } }
        val analyticsDeactivated = allMethods.filter { (_, m) -> "firebase_analytics_collection_deactivated" in m.strings() }
        assertTrue(analyticsDeactivated.isNotEmpty(), "no firebase_analytics_collection_deactivated reader")
        analyticsDeactivated.forEach { (_, m) ->
            assertTrue(
                m.instructions().any {
                    val field = (it as? ReferenceInstruction)?.reference as? FieldReference
                    it.opcode == Opcode.SGET_OBJECT && field?.definingClass == "Ljava/lang/Boolean;" && field.name == "TRUE"
                },
                "${m.definingClass}->${m.name} does not force Boolean.TRUE for the deactivated flag",
            )
        }
        val crashlyticsLog = allMethods.filter { (_, m) -> m.strings().any { it.startsWith("Crashlytics automatic data collection ") } }
        val arbiterClasses = crashlyticsLog.map { it.first }.distinctBy { it.type }
        assertTrue(arbiterClasses.isNotEmpty(), "no Crashlytics arbiter class")
        val getters = arbiterClasses.flatMap { c ->
            c.methods.filter {
                AccessFlags.DECLARED_SYNCHRONIZED.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) &&
                    it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null
            }
        }
        assertEquals(1, getters.size, "Crashlytics collection getters")
        assertForcedBoolean(getters.single(), expected = false, label = "Crashlytics isAutomaticDataCollectionEnabled")
        fun assertReturnsBooleanFalseObject(method: Method, label: String) {
            val insns = method.instructions()
            val field = (insns.getOrNull(0) as? ReferenceInstruction)?.reference as? FieldReference
            assertTrue(
                insns.getOrNull(0)?.opcode == Opcode.SGET_OBJECT && field?.definingClass == "Ljava/lang/Boolean;" &&
                    field.name == "FALSE" && insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT &&
                    (insns[1] as OneRegisterInstruction).registerA == (insns[0] as OneRegisterInstruction).registerA,
                "$label does not return Boolean.FALSE first",
            )
        }
        val sessions = allMethods.filter { (_, m) ->
            m.returnType == "Ljava/lang/Boolean;" && m.parameterTypes.isEmpty() && "firebase_sessions_enabled" in m.strings()
        }
        assertEquals(1, sessions.size, "Firebase Sessions override readers")
        assertReturnsBooleanFalseObject(sessions.single().second, "Firebase Sessions override")
        // Performance: the reader that references both flag classes (deactivated and enabled).
        fun flagClass(key: String) = allMethods.single { (_, m) ->
            m.returnType == "Ljava/lang/String;" && m.parameterTypes.isEmpty() && m.instructions().size == 2 &&
                m.strings().singleOrNull() == key
        }.first.type
        val deactivatedFlag = flagClass("firebase_performance_collection_deactivated")
        val enabledFlag = flagClass("firebase_performance_collection_enabled")
        fun Method.references(type: String) = instructions().any {
            val ref = (it as? ReferenceInstruction)?.reference
            (ref is MethodReference && ref.definingClass == type) || (ref is FieldReference && ref.definingClass == type)
        }
        val perfReaders = allMethods.filter { (_, m) ->
            m.returnType == "Ljava/lang/Boolean;" && m.parameterTypes.isEmpty() &&
                m.references(deactivatedFlag) && m.references(enabledFlag)
        }
        assertEquals(1, perfReaders.size, "Performance collection readers")
        assertReturnsBooleanFalseObject(perfReaders.single().second, "Firebase Performance reader")

        // 4. AppsFlyer: every concrete method on the subclass(es).
        val appsFlyerImpls = classes.filter { it.superclass == APPSFLYER_LIB }
        assertTrue(appsFlyerImpls.isNotEmpty(), "no AppsFlyerLib implementation")
        val appsFlyerNames = setOf("start", "logEvent", "logSession", "sendAdRevenue", "sendAdImpression")
        val appsFlyerTargets = appsFlyerImpls.flatMap { c ->
            c.methods.filter { it.name in appsFlyerNames && it.returnType == "V" && it.implementation != null }
        }
        assertTrue(appsFlyerTargets.any { it.name == "start" }, "AppsFlyer start not found")
        assertTrue(appsFlyerTargets.any { it.name == "logEvent" }, "AppsFlyer logEvent not found")
        appsFlyerTargets.forEach { assertReturnsEarlyVoid(it, "AppsFlyer ${it.definingClass}->${it.name}") }

        // 5. Microsoft Clarity.
        val clarity = cls(CLARITY)
        val booleanObjectNames = listOf(
            "initialize", "resume", "consent", "startNewSession", "setCustomUserId",
            "setCustomSessionId", "setCurrentScreenName", "setOnSessionStartedCallback",
        )
        for (name in booleanObjectNames) {
            val methods = clarity.methods.filter { it.name == name && it.returnType == "Ljava/lang/Boolean;" }
            assertTrue(methods.isNotEmpty(), "Clarity.$name not found")
            methods.forEach { assertReturnsBooleanFalseObject(it, "Clarity.$name(${it.params().joinToString()})") }
        }
        assertEquals(2, clarity.methods.count { it.name == "initialize" }, "Clarity.initialize overloads")
        for (name in listOf("sendCustomEvent", "setCustomTag")) {
            val methods = clarity.methods.filter { it.name == name && it.returnType == "Z" }
            assertTrue(methods.isNotEmpty(), "Clarity.$name not found")
            methods.forEach { assertForcedBoolean(it, expected = false, label = "Clarity.$name") }
        }
    }
}
