package arpit.morphe.patches.cricfy.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.newLabel
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.indexOfFirstInstructionReversedOrThrow
import arpit.morphe.patches.cricfy.shared.Constants.COMPATIBILITY_CRICFY_TV
import arpit.morphe.patches.cricfy.shared.antiTamperPatch
import arpit.morphe.patches.cricfy.shared.repairInvalidArrayPayloads
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t

/**
 * Removes the four ad surfaces of the app:
 * 1. the sponsor gates (countdown WebActivity / external browser) shown before a
 *    channel opens — the locked channel dialog is preserved,
 * 2. the Unity full-screen ad loaded when the player opens,
 * 3. the sponsor banner on the player screens,
 * 4. the self-hosted full-screen ad shown on app open.
 *
 * All targets are smali/bytecode only; the APK ships a tampered `resources.arsc`,
 * so no resource may be touched.
 */
@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes the sponsor ads (banner and gate screens) and the full-screen " +
        "ads. The locked channel dialog is kept.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRICFY_TV)

    // Repackaging changes the APK signature, which the native config decryptor
    // treats as tampering and answers with the still-encrypted blob. The app would
    // then fail to parse its startup configuration.
    dependsOn(antiTamperPatch)

    execute {
        //
        // 0 — repair the anti-tooling corruption of the app DEX.
        //
        // Every method of the two classes below ends with a dead-code `array-data`
        // payload whose element width is invalid (3, 5, …, 19). dexlib2 validates the
        // width as soon as a method implementation is materialized, so any fingerprint
        // or edit touching these classes would fail with `Invalid element width: n`.
        // The payloads are unreachable (no `fill-array-data` references them); swap
        // them for minimal valid payloads before the fingerprints are resolved.
        //
        // `Lm7;` is the R8-renamed ad manager (pinned by compatibility 7.3); the
        // suffix-matched main activity is fully spelled out for the same reason.
        //
        repairInvalidArrayPayloads(
            "Lm7;",
            "Lcom/android/vending/activities/MainActivity;",
        )

        //
        // Target 1 — sponsor gates before a channel opens (Option B).
        //
        // `g(MainActivity, String, i41)V` dispatches on the selected sponsor index:
        // index 1 shows the locked channel dialog, index 2 opens a countdown
        // WebActivity, index 3 opens an in-app page or the external browser.
        // Retarget the two dispatch comparisons to the app's own "nothing selected"
        // exit (`p3.invoke(); return-void`) so the ad gates open the player directly,
        // while index 1 still falls through to the locked channel dialog.
        //
        val gateMethod = SponsorGateFingerprint.method
        val gateInstructions = gateMethod.instructions

        // The UnlockDilaogBinding.inflate call of the locked channel dialog
        // (second fingerprint filter).
        val dialogInflateIndex = SponsorGateFingerprint.instructionMatches[1].index

        // The two dispatch comparisons are the closest if-eq instructions before
        // the dialog (and the only if-eq instructions in the method).
        val dispatchIndices = (dialogInflateIndex - 1 downTo 0)
            .filter { gateInstructions[it].opcode == Opcode.IF_EQ }
            .take(2)
            .toList()
        check(dispatchIndices.size == 2) {
            "Expected 2 sponsor gate dispatch branches before the locked channel dialog."
        }
        check(dispatchIndices[0] - 1 == dispatchIndices[1]) {
            "Expected the sponsor gate dispatch branches to be adjacent instructions."
        }

        val dispatchBranches = dispatchIndices.map { index ->
            gateInstructions[index] as? BuilderInstruction22t
                ?: error("Expected an if-eq instruction at the sponsor gate dispatch index $index.")
        }
        check(dispatchBranches[0].registerA == dispatchBranches[1].registerA) {
            "Expected the sponsor gate dispatch branches to compare the same register."
        }
        check(dispatchBranches.all { it.target.location.index > dialogInflateIndex }) {
            "The sponsor gate dispatch branches do not jump over the locked channel dialog."
        }

        // The "nothing selected" exit of the method: its last
        // `invoke-interface/range {p3 .. p3}, Li41;->invoke(); return-void` pair.
        val gateExitIndex = gateInstructions.indices.lastOrNull { index ->
            index < gateInstructions.lastIndex &&
                gateInstructions[index].opcode == Opcode.INVOKE_INTERFACE_RANGE &&
                gateInstructions[index + 1].opcode == Opcode.RETURN_VOID
        } ?: error("Could not find the direct-open exit of the sponsor gate method.")
        check(gateExitIndex > dispatchIndices.first()) {
            "The direct-open exit of the sponsor gate method is not after the dispatch branches."
        }

        val gateExitLabel = gateMethod.newLabel(gateExitIndex)
        dispatchIndices.forEachIndexed { slot, index ->
            val branch = dispatchBranches[slot]
            gateMethod.replaceInstruction(
                index,
                BuilderInstruction22t(Opcode.IF_EQ, branch.registerA, branch.registerB, gateExitLabel),
            )
        }

        //
        // Target 2 — Unity full-screen ad.
        //
        // `d(Activity)V` is the only scheduler that calls `UnityAds.load()`. The ad
        // listeners only bump a preference counter, so an early return is safe.
        //
        UnityAdScheduleFingerprint.method.addInstructions(0, "return-void")

        //
        // Target 3 — sponsor banner.
        //
        // `b()Z` is read only for UI gating (banner visibility and rendering), so
        // forcing `false` hides the banner; the banner WebView renderer is never
        // invoked.
        //
        SponsorBannerFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        //
        // Target 4 — self-hosted full-screen ad shown on app open.
        //
        // The ad fires when `sponsors[0].enabled` is true and the open counter
        // ("fullTries") reached the configured ad number. Replace the enabled
        // check with an unconditional jump to its own skip label — the exact path
        // the app takes when the server disables the ad.
        //
        val adMethod = CustomAdFullFingerprint.method

        // The "fullTries" preference read (third fingerprint filter).
        val fullTriesIndex = CustomAdFullFingerprint.instructionMatches[2].index

        val adGateIndex = adMethod.indexOfFirstInstructionReversedOrThrow(fullTriesIndex, Opcode.IF_EQZ)
        val adGate = adMethod.instructions[adGateIndex] as? BuilderOffsetInstruction
            ?: error("Expected an if-eqz instruction at the CustomAdFull gate index $adGateIndex.")
        check(adGate.target.location.index > fullTriesIndex) {
            "The sponsors[0] enabled check does not jump over the CustomAdFull ad block."
        }

        adMethod.replaceInstruction(adGateIndex, BuilderInstruction30t(Opcode.GOTO_32, adGate.target))
    }
}
