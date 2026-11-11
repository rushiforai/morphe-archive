package app.morphe.patches.cinematic.shared.morphe.net.live.ent.cinematic.features

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import app.morphe.patches.shared.morphe.android.os.Bundle
import com.android.tools.smali.dexlib2.AccessFlags

object HomeActivity {
    override fun toString() = "Lnet/live/ent/cinematic/features/HomeActivity;"

    object OnCreateFingerprint : Fingerprint(
        definingClass = HomeActivity.toString(),
        name = "onCreate",
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
        returnType = Type.void,
        parameters = listOf(Bundle.toString()),
    )
}
