package ak.alizandro.smartaudiobookplayer

import java.io.Serializable

/** Stand-in for SABP's class of the same name (the fields eppy reads, plus one it ignores), for OtherDevicePositionTest. */
class BookDataBackup(
    @JvmField var mFileName: String?,
    @JvmField var mFilePosition: Int,
    @JvmField var mLastPlaybackTime: Long,
) : Serializable {
    @JvmField var mPlaybackSpeed: Float = 1.25f

    companion object {
        private const val serialVersionUID = 1L
    }
}
