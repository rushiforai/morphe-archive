package app.darkaxt.patches.thelonging

import app.darkaxt.patches.shared.Constants.COMPATIBILITY_THE_LONGING
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourceXml

// Dead code slot: GameManagerScript::PlayIntroOLD (RVA 0xcf8e30, 0 callers, 116 bytes)
private val PLAY_INTRO_OLD_SIG = byteArrayOf(
    0xfe.toByte(), 0x57, 0xbe.toByte(), 0xa9.toByte(),
    0xf4.toByte(), 0x4f, 0x01, 0xa9.toByte(),
    0x94.toByte(), 0x83.toByte(), 0x00, 0xb0.toByte(),
    0x15, 0x7a, 0x00, 0xd0.toByte(),
    0x88.toByte(), 0xee.toByte(), 0x6f, 0x39,
    0xb5.toByte(), 0xde.toByte(), 0x47, 0xf9.toByte(),
)

// ApplyLetterbox16By9ToMainCam() assembled at RVA 0xcf8e30 (116 bytes):
// If Camera.main != null and Screen.width / Screen.height < 1.75f, sets Camera.rect
// to Rect(0, (1 - ar * 9/16) / 2, 1, ar * 9/16) so the starting intro animation fits
// 100% uncropped inside the centered 16:9 stone frame of MenuFakeHUDCanvas.
private val APPLY_INTRO_CAMERA_RECT_CAVE = byteArrayOf(
    0xfd.toByte(), 0x7b, 0xbe.toByte(), 0xa9.toByte(),
    0xf3.toByte(), 0x53, 0x01, 0xa9.toByte(),
    0xe0.toByte(), 0x03, 0x1f, 0xaa.toByte(),
    0xaf.toByte(), 0x34, 0x30, 0x94.toByte(),
    0xc0.toByte(), 0x02, 0x00, 0xb4.toByte(),
    0xf3.toByte(), 0x03, 0x00, 0xaa.toByte(),
    0xe0.toByte(), 0x03, 0x1f, 0xaa.toByte(),
    0xb5.toByte(), 0x55, 0x30, 0x94.toByte(),
    0xf4.toByte(), 0x03, 0x00, 0x2a,
    0xe0.toByte(), 0x03, 0x1f, 0xaa.toByte(),
    0xbc.toByte(), 0x55, 0x30, 0x94.toByte(),
    0x80.toByte(), 0x02, 0x22, 0x1e,
    0x01, 0x00, 0x22, 0x1e,
    0x03, 0x18, 0x21, 0x1e,
    0x02, 0x90.toByte(), 0x2f, 0x1e,
    0x60, 0x20, 0x22, 0x1e,
    0x4a, 0x01, 0x00, 0x54,
    0x00, 0x50, 0x2c, 0x1e,
    0x63, 0x08, 0x20, 0x1e,
    0x02, 0x10, 0x2e, 0x1e,
    0x41, 0x38, 0x23, 0x1e,
    0x00, 0x10, 0x2c, 0x1e,
    0x21, 0x08, 0x20, 0x1e,
    0xe0.toByte(), 0x03, 0x27, 0x1e,
    0xe0.toByte(), 0x03, 0x13, 0xaa.toByte(),
    0xd9.toByte(), 0x31, 0x30, 0x94.toByte(),
    0xf3.toByte(), 0x53, 0x41, 0xa9.toByte(),
    0xfd.toByte(), 0x7b, 0xc2.toByte(), 0xa8.toByte(),
    0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte(),
)

// EndIntro::Start tail (RVA 0xde50b4..0xde50d8, 36 bytes)
private val END_INTRO_START_TAIL_SIG = byteArrayOf(
    0xe0.toByte(), 0x03, 0x13, 0xaa.toByte(),
    0xf4.toByte(), 0x4f, 0x42, 0xa9.toByte(),
    0xf6.toByte(), 0x57, 0x41, 0xa9.toByte(),
    0xfe.toByte(), 0x07, 0x43, 0xf8.toByte(),
    0x4e, 0x4e, 0xf8.toByte(), 0x17,
    0xf4.toByte(), 0x4f, 0x42, 0xa9.toByte(),
    0xf6.toByte(), 0x57, 0x41, 0xa9.toByte(),
    0xfe.toByte(), 0x07, 0x43, 0xf8.toByte(),
    0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte(),
)

// Replaced EndIntro::Start tail: runs wbarrier via bl, shares epilogue, and tail-calls 0xcf8e30
private val END_INTRO_START_TAIL_PATCH = byteArrayOf(
    0xe0.toByte(), 0x03, 0x13, 0xaa.toByte(),
    0x51, 0x4e, 0xf8.toByte(), 0x97.toByte(),
    0x03, 0x00, 0x00, 0x14,
    0x1f, 0x20, 0x03, 0xd5.toByte(),
    0x1f, 0x20, 0x03, 0xd5.toByte(),
    0xf4.toByte(), 0x4f, 0x42, 0xa9.toByte(),
    0xf6.toByte(), 0x57, 0x41, 0xa9.toByte(),
    0xfe.toByte(), 0x07, 0x43, 0xf8.toByte(),
    0x57, 0x4f, 0xfc.toByte(), 0x17,
)

@Suppress("unused")
val introCameraPatch = patch(
    name = "Fix 4:3 / Foldable Starting Intro Camera",
    description = "Aligns Scene 13's Intro Camera viewport to the centered 16:9 stone frame " +
        "on narrow (< 1.75) aspect ratios so the starting intro animation is no longer cropped " +
        "on the left and right edges.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_THE_LONGING)

    execute {
        patchIl2CppFile(resourceFile(IL2CPP_LIB_PATH), "Fix 4:3 / Foldable Starting Intro Camera") { bytes ->
            val caveOff = findBytes(bytes, PLAY_INTRO_OLD_SIG)
            if (caveOff < 0) {
                throw PatchException("GameManagerScript::PlayIntroOLD cave signature not found in $IL2CPP_LIB_PATH.")
            }
            val hookOff = findBytes(bytes, END_INTRO_START_TAIL_SIG)
            if (hookOff < 0) {
                throw PatchException("EndIntro::Start tail signature not found in $IL2CPP_LIB_PATH.")
            }
            System.arraycopy(APPLY_INTRO_CAMERA_RECT_CAVE, 0, bytes, caveOff, APPLY_INTRO_CAMERA_RECT_CAVE.size)
            System.arraycopy(END_INTRO_START_TAIL_PATCH, 0, bytes, hookOff, END_INTRO_START_TAIL_PATCH.size)
        }
        resourceXml("AndroidManifest.xml").use { manifest ->
            val app = manifest.root.children("application").firstOrNull()
                ?: throw PatchException("No <application> element found in AndroidManifest.xml.")
            app.setAttribute("android:extractNativeLibs", "true")
        }
    }
}
