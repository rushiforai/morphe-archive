package app.template.patches.fotmob.betting

import app.morphe.patcher.patch.PatchException
import app.template.patches.fotmob.controls.FotMobControlsCategory
import app.template.patches.fotmob.controls.fotMobControls
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.addHevalGate
import app.template.patches.shared.hevalcontrols.featurePatch

internal val HIDE_BETTING_CONTENT = HevalFeature(
    id = "fotmob.hide_betting_content",
    calm = true,
    name = "Hide betting content",
    description = "Hides odds and betting content.",
    category = FotMobControlsCategory.BETTING,
)

// A Patch settings feature (2026-11-03): off, the odds gate runs its stock code. Off in Manager by
// default, as before; on in Patch settings once the patch is selected.
@Suppress("unused")
val hideBettingContentPatch = fotMobControls.featurePatch(
    HIDE_BETTING_CONTENT,
    default = false,
) {
    // The odds gate answers Boolean.FALSE straight away, the result it gives when the user turned
    // odds off. A plain value is a finished suspend result, so callers go on without suspending.
    // The odds format setting is left alone: it also feeds the account settings sync, and forcing
    // it would push "No odds" to the user's server-side settings.
    val gate = OddsGateFingerprint.method
    if (gate.implementation == null) {
        throw PatchException("FotMob odds gate has no implementation")
    }
    gate.addHevalGate(HIDE_BETTING_CONTENT.id) { v ->
        """
            sget-object $v, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
            return-object $v
        """
    }
}
