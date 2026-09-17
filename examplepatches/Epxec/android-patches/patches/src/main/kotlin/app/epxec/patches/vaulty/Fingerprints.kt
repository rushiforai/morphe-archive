package app.epxec.patches.vaulty.Fingerprints

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess

object VaultyProFingerprint : Fingerprint(
    definingClass = "Lhn2;",
    name = "emit",
    filters = listOf(
        fieldAccess(
            smali = "Lon2;->d:Ljj9;"
        ),
    )
)