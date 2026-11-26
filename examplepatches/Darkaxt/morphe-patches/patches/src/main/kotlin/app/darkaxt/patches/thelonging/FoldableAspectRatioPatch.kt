package app.darkaxt.patches.thelonging

import app.darkaxt.patches.shared.Constants.COMPATIBILITY_THE_LONGING
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourceXml

// AdditionalSettingsForMobileAndGamePad::GetAspectRatio (RVA 0xdaa704):
//   ldr  s0, [x8, #0x2c]   ; 00 2d 40 bd  (cached aspect ratio)
//   fcmp s0, #0.0          ; 08 20 20 1e
//   b.pl +0x4c             ; 65 02 00 54  (skip recompute if already cached -> NOP)
//   mov  x0, xzr           ; e0 03 1f aa
private val GET_ASPECT_RATIO_CACHE_SIG = byteArrayOf(
    0x00, 0x2d, 0x40, 0xbd.toByte(),
    0x08, 0x20, 0x20, 0x1e,
    0x65, 0x02, 0x00, 0x54,
    0xe0.toByte(), 0x03, 0x1f, 0xaa.toByte(),
)

private val ARM64_NOP = byteArrayOf(0x1f, 0x20, 0x03, 0xd5.toByte())

@Suppress("unused")
val foldableAspectRatioPatch = patch(
    name = "Fix Foldable Live Aspect Ratio",
    description = "Removes permanent aspect-ratio caching in GetAspectRatio() so folding or " +
        "unfolding mid-session immediately updates camera zoom, room borders, HUD, and UI scaling.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_THE_LONGING)

    execute {
        patchIl2CppFile(resourceFile(IL2CPP_LIB_PATH), "Fix Foldable Live Aspect Ratio") { bytes ->
            val off = findBytes(bytes, GET_ASPECT_RATIO_CACHE_SIG)
            if (off < 0) {
                throw PatchException("GetAspectRatio cache signature not found in $IL2CPP_LIB_PATH.")
            }
            System.arraycopy(ARM64_NOP, 0, bytes, off + 8, ARM64_NOP.size)
        }
        resourceXml("AndroidManifest.xml").use { manifest ->
            val app = manifest.root.children("application").firstOrNull()
                ?: throw PatchException("No <application> element found in AndroidManifest.xml.")
            app.setAttribute("android:extractNativeLibs", "true")
        }
    }
}
