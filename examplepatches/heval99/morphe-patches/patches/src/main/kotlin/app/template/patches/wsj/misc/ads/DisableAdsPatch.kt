package app.template.patches.wsj.misc.ads

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_WSJ
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import app.template.patches.shared.misc.ads.neutraliseMobileAdsStatics
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ADS = "Lcom/dowjones/advertisement/"
private const val SECTION_STRATEGY = "${ADS}SectionAdPlacementStrategyContract;"
private const val SECTION_PLACEMENT_MODEL = "${ADS}data/model/SectionAdPlacementModel;"
private const val ARTICLE_STRATEGY = "${ADS}util/ArticleAdPlacementStrategy;"
private const val LIVE_COVERAGE_STRATEGY = "${ADS}util/LiveCoveragePlacementStrategy;"
private const val DISCOVER_VIEW_MODEL = "Lcom/dowjones/section/ui/DiscoverScreenViewModel;"
private const val AD_STORE = "${ADS}uac/AdManagerAdViewStore;"
private const val AD_PADDING = "${ADS}ui/component/AdPaddingDefaults;"
private const val FLAGS = "${ADS}config/UACFeatureFlagRepository;"
private const val UAC_MODULE = "${ADS}di/UACModule;"
private const val FUNCTION3 = "Lkotlin/jvm/functions/Function3;"
private const val DJ_MOBILE_ADS = "${ADS}util/DJMobileAds;"
private const val VIDEO_ADS_HANDLER = "Lcom/dowjones/video/VideoPlayerAdsHandler;"
private const val MEDIA_ITEM_BUILDER = "Landroidx/media3/common/MediaItem\$Builder;"
private const val GMA = "Lcom/google/android/gms/ads/"
private const val MUTABLE_STATE_FLOW = "Lkotlinx/coroutines/flow/MutableStateFlow;"

