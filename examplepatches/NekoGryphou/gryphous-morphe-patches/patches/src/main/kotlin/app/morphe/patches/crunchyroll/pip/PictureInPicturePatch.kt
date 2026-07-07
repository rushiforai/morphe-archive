package app.morphe.patches.crunchyroll.pip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.crunchyroll.shared.COMPATIBILITY_CRUNCHYROLL
import org.w3c.dom.Element

@Suppress("unused")
private val crunchyrollPictureInPictureManifestPatch = resourcePatch(
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application = manifest
                .getElementsByTagName("application")
                .item(0) as? Element
                ?: throw PatchException("AndroidManifest.xml does not contain an application element.")

            val playbackActivities = setOf(
                "com.crunchyroll.watchscreen.screen.WatchScreenActivity",
                "com.crunchyroll.watchscreen.screen.offline.OfflineWatchScreenActivity",
                "com.crunchyroll.watchscreen.screen.xr.AdaptiveWatchScreenActivity",
            )
            var modifiedActivities = 0

            val activities = application.getElementsByTagName("activity")
            for (index in 0 until activities.length) {
                val activity = activities.item(index) as? Element ?: continue
                val name = activity.getAttribute("android:name")
                if (name !in playbackActivities) continue

                activity.setAttribute("android:supportsPictureInPicture", "true")
                activity.setAttribute("android:resizeableActivity", "true")
                activity.mergeConfigChanges(
                    "screenSize",
                    "smallestScreenSize",
                    "screenLayout",
                    "orientation",
                )
                modifiedActivities++
            }

            if (modifiedActivities == 0) {
                throw PatchException("No Crunchyroll watch screen activity was found in AndroidManifest.xml.")
            }
        }
    }
}

@Suppress("unused")
val crunchyrollPictureInPicturePatch = bytecodePatch(
    name = "Enable Picture-in-Picture",
    description = "Enables automatic Android Picture-in-Picture when leaving Crunchyroll playback.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)
    dependsOn(crunchyrollPictureInPictureManifestPatch)

    execute {
        WatchScreenOnUserLeaveHintFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p0}, Landroid/app/Activity;->isInPictureInPictureMode()Z
                move-result v0
                if-eqz v0, :crunchyroll_pip_enter
                return-void
                :crunchyroll_pip_enter
                invoke-super {p0}, Le/k;->onUserLeaveHint()V
                new-instance v0, Landroid/app/PictureInPictureParams${'$'}Builder;
                invoke-direct {v0}, Landroid/app/PictureInPictureParams${'$'}Builder;-><init>()V
                invoke-virtual {v0}, Landroid/app/PictureInPictureParams${'$'}Builder;->build()Landroid/app/PictureInPictureParams;
                move-result-object v0
                invoke-virtual {p0, v0}, Landroid/app/Activity;->enterPictureInPictureMode(Landroid/app/PictureInPictureParams;)Z
                return-void
            """,
        )
    }
}

private fun Element.mergeConfigChanges(vararg required: String) {
    val existing = getAttribute("android:configChanges")
        .split('|')
        .mapTo(linkedSetOf()) { it.trim() }
        .filterTo(linkedSetOf()) { it.isNotEmpty() }

    existing.addAll(required)
    setAttribute("android:configChanges", existing.joinToString("|"))
}
