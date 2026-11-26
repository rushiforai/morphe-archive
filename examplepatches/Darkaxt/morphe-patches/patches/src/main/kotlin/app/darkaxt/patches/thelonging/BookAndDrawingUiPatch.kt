package app.darkaxt.patches.thelonging

import app.darkaxt.patches.shared.Constants.COMPATIBILITY_THE_LONGING
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourceXml

// In ReadingBehaviour::OpenReadingOverlay (RVA 0xddbeb0),
// ReadingBehaviour::DialogEvent_ChooseReading (RVA 0xdd61cc),
// and DrawingScript::OpenChooseDrawingOverlay (RVA 0xdcb600):
// When GetAspectRatio() < 1.4f, each method loads 1.05f from .rodata (0x4a432c)
// and scales the overlay UP to (1.05, 1.05, 1.0) inside a height-matched canvas,
// clipping book pages and buttons off the left/right edges on 4:3 / unfolded foldables.
// Replacing `adrp x8, ...; ldr s0, [x8, #0x32c]` with `fmov s0, #0.75; nop` keeps
// the full-screen 4:3 stone HUD frame intact while fitting books and menus cleanly inside.

private val OPEN_READING_SIG = byteArrayOf(
    0x19, 0xb9.toByte(), 0x06, 0x94.toByte(),
    0x40, 0x07, 0x00, 0xb4.toByte(),
    0x48, 0xb6.toByte(), 0xff.toByte(), 0xb0.toByte(),
    0x00, 0x2d, 0x43, 0xbd.toByte(),
    0x23, 0x00, 0x00, 0x14,
)

private val CHOOSE_READING_SIG = byteArrayOf(
    0x52, 0xd0.toByte(), 0x06, 0x94.toByte(),
    0xe0.toByte(), 0x18, 0x00, 0xb4.toByte(),
    0x68, 0xb6.toByte(), 0xff.toByte(), 0xd0.toByte(),
    0x00, 0x2d, 0x43, 0xbd.toByte(),
    0x14, 0x00, 0x00, 0x14,
)

private val CHOOSE_DRAWING_SIG = byteArrayOf(
    0x45, 0xfb.toByte(), 0x06, 0x94.toByte(),
    0x40, 0x0a, 0x00, 0xb4.toByte(),
    0xc8.toByte(), 0xb6.toByte(), 0xff.toByte(), 0xb0.toByte(),
    0x00, 0x2d, 0x43, 0xbd.toByte(),
    0x14, 0x00, 0x00, 0x14,
)

// fmov s0, #0.75 ; nop
private val FMOV_S0_075_NOP = byteArrayOf(
    0x00, 0x10, 0x2d, 0x1e,
    0x1f, 0x20, 0x03, 0xd5.toByte(),
)

@Suppress("unused")
val bookAndDrawingUiPatch = patch(
    name = "Fix 4:3 / Foldable Book & Drawing UI Scaling",
    description = "Scales the Book, Thoughts, Book Shelf, and Drawing overlays to 0.75x on " +
        "narrow (< 1.4) aspect ratios instead of 1.05x so menus fit cleanly inside the full-screen " +
        "4:3 stone HUD border without shrinking the game into a 16:9 letterbox.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_THE_LONGING)

    execute {
        patchIl2CppFile(resourceFile(IL2CPP_LIB_PATH), "Fix 4:3 / Foldable Book & Drawing UI Scaling") { bytes ->
            val targets = listOf(
                "ReadingBehaviour::OpenReadingOverlay" to OPEN_READING_SIG,
                "ReadingBehaviour::DialogEvent_ChooseReading" to CHOOSE_READING_SIG,
                "DrawingScript::OpenChooseDrawingOverlay" to CHOOSE_DRAWING_SIG,
            )
            for ((name, sig) in targets) {
                val off = findBytes(bytes, sig)
                if (off < 0) {
                    throw PatchException("$name signature not found in $IL2CPP_LIB_PATH.")
                }
                System.arraycopy(FMOV_S0_075_NOP, 0, bytes, off + 8, FMOV_S0_075_NOP.size)
            }
        }
        resourceXml("AndroidManifest.xml").use { manifest ->
            val app = manifest.root.children("application").firstOrNull()
                ?: throw PatchException("No <application> element found in AndroidManifest.xml.")
            app.setAttribute("android:extractNativeLibs", "true")
        }
    }
}
