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
            version = "9.21.2",
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

        // Disable ads 3: the ad pixel sender (CommonTracker.trackCustomUrl since 9.21.2, a suspend
        // method returning Unit) returns Unit.INSTANCE at once (its body is still there behind it).
        val adTrackerSends = allMethods.filter { (_, method) ->
            val strings = method.strings()
            method.returnType == "Ljava/lang/Object;" && method.parameterTypes.size == 2 &&
                method.parameterTypes[0].toString() == STRING &&
                strings.any { it.startsWith("AdTracker: url is null or invalid") } &&
                strings.any { it.startsWith("AdTracker failed") }
        }
        val (_, adTrackerSend) = adTrackerSends.singleOrNull()
            ?: error("expected one AdTracker sender, found ${adTrackerSends.map { it.first.type }}")
        val adTrackerHead = adTrackerSend.instructions().take(2).toList()
        assertEquals(Opcode.SGET_OBJECT, adTrackerHead[0].opcode, "AdTracker sender must start with sget-object")
        assertEquals(
            "Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;",
            ((adTrackerHead[0] as ReferenceInstruction).reference as FieldReference).let { "${it.definingClass}->${it.name}:${it.type}" },
            "AdTracker sender must load Unit.INSTANCE",
        )
        assertEquals(Opcode.RETURN_OBJECT, adTrackerHead[1].opcode, "AdTracker sender must return it at once")

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

        // Disable telemetry 4: Sentry is never started: CrashTrackingConfig's constructor zeroes
        // the register that the isCrashTrackingAllowedByUser iput-boolean stores.
        val crashConfig = classes.byToString("CrashTrackingConfig(isCrashTrackingAllowedByUser=")
        val crashConstructor = crashConfig.methods.single { method ->
            method.name == "<init>" && method.instructions().any {
                it.opcode == Opcode.IPUT_BOOLEAN &&
                    it.fieldRef()?.let { ref -> ref.definingClass == crashConfig.type && ref.name == "isCrashTrackingAllowedByUser" } == true
            }
        }
        val crashInsns = crashConstructor.instructions()
        val crashStore = crashInsns.single {
            it.opcode == Opcode.IPUT_BOOLEAN &&
                it.fieldRef()?.let { ref -> ref.definingClass == crashConfig.type && ref.name == "isCrashTrackingAllowedByUser" } == true
        }.let { (it as TwoRegisterInstruction).registerA }
        val crashHead = crashInsns.first()
        assertTrue(
            crashHead is NarrowLiteralInstruction && crashHead.narrowLiteral == 0 &&
                (crashHead.opcode == Opcode.CONST_4 || crashHead.opcode == Opcode.CONST_16) &&
                (crashHead as OneRegisterInstruction).registerA == crashStore,
            "CrashTrackingConfig.<init> does not start by zeroing the isCrashTrackingAllowedByUser register v$crashStore: ${crashHead.opcode}",
        )

        // Disable rating prompts: the review gate (MailListModuleAdapterImpl.shouldStartInAppFlow)
        // answers false.
        val reviewGates = allMethods.filter { (_, method) ->
            method.name == "shouldStartInAppFlow" && method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                method.implementation != null
        }
        val (_, shouldStartReview) = reviewGates.singleOrNull()
            ?: error("expected one concrete shouldStartInAppFlow()Z, found ${reviewGates.map { it.first.type }}")
        assertForcedBoolean(shouldStartReview, expected = false, label = "MailListModuleAdapterImpl.shouldStartInAppFlow")
        // Hide upsells: the swipe-to-upsell toggle answers false; the IAP upselling check (Settings
        // "Upgrade", drawer Premium) is untouched. 9.19.0 replaced the IapUpsellingFeature toggle
        // with the per-account suspend check UpsellFeatureImpl.isIapUpsellEnabled(Account, Continuation).
        val swipe2Upsells = allMethods.filter { (_, method) ->
            method.name == "isEnabledByConfig" && method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                method.implementation != null && method.strings().contains("feature.swipe2upsell.enabled")
        }
        val (_, swipe2Upsell) = swipe2Upsells.singleOrNull()
            ?: error("expected one Swipe2UpsellFeature.isEnabledByConfig, found ${swipe2Upsells.map { it.first.type }}")
        assertForcedBoolean(swipe2Upsell, expected = false, label = "Swipe2UpsellFeature.isEnabledByConfig")
        val iapUpsell = allMethods.filter { (_, method) ->
            method.name == "isIapUpsellEnabled" && method.implementation != null &&
                method.parameterTypes.lastOrNull()?.toString()?.startsWith("Lkotlin/coroutines/") == true && method.parameterTypes.last().toString().contains("Continuation")
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
