package semicoloncolonel.mobilestream.patches.yttvshell.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val APP_URL_NAME = "cobalt.APP_URL"
private const val YOUTUBE_TV_URL = "https://www.youtube.com/tv/upg"

// Cobalt reads its start URL from the AndroidManifest meta-data cobalt.APP_URL (passed to the
// engine as --url=). Regular YouTube for Android TV sets it to https://www.youtube.com/tv; this
// repoints it at the YouTube TV living-room web app. A dependency of Skip ads, so it is always
// applied with it.
val changeStartUrlPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val metaData = document.getElementsByTagName("meta-data")
            var changed = 0
            for (i in 0 until metaData.length) {
                val element = metaData.item(i) as Element
                if (element.getAttribute("android:name") == APP_URL_NAME) {
                    element.setAttribute("android:value", YOUTUBE_TV_URL)
                    changed++
                }
            }
            if (changed == 0) throw PatchException("$APP_URL_NAME meta-data not found")
        }
    }
}
