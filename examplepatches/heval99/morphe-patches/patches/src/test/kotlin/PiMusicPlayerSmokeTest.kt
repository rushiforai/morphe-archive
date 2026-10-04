import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.Project100Pi.themusicplayer"
private const val AD_FREE_LITERAL = "AD_FREE"
private const val RESETTER_LOG = "checkAndDisableTempAdFree() :: start"

class PiMusicPlayerSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.referencesString(value: String): Boolean {
        val ref = (this as? ReferenceInstruction)?.reference
        return ref is StringReference && ref.string == value
    }

    private fun loadClasses(patchNames: Set<String>): List<ClassDef> {
        val root = repoRoot()
        val apk = File(root, "apks/pimusicplayer/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        return applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "3.2.0.0_release_2",
            patchNames = patchNames,
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
    }

    @Test
    fun `Enable Premium forces the purchase-state checks and seeds the flag`() {
        val classes = loadClasses(setOf("Enable Premium"))

        // Resolve the flag the same way the patch does: the sget-boolean inside
        // the method reporting "AD_FREE".
        val reporter = classes.firstOrNull { cls: ClassDef ->
            cls.methods.any { method ->
                method.implementation?.instructions?.any { it.referencesString(AD_FREE_LITERAL) } == true
            }
        } ?: error("ad-state reporter (literal '$AD_FREE_LITERAL') not found in emitted dexes")
        val flag = reporter.methods
            .flatMap { it.instructions() }
            .mapNotNull { ((it as? ReferenceInstruction)?.reference as? FieldReference) }
            .singleOrNull { it.type == "Z" }
            ?: error("premium flag field not found")

        val holder = classes.firstOrNull { it.type == flag.definingClass }
            ?: error("premium flag class ${flag.definingClass} not found in emitted dexes")

        // b(): the no-arg boolean reading the flag; a(): the no-arg boolean it calls.
        val combined = holder.methods.firstOrNull { method: Method ->
            method.returnType == "Z" && method.implementation != null &&
                method.parameterTypes.isEmpty() &&
                method.instructions().any { instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    ref != null && ref.definingClass == flag.definingClass && ref.name == flag.name
                }
        } ?: error("combined premium check not found in ${holder.type}")
        assertForcedBoolean(combined, expected = true, label = "${holder.type} combined check")

        val listRef = combined.instructions()
            .mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference) }
            .firstOrNull { ref ->
                ref.definingClass == holder.type && ref.returnType == "Z" &&
                    ref.parameterTypes.isEmpty()
            } ?: error("purchase-list check call not found")
        val listCheck = holder.method(listRef.name, emptyList())
        assertForcedBoolean(listCheck, expected = true, label = "${holder.type}.${listRef.name}()")

        // Resetter neutered: first instruction must be return-void.
        val resetterClass = classes.firstOrNull { cls: ClassDef ->
            cls.methods.any { method ->
                method.implementation?.instructions?.any { it.referencesString(RESETTER_LOG) } == true
            }
        } ?: error("temp-ad-free resetter (literal '$RESETTER_LOG') not found in emitted dexes")
        val resetter = resetterClass.methods.firstOrNull { method ->
            method.name != "<init>" && method.name != "<clinit>" &&
                method.returnType == "V" && method.implementation != null &&
                method.parameterTypes.isEmpty() &&
                method.instructions().any { it.referencesString(RESETTER_LOG) }
        } ?: error("temp-ad-free resetter not found in ${resetterClass.type}")
        assertReturnsEarlyVoid(resetter, label = "${resetterClass.type} resetter")

        // Flag seeded true in <clinit>: the second-to-last instruction must be the
        // sput-boolean of the flag (last is return-void).
        val clinit = holder.method("<clinit>")
        val insns = clinit.instructions()
        val seed = insns.getOrNull(insns.size - 2) as? ReferenceInstruction
        val seedRef = seed?.reference as? FieldReference
        check(
            seedRef != null && seedRef.definingClass == flag.definingClass &&
                seedRef.name == flag.name
        ) { "flag not seeded in <clinit>" }
    }

    @Test
    fun `Disable ads neuters MobileAds init and MAX interstitial load-show`() {
        val classes = loadClasses(setOf("Disable ads"))

        val mobileAds = classes.firstOrNull { it.type == "Lcom/google/android/gms/ads/MobileAds;" }
            ?: error("MobileAds not found in emitted dexes")
        assertReturnsEarlyVoid(
            mobileAds.method("initialize", listOf("Landroid/content/Context;")),
            label = "MobileAds.initialize(Context)",
        )
        assertReturnsEarlyVoid(
            mobileAds.method(
                "initialize",
                listOf(
                    "Landroid/content/Context;",
                    "Lcom/google/android/gms/ads/initialization/OnInitializationCompleteListener;",
                ),
            ),
            label = "MobileAds.initialize(Context, Listener)",
        )

        // The terminal interstitial overload is showAd(String, String, Activity).
        val maxInterstitial =
            classes.firstOrNull { it.type == "Lcom/applovin/mediation/ads/MaxInterstitialAd;" }
                ?: error("MaxInterstitialAd not found in emitted dexes")
        assertReturnsEarlyVoid(
            maxInterstitial.method(
                "showAd",
                listOf("Ljava/lang/String;", "Ljava/lang/String;", "Landroid/app/Activity;"),
            ),
            label = "MaxInterstitialAd.showAd(String, String, Activity)",
        )
    }
}
