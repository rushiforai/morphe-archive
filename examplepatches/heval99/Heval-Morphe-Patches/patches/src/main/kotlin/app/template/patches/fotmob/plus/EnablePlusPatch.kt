package app.template.patches.fotmob.plus

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.fotmob.misc.extension.sharedExtensionPatch
import app.template.patches.shared.Constants.COMPATIBILITY_FOTMOB
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// The staff-account check holds these unique addresses.
private const val STAFF_EMAIL = "norapps.as@"

private fun MutableMethod?.returnEarlyIfImplemented(value: Boolean) =
    this?.takeIf { it.implementation != null }?.returnEarly(value)

@Suppress("unused")
val enablePlusPatch = bytecodePatch(
    name = "Enable FotMob+",
    description = "Enables app features locked behind the subscription paywall."
) {
    compatibleWith(COMPATIBILITY_FOTMOB)

    dependsOn(sharedExtensionPatch)

    execute {
        // Disable the staff account bypass (forces the normal path).
        val staffMethod = StaffAccountFingerprint.methodOrNull
        staffMethod.returnEarlyIfImplemented(false)

        // The storage layer changes between releases (236 read SharedPreferencesRepository,
        // 237 goes through a settings holder), so locate the subscription getter by shape:
        // inside the manager class it is the only no-arg boolean method that is neither the
        // staff check (holds the staff email string) nor a constant-false stub. Force it true.
        val manager = staffMethod?.definingClass ?: return@execute
        val candidates = mutableClassDefByOrNull(manager)?.methods.orEmpty()
            .filter { it.implementation != null }
            .filter { it.parameterTypes.isEmpty() && it.returnType == "Z" }
            .filter { method ->
                val insns = method.implementation!!.instructions.toList()
                val holdsStaffEmail = insns.any { insn ->
                    ((insn as? ReferenceInstruction)?.reference as? StringReference)
                        ?.string == STAFF_EMAIL
                }
                val constantFalse = insns.size <= 2 &&
                    (insns.firstOrNull() as? NarrowLiteralInstruction)?.narrowLiteral?.toInt() == 0
                !holdsStaffEmail && !constantFalse
            }

        (candidates.singleOrNull() ?: candidates.firstOrNull())?.returnEarly(true)
    }
}
