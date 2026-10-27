import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "wsj.reader_sp"
private const val ADS = "Lcom/dowjones/advertisement/"
private const val SECTION_STRATEGY = "${ADS}SectionAdPlacementStrategyContract;"
private const val VIDEO_ADS_HANDLER = "Lcom/dowjones/video/VideoPlayerAdsHandler;"
private const val MEDIA_ITEM_BUILDER = "Landroidx/media3/common/MediaItem\$Builder;"
private const val GMA = "Lcom/google/android/gms/ads/"

class WsjSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.params() = parameterTypes.map(CharSequence::toString)

    private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference

    // The value register is overwritten with Unit.INSTANCE right before the call.
    private fun assertUnitBefore(instructions: List<Instruction>, index: Int, register: Int, label: String) {
        val previous = instructions.getOrNull(index - 1)
        val field = (previous as? ReferenceInstruction)?.reference as? FieldReference
        assertTrue(
            previous?.opcode == Opcode.SGET_OBJECT && field?.definingClass == "Lkotlin/Unit;" &&
                field.name == "INSTANCE" && (previous as OneRegisterInstruction).registerA == register,
            "$label: the value v$register is not set to Unit.INSTANCE first; previous is ${previous?.opcode} $field"
        )
    }

    @Test
    fun `Disable ads removes every ad slot, the SDK start, video pre-rolls and Discover interstitials`() {
        val root = repoRoot()
        val apk = File(root, "apks/wsj/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "15.11.0.42207",
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        fun cls(type: String) = classes.firstOrNull { it.type == type } ?: error("$type not found in emitted dexes")

        // 1. Every SectionAdPlacementStrategyContract implementation returns Collections.emptyList()
        // from getAdSlotConfigList(cardCount, isSingleModule, placementModel).
        val sectionStrategies = classes.filter { SECTION_STRATEGY in it.interfaces }
        check(sectionStrategies.isNotEmpty()) { "no $SECTION_STRATEGY implementation" }
        for (strategy in sectionStrategies) {
            val slots = strategy.methods.filter {
                it.implementation != null && it.returnType == "Ljava/util/List;" &&
                    it.params() == listOf("I", "Z", "${ADS}data/model/SectionAdPlacementModel;")
            }
            check(slots.size == 1) { "${strategy.type}: expected one ad-slots method, found ${slots.size}" }
            assertReturnsMethodCall(
                slots.single(),
                targetClass = "Ljava/util/Collections;",
                targetName = "emptyList",
                label = "${strategy.type} ad slots",
            )
        }

        // 2. ArticleAdPlacementStrategy.shouldInsertAd(index, widthSizeClass) answers false.
        val shouldInsertAd = cls("${ADS}util/ArticleAdPlacementStrategy;").methods.filter {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Z" &&
                it.params() == listOf("I", "I") && it.implementation != null
        }
        check(shouldInsertAd.size == 1) { "expected one ArticleAdPlacementStrategy (II)Z, found ${shouldInsertAd.size}" }
        assertForcedBoolean(shouldInsertAd.single(), expected = false, label = "ArticleAdPlacementStrategy.shouldInsertAd")

        // 3. AdManagerAdViewStore publishes only Unit: every MutableStateFlow(initial) and every
        // setValue(value) gets Unit.INSTANCE in the value register right before the call.
        var created = 0
        var set = 0
        for (method in cls("${ADS}uac/AdManagerAdViewStore;").methods) {
            val instructions = method.instructions()
            instructions.forEachIndexed { index, instruction ->
                val ref = instruction.methodRef() ?: return@forEachIndexed
                val registers = (instruction as? FiveRegisterInstruction)?.let {
                    listOf(it.registerC, it.registerD, it.registerE).take(it.registerCount)
                } ?: return@forEachIndexed
                if (ref.definingClass == "Lkotlinx/coroutines/flow/StateFlowKt;" && ref.name == "MutableStateFlow") {
                    assertUnitBefore(instructions, index, registers[0], "AdManagerAdViewStore.${method.name} MutableStateFlow")
                    created++
                } else if (ref.definingClass == "Lkotlinx/coroutines/flow/MutableStateFlow;" && ref.name == "setValue") {
                    assertUnitBefore(instructions, index, registers[1], "AdManagerAdViewStore.${method.name} setValue")
                    set++
                }
            }
        }
        assertTrue(created >= 1, "AdManagerAdViewStore creates no ad flow")
        // removeEntry (failure / dispose reset) and storeView (a loaded ad).
        assertTrue(set >= 2, "AdManagerAdViewStore sets $set ad flows, expected removeEntry and storeView")

        // 4. AdPaddingDefaults' vertical padding (its only float getter) is 0.
        val padding = cls("${ADS}ui/component/AdPaddingDefaults;").methods.filter {
            it.returnType == "F" && it.parameterTypes.isEmpty() && it.implementation != null &&
                !AccessFlags.STATIC.isSet(it.accessFlags)
        }
        check(padding.size == 1) { "expected one AdPaddingDefaults float getter, found ${padding.size}" }
        assertReturnsInt(padding.single(), expected = 0, label = "AdPaddingDefaults vertical padding")

        // 5. The "ADVERTISEMENT" caption: UACModule keeps its own empty ad title lambda because
        // every static setter of the field its Function3 getter reads returns at once.
        val function3 = "Lkotlin/jvm/functions/Function3;"
        val uacModule = cls("${ADS}di/UACModule;")
        val titleGetter = uacModule.methods.filter {
            it.returnType == function3 && it.parameterTypes.isEmpty() && it.implementation != null
        }
        check(titleGetter.size == 1) { "expected one UACModule Function3 getter, found ${titleGetter.size}" }
        val titleField = titleGetter.single().instructions()
            .first { it.opcode == Opcode.SGET_OBJECT }
            .let { (it as ReferenceInstruction).reference as FieldReference }
        fun Method.writesTitle() = instructions().any {
            it.opcode == Opcode.SPUT_OBJECT && ((it as ReferenceInstruction).reference as FieldReference).let { ref ->
                ref.definingClass == titleField.definingClass && ref.name == titleField.name
            }
        }
        val titleSetters = uacModule.methods.filter {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" && it.params() == listOf(function3) &&
                it.implementation != null && it.writesTitle()
        }
        check(titleSetters.isNotEmpty()) { "no static UACModule (Function3)V setter writes ${titleField.name}" }
        titleSetters.forEach { assertReturnsEarlyVoid(it, label = "UACModule.${it.name} (ad title setter)") }
        // The empty default is still installed by the static initializer.
        assertTrue(uacModule.method("<clinit>").writesTitle(), "UACModule.<clinit> no longer sets its default ad title")

        // 6. Remote feature flags.
        val flags = cls("${ADS}config/UACFeatureFlagRepository;")
        for (name in listOf("getAreNativeAdsInSectionsEnabled", "getAreNativeAdsInArticlesEnabled", "isOzoneSDKEnabled")) {
            assertForcedBoolean(flags.method(name, emptyList()), expected = false, label = "UACFeatureFlagRepository.$name")
        }

        // 7. Google Mobile Ads never starts, and no MobileAds static can throw (rule 9).
        assertReturnsEarlyVoid(cls("${ADS}util/DJMobileAds;").method("initialize", emptyList()), label = "DJMobileAds.initialize")
        assertMobileAdsStaticsNeutralised(cls("${GMA}MobileAds;"), required = GMA_THROWING_STATICS + "registerWebView")

        val adRequest = "${GMA}AdRequest;"
        val amRequest = "${GMA}admanager/AdManagerAdRequest;"
        val gmaLoads = listOf(
            Triple("BaseAdView", "loadAd", listOf(adRequest)),
            // What DJAdViewModel.buildAdManagerAdView calls; it does not delegate to super.
            Triple("admanager/AdManagerAdView", "loadAd", listOf(amRequest)),
            Triple("AdLoader", "loadAd", listOf(adRequest)),
            Triple("AdLoader", "loadAd", listOf(amRequest)),
            Triple("AdLoader", "loadAds", listOf(adRequest, "I")),
        )
        for ((relative, name, parameters) in gmaLoads) {
            assertReturnsEarlyVoid(
                cls("$GMA$relative;").method(name, parameters),
                label = "$relative.$name(${parameters.joinToString()})",
            )
        }

        // 8. Video pre-rolls: every VideoPlayerAdsHandler returns CompletableDeferred(null) for
        // the ad tag and a null ImaAdsLoader.
        val handlers = classes.filter { VIDEO_ADS_HANDLER in it.interfaces }
        check(handlers.isNotEmpty()) { "no $VIDEO_ADS_HANDLER implementation" }
        var adTags = 0
        var loaders = 0
        for (handler in handlers) {
            handler.methods.filter { it.implementation != null }.forEach { method ->
                val insns = method.instructions()
                val nullConst = (insns.getOrNull(0) as? NarrowLiteralInstruction)
                    ?.takeIf { it.opcode == Opcode.CONST_4 && it.narrowLiteral == 0 }
                if (method.returnType == "Lkotlinx/coroutines/Deferred;" &&
                    method.params() == listOf("Lcom/dowjones/query/fragment/VideoData;", "Z", "Z")
                ) {
                    val call = insns.getOrNull(1)?.methodRef()
                    assertTrue(
                        nullConst != null && call?.definingClass == "Lkotlinx/coroutines/CompletableDeferredKt;" &&
                            call.name == "CompletableDeferred" && insns.getOrNull(3)?.opcode == Opcode.RETURN_OBJECT,
                        "${handler.type}.${method.name} does not return CompletableDeferred(null); starts ${insns.take(4).map { it.opcode }}"
                    )
                    adTags++
                }
                if (method.returnType == "Landroidx/media3/exoplayer/ima/ImaAdsLoader;" &&
                    method.params() == listOf("Ljava/lang/String;", "Landroidx/media3/common/Player;", "Landroid/net/Uri;")
                ) {
                    assertTrue(
                        nullConst != null && insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT,
                        "${handler.type}.${method.name} does not return null; starts ${insns.take(2).map { it.opcode }}"
                    )
                    loaders++
                }
            }
        }
        assertTrue(adTags >= 1 && loaders >= 1, "video ads handler hooks missing ($adTags ad tag, $loaders loader)")

        // media3's MediaItem.Builder ignores every ad configuration / ad tag setter.
        val setters = cls(MEDIA_ITEM_BUILDER).methods.filter {
            (it.name == "setAdsConfiguration" || it.name == "setAdTagUri") && it.implementation != null
        }
        assertTrue(setters.any { it.name == "setAdsConfiguration" }, "MediaItem.Builder has no setAdsConfiguration")
        setters.forEach { setter ->
            assertTrue(
                setter.instructions().firstOrNull()?.opcode == Opcode.RETURN_OBJECT,
                "MediaItem.Builder.${setter.name}(${setter.params().joinToString()}) does not return this at once"
            )
        }

        // 9. Live coverage: LiveCoveragePlacementStrategy.shouldInsertAdBeforeCard (its only (I)Z)
        // answers false.
        val liveCoverageGate = cls("${ADS}util/LiveCoveragePlacementStrategy;").methods.filter {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Z" &&
                it.params() == listOf("I") && it.implementation != null
        }
        check(liveCoverageGate.size == 1) { "expected one LiveCoveragePlacementStrategy (I)Z, found ${liveCoverageGate.size}" }
        assertForcedBoolean(liveCoverageGate.single(), expected = false, label = "LiveCoveragePlacementStrategy.shouldInsertAdBeforeCard")

        // 10. Discover feed: every store to DiscoverScreenViewModel's ad frequency (its only int
        // field) stores 0 (const/4 vA, 0x0 right before the iput), so onFeedData adds no ad page.
        val discover = cls("Lcom/dowjones/section/ui/DiscoverScreenViewModel;")
        val frequency = discover.fields.single { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == "I" }
        var frequencyStores = 0
        for (method in discover.methods) {
            val instructions = method.instructions()
            instructions.forEachIndexed { index, instruction ->
                val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                if (instruction.opcode != Opcode.IPUT || ref?.definingClass != discover.type || ref.name != frequency.name) {
                    return@forEachIndexed
                }
                val register = (instruction as TwoRegisterInstruction).registerA
                val previous = instructions.getOrNull(index - 1)
                assertTrue(
                    previous?.opcode == Opcode.CONST_4 && (previous as OneRegisterInstruction).registerA == register &&
                        (previous as NarrowLiteralInstruction).narrowLiteral == 0,
                    "DiscoverScreenViewModel.${method.name}: the ad frequency v$register is not set to 0 first; previous is ${previous?.opcode}"
                )
                frequencyStores++
            }
        }
        assertTrue(frequencyStores >= 1, "nothing in DiscoverScreenViewModel stores the ad frequency")
    }
}
