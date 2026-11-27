// patches/src/main/kotlin/app/w3s/patches/w3schools/misc/ui/HideUpgradePromptsPatch.kt
package app.w3s.patches.w3schools.misc.ui

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.listApkEntries
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.w3s.patches.w3schools.misc.pairip.pairipLicenseBypassPatch
import app.w3s.patches.w3schools.shared.Constants.COMPATIBILITY_W3SCHOOLS

private const val CHUNKS_PREFIX = "assets/public/_next/static/chunks/"
private const val IDENT = """[A-Za-z_${'$'}][\w${'$'}]*"""

private val STREAK_FREEZE_UPSELL_REGEX = Regex(
    """(,)(?:!?$IDENT(?:\|\||&&))*!?$IDENT(\?null:\(0,$IDENT\.jsx\)\($IDENT,\{freezesAvailable:$IDENT\.freezeAvailable\}\))""",
)

private val DUEL_GO_UNLIMITED_REGEX = Regex(
    """(,)$IDENT(&&\(0,$IDENT\.jsx\)\("button",\{type:"button",onClick:$IDENT,className:"[^"]*",children:"Go unlimited"\}\))""",
)

@Suppress("unused")
val hideUpgradePromptsPatch = patch(
    name = "Hide upgrade prompts",
    description = "Hides the Explore plans upsell card on the Streak screen and the Go unlimited link in Code Duel.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_W3SCHOOLS)

    dependsOn(pairipLicenseBypassPatch)

    execute {
        val chunkEntries = listApkEntries(CHUNKS_PREFIX).filter { it.endsWith(".js") }
        var patchedCount = 0

        for (entry in chunkEntries) {
            val file = resourceFile(entry)
            var content = file.readText()
            var changed = false

            if (content.contains("StreakDayCounter") && content.contains("freezeAvailable")) {
                STREAK_FREEZE_UPSELL_REGEX.find(content)?.let { match ->
                    content = content.replaceRange(match.range, "${match.groupValues[1]}!0${match.groupValues[2]}")
                    patchedCount++
                    changed = true
                }
            }

            if (content.contains("Go unlimited")) {
                DUEL_GO_UNLIMITED_REGEX.find(content)?.let { match ->
                    content = content.replaceRange(match.range, "${match.groupValues[1]}!1${match.groupValues[2]}")
                    patchedCount++
                    changed = true
                }
            }

            if (changed) {
                file.writeText(content)
            }
        }

        if (patchedCount == 0) {
            throw PatchException("Could not find upgrade prompt targets in $CHUNKS_PREFIX.")
        }
    }
}
