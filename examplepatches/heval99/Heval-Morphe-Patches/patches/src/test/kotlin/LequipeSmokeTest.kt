import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "lequipe.fr"
private const val GMA = "Lcom/google/android/gms/ads/"
private const val AD_MANAGER_REQUEST = "${GMA}admanager/AdManagerAdRequest;"
private val LOAD_NAMES = setOf("load", "loadAd", "loadAds")
private val RETURNS = setOf(Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT)
private val LOAD_CLASSES = listOf(
    "BaseAdView",
    "AdLoader",
    "admanager/AdManagerAdView",
    "admanager/AdManagerInterstitialAd",
    "interstitial/InterstitialAd",
    "rewarded/RewardedAd",
    "rewardedinterstitial/RewardedInterstitialAd",
    "appopen/AppOpenAd",
).map { "$GMA$it;" }

// Types the runtime provides; anything else an injected instruction names must be in the dex.
private val FRAMEWORK_PREFIXES = listOf("Ljava/", "Ljavax/", "Landroid/", "Ldalvik/", "[")

class LequipeSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `Disable ads neuters every GMA load and the MobileAds statics`() {
        val root = repoRoot()
        val apk = File(root, "apks/lequipe/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "10.70.0",
            patchNames = setOf("Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }
        fun classDef(type: String) = byType[type] ?: error("$type not found in emitted dexes")
        val hooked = mutableListOf<Method>()

        // Step 1 (rule 9): every MobileAds static void, registerWebView included (the app calls it).
        val mobileAds = classDef("${GMA}MobileAds;")
        assertMobileAdsStaticsNeutralised(mobileAds, GMA_THROWING_STATICS + "registerWebView")
        hooked += mobileAds.methods.filter {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null &&
                (it.returnType == "V" && it.name != "<clinit>" || it.name == "putPublisherFirstPartyIdEnabled")
        }

        // Step 2: the mandatory loads, then every concrete void load / loadAd / loadAds.
        val required = listOf(
            classDef("${GMA}admanager/AdManagerAdView;").method("loadAd", listOf(AD_MANAGER_REQUEST)),
            classDef("${GMA}admanager/AdManagerInterstitialAd;").method(
                "load",
                listOf(
                    "Landroid/content/Context;",
                    "Ljava/lang/String;",
                    AD_MANAGER_REQUEST,
                    "${GMA}admanager/AdManagerInterstitialAdLoadCallback;",
                ),
            ),
            classDef("${GMA}BaseAdView;").method("loadAd", listOf("${GMA}AdRequest;")),
            classDef("${GMA}interstitial/InterstitialAd;").method(
                "load",
                listOf(
                    "Landroid/content/Context;",
                    "Ljava/lang/String;",
                    "${GMA}AdRequest;",
                    "${GMA}interstitial/InterstitialAdLoadCallback;",
                ),
            ),
        )
        required.forEach {
            assertTrue(it.implementation != null, "${it.label()} is not concrete")
            assertReturnsEarlyVoid(it, label = it.label())
        }
        val loads = LOAD_CLASSES.mapNotNull { byType[it] }.flatMap { classDef ->
            classDef.methods.filter { it.name in LOAD_NAMES && it.returnType == "V" && it.implementation != null }
        }
        loads.forEach { assertReturnsEarlyVoid(it, label = it.label()) }
        hooked += loads

        // Step 3: every GMA load call in the APK resolves (class, then superclasses) to a patched
        // load. The app's banner coroutines call AdManagerAdView.loadAd and its bidding
        // interstitial calls AdManagerInterstitialAd.load (v21$h$a, mh3$f$a, w21$f$a in 10.70.0);
        // they are found by what they call, the same way the patch checks them.
        val patchedKeys = loads.map { it.key() }.toSet()
        val appCallers = mutableMapOf<String, MutableSet<String>>()
        for (caller in classes) {
            for (method in caller.methods) {
                for (instruction in method.instructions()) {
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                    if (!ref.definingClass.startsWith(GMA) || ref.name !in LOAD_NAMES || ref.returnType != "V") continue
                    val target = resolve(byType, ref)
                    assertTrue(
                        target != null && target.key() in patchedKeys,
                        "${caller.type}->${method.name} calls $ref, which resolves to unpatched ${target?.key()}",
                    )
                    if (!caller.type.startsWith("Lcom/google/")) {
                        appCallers.getOrPut(target!!.key()) { mutableSetOf() } += caller.type
                    }
                }
            }
        }
        val bannerCallers = appCallers[required[0].key()].orEmpty()
        val interstitialCallers = appCallers[required[1].key()].orEmpty()
        assertTrue(
            bannerCallers.size >= 2,
            "expected the two banner coroutines to call AdManagerAdView.loadAd, found $bannerCallers",
        )
        assertTrue(
            interstitialCallers.isNotEmpty(),
            "expected the bidding interstitial to call AdManagerInterstitialAd.load, found none",
        )

        // Injected code may only name classes that exist in the emitted dex (or the framework):
        // a missing class (e.g. an R8-renamed kotlinx type) would crash with NoClassDefFoundError.
        for (method in hooked) {
            val injected = method.instructions().let { insns ->
                insns.take(insns.indexOfFirst { it.opcode in RETURNS } + 1)
            }
            assertTrue(injected.isNotEmpty(), "${method.label()} has no injected return")
            val types = injected.flatMap { instruction ->
                when (val ref = (instruction as? ReferenceInstruction)?.reference) {
                    is TypeReference -> listOf(ref.type)
                    is MethodReference -> listOf(ref.definingClass, ref.returnType) + ref.parameterTypes.map { it.toString() }
                    is FieldReference -> listOf(ref.definingClass, ref.type)
                    else -> emptyList()
                }
            }.filter { it.startsWith("L") && FRAMEWORK_PREFIXES.none(it::startsWith) }
            types.forEach { type ->
                assertTrue(type in byType, "${method.label()} injects a reference to $type, which is not in the dex")
            }
        }
    }

    private fun Method.key() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private fun Method.label() = "$definingClass->$name(${parameterTypes.joinToString(", ")})"

    // The class the reference names, then its superclasses, as the runtime resolves it.
    private fun resolve(byType: Map<String, ClassDef>, ref: MethodReference): Method? {
        var type: String? = ref.definingClass
        while (type != null) {
            val classDef = byType[type] ?: return null
            classDef.methods.firstOrNull {
                it.name == ref.name && it.returnType == ref.returnType &&
                    it.parameterTypes.map(CharSequence::toString) == ref.parameterTypes.map(CharSequence::toString)
            }?.let { return it }
            type = classDef.superclass
        }
        return null
    }
}
