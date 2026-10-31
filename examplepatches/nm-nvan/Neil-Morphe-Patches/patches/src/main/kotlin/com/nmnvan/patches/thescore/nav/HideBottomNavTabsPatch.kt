package com.nmnvan.patches.thescore.nav

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.newInstance
import app.morphe.patcher.patch.bytecodePatch
import com.nmnvan.patches.thescore.settings.settingsPatch
import com.nmnvan.patches.thescore.shared.Constants.COMPATIBILITY_THESCORE
import com.nmnvan.patches.thescore.shared.Constants.EXTENSION_PACKAGE
import com.nmnvan.patches.thescore.shared.addInstructionsAtControlFlowLabel
import com.nmnvan.patches.thescore.shared.callBeforeReturnVoid
import com.nmnvan.patches.thescore.shared.filterReturnedInts
import com.nmnvan.patches.thescore.shared.isFrom
import com.nmnvan.patches.thescore.shared.setExtensionIsPatchIncluded

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/patches/BottomNavPatch;"

/**
 * BottomNavController(navGraphIds, fragmentManager, containerId, …, deepLink, tabs).
 * After checking that navGraphIds and tabs line up, it creates a SparseArray of fragment tags.
 */
internal object BottomNavControllerConstructorFingerprint : Fingerprint(
    name = "<init>",
    parameters = listOf("Ljava/util/List;", "L", "I", "L", "L", "Ljava/util/List;"),
    strings = listOf("bottomNavigation#"),
    filters = listOf(newInstance("Landroid/util/SparseArray;")),
    custom = { _, classDef -> classDef.isFrom("BottomNavController.kt") }
)

/**
 * SettingsStorageGateway: the saved "last active" bottom tab, or Scores if none.
 */
internal object SavedBottomTabFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf(),
    strings = listOf("navigator.last_active_tab_v2"),
    custom = { _, classDef -> classDef.isFrom("SettingsStorageGateway.kt") }
)

@Suppress("unused")
val hideBottomNavTabsPatch = bytecodePatch(
    name = "Hide bottom navigation tabs",
    description = "Adds options in Morphe Settings to hide the News, Scores, Favorites and Bet tabs. Leagues is always shown.",
    default = true
) {
    compatibleWith(COMPATIBILITY_THESCORE)

    dependsOn(settingsPatch)

    execute {
        setExtensionIsPatchIncluded(EXTENSION_CLASS)

        BottomNavControllerConstructorFingerprint.let {
            it.method.apply {
                // The tab list is the last parameter (p0 is "this").
                val tabsRegister = "p${parameterTypes.size}"

                // Filter only the visible tabs, after the app checked they match the nav graphs.
                addInstructionsAtControlFlowLabel(
                    it.instructionMatches.first().index,
                    """
                        invoke-static/range { $tabsRegister .. $tabsRegister }, $EXTENSION_CLASS->filterTabs(Ljava/util/List;)Ljava/util/List;
                        move-result-object $tabsRegister
                    """
                )

                // Back returns to the "home" tab (News); use Leagues if News is hidden.
                callBeforeReturnVoid("$EXTENSION_CLASS->fixHomeTab(Ljava/lang/Object;)V")
            }
        }

        // Start on Leagues if the tab the app would open on is hidden.
        SavedBottomTabFingerprint.method.filterReturnedInts("$EXTENSION_CLASS->getStartTab(I)I")
    }
}
