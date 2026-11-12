package app.template.patches.addmusic.premium

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_ADDMUSIC
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// The app's Qonversion premium store. The class is R8-renamed, so it is found by shape: one method
// takes the entitlement map, reads the "premium" entitlement and writes the "is_premium" cache,
// and the same class exposes the static ()Z getter the rest of the app calls.
private const val APP = "Lcom/kgs/AddMusicApplication;"
private const val ENTITLEMENT = "Lcom/qonversion/android/sdk/dto/entitlements/QEntitlement;"
private const val PREMIUM_KEY = "is_premium"
private const val BOOLEAN = "Ljava/lang/Boolean;"

/**
 * Add Music keeps premium in two places: the Qonversion entitlement map ("premium") synced into
 * the "premium_access" SharedPreferences flag "is_premium", and a StateFlow that the UI observes.
 * The app seeds the flow from the cached flag at startup and then re-checks Qonversion.
 *
 * The patch (1) makes the static getter answer true, (2) forces the entitlement mapper's boolean
 * to true before it updates the flow and the cache, and (3) seeds the startup cache read true, so
 * the first UI frame is already premium. Qonversion itself, the purchase flow and the writer stay
 * intact.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks the premium features.",
) {
    compatibleWith(COMPATIBILITY_ADDMUSIC)

    execute {
        // 1. Find the entitlement manager: the class with the Map setter and the ()Z getter.
        val managers = mutableListOf<Pair<ClassDef, Method>>()
        classDefForEach { classDef ->
            val setter = classDef.methods.firstOrNull { it.isEntitlementSetter() } ?: return@classDefForEach
            if (classDef.methods.any { it.isPremiumGetter() }) managers += classDef to setter
        }
        val (manager, setter) = managers.singleOrNull() ?: throw PatchException(
            "expected one premium entitlement manager, found ${managers.size}: " +
                managers.joinToString { (classDef, method) -> "${classDef.type}->${method.name}" },
        )

        val mutableManager = mutableClassDefBy(manager)
        val mutableSetter = mutableManager.methods.single {
            it.name == setter.name && it.returnType == setter.returnType &&
                it.parameterTypes.map(CharSequence::toString) == setter.parameterTypes.map(CharSequence::toString)
        }
        val getter = mutableManager.methods.singleOrNull { it.isPremiumGetter() }
            ?: throw PatchException("${manager.type}: the premium getter is gone")
        getter.returnEarly(true)

        // 2. Force the entitlement result before it is boxed into the flow and the cache.
        val setterInsns = mutableSetter.instructions.toList()
        val valueOfCalls = setterInsns.indices.filter { setterInsns[it].calls(BOOLEAN, "valueOf") }
        val valueOf = valueOfCalls.singleOrNull() ?: throw PatchException(
            "${manager.type}->${mutableSetter.name}: expected one Boolean.valueOf(Z), found ${valueOfCalls.size}",
        )
        val bool = setterInsns[valueOf] as? FiveRegisterInstruction
            ?: throw PatchException("${manager.type}->${mutableSetter.name}: Boolean.valueOf is not a register invoke")
        val boolRegister = bool.registerC
        // A jump straight to Boolean.valueOf would skip the forced value (in 9.5 it is not a target).
        mutableSetter.requireNoBranchTargetAt(valueOf, "${manager.type}->${mutableSetter.name} entitlement result")
        mutableSetter.addInstructionsChecked(valueOf, "${const(boolRegister)} v$boolRegister, 0x1")

        // 3. Seed the startup cache read true: getBoolean("is_premium", ...) -> move-result -> 1.
        val onCreate = mutableClassDefBy(APP).methods.singleOrNull {
            it.name == "onCreate" && it.parameterTypes.isEmpty() && it.returnType == "V" && it.implementation != null
        } ?: throw PatchException("$APP.onCreate()V not found")
        val appInsns = onCreate.instructions.toList()
        val key = appInsns.indexOfFirst { it.stringOrNull() == PREMIUM_KEY }
        if (key < 0) throw PatchException("$APP.onCreate()V no longer reads \"$PREMIUM_KEY\"")
        val getBoolean = (key..appInsns.lastIndex).firstOrNull { index ->
            appInsns[index].calls("Landroid/content/SharedPreferences;", "getBoolean")
        } ?: throw PatchException("$APP.onCreate()V: no getBoolean after \"$PREMIUM_KEY\"")
        val move = appInsns.getOrNull(getBoolean + 1)
        if (move?.opcode != Opcode.MOVE_RESULT) {
            throw PatchException("$APP.onCreate()V: getBoolean is not followed by move-result (${move?.opcode})")
        }
        val resultRegister = (move as OneRegisterInstruction).registerA
        onCreate.requireNoBranchTargetAt(getBoolean + 2, "$APP.onCreate()V premium seed")
        onCreate.addInstructionsChecked(getBoolean + 2, "${const(resultRegister)} v$resultRegister, 0x1")
    }
}

private fun const(register: Int) = if (register < 16) "const/4" else "const/16"

/** The Qonversion entitlement mapper: Map -> void, reads "premium", writes "is_premium". */
private fun Method.isEntitlementSetter(): Boolean {
    if (returnType != "V" || parameterTypes.map(CharSequence::toString) != listOf("Ljava/util/Map;")) return false
    if (implementation == null) return false
    val insns = instructions.toList()
    val strings = insns.mapNotNull { it.stringOrNull() }
    if (listOf("entitlements", "premium", PREMIUM_KEY).any { it !in strings }) return false
    if (insns.none { it.calls(ENTITLEMENT, "isActive") }) return false
    return insns.any { it.calls(BOOLEAN, "valueOf") }
}

/** The static ()Z getter backed by the premium StateFlow. */
private fun Method.isPremiumGetter(): Boolean {
    if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "Z" || parameterTypes.isNotEmpty()) return false
    if (implementation == null) return false
    val insns = instructions.toList()
    return insns.any { it.callName() == "getValue" } &&
        insns.any { it.callName() == "booleanValue" }
}

private fun Instruction.stringOrNull(): String? =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.calls(owner: String, name: String): Boolean =
    (this as? ReferenceInstruction)?.reference.let { reference ->
        reference is MethodReference && reference.definingClass == owner && reference.name == name
    }

private fun Instruction.callName(): String? =
    ((this as? ReferenceInstruction)?.reference as? MethodReference)?.name
