package app.mix.patches.railone

import app.mix.native.nativeLibPatch
import app.mix.patches.railone.shared.Constants.COMPATIBILITY_RAILONE

/**
 * The protection self-destructs when its verification fails: the wipe functions
 * JNI-reflect `ActivityManager.clearApplicationUserData` (data wipe + force-stop)
 * and the kill dispatcher executes a random guaranteed crash. Patching the entry
 * of each of those functions to `ret` (0xd65f03c0) neutralizes the whole chain.
 */
@Suppress("unused")
internal val neutralizeNativeKillPatch = nativeLibPatch {
    compatibleWith(COMPATIBILITY_RAILONE)
    libraries(ZMAFCCXQ, XZGZORUC)

    execute {
        requireNotNull(library(ZMAFCCXQ)).stringDecoder = railOneStringDecoder(0x80)
        requireNotNull(library(XZGZORUC)).stringDecoder = railOneStringDecoder(0x7E)

        listOf(
            ZmafccxqWipeFingerprint.match(this),
            ZmafccxqSignatureWipeFingerprint.match(this),
            XzgzorucWipeFingerprint.match(this),
            XzgzorucKillDispatcherFingerprint.match(this),
        ).forEach { match ->
            match.function.returnEarly()
        }
    }
}
