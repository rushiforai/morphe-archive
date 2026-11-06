// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/rustore/gaming/Fingerprints.kt.
package app.ru_apps.rustore_jl4ctuk.gaming

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Matches the direct Game Profile navigation action from the Mine screen.
 * The source file was `MineV2ViewModel.kt` before RuStore 1.111.0.3 dropped
 * the classic/V2 fork (see mine/Fingerprints.kt) and renamed the sole
 * remaining ViewModel to `MineViewModel.kt` - confirmed via live decompile
 * (2026-10) by matching this method's body (the `gameProfile.click` analytics
 * call), not just the class name.
 */
object MineV2OpenGameCenterFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("gameProfile.click"),
    custom = { method, classDef ->
        classDef.sourceFile == "MineViewModel.kt" &&
            method.implementation != null
    },
)

/** Matches the widget ViewModel implementation without relying on any R8 descriptor. */
object GameCenterWidgetViewModelConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf("L", "L", "L", "L"),
    strings = listOf("gameCenterStatsDelegate"),
    custom = { method, classDef ->
        classDef.sourceFile == "GameCenterButtonWidgetViewModelImpl.kt" &&
            AccessFlags.FINAL.isSet(classDef.accessFlags) &&
            classDef.superclass != "Ljava/lang/Object;" &&
            classDef.interfaces.size == 1 &&
            method.implementation != null
    },
)

/** Matches the generated `MainActivity` injector independently of widget R8 types. */
object GameCenterWidgetRegistryFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lru/vk/store/app/MainActivity;"),
    custom = { method, classDef ->
        classDef.sourceFile == "DaggerApp_HiltComponents_SingletonC.java" &&
            method.implementation != null
    },
)

/**
 * Matches the Game Center button rendered by the V2 Mine screen. A live
 * decompile (ru.vk.store 1.111.0.3, 2026-10) found `GameCenterV2ButtonWidget.kt`
 * no longer exists as a sourceFile - the V2 fork was dropped and its composable
 * merged into `GameCenterButtonWidget.kt` alongside V1's, so this fingerprint
 * now never matches on current builds. Left in place (matched with
 * `matchOrNull()` in DisableGamingProfilePatch.kt) for older/forked builds that
 * still carry a separate V2 file.
 */
object GameCenterV2ButtonComposableFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Lkotlin/jvm/functions/Function0;",
        "L",
        "L",
        "Landroidx/compose/runtime/a;",
        "I",
    ),
    custom = { method, classDef ->
        classDef.sourceFile == "GameCenterV2ButtonWidget.kt" &&
            method.implementation != null
    },
)

/** Matches the Game Center statistics card rendered by the classic Mine screen. */
object GameCenterV1ButtonComposableFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Lkotlin/jvm/functions/Function0;",
        "L",
        "L",
        "Landroidx/compose/runtime/a;",
        "I",
    ),
    custom = { method, classDef ->
        classDef.sourceFile == "GameCenterButtonWidget.kt" &&
            method.implementation != null
    },
)
