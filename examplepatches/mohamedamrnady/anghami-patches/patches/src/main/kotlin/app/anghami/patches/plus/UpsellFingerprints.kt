package app.anghami.patches.plus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Upgrade-upsell targets (Anghami 8.0.28, verified in base.apk smali).
 *
 * Used by the "Hide upgrade upsell" patch. Forcing isPlus=true does NOT
 * remove this UI because it is driven by server-provided payloads, not by
 * the isPlusUser gate:
 * - Nav-bar upgrade entry: PreferenceHelper.getPlusTab() feeds the static
 *   flag `Lcom/anghami/util/c;->a:Z` (read in MainActivity and
 *   app/base/o.smali). Force false.
 * - Restricted-queue prompts: getHasRestrictedQueue ("restricted_queue"
 *   pref) feeds queue-restriction UI. Force false.
 * - Homepage/library blue banner: HeaderBar.setData(BlueBarItem) renders
 *   the bar started at boot. Collapse it to GONE. (BlueBarItem.fillMemCache
 *   stays intact — see HideUpsellPatch kdoc for the crash it causes.)
 * - In-feed upsell cards: the Library purple Plus card is a feed item using
 *   the `item_link_button` layout, built as a ButtonModel from a server
 *   APIButton (displaytype=button, deeplink `anghami://upgrade?...`,
 *   verified via logcat "Show communication") or as a LinkModel from a
 *   server Link payload (same layout). Hidden at bind time by upsell-deeplink
 *   regex, and removed gap-free in list_fragment/e.shouldInclude()
 *   (filterModels -> Iterator.remove; labels use the hideupsell_* prefix to
 *   compose with the Automix-button filter on the same method).
 *   Shortcut links (`anghami://likes|downloads|offlinemixtape|playlists`)
 *   match nothing, so the shortcut bar is unaffected.
 * - Settings "Subscribe to Plus" banner: a QuestionRow built by
 *   mainsettings/r.a() from PreferenceHelper.getSettingsQuestion()
 *   ("question_setting" server JSON; button fires
 *   `anghami://upgrade?source=settings`). Force null (r.a null-skips).
 *   getUpgradeModel()->null is kept as defense-in-depth for the
 *   subscriptions sub-screen.
 *
 * Server caveat: DisplayAdsWorker payloads are server-issued; if banners
 * persist after this patch, the remaining source is server data, not a
 * missed client gate.
 */

object GetPlusTabFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/prefs/PreferenceHelper;",
    name = "getPlusTab",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("plusTab"),
    )
)

object GetHasRestrictedQueueFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/prefs/PreferenceHelper;",
    name = "getHasRestrictedQueue",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("restricted_queue"),
    )
)

object HeaderBarSetDataFingerprint : Fingerprint(
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

object BlueBarFillMemCacheFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/objectbox/models/BlueBarItem;",
    name = "fillMemCache",
    // NOTE: accessFlags deliberately omitted — 8.0.28 declares this method
    // `declared-synchronized` and exact-int flag matching proved brittle here.
    // Class + name + signature already pin it uniquely (single occurrence).
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        opcode(Opcode.RETURN_VOID),
    )
)

// NOTE: FlyerOnAdLoadedFingerprint moved to PopupPromosFingerprints.kt
// ("Remove popup promos" patch) so all interruptive popups are one toggle.

/**
 * In-feed upsell card as ButtonModel (Anghami 8.0.28, verified in base.apk
 * smali + on device via uiautomator: tv_title inside title_desc_container).
 *
 * The Library purple Plus card is a classic-adapter ButtonModel built from a
 * server APIButton payload (A4/a section factory fallthrough -> default
 * layout item_link_button). There is no client gate — it renders
 * unconditionally — so the patch hides it at bind time when the button's
 * deeplink matches an upsell route (runtime-verified keyword "upgrade":
 * `anghami://upgrade?...`; holders recycle, so the VISIBLE else-branch is
 * load-bearing).
 */
object ButtonBindFingerprint : Fingerprint(
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

object LinkBindFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/model/adapter/LinkModel;",
    name = "_bind",
    // NOTE: no accessFlags (same reason as above); the LinkViewHolder param
    // disambiguates the three _bind overloads.
    returnType = "V",
    parameters = listOf("Lcom/anghami/model/adapter/LinkModel\$LinkViewHolder;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/anghami/ghost/pojo/Link;",
            name = "getDeepLink",
        ),
    )
)

object GetUpgradeModelFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/prefs/PreferenceHelper;",
    name = "getUpgradeModel",
    // NOTE: no accessFlags; no overloads exist.
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("settings_upgrade_model"),
    )
)

object GetSettingsQuestionFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/prefs/PreferenceHelper;",
    name = "getSettingsQuestion",
    // NOTE: no accessFlags; no overloads exist.
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("question_setting"),
    )
)

/**
 * Library purple Plus card source ("2 months for EGP 69.99").
 *
 * The Library playlists screen (S5/o, Epoxy controller) does NOT go through
 * the A4/a section factory or list_fragment/e.shouldInclude: S5/n copies the
 * server LibraryConfiguration.button into S5/o.h, and S5/o.flatten()
 * unconditionally wraps it in a ButtonModel (null-checked: no button = no
 * model). The _bind GONE hook therefore left an empty RecyclerView cell
 * (the reported gap), and the shouldInclude filter never runs here
 * (filterModels is search-only in _flatten). Nulling this getter prevents
 * the model from ever being created — gap-free by construction — and
 * flatten() falls back to its own no-button layout (16dp spacing via
 * LibraryFilterData). Sole caller is S5/n (verified in 8.0.28 smali);
 * ButtonModel.getButton (different class) is untouched.
 */
object LibraryPromoButtonFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/api/response/LibraryConfigurationAPIResponse\$LibraryConfiguration;",
    name = "getButton",
    // NOTE: no accessFlags — 8.0.28 declares this `public final` and
    // exact-int flag matching proved brittle elsewhere. Class + name +
    // signature already pin it (single occurrence on this class).
    returnType = "Lcom/anghami/ghost/pojo/APIButton;",
    parameters = listOf(),
    filters = listOf(
        opcode(Opcode.RETURN_OBJECT),
    )
)

/**
 * Feed pipeline filter (list_fragment/e). `_flatten()` always runs
 * filterModels() -> shouldInclude(model, filterString) per model; false
 * removes it via Iterator.remove(). Hooked to also exclude upsell cards so
 * no empty adapter cell (gap) remains. Small plain-public method, no
 * switches — safe for prepend with branches.
 *
 * The shouldInclude param is the ConfigurableModel INTERFACE, so every
 * field read must narrow with move-object + check-cast after its
 * instanceof (an iget off the interface-typed ref fails verification).
 * This must stay the only branched prepend on this method: a second
 * patch prepending its own branched block to shouldInclude breaks
 * verification on device (VerifyError "target dex pc is not at
 * instruction start", crash 2026-09-28). The AutomixButtonModel branch
 * therefore lives in this same prepend (first check); the adapter-level
 * Automix strip lives on its own method in the feature-buttons patch.
 */
object ShouldIncludeFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/app/base/list_fragment/e;",
    name = "shouldInclude",
    // NOTE: no accessFlags; signature pins it.
    returnType = "Z",
    parameters = listOf(
        "Lcom/anghami/model/adapter/base/ConfigurableModel;",
        "Ljava/lang/String;",
    ),
    filters = listOf(
        string("Non BaseModel subclass in searchable list: "),
    )
)
