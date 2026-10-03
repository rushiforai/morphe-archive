package app.morphe.patches.klikktv.shared.patches.activity.splashScreen

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.Opcode

internal object IsUpdateAvailableFieldAccessFingerprint : Fingerprint(
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/angel/klikk/tv/activity/SplashScreen;",
            name = "isUpdateAvailable",
            type = Type.boolean,
            opcode = Opcode.IGET_BOOLEAN,
        )
    )
)