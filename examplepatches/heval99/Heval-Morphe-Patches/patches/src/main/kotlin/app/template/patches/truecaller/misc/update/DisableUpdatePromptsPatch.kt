package app.template.patches.truecaller.misc.update

import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.addHevalGate
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls

private const val FEATURE = "truecaller.disable_update_prompts"

// A Heval Controls feature: both early returns apply only while it is on; both methods are asked
// each time a prompt could show.
@Suppress("unused")
val disableUpdatePromptsPatch = truecallerControls.featurePatch(
    HevalFeature(
        id = FEATURE,
        name = "Disable update prompts",
        description = "Disables the update prompts.",
        category = TruecallerControlsCategory.PROMOTIONS,
    ),
) {
    // Validate both hook sites before the first edit.
    val startUpdate = StartUpdateFingerprint.method
    val forcedUpdateType = ForcedUpdateTypeFingerprint.method

    // The suspend function returns a boxed Boolean ("an update flow was started"); report
    // that none was.
    startUpdate.addHevalGate(FEATURE) { v ->
        """
            sget-object $v, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
            return-object $v
        """
    }

    // The server can also mark this version REQUIRED or DISCONTINUED, which shows a
    // full-screen page that blocks the app. Report that no update is needed.
    forcedUpdateType.addHevalGate(FEATURE) { v ->
        """
            sget-object $v, Lcom/truecaller/forcedupdate/UpdateType;->NONE:Lcom/truecaller/forcedupdate/UpdateType;
            return-object $v
        """
    }
}
