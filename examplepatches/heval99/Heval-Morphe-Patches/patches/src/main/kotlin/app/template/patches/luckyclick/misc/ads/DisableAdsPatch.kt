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
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val GMA = "Lcom/google/android/gms/ads/"
private const val PREFS = "Landroid/content/SharedPreferences;"

// LuckyClick's ad-free purchase is checked on the device: the Play purchase is stored in the
// "prefs" SharedPreferences (AD_FREE_PERMANENT, plus an expiry time for the 30-day / 1-year
// passes) and mirrored into one in-memory Compose state that every ad path reads: the bottom
// banner is not composed, the launch / restore interstitial preloads are skipped, and Start
// (screen-capture request) goes straight on instead of first showing a full-screen interstitial.
// That interstitial is the "long, unskippable" ad: a GMA interstitial mediated to video networks
// (Unity, AppLovin, Pangle, Mintegral, Vungle, ironSource, ...). Since 4.8 a rewarded ad unlocks
// an extra automation flow; with the ad-free state the app adds the flow without it.
//
// The GMA backstops alone would be wrong: with no interstitial loaded and no "no fill" error,
// Start only shows "Loading ad... Please wait" and retries. The ad-free state is what skips it.
//
// Since 4.8 the prefs keys are no longer string literals: each is a lazily decoded string field on
// MainActivity (iget-object F; Lazy.getValue(); check-cast String). The AD_FREE_PERMANENT key
// field and the ad-free state field are therefore taken from the purchase restore, whose only
// putBoolean writes that key and whose only Boolean.valueOf(Z) is stored into that state.
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_LUCKYCLICK)

    // Every patched build is re-signed and would otherwise stop at the license paywall.
    dependsOn(disableLicenseCheckPatch)

    execute {
        val restore = PurchasesRestoreFingerprint.method
        val restoreInstructions = restore.instructions.toList()

        // The AD_FREE_PERMANENT key field: the key of the restore's only putBoolean.
        val putBooleans = restoreInstructions.withIndex().filter { (_, instruction) ->
            instruction.methodRef()?.let {
                it.definingClass == "Landroid/content/SharedPreferences\$Editor;" && it.name == "putBoolean"
            } == true
        }
        if (putBooleans.size != 1) {
            throw PatchException("Disable ads: expected one putBoolean in the purchase restore, found ${putBooleans.size}")
        }
        val (putIndex, put) = putBooleans.single()
        val keyField = put.registers().getOrNull(1)?.let { restoreInstructions.keyFieldOf(it, putIndex) }
            ?: throw PatchException("Disable ads: the purchase restore's putBoolean key is not a lazily decoded key field")

        // The ad-free state: the receiver of the setValue that stores the restore's only
        // Boolean.valueOf(Z).
        val valueOfs = restoreInstructions.withIndex().filter { (_, instruction) ->
            val ref = instruction.methodRef()
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
            ?: throw PatchException("Disable ads: the purchase restore ends after its Boolean.valueOf")
        val storeRef = store.methodRef()
        if (storeRef?.name != "setValue" || boxed !in store.registers()) {
            throw PatchException("Disable ads: the purchase restore does not setValue its ad-free Boolean (found $storeRef)")
        }
        val stateField = store.registers().first().let { restoreInstructions.staticFieldIn(it, valueOfIndex + 2) }
            ?: throw PatchException("Disable ads: the purchase restore's ad-free state is not a static field")

        // 1. Every getBoolean(AD_FREE_PERMANENT, ...) answers true. The startup read (called from
        // MainActivity.onCreate and onResume) sets the ad-free state before any UI or ad code
        // runs (the time-limited pass is then not consulted); the settings screen's read shows
        // the pass as "Permanent".
        var reads = 0
        var startupRead = false
        classDefForEach { classDef ->
            if (classDef.methods.none { it.readsKey(keyField) }) return@classDefForEach
            mutableClassDefBy(classDef).methods.filter { it.readsKey(keyField) }.forEach { method ->
                val forced = method.forceKeyReads(keyField)
                reads += forced
                if (forced > 0 && method.setsTrue(stateField)) startupRead = true
            }
        }
        if (!startupRead) {
            throw PatchException("Disable ads: no AD_FREE_PERMANENT read sets the ad-free state to TRUE ($reads reads found)")
        }

        // 2. The purchase restore (every onResume) must not reset the state to false when Play
        // reports no ad-free purchase: the state it stores becomes Boolean.TRUE. Purchases are
        // still acknowledged / consumed as before.
        restore.addInstructionChecked(valueOfIndex + 2, "sget-object v$boxed, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;")

        // 3. Backstop at the SDK, so no mediated network can show anything should a new ad path
        // skip the ad-free state: never initialize Google Mobile Ads, and neuter every MobileAds
        // static that needs it (AGENTS.md rule 9). The app calls initialize from onCreate.
        neutraliseMobileAdsStatics("initialize")

        // Interstitial and rewarded loads (static InterstitialAd.load / RewardedAd.load, every
        // overload) and the banner's BaseAdView.loadAd (AdView has no loadAd of its own). The app
        // loads no other format.
        for ((owner, name) in listOf(
            "${GMA}interstitial/InterstitialAd;" to "load",
            "${GMA}rewarded/RewardedAd;" to "load",
            "${GMA}BaseAdView;" to "loadAd",
        )) {
            val targets = mutableClassDefBy(owner).methods.filter {
                it.name == name && it.returnType == "V" && it.implementation != null
            }
            if (targets.isEmpty()) throw PatchException("Disable ads: no concrete void $owner->$name")
            targets.forEach { it.returnEarly() }
        }
    }
}

