// patches/src/main/kotlin/app/w3s/patches/w3schools/energy/UnlimitedEnergyPatch.kt
package app.w3s.patches.w3schools.energy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.listApkEntries
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.w3s.patches.w3schools.misc.pairip.pairipLicenseBypassPatch
import app.w3s.patches.w3schools.shared.Constants.COMPATIBILITY_W3SCHOOLS

private const val CHUNKS_PREFIX = "assets/public/_next/static/chunks/"
private val ENERGY_FUNCTIONS_REGEX = Regex(
    """async function ([A-Za-z_${'$'}][\w${'$'}]*)\(\)\{return ([A-Za-z_${'$'}][\w${'$'}]*)\(([A-Za-z_${'$'}][\w${'$'}]*)\(\(await \(0,[A-Za-z_${'$'}][\w${'$'}]*\.apiRequest\)\(([A-Za-z_${'$'}][\w${'$'}]*)\(\)\)\)\.userEnergy\)\)\}""" +
        """async function ([A-Za-z_${'$'}][\w${'$'}]*)\(\)\{try\{let [A-Za-z_${'$'}][\w${'$'}]*=await \(0,[A-Za-z_${'$'}][\w${'$'}]*\.apiRequest\)\(`\$\{\4\(\)\}/decrement`,\{method:"POST"\}\),[A-Za-z_${'$'}][\w${'$'}]*=\2\(\3\([A-Za-z_${'$'}][\w${'$'}]*\.userEnergy\)\);return\{success:!0,snapshot:[A-Za-z_${'$'}][\w${'$'}]*\}\}catch\([A-Za-z_${'$'}][\w${'$'}]*\)\{.*?return\{success:!1,snapshot:null\}\}\}"""
)

@Suppress("unused")
val unlimitedEnergyPatch = patch(
    name = "Unlimited energy",
    description = "Bypasses client-side energy consumption and always reports full energy charges.",
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
            if (!content.contains("/competency-api/user-energy")) continue

            val match = ENERGY_FUNCTIONS_REGEX.find(content)
                ?: throw PatchException("Found user-energy chunk $entry, but expected functions did not match.")

            val getEnergyFn = match.groupValues[1]
            val toSnapshotFn = match.groupValues[2]
            val consumeEnergyFn = match.groupValues[5]
            val fullSnapshot = "$toSnapshotFn({totalEnergy:3,currentEnergy:3,nextRechargeAt:null,rechargeIntervalMinutes:480})"
            val replacement = "async function $getEnergyFn(){return $fullSnapshot}" +
                "async function $consumeEnergyFn(){return{success:!0,snapshot:$fullSnapshot}}"

            val updated = content.replaceRange(match.range, replacement)
            file.writeText(updated)
            patchedCount++
        }

        if (patchedCount == 0) {
            throw PatchException("Could not find the user-energy module in $CHUNKS_PREFIX.")
        }
    }
}
