package app.memorizepi.patches.pi.scenes

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourceFile
import app.memorizepi.patches.pi.shared.Constants
import java.util.logging.Logger

/**
 * Removes the cross-promotion elements of the main menu that are part of
 * the Unity scenes instead of the Android UI:
 *
 * - the "Prime Button" (`MainMenu/Shift/Prime Button`, scene `level0`),
 * - the six side-panel game icons below `MainMenu/PromoteIcon`
 *   (scenes `level0`-`level2`).
 *
 * Both are Unity `GameObject`s inside `assets/bin/Data/data.unity3d` and
 * therefore cannot be reached by patching Java bytecode like the banner ads.
 * The patch edits the serialized scenes in the UnityFS bundle: every target
 * GameObject gets `m_IsActive = false` and its Transform gets
 * `m_LocalScale = (0, 0, 0)`.
 *
 * The zero scale is the important part: the menu scripts re-activate the
 * objects at runtime, and zero scale also shrinks their box colliders to
 * zero, so the invisible elements cannot be tapped either.
 *
 * Full screen (interstitial) and rewarded ads and the banner removal are
 * separate patches and stay untouched.
 */
// rawResourcePatch keeps the patcher in raw resource mode: the Unity bundle is
// replaced as-is and no aapt resource decoding of the whole APK is triggered.
@Suppress("DEPRECATION")
val removeCrossPromoScenesPatch = rawResourcePatch(
    name = "Remove cross-promotion (Prime Button and game icons)",
    description = "Removes the \"Prime Button\" and the six side-panel game icons from the " +
            "Unity menu scenes (data.unity3d). The objects are deactivated and scaled to zero, " +
            "so the menu scripts cannot bring them back at runtime. AdMob banner, interstitial " +
            "and rewarded ads are not touched.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_PI)

    execute {
        val logger = Logger.getLogger("MemorizePiPatches")
        val bundleFile = resourceFile(UnityBundlePatcher.BUNDLE_ENTRY)
        val original = bundleFile.readBytes()

        val outcome = UnityBundlePatcher.patch(original)
        if (outcome.alreadyPatched) {
            logger.info("${UnityBundlePatcher.BUNDLE_ENTRY} is already patched")
            return@execute
        }

        bundleFile.writeBytes(outcome.bundle)
        logger.info(
            "Wrote ${outcome.bundle.size} bytes to ${UnityBundlePatcher.BUNDLE_ENTRY} " +
                "(${outcome.gameObjectsChanged} GameObjects deactivated, " +
                "${outcome.transformsChanged} Transforms scaled to zero)",
        )
    }
}
