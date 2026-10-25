import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.yahoo.mobile.client.android.sportacular"
private const val SPORTS_AD_CARD_VIEW = "Lcom/yahoo/mobile/ysports/ui/card/media/ads/view/SportsAdCardView;"
private const val SAPI_MEDIA_ITEM =
    "Lcom/verizondigitalmedia/mobile/client/android/sapiMediaItemProvider/data/SapiMediaItem;"
private const val CARD_CTRL = "Lcom/yahoo/mobile/ysports/common/ui/card/control/CardCtrl;"

class YahooSportsSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.methodRef(): MethodReference? =
        (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun Instruction.stringRef(): String? =
        ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    private fun List<ClassDef>.byType(type: String): ClassDef =
        firstOrNull { it.type == type } ?: error("$type not found in emitted dexes")

    @Test
    fun `Disable ads and Hide betting promotions hide ad cards, ad switches, pre-rolls and the BetMGM banner`() {
        val root = repoRoot()
        val apk = File(root, "apks/yahoosports/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "12.26.1",
            patchNames = setOf("Disable ads", "Hide betting promotions"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )

        // Disable ads 1: SportsAdCardView's typed setData (not the Object bridge) starts with
        // const/16 8, setVisibility(GONE) on this, return-void.
        val setData = classes.byType(SPORTS_AD_CARD_VIEW).methods.singleOrNull {
            it.name == "setData" && it.returnType == "V" && it.parameterTypes.size == 1 &&
                it.parameterTypes[0].toString() != "Ljava/lang/Object;" && it.implementation != null
        } ?: error("SportsAdCardView has no single typed setData")
        val label = "SportsAdCardView.setData(${setData.parameterTypes[0]})"
        val insns = setData.instructions()
        val gone = insns.getOrNull(0)
        val hide = insns.getOrNull(1)
        val hideRef = hide?.methodRef()
        assertTrue(
            gone?.opcode == Opcode.CONST_16 && (gone as NarrowLiteralInstruction).narrowLiteral == 8,
            "$label does not start with const/16 0x8; found ${gone?.opcode}"
        )
        // `this` is the first register after the locals.
        val thisRegister = setData.implementation!!.registerCount - 2
        assertTrue(
            hide?.opcode == Opcode.INVOKE_VIRTUAL &&
                hideRef?.definingClass == "Landroid/view/View;" && hideRef.name == "setVisibility" &&
                (hide as FiveRegisterInstruction).registerC == thisRegister &&
                hide.registerD == (gone as OneRegisterInstruction).registerA &&
                gone.registerA != thisRegister,
            "$label does not call this.setVisibility(GONE); found ${hide?.opcode} $hideRef"
        )
        assertTrue(
            insns.getOrNull(2)?.opcode == Opcode.RETURN_VOID,
            "$label does not return after hiding; third instruction is ${insns.getOrNull(2)?.opcode}"
        )

        // Disable ads 2: the sponsored-moments config manager, found by its <clinit> keys, answers
        // false from every public final no-arg boolean getter (12.10.3: a(), b(), c()).
        val manager = classes.singleOrNull { classDef ->
            val clinit = classDef.methods.firstOrNull { it.name == "<clinit>" } ?: return@singleOrNull false
            val strings = clinit.instructions().mapNotNull { it.stringRef() }.toSet()
            "stream_taboola_ad_enabled" in strings && "sponsored_moments_use_gam_ads" in strings
        } ?: error("sponsored-moments config manager not found by its <clinit> keys")
        val switches = manager.methods.filter {
            AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.FINAL.isSet(it.accessFlags) &&
                !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Z" &&
                it.parameterTypes.isEmpty() && it.implementation != null
        }
        assertTrue(switches.size == 3, "${manager.type} should have 3 ad switch getters; found ${switches.map { it.name }}")
        switches.forEach {
            assertForcedBoolean(it, expected = false, label = "${manager.type}.${it.name}()")
        }

        // Disable ads 3: SapiMediaItem.getAdTagUri() returns null.
        val adTag = classes.byType(SAPI_MEDIA_ITEM).method("getAdTagUri", emptyList())
        val adTagInsns = adTag.instructions()
        val nullConst = adTagInsns.getOrNull(0)
        val ret = adTagInsns.getOrNull(1)
        assertTrue(
            nullConst?.opcode == Opcode.CONST_4 && (nullConst as NarrowLiteralInstruction).narrowLiteral == 0,
            "SapiMediaItem.getAdTagUri does not start with const/4 0; found ${nullConst?.opcode}"
        )
        assertTrue(
            ret?.opcode == Opcode.RETURN_OBJECT &&
                (ret as OneRegisterInstruction).registerA == (nullConst as OneRegisterInstruction).registerA,
            "SapiMediaItem.getAdTagUri does not return null; second instruction is ${ret?.opcode}"
        )

        // Hide betting promotions: the banner controller's CardCtrl data override, found like the
        // patch finds it ((Object)V, the "placement" key and a CardCtrl call; 12.26.1:
        // bettingimagebanner/control/a.M2), returns at once.
        val bind = classes.flatMap { it.methods }.singleOrNull { method ->
            method.returnType == "V" && method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;") &&
                method.instructions().let { insns ->
                    insns.any { it.stringRef() == "placement" } &&
                        insns.any { it.methodRef()?.definingClass == CARD_CTRL }
                }
        } ?: error("no single (Object)V method with the \"placement\" key and a CardCtrl call")
        assertReturnsEarlyVoid(bind, label = "${bind.definingClass}.${bind.name}(${bind.parameterTypes.joinToString()})")
    }
}
