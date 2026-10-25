package app.template.patches.boxbox.premium

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_BOXBOX
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.Reference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val ENTITLEMENT_INFOS = "Lcom/revenuecat/purchases/EntitlementInfos;"

/**
 * The app decides Free or Pro from `customerInfo.entitlements["Pro_Android"]` and caches the
 * result in PlanDataStore. A never-subscribed account has no such entitlement at all (null,
 * not inactive), so forcing `EntitlementInfo.isActive()` alone left it on Free. The patch
 * therefore forces the plan itself wherever the app reads it.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Pro features. Account-based Pro features may stay locked."
) {
    compatibleWith(COMPATIBILITY_BOXBOX)

    execute {
        // 1. Existing RevenueCat entitlements read as active. Covers accounts that once
        // subscribed; the purchase flow is left alone.
        EntitlementInfoIsActiveFingerprint.method.returnEarly(value = true)

        // The plan enum's Pro constant, and its EnumEntries list (the only static field that
        // is neither a constant nor the values() array).
        val planEnum = PlanEnumClinitFingerprint.classDef
        val enumType = planEnum.type
        val clinit = PlanEnumClinitFingerprint.method.instructions.toList()
        val proIndex = clinit.indexOfFirst { it.stringOrNull() == "Pro" }
        val proField = clinit.drop(proIndex)
            .firstOrNull { it.opcode == Opcode.SPUT_OBJECT && it.fieldOrNull()?.type == enumType }
            ?.fieldOrNull()
            ?: throw PatchException("$enumType.<clinit> stores no constant after \"Pro\"")
        val pro = "$enumType->${proField.name}:$enumType"
        val entries = planEnum.staticFields
            .singleOrNull { it.type != enumType && !it.type.startsWith("[") }
            ?: throw PatchException("$enumType has no single EnumEntries field")

        // 2. The cached plan. PlanDataStore keeps the plan's ordinal and decodes it with
        // entries.get(ordinal); that decode is the only reader of the entries list (the flow's
        // map step in 5.4.16, the static cache read in 5.4.17). Its result becomes Pro.
        var cachedReads = 0
        classDefForEach { classDef ->
            if (classDef.methods.none { it.readsStatic(entries) }) return@classDefForEach
            mutableClassDefBy(classDef).methods.filter { it.readsStatic(entries) }.forEach { method ->
                val instructions = method.instructions.toList()
                // Descending, so an insert never shifts an index still to be visited.
                for (index in instructions.indices.reversed()) {
                    val call = instructions[index]
                    val callee = (call as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                    if (call.opcode != Opcode.INVOKE_VIRTUAL || callee.name != "get" ||
                        callee.parameterTypes.map(CharSequence::toString) != listOf("I") ||
                        callee.returnType != "Ljava/lang/Object;"
                    ) continue
                    val receiver = (call as FiveRegisterInstruction).registerC
                    val source = instructions.subList(0, index).lastOrNull { it.writes(receiver) }
                    if (source?.opcode != Opcode.SGET_OBJECT || !source.fieldOrNull().isSameField(entries)) continue

                    val moveResult = instructions.getOrNull(index + 1)
                    if (moveResult?.opcode != Opcode.MOVE_RESULT_OBJECT) {
                        throw PatchException("${method.definingClass}.${method.name}: entries.get(I) result is not moved")
                    }
                    val register = (moveResult as OneRegisterInstruction).registerA
                    method.addInstructionChecked(index + 2, "sget-object v$register, $pro")
                    cachedReads++
                }
            }
        }
        if (cachedReads == 0) throw PatchException("No read of $enumType entries (the cached plan) found")

        // 3. The RevenueCat-verified plan (5.4.17+): PlanDataStore's methods that return the
        // plan (the live CustomerInfo check and the cache read) return Pro at once, so every
        // reader of either one sees Pro.
        val store = PlanDataStoreClinitFingerprint.classDef
        val planReturns = store.methods.filter { method ->
            method.implementation != null &&
                (method.returnType == "Ljava/lang/Enum;" || method.returnType == enumType)
        }
        planReturns.forEach { method ->
            method.addInstructionsChecked(
                0,
                """
                    sget-object v0, $pro
                    return-object v0
                """,
            )
        }
        // Any store method that still reads the entitlement would decide the plan unpatched.
        val unpatched = store.methods.filter { method ->
            method !in planReturns && method.instructions.any {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == ENTITLEMENT_INFOS
            }
        }
        if (unpatched.isNotEmpty()) {
            throw PatchException("PlanDataStore reads the entitlement in ${unpatched.map { it.name }}, which return no plan")
        }
    }
}

private fun Instruction.stringOrNull(): String? =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.fieldOrNull(): FieldReference? =
    (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Reference?.isSameField(other: FieldReference): Boolean =
    this is FieldReference && definingClass == other.definingClass && name == other.name && type == other.type

private fun Method.readsStatic(field: FieldReference): Boolean =
    implementation?.instructions?.any { it.opcode == Opcode.SGET_OBJECT && it.fieldOrNull().isSameField(field) } == true

private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister() || this !is OneRegisterInstruction) return false
    return registerA == register || (opcode.setsWideRegister() && registerA + 1 == register)
}
