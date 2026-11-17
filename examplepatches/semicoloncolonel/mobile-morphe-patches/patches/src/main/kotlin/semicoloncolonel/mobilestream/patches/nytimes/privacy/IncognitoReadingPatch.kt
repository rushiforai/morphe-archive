package semicoloncolonel.mobilestream.patches.nytimes.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import semicoloncolonel.mobilestream.patches.nytimes.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.shared.misc.returnUnitSmali
import semicoloncolonel.mobilestream.patches.shared.privacy.enableIncognitoReading

// ─────────────────────────────────────────────────────────────────────────────
// Incognito reading (OPT-IN, default OFF). NYT 11.99.0 and 12.0.0.
//
// Keeps a record of which articles you read off the phone and away from NYT's
// trackers, while articles, sign-in, the paywall, push alerts and Games keep
// working. It includes Block analytics & tracking, which stops the third-party
// trackers (Chartbeat, comScore, AppsFlyer, Datadog and others).
//
// On the network (TrackerBlocker's Incognito reading lists):
//   a.et.nytimes.com, eg/egb.nytimes.com  NYT's own event trackers: ET2 page
//                                          views and EventGate.
//   als-svc.nytimes.com                   the ad-targeting lookup, which
//                                          receives each article's URL with
//                                          the reader's cookie.
//   www.nytimes.com/statsig/log_event     event logging through NYT's Statsig
//                                          proxy (the feature flags still load).
//
// On the phone (RecentlyViewedManager):
//   - Opening an article no longer adds it to the local "Recently viewed" list.
//   - The list is no longer filled from the history NYT keeps for the account
//     across devices (the CrossPlatformHistory query).
//
// Not hidden: the request for the article itself, which NYT's servers see
// with the signed-in account, as they need it to unlock the article.
// ─────────────────────────────────────────────────────────────────────────────

private const val RECENTLY_VIEWED_MANAGER = "Lcom/nytimes/android/recentlyviewed/a;"
private const val SYNC_CONTINUATION =
    "Lcom/nytimes/android/recentlyviewed/RecentlyViewedManager\$syncHistoryWithServer\$1;"

// RecentlyViewedManager's write: (asset, OffsetDateTime) -> void. The asset
// type is renamed per build, so only the timestamp is matched.
private object RecordViewFingerprint : Fingerprint(
    definingClass = RECENTLY_VIEWED_MANAGER,
    returnType = "V",
    custom = { method, _ ->
        method.parameterTypes.size == 2 && method.parameterTypes[1].toString() == "Ljava/time/OffsetDateTime;"
    },
)

// The suspend function that pulls the account's history from the server. It is
// one of several look-alike methods; it is the one that creates its own
// coroutine continuation class, syncHistoryWithServer$1.
private object SyncHistoryFingerprint : Fingerprint(
    definingClass = RECENTLY_VIEWED_MANAGER,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/jvm/internal/ContinuationImpl;"),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type == SYNC_CONTINUATION
        } == true
    },
)

@Suppress("unused")
val incognitoReadingPatch = bytecodePatch(
    name = "Incognito reading",
    description = "Experimental. Stops the app and NYT from recording which articles you read. Includes Block analytics & tracking.",
    default = false,
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(blockAnalyticsPatch)

    extendWith("extensions/extension.mpe")

    execute {
        enableIncognitoReading()

        RecordViewFingerprint.methodOrNull?.returnEarly("return-void")
            ?: throw PatchException("Recently viewed: the method that records an article was not found")

        SyncHistoryFingerprint.methodOrNull?.returnEarly(returnUnitSmali())
            ?: throw PatchException("Recently viewed: the history sync was not found")
    }
}
