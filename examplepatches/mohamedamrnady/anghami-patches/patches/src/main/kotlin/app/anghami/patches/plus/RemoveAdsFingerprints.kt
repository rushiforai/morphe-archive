package app.anghami.patches.plus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

/**
 * "Remove ads" targets (Anghami 8.0.28, verified in base.apk smali).
 *
 * 1. Custom popup ads: `popupwindow/x.i(a)` is the single funnel for all
 *    in-house popup ads. It branches on the four `popupwindow/a` subtypes
 *    (a$a/a$b/a$c/a$d — `instance-of` chain at x.smali:1980+) and shows the
 *    popup; 6 call sites (MainActivity, MainActivity$w, app/base/j,
 *    app/base/j$c). No-op'ing it kills every custom popup in one hook.
 *    Google SDK banner/interstitial ads (AdMob/DFP SDK classes) are NOT
 *    touched by this — only the Anghami popup funnel. (The DFP-fed popup
 *    branch dies too since it goes through the same funnel; the AdManager
 *    callback `z.onAdLoaded` stays covered by Hide-Upsell.)
 * 2. Library purple Plus card: the Your-Library feed (`app/library/a`) is a
 *    generic section feed rendered by the shared A4/a factory — no
 *    library-specific banner code exists. The card is a feed item using the
 *    `item_link_button` layout (layout_container > title_desc_container /
 *    tv_title, verified on-device via uiautomator), built as a ButtonModel
 *    from a server APIButton with displaytype=button (verified via logcat
 *    "Show communication" impression event). Its deeplink is
 *    `anghami://upgrade?mainplanid=...&source=button` — "upgrade" is the
 *    load-bearing keyword (subscribe/plus/etc. all missed). LinkModel
 *    coverage is kept for the same-layout sibling case. Likes/Downloads/
 *    Mixtape shortcut links use `anghami://likes|downloads|offlinemixtape|
 *    playlists` deeplinks (Link.smali constants) — none match, so the
 *    shortcut bar is unaffected.
 * 3. Settings "subscribe to Plus" banner: NOT an UpgradeRow (the main-page
 *    row dispatcher mainsettings/j has no UpgradeRow branch, and the hooked
 *    getUpgradeModel()->null provably didn't remove it — verified present in
 *    installed dex). It is a QuestionRow built by mainsettings/r.a() from
 *    PreferenceHelper.getSettingsQuestion() ("question_setting" server
 *    JSON; title+button are server text, confirmed by mismatch with local
 *    strings: no trailing dot, capital-N "Subscribe Now"). Its button fires
 *    `anghami://upgrade?source=settings` (logcat processURL). r.a
 *    null-skips, so forcing null is safe. The getUpgradeModel()->null hook
 *    is kept as defense-in-depth for the subscriptions sub-screen.
 */
object PopupShowFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ui/popupwindow/x;",
    name = "i",
    // NOTE: no accessFlags — 8.0.28 declares this `public final`; exact-int
    // flag matching is brittle (cf. REPORT §9.4). Class + name + signature
    // already pin it uniquely.
    returnType = "V",
    parameters = listOf("Lcom/anghami/ui/popupwindow/a;"),
    filters = listOf(
        string("adType"),
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
    // NOTE: no accessFlags (same reason); no overloads exist.
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("settings_upgrade_model"),
    )
)

/**
 * Fullscreen custom popup dialog (startup "Pay with mobile line" / "Get
 * offer" carousel). Shown via dialog/g.c ("Showing full screen dialog") ->
 * dialog/k.onNext(Boolean) -> dialog/T (DialogFragment with carousel_view +
 * btn_action + tv_skip, layout dialog_screen_carousel). k is instantiated in
 * exactly one place (g.c:814), and onNext's only effect when true is showing
 * T — no-op'ing it kills the fullscreen promo path without touching the
 * generic dialog builder g (used by many features).
 */
object FullscreenDialogFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ui/dialog/k;",
    name = "onNext",
    // NOTE: no accessFlags — 8.0.28 declares this `public final`.
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        string("FullScreenDialog:"),
    )
)

/**
 * Main-Settings "Subscribe to Plus" banner. It is NOT an UpgradeRow: the
 * main-page row dispatcher (mainsettings/j) has no UpgradeRow branch, and
 * UpgradeModel text never reaches it. The banner is a QuestionRow built by
 * mainsettings/r.a() from PreferenceHelper.getSettingsQuestion()
 * ("question_setting" pref, server Question JSON with title/message/
 * color/color2 + answers -> answerTitle/answerUrl="anghami://upgrade?...").
 * r.a null-skips twice (if-eqz -> :cond_e, k9/k.b blank -> :cond_9), so
 * forcing null is safe.
 */
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
 * Feed pipeline filter (list_fragment/e). `_flatten()` always runs
 * filterModels() -> shouldInclude(model, filterString) per model; false
 * removes it via Iterator.remove(). Hooked to also exclude upsell cards so
 * no empty adapter cell (gap) remains. Small plain-public method, no
 * switches — safe for prepend with branches (unique labels).
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
