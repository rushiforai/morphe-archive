package app.anghami.patches.plus

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.anghami.patches.shared.Constants.COMPATIBILITY_ANGHAMI_8_0_28

/**
 * Hides all upgrade-upsell UI (nav entry, header banner, feed cards,
 * settings banner).
 *
 * Why a separate patch from the Plus spoof: isPlus=true does not remove
 * this UI because it is server-driven (plusTab flag, server feed payloads,
 * server settings Question), not gated on isPlusUser. Each hook verified
 * LIVE in 8.0.28 smali — see UpsellFingerprints.kt.
 *
 * - Nav-bar upgrade entry: getPlusTab -> false.
 * - Restricted-queue prompts: getHasRestrictedQueue -> false.
 * - Top promo banner (Explore/Search header): HeaderBar.setData collapses
 *   the bar to GONE. fillMemCache stays intact so BlueBarItem.getItem keeps
 *   working (see crash note below).
 * - In-feed upsell cards: hidden at bind time in BOTH models that render
 *   the item_link_button layout (ButtonModel from server APIButton,
 *   LinkModel from server Link) when the item deeplink matches an upsell
 *   route — runtime-verified keyword is "upgrade"
 *   (`anghami://upgrade?...`). Branch-free boolean->visibility mapping
 *   (VISIBLE=0, GONE=8); the VISIBLE fallback is load-bearing because Epoxy
 *   holders are recycled. String.valueOf makes a null deeplink safe
 *   ("null" doesn't match). If a card persists, its deeplink uses none of
 *   the matched keywords — capture via logcat "Show communication" /
 *   "clicked on link" lines and extend the regex.
 * - Gap fix: GONE-ing the card at bind time left an empty adapter cell, so
 *   upsell cards are additionally removed in list_fragment/e.shouldInclude
 *   (filterModels -> Iterator.remove; no model = no cell = no gap). The
 *   _bind hooks stay as defense-in-depth for other screens/adapters.
 *   Labels use the hideupsell_* prefix to compose with the Automix-button
 *   filter on the same method (see "Hide upsell feature buttons" patch).
 * - Settings subscribe banner: forces PreferenceHelper.getSettingsQuestion()
 *   = null (the actual banner source: server Question JSON rendered as
 *   QuestionRow) plus getUpgradeModel() = null (defense-in-depth for the
 *   subscriptions sub-screen) so the row builders skip.
 * - Library promo card ("2 months for EGP 69.99"): forces
 *   LibraryConfiguration.getButton() = null so S5/o.flatten() never creates
 *   the ButtonModel — no model = no cell = no gap (the _bind GONE hook
 *   alone left an empty RecyclerView cell here).
 *
 * Deliberately NOT hooked (crash, 2026-09-25, logcat NPE in
 * BlueBarItem.getItem <- NavigationActivity): BlueBarItem.fillMemCache.
 * getItem() calls fillMemCache() then reads the static cache map; no-op'ing
 * it leaves the map null and every MainActivity.onResume crashes. The header
 * bar itself IS safe to hide (see above) — only the cache fill is untouchable.
 *
 * If banners persist after applying, the remaining source is server payloads
 * (DisplayAdsWorker response), not a missed client gate.
 */
