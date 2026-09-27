package app.anghami.patches.plus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28

/**
 * Removes custom in-house ads (not Google SDK ads).
 *
 * - Custom popup ads: no-ops the popupwindow/x.i(a) funnel (all 4 ad types)
 *   AND the fullscreen startup dialog (dialog/k.onNext -> T carousel).
 * - Library/Music purple Plus card: hides feed cards at bind time in BOTH
 *   models that render the item_link_button layout (ButtonModel + LinkModel)
 *   when the item deeplink matches an upsell route — runtime-verified
 *   keyword is "upgrade" (`anghami://upgrade?...`). Branch-free
 *   boolean->visibility mapping (VISIBLE=0, GONE=8); the VISIBLE fallback is
 *   load-bearing because Epoxy holders are recycled. String.valueOf makes a
 *   null deeplink safe ("null" doesn't match).
 * - Settings subscribe banner: forces PreferenceHelper.getSettingsQuestion()
 *   =null (the actual banner source: server Question JSON rendered as
 *   QuestionRow) plus getUpgradeModel()=null (defense-in-depth for the
 *   subscriptions sub-screen) so the row builders skip.
 *
 * The ButtonModel card-hiding hook lived in Hide-Upsell before; it moved
 * here (regex deeplink match + LinkModel coverage) so all ad removal is
 * under this one patch. Hide-Upsell keeps nav entry, HeaderBar banner and
 * flyer callback.
 *
 * On-device verified 2026-09-26: Library card deeplink and settings button
 * route captured from logcat (see fingerprints kdoc). If a card persists,
 * its deeplink uses none of the matched keywords — capture via logcat
 * "Show communication"/"clicked on link" lines and extend the regex.
 *
 * Gap fix: GONE-ing the card at bind time left an empty adapter cell, so the
 * upgrade ButtonModel is additionally removed from the section-factory
 * output list (no model = no cell = no gap). The _bind hooks stay as
 * defense-in-depth for other screens/adapters.
 */
@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "No-ops custom popup funnels (popupwindow + fullscreen startup dialog), hides upsell-deeplink feed cards (ButtonModel + LinkModel) at bind time, and drops the settings subscribe banner by nulling its server-question/upgrade-model sources.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)

    execute {
        // 1. Custom popup ads: never show (popupwindow funnel).
        PopupShowFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
        // 1b. Fullscreen startup dialog ("Pay with mobile line" / "Get offer"
        // carousel): never show. k is only instantiated in dialog/g.c for
        // fullscreen promos; onNext(true) only shows T.
        FullscreenDialogFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
        // 2a. Library purple card as ButtonModel (server APIButton payload).
        ButtonBindFingerprint.method.addInstructions(
            0,
            """
                iget-object v4, p0, Lcom/anghami/model/adapter/base/BaseModel;->item:Lcom/anghami/ghost/pojo/Model;
                check-cast v4, Lcom/anghami/ghost/pojo/APIButton;
                iget-object v4, v4, Lcom/anghami/ghost/pojo/APIButton;->deeplink:Ljava/lang/String;
                invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
                move-result-object v4
                const-string v5, "(?i).*(subscribe|plus|premium|upsell|offer|upgrade).*"
                invoke-virtual {v4, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
                move-result v4
                xor-int/lit8 v4, v4, 0x1
                mul-int/lit8 v4, v4, 0x8
                rsub-int v4, v4, 0x8
                iget-object v5, p1, Lcom/anghami/model/adapter/base/BaseViewHolder;->itemView:Landroid/view/View;
                invoke-virtual {v5, v4}, Landroid/view/View;->setVisibility(I)V
            """
        )
        // 2b. Library purple card as LinkModel (server Link payload, same
        // layout). Link.deeplink is a public field; holder extends
        // BaseViewHolder so itemView resolves. Uses v4/v5 scratch
        // (_bind has .locals 8; consumed before original code runs).
        LinkBindFingerprint.method.addInstructions(
            0,
            """
                iget-object v4, p0, Lcom/anghami/model/adapter/base/BaseModel;->item:Lcom/anghami/ghost/pojo/Model;
                check-cast v4, Lcom/anghami/ghost/pojo/Link;
                iget-object v4, v4, Lcom/anghami/ghost/pojo/Link;->deeplink:Ljava/lang/String;
                invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
                move-result-object v4
                const-string v5, "(?i).*(subscribe|plus|premium|upsell|offer|upgrade).*"
                invoke-virtual {v4, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
                move-result v4
                xor-int/lit8 v4, v4, 0x1
                mul-int/lit8 v4, v4, 0x8
                rsub-int v4, v4, 0x8
                iget-object v5, p1, Lcom/anghami/model/adapter/base/BaseViewHolder;->itemView:Landroid/view/View;
                invoke-virtual {v5, v4}, Landroid/view/View;->setVisibility(I)V
            """
        )
        // 3. Settings subscribe banner: no upgrade model -> no UpgradeRow
        // (subscriptions sub-screen), no settings question -> no QuestionRow
        // banner (main settings page). Both getters are null-safe-skipped by
        // their builders (verified in smali).
        GetUpgradeModelFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )
        GetSettingsQuestionFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )
        // 4. Gap fix: drop upgrade cards from the feed pipeline so no empty
        // cell remains (GONE-ing at bind time left a gap: the model still
        // occupied its adapter position). _flatten() always runs
        // filterModels() -> shouldInclude() per model; returning false here
        // removes the model via Iterator.remove(). ButtonModel qualifies
        // (epoxy/w subclass, verified hierarchy). v0/v1 are scratch
        // (reassigned by original code before use); p1/p2 preserved.
        // NOTE: replaces an earlier attempt that patched A4/a's factory
        // returns — rejected: the method's switch payloads broke under
        // replaceInstructions ("Switch points to end of method").
        ShouldIncludeFingerprint.method.addInstructions(
            0,
            """
                instance-of v0, p1, Lcom/anghami/model/adapter/ButtonModel;
                if-eqz v0, :rmads_inc_link
                iget-object v0, p1, Lcom/anghami/model/adapter/base/BaseModel;->item:Lcom/anghami/ghost/pojo/Model;
                instance-of v1, v0, Lcom/anghami/ghost/pojo/APIButton;
                if-eqz v1, :rmads_inc_keep
                check-cast v0, Lcom/anghami/ghost/pojo/APIButton;
                iget-object v0, v0, Lcom/anghami/ghost/pojo/APIButton;->deeplink:Ljava/lang/String;
                invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
                move-result-object v0
                const-string v1, "(?i).*(subscribe|plus|premium|upsell|offer|upgrade).*"
                invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
                move-result v0
                if-nez v0, :rmads_inc_drop
                goto :rmads_inc_keep
                :rmads_inc_link
                instance-of v0, p1, Lcom/anghami/model/adapter/LinkModel;
                if-eqz v0, :rmads_inc_keep
                iget-object v0, p1, Lcom/anghami/model/adapter/base/BaseModel;->item:Lcom/anghami/ghost/pojo/Model;
                instance-of v1, v0, Lcom/anghami/ghost/pojo/Link;
                if-eqz v1, :rmads_inc_keep
                check-cast v0, Lcom/anghami/ghost/pojo/Link;
                iget-object v0, v0, Lcom/anghami/ghost/pojo/Link;->deeplink:Ljava/lang/String;
                invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
                move-result-object v0
                const-string v1, "(?i).*(subscribe|plus|premium|upsell|offer|upgrade).*"
                invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :rmads_inc_keep
                :rmads_inc_drop
                const/4 v0, 0x0
                return v0
                :rmads_inc_keep
            """
        )
    }
}
