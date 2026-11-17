package app.zdrgon.patches.olx.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.zdrgon.patches.olx.shared.Constants.COMPATIBILITY_OLX
import app.zdrgon.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.logging.Logger

/**
 * OLX Pakistan — Plain listings only.
 *
 * Listings are ListingModel (Ldl7;). Proven field map
 * (from the model's own toString / serializer, 18.13.1):
 *   g:Z  isFeatured      — paid FEATURED/boosted listing
 *   S:Z  isElite         — paid elite tier
 *   T:Z  isAdOfTheWeek   — paid promo slot
 *   X:Z  isPowAd         — paid promo slot
 *   p:Lxr;    agencyInfo (AgencyModel) — agency/business seller
 *   A:Ljava/util/List;  agents — agency listings
 *   b0:Lmr;   agencyLocation — agency listings
 *   j:Ljava/lang/String; type — "ecommerce" for store/marketplace listings
 *
 * Every home / search / category listing is deserialized and emitted
 * by one Flow collector, rrb.emit: hit "_source" -> ListingModel ->
 * id de-dup against the repository set -> downstream emit. This
 * patch inserts the discriminator check between the de-dup and the
 * emit, so a featured, elite, promo, agency or store listing is
 * dropped before it can enter any feed list — no blank gaps, and
 * pagination/UI code never sees it. A listing the user opens
 * directly (detail page) does not pass through this sink and still
 * works.
 */
@Suppress("unused")
val plainListingsOnlyPatch = bytecodePatch(
    name = "Plain listings only",
    description = "Removes featured, boosted and paid-promo listings and all agency, " +
        "dealer and store listings from home, search and category feeds, leaving only " +
        "plain listings from individual sellers. OLX Pakistan 18.13.1 only.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_OLX)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        val method = ListingEmitFingerprint.method
        val insns = method.instructions.toList()

        // Locate the de-dup: Set.add(id) in rrb.emit.
        val addIdx = insns.indexOfFirst { insn ->
            insn.opcode == Opcode.INVOKE_INTERFACE &&
                insn.getReference<MethodReference>()?.let { ref ->
                    ref.definingClass == "Ljava/util/Set;" && ref.name == "add"
                } == true
        }
        if (addIdx < 0) {
            throw PatchException("OLX plain listings: Set.add de-dup not found in rrb.emit.")
        }
        // Expected shape (verified against the 18.13.1 dex):
        //   addIdx+0 invoke-interface Set.add
        //   addIdx+1 move-result        (added?)
        //   addIdx+2 if-eqz             (duplicate -> skip emit)
        //   addIdx+3 move-object vEmit, vListing
        //   ...      if-eqz vEmit -> return; invoke vc5.emit; ...; return-object
        val moveObjectIdx = addIdx + 3
        if (insns[addIdx + 1].opcode != Opcode.MOVE_RESULT ||
            insns[addIdx + 2].opcode != Opcode.IF_EQZ ||
            insns[moveObjectIdx].opcode != Opcode.MOVE_OBJECT
        ) {
            throw PatchException("OLX plain listings: rrb.emit shape changed; refusing to guess.")
        }
        val moveObject = insns[moveObjectIdx] as TwoRegisterInstruction
        val listingReg = moveObject.registerB

        // The return-object that both the null path and the emit path
        // converge on: first RETURN_OBJECT after the emit invoke.
        val emitIdx = insns.indices.firstOrNull { i ->
            i > addIdx && insns[i].opcode == Opcode.INVOKE_INTERFACE &&
                insns[i].getReference<MethodReference>()?.let { ref ->
                    ref.definingClass == "Lvc5;" && ref.name == "emit"
                } == true
        } ?: throw PatchException("OLX plain listings: downstream emit not found in rrb.emit.")
        val returnIdx = insns.indices.firstOrNull { i ->
            i > emitIdx && insns[i].opcode == Opcode.RETURN_OBJECT
        } ?: throw PatchException("OLX plain listings: return-object not found in rrb.emit.")

        // Temps: the Set.add move-result register (v12 in this build)
        // and its successor (v13) are both dead at the insertion
        // point — the add result has been branched on and the id
        // string has been consumed.
        val addResult = insns[addIdx + 1] as OneRegisterInstruction
        val tmp = addResult.registerA
        val tmp2 = tmp + 1

        method.addInstructionsWithLabels(
            moveObjectIdx + 1,
            """
                iget-boolean v$tmp, v$listingReg, Ldl7;->g:Z
                if-nez v$tmp, :morphe_drop
                iget-boolean v$tmp, v$listingReg, Ldl7;->S:Z
                if-nez v$tmp, :morphe_drop
                iget-boolean v$tmp, v$listingReg, Ldl7;->T:Z
                if-nez v$tmp, :morphe_drop
                iget-boolean v$tmp, v$listingReg, Ldl7;->X:Z
                if-nez v$tmp, :morphe_drop
                iget-object v$tmp, v$listingReg, Ldl7;->p:Lxr;
                if-nez v$tmp, :morphe_drop
                iget-object v$tmp, v$listingReg, Ldl7;->b0:Lmr;
                if-nez v$tmp, :morphe_drop
                iget-object v$tmp, v$listingReg, Ldl7;->A:Ljava/util/List;
                if-eqz v$tmp, :morphe_check_type
                invoke-interface {v$tmp}, Ljava/util/List;->isEmpty()Z
                move-result v$tmp
                if-nez v$tmp, :morphe_drop
                :morphe_check_type
                iget-object v$tmp, v$listingReg, Ldl7;->j:Ljava/lang/String;
                const-string v$tmp2, "ecommerce"
                invoke-virtual {v$tmp2, v$tmp}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v$tmp
                if-nez v$tmp, :morphe_drop
                goto :morphe_keep
                :morphe_drop
                goto :morphe_return
            """.trimIndent(),
            ExternalLabel("morphe_return", method.getInstruction(returnIdx)),
            // The keep target MUST be an external label bound to the
            // original instruction after the insertion point (the
            // if-eqz on the emit register). A trailing plain label at
            // the end of the smali block resolved to the return
            // instruction instead when this was desktop-tested, which
            // would have made every listing skip the emit.
            ExternalLabel("morphe_keep", method.getInstruction(moveObjectIdx + 1)),
        )
        logger.info("OLX plain listings: filter inserted in rrb.emit (listing v$listingReg, temps v$tmp/v$tmp2).")
    }
}
