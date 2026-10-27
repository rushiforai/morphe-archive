import app.template.patches.truecaller.layout.CALL_LOG_NUMBER_SEPARATOR
import app.template.patches.truecaller.layout.CALL_LOG_SUBTITLE_HELPER
import app.template.patches.truecaller.shared.toStringFields
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Format
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.util.ReferenceUtil
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File
import java.nio.ByteBuffer
import java.util.zip.ZipFile

private const val PKG = "com.truecaller"
private const val TRUECALLER_INIT = "Lcom/truecaller/ui/TruecallerInit;"
private const val SIGNATURE_SHA1 = "0ac1169ae6cead75264c725febd8e8d941f25e31"

private const val PREMIUM_TIER_TYPE = "Lcom/truecaller/premium/data/tier/PremiumTierType;"
private const val PREMIUM_FEATURE = "Lcom/truecaller/premium/data/feature/PremiumFeature;"
private const val PREMIUM_FEATURE_STATUS = "Lcom/truecaller/premium/data/feature/PremiumFeatureStatus;"
private const val SUBSCRIPTION_WORKER = "Lcom/truecaller/premium/PremiumSubscriptionStatusNotificationWorker;"
private const val OTP_SMS_API = "Lcom/truecaller/wizard/verification/otp/sms/OtpSmsApi;"
private const val UPDATE_TRIGGER = "Lcom/truecaller/inappupdate/UpdateTrigger;"
private const val ADS_CONTAINER = "Lcom/truecaller/ads/ui/AdsContainer;"
private const val ADS_CONTAINER_LIGHT = "Lcom/truecaller/ads/ui/AdsContainerLight;"
private const val ADS_SWITCH_VIEW = "Lcom/truecaller/ads/ui/AdsSwitchView;"
private const val AD_LAYOUT_TYPE = "Lcom/truecaller/ads/AdLayoutTypeX;"
private const val BOTTOM_BAR_BUTTON_TYPE = "Lcom/truecaller/bottombar/BottomBarButtonType;"
private const val BOTTOM_BAR_VIEW = "Lcom/truecaller/bottombar/BottomBarView;"
private const val RECYCLER_VIEW = "Landroidx/recyclerview/widget/RecyclerView;"
private const val AD_PLACEMENT = "Lcom/truecaller/ads/api/model/ad/AdPlacement;"
private const val FEATURE_STATE = "Lcom/truecaller/featuretoggles/FeatureState;"
private const val T9_REBUILD_ALL_KEY = "RefreshT9MappingWorker.RebuildAll"
private const val T9_INCREMENTAL_HELPER = "morpheRefreshT9Incremental"
private const val CLEVERTAP_FEATURE_KEY = "featureCleverTap"
private const val CRASHLYTICS_COLLECTION_KEY = "firebase_crashlytics_collection_enabled"
private const val CONTACT_TYPE = "Lcom/truecaller/enterpriseinfo/api/model/ContactType;"
private const val CALL_LOG_FILTER_TYPE = "Lcom/truecaller/calllog/api/FilterType;"
private const val MOBILE_NUMBERS_SELECTION = "data_type = ? AND data_phonebook_id NOT NULL AND data8 = ?"

class TruecallerSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.params() = parameterTypes.map(CharSequence::toString)

    private fun Method.strings() = instructions().mapNotNull { it.stringOrNull() }

    private fun Instruction.field(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference

    private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun List<ClassDef>.methodsWhere(predicate: (ClassDef, Method) -> Boolean): List<Pair<ClassDef, Method>> =
        flatMap { cls -> cls.methods.filter { predicate(cls, it) }.map { cls to it } }

    private fun List<ClassDef>.singleMethod(label: String, predicate: (ClassDef, Method) -> Boolean): Pair<ClassDef, Method> {
        val found = methodsWhere(predicate)
        check(found.size == 1) { "expected one $label, found ${found.map { (c, m) -> "${c.type}.${m.name}" }}" }
        return found.single()
    }

    /** Index of the instruction the branch at [index] jumps to. */
    private fun List<Instruction>.branchTarget(index: Int): Int {
        val offsets = runningFold(0) { offset, instruction -> offset + instruction.codeUnits }
        val target = offsets[index] + (this[index] as OffsetInstruction).codeOffset
        return offsets.indexOf(target)
    }

    private fun assertReturnsGold(method: Method, label: String) {
        val insns = method.instructions()
        val gold = insns.getOrNull(0)?.field()
        check(insns.getOrNull(0)?.opcode == Opcode.SGET_OBJECT && gold?.definingClass == PREMIUM_TIER_TYPE && gold.name == "GOLD") {
            "$label does not load PremiumTierType.GOLD first; got ${insns.getOrNull(0)?.opcode} $gold"
        }
        check(insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT) { "$label does not return GOLD at once" }
    }

    @Test
    fun `Truecaller patches unlock premium, remove ads, telemetry, contact upload, update prompts, auto-launch, nags, promotions and optional UI, show caller numbers in the call log, hide its filters, and route GMS to MicroG RE`() {
        val root = repoRoot()
        val apk = File(root, "apks/truecaller/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val allPatches = loadAllPatches(newestPatchBundle(root))
        // No Clone package name option (#50): a com.truecaller clone cannot install next to stock.
        val gmsCore = allPatches.single { p ->
            p.name == "GmsCore support" && p.compatibility.orEmpty().any { it.packageName == PKG }
        }
        check("packageName" !in gmsCore.options.keys) { "Truecaller GmsCore support still offers the packageName option" }

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "26.41.5",
            patchNames = setOf(
                "Enable Premium",
                "Disable ads",
                "Disable telemetry",
                "Disable update prompts",
                "Hide Assistant tab",
                "Hide Scam feed",
                "Hide Premium tab",
                "Hide Blocking tab",
                "Hide Messages tab",
                "Hide family button",
                "Restore classic call log",
                "Use SMS for verification codes",
                "Fix T9 contact search",
                "Hide Wear OS settings",
                "Hide business media",
                "Disable contact upload",
                "Disable auto-launch",
                "Disable nags",
                "Hide promotions",
                "Hide after-call screen for contacts",
                "Show caller number in call log",
                "Hide call log filters",
                "GmsCore support",
                "Spoof signature",
            ),
            allPatches = allPatches,
        )
        val byType = classes.associateBy { it.type }

        assertEnablePremium(classes, byType)
        assertDisableAds(classes, byType)
        assertDisableTelemetry(classes, byType)
        assertDisableUpdatePrompts(classes)
        assertFeatureToggles(classes)
        assertHiddenTabs(classes)
        assertHideMessagesTab(classes)
        assertHiddenSettingsRows(classes)
        assertToggleOverrides(classes)
        assertClassicCallLogSwipe(classes, byType)
        assertUseSmsVerification(classes)
        assertFixT9ContactSearch(classes, byType)
        assertHideBusinessMedia(classes)
        assertDisableContactUpload(classes)
        assertShowCallerNumber(classes, byType, apk)
        assertHideCallLogFilters(classes, byType)
        // onGetCredential tests isAvailableOnDevice(int) in this build, so the routing applies.
        assertGmsCoreSupport(classes, workDir, PKG, TRUECALLER_INIT, SIGNATURE_SHA1, expectCredentialRouting = true)
        assertSpoofSignature(classes, PKG, SIGNATURE_SHA1)
    }

    private fun assertEnablePremium(classes: List<ClassDef>, byType: Map<String, ClassDef>) {
        // 1. Tier getter ("premiumLevel") returns GOLD.
        val (store, tier) = classes.singleMethod("premiumLevel tier getter") { _, m ->
            m.returnType == PREMIUM_TIER_TYPE && m.parameterTypes.isEmpty() && "premiumLevel" in m.strings()
        }
        assertReturnsGold(tier, "${store.type}.${tier.name}() (tier)")

        // 2. The plain isPremium getter in the same class; the grace-period getter is untouched.
        val isPremium = store.methods.single {
            it.returnType == "Z" && it.parameterTypes.isEmpty() &&
                "isPremiumExpired" in it.strings() && "isInGracePeriod" !in it.strings()
        }
        assertForcedBoolean(isPremium, expected = true, label = "${store.type}.${isPremium.name}() (isPremium)")
        val grace = store.methods.single { "isInGracePeriod" in it.strings() && it.returnType == "Z" }
        check(grace.instructions().first().opcode != Opcode.CONST_4) { "${store.type}.${grace.name}() (grace period) was changed" }

        // 3. Static PremiumFeatureStatus == INCLUDED check.
        val (gateClass, gate) = classes.singleMethod("PremiumFeatureStatus gate") { _, m ->
            m.returnType == "Z" && m.params() == listOf(PREMIUM_FEATURE_STATUS) && AccessFlags.STATIC.isSet(m.accessFlags) &&
                m.instructions().any { it.opcode == Opcode.SGET_OBJECT && it.field()?.name == "INCLUDED" }
        }
        assertForcedBoolean(gate, expected = true, label = "${gateClass.type}.${gate.name}(PremiumFeatureStatus)")

        // 4. isFeatureAvailable(feature, refresh): true at once for the device-checked features;
        // CALL_ASSISTANT and FAMILY_SHARING (both only work through Truecaller's servers) return
        // false at once, so the premium UI does not offer them as unlocked. The stock check
        // (with the server's kill-switch list) stays below the early returns, unreached.
        val (featureClass, feature) = classes.singleMethod("feature availability check") { _, m ->
            m.returnType == "Z" && m.params() == listOf(PREMIUM_FEATURE, "Z") && "disabledPremiumFeatures" in m.strings()
        }
        val featureLabel = "${featureClass.type}.${feature.name}(PremiumFeature, Z)"
        val featureInsns = feature.instructions()
        val featureP1 = feature.implementation!!.registerCount - 2 // this + feature + Z
        for ((index, constant) in listOf(0 to "CALL_ASSISTANT", 2 to "FAMILY_SHARING")) {
            val get = featureInsns.getOrNull(index)
            check(get?.opcode == Opcode.SGET_OBJECT && get.field()?.definingClass == PREMIUM_FEATURE && get.field()?.name == constant) {
                "$featureLabel does not load PremiumFeature.$constant at $index; got ${get?.opcode} ${get?.field()}"
            }
            val branch = featureInsns[index + 1]
            check(branch.opcode == Opcode.IF_EQ && (branch as TwoRegisterInstruction).registerA == featureP1 &&
                branch.registerB == (get as OneRegisterInstruction).registerA) {
                "$featureLabel does not compare p1 with PremiumFeature.$constant"
            }
            // Both server-backed branches reach the false return at 6, before the stock code.
            check(featureInsns.branchTarget(index + 1) == 6) { "$featureLabel: the $constant branch does not reach the server-backed false return" }
        }
        val forced = featureInsns.getOrNull(4)
        check(forced?.opcode == Opcode.CONST_4 && (forced as NarrowLiteralInstruction).narrowLiteral == 1 &&
            featureInsns.getOrNull(5)?.opcode == Opcode.RETURN &&
            (featureInsns[5] as OneRegisterInstruction).registerA == (forced as OneRegisterInstruction).registerA
        ) { "$featureLabel does not return true for the other features" }
        val unavailable = featureInsns.getOrNull(6)
        check(unavailable?.opcode == Opcode.CONST_4 && (unavailable as NarrowLiteralInstruction).narrowLiteral == 0 &&
            featureInsns.getOrNull(7)?.opcode == Opcode.RETURN &&
            (featureInsns[7] as OneRegisterInstruction).registerA == (unavailable as OneRegisterInstruction).registerA
        ) { "$featureLabel does not return false for the server-backed features" }
        check(featureInsns.drop(8).any { it.stringOrNull() == "disabledPremiumFeatures" }) { "$featureLabel lost its stock check" }

        // 5. PremiumState constructor: const/16 p1, 0x1 and sget-object p2, GOLD before anything else.
        val stateClass = classes.single { cls -> cls.methods.any { m -> m.strings().any { it.startsWith("PremiumState(isPremium=") } } }
        val constructor = stateClass.method(
            "<init>",
            listOf(
                "Z", PREMIUM_TIER_TYPE, "Lcom/truecaller/premium/data/ProductKind;",
                "Lcom/truecaller/premium/data/PremiumScope;", "Lcom/truecaller/premium/data/InsuranceState;",
            ),
        )
        val p1 = constructor.implementation!!.registerCount - 5 // this + 5 single-register parameters
        val insns = constructor.instructions()
        val first = insns.getOrNull(0)
        check(
            first?.opcode == Opcode.CONST_16 && (first as OneRegisterInstruction).registerA == p1 &&
                (first as NarrowLiteralInstruction).narrowLiteral == 1
        ) { "${stateClass.type}.<init> does not start with const/16 p1, 0x1; got ${first?.opcode}" }
        val second = insns.getOrNull(1)
        check(
            second?.opcode == Opcode.SGET_OBJECT && (second as OneRegisterInstruction).registerA == p1 + 1 &&
                second.field()?.definingClass == PREMIUM_TIER_TYPE && second.field()?.name == "GOLD"
        ) { "${stateClass.type}.<init> does not set p2 to GOLD second; got ${second?.opcode} ${second?.field()}" }

        // 6. The subscription worker returns a fresh no-arg Result (Failure in this build) at once.
        val result = listOf("Success {mOutputData=", "Failure {mOutputData=").map { text ->
            classes.single { cls -> cls.methods.any { m -> m.name == "toString" && text in m.strings() } }
        }.first { cls -> cls.methods.any { it.name == "<init>" && it.parameterTypes.isEmpty() } }
        val doWork = (byType[SUBSCRIPTION_WORKER] ?: error("$SUBSCRIPTION_WORKER not found")).methods.single { it.name == "doWork" }
        val work = doWork.instructions()
        check(work.getOrNull(0)?.opcode == Opcode.NEW_INSTANCE &&
            ((work[0] as ReferenceInstruction).reference as TypeReference).type == result.type) {
            "doWork does not start with new-instance ${result.type}; got ${work.getOrNull(0)?.opcode}"
        }
        val init = work.getOrNull(1)?.call()
        check(work.getOrNull(1)?.opcode == Opcode.INVOKE_DIRECT && init?.definingClass == result.type && init.name == "<init>" &&
            init.parameterTypes.isEmpty()) { "doWork does not construct ${result.type}; got $init" }
        check(work.getOrNull(2)?.opcode == Opcode.RETURN_OBJECT) { "doWork does not return the Result at once" }

        // 7. The premium status sync writer returns Unit before storing anything or sending the
        // PremiumStatusUpdate event.
        val (writerClass, writer) = classes.singleMethod("premium status writer") { _, m ->
            m.returnType == "Ljava/lang/Object;" && m.parameterTypes.size == 2 &&
                m.strings().containsAll(listOf("premiumHadPremiumBefore", "entitledCatalogItemIds"))
        }
        val writerInsns = writer.instructions()
        val unit = writerInsns.getOrNull(0)
        check(unit?.opcode == Opcode.SGET_OBJECT && unit.field()?.definingClass == "Lkotlin/Unit;" &&
            unit.field()?.type == "Lkotlin/Unit;") {
            "${writerClass.type}.${writer.name} does not load kotlin.Unit first; got ${unit?.opcode} ${unit?.field()}"
        }
        val ret = writerInsns.getOrNull(1)
        check(ret?.opcode == Opcode.RETURN_OBJECT && (ret as OneRegisterInstruction).registerA == (unit as OneRegisterInstruction).registerA) {
            "${writerClass.type}.${writer.name} does not return Unit at once"
        }

        // 8. Premium tab (#77): the tab's state chooser (builds the Entitled and Paywall states, reads
        // "isSubscriptionOnHoldOrPaused" and a PremiumLaunchContext.Static constant) overwrites its one
        // isPremium result with false right after the move-result, before the branch that reads it,
        // so the tab shows the plans. The isPremium getter itself stays forced true (step 2).
        fun stateType(prefix: String) = classes.single { cls ->
            cls.methods.any { m -> m.name == "toString" && m.strings().any { it.startsWith(prefix) } }
        }.type
        val states = listOf(stateType("Entitled(subscriptionFetchResult="), stateType("Paywall(subscriptionFetchResult="))
        val (chooserClass, chooser) = classes.singleMethod("Premium tab state chooser") { _, m ->
            m.returnType == "Ljava/lang/Object;" && m.parameterTypes.size == 1 && "isSubscriptionOnHoldOrPaused" in m.strings() &&
                m.instructions().any {
                    it.opcode == Opcode.SGET_OBJECT && it.field()?.type == "Lcom/truecaller/premium/PremiumLaunchContext\$Static;"
                } &&
                states.all { state ->
                    m.instructions().any { it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == state }
                }
        }
        val chooserLabel = "${chooserClass.type}.${chooser.name} (Premium tab state chooser)"
        val chooserInsns = chooser.instructions()
        val premiumReads = chooserInsns.indices.filter { index ->
            chooserInsns[index].call()?.let { it.definingClass == store.type && it.name == isPremium.name && it.parameterTypes.isEmpty() } == true
        }
        check(premiumReads.size == 1) { "$chooserLabel reads isPremium ${premiumReads.size} times, expected 1" }
        val read = premiumReads.single()
        val premiumResult = chooserInsns[read + 1]
        check(premiumResult.opcode == Opcode.MOVE_RESULT) { "$chooserLabel: no move-result after isPremium; got ${premiumResult.opcode}" }
        val premiumRegister = (premiumResult as OneRegisterInstruction).registerA
        val notPremium = chooserInsns.getOrNull(read + 2)
        check(notPremium?.opcode == Opcode.CONST_16 && (notPremium as OneRegisterInstruction).registerA == premiumRegister &&
            (notPremium as NarrowLiteralInstruction).narrowLiteral == 0) {
            "$chooserLabel does not overwrite the isPremium result v$premiumRegister with false; got ${notPremium?.opcode}"
        }
        val decision = chooserInsns.getOrNull(read + 3)
        check(decision?.opcode == Opcode.IF_EQZ && (decision as OneRegisterInstruction).registerA == premiumRegister) {
            "$chooserLabel: the isPremium branch does not follow the forced false; got ${decision?.opcode}"
        }
    }

    private fun assertDisableAds(classes: List<ClassDef>, byType: Map<String, ClassDef>) {
        fun require(type: String) = byType[type] ?: error("$type not found")

        // Banner and native binds: the holder types are derived the same way the patch does.
        val switchView = require(ADS_SWITCH_VIEW)
        val bannerHolder = switchView.methods.single {
            it.returnType == "V" && it.params().size == 2 && it.params()[1] == AD_LAYOUT_TYPE
        }.params().first()
        val container = require(ADS_CONTAINER)
        val light = require(ADS_CONTAINER_LIGHT)
        val layoutConfig = container.methods.first {
            it.returnType == "V" && it.params().size >= 2 && it.params().first() == bannerHolder
        }.params()[1]
        val nativeHolders = (container.methods + light.methods).map { it.params() }
            .filter { it.size >= 2 && it[1] == layoutConfig && it[0] != bannerHolder }.map { it.first() }.toSet()
        check(nativeHolders.isNotEmpty()) { "no native ad holder type found" }
        val adTypes = nativeHolders + bannerHolder + AD_LAYOUT_TYPE

        var banner = 0
        var native = 0
        for (cls in listOf(container, light, switchView)) {
            val binds = cls.methods.filter { m ->
                m.returnType == "V" && m.name != "<init>" && !AccessFlags.STATIC.isSet(m.accessFlags) &&
                    m.params().firstOrNull()?.startsWith("L") == true && m.params().any { it in adTypes }
            }
            check(binds.isNotEmpty()) { "no ad bind method in ${cls.type}" }
            for (bind in binds) {
                val label = "${cls.type}.${bind.name}(${bind.params().joinToString()})"
                val p0 = bind.implementation!!.registerCount - bind.params().sumOf { if (it == "J" || it == "D") 2 else 1 } - 1
                val insns = bind.instructions()
                val gone = insns.getOrNull(0)
                check(gone?.opcode == Opcode.CONST_16 && (gone as OneRegisterInstruction).registerA == p0 + 1 &&
                    (gone as NarrowLiteralInstruction).narrowLiteral == 8) { "$label does not start with const/16 p1, 0x8" }
                val set = insns.getOrNull(1)
                check(set?.opcode == Opcode.INVOKE_VIRTUAL_RANGE && set.call()?.name == "setVisibility" &&
                    (set as RegisterRangeInstruction).startRegister == p0 && set.registerCount == 2) {
                    "$label does not call setVisibility(p0, GONE); got ${set?.opcode} ${set?.call()}"
                }
                check(insns.getOrNull(2)?.opcode == Opcode.RETURN_VOID) { "$label does not return after hiding" }
                if (bannerHolder in bind.params()) banner++
                if (bind.params().any { it in nativeHolders }) native++
            }
        }
        check(banner >= 3 && native >= 4) { "only $banner banner and $native native bind methods patched" }
        // AdsSwitchView's position helper c(I)V is left alone.
        val position = switchView.methods.single { it.returnType == "V" && it.params() == listOf("I") }
        check(position.instructions().first().opcode != Opcode.CONST_16) { "AdsSwitchView.${position.name}(I) was changed" }

        // Interstitials: the manager's "featureInterstitialAd" check returns false, so placements
        // run the user's action at once.
        val (gateClass, gate) = classes.singleMethod("interstitial ads check") { _, m ->
            m.returnType == "Z" && m.parameterTypes.isEmpty() && "featureInterstitialAd" in m.strings()
        }
        assertForcedBoolean(gate, expected = false, label = "${gateClass.type}.${gate.name}() (featureInterstitialAd)")

        // Ads V2 placements: the (AdPlacement, continuation) check returns Boolean.FALSE at once, which
        // also drops the call log's "Upgrade for an ad-free experience" placeholder row.
        val (placementClass, placement) = classes.singleMethod("Ads V2 placement check") { _, m ->
            m.returnType == "Ljava/lang/Object;" && m.params().size == 2 && m.params().first() == AD_PLACEMENT &&
                "featureAdsV2OnClList" in m.strings()
        }
        val placementInsns = placement.instructions()
        val no = placementInsns.getOrNull(0)
        check(no?.opcode == Opcode.SGET_OBJECT && no.field()?.definingClass == "Ljava/lang/Boolean;" && no.field()?.name == "FALSE" &&
            placementInsns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT &&
            (placementInsns[1] as OneRegisterInstruction).registerA == (no as OneRegisterInstruction).registerA
        ) { "${placementClass.type}.${placement.name}(AdPlacement, ...) does not return Boolean.FALSE at once; got ${no?.opcode} ${no?.field()}" }

        // The master "ads allowed" check (the only ()Z method reading both strings) returns false.
        val (allowedClass, allowed) = classes.singleMethod("ads allowed check") { _, m ->
            m.returnType == "Z" && m.parameterTypes.isEmpty() && m.strings().containsAll(listOf("qaForceAds", "adsDisabledUntil"))
        }
        assertForcedBoolean(allowed, expected = false, label = "${allowedClass.type}.${allowed.name}() (ads allowed)")

        // Only the app-open loading screen still finishes right after super.onCreate; the
        // interstitial activities, which deliver the pending action or reward, are untouched.
        for ((type, finishes) in listOf(
            "Lcom/truecaller/ads/interstitial/AdAppOpeningActivity;" to true,
            "Lcom/truecaller/ads/interstitial/AdInterstitialActivity;" to false,
            "Lcom/truecaller/ads/adsrouter/ui/interstitial/AdRouterInterstitialActivity;" to false,
        )) {
            val insns = require(type).method("onCreate", listOf("Landroid/os/Bundle;")).instructions()
            val superCall = insns.indexOfFirst { it.opcode == Opcode.INVOKE_SUPER && it.call()?.name == "onCreate" }
            check(superCall >= 0) { "$type.onCreate does not call super.onCreate" }
            val finish = insns.getOrNull(superCall + 1)
            val finished = finish?.opcode == Opcode.INVOKE_VIRTUAL_RANGE && finish.call()?.name == "finish" &&
                finish.call()?.definingClass == "Landroid/app/Activity;"
            check(finished == finishes) {
                "$type.onCreate ${if (finishes) "does not finish()" else "still finishes"} right after super.onCreate; got ${finish?.opcode} ${finish?.call()}"
            }
            if (finishes) {
                check(insns.getOrNull(superCall + 2)?.opcode == Opcode.RETURN_VOID) { "$type.onCreate does not return after finish()" }
            }
        }
    }

    private fun assertDisableTelemetry(classes: List<ClassDef>, byType: Map<String, ClassDef>) {
        val tracker = byType["Lcom/truecaller/analytics/technical/AppStartTracker;"] ?: error("AppStartTracker not found")
        assertReturnsEarlyVoid(tracker.method("enableTracking", emptyList()), label = "AppStartTracker.enableTracking()")

        val cleverTap = classes.filter { "Lcom/truecaller/clevertap/CleverTapManager;" in it.interfaces }
        check(cleverTap.isNotEmpty()) { "no CleverTapManager implementation found" }
        for (cls in cleverTap) {
            assertReturnsEarlyVoid(cls.method("push", listOf("Ljava/lang/String;")), label = "${cls.type}.push(String)")
            assertReturnsEarlyVoid(
                cls.method("push", listOf("Ljava/lang/String;", "Ljava/util/Map;")),
                label = "${cls.type}.push(String, Map)",
            )
        }

        val appsFlyer = classes.filter { it.superclass == "Lcom/appsflyer/AppsFlyerLib;" }
        check(appsFlyer.isNotEmpty()) { "no AppsFlyerLib subclass found" }
        for (cls in appsFlyer) {
            val starts = cls.methods.filter { it.name == "start" && it.params().firstOrNull() == "Landroid/content/Context;" }
            check(starts.any { it.params().size == 1 }) { "${cls.type} has no start(Context)" }
            starts.forEach { assertReturnsEarlyVoid(it, label = "${cls.type}.start(${it.params().joinToString()})") }
        }

        // Every getBoolean("featureCleverTap", ...) read outside the QA menu is zeroed right after
        // its move-result (SDK init + second gate, CRM push handler, refresh work action).
        val cleverTapReads = forcedReads(classes, CLEVERTAP_FEATURE_KEY, skipPrefix = "Lcom/truecaller/qa/", isRead = {
            it.definingClass == "Landroid/content/SharedPreferences;" && it.name == "getBoolean"
        }) { forced, result ->
            (forced.opcode == Opcode.CONST_4 || forced.opcode == Opcode.CONST_16) &&
                (forced as OneRegisterInstruction).registerA == result && (forced as NarrowLiteralInstruction).narrowLiteral == 0
        }
        check(cleverTapReads >= 4) { "only $cleverTapReads featureCleverTap reads forced to false, expected at least 4" }

        // Firebase Analytics: the measurement config's Boolean get(key) reads deactivated = TRUE and
        // advertising ID collection = FALSE right after its move-result-object.
        val isConfigRead: (MethodReference) -> Boolean = {
            it.returnType == "Ljava/lang/Boolean;" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;")
        }
        fun loadsBoolean(name: String): (Instruction, Int) -> Boolean = { forced, result ->
            forced.opcode == Opcode.SGET_OBJECT && (forced as OneRegisterInstruction).registerA == result &&
                forced.field()?.definingClass == "Ljava/lang/Boolean;" && forced.field()?.name == name
        }
        val deactivated = forcedReads(classes, "firebase_analytics_collection_deactivated", isRead = isConfigRead, isForced = loadsBoolean("TRUE"))
        check(deactivated >= 1) { "firebase_analytics_collection_deactivated is not forced to TRUE" }
        val adid = forcedReads(classes, "google_analytics_adid_collection_enabled", isRead = isConfigRead, isForced = loadsBoolean("FALSE"))
        check(adid >= 2) { "only $adid google_analytics_adid_collection_enabled reads forced to FALSE, expected 2" }

        // Crashlytics: every ()Z getter of the data collection arbiter returns false.
        val arbiters = classes.filter { cls ->
            cls.methods.any { CRASHLYTICS_COLLECTION_KEY in it.strings() } &&
                cls.methods.any { "Crashlytics automatic data collection " in it.strings() }
        }
        check(arbiters.size == 1) { "expected one Crashlytics data collection arbiter, found ${arbiters.map { it.type }}" }
        val getters = arbiters.single().methods.filter { it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null }
        check(getters.isNotEmpty()) { "${arbiters.single().type} has no ()Z getter" }
        getters.forEach { assertForcedBoolean(it, expected = false, label = "${arbiters.single().type}.${it.name}() (Crashlytics collection)") }

        // Firebase Sessions: the manifest override getter returns Boolean.FALSE at once.
        val (sessionsClass, sessions) = classes.singleMethod("Firebase Sessions enabled override") { _, m ->
            m.returnType == "Ljava/lang/Boolean;" && m.parameterTypes.isEmpty() && "firebase_sessions_enabled" in m.strings() &&
                m.instructions().any { it.call()?.definingClass == "Landroid/os/BaseBundle;" && it.call()?.name == "getBoolean" }
        }
        val sessionsInsns = sessions.instructions()
        check(sessionsInsns.getOrNull(0)?.let { loadsBoolean("FALSE")(it, (it as? OneRegisterInstruction)?.registerA ?: -1) } == true &&
            sessionsInsns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT &&
            (sessionsInsns[1] as OneRegisterInstruction).registerA == (sessionsInsns[0] as OneRegisterInstruction).registerA
        ) { "${sessionsClass.type}.${sessions.name}() does not return Boolean.FALSE at once" }

        // The switches are bytecode-only: the manifest keeps its stock Crashlytics flag and gains none.
        val manifest = workDir.walkTopDown()
            .filter { it.name == "AndroidManifest.xml" }
            .map { it.readText() }
            .firstOrNull { it.contains("package=\"$PKG\"") && it.contains("<application") }
            ?: error("no decoded $PKG AndroidManifest.xml under $workDir")
        check(Regex("""android:name="firebase_crashlytics_collection_enabled"\s+android:value="true"""").containsMatchIn(manifest) &&
            "firebase_analytics_collection_deactivated" !in manifest && "firebase_sessions_enabled" !in manifest
        ) { "Disable telemetry changed the Firebase manifest meta-data" }
    }

    /**
     * Counts the reads of [key] (a const-string whose register is next passed as the key, at
     * argument 1, to a call [isRead] accepts) whose result is overwritten right after its
     * move-result by an instruction [isForced] accepts; fails on any read that is not forced.
     */
    private fun forcedReads(
        classes: List<ClassDef>,
        key: String,
        skipPrefix: String? = null,
        isRead: (MethodReference) -> Boolean,
        isForced: (Instruction, Int) -> Boolean,
    ): Int {
        var forced = 0
        for ((cls, method) in classes.methodsWhere { cls, m -> (skipPrefix == null || !cls.type.startsWith(skipPrefix)) && key in m.strings() }) {
            val insns = method.instructions()
            for (index in insns.indices.filter { insns[it].stringOrNull() == key }) {
                val register = (insns[index] as OneRegisterInstruction).registerA
                val use = (index + 1 until insns.size).firstOrNull { insns[it].arguments()?.contains(register) == true } ?: continue
                val call = insns[use].call()
                if (call == null || !isRead(call) || insns[use].arguments()?.getOrNull(1) != register) continue
                val label = "${cls.type}.${method.name} ($key read)"
                val result = insns.getOrNull(use + 1)
                check(result?.opcode == Opcode.MOVE_RESULT || result?.opcode == Opcode.MOVE_RESULT_OBJECT) { "$label has no move-result" }
                val next = insns.getOrNull(use + 2)
                check(next != null && isForced(next, (result as OneRegisterInstruction).registerA)) {
                    "$label is not forced after its move-result; got ${next?.opcode}"
                }
                forced++
            }
        }
        return forced
    }

    private fun Instruction.arguments(): List<Int>? = when (this) {
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        else -> null
    }

    private fun assertDisableUpdatePrompts(classes: List<ClassDef>) {
        val manager = classes.single { cls ->
            cls.methods.any {
                it.returnType == "Ljava/util/concurrent/CompletableFuture;" &&
                    it.params() == listOf("Landroid/app/Activity;", UPDATE_TRIGGER)
            }
        }
        val start = manager.methods.single {
            it.returnType == "Ljava/lang/Object;" && it.params().size == 3 &&
                it.params().take(2) == listOf("Landroid/app/Activity;", UPDATE_TRIGGER)
        }
        val insns = start.instructions()
        val value = insns.getOrNull(0)?.field()
        check(insns.getOrNull(0)?.opcode == Opcode.SGET_OBJECT && value?.definingClass == "Ljava/lang/Boolean;" && value.name == "FALSE") {
            "${manager.type}.${start.name} does not load Boolean.FALSE first; got ${insns.getOrNull(0)?.opcode} $value"
        }
        check(insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT) { "${manager.type}.${start.name} does not return at once" }

        // The stored server forced-update state always reads NONE.
        val (typeOwner, typeGetter) = classes.singleMethod("forced update type getter") { _, m ->
            m.returnType == "Lcom/truecaller/forcedupdate/UpdateType;" && m.parameterTypes.isEmpty() &&
                "forcedUpdate_updateType" in m.strings()
        }
        val typeInsns = typeGetter.instructions()
        val type = typeInsns.getOrNull(0)?.field()
        check(typeInsns.getOrNull(0)?.opcode == Opcode.SGET_OBJECT && type?.name == "NONE" &&
            type.definingClass == "Lcom/truecaller/forcedupdate/UpdateType;" &&
            typeInsns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT
        ) { "${typeOwner.type}.${typeGetter.name}() does not return UpdateType.NONE at once; got ${typeInsns.getOrNull(0)?.opcode} $type" }
    }

    private fun assertFeatureToggles(classes: List<ClassDef>) {
        for (key in listOf("featureCallAssistant", "featureScamFeed")) {
            val (cls, toggle) = classes.singleMethod("$key toggle") { _, m ->
                m.returnType == "Z" && m.parameterTypes.isEmpty() && key in m.strings()
            }
            assertForcedBoolean(toggle, expected = false, label = "${cls.type}.${toggle.name}() ($key)")
        }
    }

    private fun assertHiddenTabs(classes: List<ClassDef>) {
        // The bottom bar builder calls one helper per tab patch on the tab array right before
        // filterNotNull; together they null PREMIUM, BLOCKING, FAMILY_PROTECTION_CONFIG and MESSAGES.
        val (builderClass, builder) = classes.singleMethod("bottom bar builder") { _, m ->
            m.returnType == "V" && m.params() == listOf("Landroid/util/SparseIntArray;") &&
                m.instructions().any { it.opcode == Opcode.SGET_OBJECT && it.field()?.definingClass == BOTTOM_BAR_BUTTON_TYPE && it.field()?.name == "CALLS" }
        }
        val label = "${builderClass.type}.${builder.name}(SparseIntArray)"
        val insns = builder.instructions()
        val filter = insns.indexOfFirst {
            it.opcode == Opcode.INVOKE_STATIC && it.call()?.returnType == "Ljava/util/List;" &&
                it.call()?.parameterTypes?.map(CharSequence::toString) == listOf("[Ljava/lang/Object;")
        }
        check(filter >= 3) { "$label has no filterNotNull call after the helpers" }
        val array = (insns[filter] as FiveRegisterInstruction).registerC
        val arrayType = insns.take(filter).last { it.opcode == Opcode.NEW_ARRAY && (it as TwoRegisterInstruction).registerA == array }
            .let { ((it as ReferenceInstruction).reference as TypeReference).type }
        val hidden = mutableSetOf<String>()
        for (call in insns.subList(filter - 3, filter)) {
            val ref = call.call()
            check(call.opcode == Opcode.INVOKE_STATIC_RANGE && ref?.definingClass == builderClass.type &&
                ref.parameterTypes.map(CharSequence::toString) == listOf(arrayType) &&
                (call as RegisterRangeInstruction).startRegister == array && call.registerCount == 1
            ) { "$label does not pass the tab array v$array to a helper before filterNotNull; got ${call.opcode} $ref" }
            val helper = builderClass.method(ref.name, listOf(arrayType))
            val helperInsns = helper.instructions()
            check(helperInsns.any { it.opcode == Opcode.APUT_OBJECT }) { "${builderClass.type}.${helper.name} does not null array entries" }
            check(helperInsns.any { it.call()?.returnType == BOTTOM_BAR_BUTTON_TYPE && it.call()?.definingClass == arrayType.removePrefix("[") }) {
                "${builderClass.type}.${helper.name} does not read the tab type"
            }
            hidden += helperInsns.filter { it.opcode == Opcode.SGET_OBJECT && it.field()?.definingClass == BOTTOM_BAR_BUTTON_TYPE }
                .map { it.field()!!.name }
        }
        check(hidden == setOf("PREMIUM", "BLOCKING", "FAMILY_PROTECTION_CONFIG", "MESSAGES")) { "$label hides $hidden" }
    }

    private fun assertHideMessagesTab(classes: List<ClassDef>) {
        val (builderClass, builder) = classes.singleMethod("bottom bar builder") { _, m ->
            m.returnType == "V" && m.params() == listOf("Landroid/util/SparseIntArray;") &&
                m.instructions().any { it.opcode == Opcode.SGET_OBJECT && it.field()?.definingClass == BOTTOM_BAR_BUTTON_TYPE && it.field()?.name == "CALLS" }
        }
        fun Instruction.isTabType(name: String) =
            opcode == Opcode.SGET_OBJECT && field()?.definingClass == BOTTOM_BAR_BUTTON_TYPE && field()?.name == name

        // The "default_tab_on_launch" getter returns CALLS at once.
        val defaultTab = builderClass.methods.single {
            it.returnType == BOTTOM_BAR_BUTTON_TYPE && it.parameterTypes.isEmpty() && "default_tab_on_launch" in it.strings()
        }
        val defaultInsns = defaultTab.instructions()
        check(defaultInsns.getOrNull(0)?.isTabType("CALLS") == true && defaultInsns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT &&
            (defaultInsns[1] as OneRegisterInstruction).registerA == (defaultInsns[0] as OneRegisterInstruction).registerA
        ) { "${builderClass.type}.${defaultTab.name}() (default tab) does not return CALLS at once" }

        // selectTab(type, Z) swaps MESSAGES for CALLS before its stock code.
        val select = builderClass.methods.single {
            it.returnType == "V" && it.params() == listOf(BOTTOM_BAR_BUTTON_TYPE, "Z") &&
                it.instructions().any { insn -> insn.call()?.name == "setSelectedItemId" }
        }
        val selectLabel = "${builderClass.type}.${select.name}(BottomBarButtonType, Z)"
        val selectInsns = select.instructions()
        val p1 = select.implementation!!.registerCount - 2 // the type, then Z
        check(selectInsns.getOrNull(0)?.isTabType("MESSAGES") == true) { "$selectLabel does not load MESSAGES first" }
        val compare = selectInsns[1]
        check(compare.opcode == Opcode.IF_NE && (compare as TwoRegisterInstruction).registerA == p1 &&
            compare.registerB == (selectInsns[0] as OneRegisterInstruction).registerA && selectInsns.branchTarget(1) == 3
        ) { "$selectLabel does not skip the swap for other tabs" }
        check(selectInsns[2].isTabType("CALLS") && (selectInsns[2] as OneRegisterInstruction).registerA == p1) {
            "$selectLabel does not replace MESSAGES with CALLS"
        }
        check(selectInsns.drop(3).any { it.call()?.name == "setSelectedItemId" }) { "$selectLabel lost its stock code" }

        // Right after the BottomBarView cast, the builder passes the bar and the final tab list to a
        // helper that keeps the bar visible (it pads for the navigation bar, issue #61) and, with
        // fewer than two tabs, hides its tab menu and drops its minimum height (saved in a new field).
        val insns = builder.instructions()
        val take = insns.indexOfFirst {
            it.call()?.definingClass == "Lkotlin/collections/CollectionsKt;" &&
                it.call()?.parameterTypes?.map(CharSequence::toString) == listOf("Ljava/lang/Iterable;", "I")
        }
        val cast = insns.indexOfFirst {
            it.opcode == Opcode.CHECK_CAST && ((it as ReferenceInstruction).reference as TypeReference).type == BOTTOM_BAR_VIEW
        }
        check(take >= 0 && cast > take) { "bottom bar builder has no take() before its BottomBarView cast" }
        val list = (insns[take + 1] as OneRegisterInstruction).registerA
        val call = insns[cast + 1]
        val ref = call.call()
        check(call.opcode == Opcode.INVOKE_STATIC && ref?.definingClass == builderClass.type &&
            ref.parameterTypes.map(CharSequence::toString) == listOf(BOTTOM_BAR_VIEW, "Ljava/util/List;") &&
            (call as FiveRegisterInstruction).registerC == (insns[cast] as OneRegisterInstruction).registerA && call.registerD == list
        ) { "bottom bar builder does not pass the bar and the tab list to a helper after the cast; got ${call.opcode} $ref" }
        val helperLabel = "${builderClass.type}.${ref.name}"
        val helper = builderClass.method(ref.name, listOf(BOTTOM_BAR_VIEW, "Ljava/util/List;")).instructions()
        val bar = 4 // p0 of the 6-register helper
        check(helper.getOrNull(0)?.opcode == Opcode.CONST_4 && (helper[0] as NarrowLiteralInstruction).narrowLiteral == 0 &&
            helper.getOrNull(1)?.call()?.name == "setVisibility" && (helper[1] as FiveRegisterInstruction).registerC == bar &&
            (helper[1] as FiveRegisterInstruction).registerD == (helper[0] as OneRegisterInstruction).registerA
        ) { "$helperLabel does not keep the bar VISIBLE first" }
        val barVisibility = helper.drop(2).filter { it.call()?.name == "setVisibility" }
        check(barVisibility.size == 1 && (barVisibility.single() as FiveRegisterInstruction).registerC != bar) {
            "$helperLabel changes the bar's visibility again instead of its children's"
        }
        check(helper.any { it.call()?.name == "size" && it.call()?.definingClass == "Ljava/util/List;" } &&
            helper.any { it.opcode == Opcode.IF_LT } &&
            helper.any { it.call()?.name == "getChildAt" && it.call()?.definingClass == "Landroid/view/ViewGroup;" } &&
            helper.any { it.opcode == Opcode.CONST_16 && (it as NarrowLiteralInstruction).narrowLiteral == 8 }
        ) { "$helperLabel does not hide the bar's children below two tabs" }
        check(helper.count { it.call()?.name == "setMinimumHeight" && (it as FiveRegisterInstruction).registerC == bar } == 2 &&
            helper.any { it.call()?.name == "getMinimumHeight" }
        ) { "$helperLabel does not drop and restore the bar's minimum height" }
        val savedField = helper.mapNotNull { it.field() }.distinct().singleOrNull()
        check(savedField?.definingClass == BOTTOM_BAR_VIEW && savedField.type == "Ljava/lang/Integer;" &&
            helper.any { it.opcode == Opcode.IPUT_OBJECT } && helper.any { it.opcode == Opcode.IGET_OBJECT }
        ) { "$helperLabel does not save the minimum height on the bar; got $savedField" }
        val barClass = classes.single { it.type == BOTTOM_BAR_VIEW }
        check(barClass.fields.any { it.name == savedField.name && it.type == savedField.type && AccessFlags.PUBLIC.isSet(it.accessFlags) }) {
            "$BOTTOM_BAR_VIEW has no public ${savedField.name} field"
        }
    }

    private fun assertHiddenSettingsRows(classes: List<ClassDef>) {
        // The Settings screen state's toString reads isPremiumItemVisible and isWatchItemVisible
        // first, in that order ("Hide Premium tab" and "Hide Wear OS settings" zero both).
        val (stateClass, toString) = classes.singleMethod("CategoriesSettingsState.toString") { _, m ->
            m.name == "toString" && m.parameterTypes.isEmpty() && m.strings().any { it.startsWith("CategoriesSettingsState(") }
        }
        check(toString.strings().containsAll(listOf("CategoriesSettingsState(isPremiumItemVisible=", ", isWatchItemVisible="))) {
            "${stateClass.type}.toString lost the premium/watch labels: ${toString.strings()}"
        }
        val flags = toString.instructions().filter { it.opcode == Opcode.IGET_BOOLEAN && it.field()?.definingClass == stateClass.type }
            .map { it.field()!!.name }
        check(flags.size >= 3) { "${stateClass.type}.toString reads only $flags" }
        val hidden = flags.take(2).toSet() // isPremiumItemVisible, isWatchItemVisible

        val constructors = stateClass.methods.filter { it.name == "<init>" && it.implementation != null }
        check(constructors.isNotEmpty()) { "${stateClass.type} has no constructor" }
        for (constructor in constructors) {
            val label = "${stateClass.type}.<init>(${constructor.params().joinToString()})"
            val insns = constructor.instructions()
            val zeroed = insns.indices.filter { insns[it].opcode == Opcode.IPUT_BOOLEAN && insns[it].field()?.definingClass == stateClass.type }
                .associate { index ->
                    val store = insns[index] as TwoRegisterInstruction
                    val previous = insns.getOrNull(index - 1)
                    store.field()!!.name to (previous?.opcode == Opcode.CONST_16 && (previous as OneRegisterInstruction).registerA == store.registerA &&
                        (previous as NarrowLiteralInstruction).narrowLiteral == 0)
                }
            check(zeroed.filterValues { it }.keys == hidden) { "$label zeroes ${zeroed.filterValues { it }.keys}, expected $hidden" }
        }
    }

    private fun assertToggleOverrides(classes: List<ClassDef>) {
        // The SharedPreferences toggle resolver starts with one "key.equals(p1) -> return value"
        // block per override, each falling through to the next and finally to the stock code.
        // Hide family button and Restore classic call log add one each, Disable ads five (incl. the
        // Offer Hub), Hide business media the seven verified business campaign toggles, Disable
        // contact upload the Call Assistant number sync and the contact editor name suggestion,
        // Disable auto-launch one, Disable nags nine, Hide promotions four and Hide after-call
        // screen for contacts two.
        val (cls, resolver) = classes.singleMethod("feature toggle resolver") { _, m ->
            m.returnType == "Z" && m.params() == listOf("Ljava/lang/String;", FEATURE_STATE) &&
                m.instructions().any { it.call()?.definingClass == "Landroid/content/SharedPreferences;" && it.call()?.name == "getBoolean" }
        }
        val expected = mapOf(
            "featureFamilyProtect" to 0,
            "featureCallLogRevamp" to 0,
            "featureAdsOptimisationOnListView" to 1,
            "featureAdsRestrictCampaignProcessing" to 1,
            "featureConfigManagementSystem" to 0,
            "featureEnableOfflineAds" to 0,
            "featureAdsOnOfferHub" to 0,
            "featureBizVerifiedCampaigns" to 0,
            "featureBizVerifiedCampaignForOutgoingCalls" to 0,
            "featureBizVerifiedCampaignInRevampedInCallUi" to 0,
            "featureBizVerifiedCampaignsCarouselACS" to 0,
            "featureBizVerifiedCampaignsDetailsView" to 0,
            "featureBizVerifiedCampaignsCarouselDetailsView" to 0,
            "featureBizVerifiedCampaignsDV3" to 0,
            "featureCallAssistantNumberSync" to 0,
            "featureContactEditorNameSuggestion" to 0,
            "featureAutoAppLaunchPassive" to 0,
            "featureDefaultDialerInterstitial" to 0,
            "featureDefaultDialerPermanentSpace" to 0,
            "featureNotificationsPermissionBanner" to 0,
            "featureDOOABanner" to 0,
            "featureDisableBatteryOptimizationBanner" to 0,
            "featurePeriodicallyCheckPermissions" to 0,
            "featureRatingsAndReviewsSurveys" to 0,
            "featureBlockSurveyFlow" to 0,
            "featureFeedbackSurvey" to 0,
            "featurePersonalSafetyPromo" to 0,
            "featureAcsWhoViewedMeBanner" to 0,
            "featureReferralNavDrawer" to 0,
            "featureRedeemPromo" to 0,
            "featureShowACSAllIncoming" to 0,
            "featureShowACSAllOutgoing" to 0,
        )
        assertOverrideBlocks(cls, resolver, expected)
        assertResolverReads(classes, cls, resolver, expected.keys)

        // Hide promotions: the Firebase experiment resolver (same signature, asks an interface
        // (String, Z)Z store, no SharedPreferences) answers true for the Who-viewed-me
        // notification switch; it is still read there.
        val (firebaseClass, firebase) = classes.singleMethod("Firebase toggle resolver") { _, m ->
            m.returnType == "Z" && m.params() == listOf("Ljava/lang/String;", FEATURE_STATE) && m.implementation != null &&
                m.instructions().any {
                    it.opcode == Opcode.INVOKE_INTERFACE && it.call()?.returnType == "Z" &&
                        it.call()?.parameterTypes?.map(CharSequence::toString) == listOf("Ljava/lang/String;", "Z")
                } &&
                m.instructions().none {
                    it.call()?.definingClass == "Landroid/content/SharedPreferences;" ||
                        ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type == "Landroid/content/SharedPreferences;"
                }
        }
        val firebaseExpected = mapOf("DisableWVMNotifications_65487" to 1)
        assertOverrideBlocks(firebaseClass, firebase, firebaseExpected)
        assertResolverReads(classes, firebaseClass, firebase, firebaseExpected.keys)
    }

    /** Some method other than the resolver loads each key and later calls the resolver with it. */
    private fun assertResolverReads(classes: List<ClassDef>, cls: ClassDef, resolver: Method, keys: Set<String>) {
        val label = "${cls.type}.${resolver.name}(String, FeatureState)"
        fun Instruction.isResolverCall() = call()?.let {
            it.definingClass == cls.type && it.name == resolver.name && it.returnType == "Z" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", FEATURE_STATE)
        } == true
        val callers = classes.methodsWhere { _, m -> m.implementation != null && m.instructions().any { it.isResolverCall() } }
        for (key in keys) {
            check(callers.any { (_, m) ->
                val insns = m.instructions()
                val load = insns.indexOfFirst { it.stringOrNull() == key }
                load >= 0 && insns.drop(load + 1).any { it.isResolverCall() }
            }) { "no method passes $key to $label" }
        }
    }

    /**
     * The [resolver] starts with exactly one "key.equals(p1) -> return value" block per entry of
     * [expected], each falling through to the next and finally to the stock code.
     */
    private fun assertOverrideBlocks(cls: ClassDef, resolver: Method, expected: Map<String, Int>) {
        val label = "${cls.type}.${resolver.name}(String, FeatureState)"
        val insns = resolver.instructions()
        val keyRegister = resolver.implementation!!.registerCount - 2 // this + key + state
        val overrides = mutableMapOf<String, Int>()
        for (block in expected.keys.indices) {
            val start = block * 6
            val key = insns.getOrNull(start)?.stringOrNull() ?: error("$label: override block $block has no key")
            val equals = insns[start + 1]
            check(equals.opcode == Opcode.INVOKE_VIRTUAL && equals.call()?.definingClass == "Ljava/lang/String;" &&
                equals.call()?.name == "equals" && (equals as FiveRegisterInstruction).registerD == keyRegister
            ) { "$label: $key is not compared with p1" }
            check(insns[start + 2].opcode == Opcode.MOVE_RESULT && insns[start + 3].opcode == Opcode.IF_EQZ) { "$label: $key has no branch" }
            check(insns.branchTarget(start + 3) == start + 6) { "$label: a non-matching $key does not fall through" }
            val value = insns[start + 4]
            check(value.opcode == Opcode.CONST_4 && insns[start + 5].opcode == Opcode.RETURN) { "$label: $key does not return a constant" }
            overrides[key] = (value as NarrowLiteralInstruction).narrowLiteral
        }
        check(overrides == expected) { "$label overrides $overrides, expected $expected" }
        // Nothing past the override blocks is another override: the stock code follows.
        val next = insns.getOrNull(expected.size * 6)
        check(next?.opcode != Opcode.CONST_STRING || insns.getOrNull(expected.size * 6 + 1)?.call()?.name != "equals") {
            "$label has more than ${expected.size} override blocks"
        }
    }

    private fun assertClassicCallLogSwipe(classes: List<ClassDef>, byType: Map<String, ClassDef>) {
        // "featureCallLogRevamp" is checked in assertToggleOverrides. The classic lists' RecyclerView
        // setup reads "featureFavouriteContacts" and, with it on, skipped the swipe helper; the
        // result is now replaced with false right before that branch.
        val calls = listOf("addOnItemTouchListener", "addItemDecoration", "setItemAnimator", "setHasFixedSize")
        fun List<Instruction>.recyclerCall(name: String) =
            indexOfFirst { it.call()?.definingClass == RECYCLER_VIEW && it.call()?.name == name }
        val (cls, setup) = classes.singleMethod("call log RecyclerView setup") { _, m ->
            m.returnType == "V" && m.parameterTypes.isEmpty() && m.implementation != null &&
                m.instructions().let { insns -> calls.map { insns.recyclerCall(it) } }.let { it.all { index -> index >= 0 } && it == it.sorted() }
        }
        val label = "${cls.type}.${setup.name}()"
        val insns = setup.instructions()
        val touch = insns.recyclerCall("addOnItemTouchListener")
        val decoration = insns.recyclerCall("addItemDecoration")

        // The touch listener is the swipe helper (it fires ItemEvent.SWIPE_START).
        val listener = (insns[touch] as FiveRegisterInstruction).registerD
        val cast = insns.take(touch).last { it.opcode == Opcode.CHECK_CAST && (it as OneRegisterInstruction).registerA == listener }
        val helperType = ((cast as ReferenceInstruction).reference as TypeReference).type
        val helper = byType[helperType] ?: error("$label: swipe helper $helperType not found")
        check(helper.methods.any { "ItemEvent.SWIPE_START" in it.strings() }) { "$label: $helperType does not fire ItemEvent.SWIPE_START" }

        // invoke ...()Z, move-result vX, const vX 0, if-nez vX past the item decoration. 21t/22t are
        // the if-* formats.
        val branches = (0 until touch).filter { insns[it].opcode.format in setOf(Format.Format21t, Format.Format22t) }
        check(branches.size == 1) { "$label has ${branches.size} branches before its touch listener" }
        val guard = branches.single()
        val register = (insns[guard] as OneRegisterInstruction).registerA
        val forced = insns[guard - 1]
        check(insns[guard].opcode == Opcode.IF_NEZ && (forced.opcode == Opcode.CONST_4 || forced.opcode == Opcode.CONST_16) &&
            (forced as OneRegisterInstruction).registerA == register && (forced as NarrowLiteralInstruction).narrowLiteral == 0
        ) { "$label does not force v$register to 0 before its if-nez; got ${forced.opcode}" }
        val moveResult = insns[guard - 2]
        val toggle = insns[guard - 3].call()
        check(moveResult.opcode == Opcode.MOVE_RESULT && (moveResult as OneRegisterInstruction).registerA == register &&
            toggle?.returnType == "Z" && toggle.parameterTypes.isEmpty()
        ) { "$label: the forced register is not the result of a ()Z toggle read; got ${moveResult.opcode} $toggle" }
        check(insns.branchTarget(guard) > decoration) { "$label: the swipe guard no longer skips the item decoration" }
    }

    private fun assertUseSmsVerification(classes: List<ClassDef>) {
        // The selection branch now loads SMS where it loaded GOOGLE and returns it. Located by its
        // check-cast to OtpSmsApi right before, since the GOOGLE read the patch anchored on is gone.
        val selections = classes.methodsWhere { _, m ->
            m.returnType == "Ljava/lang/Object;" && m.parameterTypes.isEmpty() &&
                m.instructions().windowed(3).any { (cast, sms, ret) ->
                    cast.opcode == Opcode.CHECK_CAST &&
                        ((cast as ReferenceInstruction).reference as TypeReference).type == OTP_SMS_API &&
                        sms.opcode == Opcode.SGET_OBJECT && sms.field()?.definingClass == OTP_SMS_API && sms.field()?.name == "SMS" &&
                        ret.opcode == Opcode.RETURN_OBJECT &&
                        (ret as OneRegisterInstruction).registerA == (sms as OneRegisterInstruction).registerA
                }
        }
        check(selections.size == 1) { "expected one OtpSmsApi selection returning SMS, found ${selections.map { (c, m) -> "${c.type}.${m.name}" }}" }
        val (cls, method) = selections.single()
        check(method.instructions().none { it.opcode == Opcode.SGET_OBJECT && it.field()?.definingClass == OTP_SMS_API && it.field()?.name == "GOOGLE" }) {
            "${cls.type}.${method.name} still compares with OtpSmsApi.GOOGLE"
        }
    }

    private fun assertFixT9ContactSearch(classes: List<ClassDef>, byType: Map<String, ClassDef>) {
        // The RebuildAll helper and its incremental copy share the shape the patch anchors on.
        val helpers = classes.methodsWhere { _, m ->
            m.returnType == "V" && m.params() == listOf("Landroid/content/Context;") && AccessFlags.STATIC.isSet(m.accessFlags) &&
                m.strings().containsAll(listOf(T9_REBUILD_ALL_KEY, "RefreshT9MappingWorker"))
        }
        val (cloneClass, clone) = helpers.singleOrNull { (_, m) -> m.name == T9_INCREMENTAL_HELPER }
            ?: error("expected one $T9_INCREMENTAL_HELPER, found ${helpers.map { (c, m) -> "${c.type}.${m.name}" }}")
        val (helperClass, helper) = helpers.singleOrNull { (_, m) -> m.name != T9_INCREMENTAL_HELPER }
            ?: error("expected one RefreshT9MappingWorker helper, found ${helpers.map { (c, m) -> "${c.type}.${m.name}" }}")
        check(cloneClass.type == helperClass.type) { "$T9_INCREMENTAL_HELPER is in ${cloneClass.type}, not ${helperClass.type}" }
        val label = "${cloneClass.type}.$T9_INCREMENTAL_HELPER(Context)"
        check(AccessFlags.PUBLIC.isSet(clone.accessFlags) && AccessFlags.STATIC.isSet(clone.accessFlags)) { "$label is not public static" }

        fun Method.booleanLoads(name: String) = instructions().withIndex().filter { (_, insn) ->
            insn.opcode == Opcode.SGET_OBJECT && insn.field()?.definingClass == "Ljava/lang/Boolean;" && insn.field()?.name == name
        }.map { it.index }

        // The original still enqueues RebuildAll = TRUE; the copy is identical except for FALSE there.
        val original = helper.booleanLoads("TRUE")
        check(original.size == 1 && helper.booleanLoads("FALSE").isEmpty()) {
            "${helperClass.type}.${helper.name} (RebuildAll helper) was changed: TRUE at $original"
        }
        check(clone.booleanLoads("FALSE") == original && clone.booleanLoads("TRUE").isEmpty()) {
            "$label does not load Boolean.FALSE in place of TRUE; FALSE at ${clone.booleanLoads("FALSE")}, TRUE at ${clone.booleanLoads("TRUE")}"
        }
        check(clone.instructions().map { it.opcode } == helper.instructions().map { it.opcode } && clone.strings() == helper.strings()) {
            "$label is not a copy of ${helperClass.type}.${helper.name}"
        }

        // TruecallerInit.onCreate calls the copy with p0 right after super.onCreate.
        val onCreate = (byType[TRUECALLER_INIT] ?: error("$TRUECALLER_INIT not found")).method("onCreate", listOf("Landroid/os/Bundle;"))
        val insns = onCreate.instructions()
        val superCall = insns.indexOfFirst {
            (it.opcode == Opcode.INVOKE_SUPER || it.opcode == Opcode.INVOKE_SUPER_RANGE) && it.call()?.name == "onCreate"
        }
        check(superCall >= 0) { "TruecallerInit.onCreate does not call super.onCreate" }
        val call = insns.getOrNull(superCall + 1)
        val p0 = onCreate.implementation!!.registerCount - 2 // this + Bundle
        check(call?.opcode == Opcode.INVOKE_STATIC_RANGE && call.call()?.definingClass == helperClass.type &&
            call.call()?.name == T9_INCREMENTAL_HELPER && (call as RegisterRangeInstruction).startRegister == p0 && call.registerCount == 1
        ) { "TruecallerInit.onCreate does not call $label with p0 after super.onCreate; got ${call?.opcode} ${call?.call()}" }
    }

    private fun assertHideBusinessMedia(classes: List<ClassDef>) {
        // 1. The BusinessDetailsModel constructor replaces brandMedia (p6) with a new empty ArrayList.
        val (modelClass, _) = classes.singleMethod("BusinessDetailsModel.toString") { _, m ->
            m.name == "toString" && m.strings().any { it.startsWith("BusinessDetailsModel(description=") } &&
                ", brandMedia=" in m.strings()
        }
        val constructor = modelClass.method(
            "<init>",
            listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", CONTACT_TYPE, "Ljava/lang/String;", "Ljava/util/ArrayList;"),
        )
        val label = "${modelClass.type}.<init>"
        val p6 = constructor.implementation!!.registerCount - 1 // this + 6 single-register parameters, p6 last
        val insns = constructor.instructions()
        val list = insns.getOrNull(0)
        check(list?.opcode == Opcode.NEW_INSTANCE && (list as OneRegisterInstruction).registerA == p6 &&
            ((list as ReferenceInstruction).reference as TypeReference).type == "Ljava/util/ArrayList;"
        ) { "$label does not start with new-instance p6, ArrayList; got ${list?.opcode}" }
        val init = insns.getOrNull(1)
        check(init?.opcode == Opcode.INVOKE_DIRECT_RANGE && init.call()?.definingClass == "Ljava/util/ArrayList;" &&
            init.call()?.name == "<init>" && init.call()?.parameterTypes?.isEmpty() == true &&
            (init as RegisterRangeInstruction).startRegister == p6 && init.registerCount == 1
        ) { "$label does not construct the empty ArrayList in p6; got ${init?.opcode} ${init?.call()}" }
        val stored = insns.drop(2).single { it.opcode == Opcode.IPUT_OBJECT && it.field()?.type == "Ljava/util/ArrayList;" }
        check((stored as TwoRegisterInstruction).registerA == p6) { "$label does not store p6 as brandMedia" }

        // 2. BusinessDetailsScreen clears its video thumbnail slot (Function2, p4) first.
        val (screenClass, screen) = classes.singleMethod("BusinessDetailsScreen") { _, m ->
            AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" && m.params().size == 7 &&
                m.params()[1] == modelClass.type && m.params()[4] == "Lkotlin/jvm/functions/Function2;" &&
                m.strings().containsAll(listOf("BusinessDetailsScreen", "BusinessDesTitle"))
        }
        val p4 = screen.implementation!!.registerCount - 7 + 4 // static, 7 single-register parameters
        val clear = screen.instructions().getOrNull(0)
        check(clear?.opcode == Opcode.CONST_16 && (clear as OneRegisterInstruction).registerA == p4 &&
            (clear as NarrowLiteralInstruction).narrowLiteral == 0
        ) { "${screenClass.type}.${screen.name} does not start with const/16 p4, 0x0; got ${clear?.opcode}" }
        check(screen.instructions().drop(1).any { it.opcode == Opcode.MOVE_OBJECT_FROM16 && (it as TwoRegisterInstruction).registerB == p4 }) {
            "${screenClass.type}.${screen.name} no longer reads p4"
        }

        // 3. The verified business campaign toggles are checked in assertToggleOverrides.
    }

    private fun assertHideCallLogFilters(classes: List<ClassDef>, byType: Map<String, ClassDef>) {
        // 1. The filter row composable (static, void, 11 parameters, "filtersStartPadding") returns at once.
        val (rowClass, row) = classes.singleMethod("call log filter row") { _, m ->
            AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" && m.params().size == 11 &&
                m.params()[2] == "Lkotlin/jvm/functions/Function1;" && m.params()[4] == "I" &&
                m.params()[6] == "Lkotlin/jvm/functions/Function0;" && m.params()[7] == "Z" &&
                "filtersStartPadding" in m.strings()
        }
        assertReturnsEarlyVoid(row, label = "${rowClass.type}.${row.name} (call log filter row)")

        // 2. The filter setter TruecallerInit uses for the intent extras (the (FilterType)V call after
        // "set_missed_filter" and FilterType.MISSED in onNewIntent) loads FilterType.NONE into p1 first.
        fun Instruction.setterCall() = call()?.takeIf {
            it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf(CALL_LOG_FILTER_TYPE)
        }
        val init = byType[TRUECALLER_INIT] ?: error("$TRUECALLER_INIT not found")
        val onNewIntent = init.method("onNewIntent", listOf("Landroid/content/Intent;")).instructions()
        val extra = onNewIntent.indexOfFirst { it.stringOrNull() == "set_missed_filter" }
        check(extra >= 0) { "TruecallerInit.onNewIntent no longer reads set_missed_filter" }
        val missed = (extra until onNewIntent.size).first { onNewIntent[it].field()?.let { f ->
            f.definingClass == CALL_LOG_FILTER_TYPE && f.name == "MISSED"
        } == true }
        val setterRef = (missed until onNewIntent.size).firstNotNullOf { onNewIntent[it].setterCall() }
        val setter = (byType[setterRef.definingClass] ?: error("${setterRef.definingClass} not found"))
            .method(setterRef.name, listOf(CALL_LOG_FILTER_TYPE))
        val label = "${setterRef.definingClass}.${setterRef.name}(FilterType)"
        val p1 = setter.implementation!!.registerCount - 1 // this + one FilterType parameter
        val first = setter.instructions().getOrNull(0)
        check(first?.opcode == Opcode.SGET_OBJECT && (first as OneRegisterInstruction).registerA == p1 &&
            first.field()?.let { it.definingClass == CALL_LOG_FILTER_TYPE && it.name == "NONE" } == true
        ) { "$label does not start with sget-object p1, FilterType.NONE; got ${first?.opcode} ${first?.field()}" }
        // The forced value reaches the coroutine that reloads the list (a constructor taking the FilterType),
        // with nothing writing p1 before it (R8 reuses p1 for a constant afterwards).
        val insns = setter.instructions()
        val reload = insns.indexOfFirst { insn ->
            insn.call()?.let { it.name == "<init>" && CALL_LOG_FILTER_TYPE in it.parameterTypes.map(CharSequence::toString) } == true
        }
        check(reload > 0 && (insns[reload] as? FiveRegisterInstruction)?.let { five ->
            listOf(five.registerC, five.registerD, five.registerE, five.registerF, five.registerG).take(five.registerCount).contains(p1)
        } == true) { "$label does not pass p1 to the reload coroutine" }
        check((1 until reload).none { insns[it] is OneRegisterInstruction && insns[it].opcode.setsRegister() && (insns[it] as OneRegisterInstruction).registerA == p1 }) {
            "$label overwrites p1 before the reload coroutine"
        }
        // onCreate and onNewIntent select filters through this one setter only.
        for (name in listOf("onCreate", "onNewIntent")) {
            val calls = init.methods.filter { it.name == name }.flatMap { m -> m.instructions().mapNotNull { it.setterCall() } }
            check(calls.isNotEmpty() && calls.all { it.definingClass == setterRef.definingClass && it.name == setterRef.name }) {
                "TruecallerInit.$name selects filters through ${calls.map { "${it.definingClass}->${it.name}" }.distinct()}, not $label"
            }
        }
    }

    private fun assertDisableContactUpload(classes: List<ClassDef>) {
        // 1. Both saved-mobile-number queries (chat contact discovery, contacts' Premium status) pass
        // the selection ending in " AND 0" to ContentResolver.query; no method keeps the stock one.
        check(classes.methodsWhere { _, m -> MOBILE_NUMBERS_SELECTION in m.strings() }.isEmpty()) {
            "a method still queries with the stock mobile number selection"
        }
        val emptied = classes.methodsWhere { _, m -> "$MOBILE_NUMBERS_SELECTION AND 0" in m.strings() }
        check(emptied.size == 2) { "expected 2 emptied mobile number queries, found ${emptied.map { (c, m) -> "${c.type}.${m.name}" }}" }
        for ((cls, method) in emptied) {
            val label = "${cls.type}.${method.name} (mobile number query)"
            val insns = method.instructions()
            val selections = insns.indices.filter { insns[it].stringOrNull() == "$MOBILE_NUMBERS_SELECTION AND 0" }
            check(selections.size == 1) { "$label loads the emptied selection ${selections.size} times" }
            val register = (insns[selections.single()] as OneRegisterInstruction).registerA
            val query = insns.drop(selections.single() + 1).firstOrNull { it.arguments()?.contains(register) == true }
            check(query?.call()?.definingClass == "Landroid/content/ContentResolver;" && query.call()?.name == "query" &&
                query.arguments()?.getOrNull(3) == register
            ) { "$label does not pass the emptied selection to ContentResolver.query; got ${query?.opcode} ${query?.call()}" }
        }

        // 2. and 3. "featureCallAssistantNumberSync" and "featureContactEditorNameSuggestion" are
        // checked in assertToggleOverrides; both are still read through the resolver.
        for (key in listOf("featureCallAssistantNumberSync", "featureContactEditorNameSuggestion")) {
            check(classes.methodsWhere { _, m ->
                key in m.strings() && m.instructions().any {
                    it.call()?.returnType == "Z" && it.call()?.parameterTypes?.map(CharSequence::toString) == listOf("Ljava/lang/String;", FEATURE_STATE)
                }
            }.isNotEmpty()) { "no method reads $key through the toggle resolver" }
        }
    }

    private fun assertShowCallerNumber(classes: List<ClassDef>, byType: Map<String, ClassDef>, apk: File) {
        // 1. The source model (CallLogHistoryEntryData) and the row (HistoryEntry), mapped by their
        // toString labels as the patch does.
        val (sourceClass, sourceToString) = classes.singleMethod("CallLogHistoryEntryData.toString") { _, m ->
            m.name == "toString" && m.parameterTypes.isEmpty() &&
                m.strings().any { it.startsWith("CallLogHistoryEntryData(primaryHistoryEventId=") }
        }
        val sourceFields = toStringFields(sourceToString, sourceClass.type) { byType[it] }.groupBy({ it.first }, { it.second })
        fun sourceField(name: String, type: String): FieldReference {
            val fields = sourceFields[name].orEmpty().distinctBy { "${it.name}:${it.type}" }
            check(fields.size == 1 && fields.single().type == type) { "${sourceClass.type}.toString prints $name from $fields, expected one $type" }
            return fields.single()
        }
        val phonebookId = sourceField("phonebookId", "J")
        val number = sourceField("normalisedNumber", "Ljava/lang/String;")
        val countryCode = sourceField("countryCode", "Ljava/lang/String;")
        val callerName = sourceField("name", "Ljava/lang/String;")
        val isBlocked = sourceField("isBlocked", "Z")
        sourceField("isSpam", "Z")
        sourceField("spamScoreLabel", "Ljava/lang/String;")
        sourceField("blockReasonLabel", "Ljava/lang/String;")

        val (rowClass, rowToString) = classes.singleMethod("HistoryEntry.toString") { _, m ->
            m.name == "toString" && m.parameterTypes.isEmpty() && m.strings().any { it.startsWith("HistoryEntry(id=") } &&
                ", subtitleLabel=" in m.strings()
        }
        val rowFields = toStringFields(rowToString, rowClass.type) { byType[it] }.toMap()
        val subtitle = rowFields["subtitleLabel"] ?: error("${rowClass.type}.toString prints no subtitleLabel")
        val labelType = subtitle.type

        // 2. The helper: morpheCallLogSubtitle(entry, label): label, public static on the mapper's class.
        val (mapperClass, helper) = classes.singleMethod(CALL_LOG_SUBTITLE_HELPER) { _, m -> m.name == CALL_LOG_SUBTITLE_HELPER }
        val label = "${mapperClass.type}.$CALL_LOG_SUBTITLE_HELPER"
        check(helper.params() == listOf(sourceClass.type, labelType) && helper.returnType == labelType &&
            AccessFlags.PUBLIC.isSet(helper.accessFlags) && AccessFlags.STATIC.isSet(helper.accessFlags)
        ) { "$label has signature ${helper.params()} -> ${helper.returnType}" }
        val insns = helper.instructions()
        val p0 = helper.implementation!!.registerCount - 2
        val p1 = p0 + 1
        val keep = insns.lastIndex
        check(insns[keep].opcode == Opcode.RETURN_OBJECT && (insns[keep] as OneRegisterInstruction).registerA == p1) {
            "$label does not end with return-object p1"
        }
        // Each check reads its field from p0, and its first branch after the read keeps the label.
        fun Instruction.reads(expected: FieldReference, opcode: Opcode) = this.opcode == opcode && field()?.let {
            it.definingClass == expected.definingClass && it.name == expected.name && it.type == expected.type
        } == true && (this as TwoRegisterInstruction).registerB == p0
        fun firstBranchAfter(index: Int) = (index + 1..keep).first { insns[it].opcode.format in setOf(Format.Format21t, Format.Format22t) }
        for ((field, opcode) in listOf(
            phonebookId to Opcode.IGET_WIDE,
            isBlocked to Opcode.IGET_BOOLEAN,
            callerName to Opcode.IGET_OBJECT,
            number to Opcode.IGET_OBJECT,
        )) {
            val read = insns.indexOfFirst { it.reads(field, opcode) }
            check(read >= 0) { "$label does not read ${field.name}" }
            check(insns.branchTarget(firstBranchAfter(read)) == keep) { "$label does not keep the label after reading ${field.name}" }
        }
        val phonebookRead = insns.indexOfFirst { it.reads(phonebookId, Opcode.IGET_WIDE) }
        check(insns[phonebookRead + 2].opcode == Opcode.CMP_LONG && insns[firstBranchAfter(phonebookRead)].opcode == Opcode.IF_NEZ) {
            "$label does not keep the label for phonebookId != 0"
        }
        // A blank name or number (TextUtils.getTrimmedLength == 0) keeps the label.
        val trimmed = insns.indices.filter {
            insns[it].call()?.let { c -> c.definingClass == "Landroid/text/TextUtils;" && c.name == "getTrimmedLength" } == true
        }
        check(trimmed.size == 2 && trimmed.all { insns[firstBranchAfter(it)].opcode == Opcode.IF_EQZ && insns.branchTarget(firstBranchAfter(it)) == keep }) {
            "$label does not keep the label for a blank name or number"
        }
        // A label that is not the text label (a resource label: recording, video, WhatsApp, ...) is kept.
        val instanceOf = insns.indices.singleOrNull { insns[it].opcode == Opcode.INSTANCE_OF } ?: error("$label has no single instance-of")
        val textType = ((insns[instanceOf] as ReferenceInstruction).reference as TypeReference).type
        check((insns[instanceOf] as TwoRegisterInstruction).registerB == p1 && insns[instanceOf + 1].opcode == Opcode.IF_EQZ &&
            insns.branchTarget(instanceOf + 1) == keep
        ) { "$label does not keep labels that are not $textType" }
        val textClass = byType[textType] ?: error("$textType not found")
        check(textClass.superclass == labelType && textClass.methods.any { m -> m.name == "toString" && m.strings().any { it.startsWith("Text(text=") } }) {
            "$textType is not the text subtitle label (superclass ${textClass.superclass})"
        }
        // The number is formatted for the row's country and joined after " · ".
        check(insns.any { it.reads(countryCode, Opcode.IGET_OBJECT) }) { "$label does not read ${countryCode.name}" }
        check(insns.any { it.call()?.let { c -> c.definingClass == "Landroid/telephony/PhoneNumberUtils;" && c.name == "formatNumber" } == true }) {
            "$label does not call PhoneNumberUtils.formatNumber"
        }
        check(insns.any { it.stringOrNull() == CALL_LOG_NUMBER_SEPARATOR }) { "$label does not join with \"$CALL_LOG_NUMBER_SEPARATOR\"" }
        // The new text label is built and returned right before the keep exit.
        val newText = insns[keep - 3]
        val textInit = insns[keep - 2].call()
        check(newText.opcode == Opcode.NEW_INSTANCE && ((newText as ReferenceInstruction).reference as TypeReference).type == textType &&
            textInit?.definingClass == textType && textInit.name == "<init>" && textInit.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") &&
            insns[keep - 1].opcode == Opcode.RETURN_OBJECT
        ) { "$label does not return a new $textType" }
        // One catch-all for Exception over the whole body, handled by the keep exit.
        val offsets = insns.runningFold(0) { offset, instruction -> offset + instruction.codeUnits }
        val tryBlock = helper.implementation!!.tryBlocks.singleOrNull() ?: error("$label has no single try block")
        val handler = tryBlock.exceptionHandlers.singleOrNull()
        check(tryBlock.startCodeAddress == 0 && tryBlock.codeUnitCount == offsets[keep] &&
            handler?.exceptionType == "Ljava/lang/Exception;" && handler.handlerCodeAddress == offsets[keep]
        ) { "$label: the try block does not cover the body with an Exception handler at the keep exit" }

        // 3. The mapper calls the helper once, before building the row: label = helper(entry, label).
        val callers = classes.methodsWhere { _, m -> m.instructions().any { it.call()?.name == CALL_LOG_SUBTITLE_HELPER } }
        val (callerClass, mapper) = callers.singleOrNull()
            ?: error("expected one caller of $label, found ${callers.map { (c, m) -> "${c.type}.${m.name}" }}")
        check(callerClass.type == mapperClass.type && mapper.params() == listOf("Ljava/util/List;")) { "$label is called from ${callerClass.type}.${mapper.name}" }
        val where = "${mapperClass.type}.${mapper.name}(List)"
        val minsns = mapper.instructions()
        val call = minsns.indices.single { minsns[it].call()?.name == CALL_LOG_SUBTITLE_HELPER }
        val construction = minsns.indices.single { minsns[it].call()?.let { c -> c.definingClass == rowClass.type && c.name == "<init>" } == true }
        check(call < construction && minsns[construction].opcode == Opcode.INVOKE_DIRECT_RANGE) { "$where does not call $label before building the row" }
        // The row constructor stores its subtitle parameter (a plain parameter register) into subtitleLabel.
        val constructorParams = minsns[construction].call()!!.parameterTypes.map(CharSequence::toString)
        val constructor = rowClass.method("<init>", constructorParams)
        val widths = constructorParams.map { if (it == "J" || it == "D") 2 else 1 }
        val firstParameter = constructor.implementation!!.registerCount - widths.sum()
        val subtitleStore = constructor.instructions().single {
            it.opcode == Opcode.IPUT_OBJECT && it.field()?.name == subtitle.name && it.field()?.definingClass == rowClass.type
        }
        val subtitleParam = widths.runningFold(firstParameter) { register, width -> register + width }
            .indexOf((subtitleStore as TwoRegisterInstruction).registerA)
        check(subtitleParam in constructorParams.indices && constructorParams[subtitleParam] == labelType) {
            "${rowClass.type}.<init> does not take the subtitle label as a parameter"
        }
        val labelRegister = (minsns[construction] as RegisterRangeInstruction).startRegister + 1 + widths.take(subtitleParam).sum()
        val entryCast = minsns.first { it.opcode == Opcode.CHECK_CAST && ((it as ReferenceInstruction).reference as TypeReference).type == sourceClass.type }
        val entryRegister = (entryCast as OneRegisterInstruction).registerA

        val (labelIn, entryIn, invoke, result, labelOut) = minsns.subList(call - 2, call + 3)
        val scratchLabel = (labelIn as TwoRegisterInstruction).registerA
        val scratchEntry = (entryIn as TwoRegisterInstruction).registerA
        val helperCall = invoke.call()
        check(labelIn.opcode == Opcode.MOVE_OBJECT_FROM16 && labelIn.registerB == labelRegister &&
            entryIn.opcode == Opcode.MOVE_OBJECT_FROM16 && entryIn.registerB == entryRegister &&
            invoke.opcode == Opcode.INVOKE_STATIC && helperCall?.definingClass == mapperClass.type &&
            helperCall.parameterTypes.map(CharSequence::toString) == listOf(sourceClass.type, labelType) && helperCall.returnType == labelType &&
            (invoke as FiveRegisterInstruction).registerCount == 2 && invoke.registerC == scratchEntry && invoke.registerD == scratchLabel &&
            result.opcode == Opcode.MOVE_RESULT_OBJECT && (result as OneRegisterInstruction).registerA == scratchLabel &&
            labelOut.opcode == Opcode.MOVE_OBJECT_FROM16 && (labelOut as TwoRegisterInstruction).registerA == labelRegister &&
            labelOut.registerB == scratchLabel
        ) {
            "$where does not set v$labelRegister = $CALL_LOG_SUBTITLE_HELPER(v$entryRegister, v$labelRegister) through two scratch registers; " +
                "got ${minsns.subList(call - 2, call + 3).map { it.opcode }}"
        }
        check((call + 3 until construction).none { minsns[it].opcode.setsRegister() && (minsns[it] as? OneRegisterInstruction)?.registerA == labelRegister }) {
            "$where overwrites the label between $CALL_LOG_SUBTITLE_HELPER and the row"
        }

        // 4. Apart from those five instructions the mapper is unchanged, and every branch that went to
        // the join now runs them first.
        val stockMapper = ZipFile(apk).use { zip ->
            zip.entries().toList().filter { Regex("classes\\d*\\.dex").matches(it.name) }.firstNotNullOfOrNull { entry ->
                val bytes = zip.getInputStream(entry).use { it.readBytes() }
                DexBackedDexFile(Opcodes.forApi(36), ByteBuffer.wrap(bytes)).classes.firstOrNull { it.type == mapperClass.type }
            }
        }?.methods?.single { it.name == mapper.name && it.params() == mapper.params() && it.returnType == mapper.returnType }
            ?: error("stock ${mapperClass.type} not found")
        val join = minsns.take(call - 2).count { it.opcode != Opcode.NOP }
        val patched = mapper.normalizedInstructions()
        val stock = stockMapper.normalizedInstructions { target -> if (target <= join) target else target + 5 }
        check(stock.count { it.endsWith("-> $join") } >= 2) { "stock $where has fewer than two branches to the join" }
        val expected = stock.take(join) + patched.subList(join, join + 5) + stock.drop(join)
        check(patched == expected) {
            val diff = patched.indices.firstOrNull { patched[it] != expected.getOrNull(it) }
            "$where differs from stock beyond the five instructions inserted at $join; first difference at $diff: " +
                "${diff?.let { patched[it] }} vs ${diff?.let { expected.getOrNull(it) }}"
        }
    }

    /**
     * Each non-NOP instruction as text: opcode (goto widths merged), registers, reference, literal and
     * branch target as a non-NOP index, passed through [target].
     */
    private fun Method.normalizedInstructions(target: (Int) -> Int = { it }): List<String> {
        val insns = instructions()
        val offsets = insns.runningFold(0) { offset, instruction -> offset + instruction.codeUnits }
        val indexAt = offsets.withIndex().associate { (index, offset) -> offset to index }
        val kept = insns.indices.filter { insns[it].opcode != Opcode.NOP }
        val rank = kept.withIndex().associate { (k, index) -> index to k }
        val gotos = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
        return kept.map { index ->
            val insn = insns[index]
            buildString {
                append(if (insn.opcode in gotos) "goto" else insn.opcode.toString())
                when (insn) {
                    is RegisterRangeInstruction -> append(" {v${insn.startRegister} +${insn.registerCount}}")
                    is FiveRegisterInstruction -> append(
                        listOf(insn.registerC, insn.registerD, insn.registerE, insn.registerF, insn.registerG)
                            .take(insn.registerCount).joinToString(prefix = " {", postfix = "}"),
                    )
                    is ThreeRegisterInstruction -> append(" v${insn.registerA}, v${insn.registerB}, v${insn.registerC}")
                    is TwoRegisterInstruction -> append(" v${insn.registerA}, v${insn.registerB}")
                    is OneRegisterInstruction -> append(" v${insn.registerA}")
                }
                (insn as? ReferenceInstruction)?.let { append(" ").append(ReferenceUtil.getReferenceString(it.reference)) }
                (insn as? WideLiteralInstruction)?.let { append(" #").append(it.wideLiteral) }
                (insn as? SwitchPayload)?.let { append(" keys=").append(it.switchElements.map { element -> element.key }) }
                if (insn is OffsetInstruction) append(" -> ").append(target(rank.getValue(indexAt.getValue(offsets[index] + insn.codeOffset))))
            }
        }
    }
}
