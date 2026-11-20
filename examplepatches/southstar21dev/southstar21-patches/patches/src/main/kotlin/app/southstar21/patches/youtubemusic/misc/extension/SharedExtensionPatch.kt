package app.southstar21.patches.youtubemusic.misc.extension

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.southstar21.patches.youtubemusic.shared.MusicActivityOnCreateFingerprint
import app.southstar21.patches.youtubemusic.shared.MusicActivityWindowFocusFingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val YOUTUBE_MUSIC_HOOKS_CLASS = "Lapp/southstar21/extension/youtubemusic/YouTubeMusicHooks;"

/**
 * Bundles the YouTube Music extension (extensions/youtubemusic) into the app and calls its
 * shared hook, which starts every included patch. Every YouTube Music patch depends on this.
 */
val youTubeMusicSharedExtensionPatch = bytecodePatch {
    extendWith("extensions/youtubemusic.mpe")

    execute {
        MusicActivityWindowFocusFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $YOUTUBE_MUSIC_HOOKS_CLASS->onMainActivityWindowFocusChanged(Landroid/app/Activity;)V",
        )
    }
}

/**
 * Stops the build when Morphe Patches' GmsCore support isn't part of it. A patched YouTube Music
 * can only sign in to Google through MicroG, which that patch sets up; without it the app
 * installs but can't sign in.
 *
 * Call it from every named YouTube Music patch's `finalize`, which runs after every patch of the
 * run, from every source. (Not from this shared patch: Morphe Manager only stops the build when
 * a patch the user selected fails, and nobody selects a dependency.)
 *
 * GmsCore support's only change to the app itself is a call to its checkGmsCore at the start of
 * MusicActivity.onCreate. Its extension classes alone prove nothing: Morphe Patches add them
 * whenever any of its patches is used.
 */
context(patchContext: BytecodePatchContext)
internal fun requireGmsCoreSupport() {
    val hasGmsCoreSupport = MusicActivityOnCreateFingerprint.method.instructions.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference != null && reference.definingClass.contains("GmsCoreSupport")
    }
    if (!hasGmsCoreSupport) {
        throw PatchException(
            "YouTube Music can't sign in without the GmsCore support patch from Morphe Patches. " +
                "In Morphe Manager, turn on Expert mode and patch YouTube Music with both " +
                "Morphe Patches (with GmsCore support) and southstar21 Patches.",
        )
    }
}

/** Makes the extension class's `isIncluded()` return true, so the patch's code runs. */
context(patchContext: BytecodePatchContext)
internal fun markYouTubeMusicPatchIncluded(extensionClass: String) {
    Fingerprint(
        definingClass = extensionClass,
        name = "isIncluded",
        returnType = "Z",
        parameters = listOf(),
    ).method.addInstructions(
        0,
        """
            const/4 v0, 0x1
            return v0
        """,
    )
}
