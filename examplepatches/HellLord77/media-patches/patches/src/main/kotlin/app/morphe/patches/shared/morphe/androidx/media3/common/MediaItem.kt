package app.morphe.patches.shared.morphe.androidx.media3.common

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.morphe.java.lang.String
import com.android.tools.smali.dexlib2.AccessFlags

object MediaItem {
    override fun toString() = "Landroidx/media3/common/MediaItem;"

    object Builder {
        override fun toString() = $$"Landroidx/media3/common/MediaItem$Builder;"

        object SetMimeTypeFingerprint : Fingerprint(
            definingClass = Builder.toString(),
            name = "setMimeType",
            accessFlags = listOf(AccessFlags.PUBLIC),
            returnType = Builder.toString(),
            parameters = listOf(String.toString()),
        )

        object SetUriFingerprint : Fingerprint(
            definingClass = Builder.toString(),
            name = "setUri",
            accessFlags = listOf(AccessFlags.PUBLIC),
            returnType = Builder.toString(),
            parameters = listOf(String.toString()),
        )
    }
}
