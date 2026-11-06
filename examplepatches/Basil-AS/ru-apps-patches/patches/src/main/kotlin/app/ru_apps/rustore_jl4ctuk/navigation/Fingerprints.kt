// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/rustore/navigation/Fingerprints.kt.
package app.ru_apps.rustore_jl4ctuk.navigation

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val NAVIGATION_TAB_KIND =
    "Lru/vk/store/feature/showcase/tabsOrder/api/domain/NavigationTabKind;"

/** Matches the `MainViewModel` factory that creates the immutable navigation-tab state. */
object MainNavigationTabsFactoryFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf("Z", "L"),
    custom = { method, classDef ->
        classDef.sourceFile == "MainViewModel.kt" &&
            method.implementation?.instructions?.count { instruction ->
                val type =
                    (instruction as? ReferenceInstruction)?.reference as? TypeReference
                type?.type == NAVIGATION_TAB_KIND
            } == 1
    },
)

/**
 * Matches `RootNavHost`, which selects the app's initial navigation route. A
 * live decompile (ru.vk.store 1.111.0.3, 2026-10) found this dropped a
 * boolean parameter (5 params -> 4) - confirmed by matching the method body
 * (exactly one `InterestingTabDestination` and one
 * `RecommendationGamesDestination` const-class reference), not just the shape.
 */
object RootNavHostFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "L",
        "L",
        "Landroidx/compose/runtime/a;",
        "I",
    ),
    custom = { method, classDef ->
        classDef.sourceFile == "RootNavHost.kt" && method.implementation != null
    },
)
