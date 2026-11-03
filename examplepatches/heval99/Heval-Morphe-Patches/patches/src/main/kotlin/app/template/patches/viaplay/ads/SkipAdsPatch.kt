package app.template.patches.viaplay.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_VIAPLAY_EXPERIMENTAL
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Viaplay inserts its on-demand ads server-side as separate DASH periods, and the player tells
 * Media3 about each one through an AdPlaybackState. The app already marks an ad skipped when it
 * lies before the position playback resumes from, and Media3 then plays past that period. This
 * patch takes the same path for every period that carries an ad, so each ad break is jumped over.
 *
 * The ad-period detection itself is left alone. Content periods and live periods get an empty
 * AdPlaybackState and stay untouched, and the CSE ad beacons are not changed.
 *
 * Verified 2026-10-29 against 26.42.1 (versionCode 2642010) in bytecode only: see
 * COMPATIBILITY_VIAPLAY_EXPERIMENTAL.
 */
@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Skips the ad breaks in on-demand videos.",
) {
    compatibleWith(COMPATIBILITY_VIAPLAY_EXPERIMENTAL)

    execute {
        val method = AdPlaybackStateUpdaterFingerprint.method
        val where = "${method.definingClass}->${method.name}"
        val insns = method.implementation!!.instructions.toList()
        fun MethodReference?.isCall(definingClass: String, name: String) =
            this?.definingClass == definingClass && this.name == name
        fun ref(index: Int) = (insns.getOrNull(index) as? ReferenceInstruction)?.reference as? MethodReference

        // The tail of the method puts EVERY period's AdPlaybackState into the map, as
        //     invoke-interface {set, uid}, Set.contains(Object)
        //     move-result vN
        //     if-eqz vN, :put
        //     invoke-virtual {state, 0, 0}, AdPlaybackState.withSkippedAd(II)
        //     move-result-object state
        //     :put ...
        // Ad periods carry one ad group; content periods (and every live period) carry an empty
        // state with no ad groups, and withSkippedAd(0, 0) indexes adGroups[0], so it must not
        // run for them. The set only holds ad periods before the resume position. The guard is
        // kept, but now tests the state's adGroupCount instead: every state with an ad group is
        // marked skipped, and empty states are left alone exactly as in stock.
        val skips = insns.indices.filter { ref(it).isCall(AD_PLAYBACK_STATE, "withSkippedAd") }
        if (skips.size != 1) {
            throw PatchException("Skip ads: $where calls AdPlaybackState.withSkippedAd ${skips.size} times, expected 1")
        }
        val skip = skips.single()
        val branch = skip - 1
        val guard = insns.getOrNull(branch)
        val result = insns.getOrNull(skip - 2)
        if (guard?.opcode != Opcode.IF_EQZ ||
            result?.opcode != Opcode.MOVE_RESULT ||
            (result as OneRegisterInstruction).registerA != (guard as OneRegisterInstruction).registerA ||
            !ref(skip - 3).isCall("Ljava/util/Set;", "contains")
        ) {
            throw PatchException("Skip ads: $where does not guard withSkippedAd with if-eqz on Set.contains")
        }
        if ((guard as BuilderOffsetInstruction).target.location.index <= skip) {
            throw PatchException("Skip ads: $where: the Set.contains branch does not jump over withSkippedAd")
        }
        if (guard.location.labels.isNotEmpty()) {
            throw PatchException("Skip ads: $where: the Set.contains branch is itself a branch target")
        }

        if (mutableClassDefBy(AD_PLAYBACK_STATE).fields.none { it.name == "adGroupCount" && it.type == "I" }) {
            throw PatchException("Skip ads: $AD_PLAYBACK_STATE has no adGroupCount:I field")
        }
        // iget is format 22c: both registers must fit 4 bits (rule 11).
        val stateRegister = (insns[skip] as FiveRegisterInstruction).registerC
        val countRegister = (guard as OneRegisterInstruction).registerA
        if (stateRegister > 15 || countRegister > 15) {
            throw PatchException("Skip ads: $where uses v$stateRegister/v$countRegister, too high for iget")
        }
        method.addInstructionsChecked(
            branch,
            "iget v$countRegister, v$stateRegister, $AD_PLAYBACK_STATE->adGroupCount:I",
        )
    }
}
