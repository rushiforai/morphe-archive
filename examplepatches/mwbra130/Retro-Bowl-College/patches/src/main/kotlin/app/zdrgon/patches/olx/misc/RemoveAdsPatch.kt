package app.zdrgon.patches.olx.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.zdrgon.patches.olx.shared.Constants.COMPATIBILITY_OLX
import app.zdrgon.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import java.util.logging.Logger

/**
 * OLX Pakistan — Remove ads.
 *
 * The only third-party ad SDK in 18.13.1 is Google Mobile Ads
 * (next-gen); there is no Meta/AppLovin/Unity/ironSource/InMobi
 * code in the dex. In the listing feed its banner is the
 * ListingAdBanner item (Llk7;), interleaved into the
 * stream by the search repository's flow transform,
 * urb.invokeSuspend, together with three first-party promo items:
 * FeaturedAgency (Lf35;), CarInspectionWidget
 * (Lis1;) and InterScroller (Ljs6;).
 *
 * urb.invokeSuspend gates each promo on a computed register
 * (verified instruction-by-instruction against the 18.13.1
 * classes2.dex dump):
 *   - FeaturedAgency: constructed only when the agency list is
 *     non-empty — `move-result vEmpty` (List.isEmpty) then
 *     `if-nez vEmpty, skip`. Pinning vEmpty to 1 right after the
 *     move-result always takes the skip.
 *   - CarInspectionWidget: `rem-int/lit8 v1, v1, 20` then
 *     `if-nez v1, skip` — pinning v1 to 1 after the rem always skips.
 *   - ListingAdBanner: `rem-int/lit8 v1, v1, 8` then (via a copy)
 *     `if-nez v17, skip` — pinning v1 to 1 after the rem always skips.
 *   - InterScroller: counter v11 tested `if-ne v11, 14, skip` —
 *     pinning v11 to 0 right before the test always skips.
 * Every pinned register is dead or reloaded after its gate in this
 * build, and each site is re-verified by shape below before it is
 * touched — a changed build fails the patch instead of corrupting
 * the method.
 */
@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes the Google Ads banner, featured-agency cards and promo " +
        "widgets that are interleaved into home, search and category feeds. " +
        "OLX Pakistan 18.13.1 only.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_OLX)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        val method = FeedTransformFingerprint.method
        // Snapshot first: insertions shift later indices, so collect
        // all insertion points against the original list, then apply
        // them from last to first.
        val insns = method.instructions.toList()
        val insertions = mutableListOf<Pair<Int, String>>()

        fun remGate(divisor: Int, label: String) {
            val remIdx = insns.indexOfFirst { insn ->
                insn.opcode == Opcode.REM_INT_LIT8 &&
                    (insn as NarrowLiteralInstruction).narrowLiteral == divisor
            }
            if (remIdx < 0) {
                throw PatchException("OLX remove ads: rem-int/lit8 /$divisor gate ($label) not found in urb.invokeSuspend.")
            }
            val dest = (insns[remIdx] as TwoRegisterInstruction).registerA
            insertions += (remIdx + 1) to "const/4 v$dest, 0x1"
        }

        // CarInspectionWidget: every 20th slot.
        remGate(20, "CarInspectionWidget")
        // ListingAdBanner: every 8th slot.
        remGate(8, "ListingAdBanner")

        // FeaturedAgency: anchor on the f35 construction and walk
        // back to its isEmpty gate (see header).
        val f35Idx = insns.indexOfFirst { insn ->
            insn.opcode == Opcode.NEW_INSTANCE &&
                insn.getReference<TypeReference>()?.type == "Lf35;"
        }
        if (f35Idx < 0) {
            throw PatchException("OLX remove ads: FeaturedAgency construction not found in urb.invokeSuspend.")
        }
        var emptyMoveResultIdx = -1
        for (i in f35Idx - 1 downTo maxOf(0, f35Idx - 80)) {
            if (insns[i].opcode == Opcode.MOVE_RESULT) {
                val next = insns.getOrNull(i + 1)
                if (next != null && next.opcode == Opcode.IF_NEZ) {
                    emptyMoveResultIdx = i
                    break
                }
            }
        }
        if (emptyMoveResultIdx < 0) {
            throw PatchException("OLX remove ads: FeaturedAgency isEmpty gate not found in urb.invokeSuspend.")
        }
        val emptyReg = (insns[emptyMoveResultIdx] as OneRegisterInstruction).registerA
        insertions += (emptyMoveResultIdx + 1) to "const/4 v$emptyReg, 0x1"

        // InterScroller: the IF_NE whose immediately preceding
        // instruction loads the literal 14 (const/16).
        var interIdx = -1
        for (i in 1 until insns.size) {
            val prev = insns[i - 1]
            val cur = insns[i]
            if (cur.opcode == Opcode.IF_NE &&
                prev.opcode == Opcode.CONST_16 &&
                (prev as NarrowLiteralInstruction).narrowLiteral == 14
            ) {
                interIdx = i
                break
            }
        }
        if (interIdx < 0) {
            throw PatchException("OLX remove ads: InterScroller gate not found in urb.invokeSuspend.")
        }
        val counterReg = (insns[interIdx] as TwoRegisterInstruction).registerA
        insertions += interIdx to "const/4 v$counterReg, 0x0"

        insertions.sortedByDescending { it.first }.forEach { (index, smali) ->
            method.addInstruction(index, smali)
        }
        logger.info("OLX remove ads: ${insertions.size} promo gates pinned in urb.invokeSuspend.")
    }
}
