package app.template.patches.rustore.navigation

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

/** Matches `RootNavHost`, which selects the app's initial navigation route. */
object RootNavHostFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "L",
        "Z",
        "L",
        "Landroidx/compose/runtime/a;",
        "I",
    ),
    custom = { method, classDef ->
        classDef.sourceFile == "RootNavHost.kt" && method.implementation != null
    },
)
