import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
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

private const val PKG = "com.divum.MoneyControl"
private const val GMA = "Lcom/google/android/gms/ads/"
private const val TABOOLA_UNIT = "Lcom/taboola/android/TBLClassicUnit;"
private const val ACTIVITY = "Landroidx/fragment/app/FragmentActivity;"
private val AD_SLOT_KEYS = setOf("native_ad", "splash_top", "splash_bottom", "dfp_custom")

class MoneycontrolSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference
    private fun Instruction.fieldRef() = (this as? ReferenceInstruction)?.reference as? FieldReference
    private fun Method.strings() = instructions().mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
    private fun Method.params() = parameterTypes.map(CharSequence::toString)

    /** Asserts the method starts with `const/4 vX, 0x0` + `return-object vX`. */
    private fun assertReturnsNull(method: Method, label: String) {
        val insns = method.instructions()
        val first = insns.getOrNull(0)
        val second = insns.getOrNull(1)
        assertTrue(
            first?.opcode == Opcode.CONST_4 && (first as NarrowLiteralInstruction).narrowLiteral == 0 &&
                second?.opcode == Opcode.RETURN_OBJECT &&
                (second as OneRegisterInstruction).registerA == (first as OneRegisterInstruction).registerA,
            "$label does not return null at once; starts with ${first?.opcode}, ${second?.opcode}",
        )
    }

    /** Asserts `const/16 vX, 0x8` + `setVisibility(vX)` on this + [returnOpcode]. */
    private fun assertHidesSelf(method: Method, returnOpcode: Opcode, label: String) {
        val insns = method.instructions()
        val gone = insns.getOrNull(0)
        val call = insns.getOrNull(1)
        assertTrue(
            gone?.opcode == Opcode.CONST_16 && (gone as NarrowLiteralInstruction).narrowLiteral == 8,
            "$label does not load View.GONE first; found ${gone?.opcode}",
        )
        val ref = call?.methodRef()
        val pThis = method.implementation!!.registerCount - method.params().size - 1
        assertTrue(
            ref?.definingClass == "Landroid/view/View;" && ref.name == "setVisibility" &&
                (call as FiveRegisterInstruction).registerC == pThis &&
                call.registerD == (gone as OneRegisterInstruction).registerA,
            "$label does not call this.setVisibility(GONE); found ${call?.opcode} $ref",
        )
        assertEquals(returnOpcode, insns.getOrNull(2)?.opcode, "$label does not return right after hiding")
    }

    @Test
    fun `ad config, sticky ad, prerolls, GMA, Taboola and Flutter plugin ads are neutralised`() {
        val root = repoRoot()
        val apk = File(root, "apks/moneycontrol/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk, workDir = workDir, pkg = PKG, version = "14.6.3.RC0",
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        fun cls(type: String): ClassDef = classes.firstOrNull { it.type == type } ?: error("$type not found in emitted dexes")
        val allMethods = classes.asSequence().flatMap { c -> c.methods.asSequence() }

        // Step 1: found like the patch. The ad-config parser (slot-key strings, (String, Context)V)
        // hands its HashMap to the repository; every repository lookup (instance-of + Map.get,
        // String keys) returns null at once, and they cover Map, List and AdEntity lookups.
        val parser = allMethods.single {
            it.returnType == "V" && it.params() == listOf("Ljava/lang/String;", "Landroid/content/Context;") &&
                it.strings().containsAll(AD_SLOT_KEYS)
        }
        val repositoryType = parser.instructions().mapNotNull { it.methodRef() }
            .filter { it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/HashMap;") }
            .map { it.definingClass }.distinct().single()
        val lookups = cls(repositoryType).methods.filter { m ->
            !AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType.startsWith("L") && m.params().isNotEmpty() &&
                m.params().all { it == "Ljava/lang/String;" } &&
                m.instructions().any { it.opcode == Opcode.INSTANCE_OF } &&
                m.instructions().any { it.methodRef()?.let { r -> r.definingClass == "Ljava/util/Map;" && r.name == "get" } == true }
        }
        val returnTypes = lookups.map { it.returnType }.toSet()
        assertTrue(
            "Ljava/util/Map;" in returnTypes && "Ljava/util/List;" in returnTypes &&
                "Lcom/moneycontrol/handheld/entity/AdEntity;" in returnTypes,
            "repository $repositoryType lookups incomplete: $returnTypes",
        )
        lookups.forEach { assertReturnsNull(it, "$repositoryType.${it.name}(${it.params().joinToString()})") }

        // Step 2: Utility's sticky-ad "show" calls "hide" with the same activity and returns.
        fun stickyToggle(prefix: String) = allMethods.single {
            it.returnType == "V" && it.params() == listOf(ACTIVITY) &&
                it.strings().any { s -> s.startsWith("Utility hideAndShowAds Visibility $prefix") }
        }
        val show = stickyToggle("VISIBLE")
        val hide = stickyToggle("GONE")
        val redirect = show.instructions()
        val target = redirect.firstOrNull()?.methodRef()
        assertTrue(
            target?.definingClass == hide.definingClass && target.name == hide.name &&
                target.parameterTypes.map(CharSequence::toString) == listOf(ACTIVITY),
            "sticky-ad show does not call hide first; found ${redirect.firstOrNull()?.opcode} $target",
        )
        assertEquals(Opcode.RETURN_VOID, redirect.getOrNull(1)?.opcode, "sticky-ad show does not return after hide")

        // Step 3: the BannerAd preroll URL getters (found by their JSON field names) return null.
        val prerollModel = classes.single { c ->
            c.fields.map { it.name }.containsAll(listOf("video_preroll_url", "tv_preroll_url"))
        }
        for (field in listOf("video_preroll_url", "tv_preroll_url")) {
            val getters = prerollModel.methods.filter { m ->
                m.returnType == "Ljava/lang/String;" && m.params().isEmpty() &&
                    m.instructions().any { it.opcode == Opcode.IGET_OBJECT && it.fieldRef()?.name == field }
            }
            assertTrue(getters.isNotEmpty(), "no getter for ${prerollModel.type}->$field")
            getters.forEach { assertReturnsNull(it, "${prerollModel.type}.${it.name}") }
        }

        // Step 4: GMA loads return at once without calling back (no Java caller waits, and a
        // failure would walk JJT's waterfall to Yandex); banner views hide themselves on loadAd.
        // MobileAds initialize is deliberately untouched (Flutter plugin and JJT wait on its listener).
        val loadAd = "${GMA}AdRequest;"
        val managerRequest = "${GMA}admanager/AdManagerAdRequest;"
        assertReturnsEarlyVoid(cls("${GMA}AdLoader;").method("loadAd", listOf(loadAd)), "AdLoader.loadAd(AdRequest)")
        assertReturnsEarlyVoid(cls("${GMA}AdLoader;").method("loadAd", listOf(managerRequest)), "AdLoader.loadAd(AdManagerAdRequest)")
        assertReturnsEarlyVoid(cls("${GMA}AdLoader;").method("loadAds", listOf(loadAd, "I")), "AdLoader.loadAds")
        for (owner in listOf(
            "interstitial/InterstitialAd;", "admanager/AdManagerInterstitialAd;", "rewarded/RewardedAd;",
            "rewardedinterstitial/RewardedInterstitialAd;", "appopen/AppOpenAd;",
        )) {
            val loads = cls(GMA + owner).methods.filter { it.name == "load" && it.implementation != null }
            assertTrue(loads.isNotEmpty(), "$owner has no concrete load")
            loads.forEach { assertReturnsEarlyVoid(it, "$owner.load(${it.params().joinToString()})") }
        }
        assertHidesSelf(cls("${GMA}BaseAdView;").method("loadAd", listOf(loadAd)), Opcode.RETURN_VOID, "BaseAdView.loadAd")
        assertHidesSelf(
            cls("${GMA}admanager/AdManagerAdView;").method("loadAd", listOf(managerRequest)),
            Opcode.RETURN_VOID, "AdManagerAdView.loadAd",
        )
        assertTrue(
            cls("${GMA}MobileAds;").method("initialize", listOf("Landroid/content/Context;", "${GMA}initialization/OnInitializationCompleteListener;"))
                .instructions().firstOrNull()?.opcode != Opcode.RETURN_VOID,
            "MobileAds.initialize(Context, listener) must stay intact",
        )

        // Step 5: Taboola's unit hides itself and returns this instead of fetching.
        assertHidesSelf(cls(TABOOLA_UNIT).method("fetchContent", emptyList()), Opcode.RETURN_OBJECT, "TBLClassicUnit.fetchContent")

        // Step 6: every google_mobile_ads plugin load (the Flutter screens' banners and natives)
        // reports NO_FILL to Dart instead of reaching the silent Java loads.
        assertTrue(assertFlutterGmaPluginLoadsFail(classes).isNotEmpty(), "no plugin load methods found")
    }
}
