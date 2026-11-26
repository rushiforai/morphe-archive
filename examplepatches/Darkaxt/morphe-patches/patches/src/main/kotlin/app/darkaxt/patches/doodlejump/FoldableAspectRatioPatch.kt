package app.darkaxt.patches.doodlejump

import app.darkaxt.patches.shared.Constants.COMPATIBILITY_DOODLE_JUMP
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile

@Suppress("unused")
val foldableAspectRatioPatch = patch(
    name = "Foldable Seamless Wide View",
    description = "Zooms out wide/unfolded screens (such as Galaxy Z Fold / 4:3 tablets) to full " +
        "tall portrait vertical visibility (~600 logical height), centers UI cleanly without " +
        "4:3 overlap, remaps touch input, and fills the side margins with seamless cylindrical " +
        "wrap-around rendering of the playfield.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DOODLE_JUMP)
    dependsOn(doodleJumpNativeBasePatch)

    execute {
        setModFeatureFlag(resourceFile(DJ_LIB_PATH), FLAG_OFFSET_FOLDABLE_VIEW, enabled = true)
    }
}
