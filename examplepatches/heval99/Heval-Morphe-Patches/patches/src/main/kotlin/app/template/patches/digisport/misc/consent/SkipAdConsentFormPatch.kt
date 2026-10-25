package app.template.patches.digisport.misc.consent

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_DIGISPORT
import app.template.patches.shared.addInstructionsChecked

// The binding's root field: data binding stores bindings[0] (the include's root view) as mboundView0.
private const val ROOT_FIELD = "mboundView0"

// The ad consent form (Google UMP) only exists for personalised ads, which "Disable ads" removes.
// MainActivityBase.checkAndShowConsent is not skipped: the GDPR onboarding and Settings wait on
// GoogleConsentUmp.mStatus for SUCCESS or ERROR before they move on or hide their spinner, so the
// helper still reports SUCCESS, just without asking UMP. updateConsent (the privacy options form)
// is only reachable from the "Actualizare date" button, which shows only after a
// SHOW_UPDATE_CONSENT status and so stays hidden.
@Suppress("unused")
val skipAdConsentFormPatch = bytecodePatch(
    name = "Skip ad consent form",
    description = "Skips the ad consent form.",
) {
    compatibleWith(COMPATIBILITY_DIGISPORT)

    execute {
        // 1. loadConsentInfo posts SUCCESS and returns this before it touches UMP, so neither
        // requestConsentInfoUpdate nor loadAndShowConsentFormIfRequired runs.
        LoadConsentInfoFingerprint.method.addInstructionsChecked(
            0,
            """
                iget-object v0, p0, $GOOGLE_CONSENT_UMP->mStatus:Landroidx/lifecycle/MutableLiveData;
                sget-object v1, $GOOGLE_CONSENT_STATUS->SUCCESS:$GOOGLE_CONSENT_STATUS
                invoke-virtual {v0, v1}, Landroidx/lifecycle/MutableLiveData;->postValue(Ljava/lang/Object;)V
                return-object p0
            """,
        )

        // 2. With the button gone, the "Publicitate (Google Ad Manager)" heading and paragraph
        // would stay orphaned: every executeBindings pass sets the whole block GONE first. Nothing
        // later in the method (or elsewhere) touches the root's visibility, so the start is
        // enough. In the parent ConstraintLayout the next block (terms) is constrained to this
        // one's bottom with its own marginTop, and a GONE view's margins collapse, so no extra
        // gap is left. (.locals 11: v0 and v1 are free before the method's own code.)
        val executeBindings = UserDataAdsExecuteBindingsFingerprint.method
        val root = UserDataAdsExecuteBindingsFingerprint.classDef.fields.singleOrNull { it.name == ROOT_FIELD }
            ?: throw PatchException("Skip ad consent form: $USER_DATA_ADS_BINDING has no $ROOT_FIELD field")
        executeBindings.addInstructionsChecked(
            0,
            """
                iget-object v0, p0, $USER_DATA_ADS_BINDING->$ROOT_FIELD:${root.type}
                const/16 v1, 0x8
                invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
            """,
        )
    }
}
