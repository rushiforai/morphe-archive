package app.darkaxt.patches.doodlejump

import app.darkaxt.patches.shared.Constants.COMPATIBILITY_DOODLE_JUMP
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile

@Suppress("unused")
val endlessFallPatch = patch(
    name = "Endless Fall & 3-Lives",
    description = "Replaces instant fall-death with continuous falling onto previous platforms " +
        "with live score reduction, adds a 3-lives HUD system with balanced fall damage and " +
        "monster/UFO damage with brief invulnerability, and tracks Peak Score. " +
        "Black Holes remain instant Game Over.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DOODLE_JUMP)
    dependsOn(doodleJumpNativeBasePatch)

    execute {
        setModFeatureFlag(resourceFile(DJ_LIB_PATH), FLAG_OFFSET_ENDLESS_FALL, enabled = true)
    }
}
