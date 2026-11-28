package semicoloncolonel.mobilestream.patches.mlb.ads

import semicoloncolonel.mobilestream.patches.shared.misc.enableAdBreakTranslation
import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// ─────────────────────────────────────────────────────────────────────────────
// MLB 26.21.0.49 — Mask live ad breaks (EXPERIMENTAL, OPT-IN, default OFF).
//
// Skip ads already strips the ad segments from live playlists too. This adds a
// "Commercial Break in Progress" cover over the player while a live gambling-ad
// break is on air, so the break is hidden even where stripping leaves a gap.
// The cover is driven off the live playlist's ad markers (MlbManifestRewriter
// calls the overlay helper), with the IMA ad-break callbacks as a backup.
//
// This cannot be field-tested outside the season, so it ships off by default
// and experimental. Thanks to ajstrick81, whose Android TV patch designed this.
// ─────────────────────────────────────────────────────────────────────────────

private const val OVERLAY = "Lsemicoloncolonel/mobilestream/extension/mlb/AdBreakOverlayHelper;"

// Part of skipAdsPatch: runs only when its "maskLiveAds" option is on.
internal val maskLiveAdBreaksPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        if (!isOptionOn(skipAdsPatch, "maskLiveAds")) return@execute
        if (isOptionOn(skipAdsPatch, "translate")) enableAdBreakTranslation()
        // Register the SSAI ad view group so the cover has something to attach
        // to: it is the result of the getAdViewGroup() call right before
        // createStreamDisplayContainer(). Best-effort — if the player layout
        // changed, the cover still shows on whatever the manifest signals.
        SsaiDisplayContainerFingerprint.methodOrNull?.apply {
            val instructions = implementation!!.instructions.toList()
            val index = instructions.indexOfFirst {
                (it.opcode == Opcode.INVOKE_VIRTUAL || it.opcode == Opcode.INVOKE_INTERFACE) &&
                    ((it as ReferenceInstruction).reference as? MethodReference)?.name == "getAdViewGroup"
            }
            if (index != -1 && instructions[index + 1].opcode == Opcode.MOVE_RESULT_OBJECT) {
                val register = (instructions[index + 1] as OneRegisterInstruction).registerA
                val paramCount = parameters.size + 1
                val firstParam = implementation!!.registerCount - paramCount
                val name = if (register >= firstParam) "p${register - firstParam}" else "v$register"
                addInstructions(
                    index + 2,
                    "invoke-static { $name }, $OVERLAY->registerAdViewGroup(Landroid/view/ViewGroup;)V",
                )
            }
        }

        // Backup triggers: the IMA ad-break callbacks show and hide the cover.
        AdBreakStartedFingerprint.methodOrNull?.addInstructions(0, "invoke-static {}, $OVERLAY->showOverlay()V")
        AdBreakEndedFingerprint.methodOrNull?.addInstructions(0, "invoke-static {}, $OVERLAY->hideOverlay()V")
    }
}
