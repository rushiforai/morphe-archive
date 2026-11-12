package app.template.patches.viaplay.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_VIAPLAY_EXPERIMENTAL
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Viaplay inserts its on-demand ads server-side as separate DASH periods, and the player tells
 * Media3 about each one through an AdPlaybackState. The app already marks an ad skipped when it
 * lies before the position playback resumes from, and Media3 then plays past that period. This
 * patch takes the same path for every period that carries an ad, so each ad break is jumped over.
 *
 * The ad-period detection itself is left alone. Content periods and live periods get an empty
 * AdPlaybackState and stay untouched, and the CSE ad beacons are not changed.
 *
 * Verified in bytecode only (26.42.1 on 2026-10-29, re-anchored for 26.44.0 on 2026-11-11): see
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

        // For EVERY period the method builds an AdPlaybackState and puts it into the map. R8 has
        // inlined the app's updater and withSkippedAd(0, 0) into it:
        //     invoke-interface {set, key}, Set.contains(Object)Z
        //     move-result vN
        //     if-eqz vN, :put
        //     iget vR, state, State->removedAdGroupCount:I      (start of the inlined withSkippedAd)
        //     ... adGroups[0 - vR] = adGroups[..].withAdState(SKIPPED, 0) ...
        //     :put
        // Ad periods carry one ad group; content periods (and every live period) carry an empty
        // state with no ad groups, and withSkippedAd(0, 0) indexes adGroups[0], so it must not
        // run for them. The set only holds ad periods before the resume position. The guard is
        // kept, but now tests whether the state has an ad group (adGroups.length): every such
        // state is marked skipped, and empty states are left alone exactly as in stock.
        val guards = insns.setContainsGuards()
        if (guards.size != 1) {
            throw PatchException("Skip ads: $where has ${guards.size} Set.contains guards, expected 1")
        }
        val contains = guards.single()
        val branch = contains + 2
        val guard = insns[branch]
        val result = insns[contains + 1]
        if ((result as OneRegisterInstruction).registerA != (guard as OneRegisterInstruction).registerA) {
            throw PatchException("Skip ads: $where: the Set.contains result is not what the if-eqz tests")
        }
        // The first instruction behind the guard reads an int of the AdPlaybackState (the
        // removed-group count), which names the state register and the (obfuscated) class.
        val read = insns[branch + 1]
        val readField = (read as? ReferenceInstruction)?.reference as? FieldReference
        if (read.opcode != Opcode.IGET || readField == null || readField.type != "I") {
            throw PatchException("Skip ads: $where: no int field read of the AdPlaybackState behind the guard")
        }
        if ((guard as BuilderOffsetInstruction).target.location.index <= branch + 1) {
            throw PatchException("Skip ads: $where: the Set.contains branch does not jump over the skipped-ad code")
        }
        if (guard.location.labels.isNotEmpty()) {
            throw PatchException("Skip ads: $where: the Set.contains branch is itself a branch target")
        }
        val stateRegister = (read as TwoRegisterInstruction).registerB
        val countRegister = (guard as OneRegisterInstruction).registerA

        // The state class's only object-array instance field is adGroups (AdGroup[]). The
        // AdPlaybackState class itself is found by the type of the field read above.
        val adGroups = mutableClassDefBy(readField.definingClass).fields.filter {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.type.startsWith("[L")
        }.singleOrNull() ?: throw PatchException("Skip ads: ${readField.definingClass} has not exactly one object-array field")
        // iget-object is format 22c: both registers must fit 4 bits (rule 11).
        if (stateRegister > 15 || countRegister > 15) {
            throw PatchException("Skip ads: $where uses v$stateRegister/v$countRegister, too high for iget-object")
        }
        method.addInstructionsChecked(
            branch,
            """
                iget-object v$countRegister, v$stateRegister, ${adGroups.definingClass}->${adGroups.name}:${adGroups.type}
                array-length v$countRegister, v$countRegister
            """,
        )
    }
}