private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.fieldRef() = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun FieldReference.sameAs(other: FieldReference) =
    definingClass == other.definingClass && name == other.name && type == other.type

private fun Instruction.registers(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}

// Index of the last instruction before [before] that writes [register] (straight-line scan).
private fun List<Instruction>.lastWriteOf(register: Int, before: Int): Int? =
    (before - 1 downTo 0).firstOrNull { index ->
        val instruction = this[index]
        instruction is OneRegisterInstruction && instruction.registerA == register &&
            (instruction.opcode.setsRegister() || instruction.opcode == Opcode.CHECK_CAST)
    }

// The field a prefs key register was loaded from: iget-object F; F.getValue(); move-result-object;
// check-cast String (a Kotlin lazy holding the decoded key).
private fun List<Instruction>.keyFieldOf(register: Int, before: Int): FieldReference? {
    var index = lastWriteOf(register, before) ?: return null
    if (this[index].opcode == Opcode.CHECK_CAST) index = lastWriteOf(register, index) ?: return null
    if (this[index].opcode != Opcode.MOVE_RESULT_OBJECT) return null
    val call = getOrNull(index - 1) ?: return null
    val ref = call.methodRef() ?: return null
    if (ref.name != "getValue" || ref.parameterTypes.isNotEmpty()) return null
    val receiver = call.registers().firstOrNull() ?: return null
    val source = lastWriteOf(receiver, index - 1) ?: return null
    return this[source].takeIf { it.opcode == Opcode.IGET_OBJECT }?.fieldRef()
}

// The static field a register was loaded from with sget-object, if any.
private fun List<Instruction>.staticFieldIn(register: Int, before: Int): FieldReference? =
    lastWriteOf(register, before)?.let { this[it] }?.takeIf { it.opcode == Opcode.SGET_OBJECT }?.fieldRef()

private fun Instruction.isGetBoolean(): Boolean {
    val ref = methodRef() ?: return false
    return (opcode == Opcode.INVOKE_INTERFACE || opcode == Opcode.INVOKE_INTERFACE_RANGE) &&
        ref.definingClass == PREFS && ref.name == "getBoolean"
}

private fun Method.readsKey(keyField: FieldReference): Boolean {
    val instructions = implementation?.instructions ?: return false
    return instructions.any { it.opcode == Opcode.IGET_OBJECT && it.fieldRef()?.sameAs(keyField) == true } &&
        instructions.any { it.isGetBoolean() }
}

// Whether the method stores Boolean.TRUE into [stateField] (stateField.setValue(TRUE)).
private fun Method.setsTrue(stateField: FieldReference): Boolean {
    val instructions = implementation?.instructions?.toList() ?: return false
    return instructions.withIndex().any { (index, instruction) ->
        val registers = instruction.registers()
        instruction.methodRef()?.name == "setValue" && registers.size == 2 &&
            instructions.staticFieldIn(registers[0], index)?.sameAs(stateField) == true &&
            instructions.staticFieldIn(registers[1], index)?.let {
                it.definingClass == "Ljava/lang/Boolean;" && it.name == "TRUE"
            } == true
    }
}

// Forces the result of each getBoolean whose key comes from [keyField] to true; returns how many
// reads were changed.
private fun MutableMethod.forceKeyReads(keyField: FieldReference): Int {
    val instructions = instructions.toList()
    var forced = 0
    // Descending, so an insert never shifts an index still to be visited.
    for (index in instructions.indices.reversed()) {
        val call = instructions[index]
        if (!call.isGetBoolean()) continue
        val key = call.registers().getOrNull(1) ?: continue
        if (instructions.keyFieldOf(key, index)?.sameAs(keyField) != true) continue

        val moveResult = instructions.getOrNull(index + 1)
        if (moveResult?.opcode != Opcode.MOVE_RESULT) {
            throw PatchException("$definingClass.$name: getBoolean(AD_FREE_PERMANENT) result is not moved")
        }
        val register = (moveResult as OneRegisterInstruction).registerA
        addInstructionChecked(index + 2, if (register < 16) "const/4 v$register, 0x1" else "const/16 v$register, 0x1")
        forced++
    }
    return forced
}
