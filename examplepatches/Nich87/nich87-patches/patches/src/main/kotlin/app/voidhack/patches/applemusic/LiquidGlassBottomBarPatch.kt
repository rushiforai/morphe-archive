package app.voidhack.patches.applemusic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION = "Lapp/voidhack/extension/applemusic/LiquidGlass;"

private object MusicContentViewCreated : Fingerprint(
    definingClass = "Lcom/apple/android/music/common/fragment/MusicContentFragment;",
    name = "onViewCreated",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
    returnType = "V",
    strings = listOf("miniPlayerBlur", "getDecorView(...)"),
)

@Suppress("unused")
val liquidGlassBottomBarPatch = bytecodePatch(
    name = "Liquid Glass bottom bar",
    description = "Adds live refractive glass to Apple Music's mini-player and bottom tabs, with whole-bar touch feedback, drag parallax and an animated selection lens. Refraction requires Android 13 or newer.",
) {
    compatibleWith(
        Compatibility(
            name = "Apple Music",
            packageName = "com.apple.android.music",
            apkFileType = ApkFileType.APK,
            appIconColor = 0xFA243C,
            targets = listOf(AppTarget(version = "7.0.0")),
        )
    )
    extendWith("extensions/extension.mpe")

    execute {
        MusicContentViewCreated.method.addInstruction(
            0,
            "invoke-static/range {p1 .. p1}, $EXTENSION->install(Landroid/view/View;)V",
        )
    }
}
