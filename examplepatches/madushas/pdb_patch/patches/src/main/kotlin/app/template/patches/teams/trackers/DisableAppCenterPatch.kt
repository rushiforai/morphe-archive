package app.template.patches.teams.trackers

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TEAMS_COMPATIBILITY
import app.template.patches.shared.clearBody
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

/**
 * Turns off Microsoft **AppCenter** — the client-side telemetry/crash SDK Teams bundles
 * (`AppCenter`, `crashes`, `analytics`, `channel/OneCollectorChannelListener`, …).
 *
 * R8 inlined the public `AppCenter.start(Application, String, Class…)` facade into the SDK's
 * internal bootstrap, so in this dex the entry point is
 * `AppCenter.configureAndStartServices(Application, String, Class[])V` (which `startServices`
 * and the service configuration hang off). No-oping both by name stops the SDK from
 * initialising any service, so nothing is collected or uploaded.
 *
 * Teams' own telemetry goes to Microsoft's servers through its normal authenticated API, which a
 * client patch cannot remove — this only silences the bundled client SDK.
 *
 * NOTE: the class is located with `classDefForEach` + `mutableClassDefBy(classDef)` on purpose —
 * in FULL bytecode mode `mutableClassDefByOrNull(type)` silently returns null for classes that
 * are not in the first dex.
 */
@Suppress("unused")
val teamsDisableAppCenterPatch = bytecodePatch(
    name = "Disable AppCenter telemetry",
    description = "No-ops Microsoft AppCenter's SDK bootstrap (configureAndStartServices / " +
        "startServices) so the bundled telemetry/crash SDK never initialises.",
    default = true,
) {
    compatibleWith(TEAMS_COMPATIBILITY)

    execute {
        val boot = setOf("configureAndStartServices", "startServices")
        val targets = ArrayList<Pair<ClassDef, Method>>()
        classDefForEach { classDef ->
            if (classDef.type == "Lcom/microsoft/appcenter/AppCenter;") {
                classDef.methods.filter { it.name in boot }.forEach { targets.add(classDef to it) }
            }
        }

        var count = 0
        for ((classDef, method) in targets) {
            val mutable = mutableClassDefBy(classDef).methods.firstOrNull {
                it.name == method.name && it.returnType == method.returnType &&
                    it.parameterTypes == method.parameterTypes
            } ?: continue
            mutable.clearBody()
            mutable.addInstructions(0, "return-void")
            count++
        }
        println("[teamsDisableAppCenter] AppCenter bootstrap methods no-oped: $count")
    }
}