// The Wall Street Journal shows Google Ad Manager display and native ads (with Amazon TAM, Ozone /
// Prebid and Permutive feeding the targeting) as Compose slots from com.dowjones.advertisement,
// for subscribers too, plus IMA pre-rolls in the media3 video player and (since 15.x) video
// interstitials in the Discover feed. All of the ad wiring lives in kept (unobfuscated) classes:
// placement strategies, the ad view store, the feature flag repository, the video ads handler and
// the Discover view model. Compose functions carry hashed suffixes, so they are
// never anchored on and no @Composable body is touched; every hook changes a plain method the
// composables read. Every hook is mandatory.
//
// Not covered, because it is not in the app's bytecode: Megaphone podcast ads are stitched into
// the audio server-side (MegaphoneAds only picks between two server URLs), and any ad slots inside
// web pages come with the HTML.
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_WSJ)

    execute {
        // 1. Section fronts, markets, For You and Magazine: every feed asks the section placement
        // strategy for its ad slots (getAdSlotConfigList(cardCount, isSingleModule, placementModel),
        // one AdSlotConfig per card index that gets an ad after it; SectionAdViewmodel is the only
        // caller), and SectionPageAdWithPrefetch only composes the ad, its loading skeleton and the
        // prefetch for an index in that list. Every implementation answers an empty list, so no
        // slot is ever emitted. (Up to 6.43 this was SectionAdPlacementStrategy's ad indices
        // method; 15.11 split it into a contract plus a remote placement registry.)
        mutableClassDefByOrNull(SECTION_STRATEGY) ?: throw PatchException("Disable ads: $SECTION_STRATEGY not found")
        var sectionHooks = 0
        classDefForEach { classDef ->
            if (SECTION_STRATEGY !in classDef.interfaces) return@classDefForEach
            mutableClassDefBy(classDef).methods.filter { it.isSectionAdSlots() }.forEach { method ->
                method.addInstructionsChecked(
                    0,
                    """
                        invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                        move-result-object v0
                        return-object v0
                    """,
                )
                sectionHooks++
            }
        }
        if (sectionHooks == 0) {
            throw PatchException("Disable ads: no $SECTION_STRATEGY implementation returns ad slots")
        }

        // 2. Articles: the article page asks the strategy, paragraph by paragraph, whether an ad
        // goes after it (shouldInsertAd(index, windowWidthSizeClass), with a value-class suffix)
        // and only builds ad items for the paragraphs answered true. It always answers false; the
        // strategy's own "last ad paragraph" lookup then finds none either.
        val shouldInsertAd = mutableClassDefBy(ARTICLE_STRATEGY).methods.filter {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Z" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("I", "I") && it.implementation != null
        }
        if (shouldInsertAd.size != 1) {
            throw PatchException("Disable ads: expected one (II)Z on $ARTICLE_STRATEGY, found ${shouldInsertAd.size}")
        }
        shouldInsertAd.single().returnEarly(false)

        // 3. Slots outside the strategies (the stock quote page's fixed slot) and any future
        // ones. Each slot reads a per-identifier StateFlow from the ad view store: null shows the
        // grey skeleton and requests an ad, an AdManagerAdView / native ad is rendered, and any
        // other value composes nothing (and createAd skips the request for a non-null value).
        // The store only ever publishes Unit: every MutableStateFlow it creates starts with Unit
        // and every setValue (store a loaded ad, reset on failure or dispose) stores Unit. So
        // every slot is empty and never requests, instead of showing an endless skeleton.
        val store = mutableClassDefBy(AD_STORE)
        var flowsCreated = 0
        var flowsSet = 0
        store.methods.filter { it.implementation != null }.forEach { method ->
            method.publishUnitOnly().let { (created, set) ->
                flowsCreated += created
                flowsSet += set
            }
        }
        if (flowsCreated == 0 || flowsSet == 0) {
            throw PatchException(
                "Disable ads: $AD_STORE no longer creates and sets its ad flows " +
                    "($flowsCreated MutableStateFlow, $flowsSet setValue)"
            )
        }

        // 4. The empty slot's column still carries the ad's vertical padding; the only float
        // getter on AdPaddingDefaults (getVerticalPadding, value-class suffix) answers 0.dp so
        // the slot takes no height.
        val padding = mutableClassDefBy(AD_PADDING).methods.filter {
            it.returnType == "F" && it.parameterTypes.isEmpty() && it.implementation != null &&
                !AccessFlags.STATIC.isSet(it.accessFlags)
        }
        if (padding.size != 1) {
            throw PatchException("Disable ads: expected one float getter on $AD_PADDING, found ${padding.size}")
        }
        padding.single().addInstructionsChecked(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        // 5. The slot's column also composes the "ADVERTISEMENT" caption before the ad branch, so
        // it showed above the emptied stock quote slot. The caption comes from UACModule's ad title
        // lambda (getAdTitle, the default for every DJ ad component); UACModule's own default is an
        // empty composable lambda, and the app replaces it at startup through UACModule.Builder
        // with one drawing the caption. Every static setter of that field returns at once, so the
        // empty default stays. Found by shape: the field read by UACModule's only Function3 getter.
        val uacModule = mutableClassDefBy(UAC_MODULE)
        val titleGetter = uacModule.methods.filter {
            it.returnType == FUNCTION3 && it.parameterTypes.isEmpty() && it.implementation != null
        }
        if (titleGetter.size != 1) {
            throw PatchException("Disable ads: expected one Function3 getter on $UAC_MODULE, found ${titleGetter.size}")
        }
        val titleField = titleGetter.single().instructions
            .firstOrNull { it.opcode == Opcode.SGET_OBJECT }
            ?.let { (it as ReferenceInstruction).reference as FieldReference }
            ?.takeIf { it.definingClass == UAC_MODULE && it.type == FUNCTION3 }
            ?: throw PatchException("Disable ads: the $UAC_MODULE ad title getter reads no static Function3 field")
        val titleSetters = uacModule.methods.filter { method ->
            AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
                method.params() == listOf(FUNCTION3) && method.implementation != null &&
                method.instructions.any { it.writesField(titleField) }
        }
        if (titleSetters.isEmpty()) {
            throw PatchException("Disable ads: no static $UAC_MODULE setter writes ${titleField.name}")
        }
        titleSetters.forEach { it.returnEarly() }

        // 6. Remote feature flags: native ads in sections and articles (otherwise slots ask for
        // native formats too) and the Ozone / Prebid header-bidding SDK.
        val flags = mutableClassDefBy(FLAGS).methods
        for (name in listOf("getAreNativeAdsInSectionsEnabled", "getAreNativeAdsInArticlesEnabled", "isOzoneSDKEnabled")) {
            val getter = flags.singleOrNull {
                it.name == name && it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null
            } ?: throw PatchException("Disable ads: no concrete $FLAGS->$name()Z")
            getter.returnEarly(false)
        }

        // 7. Never initialize Google Mobile Ads: DJMobileAds.initialize (the app's only
        // MobileAds.initialize call) returns at once, and every MobileAds static void is a no-op
        // (AGENTS.md rule 9). The app's other MobileAds call is registerWebView, from the article
        // and embedded web views.
        val djInitialize = mutableClassDefBy(DJ_MOBILE_ADS).methods.singleOrNull {
            it.name == "initialize" && it.returnType == "V" && it.parameterTypes.isEmpty() && it.implementation != null
        } ?: throw PatchException("Disable ads: no concrete $DJ_MOBILE_ADS->initialize()V")
        djInitialize.returnEarly()
        neutraliseMobileAdsStatics("initialize", "registerWebView")

        // Backstop at the SDK: banner / Ad Manager view loads (AdManagerAdView.loadAd does not call
        // super) and native loads (including the Discover video interstitial, a native custom
        // format loaded through AdLoader, see step 10). The app loads no GMA interstitial, rewarded
        // or app-open ad; only the unused Prebid GAM wrappers reference those formats.
        val gmaHooks = mapOf(
            "${GMA}BaseAdView;" to setOf("loadAd"),
            "${GMA}admanager/AdManagerAdView;" to setOf("loadAd"),
            "${GMA}AdLoader;" to setOf("loadAd", "loadAds"),
        )
        for ((owner, names) in gmaHooks) {
            val methods = mutableClassDefByOrNull(owner)?.methods
                ?: throw PatchException("Disable ads: $owner not found")
            for (name in names) {
                // returnEarly() is void-only and NPEs on abstract declarations.
                val targets = methods.filter { it.name == name && it.returnType == "V" && it.implementation != null }
                if (targets.isEmpty()) throw PatchException("Disable ads: no concrete void $owner->$name")
                targets.forEach { it.returnEarly() }
            }
        }

        // 8. Video pre-rolls. The video player awaits an IMA ad tag from the ads handler, then
        // builds an AdsMediaSource with the handler's ImaAdsLoader when both are present. Every
        // VideoPlayerAdsHandler implementation answers a completed null ad tag (no ad request;
        // the player's existing "no ad" path) and a null ads loader. The older DJExoVideoPlayer
        // path puts the ad tag on the MediaItem, so media3's MediaItem.Builder ignores
        // setAdsConfiguration / setAdTagUri: no MediaItem ever carries an ad configuration.
        mutableClassDefByOrNull(VIDEO_ADS_HANDLER) ?: throw PatchException("Disable ads: $VIDEO_ADS_HANDLER not found")
        var adTagHooks = 0
        var adsLoaderHooks = 0
        classDefForEach { classDef ->
            if (VIDEO_ADS_HANDLER !in classDef.interfaces) return@classDefForEach
            mutableClassDefBy(classDef).methods.filter { it.implementation != null }.forEach { method ->
                when {
                    method.isAdTagRequest() -> {
                        method.addInstructionsChecked(
                            0,
                            """
                                const/4 v0, 0x0
                                invoke-static {v0}, Lkotlinx/coroutines/CompletableDeferredKt;->CompletableDeferred(Ljava/lang/Object;)Lkotlinx/coroutines/CompletableDeferred;
                                move-result-object v0
                                return-object v0
                            """,
                        )
                        adTagHooks++
                    }
                    method.isAdsLoaderGetter() -> {
                        method.addInstructionsChecked(
                            0,
                            """
                                const/4 v0, 0x0
                                return-object v0
                            """,
                        )
                        adsLoaderHooks++
                    }
                }
            }
        }
        if (adTagHooks == 0 || adsLoaderHooks == 0) {
            throw PatchException(
                "Disable ads: no $VIDEO_ADS_HANDLER implementation of the ad tag request ($adTagHooks) " +
                    "or the ads loader getter ($adsLoaderHooks)"
            )
        }

        val builderSetters = mutableClassDefBy(MEDIA_ITEM_BUILDER).methods.filter {
            (it.name == "setAdsConfiguration" || it.name == "setAdTagUri") &&
                it.returnType == MEDIA_ITEM_BUILDER && it.implementation != null
        }
        if (builderSetters.none { it.name == "setAdsConfiguration" }) {
            throw PatchException("Disable ads: no concrete $MEDIA_ITEM_BUILDER->setAdsConfiguration")
        }
        builderSetters.forEach { it.addInstructionsChecked(0, "return-object p0") }

        // 9. Live coverage (new in 15.x): the live coverage screen puts an ad before every third
        // card. Every check (adSlotForCard, isFinalAdSlot and the screen's own lambdas) goes
        // through the strategy's only (I)Z, shouldInsertAdBeforeCard, which always answers false.
        val liveCoverageGate = mutableClassDefBy(LIVE_COVERAGE_STRATEGY).methods.filter {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Z" &&
                it.params() == listOf("I") && it.implementation != null
        }
        if (liveCoverageGate.size != 1) {
            throw PatchException("Disable ads: expected one (I)Z on $LIVE_COVERAGE_STRATEGY, found ${liveCoverageGate.size}")
        }
        liveCoverageGate.single().returnEarly(false)

        // 10. Discover vertical video feed (new in 15.x): onFeedData puts an interstitial ad page
        // (DiscoverVideoInterstitialAd, a full-screen native video ad) after every N videos, only
        // when N > 0. N comes from the DiscoverAds remote config and lives in the view model's only
        // int field; every store to it stores 0, so the feed holds videos only and no ad page is
        // ever shown or loaded.
        val discover = mutableClassDefBy(DISCOVER_VIEW_MODEL)
        val adFrequency = discover.fields.singleOrNull {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == "I"
        } ?: throw PatchException("Disable ads: expected one int field (ad frequency) on $DISCOVER_VIEW_MODEL")
        val onFeedData = discover.methods.singleOrNull { it.name == "onFeedData" && it.implementation != null }
            ?: throw PatchException("Disable ads: no concrete $DISCOVER_VIEW_MODEL->onFeedData")
        if (onFeedData.instructions.none { it.opcode == Opcode.IGET && it.isField(adFrequency) }) {
            throw PatchException("Disable ads: $DISCOVER_VIEW_MODEL.onFeedData no longer reads ${adFrequency.name}")
        }
        var frequencyStores = 0
        discover.methods.filter { it.implementation != null }.forEach { method ->
            val stores = method.instructions.withIndex()
                .filter { (_, insn) -> insn.opcode == Opcode.IPUT && insn.isField(adFrequency) }
                .map { (index, insn) -> index to (insn as TwoRegisterInstruction).registerA }
            // Descending, so an insert never shifts an index still to be visited.
            for ((index, register) in stores.reversed()) {
                method.requireNoBranchTargetAt(index, "zero the Discover ad frequency")
                method.addInstructionChecked(index, "const/4 v$register, 0x0")
                frequencyStores++
            }
        }
        if (frequencyStores == 0) {
            throw PatchException("Disable ads: nothing in $DISCOVER_VIEW_MODEL stores ${adFrequency.name}")
        }
    }
}

