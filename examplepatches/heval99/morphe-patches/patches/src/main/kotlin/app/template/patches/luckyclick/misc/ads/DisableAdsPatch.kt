package app.template.patches.luckyclick.misc.ads

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.luckyclick.misc.license.disableLicenseCheckPatch
import app.template.patches.shared.Constants.COMPATIBILITY_LUCKYCLICK
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.misc.ads.neutraliseMobileAdsStatics
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val GMA = "Lcom/google/android/gms/ads/"
private const val PREFS = "Landroid/content/SharedPreferences;"

// LuckyClick's ad-free purchase is checked on the device: the Play purchase is stored in the
// "prefs" SharedPreferences (AD_FREE_PERMANENT, AD_FREE_EXPIRE_TIME for the 30-day / 1-year
// passes) and mirrored into one in-memory Compose state that every ad path reads: the bottom
// banner is not composed, the launch / restore interstitial preloads are skipped, and Start
// (screen-capture request) goes straight on instead of first showing a full-screen interstitial.
// That interstitial is the "long, unskippable" ad: a GMA interstitial mediated to video networks
// (Unity, AppLovin, Pangle, Mintegral, Vungle, ironSource, ...). The app has no rewarded ads.
//
// The GMA backstops alone would be wrong: with no interstitial loaded and no "no fill" error,
// Start only shows "Loading ad... Please wait" and retries. The ad-free state is what skips it.
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_LUCKYCLICK)

    // Every patched build is re-signed and would otherwise stop at the license paywall.
    dependsOn(disableLicenseCheckPatch)

    execute {
        // 1. Every getBoolean("AD_FREE_PERMANENT", ...) answers true. MainActivity.onCreate's read
        // sets the ad-free state before any UI or ad code runs (the time-limited pass is then
        // not consulted); the settings screen's read shows the pass as "Permanent".
        var reads = 0
        var startupRead = false
        classDefForEach { classDef ->
            if (classDef.methods.none { it.readsAdFreePermanent() }) return@classDefForEach
            mutableClassDefBy(classDef).methods.filter { it.readsAdFreePermanent() }.forEach { method ->
                val forced = method.forceAdFreePermanentReads()
                reads += forced
                if (forced > 0 && method.name == "onCreate" &&
                    method.parameterTypes.map(CharSequence::toString) == listOf("Landroid/os/Bundle;")
                ) {
                    startupRead = true
                }
            }
        }
        if (!startupRead) {
            throw PatchException("Disable ads: no onCreate(Bundle) reads getBoolean(\"$AD_FREE_PERMANENT\") ($reads reads found)")
        }

        // 2. The purchase restore (every onResume) must not reset the state to false when Play
        // reports no ad-free purchase: the state it stores becomes Boolean.TRUE. Purchases are
        // still acknowledged / consumed as before.
        val restore = PurchasesRestoreFingerprint.method
        val restoreInstructions = restore.instructions.toList()
        val valueOfs = restoreInstructions.withIndex().filter { (_, instruction) ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            instruction.opcode == Opcode.INVOKE_STATIC && ref?.definingClass == "Ljava/lang/Boolean;" &&
                ref.name == "valueOf" && ref.parameterTypes.map(CharSequence::toString) == listOf("Z")
        }
        if (valueOfs.size != 1) {
            throw PatchException("Disable ads: expected one Boolean.valueOf(Z) in the purchase restore, found ${valueOfs.size}")
        }
        val valueOfIndex = valueOfs.single().index
        val boxed = restoreInstructions.getOrNull(valueOfIndex + 1)
            ?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT }
            ?.let { (it as OneRegisterInstruction).registerA }
            ?: throw PatchException("Disable ads: the purchase restore's Boolean.valueOf result is not moved")
        val store = restoreInstructions.getOrNull(valueOfIndex + 2)
        val storeRef = (store as? ReferenceInstruction)?.reference as? MethodReference
        if (storeRef?.name != "setValue" || boxed !in store.registers()) {
            throw PatchException("Disable ads: the purchase restore does not setValue its ad-free Boolean (found $storeRef)")
        }
        restore.addInstructionChecked(valueOfIndex + 2, "sget-object v$boxed, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;")

        // 3. Backstop at the SDK, so no mediated network can show anything should a new ad path
        // skip the ad-free state: never initialize Google Mobile Ads, and neuter every MobileAds
        // static that needs it (AGENTS.md rule 9). The app calls initialize from onCreate.
        neutraliseMobileAdsStatics("initialize")

        // Interstitial loads (static InterstitialAd.load) and the banner's BaseAdView.loadAd
        // (AdView has no loadAd of its own). The app loads no other format.
        for ((owner, name) in listOf("${GMA}interstitial/InterstitialAd;" to "load", "${GMA}BaseAdView;" to "loadAd")) {
            val targets = mutableClassDefBy(owner).methods.filter {
                it.name == name && it.returnType == "V" && it.implementation != null
            }
            if (targets.isEmpty()) throw PatchException("Disable ads: no concrete void $owner->$name")
            targets.forEach { it.returnEarly() }
        }
    }
}

private fun Instruction.registers(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}

private fun Instruction.isAdFreePermanentString() =
    (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) &&
        ((this as ReferenceInstruction).reference as StringReference).string == AD_FREE_PERMANENT

private fun Method.readsAdFreePermanent(): Boolean {
    val instructions = implementation?.instructions ?: return false
    return instructions.any { it.isAdFreePermanentString() } && instructions.any { it.isGetBoolean() }
}

private fun Instruction.isGetBoolean(): Boolean {
    val ref = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return (opcode == Opcode.INVOKE_INTERFACE || opcode == Opcode.INVOKE_INTERFACE_RANGE) &&
        ref.definingClass == PREFS && ref.name == "getBoolean"
}

// Forces the result of each getBoolean whose key register was last loaded with
// "AD_FREE_PERMANENT" to true; returns how many reads were changed.
private fun MutableMethod.forceAdFreePermanentReads(): Int {
    val instructions = instructions.toList()
    var forced = 0
    // Descending, so an insert never shifts an index still to be visited.
    for (index in instructions.indices.reversed()) {
        val call = instructions[index]
        if (!call.isGetBoolean()) continue
        val key = call.registers().getOrNull(1) ?: continue
        val source = instructions.subList(0, index).lastOrNull {
            it.opcode.setsRegister() && it is OneRegisterInstruction && it.registerA == key
        }
        if (source?.isAdFreePermanentString() != true) continue

        val moveResult = instructions.getOrNull(index + 1)
        if (moveResult?.opcode != Opcode.MOVE_RESULT) {
            throw PatchException("$definingClass.$name: getBoolean(\"$AD_FREE_PERMANENT\") result is not moved")
        }
        val register = (moveResult as OneRegisterInstruction).registerA
        addInstructionChecked(index + 2, if (register < 16) "const/4 v$register, 0x1" else "const/16 v$register, 0x1")
        forced++
    }
    return forced
}
