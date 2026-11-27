package local.wazemaps

import app.morphe.patcher.patch.rawResourcePatch

/** Stage the binary manifest once so independent edits compose in either order. */
internal val stageWazeManifest = rawResourcePatch {
    execute {
        val binary = get("AndroidManifest.xml").resolveSibling("AndroidManifest.xml.bin")
        get("assets").resolveSibling("AndroidManifest.xml").writeBytes(binary.readBytes())
    }
}

/** One version and resource refresh for any patch selection. */
internal val refreshWazeSkins = rawResourcePatch {
    dependsOn(stageWazeManifest)
    execute {
        // Refresh Waze's extracted resources when updating from the previous builds.
        val manifest = get("assets").resolveSibling("AndroidManifest.xml")
        manifest
            // Advance past older bundles so deselected skins are restored on upgrade.
            .writeBytes(refreshSkinVersion(manifest.readBytes(), 1030752, increment = 20))
    }
}
