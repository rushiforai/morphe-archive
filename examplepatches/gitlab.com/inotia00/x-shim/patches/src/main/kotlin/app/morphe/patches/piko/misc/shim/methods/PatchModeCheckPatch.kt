package app.morphe.patches.piko.misc.shim.methods

import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patches.piko.misc.version.is_12_05_or_greater
import app.morphe.patches.piko.misc.version.versionCheckPatch
import kotlin.properties.Delegates

var resourceContext: ResourcePatchContext by Delegates.notNull()
    private set

val patchModeCheckPatch = rawResourcePatch {
    dependsOn(versionCheckPatch)

    execute {
        resourceContext = this
    }
}

internal fun advancedModeEnabled(): Boolean {
    if (is_12_05_or_greater) return false
    return abstractShimLayerMethodPatch.booleanOption("advancedMode").value == true
}

@Suppress("UNCHECKED_CAST")
private fun Patch<*>.booleanOption(key: String) =
    options[key] as Option<Boolean>
