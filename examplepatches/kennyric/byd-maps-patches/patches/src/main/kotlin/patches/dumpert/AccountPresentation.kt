package patches.dumpert

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/** Display changes only. Genuine premium/product/account/billing state stays original. */
context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun adFreeAccountPresentation() {
    val banner = exact("${APP}premium/ui/settings/PurchaseAdFreeBannerKt;",
        "PurchaseAdFreeBanner(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;II)V").method
    check(banner.accessFlags == 0x19 && banner.instructions.count() == 563 &&
        banner.implementation!!.registerCount == 44) { "Dumpert subscription promotion changed" }
    // Guest More, logged-in More and subscription pane share this composable.
    // Exit before starting any Compose group or remembering its purchase action.
    banner.addInstructions(0, STOP)

    val pane = exact("${APP}premium/ui/settings/SubscriptionPaneLayoutKt;",
        "SubscriptionSettingsPaneLayout(ZZLnl/livewall/dumpert/core/iap/api/model/IapProduct;Lnl/livewall/dumpert/core/iap/api/model/IapProduct;Lnl/livewall/dumpert/core/iap/api/model/PricingOffer;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V").method
    val code = pane.instructions.toList()
    check(pane.accessFlags == 0x19 && code.size == 816 && pane.implementation!!.registerCount == 78) {
        "Dumpert subscription card changed"
    }
    val premiumStrings = "${APP}premium/R\$string;"
    val appStrings = "${APP}R\$string;"
    for ((index, field) in mapOf(641 to "manage_premium_state_title", 686 to "manage_premium_state_price",
        731 to "manage_premium_state_description")) {
        val instruction = code[index]
        check(instruction.opcode == Opcode.SGET && (instruction as OneRegisterInstruction).registerA == 1 &&
            (instruction as ReferenceInstruction).reference.toString() == "$premiumStrings->$field:I") {
            "Dumpert free-card display resource changed: $field"
        }
    }
    check(code[687].opcode == Opcode.INVOKE_STATIC &&
        (code[687] as ReferenceInstruction).reference.toString() ==
        "Landroidx/compose/ui/res/StringResources_androidKt;->stringResource(ILandroidx/compose/runtime/Composer;I)Ljava/lang/String;" &&
        code[688].opcode == Opcode.MOVE_RESULT_OBJECT && (code[688] as OneRegisterInstruction).registerA == 1) {
        "Dumpert free-price lookup changed"
    }
    // Keep the real paid branch, nullable product guard and all Compose groups.
    // Reuse native localized copy in the free card without adding a billing row.
    pane.replaceInstruction(641, "sget v1, $premiumStrings->purchase_screen_title:I")
    pane.replaceInstruction(686, "const-string v1, \"\"")
    pane.replaceInstruction(687, "nop")
    pane.replaceInstruction(688, "nop")
    pane.replaceInstruction(731, "sget v1, $appStrings->premium_account:I")

    val header = exact("${APP}screens/settings/main/SettingsMainLoggedInLayoutKt;",
        "SettingsLoggedInHeaderBlock(Lnl/livewall/dumpert/core/account/User\$LoggedIn;ZLkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V").method
    val subtitle = header.instructions.toList()
    check(header.accessFlags == 0x1a && subtitle.size == 364 && header.implementation!!.registerCount == 32 &&
        subtitle[234].opcode == Opcode.SGET && (subtitle[234] as OneRegisterInstruction).registerA == 7 &&
        (subtitle[234] as ReferenceInstruction).reference.toString() == "$appStrings->free_account:I") {
        "Dumpert signed-in subtitle changed"
    }
    header.replaceInstruction(234, "sget v7, $appStrings->premium_account:I")
}
