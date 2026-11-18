// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.anghami.store

import app.keropatches.anghami.AnghamiApp
import app.keropatches.core.PatchCategory
import app.keropatches.core.returnNullEarly
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * Deep-link fragments that identify a cell as a subscription advertisement.
 *
 * The client does not tag these cells with a type of their own: a promotion is an
 * ordinary button or link whose destination points at the subscription flow. The
 * match is deliberately case-insensitive and substring-based because the server
 * controls the surrounding text.
 */
private const val UPGRADE_DESTINATION =
    "(?i).*(upgrade|upsell|offer|premium|plus|subscribe).*"

/** The preference flag that adds the subscription entry to the bottom navigation. */
private object PlusTabFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/prefs/PreferenceHelper;",
    name = "getPlusTab",
    isStatic = false,
    returnType = "Z",
    parameters = emptyList(),
)

/** The preference flag that sends playback through the restricted-queue prompt. */
private object RestrictedQueueFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/prefs/PreferenceHelper;",
    name = "getHasRestrictedQueue",
    isStatic = false,
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * The header bar that renders a server-supplied promo item above a list.
 *
 * Its own `setData` is the only place that both stores the item and decides
 * whether the bar is visible, so collapsing it here covers every caller.
 */
private object HeaderBarFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ui/bar/HeaderBar;",
    name = "setData",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Lcom/anghami/ghost/objectbox/models/BlueBarItem;"),
)

/** A server button cell, the shape used by feed and library promotions. */
private object ButtonCellFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/ButtonModel;",
    name = "_bind",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Lcom/anghami/model/adapter/ButtonModel${'$'}ButtonViewHolder;"),
)

/** A server link cell, the other shape the same promotions are served as. */
private object LinkCellFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/LinkModel;",
    name = "_bind",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Lcom/anghami/model/adapter/LinkModel${'$'}LinkViewHolder;"),
)

/** The cached subscriptions-screen payload behind the settings upgrade row. */
private object UpgradeModelFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/prefs/PreferenceHelper;",
    name = "getUpgradeModel",
    isStatic = false,
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/** The cached question text behind the settings banner row. */
private object SettingsQuestionFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/prefs/PreferenceHelper;",
    name = "getSettingsQuestion",
    isStatic = false,
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/**
 * The server flag that adds the subscription notice to the downloads screen.
 *
 * Four cells on that screen read it before building their notice text, and no
 * other screen does, so answering it false closes the notice as a group instead of
 * hiding each cell after it has been built.
 */
private object DownloadsNoticeFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/local/Account;",
    name = "showPlusNotice",
    isStatic = true,
    returnType = "Z",
    parameters = emptyList(),
)

/** The promo button the library screen appends after its shortcut list. */
private object LibraryPromoButtonFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/api/response/LibraryConfigurationAPIResponse${'$'}LibraryConfiguration;",
    name = "getButton",
    isStatic = false,
    returnType = "Lcom/anghami/ghost/pojo/APIButton;",
    parameters = emptyList(),
)

/**
 * The filter every assembled list passes through before it reaches the adapter.
 *
 * Returning false here removes the model instead of drawing it, so no empty cell
 * and no reserved adapter position is left behind.
 */
private object FeedIncludeFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/app/base/list_fragment/e;",
    name = "shouldInclude",
    isStatic = false,
    returnType = "Z",
    parameters = listOf(
        "Lcom/anghami/model/adapter/base/ConfigurableModel;",
        "Ljava/lang/String;",
    ),
)

/**
 * Removes the subscription upgrade surfaces a free account is still shown.
 *
 * These surfaces are not derived from the local Plus answer: they come from
 * preference flags and server payloads, so making the entitlement patch alone
 * does not remove them. Each surface is closed at the point where its consumer
 * decides to create the cell or row:
 *
 * 1. The bottom-navigation entry reads a preference flag; the flag answers false.
 * 2. Playback from a search result reads the restricted-queue flag; the flag
 *    answers false, so the ordinary playback path is used and no prompt appears.
 * 3. The promo bar is collapsed and its binding is skipped.
 * 4. A feed or library button/link whose destination points at the subscription
 *    flow is made invisible, and the visibility is reset for every other cell
 *    because holders are recycled.
 * 5. The settings upgrade row and the settings question row are built only when
 *    their cached payload is non-null; both getters answer null.
 * 6. The library promo button is appended only when the configuration supplies
 *    one; the getter answers null.
 * 7. The downloads screen builds its subscription notice only while the server
 *    flag is set; the flag answers false.
 * 8. The list assembler drops the automation teaser and any matching button or
 *    link model before the adapter sees it.
 *
 * Text matching is a heuristic. A legitimate cell whose destination happens to
 * contain one of the fragments is hidden as well; that is the cost of matching a
 * server-controlled string instead of a stable type. Deep links themselves are
 * not intercepted: a user who follows one deliberately still reaches the
 * subscription screen, which is out of scope.
 */
