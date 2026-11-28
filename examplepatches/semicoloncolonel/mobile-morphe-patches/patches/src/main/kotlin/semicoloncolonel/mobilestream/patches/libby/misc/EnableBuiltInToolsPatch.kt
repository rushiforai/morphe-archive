package semicoloncolonel.mobilestream.patches.libby.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import semicoloncolonel.mobilestream.patches.libby.shared.Constants

// Libby 9.6.0 is a WebView shell for libbyapp.com. Before loading the web app,
// the native shell hands it a "capabilities" JSON (the res/values/strings.xml
// string of that name) declaring which native features the web app may show.
// Two of OverDrive's own user-facing tools ship gated off:
//
//   "debug:diagnostics-option": false   the Diagnostics screen option
//                                        (Activity_Diagnostics ships in the APK)
//   "debug:download-queue":     false   a download-queue inspector
//
// This flips both to true, so Libby offers its built-in download queue and
// diagnostics views. Pure resource edit; nothing else changes. The regex eats
// whatever quote escaping the decoded string uses and only turns the value
// false -> true, so the JSON stays valid.
//
// Off by default and experimental: the production web app may ignore a client
// debug flag, in which case the patch is simply inert. Needs an on-device check.
private val DIAGNOSTICS_FLAG = Regex("(diagnostics-option[^:]*:\\s*)false")
private val DOWNLOAD_QUEUE_FLAG = Regex("(download-queue[^:]*:\\s*)false")

@Suppress("unused")
val enableBuiltInToolsPatch = resourcePatch(
    name = "Enable built-in tools",
    description = "Reveals Libby's own hidden download-queue and diagnostics views.",
    default = false,
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        var changed = 0
        document("res/values/strings.xml").use { document ->
            val strings = document.getElementsByTagName("string")
            for (i in 0 until strings.length) {
                val string = strings.item(i) as Element
                if (string.getAttribute("name") != "capabilities") continue
                val before = string.textContent
                val after = before
                    .replace(DIAGNOSTICS_FLAG, "$1true")
                    .replace(DOWNLOAD_QUEUE_FLAG, "$1true")
                if (after != before) {
                    string.textContent = after
                    changed++
                }
            }
        }
        if (changed == 0) {
            throw PatchException("Libby: capabilities debug flags not found in strings.xml")
        }
    }
}
