package app.jofslash.patches.booking.promotions

import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.jofslash.patches.booking.shared.methodOf
import app.jofslash.patches.booking.shared.returnEarly
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/** Collects the sheets the home screen shows when the app starts (the "launch sheet"). */
private const val LAUNCH_SHEET_REACTOR =
    "Lcom/booking/appindexcomponents/productpatterns/homelaunchsheet/HomeLaunchSheetReactor;"
private const val LAUNCH_SHEET_UTILS = "Lcom/booking/appindex/presentation/utils/HomeLaunchSheetUtils;"

/**
 * The start-up task that, on the first start, lines up the home screen, the full-screen sign-in
 * page and the notification opt-in. Its execute() returns them as a list of intents.
 */
private const val ONBOARDING_TASK = "Lcom/booking/startup/splashtasks/UserGdprTask;"
private const val STARTUP_SIGN_IN = "Lapp/jofslash/extension/booking/StartupSignIn;"

@Suppress("unused")
val disableStartupPromotionsPatch = bytecodePatch(
    name = "Disable start-up promotions",
    description = "Stops the sheets that pop up on the home screen when the app starts, such as campaign " +
            "deals (\"Black Friday Deals are now live\"), Genius and sign-in offers, the co-branded credit " +
            "card and wallet offers, and the full-screen sign-in page the app opens on its first start. " +
            "The same deals and sign in stay reachable from the app itself.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_BOOKING)

    extendWith("extensions/booking.mpe")

    execute {
        // Server-driven sheets, such as campaign deals: when a product tab (Stays, Car rentals,
        // Attractions, Taxis) is picked, the app asks Booking for a sheet to show. Don't ask.
        methodOf(LAUNCH_SHEET_REACTOR, "checkSabaLaunchSheet").returnEarly()

        // The app's own sheets (Genius sign in and onboarding, wallet, co-branded card, chat
        // assistant): this decides which one to show, and shows it. Show none.
        methodOf(LAUNCH_SHEET_UTILS, "decideShowingSheetType").returnEarly()

        // The full-screen sign-in page on the first start (and on later starts for some US users):
        // take it out of the screens the start-up task opens, so the app goes on to the home screen.
        // The home screen, the notification opt-in and the cookie dialog stay as they are.
        val execute = methodOf(ONBOARDING_TASK, "execute", emptyList())
        val returns = execute.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_OBJECT }
            .map { it.index to (it.value as OneRegisterInstruction).registerA }
        if (returns.isEmpty()) throw PatchException("Couldn't find where $ONBOARDING_TASK->execute returns")
        // From the last return up, so the earlier indices stay right. The return is replaced
        // in place (and added back after), so jumps to it also go through the call.
        returns.reversed().forEach { (index, register) ->
            execute.replaceInstruction(
                index,
                "invoke-static/range { v$register .. v$register }, $STARTUP_SIGN_IN->removeSignIn(Ljava/util/List;)V"
            )
            execute.addInstruction(index + 1, "return-object v$register")
        }
    }
}
