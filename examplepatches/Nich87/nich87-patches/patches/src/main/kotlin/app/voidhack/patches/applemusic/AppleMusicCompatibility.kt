package app.voidhack.patches.applemusic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

internal const val APPLE_MUSIC_701 = "7.0.1"

internal val appleMusicCompatibility = Compatibility(
    name = "Apple Music",
    packageName = "com.apple.android.music",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xFA243C,
    targets = listOf(
        AppTarget(version = "7.0.0", versionCode = 1614),
        AppTarget(version = APPLE_MUSIC_701, versionCode = 1622),
    ),
)

private object LibraryClassName : Fingerprint(
    definingClass = "Lapp/voidhack/extension/applemusic/library/MusicReflection;",
    name = "classNameForVersion",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    returnType = "Ljava/lang/String;",
)

internal val appleMusicLibraryBindings = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        if (packageMetadata.versionName == APPLE_MUSIC_701) {
            LibraryClassName.method.replaceInstruction(0, "return-object p1")
        }
    }
}
