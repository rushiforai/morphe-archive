package app.polishapps.patches.lidl.navigation

import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.inpost.shared.parameterTypeNames
import app.polishapps.patches.inpost.shared.singleClass
import app.polishapps.patches.inpost.shared.strings
import app.polishapps.patches.lidl.shared.LIDL_EXTENSION
import app.polishapps.patches.lidl.shared.filterListParameter
import app.polishapps.patches.shared.Constants.COMPATIBILITY_LIDL_PLUS
import app.morphe.patcher.patch.PatchException

@Suppress("unused")
val hideOnlineShopTabPatch = bytecodePatch(
    name = "Hide online shop tab",
    description = "Removes the link to the online shop from the bottom navigation bar.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LIDL_PLUS)

    extendWith(LIDL_EXTENSION)

    execute {
        // The bottom bar is built from a server supplied list of tab names. The state holder that
        // carries the validated list is the only class whose toString() prints "Content(screenIds=".
        val tabsState = singleClass("bottom bar tab list") { classDef ->
            classDef.methods.any { method ->
                method.name == "toString" && "Content(screenIds=" in method.strings()
            }
        }

        val constructor = mutableClassDefBy(tabsState).methods.singleOrNull { method ->
            method.name == "<init>" && method.parameterTypeNames() == listOf("Ljava/util/List;")
        } ?: throw PatchException("${tabsState.type}: (List) constructor not found")

        constructor.filterListParameter("p1", "hideOnlineShopTab")
    }
}
