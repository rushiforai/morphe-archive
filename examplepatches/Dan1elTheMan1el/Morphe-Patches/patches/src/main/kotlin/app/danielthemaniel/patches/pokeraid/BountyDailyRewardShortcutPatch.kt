package app.danielthemaniel.patches.pokeraid

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Remaps the Bounty action on the raid screens.
 *
 * PokeRaid 0.48.9 inlined resource IDs:
 * action_bounty   = 0x7f090050
 * to_bounty_frontliner = 0x7f0907ee
 * to_daily_reward = 0x7f090808
 *
 * Tap:
 *   Bounty -> Daily Reward / Claim
 *
 * Long press:
 *   Bounty -> original Bounty page
 *
 * On Android 8+, AppCompat normally delegates tooltips to the platform
 * View.setTooltipText(), so TooltipCompatHandler.onLongClick() is never used.
 * For the Bounty ActionMenuItemView only, this patch forces TooltipCompat
 * to use TooltipCompatHandler even on modern Android. That gives us a real
 * long-click callback to remap without affecting other action items.
 */
@Suppress("unused")
val bountyDailyRewardShortcutPatch = bytecodePatch(
    name = "Bounty Daily Reward Shortcut",
    description = "Tap Bounty to open Daily Reward; long press it to open Bounty.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_POKERAID)

    execute {
        fun patchBountyMenuHandler(classDescriptor: String) {
            mutableClassDefBy(classDescriptor).methods
                .first {
                    it.name == "onOptionsItemSelected" &&
                        it.parameterTypes.size == 1 &&
                        it.parameterTypes[0] == "Landroid/view/MenuItem;" &&
                        it.returnType == "Z"
                }
                .addInstructions(
                    0,
                    """
                    invoke-interface { p1 }, Landroid/view/MenuItem;->getItemId()I
                    move-result v0

                    const v1, 0x7f090050
                    if-ne v0, v1, :original_handler

                    new-instance v0, Landroid/os/Bundle;
                    invoke-direct { v0 }, Landroid/os/Bundle;-><init>()V

                    const/4 v1, 0x0

                    const-string p1, "displayEarnMoreCoins"
                    invoke-virtual { v0, p1, v1 }, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

                    const-string p1, "autoShowRewardedVideo"
                    invoke-virtual { v0, p1, v1 }, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

                    invoke-static { p0 }, Landroidx/navigation/fragment/FragmentKt;->a(Landroidx/fragment/app/Fragment;)Landroidx/navigation/NavController;
                    move-result-object p0

                    const p1, 0x7f090808
                    const/4 v1, 0x0
                    invoke-virtual { p0, p1, v0, v1 }, Landroidx/navigation/NavController;->f(ILandroid/os/Bundle;Landroidx/navigation/NavOptions;)V

                    const/4 v0, 0x1
                    return v0

                    :original_handler
                    """.trimIndent()
                )
        }

        patchBountyMenuHandler(
            "Lme/pokelounge/raid/tab/RaidTabFragment;"
        )

        patchBountyMenuHandler(
            "Lme/pokelounge/raid/active/ActiveRaidsTabFragment;"
        )

        /*
         * Modern Android normally goes:
         *
         * ActionMenuItemView.r()
         * -> TooltipCompat.a(view, text)
         * -> View.setTooltipText(...)
         *
         * That bypasses TooltipCompatHandler entirely.
         *
         * For action_bounty only, force:
         *
         * TooltipCompat.a(...)
         * -> new TooltipCompatHandler(view, text)
         *
         * This installs TooltipCompatHandler as the actual OnLongClickListener.
         */
        mutableClassDefBy(
            "Landroidx/appcompat/widget/TooltipCompat;"
        ).methods
            .first {
                it.name == "a" &&
                    it.parameterTypes.size == 2 &&
                    it.parameterTypes[0] == "Landroid/view/View;" &&
                    it.parameterTypes[1] == "Ljava/lang/CharSequence;" &&
                    it.returnType == "V"
            }
            .addInstructions(
                0,
                """
                instance-of v0, p0, Landroidx/appcompat/view/menu/ActionMenuItemView;
                if-eqz v0, :original_tooltip_setup

                move-object v0, p0
                check-cast v0, Landroidx/appcompat/view/menu/ActionMenuItemView;

                invoke-virtual { v0 }, Landroidx/appcompat/view/menu/ActionMenuItemView;->getItemData()Landroidx/appcompat/view/menu/MenuItemImpl;
                move-result-object v0
                if-eqz v0, :original_tooltip_setup

                invoke-virtual { v0 }, Landroidx/appcompat/view/menu/MenuItemImpl;->getItemId()I
                move-result v0

                const v1, 0x7f090050
                if-ne v0, v1, :original_tooltip_setup

                new-instance v0, Landroidx/appcompat/widget/TooltipCompatHandler;
                invoke-direct { v0, p0, p1 }, Landroidx/appcompat/widget/TooltipCompatHandler;-><init>(Landroid/view/View;Ljava/lang/CharSequence;)V

                return-void

                :original_tooltip_setup
                """.trimIndent()
            )

        /*
         * Bounty's forced TooltipCompatHandler reaches here on long press.
         *
         * Other views still use the original tooltip behavior.
         */
        mutableClassDefBy(
            "Landroidx/appcompat/widget/TooltipCompatHandler;"
        ).methods
            .first {
                it.name == "onLongClick" &&
                    it.parameterTypes.size == 1 &&
                    it.parameterTypes[0] == "Landroid/view/View;" &&
                    it.returnType == "Z"
            }
            .addInstructions(
                0,
                """
                instance-of v0, p1, Landroidx/appcompat/view/menu/ActionMenuItemView;
                if-eqz v0, :original_long_click

                move-object v0, p1
                check-cast v0, Landroidx/appcompat/view/menu/ActionMenuItemView;

                invoke-virtual { v0 }, Landroidx/appcompat/view/menu/ActionMenuItemView;->getItemData()Landroidx/appcompat/view/menu/MenuItemImpl;
                move-result-object v0
                if-eqz v0, :original_long_click

                invoke-virtual { v0 }, Landroidx/appcompat/view/menu/MenuItemImpl;->getItemId()I
                move-result v0

                # Do not overwrite p0/p1 before a branch back into the
                # original method. The verifier must see p0 as
                # TooltipCompatHandler and p1 as View on every fallback path.
                sparse-switch v0, :bounty_switch
                goto :original_long_click

                :bounty_long_click
                invoke-static { p1 }, Landroidx/navigation/Navigation;->a(Landroid/view/View;)Landroidx/navigation/NavController;
                move-result-object v0

                # From this point onward the branch always returns, so these
                # parameter registers can safely be reused.
                const p1, 0x7f0907ee
                const/4 p0, 0x0
                invoke-virtual { v0, p1, p0, p0 }, Landroidx/navigation/NavController;->f(ILandroid/os/Bundle;Landroidx/navigation/NavOptions;)V

                const/4 v0, 0x1
                return v0

                :bounty_switch
                .sparse-switch
                    0x7f090050 -> :bounty_long_click
                .end sparse-switch

                :original_long_click
                """.trimIndent()
            )
    }
}
