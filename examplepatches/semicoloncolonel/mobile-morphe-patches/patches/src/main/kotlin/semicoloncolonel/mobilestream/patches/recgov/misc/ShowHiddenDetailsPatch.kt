package semicoloncolonel.mobilestream.patches.recgov.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import semicoloncolonel.mobilestream.patches.recgov.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod

// Recreation.gov 2.2.67 receives several details it never shows. Each one
// is added to text the app already shows from the same data:
//   Ticket lottery: applications, tickets requested and awarded, and the
//     limit per account, shown once in a dialog when the lottery's screen
//     state is created. The results date is left to the app, which already
//     shows it; no text on that screen carries these counts.
//   Ticket time slots: when sales for the slot close, after "N tickets
//     Available". The slot list is built from the day's availability, whose
//     booking windows are remembered first.
//   Ticket facilities: the exact booking window rules, after the booking
//     windows section.
//   My Reservations lotteries: the deadline to confirm a win, after the
//     results date.
//   Venue time slots: when booking opens or closes.
// Nothing is requested and nothing about booking changes.

private const val HELPER = "Lsemicoloncolonel/mobilestream/extension/recgov/HiddenDetails;"
private const val MODEL = "Lcom/bah/r1smobile/model/"

/** Passes every returned String of [this] through HELPER.[helper](this, text). */
private fun MutableMethod.filterReturnedText(helper: String) {
    val implementation = implementation ?: throw PatchException("$definingClass->$name has no code")
    if (implementation.registerCount > 16) throw PatchException("$definingClass->$name uses too many registers")
    val returns = implementation.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
    if (returns.isEmpty()) throw PatchException("$definingClass->$name has no return")
    // Last first, so earlier indices stay valid. The return becomes the call, so a branch to
    // the return still runs it.
    returns.reversed().forEach { (index, instruction) ->
        val register = (instruction as OneRegisterInstruction).registerA
        replaceInstruction(
            index,
            "invoke-static { p0, v$register }, $HELPER->$helper(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;",
        )
        addInstructions(index + 1, "move-result-object v$register\nreturn-object v$register")
    }
}

@Suppress("unused")
val showHiddenDetailsPatch = bytecodePatch(
    name = "Show hidden details",
    description = "Shows ticket lottery, ticket sales, and booking details the app receives but hides.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        fun text(model: String, method: String, helper: String) {
            val count = forEachMatchingMethod(
                { it.type == "$MODEL$model;" },
                { it.name == method && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;" },
            ) { it.filterReturnedText(helper) }
            if (count != 1) throw PatchException("$model.$method not found ($count)")
        }

        text("OrderLottery", "resultsAvailableDescription", "lotteryResults")
        text("TicketFacility", "getBookingWindowsSection", "bookingSection")
        text("TicketsSimplifiedAvailableTime", "availabilityDesc", "ticketSlot")
        text("VenueAvailabilityData", "toString", "venueSlot")

        // The method that turns a List of daily availability into the slot map: it builds
        // TicketsSimplifiedAvailableTime objects. Its booking windows are remembered first.
        val slotBuilders = forEachMatchingMethod(
            { true },
            { method ->
                method.returnType == "Ljava/util/LinkedHashMap;" &&
                    method.parameterTypes.map { it.toString() } == listOf("Ljava/util/List;") &&
                    method.implementation?.instructions?.any { instruction ->
                        instruction.opcode == Opcode.NEW_INSTANCE &&
                            ((instruction as ReferenceInstruction).reference as TypeReference).type ==
                            "${MODEL}TicketsSimplifiedAvailableTime;"
                    } == true
            },
        ) { method ->
            val list = if (AccessFlags.STATIC.isSet(method.accessFlags)) "p0" else "p1"
            method.addInstructions(0, "invoke-static/range { $list .. $list }, $HELPER->rememberTicketDays(Ljava/lang/Object;)V")
        }
        if (slotBuilders == 0) throw PatchException("Ticket slot builder not found")

        // Screen state created with (boolean, boolean, TourLottery): shows the lottery's numbers.
        val lotteryStates = forEachMatchingMethod(
            { true },
            { method ->
                method.name == "<init>" &&
                    method.parameterTypes.map { it.toString() } == listOf("Z", "Z", "${MODEL}TourLottery;")
            },
        ) { it.addInstructions(0, "invoke-static/range { p3 .. p3 }, $HELPER->showLottery(Ljava/lang/Object;)V") }
        if (lotteryStates == 0) throw PatchException("Lottery screen state not found")
    }
}
