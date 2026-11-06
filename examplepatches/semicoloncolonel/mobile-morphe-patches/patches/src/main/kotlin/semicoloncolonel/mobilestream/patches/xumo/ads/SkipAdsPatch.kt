package semicoloncolonel.mobilestream.patches.xumo.ads

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.xumo.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Xumo Play (mobile, com.xumo.xumo) — Skip ads.
//
// The mobile app is unobfuscated. Its player (com.xumo.xumo.player.XumoPlayerView)
// already carries a boolean field, adsDisabled, that the developers use to run an
// ad-free playback path: the For You feed's preview players call
// setAdsDisabled(true), and in that state the player plays content directly
// instead of requesting ads. The main player simply leaves the field at its
// default (false), which is why pre-roll and mid-roll ads appear there.
//
// Ads are Google IMA client-side insertions driven entirely by that flag:
//   • XumoPlayerView.updateCuePoints() reads adsDisabled; when true it skips
//     scheduling the mid-roll cue markers, so AdService.playAd(MIDROLL) never
//     fires.
//   • The pre-roll decision reads adsDisabled; when true it calls the content
//     player's play() directly and skips AdService.playAd(PREROLL).
//
// This patch forces every read of adsDisabled to load true, so all playback runs
// through the app's own ad-free path. Nothing ever sets the field to false (its
// only setter is called with true), so there is no state to fight, and because
// the ad-free branch is first-class app code the content never hangs waiting on
// an ad-completion callback.
//
// NOT addressed: live channels, whose ads are stitched into the stream on the
// server (AWS MediaTailor) and do not pass through the IMA player. Those cannot
// be removed on the device; "Mask live ad breaks" covers and mutes them.
// ─────────────────────────────────────────────────────────────────────────────
private const val PLAYER_VIEW = "Lcom/xumo/xumo/player/XumoPlayerView;"
private const val FIELD = "adsDisabled"

@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Removes the pre-roll and mid-roll ads in on-demand videos.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // Replace every `iget-boolean vX, p0, XumoPlayerView->adsDisabled:Z` with
        // `const/16 vX, 0x1`. The object register the iget would have used is not
        // needed afterwards, so dropping the field read is safe; const/16 can
        // address any register the read used.
        var forced = 0
        mutableClassDefBy(PLAYER_VIEW).methods.forEach { method ->
            method.apply {
                val implementation = implementation ?: return@apply
                implementation.instructions.toList().forEachIndexed { index, instruction ->
                    if (instruction.opcode != Opcode.IGET_BOOLEAN) return@forEachIndexed
                    val field = (instruction as ReferenceInstruction).reference as FieldReference
                    if (field.definingClass != PLAYER_VIEW || field.name != FIELD) return@forEachIndexed
                    val register = (instruction as OneRegisterInstruction).registerA
                    replaceInstruction(index, "const/16 v$register, 0x1")
                    forced++
                }
            }
        }

        // Expect at least the pre-roll and mid-roll gates. A miss means the player
        // changed, so fail loudly rather than ship a no-op patch.
        if (forced < 2) {
            throw PatchException(
                "Expected at least two reads of XumoPlayerView.adsDisabled to force, found $forced. " +
                    "The player may have changed in this version.",
            )
        }
    }
}
