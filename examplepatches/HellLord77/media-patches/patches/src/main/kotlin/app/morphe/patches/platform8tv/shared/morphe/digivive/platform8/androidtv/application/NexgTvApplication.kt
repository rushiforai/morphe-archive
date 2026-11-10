package app.morphe.patches.platform8tv.shared.morphe.digivive.platform8.androidtv.application

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags

object NexgTvApplication {
    override fun toString() = "Ldigivive/platform8/androidtv/application/NexgTvApplication;"

    object OnCreateFingerPrint :
        Fingerprint(
            definingClass = NexgTvApplication.toString(),
            name = "onCreate",
            accessFlags = listOf(AccessFlags.PUBLIC),
            returnType = Type.void,
            parameters = emptyList(),
        )
}
