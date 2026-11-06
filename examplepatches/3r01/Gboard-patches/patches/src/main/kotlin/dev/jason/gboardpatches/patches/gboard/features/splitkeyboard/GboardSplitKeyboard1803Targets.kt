package dev.jason.gboardpatches.patches.gboard.features.splitkeyboard

import dev.jason.gboardpatches.patches.gboard.shared.GboardFieldTarget
import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget

internal object GboardSplitKeyboard1803Targets {
    const val ORDER_RETURN_TYPE = "Lvvw;"

    val accessPointName = GboardFieldTarget(
        classType = "Lmig;",
        name = "b",
        type = "Ljava/lang/String;",
    )
    val accessPointState = GboardMethodTarget(
        classType = "Lmig;",
        name = "b",
        parameterTypes = listOf("I"),
        returnType = "V",
    )
    val accessPointOrder = GboardMethodTarget(
        classType = "Lmku;",
        name = "c",
        parameterTypes = emptyList(),
        returnType = ORDER_RETURN_TYPE,
    )
    val modeAttach = GboardMethodTarget(
        classType = "Lpdy;",
        name = "E",
        parameterTypes = listOf("Lpcv;", "Loru;", "Loww;", "Z"),
        returnType = "V",
    )
    val modeEnvironmentReload = GboardMethodTarget(
        classType = "Lpdy;",
        name = "Q",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val splitAction = GboardMethodTarget(
        classType = "Lpdy;",
        name = "W",
        parameterTypes = emptyList(),
        returnType = "V",
    )
}
