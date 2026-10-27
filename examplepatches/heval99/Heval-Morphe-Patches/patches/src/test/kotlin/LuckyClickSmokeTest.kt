import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.peter890331.luckyclick.app"
private const val GMA = "Lcom/google/android/gms/ads/"

class LuckyClickSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun Instruction.fieldRef() = (this as? ReferenceInstruction)?.reference as? FieldReference

    private fun FieldReference.key() = "$definingClass->$name:$type"

    private fun Instruction.registers(): List<Int> = when (this) {
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        else -> emptyList()
    }

    private fun Instruction.isGetBoolean() = methodRef()?.let {
        it.definingClass == "Landroid/content/SharedPreferences;" && it.name == "getBoolean"
    } == true

    // Same helpers as the patch: last straight-line write of a register, the lazily decoded prefs
    // key field behind a key register (iget-object F; getValue(); check-cast String), and the
    // static field a register was loaded from.
    private fun List<Instruction>.lastWriteOf(register: Int, before: Int): Int? =
        (before - 1 downTo 0).firstOrNull { index ->
            val insn = this[index]
            insn is OneRegisterInstruction && insn.registerA == register &&
                (insn.opcode.setsRegister() || insn.opcode == Opcode.CHECK_CAST)
        }

    private fun List<Instruction>.keyFieldOf(register: Int, before: Int): String? {
        var index = lastWriteOf(register, before) ?: return null
        if (this[index].opcode == Opcode.CHECK_CAST) index = lastWriteOf(register, index) ?: return null
        if (this[index].opcode != Opcode.MOVE_RESULT_OBJECT) return null
        val call = getOrNull(index - 1) ?: return null
        if (call.methodRef()?.name != "getValue" || call.methodRef()!!.parameterTypes.isNotEmpty()) return null
        val receiver = call.registers().firstOrNull() ?: return null
        val source = lastWriteOf(receiver, index - 1) ?: return null
        return this[source].takeIf { it.opcode == Opcode.IGET_OBJECT }?.fieldRef()?.key()
    }

    private fun List<Instruction>.staticFieldIn(register: Int, before: Int): String? =
        lastWriteOf(register, before)?.let { this[it] }?.takeIf { it.opcode == Opcode.SGET_OBJECT }?.fieldRef()?.key()

    // getBoolean calls whose key comes from the AD_FREE_PERMANENT key field. Returns their indices.
    private fun Method.adFreePermanentReads(keyField: String): List<Int> {
        val insns = instructions()
        return insns.indices.filter { index ->
            insns[index].isGetBoolean() &&
                insns[index].registers().getOrNull(1)?.let { insns.keyFieldOf(it, index) } == keyField
        }
    }

    private fun Method.setsTrue(stateField: String): Boolean {
        val insns = instructions()
        return insns.withIndex().any { (index, insn) ->
            val registers = insn.registers()
            insn.methodRef()?.name == "setValue" && registers.size == 2 &&
                insns.staticFieldIn(registers[0], index) == stateField &&
                insns.staticFieldIn(registers[1], index) == "Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;"
        }
    }

    @Test
    fun `license check, ad-free reads, purchase restore and GMA are patched`() {
        val root = repoRoot()
        val apk = File(root, "apks/luckyclick/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk, workDir = workDir, pkg = PKG, version = "4.8",
            patchNames = setOf("Disable license check", "Disable ads"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        fun cls(type: String) = classes.firstOrNull { it.type == type } ?: error("$type not found in emitted dexes")

        // Disable license check: PairIP.
        assertReturnsEarlyVoid(
            cls("Lcom/pairip/licensecheck/LicenseClient;").method("checkLicense", listOf("Landroid/content/Context;")),
            label = "LicenseClient.checkLicense(Context)",
        )

        // The purchase restore, found like the fingerprint (app PurchasesResponseListener with a
        // Boolean.valueOf and a putBoolean). Its putBoolean key is the AD_FREE_PERMANENT key
        // field; its setValue receiver is the ad-free state.
        val restores = classes.filter { !it.type.startsWith("Lcom/android/billingclient/") }.flatMap { c ->
            c.methods.filter { m ->
                m.name == "onQueryPurchasesResponse" &&
                    m.instructions().any { it.methodRef()?.name == "valueOf" } &&
                    m.instructions().any { it.methodRef()?.name == "putBoolean" }
            }
        }
        assertEquals(1, restores.size, "expected one purchase restore, found ${restores.size}")
        val restore = restores.single().instructions()
        val putIndex = restore.indexOfFirst { it.methodRef()?.name == "putBoolean" }
        val keyField = restore[putIndex].registers().getOrNull(1)?.let { restore.keyFieldOf(it, putIndex) }
        assertNotNull(keyField, "purchase restore's putBoolean key is not a lazily decoded key field")
        val valueOf = restore.indexOfFirst {
            it.opcode == Opcode.INVOKE_STATIC && it.methodRef()?.definingClass == "Ljava/lang/Boolean;" &&
                it.methodRef()?.name == "valueOf"
        }
        assertTrue(valueOf >= 0, "purchase restore has no Boolean.valueOf")
        val setValue = restore[valueOf + 3]
        assertEquals("setValue", setValue.methodRef()?.name, "purchase restore no longer stores the Boolean")
        val stateField = restore.staticFieldIn(setValue.registers().first(), valueOf + 3)
        assertNotNull(stateField, "purchase restore's ad-free state is not a static field")

        // Disable ads, step 1: every getBoolean(AD_FREE_PERMANENT) result is overwritten with 1,
        // including the startup read that sets the ad-free state to TRUE.
        val reads = classes.flatMap { c -> c.methods.flatMap { m -> m.adFreePermanentReads(keyField!!).map { Triple(c, m, it) } } }
        assertTrue(
            reads.any { (_, m, _) -> m.setsTrue(stateField!!) },
            "no AD_FREE_PERMANENT read sets $stateField to TRUE; reads in ${reads.map { "${it.first.type}.${it.second.name}" }}",
        )
        for ((owner, method, index) in reads) {
            val insns = method.instructions()
            val label = "${owner.type}.${method.name} getBoolean(AD_FREE_PERMANENT) at $index"
            val result = insns[index + 1]
            assertEquals(Opcode.MOVE_RESULT, result.opcode, "$label result is not moved")
            val forced = insns[index + 2]
            assertTrue(
                (forced.opcode == Opcode.CONST_4 || forced.opcode == Opcode.CONST_16) &&
                    (forced as OneRegisterInstruction).registerA == (result as OneRegisterInstruction).registerA &&
                    (forced as NarrowLiteralInstruction).narrowLiteral == 1,
                "$label is not forced to true; next is ${forced.opcode}",
            )
        }

        // Step 2: the purchase restore stores Boolean.TRUE as the ad-free state.
        val boxed = (restore[valueOf + 1] as OneRegisterInstruction).registerA
        val forcedTrue = restore[valueOf + 2]
        val field = forcedTrue.fieldRef()
        assertTrue(
            forcedTrue.opcode == Opcode.SGET_OBJECT && (forcedTrue as OneRegisterInstruction).registerA == boxed &&
                field?.definingClass == "Ljava/lang/Boolean;" && field.name == "TRUE" && boxed in setValue.registers(),
            "purchase restore does not replace its ad-free Boolean with TRUE; found ${forcedTrue.opcode} $field",
        )

        // Step 3: rule 9, every MobileAds static void is a no-op and first-party id answers false;
        // every interstitial / rewarded load overload and the banner load return at once.
        assertMobileAdsStaticsNeutralised(cls("${GMA}MobileAds;"))
        assertAllReturnEarly(classes, "${GMA}interstitial/InterstitialAd;", "load")
        assertAllReturnEarly(classes, "${GMA}rewarded/RewardedAd;", "load")
        assertReturnsEarlyVoid(
            cls("${GMA}BaseAdView;").method("loadAd", listOf("${GMA}AdRequest;")),
            label = "BaseAdView.loadAd(AdRequest)",
        )
    }
}
