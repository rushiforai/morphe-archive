package dev.jason.gboardpatches.patches.gboard.features.frostedglass

import app.morphe.patcher.patch.BytecodePatchContext
import dev.jason.gboardpatches.patches.gboard.shared.GboardFieldTarget
import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.selectReleaseTargets

/**
 * The ten members the Frosted Glass lifecycle rewrites.
 *
 * 18.8.0 renames all three classes while keeping the exact shapes: the IME service still declares
 * `onConfigureWindow(Window, ZZ)` with eleven registers and one `Window.setLayout`, the navigation
 * model still has the two ints, two OptionalInts and one boolean as final fields, and the applier
 * still takes `(Window, model)`. Only the names below differ, so the contract checks in the patch
 * stay version-independent and this table is the whole port.
 */
internal data class FrostedGlassTargets(
    val configure: GboardMethodTarget,
    val shown: GboardMethodTarget,
    val hidden: GboardMethodTarget,
    val navParamsConstructor: GboardMethodTarget,
    val navApply: GboardMethodTarget,
    val navColor: GboardFieldTarget,
    val navDivider: GboardFieldTarget,
    val navBody: GboardFieldTarget,
    val navHeader: GboardFieldTarget,
    val navLight: GboardFieldTarget,
)

/**
 * Chooses by what the APK actually declares, not by the version the generated projection was built
 * for: a projection only ever describes one release, and applying this patch to another build has to
 * fall through to the audited table instead of resolving names that are not there.
 */
internal fun frostedGlassTargets(context: BytecodePatchContext): FrostedGlassTargets =
    selectReleaseTargets(
        context = context,
        projection = ::frostedGlassProjectionTargets,
        probe = FrostedGlassTargets::configure,
        audited = FROSTED_GLASS_18_8,
    )

private val FROSTED_GLASS_18_8 = FrostedGlassTargets(
    configure = GboardMethodTarget(
        classType = "Lafae;",
        name = "onConfigureWindow",
        parameterTypes = listOf("Landroid/view/Window;", "Z", "Z"),
        returnType = "V",
    ),
    shown = GboardMethodTarget(
        classType = "Lafae;",
        name = "onWindowShown",
        parameterTypes = emptyList(),
        returnType = "V",
    ),
    hidden = GboardMethodTarget(
        classType = "Lafae;",
        name = "onWindowHidden",
        parameterTypes = emptyList(),
        returnType = "V",
    ),
    navParamsConstructor = GboardMethodTarget(
        classType = "Lajle;",
        name = "<init>",
        parameterTypes = listOf("I", "I", "Lj$/util/OptionalInt;", "Lj$/util/OptionalInt;", "Z"),
        returnType = "V",
    ),
    navApply = GboardMethodTarget(
        classType = "Lajlf;",
        name = "g",
        parameterTypes = listOf("Landroid/view/Window;", "Lajle;"),
        returnType = "V",
    ),
    navColor = GboardFieldTarget(classType = "Lajle;", name = "a", type = "I"),
    navDivider = GboardFieldTarget(classType = "Lajle;", name = "b", type = "I"),
    navBody = GboardFieldTarget(classType = "Lajle;", name = "c", type = "Lj$/util/OptionalInt;"),
    navHeader = GboardFieldTarget(classType = "Lajle;", name = "d", type = "Lj$/util/OptionalInt;"),
    navLight = GboardFieldTarget(classType = "Lajle;", name = "e", type = "Z"),
)

/**
 * Reads the generated projection at call time rather than at class-init time, so a build that does
 * not select Frosted Glass can still load this patch class.
 */
private fun frostedGlassProjectionTargets() = FrostedGlassTargets(
    configure = GboardVersionBindings.frostedConfigure,
    shown = GboardVersionBindings.frostedShown,
    hidden = GboardVersionBindings.frostedHidden,
    navParamsConstructor = GboardVersionBindings.frostedNavParamsConstructor,
    navApply = GboardVersionBindings.frostedNavApply,
    navColor = GboardVersionBindings.frostedNavColor,
    navDivider = GboardVersionBindings.frostedNavDivider,
    navBody = GboardVersionBindings.frostedNavBody,
    navHeader = GboardVersionBindings.frostedNavHeader,
    navLight = GboardVersionBindings.frostedNavLight,
)
