package app.morphe.patches.shared.morphe.androidx.media3.exoplayer.hls

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import app.morphe.patches.shared.morphe.androidx.media3.common.MediaItem
import app.morphe.patches.shared.morphe.androidx.media3.datasource.DataSource
import app.morphe.patches.shared.morphe.androidx.media3.exoplayer.drm.DrmSessionManagerProvider
import com.android.tools.smali.dexlib2.AccessFlags

object HlsMediaSource {
    override fun toString() = "Landroidx/media3/exoplayer/hls/HlsMediaSource;"

    object Factory {
        override fun toString() = $$"Landroidx/media3/exoplayer/hls/HlsMediaSource$Factory;"

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
            returnType = HlsMediaSource.toString(),
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
