package tw.maps

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_MAPS
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * `btxk.h()` is the single "travel mode Android Auto supports" source in Maps 26.44. Every
 * projected-mode decision compares against it:
 *  - trq.h()/trq.f(): adds PROJECTED_ONLY_DRIVING_SUPPORTED when the route's mode differs;
 *  - siy.d(): ends navigation on the car screen when the mode differs
 *    ("To navigate on Android Auto, switch to driving directions and start again");
 *  - ryq.d(): builds the request for destinations searched on the car screen.
 *
 * Stock Maps returns TWO_WHEELER only when the car reports itself as a MOTORCYCLE, which a
 * re-signed Maps never learns (its private car connection is skipped). Returning TWO_WHEELER
 * unconditionally makes Android Auto accept two-wheeler navigation started on the phone and
 * plan two-wheeler routes for destinations searched on the head unit. Driving navigation
 * is then the one refused on Android Auto -- intended for a motorcycle-only head unit.
 *
 * Replaces "Experimental projected CAR two-wheeler routing" (both edit btxk.h()); select one.
 */
@Suppress("unused")
val alwaysTwoWheelerOnAndroidAuto = bytecodePatch(
    name = "Always two-wheeler on Android Auto",
    description = "26.44.06.1006895251 only. Android Auto treats two-wheeler (motorcycle) as its supported mode, so " +
        "destinations searched on the head unit default to two-wheeler routes. Use with " +
        "\"Allow any travel mode on Android Auto\" so driving routes are still accepted.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MAPS)
    execute {
        val method = mutableClassDefBy("Lbtxk;").methods.singleOrNull {
            it.name == "h" && it.parameterTypes.isEmpty() && it.returnType == "Lckbl;"
        } ?: throw PatchException("btxk.h()Lckbl; not found; Maps changed")
        val implementation = method.implementation ?: throw PatchException("btxk.h() has no body")

        // Fingerprint: the projected selector chooses between DRIVE (ckbl.a) and TWO_WHEELER (ckbl.f).
        val modes = implementation.instructions.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? FieldReference)
                ?.takeIf { ref -> ref.definingClass == "Lckbl;" && ref.type == "Lckbl;" }?.name
        }.toSet()
        if (!modes.containsAll(setOf("a", "f"))) {
            throw PatchException("btxk.h() no longer selects between ckbl.a and ckbl.f; Maps changed")
        }
        if (implementation.registerCount < 1) throw PatchException("btxk.h() has no register to use")
        // Its first instruction would already return TWO_WHEELER if applied twice.
        val first = implementation.instructions.first()
        if (((first as? ReferenceInstruction)?.reference as? FieldReference)?.let { it.definingClass == "Lckbl;" && it.name == "f" } == true) {
            throw PatchException("Already applied")
        }

        method.addInstructions(
            0,
            """
                sget-object v0, Lckbl;->f:Lckbl;
                return-object v0
            """,
        )
    }
}
