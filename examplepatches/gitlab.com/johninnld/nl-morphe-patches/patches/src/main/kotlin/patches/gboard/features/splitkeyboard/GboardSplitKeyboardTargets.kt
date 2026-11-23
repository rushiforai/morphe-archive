package patches.gboard.features.splitkeyboard

import patches.gboard.shared.GboardFieldTarget
import patches.gboard.shared.GboardMethodTarget
import patches.gboard.shared.generated.GboardVersionBindings

internal object GboardSplitKeyboardTargets {
    const val ORDER_RETURN_TYPE = "Lauaz;"

    val splitEligibility get() = GboardVersionBindings.splitEligibility
    val splitDeviceEligibility get() = GboardVersionBindings.splitDeviceEligibility
    val splitWidthEligibility get() = GboardVersionBindings.splitWidthEligibility

    val accessPointName = GboardFieldTarget(
        classType = "Laadv;",
        name = "d",
        type = "Ljava/lang/Object;",
    )
    val accessPointState = GboardMethodTarget(
        classType = "Laadv;",
        name = "b",
        parameterTypes = listOf("I"),
        returnType = "V",
    )
    val accessPointOrder = GboardMethodTarget(
        classType = "Laaia;",
        name = "c",
        parameterTypes = emptyList(),
        returnType = ORDER_RETURN_TYPE,
    )
    val modeAttach = GboardMethodTarget(
        classType = "Lafri;",
        name = "T",
        parameterTypes = listOf("Lafoo;", "Laeuj;", "Lafdi;", "Z"),
        returnType = "V",
    )
    val modeEnvironmentReload = GboardMethodTarget(
        classType = "Lafri;",
        name = "ai",
        parameterTypes = emptyList(),
        returnType = "V",
    )
    val splitAction = GboardMethodTarget(
        classType = "Lafri;",
        name = "X",
        parameterTypes = emptyList(),
        returnType = "V",
    )
}
