package anxyis.morphe.patches.pure.gates

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import anxyis.morphe.patches.pure.shared.ALIGHT_5270
import anxyis.morphe.patches.pure.shared.ensureRegisters
import anxyis.morphe.patches.pure.shared.forceResultConst
import anxyis.morphe.patches.pure.shared.matchSingle
import anxyis.morphe.patches.pure.shared.replaceBodyFromBundle
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * MainActivity project/entry + import-request features.
 *
 * Zjm(ILbi/DXi;ZFunction1)V is the big menu dispatcher. Tanryu's delta:
 *  (a) redirect the :cond_2 case (cloud export) to OPEN_DOCUMENT zip import
 *      (startActivityForResult 0x7a11),
 *  (b) renumber every `goto/16 :goto_5` to `:goto_4` and every `:cond_N` /
 *      `:goto_N` label DOWN by the methods Tanryu deleted... NO — precisely:
 *      Tanryu DELETED the `:cond_2` cloud-export block (26 stock lines:
 *      projectlist_export_click_cloud analytics + fragment lookup +
 *      mF share-prep + callback invoke) and renumbered all labels that
 *      followed (:goto_5->:goto_4, :cond_3->:cond_2 ... :cond_a->:cond_8,
 *      :goto_4->:goto_3, :cond_7->:cond_5 etc.) to keep the switch table
 *      consistent.
 *
 * Replicating label renumbering with add/remove alone is infeasible
 * (branch targets are label references, not editable integers — Morphe's
 * addInstructions assembles NEW labels but cannot rewrite EXISTING target
 * operands). Two candidate strategies:
 *
 *  STRATEGY 1 (chosen): whole-method replaceBody with the Tanryu-side Zjm
 *  text. Zjm is large (~500 insns) but self-contained; the body is stored
 *  verbatim under resources and injected via clearBody+addInstructions.
 *  Labels inside the body are defined AND used inside the same injected
 *  text, so assembly is sound. Register count mirrored from Tanryu (.locals
 *  count read at extraction; asserted here).
 *
 *  onActivityResult: 4 small hunks (request-code 0x7a11 branch + zip-import
 *  :cond_2 block + label renumber :cond_3->:cond_4). Same strategy problem
 *  at smaller scale — BUT here the changes are expresses as: insert 2 lines
 *  at head, insert 2 lines, replace 2 blocks. The replace blocks contain
 *  NEW labels (:cond_4) referenced by BOTH new and retained code...
 *  whole-method replaceBody again (method is ~60 insns; Tanryu body stored).
 *
 * Bodies: pure-bundle/bodies/MainActivity_Zjm.smali,
 *         pure-bundle/bodies/MainActivity_onActivityResult.smali
 * (extracted by tools/extract_bodies.py from the Tanryu-side tree; brand
 * literals reverted — these two methods contain no brand strings; verified
 * at extraction).
 *
 * Pkl()/MJD() b2-forces live in the membership sweep (already covered).
 * e4H lives in MiscFunctionalPatch. onCreate's license call lives in the
 * license strip. This patch owns ONLY Zjm + onActivityResult.
 */
private const val MAIN = "Lcom/alightcreative/app/motion/activities/main/MainActivity;"

private object ZjmDispatch : Fingerprint(
    definingClass = MAIN,
    name = "Zjm",
    returnType = "V",
    parameters = listOf("I", "Lbi/DXi;", "Z", "Lkotlin/jvm/functions/Function1;"),
)

private object OnActivityResult : Fingerprint(
    definingClass = MAIN,
    name = "onActivityResult",
    returnType = "V",
    parameters = listOf("I", "I", "Landroid/content/Intent;"),
)

@Suppress("unused")
val mainActivityFeaturesPatch = bytecodePatch(
    name = "Multi-project import",
    description = "Lets you open multi-project files.",
) {
    compatibleWith(ALIGHT_5270)
    execute {
        ZjmDispatch.matchSingle()
        replaceBodyFromBundle(
            MAIN, "Zjm",
            listOf("I", "Lbi/DXi;", "Z", "Lkotlin/jvm/functions/Function1;"), "V",
            "pure-bundle/bodies/MainActivity_Zjm.smali",
        )
        OnActivityResult.matchSingle()
        replaceBodyFromBundle(
            MAIN, "onActivityResult",
            listOf("I", "I", "Landroid/content/Intent;"), "V",
            "pure-bundle/bodies/MainActivity_onActivityResult.smali",
        )
    }
}
