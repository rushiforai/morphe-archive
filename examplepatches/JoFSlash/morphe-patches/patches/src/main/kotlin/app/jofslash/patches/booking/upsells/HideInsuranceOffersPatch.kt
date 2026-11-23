package app.jofslash.patches.booking.upsells

import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.jofslash.patches.booking.shared.methodOf
import app.jofslash.patches.booking.shared.returnEarly
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PREBOOK = "Lcom/booking/insuranceprebookcomponents"

/** The insurance cards in the booking form. Each draws its offer when its state is Available. */
private const val ENTRY_POINTS = "$PREBOOK/delegate/EntryPointComposablesKt;"

/** Each card's composable and its view model; the state's isAttached says the insurance is added. */
private val CARDS = mapOf(
    // Room cancellation insurance (Zurich), on the booking form's second page.
    "ZurichRoomCancellationInsuranceEntryPoint" to "PrebookZurichRCIEntryPointViewModel",
    // Travel insurance (Zurich, Cover Genius, Generali), on the extra "Protect your trip" page.
    "ZurichTravelInsuranceEntryPoint" to "PrebookZurichSTTEntryPointViewModel",
    "CoverGeniusTravelInsuranceEntryPoint" to "PrebookCoverGeniusEntryPointViewModel",
    "GeneraliTravelInsuranceEntryPoint" to "PrebookGeneraliEntryPointViewModel",
)

/** Asks the booking form to scroll to the room cancellation insurance card when you tap Next. */
private const val PREBOOK_DELEGATE = "$PREBOOK/delegate/InsurancePrebookActivityDelegate;"

/** Adds the travel insurance page to the booking form when a travel insurance quote comes. */
private const val CROSS_SELL_PAGE_HELPER = "Lcom/booking/bookingprocess/utils/BpCrossSellPageHelper;"
private const val QUOTE = "Lcom/booking/insurancedomain/model/purchase/InsuranceQuoteModel;"

@Suppress("unused")
val hideInsuranceOffersPatch = bytecodePatch(
    name = "Hide insurance offers",
    description = "Hides the offers to add room cancellation or travel insurance in the booking form, and " +
            "its extra \"Protect your trip\" page. Off by default: turn it on if you never want insurance " +
            "offered. It only hides offers: insurance you have added still shows, with its price and the " +
            "option to remove it, and nothing is added or removed for you.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_BOOKING)

    execute {
        // The cards: draw the offer only when the insurance is already added (so it can be seen
        // and removed); otherwise take the same path as when there is no offer, which draws an
        // empty 1 dp placeholder. The add and remove actions and the quote aren't touched.
        CARDS.forEach { (composable, viewModel) ->
            val available = "$PREBOOK/viewmodel/$viewModel\$State\$Available;"
            val method = methodOf(ENTRY_POINTS, composable)
            val checks = method.implementation!!.instructions.withIndex().filter { (_, insn) ->
                insn.opcode == Opcode.INSTANCE_OF &&
                        ((insn as ReferenceInstruction).reference as TypeReference).type == available
            }
            if (checks.size != 1) {
                throw PatchException("Expected one Available check in $composable, found ${checks.size}")
            }
            val (index, insn) = checks.single()
            val check = insn as Instruction22c
            val result = check.registerA
            val state = check.registerB
            // After "result = state instanceof Available": result = result && state.isAttached.
            // The jump goes to the app's own next instruction (the check of result).
            method.addInstructionsWithLabels(
                index + 1,
                """
                    if-eqz v$result, :checked
                    check-cast v$state, $available
                    iget-boolean v$result, v$state, $available->isAttached:Z
                """,
                ExternalLabel("checked", method.getInstruction(index + 1)),
            )
        }

        // Tapping Next on the booking form first scrolls to an unanswered room cancellation
        // insurance card ("please tell us if you want it"). With the card hidden, go on at once.
        methodOf(PREBOOK_DELEGATE, "shouldScrollToEntryPoint").returnEarly()

        // The extra "Protect your trip" page for travel insurance: the booking form adds it once a
        // quote comes. Keep it out unless that insurance is already added.
        methodOf(CROSS_SELL_PAGE_HELPER, "quoteFetched", listOf(QUOTE)).apply {
            requireLocalRegister()
            addInstructions(
                0,
                """
                    iget-boolean v0, p1, $QUOTE->isAdded:Z
                    if-nez v0, :added
                    return-void
                    :added
                    nop
                """
            )
        }
    }
}
