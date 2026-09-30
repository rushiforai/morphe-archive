package app.hushmessenger.patches

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * The stock arm64 Messenger builds copied from the S22 and S25 in September 2026.
 *
 * A version name alone is insufficient: Meta publishes several DEX variants with that name.
 * The build is local research input, never part of this repository.
 */
internal object MessengerTarget {
    const val PACKAGE = "com.facebook.orca"
    const val VERSION = "580.0.0.49.91"
    val VERSION_CODES = listOf(346013387, 346013440, 346013442, 346013354, 346013370)
    const val MIN_SDK = 28

    private const val FACEBOOK_SIGNER =
        "e3f9e1e0cf99d0e56a055ba65e241b3399f7cea524326b0cdd6ec1327ed0fdc1"
    private const val META_SIGNER =
        "911d604446084ca7f4760b775bfc160fa8702441240a7258645d7a72c4312d27"

    val COMPATIBILITY = Compatibility(
        name = "Messenger",
        packageName = PACKAGE,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0084FF,
        signatures = setOf(FACEBOOK_SIGNER, META_SIGNER),
        targets = listOf(
            AppTarget(
                version = VERSION,
                versionCodes = null,
                minSdk = MIN_SDK,
                description = "Arm64 builds 346013387, 346013440, 346013442, 346013354 and 346013370; checked again during patching",
            ),
        ),
    )
}
