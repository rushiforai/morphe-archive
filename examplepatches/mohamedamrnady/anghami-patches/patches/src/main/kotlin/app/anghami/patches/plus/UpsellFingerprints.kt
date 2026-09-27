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
 * Why these: forcing isPlus=true does NOT remove upsell UI because it is
 * driven by server-provided payloads, not by the isPlusUser gate:
 * - Nav-bar upgrade entry: PreferenceHelper.getPlusTab() feeds the static
 *   flag `Lcom/anghami/util/c;->a:Z` (read in MainActivity and
 *   app/base/o.smali). Force false.
 * - Homepage/library blue banner: BlueBarItem.fillMemCache() is called at
 *   startup (com/anghami/a.smali) and HeaderBar.setData(BlueBarItem) renders
 *   it. No-op both.
 * - Flyer/popup ad: com/anghami/ui/popupwindow/z.onAdLoaded() shows the
 *   popup (findViewById 0x7f0a00eb). No-op it. (AdSettings.noAd=true from
 *   UnlockRestrictionsPatch covers the song-level flag; this covers the UI.)
 * - getHasRestrictedQueue ("restricted_queue" pref) feeds queue-restriction
 *   UI. Force false.
 *
 * Server caveat: UpgradeModel/UpgradeRow in settings-subscriptions and
 * DisplayAdsWorker payloads are server-issued; if banners persist after
 * this patch, the remaining source is server data, not a missed client gate.
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

object FlyerOnAdLoadedFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ui/popupwindow/z;",
    name = "onAdLoaded",
    // NOTE: no accessFlags — 8.0.28 declares this `public final` and exact-int
    // flag matching rejects unlisted flags. Class + name + signature are unique.
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        opcode(Opcode.CONST),
        opcode(Opcode.RETURN_VOID),
    )
)

/**
 * In-feed subscribe card (Anghami 8.0.28, verified in base.apk smali + on
 * device via uiautomator: tv_title inside title_desc_container).
 *
 * The Library purple Plus card is a classic-adapter ButtonModel built from a
 * server APIButton payload (A4/a section factory fallthrough -> default
 * layout item_link_button). There is no client gate — it renders
 * unconditionally — so the patch hides it at bind time: if the button's
 * deeplink contains "subscribe" (the card taps through to SubscribeActivity
 * via the "subscribe" deeplink route in app/base/o), the item view goes GONE,
 * otherwise VISIBLE (holders recycle, so the else-branch is load-bearing).
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
