package dev.jason.gboardpatches.patches.gboard.shared

import app.morphe.patcher.patch.BytecodePatchContext
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings

/**
 * The three members the gesture policy composer rewrites: the forwarding boundary it replaces, the
 * stock-delegate field that boundary reads, and the stock dispatch it forwards to.
 *
 * All three move together because the stock shape asserts their relationship, not their names: the
 * field must sit on the boundary's owner, carry the stock dispatch's owner as its type, and the
 * stock dispatch must share the boundary's prototype.
 */
internal data class GestureFamilyTargets(
    val dispatch: GboardMethodTarget,
    val stockDelegateField: GboardFieldTarget,
    val stockDispatch: GboardMethodTarget,
)

/**
 * Chooses by what the APK declares, so a release the generated projection cannot describe falls
 * through to its audited row instead of resolving names that are not there.
 */
internal fun gestureFamilyTargets(context: BytecodePatchContext): GestureFamilyTargets =
    selectReleaseTargets(
        context = context,
        projection = ::gestureFamilyProjection,
        probe = GestureFamilyTargets::dispatch,
        audited = GESTURE_FAMILY_18_8,
    )

/** Read at call time so a build that does not select a gesture feature can load this class. */
private fun gestureFamilyProjection() = GestureFamilyTargets(
    dispatch = GboardVersionBindings.gestureDispatch,
    stockDelegateField = GboardVersionBindings.gestureStockDelegateField,
    stockDispatch = GboardVersionBindings.gestureStockDispatch,
)

/**
 * 18.8.0 keeps the same forwarding boundary and only moves it: the dispatcher became an interface
 * (`Lagyx;`, whose implementation the view holds in `Lagyw;->s:Lagyx;`), and the boundary now sits
 * on its sole implementor `Lagyn;`, still three instructions long - `iget-object v0, v0,
 * Lagyn;->n:Lagyl;`, `invoke-interface/range {v0 .. v13}, Lagyl;->h(...)`, `return-void` - with the
 * stock dispatch itself on the `Lagyl;` interface.
 *
 * The prototype changed with the rename (`Lqck;` -> `Lagyw;`, `Lpuc;` -> `Lagkl;`, `Lpva;` ->
 * `Lagmb;`) but still costs thirteen parameter words, so the register layout and the composer's
 * helper bodies carry over unchanged.
 */
private const val DISPATCH_FIRST_PARAMETER = "Lagyw;"
private val DISPATCH_PARAMETERS = listOf(
    DISPATCH_FIRST_PARAMETER,
    "Lagkl;",
    "Lagmb;",
    "Lcom/google/android/libraries/inputmethod/metadata/SoftKeyDef;",
    "J",
    "Z",
    "Z",
    "I",
    "Z",
    "J",
    "I",
)

private val GESTURE_FAMILY_18_8 = GestureFamilyTargets(
    dispatch = GboardMethodTarget(
        classType = "Lagyn;",
        name = "f",
        parameterTypes = DISPATCH_PARAMETERS,
        returnType = "V",
    ),
    stockDelegateField = GboardFieldTarget(
        classType = "Lagyn;",
        name = "n",
        type = "Lagyl;",
    ),
    stockDispatch = GboardMethodTarget(
        classType = "Lagyl;",
        name = "h",
        parameterTypes = DISPATCH_PARAMETERS,
        returnType = "V",
    ),
)
