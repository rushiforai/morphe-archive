package dev.jason.gboardpatches.patches.gboard.features.splitkeyboard

import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings

/**
 * 18.6.3 split-keyboard targets.
 *
 * The previous constants were mined from an older build and named classes that now hold unrelated
 * code (Ltfm is a LinkMovementMethod, Lpqw/Lmwg are gone). Every target is taken from the
 * generated 18.6.3 bindings again, so the obfuscated names come from one place.
 */
internal object GboardSplitKeyboardTargets {
    const val ORDER_RETURN_TYPE = "Lwhe;"

    val splitEligibility get() = GboardVersionBindings.splitEligibility
    val splitDeviceEligibility get() = GboardVersionBindings.splitDeviceEligibility
    val splitWidthEligibility get() = GboardVersionBindings.splitWidthEligibility

    val accessPointName get() = GboardVersionBindings.splitAccessPointName
    val accessPointState get() = GboardVersionBindings.splitState
    val accessPointOrder get() = GboardVersionBindings.splitOrder
    val modeAttach get() = GboardVersionBindings.splitModeAttach
    val modeEnvironmentReload get() = GboardVersionBindings.splitModeReload
    val splitAction get() = GboardVersionBindings.splitModeManual

    val modeCurrent get() = GboardVersionBindings.splitModeCurrent
    val modeRestore get() = GboardVersionBindings.splitModeRestore
    val modeTransition get() = GboardVersionBindings.splitModeTransition
}