private fun Instruction.isField(field: FieldReference): Boolean {
    val ref = (this as? ReferenceInstruction)?.reference as? FieldReference ?: return false
    return ref.definingClass == field.definingClass && ref.name == field.name && ref.type == field.type
}

private fun Method.params() = parameterTypes.map(CharSequence::toString)

private fun Instruction.writesField(field: FieldReference): Boolean {
    if (opcode != Opcode.SPUT_OBJECT) return false
    val ref = (this as ReferenceInstruction).reference as FieldReference
    return ref.definingClass == field.definingClass && ref.name == field.name && ref.type == field.type
}

private fun Method.isSectionAdSlots() = implementation != null &&
    returnType == "Ljava/util/List;" && params() == listOf("I", "Z", SECTION_PLACEMENT_MODEL)

private fun Method.isAdTagRequest() = returnType == "Lkotlinx/coroutines/Deferred;" &&
    params() == listOf("Lcom/dowjones/query/fragment/VideoData;", "Z", "Z")

private fun Method.isAdsLoaderGetter() = returnType == "Landroidx/media3/exoplayer/ima/ImaAdsLoader;" &&
    params() == listOf("Ljava/lang/String;", "Landroidx/media3/common/Player;", "Landroid/net/Uri;")

private fun Instruction.registers(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}

// Overwrites the value register with Unit.INSTANCE right before each StateFlowKt.MutableStateFlow(Object)
// and MutableStateFlow.setValue(Object) call. Returns how many of each were changed.
private fun MutableMethod.publishUnitOnly(): Pair<Int, Int> {
    var created = 0
    var set = 0
    val calls = instructions.withIndex().mapNotNull { (index, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
        val value = when {
            ref.definingClass == "Lkotlinx/coroutines/flow/StateFlowKt;" && ref.name == "MutableStateFlow" &&
                ref.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;") -> {
                created++
                instruction.registers().getOrNull(0)
            }
            ref.definingClass == MUTABLE_STATE_FLOW && ref.name == "setValue" -> {
                set++
                instruction.registers().getOrNull(1)
            }
            else -> return@mapNotNull null
        } ?: throw PatchException("$definingClass.$name: unreadable value register at $index")
        index to value
    }
    // Descending, so an insert never shifts an index still to be visited.
    for ((index, register) in calls.reversed()) {
        addInstructionChecked(index, "sget-object v$register, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;")
    }
    return created to set
}