@Suppress("unused")
val hideUpsellPatch = bytecodePatch(
    name = "Hide upgrade upsell",
    description = "Hides the nav upgrade entry, header promo banner, feed upsell cards and AI MIX button model (gap-free), and settings subscribe banner. Server-driven UI the Plus spoof cannot remove.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ANGHAMI_8_0_28)

    execute {
        GetPlusTabFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
        GetHasRestrictedQueueFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
        // Top promo banner (Explore/Search header): collapse it. fillMemCache
        // stays intact so BlueBarItem.getItem keeps working (see kdoc).
        HeaderBarSetDataFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, 0x8
                invoke-virtual {p0, v0}, Lcom/anghami/ui/bar/HeaderBar;->setVisibility(I)V
                return-void
            """
        )
        // Library purple card as ButtonModel (server APIButton payload).
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
        // Library purple card as LinkModel (server Link payload, same
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
        // Settings subscribe banner: no upgrade model -> no UpgradeRow
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
        // Library gap fix: the Library playlists screen (S5/o.flatten)
        // builds its promo ButtonModel directly from S5/o.h (server
        // LibraryConfiguration.button), bypassing the A4/a factory and the
        // shouldInclude filter (search-only). GONE-ing at bind time left an
        // empty RecyclerView cell — the reported gap. Nulling the getter
        // means no ButtonModel is ever added (flatten null-checks h), so no
        // cell and no gap; the screen uses its own no-button spacing.
        LibraryPromoButtonFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )
        // Gap fix: drop upsell cards from the feed pipeline so no empty
        // cell remains (GONE-ing at bind time left a gap: the model still
        // occupied its adapter position). _flatten() always runs
        // filterModels() -> shouldInclude() per model; returning false here
        // removes the model via Iterator.remove(). v0/v1 are scratch
        // (reassigned by original code before use); p1/p2 preserved.
        // NOTE: replaces an earlier attempt that patched A4/a's factory
        // returns — rejected: the method's switch payloads broke under
        // replaceInstructions ("Switch points to end of method").
        // NOTE 2: the shouldInclude param is the ConfigurableModel
        // INTERFACE, so every field read must narrow with move-object +
        // check-cast after its instanceof (an iget off the
        // interface-typed ref fails verification with "cannot access
        // instance field", which crashed every feed screen using class e).
        // NOTE 3: this MUST stay the only prepend on shouldInclude. A
        // second patch prepending its own branched block to the same
        // method breaks verification on device (VerifyError "target dex
        // pc is not at instruction start", crash 2026-09-28). The
        // AutomixButtonModel check therefore lives in this same prepend
        // (first branch); the "Hide upsell feature buttons" patch covers
        // the adapter funnel on its own method.
        ShouldIncludeFingerprint.method.addInstructions(
            0,
            """
                instance-of v0, p1, Lcom/anghami/model/adapter/AutomixButtonModel;
                if-eqz v0, :hideupsell_button
                const/4 v0, 0x0
                return v0
                :hideupsell_button
                instance-of v0, p1, Lcom/anghami/model/adapter/ButtonModel;
                if-eqz v0, :hideupsell_link
                move-object v0, p1
                check-cast v0, Lcom/anghami/model/adapter/ButtonModel;
                iget-object v0, v0, Lcom/anghami/model/adapter/base/BaseModel;->item:Lcom/anghami/ghost/pojo/Model;
                instance-of v1, v0, Lcom/anghami/ghost/pojo/APIButton;
                if-eqz v1, :hideupsell_keep
                check-cast v0, Lcom/anghami/ghost/pojo/APIButton;
                iget-object v0, v0, Lcom/anghami/ghost/pojo/APIButton;->deeplink:Ljava/lang/String;
                invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
                move-result-object v0
                const-string v1, "(?i).*(subscribe|plus|premium|upsell|offer|upgrade).*"
                invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :hideupsell_keep
                goto :hideupsell_drop
                :hideupsell_link
                instance-of v0, p1, Lcom/anghami/model/adapter/LinkModel;
                if-eqz v0, :hideupsell_keep
                move-object v0, p1
                check-cast v0, Lcom/anghami/model/adapter/LinkModel;
                iget-object v0, v0, Lcom/anghami/model/adapter/base/BaseModel;->item:Lcom/anghami/ghost/pojo/Model;
                instance-of v1, v0, Lcom/anghami/ghost/pojo/Link;
                if-eqz v1, :hideupsell_keep
                check-cast v0, Lcom/anghami/ghost/pojo/Link;
                iget-object v0, v0, Lcom/anghami/ghost/pojo/Link;->deeplink:Ljava/lang/String;
                invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
                move-result-object v0
                const-string v1, "(?i).*(subscribe|plus|premium|upsell|offer|upgrade).*"
                invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :hideupsell_keep
                :hideupsell_drop
                const/4 v0, 0x0
                return v0
                :hideupsell_keep
            """
        )
    }
}
