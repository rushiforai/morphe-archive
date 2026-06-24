package app.morphe.patches.youtube.version

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.youtube.dpi.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.dpi.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.util.getNode
import org.w3c.dom.Element

@Suppress("unused")
val customVersionNamePatch = resourcePatch(
    "Custom version name",
    "Overrides the app versionName so a re-patched build of the same upstream version is " +
        "recognised as a new version. Lets patch-only changes propagate as updates even when " +
        "the upstream YouTube/YT Music version is unchanged.",
    false,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE, COMPATIBILITY_YOUTUBE_MUSIC)

    val versionNameOption = stringOption(
        key = "versionName",
        default = "",
        title = "Version name",
        description = "Full value written to android:versionName, e.g. \"20.51.39+1781904670\". " +
            "Use a monotonic numeric suffix so newer builds compare greater.",
        required = false,
    )

    finalize {
        val versionName = versionNameOption.value?.trim().orEmpty()
        if (versionName.isEmpty()) return@finalize

        document("AndroidManifest.xml").use { document ->
            val manifest = document.getNode("manifest") as Element
            manifest.setAttribute("android:versionName", versionName)
        }
    }
}
