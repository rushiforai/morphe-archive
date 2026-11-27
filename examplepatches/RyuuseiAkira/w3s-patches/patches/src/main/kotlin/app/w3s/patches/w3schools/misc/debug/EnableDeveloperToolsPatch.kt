// patches/src/main/kotlin/app/w3s/patches/w3schools/misc/debug/EnableDeveloperToolsPatch.kt
package app.w3s.patches.w3schools.misc.debug

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.listApkEntries
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.w3s.patches.w3schools.misc.pairip.pairipLicenseBypassPatch
import app.w3s.patches.w3schools.shared.Constants.COMPATIBILITY_W3SCHOOLS

private const val CHUNKS_PREFIX = "assets/public/_next/static/chunks/"
private const val IDENT = """[A-Za-z_${'$'}][\w${'$'}]*"""

private val DEBUG_TOOLS_ENV_REGEX = Regex(
    """function ($IDENT)\(($IDENT)\)\{return(?:(?:"develop"===\2|\2==="develop")\|\|(?:"staging"===\2|\2==="staging")|(?:"staging"===\2|\2==="staging")\|\|(?:"develop"===\2|\2==="develop"))\}""",
)

@Suppress("unused")
val enableDeveloperToolsPatch = patch(
    name = "Enable developer tools",
    description = "Unlocks the hidden Billing Debug and Developer Console screens in Settings without switching away from production APIs.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_W3SCHOOLS)

    dependsOn(pairipLicenseBypassPatch)

    execute {
        val chunkEntries = listApkEntries(CHUNKS_PREFIX).filter { it.endsWith(".js") }
        var patchedCount = 0

        for (entry in chunkEntries) {
            val file = resourceFile(entry)
            val content = file.readText()
            if (!content.contains("isDebugToolsEnv")) continue

            val match = DEBUG_TOOLS_ENV_REGEX.find(content) ?: continue

            val fnName = match.groupValues[1]
            file.writeText(content.replaceRange(match.range, "function $fnName(){return!0}"))
            patchedCount++
        }

        if (patchedCount == 0) {
            throw PatchException("Could not find isDebugToolsEnv in $CHUNKS_PREFIX.")
        }
    }
}
