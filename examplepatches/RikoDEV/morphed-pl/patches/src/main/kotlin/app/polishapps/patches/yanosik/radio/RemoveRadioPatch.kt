package app.polishapps.patches.yanosik.radio

import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.shared.Constants.COMPATIBILITY_YANOSIK
import app.polishapps.patches.shared.Constants.YANOSIK_26_10_0
import app.polishapps.patches.shared.Constants.YANOSIK_26_9_0
import app.polishapps.patches.shared.MethodTarget
import app.polishapps.patches.shared.forceInstanceOfTrue
import app.polishapps.patches.shared.methodFingerprint
import app.polishapps.patches.shared.replaceBody
import app.polishapps.patches.shared.targetsFor

private data class RadioTargets(
    /** Coroutine that builds the map navigation models, including the "Radio" one. */
    val navigationModels: MethodTarget,
    /** Navigation state subclass the "Radio" model is gated on. */
    val radioNavigationState: String,
    /** Map "Radio" button composable. */
    val radioButton: MethodTarget,
)

private fun navigationModels(definingClass: String) =
    MethodTarget(definingClass, "invokeSuspend", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;")

private val targetsByVersion = mapOf(
    YANOSIK_26_9_0 to RadioTargets(
        navigationModels = navigationModels("Luy1;"),
        radioNavigationState = "Lhng;",
        radioButton = MethodTarget("Luvg;", "c", listOf("Lwof;", "Lu1c;", "Ly93;", "I"), "V"),
    ),
    YANOSIK_26_10_0 to RadioTargets(
        navigationModels = navigationModels("Lfz1;"),
        radioNavigationState = "Lztg;",
        radioButton = MethodTarget("Law;", "f", listOf("Lstf;", "Lo5c;", "Lpb3;", "I"), "V"),
    ),
)

/**
 * Removes the built-in "Radio Yanosik" from the main screen and the map.
 *
 * Three independent code paths are removed:
 *
 * 1. The dashboard pack feature. `Feature.d()` availability comes from
 *    `DashboardRadioConfiguration.a()`, and every entry point resolves the feature with
 *    `vq6.a(DashboardRadioFeature)` which filters on `d()`, so forcing `a()` to false removes
 *    the dashboard/drawer tile and the dashboard radio entry point.
 *
 * 2. The map navigation button model. The navigation models coroutine (`uy1` in 26.9.0) gates the
 *    "Radio" navigation model on an `instance-of` of the navigation state (`Lhng` in 26.9.0), which is
 *    forced to true.
 *
 * 3. The map RADIO button composable (`uvg.c` in 26.9.0). It draws a `Surface` button labelled with the
 *    "Radio" string and is the observed on-screen button above the settings cog. Replacing its body
 *    with `return-void` renders nothing, which is what actually hides the button.
 */
@Suppress("unused")
val removeRadioPatch = bytecodePatch(
    name = "Remove Yanosik radio",
    description = "Removes the built-in Radio Yanosik from the main screen and the map button.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YANOSIK)

    execute {
        val targets = targetsFor(targetsByVersion)

        // 1. Disable the dashboard pack radio feature.
        methodFingerprint(
            "Lpl/neptis/libraries/actions/dashboardpack/DashboardRadioConfiguration;",
            "a",
            returnType = "Z",
        ).method.replaceBody(
            """
                const/4 p0, 0x0
                return p0
            """,
        )

        // 2. Never build the "Radio" entry in the map navigation model.
        targets.navigationModels.fingerprint().method.forceInstanceOfTrue(targets.radioNavigationState)

        // 3. Render nothing for the map "Radio" button composable.
        targets.radioButton.fingerprint().method.replaceBody("return-void")
    }
}
