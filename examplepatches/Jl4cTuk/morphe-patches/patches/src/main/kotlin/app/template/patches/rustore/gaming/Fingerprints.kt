package app.template.patches.rustore.gaming

import app.morphe.patcher.Fingerprint

/** Matches `MineV2ViewModel.openGameCenter()`. */
object MineV2ViewModelOpenGameCenterFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("gameProfile.click"),
    custom = { method, classDef ->
        classDef.sourceFile == "MineV2ViewModel.kt" &&
            method.implementation != null
    },
)

/** Matches the Game Center button rendered by the V2/V3 Mine screen. */
object GameCenterV2ButtonComposableFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Lkotlin/jvm/functions/Function0;",
        "Landroidx/compose/ui/Modifier;",
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
        "Landroidx/compose/ui/Modifier;",
        "L",
        "Landroidx/compose/runtime/a;",
        "I",
    ),
    custom = { method, classDef ->
        classDef.sourceFile == "GameCenterButtonWidget.kt" &&
            method.implementation != null
    },
)
