package app.template.patches.ihealth.aiModal

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess

// Fingerprints BPIncentiveEntity.isShowDialog().
// The server returns a flag in the BP incentive response that controls whether the
// motivational modal (containing the AI-generated reading summary with TTS playback)
// is shown after a blood pressure measurement. Returning false from this getter
// causes the consumer in MainActivity to skip the dialog entirely.
object BpIncentiveIsShowDialogFingerprint : Fingerprint(
    returnType = "Z",
    definingClass = "Lcom/ihealth/db/entity/bp/BPIncentiveEntity;",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/ihealth/db/entity/bp/BPIncentiveEntity;",
            name = "isShowDialog",
            type = "Z",
        )
    )
)
