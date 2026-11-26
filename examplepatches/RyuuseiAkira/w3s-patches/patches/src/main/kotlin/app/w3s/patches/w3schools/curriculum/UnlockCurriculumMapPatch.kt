// patches/src/main/kotlin/app/w3s/patches/w3schools/curriculum/UnlockCurriculumMapPatch.kt
package app.w3s.patches.w3schools.curriculum

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.listApkEntries
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.w3s.patches.w3schools.misc.pairip.pairipLicenseBypassPatch
import app.w3s.patches.w3schools.shared.Constants.COMPATIBILITY_W3SCHOOLS

private const val CHUNKS_PREFIX = "assets/public/_next/static/chunks/"
private val AVAILABILITY_REGEX = Regex(
    """(function [A-Za-z_${'$'}][\w${'$'}]*\([A-Za-z_${'$'}][\w${'$'}]*,[A-Za-z_${'$'}][\w${'$'}]*,([A-Za-z_${'$'}][\w${'$'}]*)\)\{let [A-Za-z_${'$'}][\w${'$'}]*=Math\.max\(0,Math\.floor\([A-Za-z_${'$'}][\w${'$'}]*\)\);if\()!\2(\)return\{sequentialBoundaryIndex:[A-Za-z_${'$'}][\w${'$'}]*,bonusUnlockedIndex:null,isLocked:\(\)=>!1,isAccessible:\(\)=>!0\})"""
)

@Suppress("unused")
val unlockCurriculumMapPatch = patch(
    name = "Unlock curriculum map",
    description = "Unlocks sequential lessons, checkpoints, and milestones on the curriculum map.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_W3SCHOOLS)

    dependsOn(pairipLicenseBypassPatch)

    execute {
        val chunkEntries = listApkEntries(CHUNKS_PREFIX).filter { it.endsWith(".js") }
        var patchedCount = 0

        for (entry in chunkEntries) {
            val file = resourceFile(entry)
            val content = file.readText()
            if (!content.contains("resolveCurriculumAvailability")) continue

            val match = AVAILABILITY_REGEX.find(content)
            if (match != null) {
                val updated = content.replaceRange(match.range, "${match.groupValues[1]}!0${match.groupValues[3]}")
                file.writeText(updated)
                patchedCount++
            }
        }

        if (patchedCount == 0) {
            throw PatchException("Could not find resolveCurriculumAvailability in $CHUNKS_PREFIX.")
        }
    }
}
