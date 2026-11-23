package patapon888.morphe.patches.fruitninja.video

import app.morphe.patcher.patch.resourcePatch
import patapon888.morphe.patches.fruitninja.FRUIT_NINJA_CLASSIC
import patapon888.morphe.patches.fruitninja.native.LibraryEdit
import patapon888.morphe.patches.fruitninja.native.NOP
import patapon888.morphe.patches.fruitninja.native.arm64OnlyPatch
import patapon888.morphe.patches.fruitninja.native.patchGameLibrary

@Suppress("unused")
val skipStartupVideoPatch = resourcePatch(
    name = "Skip startup video",
    description = "Removes the Halfbrick+ video at startup. Only the arm64-v8a library is kept."
) {
    compatibleWith(FRUIT_NINJA_CLASSIC)

    dependsOn(arm64OnlyPatch)

    execute {
        patchGameLibrary(
            listOf(
                // loadingScreen.Awake: the video object is never activated (SetActive(true) -> SetActive(false)).
                LibraryEdit(0x2D877B4, "21008052", "01008052"),
                // loadingScreen.Update: the "skip video" branch is always taken, so loading goes on at once
                // (the tbz checks of IsRegistrationApp, VideoPlayer.isPlaying and Input.anyKeyDown -> nop).
                LibraryEdit(0x2D8863C, "e0010036", NOP),
                LibraryEdit(0x2D88650, "40010036", NOP),
                LibraryEdit(0x2D8865C, "e0000036", NOP),
            )
        )
    }
}
