/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.downloads

import app.crimera.bytecode.insertHook
import app.crimera.bytecode.methodReference
import app.crimera.patches.instagram.misc.extension.hooks.instagramInitHook
import app.crimera.patches.instagram.misc.extension.hooks.instagramInitInsertIndex
import app.crimera.patches.instagram.utils.Constants.DOWNLOAD_DESCRIPTOR
import app.morphe.patcher.patch.BytecodePatchContext

private const val DOWNLOAD_SERVICE_INSTALL = "$DOWNLOAD_DESCRIPTOR/DownloadService;->install()V"

/**
 * Installs the downloader as the application starts. A Cancel or Retry tapped on a download
 * notification after the process was killed reaches the downloader through a broadcast receiver, and
 * finds nothing to act on unless the app has installed it by then. The shared extension patch
 * finalizes after this one and inserts `Utils.setContext` at the same index, so the context is in
 * place when `install` runs.
 */
context(_: BytecodePatchContext)
internal fun installDownloaderAtStartup() {
    val initMethod = instagramInitHook.fingerprint.method
    initMethod.insertHook(
        index = instagramInitInsertIndex(initMethod),
        relocateBranchTargets = false,
    ) {
        invokeStatic(methodReference(DOWNLOAD_SERVICE_INSTALL))
    }
}
