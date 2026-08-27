package app.template.patches.rustore.gaming

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/** Matches the direct Game Profile navigation action from the V2 Mine screen. */
object MineV2OpenGameCenterFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("gameProfile.click"),
    custom = { method, classDef ->
        classDef.sourceFile == "MineV2ViewModel.kt" &&
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

/** Matches the Game Center button rendered by the V2 Mine screen. */
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
