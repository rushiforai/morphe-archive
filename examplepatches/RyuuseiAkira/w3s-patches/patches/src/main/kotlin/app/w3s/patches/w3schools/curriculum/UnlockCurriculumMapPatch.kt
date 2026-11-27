// patches/src/main/kotlin/app/w3s/patches/w3schools/curriculum/UnlockCurriculumMapPatch.kt
package app.w3s.patches.w3schools.curriculum

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.listApkEntries
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.w3s.patches.w3schools.misc.pairip.pairipLicenseBypassPatch
import app.w3s.patches.w3schools.shared.Constants.COMPATIBILITY_W3SCHOOLS

private const val CHUNKS_PREFIX = "assets/public/_next/static/chunks/"
private const val IDENT = """[A-Za-z_${'$'}][\w${'$'}]*"""

private val AVAILABILITY_REGEX = Regex(
    """(function $IDENT\($IDENT,$IDENT,($IDENT)\)\{let $IDENT=Math\.max\(0,Math\.floor\($IDENT\)\);if\()!\2(\)return\{sequentialBoundaryIndex:$IDENT,bonusUnlockedIndex:null,isLocked:\(\)=>!1,isAccessible:\(\)=>!0\})""",
)

private val OVERVIEW_UPSELL_REGEX = Regex(
    """(\(0,$IDENT\.jsx\)\($IDENT,\{percent:$IDENT\}\),)$IDENT(&&\(0,$IDENT\.jsx\)\($IDENT,\{\}\))""",
)

@Suppress("unused")
val unlockCurriculumMapPatch = patch(
    name = "Unlock curriculum map",
    description = "Unlocks sequential lessons, checkpoints, and milestones on the curriculum map and removes overview unlock upsell banners.",
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

            if (content.contains("resolveCurriculumAvailability")) {
                AVAILABILITY_REGEX.find(content)?.let { match ->
                    content = content.replaceRange(match.range, "${match.groupValues[1]}!0${match.groupValues[3]}")
                    patchedCount++
                    changed = true
                }
            }

            if (content.contains("UNLOCK ALL ACTIVITIES")) {
                OVERVIEW_UPSELL_REGEX.find(content)?.let { match ->
                    content = content.replaceRange(match.range, "${match.groupValues[1]}!1${match.groupValues[2]}")
                    changed = true
                }
            }

            if (changed) {
                file.writeText(content)
            }
        }

        if (patchedCount == 0) {
            throw PatchException("Could not find resolveCurriculumAvailability in $CHUNKS_PREFIX.")
        }
    }
}
