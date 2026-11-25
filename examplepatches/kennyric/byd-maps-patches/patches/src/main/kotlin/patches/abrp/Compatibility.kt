package patches.abrp

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * ABRP decides Android Automotive Premium from two constants baked into `BuildConfig` at
 * build time: the regular phone build ships `ANDROID_AUTOMOTIVE = "false"` and has no
 * `USE_AUTOMOTIVE_TEMPLATES` field at all, so `isAndroidAutomotiveTemplate` is false and
 * Premium comes only from the account roles.
 *
 * The published input is signed twice over: the store build keeps its publisher identity in
 * the source stamp, and the available bundle is a re-signed archive of that build. Both
 * digests are accepted; the source-stamp digest is taken from the archive's signing block
 * because the original certificate itself is not present in it.
 */
internal val abrp = Compatibility(
    name = "ABRP",
    packageName = "com.iternio.abrpapp",
    apkFileType = ApkFileType.APKS,
    signatures = setOf(
        "3257d599a49d2c961a471ca9843f59d341a405884583fc087df4237b733bbd6d",
        "c1791fb7924062c9aa0e1fcf23aa363e2a7bacd89b14615364dcab2aacaea1f6",
    ),
    targets = listOf(AppTarget(version = "8.0.0", versionCode = 6087, minSdk = 26)),
)

internal val originalInput = patches.shared.originalInput(abrp)
