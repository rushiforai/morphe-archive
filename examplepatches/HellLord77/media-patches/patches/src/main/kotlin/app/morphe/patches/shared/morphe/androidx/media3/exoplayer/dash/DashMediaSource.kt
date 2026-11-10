package app.morphe.patches.shared.morphe.androidx.media3.exoplayer.dash

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import app.morphe.patches.shared.morphe.androidx.media3.common.MediaItem
import app.morphe.patches.shared.morphe.androidx.media3.datasource.DataSource
import app.morphe.patches.shared.morphe.androidx.media3.exoplayer.drm.DrmSessionManagerProvider
import com.android.tools.smali.dexlib2.AccessFlags

object DashMediaSource {
    override fun toString() = "Landroidx/media3/exoplayer/dash/DashMediaSource;"

    object Factory {
        override fun toString() = $$"Landroidx/media3/exoplayer/dash/DashMediaSource$Factory;"

        object ConstructorFingerprint :
            Fingerprint(
                definingClass = Factory.toString(),
                name = "<init>",
                accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
                returnType = Type.void,
                parameters = listOf(DataSource.Factory.toString()),
            )

        object CreateMediaSourceFingerprint : Fingerprint(
            definingClass = Factory.toString(),
            name = "createMediaSource",
            accessFlags = listOf(AccessFlags.PUBLIC),
            returnType = DashMediaSource.toString(),
            parameters = listOf(MediaItem.toString()),
        )

        object SetDrmSessionManagerProviderFingerprint :
            Fingerprint(
                definingClass = Factory.toString(),
                name = "setDrmSessionManagerProvider",
                accessFlags = listOf(AccessFlags.PUBLIC),
                returnType = Factory.toString(),
                parameters = listOf(DrmSessionManagerProvider.toString()),
            )
    }
}
