package app.morphe.patches.bongobdandroidtv.update

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.Opcode

object ForceUpdateFieldAccessFingerprint :
    Fingerprint(
        filters =
            listOf(
                fieldAccess(
                    definingClass = "Lsaas/ott/smarttv/ui/splash/model/VersionCheckResponseModel;",
                    name = "force_update",
                    type = Type.boolean,
                    opcode = Opcode.IGET_BOOLEAN,
                ),
            ),
    )
