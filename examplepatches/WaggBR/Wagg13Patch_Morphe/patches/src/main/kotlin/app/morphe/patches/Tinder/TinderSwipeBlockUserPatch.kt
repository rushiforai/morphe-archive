package app.morphe.patches.tinder

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

private object StyleableButtonIconSetterFingerprint : Fingerprint(
    definingClass = "Lvtc;",
    name = "setIconDrawableRes",
    returnType = "V",
    parameters = listOf("Ljava/lang/Integer;"),
)

private object StyleableButtonIconTintFingerprint : Fingerprint(
    definingClass = "Lvtc;",
    name = "setIconTint",
    returnType = "V",
    parameters = listOf("Ljava/lang/Integer;"),
)

private object FirstImpressionAccessibilityFingerprint : Fingerprint(
    definingClass = "Lcom/tinder/gamepad/view/FirstImpressionButton;",
    name = "p",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

private object SwipeGamepadListenerFingerprint : Fingerprint(
    definingClass = "Lvii;",
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
)

private const val BLOCK_ICON = 0x7f080563
private const val BLOCK_USER_DESCRIPTION = 0x7f141a2d

@Suppress("unused")
val tinderSwipeBlockUserPatch = bytecodePatch(
    name = "Tinder Block User Button",
    description = "Replaces the swipe screen's First Impression button with Tinder's block-user flow.",
    default = true,
) {
    compatibleWith(TinderCompatibility.TINDER)

    execute {
        // Style refreshes call this again; substitute the resource only for the swipe button.
        StyleableButtonIconSetterFingerprint.method.apply {
            val original = getInstruction(0)
            addInstructionsWithLabels(
                0,
                """
                    instance-of v0, p0, Lcom/tinder/gamepad/view/FirstImpressionButton;
                    if-eqz v0, :morphe_keep_gamepad_icon
                    const v0, $BLOCK_ICON
                    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                    move-result-object p1
                """,
                ExternalLabel("morphe_keep_gamepad_icon", original),
            )
        }

        StyleableButtonIconTintFingerprint.method.apply {
            val original = getInstruction(0)
            addInstructionsWithLabels(
                0,
                """
                    instance-of v0, p0, Lcom/tinder/gamepad/view/FirstImpressionButton;
                    if-eqz v0, :morphe_keep_gamepad_tint
                    const/4 v0, -0x1
                    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                    move-result-object p1
                """,
                ExternalLabel("morphe_keep_gamepad_tint", original),
            )
        }

        // This method runs again when the button's counter changes.
        FirstImpressionAccessibilityFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
                move-result-object v0
                const v1, $BLOCK_USER_DESCRIPTION
                invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;
                move-result-object v0
                invoke-virtual {p0, v0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V
                return-void
            """
        )

        SwipeGamepadListenerFingerprint.method.apply {
            val original = getInstruction(0)
            addInstructionsWithLabels(
                0,
                """
                    iget v0, p0, Lvii;->a:I
                    const/4 v1, 0x3
                    if-ne v0, v1, :morphe_block_continue
                    instance-of v0, p1, Lx4r;
                    if-eqz v0, :morphe_block_continue

                    iget-object p0, p0, Lvii;->b:Lcom/tinder/feature/mainrecscardstack/internal/view/fragment/MainCardStackRecsViewFragment;
                    invoke-virtual {p0}, Lcom/tinder/feature/mainrecscardstack/internal/view/fragment/MainCardStackRecsViewFragment;->j1()Lcom/tinder/feature/mainrecscardstack/internal/viewmodel/c;
                    move-result-object p0

                    iget-object v0, p0, Lcom/tinder/feature/mainrecscardstack/internal/viewmodel/c;->C0:Lifq;
                    iget-object v0, v0, Lifq;->a:Lbjv;
                    invoke-interface {v0}, Lbjv;->getValue()Ljava/lang/Object;
                    move-result-object v0
                    check-cast v0, Lh7r;
                    if-eqz v0, :morphe_block_no_state
                    iget-object v1, v0, Lh7r;->l:Lihq;
                    if-eqz v1, :morphe_block_no_rec
                    instance-of v2, v1, Lgky;
                    if-eqz v2, :morphe_block_wrong_rec
                    check-cast v1, Lgky;
                    invoke-interface {v1}, Lihq;->getId()Ljava/lang/String;
                    move-result-object v2
                    invoke-interface {v1}, Lgky;->getName()Ljava/lang/String;
                    move-result-object v3
                    if-eqz v3, :morphe_block_no_details

                    new-instance v4, Le0h;
                    sget-object v5, Lcom/tinder/userblocking/navigation/LaunchUserBlockingSource;->PROFILE:Lcom/tinder/userblocking/navigation/LaunchUserBlockingSource;
                    sget-object p1, Lcom/tinder/userblocking/navigation/UserBlockingSourceEnteredFrom;->REC:Lcom/tinder/userblocking/navigation/UserBlockingSourceEnteredFrom;
                    invoke-direct {v4, v3, v2, v5, p1}, Le0h;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/tinder/userblocking/navigation/LaunchUserBlockingSource;Lcom/tinder/userblocking/navigation/UserBlockingSourceEnteredFrom;)V

                    new-instance v5, Lqhi;
                    invoke-direct {v5, v4}, Lqhi;-><init>(Le0h;)V
                    iget-object v0, p0, Lcom/tinder/feature/mainrecscardstack/internal/viewmodel/c;->v0:Lkotlinx/coroutines/flow/r;
                    invoke-virtual {v0, v5}, Lkotlinx/coroutines/flow/r;->a(Ljava/lang/Object;)Z
                    move-result v5

                    new-instance p1, Lf1z;
                    invoke-direct {p1, v2}, Lf1z;-><init>(Ljava/lang/String;)V
                    iget-object v0, p0, Lcom/tinder/feature/mainrecscardstack/internal/viewmodel/c;->Z:Lu2z;
                    invoke-virtual {v0, p1}, Lu2z;->e(Ls2z;)V

                    if-eqz v5, :morphe_block_return
                    iget-object v0, p0, Lcom/tinder/feature/mainrecscardstack/internal/viewmodel/c;->m0:Lkotlinx/coroutines/flow/v;
                    const/4 p1, 0x0
                    invoke-virtual {v0, p1}, Lkotlinx/coroutines/flow/v;->k(Ljava/lang/Object;)V
                    goto :morphe_block_return

                    :morphe_block_no_state
                    goto :morphe_block_return

                    :morphe_block_no_rec
                    goto :morphe_block_return

                    :morphe_block_wrong_rec
                    goto :morphe_block_return

                    :morphe_block_no_details
                    goto :morphe_block_return

                    :morphe_block_return
                    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;
                    return-object p1
                """,
                ExternalLabel("morphe_block_continue", original),
            )
        }
    }
}
