import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.mail.mobile.android.mail"
private const val STRING = "Ljava/lang/String;"
private const val SENTRY_ANDROID = "Lio/sentry/android/core/SentryAndroid;"

private val AD_SWITCHES = listOf(
    "isAdEnabled",
    "isGoogleInboxAdEnabled",
    "isGoogleBannerEnabled",
    "isHtmlBannerEnabled",
    "isEndlessIbaEnabled",
    "isMetaNativeIBAsEnabled",
    "isMetaNativeBannerEnabled",
    "isAdsInCustomFoldersEnabled",
    "isId5Enabled",
)

class MailcomSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.methodRef(): MethodReference? =
        (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun Instruction.fieldRef(): FieldReference? =
        (this as? ReferenceInstruction)?.reference as? FieldReference

    private fun Method.strings(): List<String> = instructions().mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    }

    private fun Method.calls(predicate: (MethodReference) -> Boolean): Boolean =
        instructions().any { insn -> insn.methodRef()?.let(predicate) == true }

    private fun List<ClassDef>.methods(): List<Pair<ClassDef, Method>> =
        flatMap { classDef -> classDef.methods.map { classDef to it } }

    /** The class whose no-arg toString() starts with [prefix] (as the patches find them). */
    private fun List<ClassDef>.byToString(prefix: String): ClassDef {
        val found = filter { classDef ->
            classDef.methods.any { method ->
                method.name == "toString" && method.parameterTypes.isEmpty() &&
                    method.returnType == STRING && method.strings().any { it.startsWith(prefix) }
            }
        }
        return found.singleOrNull() ?: error("expected one class with toString \"$prefix\", found ${found.map { it.type }}")
    }

    /** The single concrete no-arg boolean getter [name] of this class. */
    private fun ClassDef.getter(name: String): Method {
        val found = methods.filter {
            it.name == name && it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null
        }
        return found.singleOrNull() ?: error("$type: expected one concrete $name()Z, found ${found.size}")
    }

    /** The single concrete [name]()Z whose body calls the no-arg [callee] (as the patches find them). */
    private fun List<Pair<ClassDef, Method>>.byCall(
        name: String,
        callee: String,
        calleeReturns: String = "Z",
    ): Pair<ClassDef, Method> {
        val found = filter { (_, method) ->
            method.name == name && method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                method.implementation != null &&
                method.calls { it.name == callee && it.returnType == calleeReturns && it.parameterTypes.isEmpty() }
        }
        return found.singleOrNull() ?: error("expected one $name()Z calling $callee, found ${found.map { it.first.type }}")
    }

    private fun Method.isForcedFalse(): Boolean {
        val insns = instructions()
        val first = insns.getOrNull(0)
        return first is NarrowLiteralInstruction && first.opcode == Opcode.CONST_4 &&
            first.narrowLiteral == 0 && insns.getOrNull(1)?.opcode == Opcode.RETURN
    }

    @Test
    fun `Disable ads, Disable telemetry, Disable rating prompts and Hide upsells force their gates off`() {
        val root = repoRoot()
        val apk = File(root, "apks/mailcom/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "9.19.0",
            patchNames = setOf("Disable ads", "Disable telemetry", "Disable rating prompts", "Hide upsells"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val allMethods = classes.methods()

        // Disable ads 1: every ad switch of AdvertisingIdentityConfig answers false; the inverted
        // isUnifiedInboxAdsEnabled keeps its field read.
        val adConfig = classes.byToString("AdvertisingIdentityConfig(isId5Enabled=")
        for (name in AD_SWITCHES) {
            assertForcedBoolean(adConfig.getter(name), expected = false, label = "AdvertisingIdentityConfig.$name")
        }
        val unified = adConfig.getter("isUnifiedInboxAdsEnabled")
        assertEquals(
            Opcode.IGET_BOOLEAN, unified.instructions().firstOrNull()?.opcode,
            "AdvertisingIdentityConfig.isUnifiedInboxAdsEnabled must stay untouched",
        )

        // Disable ads 2: interstitials.
        assertForcedBoolean(
            classes.byToString("InterstitialAdConfig(isEnabled=").getter("isEnabled"),
            expected = false, label = "InterstitialAdConfig.isEnabled",
        )

        // Disable ads 3: the ad pixel sender returns at once (its body is still there behind it).
        val adTrackerSends = allMethods.filter { (_, method) ->
            val strings = method.strings()
            method.returnType == "V" && method.parameterTypes.map(CharSequence::toString) == listOf(STRING) &&
                strings.any { it.startsWith("AdTracker: url is null or invalid") } &&
                strings.any { it.startsWith("AdTracker failed") }
        }
        val (_, adTrackerSend) = adTrackerSends.singleOrNull()
            ?: error("expected one AdTracker.send, found ${adTrackerSends.map { it.first.type }}")
        assertReturnsEarlyVoid(adTrackerSend, label = "AdTracker.send(String)")

        // Disable telemetry 1 and 3: Tracking2 and app monitoring.
        assertForcedBoolean(
            classes.byToString("Tracking2Config(batchSize=").getter("isTracking2Enabled"),
            expected = false, label = "Tracking2Config.isTracking2Enabled",
        )
        assertForcedBoolean(
            classes.byToString("AppMonConfig(isAppMonEnabled=").getter("isAppMonEnabled"),
            expected = false, label = "AppMonConfig.isAppMonEnabled",
        )

        // Disable telemetry 2: TrackingPermissions(ZZZZZ) zeroes exactly the registers that the
        // Brain, Reach and Trop iput-booleans store; Toast and advertisement keep their arguments.
        val permissions = classes.byToString("TrackingPermissions(isBrainTrackingAllowed=")
        val constructor = permissions.methods.single {
            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == List(5) { "Z" }
        }
        val insns = constructor.instructions()
        fun storeRegister(field: String): Int = insns.single {
            it.opcode == Opcode.IPUT_BOOLEAN &&
                it.fieldRef()?.let { ref -> ref.definingClass == permissions.type && ref.name == field } == true
        }.let { (it as TwoRegisterInstruction).registerA }
        val denied = listOf("isBrainTrackingAllowed", "isReachTrackingAllowed", "isTropTrackingAllowed").map(::storeRegister)
        val kept = listOf("isToastTrackingAllowed", "isAdvertisementAllowed").map(::storeRegister)
        val prologue = insns.take(3)
        assertTrue(
            prologue.all {
                it is NarrowLiteralInstruction && it.narrowLiteral == 0 &&
                    (it.opcode == Opcode.CONST_4 || it.opcode == Opcode.CONST_16)
            },
            "TrackingPermissions.<init> does not start with three zero constants: ${prologue.map { it.opcode }}",
        )
        assertEquals(
            denied.toSet(), prologue.map { (it as OneRegisterInstruction).registerA }.toSet(),
            "TrackingPermissions.<init> zeroes the wrong registers (Brain/Reach/Trop are stored from $denied)",
        )
        assertTrue(kept.none { it in denied }, "Toast/advertisement share a register with a forced flag")
        val p0 = constructor.implementation!!.registerCount - 6
        assertEquals(listOf(p0 + 1, p0 + 2, p0 + 3), denied, "Brain/Reach/Trop are no longer p1..p3")

        // Disable telemetry 4: Sentry is never started.
        val sentryStarts = allMethods.filter { (classDef, method) ->
            method.returnType == "V" && method.parameterTypes.size == 1 && method.implementation != null &&
                !AccessFlags.STATIC.isSet(method.accessFlags) && !classDef.type.startsWith("Lio/sentry/") &&
                method.calls { it.definingClass == SENTRY_ANDROID && it.name == "init" }
        }
        val (sentryClass, sentryStart) = sentryStarts.singleOrNull()
            ?: error("expected one SentryAPI.start, found ${sentryStarts.map { it.first.type }}")
        assertReturnsEarlyVoid(sentryStart, label = "SentryAPI.start (${sentryClass.type})")

        // Disable rating prompts: the review gate answers false.
        val (_, canRequestReview) = allMethods.byCall("canRequestInAppReviewFlow", "getCurrentTimeMillis", calleeReturns = "J")
        assertForcedBoolean(canRequestReview, expected = false, label = "InAppRatingManager.canRequestInAppReviewFlow")

        // Hide upsells: the swipe-to-upsell toggle answers false; the IAP upselling check (Settings
        // "Upgrade", drawer Premium) is untouched. 9.19.0 replaced the IapUpsellingFeature toggle
        // with the per-account suspend check UpsellFeatureImpl.isIapUpsellEnabled(Account, Continuation).
        val (_, swipe2Upsell) = allMethods.byCall("isEnabledByConfig", "isSwipe2UpsellEnabled")
        assertForcedBoolean(swipe2Upsell, expected = false, label = "Swipe2UpsellFeature.isEnabledByConfig")
        val iapUpsell = allMethods.filter { (_, method) ->
            method.name == "isIapUpsellEnabled" && method.implementation != null &&
                method.parameterTypes.lastOrNull()?.toString() == "Lkotlin/coroutines/Continuation;"
        }
        assertTrue(iapUpsell.isNotEmpty(), "IAP upsell check isIapUpsellEnabled(..., Continuation) not found")
        iapUpsell.forEach { (classDef, method) ->
            val returns = setOf(Opcode.RETURN, Opcode.RETURN_OBJECT, Opcode.RETURN_VOID)
            assertTrue(
                method.instructions().take(2).none { it.opcode in returns },
                "${classDef.type}.isIapUpsellEnabled must stay untouched",
            )
        }
    }
}