@Suppress("unused")
val hideUpgradeBannersPatch = bytecodePatch(
    name = "Hide upgrade banners",
    description = "Removes the navigation entry, promo bar, feed cells, downloads notice and settings or library rows that advertise a subscription upgrade.",
    default = true,
) {
    compatibleWith(AnghamiApp.compatibility)
    category(PatchCategory.STORE.label)

    execute {
        PlusTabFingerprint.method.returnEarly(false)
        RestrictedQueueFingerprint.method.returnEarly(false)
        DownloadsNoticeFingerprint.method.returnEarly(false)

        HeaderBarFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, 0x8
                invoke-virtual {p0, v0}, Lcom/anghami/ui/bar/HeaderBar;->setVisibility(I)V
                return-void
            """.trimIndent(),
        )

        ButtonCellFingerprint.method.addInstructions(
            0,
            """
                iget-object v4, p0, Lcom/anghami/model/adapter/base/BaseModel;->item:Lcom/anghami/ghost/pojo/Model;
                check-cast v4, Lcom/anghami/ghost/pojo/APIButton;
                iget-object v4, v4, Lcom/anghami/ghost/pojo/APIButton;->deeplink:Ljava/lang/String;
                invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
                move-result-object v4
                const-string v5, "$UPGRADE_DESTINATION"
                invoke-virtual {v4, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
                move-result v4
                if-eqz v4, :keropatches_upgrade_button_visible
                const/16 v4, 0x8
                goto :keropatches_upgrade_button_apply
                :keropatches_upgrade_button_visible
                const/4 v4, 0x0
                :keropatches_upgrade_button_apply
                iget-object v5, p1, Lcom/anghami/model/adapter/base/BaseViewHolder;->itemView:Landroid/view/View;
                invoke-virtual {v5, v4}, Landroid/view/View;->setVisibility(I)V
            """.trimIndent(),
        )

        LinkCellFingerprint.method.addInstructions(
            0,
            """
                iget-object v4, p0, Lcom/anghami/model/adapter/base/BaseModel;->item:Lcom/anghami/ghost/pojo/Model;
                check-cast v4, Lcom/anghami/ghost/pojo/Link;
                iget-object v4, v4, Lcom/anghami/ghost/pojo/Link;->deeplink:Ljava/lang/String;
                invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
                move-result-object v4
                const-string v5, "$UPGRADE_DESTINATION"
                invoke-virtual {v4, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
                move-result v4
                if-eqz v4, :keropatches_upgrade_link_visible
                const/16 v4, 0x8
                goto :keropatches_upgrade_link_apply
                :keropatches_upgrade_link_visible
                const/4 v4, 0x0
                :keropatches_upgrade_link_apply
                iget-object v5, p1, Lcom/anghami/model/adapter/base/BaseViewHolder;->itemView:Landroid/view/View;
                invoke-virtual {v5, v4}, Landroid/view/View;->setVisibility(I)V
            """.trimIndent(),
        )

        UpgradeModelFingerprint.method.returnNullEarly()
        SettingsQuestionFingerprint.method.returnNullEarly()
        LibraryPromoButtonFingerprint.method.returnNullEarly()

        FeedIncludeFingerprint.method.addInstructions(
            0,
            """
                instance-of v0, p1, Lcom/anghami/model/adapter/AutomixButtonModel;
                if-eqz v0, :keropatches_upgrade_include_button
                goto :keropatches_upgrade_include_drop
                :keropatches_upgrade_include_button
                instance-of v0, p1, Lcom/anghami/model/adapter/ButtonModel;
                if-eqz v0, :keropatches_upgrade_include_link
                move-object v0, p1
                check-cast v0, Lcom/anghami/model/adapter/ButtonModel;
                iget-object v0, v0, Lcom/anghami/model/adapter/base/BaseModel;->item:Lcom/anghami/ghost/pojo/Model;
                instance-of v1, v0, Lcom/anghami/ghost/pojo/APIButton;
                if-eqz v1, :keropatches_upgrade_include_keep
                check-cast v0, Lcom/anghami/ghost/pojo/APIButton;
                iget-object v0, v0, Lcom/anghami/ghost/pojo/APIButton;->deeplink:Ljava/lang/String;
                invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
                move-result-object v0
                const-string v1, "$UPGRADE_DESTINATION"
                invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :keropatches_upgrade_include_keep
                goto :keropatches_upgrade_include_drop
                :keropatches_upgrade_include_link
                instance-of v0, p1, Lcom/anghami/model/adapter/LinkModel;
                if-eqz v0, :keropatches_upgrade_include_keep
                move-object v0, p1
                check-cast v0, Lcom/anghami/model/adapter/LinkModel;
                iget-object v0, v0, Lcom/anghami/model/adapter/base/BaseModel;->item:Lcom/anghami/ghost/pojo/Model;
                instance-of v1, v0, Lcom/anghami/ghost/pojo/Link;
                if-eqz v1, :keropatches_upgrade_include_keep
                check-cast v0, Lcom/anghami/ghost/pojo/Link;
                iget-object v0, v0, Lcom/anghami/ghost/pojo/Link;->deeplink:Ljava/lang/String;
                invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
                move-result-object v0
                const-string v1, "$UPGRADE_DESTINATION"
                invoke-virtual {v0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :keropatches_upgrade_include_keep
                goto :keropatches_upgrade_include_drop
                :keropatches_upgrade_include_drop
                const/4 v0, 0x0
                return v0
                :keropatches_upgrade_include_keep
            """.trimIndent(),
        )
    }
}
