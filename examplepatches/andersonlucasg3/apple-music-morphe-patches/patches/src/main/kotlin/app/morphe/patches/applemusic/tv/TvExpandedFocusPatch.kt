package app.morphe.patches.applemusic.tv

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.applemusic.shared.Constants.APPLE_MUSIC_DILINK

/**
 * `PlayerMainFragment$i` is the `BottomSheetBehavior` callback of the Now Playing sheet and
 * `c(View, int)` is its `onStateChanged` (jadx `PlayerMainFragment.java:403`). State 3 is
 * EXPANDED; the sheet container is not focusable, so the D-pad has to be moved into the
 * controls from here.
 */
internal object SheetStateChangedFingerprint : Fingerprint(
    definingClass = "Lcom/apple/android/music/player/fragment/PlayerMainFragment\$i;",
    name = "c",
    parameters = listOf("Landroid/view/View;", "I"),
    returnType = "V",
)

@Suppress("unused")
internal val tvExpandedFocusPatch = bytecodePatch(
    name = "TV: player expand focus",
    description = "Moves the D-pad focus into the Now Playing controls when the player sheet " +
        "expands, because the sheet container itself is not focusable.",
    default = false,
) {
    compatibleWith(APPLE_MUSIC_DILINK)
    dependsOn(tvDpadPatch)

    execute {
        // p0 = BottomSheet callback, p1 = the sheet View, p2 = the new state.
        SheetStateChangedFingerprint.method.addInstructions(
            0,
            "invoke-static {p1, p2}, Lapp/morphe/extension/applemusic/TvFocusCompat;->onSheetState(Landroid/view/View;I)V",
        )
    }
}
