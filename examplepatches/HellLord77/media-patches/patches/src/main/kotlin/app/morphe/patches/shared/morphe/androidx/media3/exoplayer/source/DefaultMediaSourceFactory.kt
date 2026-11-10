package app.morphe.patches.shared.morphe.androidx.media3.exoplayer.source

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import app.morphe.patches.shared.morphe.androidx.media3.common.MediaItem
import app.morphe.patches.shared.morphe.androidx.media3.datasource.DataSource
import app.morphe.patches.shared.morphe.androidx.media3.exoplayer.drm.DrmSessionManagerProvider
import com.android.tools.smali.dexlib2.AccessFlags

object DefaultMediaSourceFactory {
    override fun toString() = "Landroidx/media3/exoplayer/source/DefaultMediaSourceFactory;"

    object ConstructorFingerprint :
        Fingerprint(
            definingClass = DefaultMediaSourceFactory.toString(),
            name = "<init>",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
            returnType = Type.void,
            parameters = listOf(DataSource.Factory.toString()),
        )

    object CreateMediaSourceFingerprint : Fingerprint(
        definingClass = DefaultMediaSourceFactory.toString(),
        name = "createMediaSource",
        accessFlags = listOf(AccessFlags.PUBLIC),
        returnType = MediaSource.toString(),
        parameters = listOf(MediaItem.toString()),
    )

    object SetDrmSessionManagerProviderFingerprint :
        Fingerprint(
            definingClass = DefaultMediaSourceFactory.toString(),
            name = "setDrmSessionManagerProvider",
            accessFlags = listOf(AccessFlags.PUBLIC),
            returnType = DefaultMediaSourceFactory.toString(),
            parameters = listOf(DrmSessionManagerProvider.toString()),
        )
}
