package dev.twitchpatches.patches.twitch.shared.hermes

import app.morphe.patcher.patch.ResourcePatchContext
import java.io.File
import java.lang.ref.SoftReference

private const val BUNDLE_PATH = "assets/index.android.bundle"

private data class BundleFile(val path: String, val length: Long, val modified: Long)

private class LoadedBundle(val file: BundleFile, val bundle: HermesBundle)

private var loaded = SoftReference<LoadedBundle>(null)

private fun File.identity() = BundleFile(path, length(), lastModified())

internal fun ResourcePatchContext.twitchBundle(): HermesBundle {
    val file = get(BUNDLE_PATH)
    val identity = file.identity()
    loaded.get()?.takeIf { it.file == identity }?.let { return it.bundle }
    return HermesBundle(file.readBytes()).also { loaded = SoftReference(LoadedBundle(identity, it)) }
}

internal fun ResourcePatchContext.replaceTwitchBundle(updated: HermesBundle): HermesBundle {
    val file = get(BUNDLE_PATH)
    file.writeBytes(updated.bytes)
    loaded = SoftReference(LoadedBundle(file.identity(), updated))
    return updated
}
