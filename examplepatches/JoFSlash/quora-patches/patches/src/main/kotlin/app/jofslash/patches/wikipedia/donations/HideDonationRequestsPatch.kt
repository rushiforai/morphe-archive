package app.jofslash.patches.wikipedia.donations

import app.jofslash.patches.wikipedia.shared.Constants.COMPATIBILITY_WIKIPEDIA
import app.jofslash.patches.wikipedia.shared.methodOf
import app.jofslash.patches.wikipedia.shared.returnBoolean
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val CAMPAIGN_COLLECTION = "Lorg/wikipedia/dataclient/donate/CampaignCollection;"
private const val DONATION_REMINDER_HELPER = "Lorg/wikipedia/donate/donationreminder/DonationReminderHelper;"
private const val YEAR_IN_REVIEW_SNAPSHOT = "Lorg/wikipedia/yearinreview/data/YearInReviewSnapshot;"

@Suppress("unused")
val hideDonationRequestsPatch = bytecodePatch(
    name = "Hide donation requests",
    description = "Hides the fundraising banners that pop up over articles, the donation reminder " +
            "(its setting, the banner on top of articles and its survey) and the \"You matter\" donation " +
            "slide in Year in Review. The Donate entry in the menu stays, so you can still donate.",
    default = true
) {
    category("Donations")
    compatibleWith(COMPATIBILITY_WIKIPEDIA)

    execute {
        // The fundraising campaigns (the dialog over an article) come from the donor config that
        // getActiveCampaigns(Continuation) fetches. An empty list means there is nothing to show.
        methodOf(CAMPAIGN_COLLECTION, "getActiveCampaigns").addInstructions(
            0,
            """
                new-instance v0, Ljava/util/ArrayList;
                invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
                return-object v0
            """
        )

        // Donation reminders: every entry point (the settings row, the banner on top of an article,
        // the offer inside the campaign dialog, its feedback survey) checks isEnabled first, and
        // the "wrap up" banner checks isWrapUpEnabled.
        methodOf(DONATION_REMINDER_HELPER, "isEnabled", emptyList()).returnBoolean(false)
        methodOf(DONATION_REMINDER_HELPER, "isWrapUpEnabled", emptyList()).returnBoolean(false)

        // Year in Review adds its "You matter" donation slide and Donate buttons only when the
        // snapshot says the user may be asked. The constructor stores that flag from a parameter;
        // the parameter is cleared just before it is stored.
        val init = methodOf(YEAR_IN_REVIEW_SNAPSHOT, "<init>")
        val store = init.instructions.indexOfFirst {
            it.opcode == Opcode.IPUT_BOOLEAN &&
                    ((it as ReferenceInstruction).reference as FieldReference).name == "isDonationEligible"
        }
        if (store < 0) throw PatchException("YearInReviewSnapshot doesn't store isDonationEligible")
        val register = (init.instructions[store] as TwoRegisterInstruction).registerA
        if (register > 15) throw PatchException("isDonationEligible is stored from v$register, out of reach")
        init.addInstructions(store, "const/4 v$register, 0x0")
    }
}
