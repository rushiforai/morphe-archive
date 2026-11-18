package patches.gboard.features.splitkeyboard

import patches.gboard.shared.GboardFieldTarget
import patches.gboard.shared.GboardMethodTarget
import patches.gboard.shared.generated.GboardVersionBindings

internal object GboardSplitKeyboardTargets {
    const val ORDER_RETURN_TYPE = "Lwhe;"

    val splitEligibility get() = GboardVersionBindings.splitEligibility
    val splitDeviceEligibility get() = GboardVersionBindings.splitDeviceEligibility
    val splitWidthEligibility get() = GboardVersionBindings.splitWidthEligibility

    val accessPointName = GboardFieldTarget(
        classType = "Lsze;",
        name = "d",
        type = "Ljava/lang/Object;",
    )
    val accessPointState = GboardMethodTarget(
        classType = "Lsze;",
        name = "e",
        parameterTypes = listOf("I"),
        returnType = "V",
    )
    val accessPointOrder = GboardMethodTarget(
        classType = "Lmpb;",
        name = "c",
        parameterTypes = emptyList(),
        returnType = ORDER_RETURN_TYPE,
    )
    val modeAttach = GboardMethodTarget(
        classType = "Lpks;",
        name = "F",
        parameterTypes = listOf("Lpjq;", "Loyq;", "Lpdr;", "Z"),
        returnType = "V",
    )
    val modeEnvironmentReload = GboardMethodTarget(
        classType = "Lpks;",
        name = "R",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val splitAction = GboardMethodTarget(
        classType = "Lpks;",
        name = "X",
        parameterTypes = emptyList(),
        returnType = "V",
    )
}
