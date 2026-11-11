package app.morphe.patches.cinematic.shared.morphe.net.live.ent.cinematic.app

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags

object CinematicApp {
    override fun toString() = "Lnet/live/ent/cinematic/app/CinematicApp;"

    object OnCreateFingerprint : Fingerprint(
        definingClass = CinematicApp.toString(),
        name = "onCreate",
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
        returnType = Type.void,
        parameters = emptyList(),
    )
}
