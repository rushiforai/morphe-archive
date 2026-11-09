package io.github.pengusto.patches.finamp

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.rawResourcePatch
import java.util.WeakHashMap

private const val FINAMP_PACKAGE = "com.unicornsonlsd.finamp"
private const val FINAMP_VERSION = "1.0.1"

// Keys are invocation contexts, not bundle-global selections. Aborted contexts can be collected.
private class NativeSelection {
    var mask = 0
    var completed = false
    var failure: PatchException? = null
}
private val selections = WeakHashMap<ResourcePatchContext, NativeSelection>()

private val finampNativeComposition = rawResourcePatch {
    execute {
        synchronized(selections) { selections[this] = NativeSelection() }
    }
}

private fun finampFeature(name: String, description: String, bit: Int) = rawResourcePatch(
    name = name,
    description = "$description Requires the original official Finamp 1.0.1 APK. Produces ARM64-only output; other native architectures are removed.",
    default = false,
) {
    compatibleWith(Compatibility(name = "Finamp", packageName = FINAMP_PACKAGE,
        targets = listOf(AppTarget(version = FINAMP_VERSION))))
    dependsOn(finampNativeComposition)
    execute {
        val selection = selectionState()
        synchronized(selection) { selection.mask = selection.mask or bit }
    }
    finalize {
        // Manager 2.x filters results for unselected dependencies. Emit success/failure
        // from every selected patch, while applying the composite exactly once.
        val selection = selectionState()
        synchronized(selection) {
            selection.failure?.let { throw it }
            if (!selection.completed) {
                try {
                    applyFinampComposition(selection.mask)
                    selection.completed = true
                } catch (exception: Exception) {
                    val failure = if (exception is PatchException) exception else
                        PatchException("Finamp native patch: ${exception.message ?: exception.javaClass.simpleName}", exception)
                    selection.failure = failure
                    throw failure
                }
            }
        }
    }
}

private fun ResourcePatchContext.selectionState(): NativeSelection = synchronized(selections) {
    selections[this] ?: throw PatchException("Finamp native patch: missing invocation state")
}

@Suppress("unused")
val finampTitleValidationPatch = finampFeature(
    "Fix section title validation", "Update validation and enable Save when a custom home-section title is entered (#1830).", 1,
)

@Suppress("unused")
val finampArtistOrderPatch = finampFeature(
    "Song artist order", "Choose song-credit display order, including album artists first, metadata order and alphabetical (#1831).", 2,
)

@Suppress("unused")
val finampFasterArtistPagePatch = finampFeature(
    "Load artist pages faster", "Load artist previews and track counts without downloading the full discography (#1832).", 4,
)

@Suppress("unused")
val finampOfflineArtistTracksPatch = finampFeature(
    "Fix offline artist tracks", "Exclude unrelated songs from shared albums on offline performing-artist pages (#1689).", 8,
)

@Suppress("unused")
val finampTrackAlphabetPatch = finampFeature(
    "Fix track alphabet navigation", "Compare song names and target letters consistently when jumping through the Tracks alphabet (#1790).", 16,
)

@Suppress("unused")
val finampPlayerOutputPatch = finampFeature(
    "Keep player output controls accessible", "Keep Output, Queue and Lyrics at the bottom of the player menu when bottom actions are hidden, while respecting disabled gestures (#1355).", 32,
)

@Suppress("unused")
val finampAlbumTrackInformationPatch = finampFeature(
    "Show album and track information", "Show available Jellyfin album and track descriptions, including descriptions saved by download sync (#1852).", 128,
)
// The compact entry point is packaged separately.
