// patches/src/main/kotlin/app/w3s/patches/w3schools/misc/update/BypassForcedUpdatesPatch.kt
package app.w3s.patches.w3schools.misc.update

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.listApkEntries
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.w3s.patches.w3schools.misc.pairip.pairipLicenseBypassPatch
import app.w3s.patches.w3schools.shared.Constants.COMPATIBILITY_W3SCHOOLS

private const val CHUNKS_PREFIX = "assets/public/_next/static/chunks/"
private const val IDENT = """[A-Za-z_${'$'}][\w${'$'}]*"""

private val MIN_CLIENT_BUILD_GATE_REGEX = Regex(
    """!$IDENT\.bypass&&($IDENT\.Capacitor\.isNativePlatform\(\)&&$IDENT\?\.currentBuild&&$IDENT\.versionConfig\?\.minimumClientBuild)""",
)

private val IN_APP_REVIEW_PREPARE_REGEX = Regex(
    """(async function $IDENT\($IDENT,$IDENT\)\{if\()$IDENT\(\)&&(!$IDENT\)try\{let $IDENT=await $IDENT\()""",
)

@Suppress("unused")
val bypassForcedUpdatesPatch = patch(
    name = "Bypass forced updates",
    description = "Prevents remote minimumClientBuild version lockouts and disables Play in-app review prompts on sideloaded builds.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_W3SCHOOLS)

    dependsOn(pairipLicenseBypassPatch)

    execute {
        val chunkEntries = listApkEntries(CHUNKS_PREFIX).filter { it.endsWith(".js") }
        var patchedUpdateGate = 0

        for (entry in chunkEntries) {
            val file = resourceFile(entry)
            var content = file.readText()
            var changed = false

            if (content.contains("W3SAppUpdateProvider")) {
                val gateMatch = MIN_CLIENT_BUILD_GATE_REGEX.find(content)
                    ?: throw PatchException("Found W3SAppUpdateProvider in $entry, but minimumClientBuild check did not match.")
                content = content.replaceRange(gateMatch.range, "!1&&${gateMatch.groupValues[1]}")
                patchedUpdateGate++
                changed = true
            }

            if (content.contains("prepareChapterReview")) {
                IN_APP_REVIEW_PREPARE_REGEX.find(content)?.let { reviewMatch ->
                    content = content.replaceRange(
                        reviewMatch.range,
                        "${reviewMatch.groupValues[1]}!1&&${reviewMatch.groupValues[2]}",
                    )
                    changed = true
                }
            }

            if (changed) {
                file.writeText(content)
            }
        }

        if (patchedUpdateGate == 0) {
            throw PatchException("Could not find W3SAppUpdateProvider in $CHUNKS_PREFIX.")
        }
    }
}
