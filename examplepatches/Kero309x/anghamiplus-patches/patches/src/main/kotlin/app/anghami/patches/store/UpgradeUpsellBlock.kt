package app.anghami.patches.store

import app.anghami.patches.core.AnghamiTarget
import app.anghami.patches.core.forceFalse
import app.anghami.patches.core.forceNull
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Removes the subscription upgrade surfaces a free account is still shown:
 * the navigation entry, the Explore/Search header banner, the in-feed upsell
 * cards and the settings/library promo rows.
 *
 * None of these surfaces is gated on the local Plus entitlement — they are fed
 * by server payloads and preference flags — so faking the entitlement leaves
 * them all in place. This patch instead makes each hooked method report the
 * value that makes its consumer skip the upsell: the boolean preference
 * getters answer `false`, the getters that supply the banner, question and
 * promo models answer `null`, the header bar collapses itself, and the upsell
 * feed models are hidden or filtered out before a list cell can be created.
 * The model-supplying getters are nulled rather than hidden at bind time
 * because a hidden model still occupies an adapter position and leaves a gap.
 */
@Suppress("unused")
val upgradeUpsellBlockPatch = bytecodePatch(
    name = "Hide Upgrade Banners",
    description = "Hides navigation upgrade tab, header promo banners, and feed subscription upsell cards.",
    default = true,
) {
    compatibleWith(AnghamiTarget.COMPATIBILITY)

    execute {
        GetPlusTabSignature.method.forceFalse()
        GetHasRestrictedQueueSignature.method.forceFalse()
        // Collapses the promo bar and returns early. The cached model
        // construction is deliberately left alone: the cache is read back by
        // the navigation layer, which would fail on an empty map.
        HeaderBarSetDataSignature.method.addInstructions(
            0,
            """
                const/16 v0, 0x8
                invoke-virtual {p0, v0}, Lcom/anghami/ui/bar/HeaderBar;->setVisibility(I)V
                return-void
            """
        )
        // Feed card rendered from a server-provided button payload. The
        // prepended block maps "deeplink looks like an upsell" to GONE, so the
        // cell stays present but invisible; the VISIBLE fallback matters
        // because holders are recycled. A null deeplink is stringified and
        // therefore never matches.
        ButtonBindSignature.method.addInstructions(
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
        // Same layout and same visibility mapping for the server-link variant
        // of the card; the holder also extends BaseViewHolder, and the scratch
        // registers are free at this point of the bind method.
        LinkBindSignature.method.addInstructions(
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
        // No upgrade model and no settings question means the row builders skip
        // their upgrade and question rows; both getters are null-checked by
        // those builders.
        GetUpgradeModelSignature.method.forceNull()
        GetSettingsQuestionSignature.method.forceNull()
        // The library screen builds its promo button straight from this
        // configuration, so returning null prevents the model from ever being
        // appended and leaves the screen with its natural spacing instead of an
        // empty cell.
        LibraryPromoButtonSignature.method.forceNull()
        // Drops upsell cards while the feed list is assembled, so no cell is
        // added at all. This must remain the only block prepended to the
        // method — a second prepend breaks verification — which is why the
        // automix-button case is handled by the same block. The labels are
        // prefixed to stay unique. The parameter is the model interface, so
        // every field read narrows through move-object plus check-cast first.
        ShouldIncludeUpsellSignature.method.addInstructions(
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

/** Matches `PreferenceHelper.getPlusTab()`, the flag behind the navigation entry. */
object GetPlusTabSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/prefs/PreferenceHelper;",
    name = "getPlusTab",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("plusTab"),
    )
)

/** Matches `PreferenceHelper.getHasRestrictedQueue()`, which drives the queue prompts. */
object GetHasRestrictedQueueSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/prefs/PreferenceHelper;",
    name = "getHasRestrictedQueue",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("restricted_queue"),
    )
)

/** Matches `HeaderBar.setData(BlueBarItem)`, the entry point of the header bar. */
object HeaderBarSetDataSignature : Fingerprint(
    definingClass = "Lcom/anghami/ui/bar/HeaderBar;",
    name = "setData",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Lcom/anghami/ghost/objectbox/models/BlueBarItem;"),
    filters = listOf(
        methodCall(
            definingClass = "LT8/a;",
            name = "setData",
        ),
    )
)

/** Matches `ButtonModel._bind(ButtonViewHolder)`, which binds a server button card. */
object ButtonBindSignature : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/ButtonModel;",
    name = "_bind",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Lcom/anghami/model/adapter/ButtonModel\$ButtonViewHolder;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/ghost/utils/ThemeUtils;",
            name = "isInNightMode",
        ),
    )
)

/** Matches `LinkModel._bind(LinkViewHolder)`, which binds a server link card. */
object LinkBindSignature : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/LinkModel;",
    name = "_bind",
    returnType = "V",
    parameters = listOf("Lcom/anghami/model/adapter/LinkModel\$LinkViewHolder;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/ghost/pojo/Link;",
            name = "getDeepLink",
        ),
    )
)

/** Matches `PreferenceHelper.getUpgradeModel()`, the subscriptions screen payload. */
object GetUpgradeModelSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/prefs/PreferenceHelper;",
    name = "getUpgradeModel",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("settings_upgrade_model"),
    )
)

/** Matches `PreferenceHelper.getSettingsQuestion()`, rendered as the settings banner row. */
object GetSettingsQuestionSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/prefs/PreferenceHelper;",
    name = "getSettingsQuestion",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("question_setting"),
    )
)

/** Matches `LibraryConfiguration.getPromoButton()`, the library promo card source. */
object LibraryPromoButtonSignature : Fingerprint(
    definingClass = "Lcom/anghami/ghost/api/response/LibraryConfigurationAPIResponse\$LibraryConfiguration;",
    name = "getButton",
    returnType = "Lcom/anghami/ghost/pojo/APIButton;",
    parameters = listOf(),
    filters = listOf(
        opcode(Opcode.RETURN_OBJECT),
    )
)

/** Matches `list_fragment.e.shouldInclude(DisplayTypeModel)`, the feed include filter. */
object ShouldIncludeUpsellSignature : Fingerprint(
    definingClass = "Lcom/anghami/app/base/list_fragment/e;",
    name = "shouldInclude",
    returnType = "Z",
    parameters = listOf(
        "Lcom/anghami/model/adapter/base/ConfigurableModel;",
        "Ljava/lang/String;",
    ),
    filters = listOf(
        string("Non BaseModel subclass in searchable list: "),
    )
)
