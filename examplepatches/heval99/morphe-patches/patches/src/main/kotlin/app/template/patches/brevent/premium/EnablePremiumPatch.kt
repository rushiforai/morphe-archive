package app.template.patches.brevent.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_BREVENT
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction

// Brevent's donation gating reads one count source: the no-arg int getter whose body holds
// the 1185657756 XOR mask (decompiled as ui/I.v() = (P() ? mask ^ H : 0) + x(), where P()
// reports whether the server token parsed and H is its masked Brefoil count). Every tier
// compares v() + w() against thresholds XOR-masked with the same constant: 5 for dynamic GMS
// and suspend (Q.Y1()), 3 for further settings (Q.z4()). Forcing that single getter to 10
// lifts every tier and bypasses the token machinery entirely - which a re-signed build could
// never satisfy anyway, since the token parse feeds fields bound to the original signer.
//
// The getter is located structurally (the only no-arg ()I in the dex holding the mask
// literal), so R8 letter-name rotation cannot break the anchor; if the mask changes, the
// patch fails loudly instead of silently no-opping.
private const val BREFOIL_XOR_MASK = 1185657756
private const val FORCED_BREFOIL = 10

private fun Method.isBrefoilCountGetter(): Boolean =
    parameterTypes.isEmpty() && returnType == "I" &&
        implementation?.instructions?.any { insn ->
            insn is NarrowLiteralInstruction && insn.narrowLiteral == BREFOIL_XOR_MASK
        } == true

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks donation-only features.",
) {
    compatibleWith(COMPATIBILITY_BREVENT)

    execute {
        val getters = mutableListOf<Method>()
        classDefForEach { classDef ->
            classDef.methods.filter { it.isBrefoilCountGetter() }.forEach { getters += it }
        }

        // Mandatory anchor: exactly one count getter must exist.
        val getter = getters.singleOrNull()
            ?: error(
                "Brevent: expected exactly one Brefoil count getter (no-arg int with " +
                    "literal $BREFOIL_XOR_MASK), found ${getters.size} - the mask rotated?"
            )

        mutableClassDefBy(getter.definingClass).methods
            .singleOrNull {
                it.name == getter.name && it.parameterTypes.isEmpty() && it.returnType == "I"
            }
            ?.returnEarly(FORCED_BREFOIL)
            ?: error("Brevent: count getter ${getter.definingClass}.${getter.name} not mutable")
    }
}
