package app.adm.patches.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * `Lv2/o5;->c(Landroid/app/Activity;)V` initializes the Appodeal SDK with the
 * publisher's Appodeal application key. The key literal is user supplied and stable,
 * and `Appodeal.initialize` is the only call that consumes it in this method.
 */
object AppodealInitFingerprint : Fingerprint(
    definingClass = "Lv2/o5;",
    name = "c",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
    filters = listOf(
        string("18b2becc3142993292bf348e92467eded74e23229100a646"),
        methodCall(
            definingClass = "Lcom/appodeal/ads/Appodeal;",
            name = "initialize",
            parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "I"),
            returnType = "V"
        )
    )
)

/**
 * `Lv2/o5;->b()V` shows the Appodeal banner. It requests the banner view, attaches it
 * to the app's ad container, and then broadcasts the `main-toolend` intent action that
 * the app uses to announce that an ad slot finished loading.
 */
object BannerDisplayFingerprint : Fingerprint(
    definingClass = "Lv2/o5;",
    name = "b",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/appodeal/ads/Appodeal;",
            name = "getBannerView",
            parameters = listOf("Landroid/content/Context;"),
            returnType = "Lcom/appodeal/ads/BannerView;"
        ),
        string("main-toolend"),
        methodCall(
            definingClass = "Lcom/appodeal/ads/Appodeal;",
            name = "show",
            parameters = listOf("Landroid/app/Activity;", "I"),
            returnType = "Z"
        )
    )
)

/**
 * `Lv2/o5;->d(Landroid/app/Activity;)V` shows the Appodeal interstitial, rate limited
 * through the `AppoInterShow` timestamp preference.
 */
object InterstitialDisplayFingerprint : Fingerprint(
    definingClass = "Lv2/o5;",
    name = "d",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;"),
    filters = listOf(
        string("AppoInterShow"),
        methodCall(
            definingClass = "Lcom/appodeal/ads/Appodeal;",
            name = "show",
            parameters = listOf("Landroid/app/Activity;", "I"),
            returnType = "Z"
        )
    )
)

/**
 * `Lv2/e3;->run()V` is the remote-configuration runnable. One of its dispatch cases
 * builds the AppBrain house banner: it constructs `AppBrainBanner`, attaches it to
 * the ad container, makes that container visible, and broadcasts `main-toolend`.
 * `AppBrainBanner` is an unobfuscated third-party type and occurs once in the DEX,
 * so the ordered chain below pins the create/attach/reveal sequence exactly.
 */
object AppBrainBannerFingerprint : Fingerprint(
    definingClass = "Lv2/e3;",
    name = "run",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        newInstance("Lcom/appbrain/AppBrainBanner;"),
        methodCall(
            definingClass = "Landroid/view/ViewGroup;",
            name = "addView",
            parameters = listOf("Landroid/view/View;"),
            returnType = "V"
        ),
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "setVisibility",
            parameters = listOf("I"),
            returnType = "V"
        ),
        string("main-toolend")
    )
)

/**
 * `Lcom/dv/get/Main;->K()V` performs activity start-up and inflates the Telegram
 * join prompt. The prompt is gated by two view counters read from `TELE1_KEY` and
 * `TELE2_KEY`: the prompt is skipped once the first counter reaches the threshold
 * held in the `const/4` immediately before the first `if-ge`.
 *
 * 14.0.39 inserts one extra `const/4 v8, 1` between that threshold and the branch,
 * so the branch anchor allows one intervening instruction.
 */
object TelegramPromptFingerprint : Fingerprint(
    definingClass = "Lcom/dv/get/Main;",
    name = "K",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("TELE1_KEY"),
        string("TELE2_KEY"),
        literal(2, listOf(Opcode.CONST_4)),
        opcode(Opcode.IF_GE, location = InstructionLocation.MatchAfterWithin(1)),
        literal(9, listOf(Opcode.CONST_16)),
        methodCall(
            definingClass = "Landroid/view/ViewStub;",
            name = "inflate",
            parameters = listOf(),
            returnType = "Landroid/view/View;"
        ),
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "setVisibility",
            parameters = listOf("I"),
            returnType = "V"
        ),
        literal(19, listOf(Opcode.CONST_16))
    )
)
