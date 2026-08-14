package dev.jason.gboardpatches.patches.gboard.features.splitkeyboard

import dev.jason.gboardpatches.patches.gboard.shared.GboardFieldTarget
import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget

internal object GboardSplitKeyboard1777Targets {
    const val ORDER_RETURN_TYPE = "Lvai;"

    val accessPointName = GboardFieldTarget(
        classType = "Llom;",
        name = "b",
        type = "Ljava/lang/String;",
    )
    val accessPointState = GboardMethodTarget(
        classType = "Llom;",
        name = "b",
        parameterTypes = listOf("I"),
        returnType = "V",
    )
    val accessPointOrder = GboardMethodTarget(
        classType = "Llra;",
        name = "c",
        parameterTypes = emptyList(),
        returnType = ORDER_RETURN_TYPE,
    )
    val modeAttach = GboardMethodTarget(
        classType = "Lojy;",
        name = "D",
        parameterTypes = listOf("Loix;", "Lnyb;", "Lodb;", "Z"),
        returnType = "V",
    )
    val modeEnvironmentReload = GboardMethodTarget(
        classType = "Lojy;",
        name = "P",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val splitAction = GboardMethodTarget(
        classType = "Lojy;",
        name = "V",
        parameterTypes = emptyList(),
        returnType = "V",
    )
}
