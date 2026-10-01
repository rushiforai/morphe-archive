package app.idm.patches.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * `Lacr/browser/lightning/view/BannerManager;->load(Z)V` fetches the banner ad
 * configuration into `bannerInfoList` and flips `mLoaded` on. It is the only
 * method that fills the list: `resume()` refuses to start the rotation timer
 * while `mLoaded` is false or the list is empty, and the banner is only ever
 * posted to the view after the timer runs.
 *
 * The whole method is `monitor-enter` synchronised and never leaves the state it
 * creates, so the ad manager is identified by its own field traffic rather than
 * by the obfuscated `Lidm/...;d;` calls that supply the ad list.
 */
object BannerManagerLoadFingerprint : Fingerprint(
    definingClass = "Lacr/browser/lightning/view/BannerManager;",
    name = "load",
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        opcode(Opcode.MONITOR_ENTER, location = InstructionLocation.MatchFirst()),
        fieldAccess(
            definingClass = "this",
            name = "mDisabled",
            type = "Ljava/util/concurrent/atomic/AtomicBoolean;",
            opcode = Opcode.IGET_OBJECT
        ),
        methodCall(
            definingClass = "Ljava/util/concurrent/atomic/AtomicBoolean;",
            name = "set",
            parameters = listOf("Z"),
            returnType = "V"
        ),
        fieldAccess(
            definingClass = "this",
            name = "mLoaded",
            type = "Ljava/util/concurrent/atomic/AtomicBoolean;",
            opcode = Opcode.IGET_OBJECT
        ),
        fieldAccess(
            definingClass = "this",
            name = "mTimer",
            type = "Ljava/util/Timer;",
            opcode = Opcode.IGET_OBJECT
        ),
        methodCall(
            definingClass = "Ljava/util/Timer;",
            name = "cancel",
            parameters = listOf(),
            returnType = "V"
        ),
        // The stored ad is nulled before the list is refilled, and its type is an
        // obfuscated `Li/ru;` that changes between releases, so only its name is
        // pinned here.
        fieldAccess(
            definingClass = "this",
            name = "currentBannerInfo",
            opcode = Opcode.IPUT_OBJECT
        ),
        fieldAccess(
            definingClass = "this",
            name = "bannerInfoList",
            type = "Ljava/util/List;",
            opcode = Opcode.IGET_OBJECT
        ),
        methodCall(
            definingClass = "Ljava/util/List;",
            name = "clear",
            parameters = listOf(),
            returnType = "V"
        ),
        methodCall(
            definingClass = "Ljava/util/List;",
            name = "addAll",
            parameters = listOf("Ljava/util/Collection;"),
            returnType = "Z"
        ),
        methodCall(
            definingClass = "Ljava/util/List;",
            name = "add",
            parameters = listOf("Ljava/lang/Object;"),
            returnType = "Z"
        )
    )
)

/**
 * `Lacr/browser/lightning/view/BannerView;->setAd(Ljava/lang/Integer;Li/ru;)V` is the
 * single point where the home screen banner is rendered. It is reached from
 * `onFinishInflate()` through `setupAdView()` and from the bus event that
 * `BannerManager.postAd()` publishes, so no other path can reveal the banner.
 *
 * The method returns early when the app's ads-disabled flag is set, and its own
 * "hide the banner" branch is `setVisibilityIfChanged(this, GONE)`. The
 * `AmazonService.getBannerBackfillAd("any")` call is the only consumer of the
 * `any` slot string and the only place the Amazon banner is inflated, which makes
 * the string and the call a stable pair for this method.
 */
