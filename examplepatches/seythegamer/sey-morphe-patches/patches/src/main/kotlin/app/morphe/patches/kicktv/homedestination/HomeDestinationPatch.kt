package app.morphe.patches.kicktv.homedestination

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import app.morphe.patches.kicktv.KICK_TV
import app.morphe.patches.kicktv.settings.settingsPatch

private const val EXTENSION_CLASS = "Lapp/morphe/extension/kicktv/homedestination/"

/**
 * Splash screen navigation, in the merged coroutine class `dn0` that R8 built
 * out of every `LaunchedEffect` of the start-up flow (`th7` is the
 * "VideoSplashScreen" composable). Once the splash gate reports `th6` the
 * effect launches case 26 and this method runs the final navigation:
 *
 * ```
 * check-cast v6, Lpt5;                 // NavHostController
 * new-instance p0, Lcf9;               // NavOptionsBuilder (popUpTo "splash")
 * const-string p1, "home"
 * invoke-virtual {v6, p1, p0}, Lxs5;->b(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
 * ```
 *
 * `"home"` occurs exactly once in this method, and `Lxs5;->b` is the only
 * navigation call inside it, so both filters are unambiguous.
 */
private object SplashNavigationFingerprint : Fingerprint(
    definingClass = "Ldn0;",
    name = "invokeSuspend",
    parameters = listOf("Ljava/lang/Object;"),
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("home"),
        methodCall(definingClass = "Lxs5;", name = "b"),
    ),
)

/**
 * DEFAULT HOME DESTINATION tweak. The splash screen normally opens the stock
 * Home tab; this patch swaps that route for the one picked in SEYTTINGS so
 * KICK starts on Home, Categories, Live, Following or Settings. The choice
 * survives restarts. Requires the SEYTTINGS patch.
 */
@Suppress("unused")
val homeDestinationPatch = patch(
    name = "DEFAULT HOME DESTINATION",
    description = "Opens the chosen tab (Home, Categories, Live, Following or " +
        "Settings) automatically when KICK starts. Pick it in SEYTTINGS. " +
        "Requires the SEYTTINGS patch.",
    default = true,
) {
    compatibleWith(KICK_TV)

    dependsOn(settingsPatch)

    extendWith("extensions/KickHomeDestination.mpe")

    execute {
        SplashNavigationFingerprint.apply {
            // instructionMatches: [const-string "home", xs5.b(route, options)]
            val index = instructionMatches[0].index
            method.replaceInstruction(
                index,
                "invoke-static {}, ${EXTENSION_CLASS}HomeDestinationHelper;->getStartRoute()Ljava/lang/String;",
            )
            // Restores the register the original const-string populated (p1) and
            // keeps the untouched NavOptions that pops "splash" off the stack.
            method.addInstructions(index + 1, "move-result-object p1")
        }
    }
}
