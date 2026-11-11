package app.polishapps.patches.lidl.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.polishapps.patches.inpost.shared.parameterTypeNames

internal const val LIDL_EXTENSION = "extensions/extension.mpe"
internal const val MODULE_FILTERS = "Lapp/polishapps/extension/lidl/ModuleFilters;"

private const val LIST = "Ljava/util/List;"

/**
 * Lidl Plus keeps two copies of the home screen configuration model (the older `home` and the newer
 * `metahome` feature). Both are Moshi data classes whose names survive R8, and both receive the
 * server's module names as a `List<String>` in their `(id, modules)` constructor.
 */
private val HOME_CONFIGURATIONS = listOf(
    "Les/lidlplus/features/home/data/network/models/configuration/Configuration;",
    "Les/lidlplus/features/metahome/data/network/models/configuration/Configuration;",
)

/**
 * Passes the constructor's list parameter through `ModuleFilters.<[filter]>` before it is stored.
 *
 * Filtering where the list is created covers every consumer at once: the request that asks the server
 * for module content, the cached configuration and the screen that renders the modules.
 */
internal fun MutableMethod.filterListParameter(register: String, filter: String) {
    addInstructions(
        0,
        """
            invoke-static {$register}, $MODULE_FILTERS->$filter($LIST)$LIST
            move-result-object $register
        """,
    )
}

/** Hooks both home configuration models. At least one must exist, the other may be absent. */
internal fun BytecodePatchContext.filterHomeModules(filter: String) {
    val configurations = HOME_CONFIGURATIONS.mapNotNull { type -> mutableClassDefByOrNull(type) }
    if (configurations.isEmpty()) {
        throw PatchException("No home Configuration model found, tried $HOME_CONFIGURATIONS")
    }
    configurations.forEach { configuration ->
        val constructor = configuration.methods.singleOrNull { method ->
            method.name == "<init>" && method.parameterTypeNames() == listOf("Ljava/lang/String;", LIST)
        } ?: throw PatchException("${configuration.type}: (String, List) constructor not found")
        constructor.filterListParameter("p2", filter)
    }
}