object BannerViewSetAdFingerprint : Fingerprint(
    definingClass = "Lacr/browser/lightning/view/BannerView;",
    name = "setAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/Integer;", "Li/ru;"),
    filters = listOf(
        fieldAccess(
            definingClass = "this",
            name = "icon",
            type = "Landroid/widget/ImageView;",
            opcode = Opcode.IGET_OBJECT
        ),
        fieldAccess(
            definingClass = "this",
            name = "title",
            type = "Landroid/widget/TextView;",
            opcode = Opcode.IGET_OBJECT
        ),
        fieldAccess(
            definingClass = "this",
            name = "action",
            type = "Landroid/widget/Button;",
            opcode = Opcode.IGET_OBJECT
        ),
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "getContext",
            parameters = listOf(),
            returnType = "Landroid/content/Context;"
        ),
        methodCall(
            definingClass = "Lacr/browser/lightning/view/BannerManager;",
            name = "isNetworkAdShowing",
            parameters = listOf("Landroid/app/Activity;"),
            returnType = "Z"
        ),
        string("any"),
        methodCall(
            definingClass = "Lidm/internet/download/manager/amazon/AmazonService;",
            name = "getBannerBackfillAd",
            parameters = listOf("Ljava/lang/String;"),
            returnType = "Lcom/amazon/device/ads/DTBAdResponse;"
        ),
        fieldAccess(
            definingClass = "this",
            name = "aps_banner",
            type = "Landroid/view/ViewGroup;",
            opcode = Opcode.IGET_OBJECT
        ),
        // The banner's only click target is installed on the same view, immediately
        // before it is revealed.
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "setOnClickListener",
            parameters = listOf("Landroid/view/View\$OnClickListener;"),
            returnType = "V"
        )
    )
)

/**
 * `Lidm/internet/download/manager/d;->ۦۜۡ()Li/ru;` is the single source of the "install
 * 1DM+" banner ad, and it is a static factory that builds the `Li/ru;` ad object from
 * literals: a base64 PNG icon, the copy "Install <b>1DM+</b> for an Ad free experience
 * and support developement of the app", the label "Install", the Play Store package
 * `idm.internet.download.manager.plus`, a `utm_` campaign tag, the accent colour
 * `#43A047`, and a 30 000 ms click-through delay.
 *
 * It is worth being precise about what this is not, because the first attempt at this
 * patched the wrong class and did nothing. 1DM has four app-owned banner classes, and
 * the one on the home screen is `manager/NewBannerView`, not
 * `Lacr/browser/lightning/view/BannerView` and not
 * `Lidm/internet/download/manager/BannerView`. All of them end up drawing whatever
 * `Li/ru;` they are handed, and this factory is what hands it over.
 *
 * Suppressing the factory rather than any one renderer is what makes this complete: the
 * promo reaches the screen through four separate call sites --
 * `BannerManager.load(Z)V` and `BannerManager.getNewBannerInfo(...)`, which feed the ad
 * rotation, and `Li/s82;->ۦۖۢ(...)V` and `Li/s82;->ۦۖۦ(...)Z`, which reach
 * `manager.NewBannerView` directly. Redirecting `BannerManager.load()` to `disable()`
 * leaves the other three, which is why the prompt survived it.
 *
 * All four call sites null-check the result and skip the banner when it is null, so
 * returning null here is the behaviour the app already has a path for. The method is
 * `static` with `.registers 3`, so `v0` is the return slot and the replacement is
 * `const/4 v0, 0` followed by `return-object v0` -- `return-void` is not legal on a
 * method that returns a reference.
 *
 * The chain identifies the method by its own literals: the `PlayStore` package name is
 * unique to this factory, and the copy, the label and the click-through delay sit either
 * side of it. None of the obfuscated member names are used.
 */
object IdmPlusBannerFingerprint : Fingerprint(
    definingClass = "Lidm/internet/download/manager/d;",
    name = "ۦۜۡ",
    returnType = "Li/ru;",
    parameters = listOf(),
    filters = listOf(
        // The cached singleton this factory fills in and hands back.
        fieldAccess(
            definingClass = "Lidm/internet/download/manager/d;",
            name = "ۦۗۥ",
            type = "Li/ru;",
            opcode = Opcode.SGET_OBJECT
        ),
        string("Install <b>1DM+</b> for an Ad free experience and support developement of the app"),
        string("Install"),
        // The 30 s click-through delay. It is written *before* the Play Store id in the
        // method body, so the chain has to visit it here; filters match in increasing
        // instruction order, and putting it last would leave it unreachable.
        literal(30000, listOf(Opcode.CONST_16)),
        // The Play Store id of the paid edition. Unique to this method in the app.
        string("idm.internet.download.manager.plus"),
        string("utm_source=1DM&utm_medium=App&utm_campaign=DefaultBanner")
    )
)
