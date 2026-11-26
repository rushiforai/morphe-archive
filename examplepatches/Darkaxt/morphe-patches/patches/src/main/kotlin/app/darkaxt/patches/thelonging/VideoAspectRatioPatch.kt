package app.darkaxt.patches.thelonging

import app.darkaxt.patches.shared.Constants.COMPATIBILITY_THE_LONGING
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourceXml

// NewUnityVideoPlayerBackend::PlayMovie (RVA 0xdc6ba8):
//   fmov s1, #1.75         ; 01 90 2f 1e
//   fcmp s0, s1            ; 00 20 21 1e
//   b.pl +0x14             ; a5 00 00 54  (skip if aspect >= 1.75 -> NOP)
//   mov  w1, #1            ; 21 00 80 52  (VideoAspectRatio.FitVertically -> FitInside #3)
//   mov  x0, x20           ; e0 03 14 aa
//   mov  x2, xzr           ; e2 03 1f aa
private val VIDEO_ASPECT_SIG = byteArrayOf(
    0x01, 0x90.toByte(), 0x2f, 0x1e,
    0x00, 0x20, 0x21, 0x1e,
    0xa5.toByte(), 0x00, 0x00, 0x54,
    0x21, 0x00, 0x80.toByte(), 0x52,
    0xe0.toByte(), 0x03, 0x14, 0xaa.toByte(),
    0xe2.toByte(), 0x03, 0x1f, 0xaa.toByte(),
)

// nop; mov w1, #3 (VideoAspectRatio.FitInside)
private val VIDEO_FIT_INSIDE_PATCH = byteArrayOf(
    0x1f, 0x20, 0x03, 0xd5.toByte(),
    0x61, 0x00, 0x80.toByte(), 0x52,
)

@Suppress("unused")
val videoAspectRatioPatch = patch(
    name = "Fix 4:3 / Foldable Video Cutscene Scaling",
    description = "Switches VideoPlayer from FitVertically to FitInside so cutscenes, dreams, " +
        "and ending videos never crop horizontally on 4:3 tablets, foldables, or ultrawides.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_THE_LONGING)

    execute {
        patchIl2CppFile(resourceFile(IL2CPP_LIB_PATH), "Fix 4:3 / Foldable Video Cutscene Scaling") { bytes ->
            val off = findBytes(bytes, VIDEO_ASPECT_SIG)
            if (off < 0) {
                throw PatchException("NewUnityVideoPlayerBackend::PlayMovie signature not found in $IL2CPP_LIB_PATH.")
            }
            System.arraycopy(VIDEO_FIT_INSIDE_PATCH, 0, bytes, off + 8, VIDEO_FIT_INSIDE_PATCH.size)
        }
        resourceXml("AndroidManifest.xml").use { manifest ->
            val app = manifest.root.children("application").firstOrNull()
                ?: throw PatchException("No <application> element found in AndroidManifest.xml.")
            app.setAttribute("android:extractNativeLibs", "true")
        }
    }
}
