// patches/src/main/kotlin/app/w3s/patches/w3schools/energy/UnlimitedEnergyPatch.kt
package app.w3s.patches.w3schools.energy

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.listApkEntries
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.w3s.patches.w3schools.misc.pairip.pairipLicenseBypassPatch
import app.w3s.patches.w3schools.shared.Constants.COMPATIBILITY_W3SCHOOLS

private const val CHUNKS_PREFIX = "assets/public/_next/static/chunks/"
private const val IDENT = """[A-Za-z_${'$'}][\w${'$'}]*"""

private val GET_ENERGY_REGEX = Regex(
    """async function ($IDENT)\(\)\{return ($IDENT)\(($IDENT)\(\(await \(0,$IDENT\.apiRequest\)\(($IDENT)\(\)\)\)\.userEnergy\)\)\}""",
)

private val CONSUME_ENERGY_REGEX = Regex(
    """async function ($IDENT)\(\)\{try\{let $IDENT=await \(0,$IDENT\.apiRequest\)\(`\$\{$IDENT\(\)\}/decrement`,\{method:"POST"\}\),$IDENT=($IDENT)\($IDENT\($IDENT\.userEnergy\)\);return\{success:!0,snapshot:$IDENT\}\}catch\($IDENT\)\{[\s\S]*?return\{success:!1,snapshot:null\}\}\}""",
)

private val ENERGY_PAGE_REGEX = Regex(
    """(function $IDENT\(\)\{let\{[^}]*isFreeUser:($IDENT)[^}]*\}=\(0,$IDENT\.useUser\)\(\)[^;]*\{[^}]*energy:$IDENT[^}]*\}=\(0,$IDENT\.useEnergy\)\(\{enabled:)\2&&!$IDENT(\}\);return )\2(?=\?\(0,$IDENT\.jsx\)\()""",
)

private val TOPBAR_ENERGY_REGEX = Regex(
    """key:"energy",label:"Energy",href:"/energy",""" +
        """icon:($IDENT)&&!$IDENT\?\(0,$IDENT\.jsx\)\($IDENT,\{\}\):""" +
        """\1\?\(0,$IDENT\.jsx\)\($IDENT\.EnergyTopBarBatteryIcon,\{chargeCount:$IDENT\.chargeCount\}\):""" +
        """(\(0,$IDENT\.jsx\)\($IDENT\.BatteryIcon,\{\}\)),""" +
        """value:\1&&!$IDENT\?\(0,$IDENT\.jsx\)\("span",\{className:"[^"]*"\}\):""" +
        """\1\?$IDENT\.currentEnergy:(\(0,$IDENT\.jsx\)\($IDENT\.InfinityIcon,\{\}\))""",
)

private val CURRICULUM_HEADER_ENERGY_REGEX = Regex(
    """$IDENT\?$IDENT\?\(0,$IDENT\.jsxs\)\($IDENT\.Fragment,""" +
        """\{children:\[\(0,$IDENT\.jsx\)\("div",\{className:"[^"]*",""" +
        """children:\(0,$IDENT\.jsx\)\($IDENT\.EnergyTopBarBatteryIcon,\{chargeCount:$IDENT\.chargeCount(?:,className:"[^"]*")?\}\)\}\),""" +
        """\(0,$IDENT\.jsx\)\("p",\{className:"[^"]*",children:$IDENT\.currentEnergy\}\)\]\}\):""" +
        """\(0,$IDENT\.jsx\)\($IDENT,\{\}\):""" +
        """(\(0,$IDENT\.jsxs\)\($IDENT\.Fragment,\{children:\[\(0,$IDENT\.jsx\)\("div",\{className:"[^"]*",""" +
        """children:\(0,$IDENT\.jsx\)\($IDENT\.BatteryIcon,\{\}\)\}\),""" +
        """\(0,$IDENT\.jsx\)\("p",\{className:"[^"]*",children:\(0,$IDENT\.jsx\)\($IDENT\.InfinityIcon,\{\}\)\}\)\]\}\))""",
)

private val PROFILE_ENERGY_REGEX = Regex(
    """(children:$IDENT\?)$IDENT\?$IDENT\.currentEnergy:(\(0,$IDENT\.jsx\)\($IDENT\.InfinityIcon,\{\}\))""",
)

@Suppress("unused")
val unlimitedEnergyPatch = patch(
    name = "Unlimited energy",
    description = "Bypasses client-side energy consumption, reports full charges, and shows the unlimited energy UI.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_W3SCHOOLS)

    dependsOn(pairipLicenseBypassPatch)

    execute {
        val chunkEntries = listApkEntries(CHUNKS_PREFIX).filter { it.endsWith(".js") }
        var patchedGetCount = 0
        var patchedConsumeCount = 0

        for (entry in chunkEntries) {
            val file = resourceFile(entry)
            var content = file.readText()
            var changed = false

            if (content.contains("/competency-api/user-energy")) {
                GET_ENERGY_REGEX.find(content)?.let { match ->
                    val getEnergyFn = match.groupValues[1]
                    val toSnapshotFn = match.groupValues[2]
                    val fullSnapshot =
                        "$toSnapshotFn({totalEnergy:3,currentEnergy:3,nextRechargeAt:null,rechargeIntervalMinutes:480})"
                    content = content.replaceRange(
                        match.range,
                        "async function $getEnergyFn(){return $fullSnapshot}",
                    )
                    patchedGetCount++
                    changed = true
                }

                CONSUME_ENERGY_REGEX.find(content)?.let { match ->
                    val consumeEnergyFn = match.groupValues[1]
                    val toSnapshotFn = match.groupValues[2]
                    val fullSnapshot =
                        "$toSnapshotFn({totalEnergy:3,currentEnergy:3,nextRechargeAt:null,rechargeIntervalMinutes:480})"
                    content = content.replaceRange(
                        match.range,
                        "async function $consumeEnergyFn(){return{success:!0,snapshot:$fullSnapshot}}",
                    )
                    patchedConsumeCount++
                    changed = true
                }
            }

            if (content.contains("Get unlimited energy!")) {
                ENERGY_PAGE_REGEX.find(content)?.let { match ->
                    content = content.replaceRange(match.range, "${match.groupValues[1]}!1${match.groupValues[3]}!1")
                    changed = true
                }
            }

            if (content.contains("EnergyTopBarBatteryIcon")) {
                TOPBAR_ENERGY_REGEX.find(content)?.let { match ->
                    content = content.replaceRange(
                        match.range,
                        """key:"energy",label:"Energy",href:"/energy",icon:${match.groupValues[2]},value:${match.groupValues[3]}""",
                    )
                    changed = true
                }

                CURRICULUM_HEADER_ENERGY_REGEX.find(content)?.let { match ->
                    content = content.replaceRange(match.range, match.groupValues[1])
                    changed = true
                }
            }

            if (content.contains("Energy charges")) {
                PROFILE_ENERGY_REGEX.find(content)?.let { match ->
                    content = content.replaceRange(match.range, "${match.groupValues[1]}!1?null:${match.groupValues[2]}")
                    changed = true
                }
            }

            if (changed) {
                file.writeText(content)
            }
        }

        if (patchedGetCount == 0 || patchedConsumeCount == 0) {
            throw PatchException("Could not find the user-energy module functions in $CHUNKS_PREFIX.")
        }
    }
}
