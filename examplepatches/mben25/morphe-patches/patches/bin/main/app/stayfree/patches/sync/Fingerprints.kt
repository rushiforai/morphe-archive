package app.stayfree.patches.sync

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

private const val R_STRING = "Lcom/burockgames/R\$string;"

/**
 * The repository holding the paired-device statics and their invalidation flows. R8 renumbers it
 * every release — `Lzl2;` in 20.16.1, `Lyl2;` in 20.17.0 — but the field names on it (`B0`, `T`,
 * `h0`) have been stable, so only this one constant and [DEVICE_FLOW] move. Identify it after a
 * version bump as the single class declaring `static B0:Ljava/util/List;` alongside a `T` flow.
 */
internal const val DEVICE_REPOSITORY = "Lyl2;"

/** The `MutableLiveData` subclass those flows are typed as (`Lq87;` in 20.16.1). */
internal const val DEVICE_FLOW = "Lu87;"

/** Its `postValue(Object)` declaring class (`Log6;` in 20.16.1). */
internal const val DEVICE_FLOW_POST = "Lrg6;"

/**
 * Retrofit `Builder.baseUrl(String)` (`Lvo9;->c(Ljava/lang/String;)V` in 20.14.1, merged by R8
 * into an unrelated class). Every SensorTower/StayFree Retrofit service is built through it, so
 * hooking it redirects all `https://api.stayfreeapps.com/` services in one place.
 */
object RetrofitBaseUrlFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("baseUrl == null", "baseUrl must end in /: "),
)

/**
 * Every place that shows "Anonymous data collection must be enabled to pair devices…"
 * (`pair_device_data_collection_is_disabled`). In 20.14.1 there are three:
 * - `Lhr0;->invoke(…)`: the navigator lambda; when SensorTower is opted out, navigating to the
 *   pair-with-code destination (`Lpa9;->g`) shows the opt-in dialog instead,
 * - `Lwy4;->invoke()`: the QR-code / `android-connect-device?pairingCode=` deep-link path, same gate,
 * - `Lqs9;->a(Lpz1;I)V`: the warning text composable in Settings > Paired Devices.
 */
object PairDeviceDataCollectionGateFingerprint : Fingerprint(
    filters = listOf(
        fieldAccess(definingClass = R_STRING, name = "pair_device_data_collection_is_disabled"),
    ),
)

/**
 * The lambda that actually issues the QR pairing call (`Lgn3;->invoke()` in 20.16.1, an R8-merged
 * `Function0` whose `invoke()` switches on a selector field). Its branch is guarded by
 * `stashedCode != null && capturedIsQrSheet`, and only past both does it launch the suspend
 * function that builds the Retrofit client.
 *
 * Anchored on the analytics enum constant `USER_PAIRED_CODE_BY_QR`, which the branch reports
 * after launching: the enum type is obfuscated but the constant name is not, and the branch is
 * its only *reader* in the app. The opcode has to be pinned to a read, or the enum's own
 * `<clinit>`, which writes the constant with `sput-object`, matches first.
 */
object QrPairingLaunchFingerprint : Fingerprint(
    filters = listOf(
        fieldAccess(name = "USER_PAIRED_CODE_BY_QR", opcode = Opcode.SGET_OBJECT),
    ),
)

/**
 * A pairing coroutine body that opens with the status gate — `Lu83;->invokeSuspend` (the QR path)
 * and `Lt83;->invokeSuspend` (the manual code-entry path) in 20.16.1. Both share the shape:
 *
 * ```
 * invoke-virtual {statusFlow}, Log6;->getValue()Ljava/lang/Object;
 * move-result-object vValue
 * sget-object vLost, …DeviceGroupStatusType;->NETWORK_CONNECTION_LOST:…
 * if-ne vValue, vLost, :proceed
 * return Unit                      # silent: the status is not changed, nothing is logged
 * ```
 *
 * Two anchors are needed. `NETWORK_CONNECTION_LOST` alone also matches `Lk20;`, the connectivity
 * coroutine that *writes* the status; it reads the same constant and its `invokeSuspend` is found
 * first. Adding `DevicePairingResponse$GroupKey.getKey()` — the unobfuscated library accessor for
 * the group key a successful pairing returns — excludes it, since `k20` never handles a pairing
 * response.
 *
 * This matches more than one method by design; the patch instruments every match, so the probe
 * covers whichever path the user actually exercises.
 */
object PairingStatusGateFingerprint : Fingerprint(
    name = "invokeSuspend",
    filters = listOf(
        fieldAccess(name = "NETWORK_CONNECTION_LOST", opcode = Opcode.SGET_OBJECT),
        methodCall(
            definingClass = "Lcom/sensortower/network/usageapi/entity/DevicePairingResponse\$GroupKey;",
            name = "getKey",
        ),
    ),
)

/**
 * The shared "may this device sync?" precheck, `Lw38;->a(Lx92;)Ljava/lang/Object;` in 20.17.0 —
 * a suspend function every sync entry point awaits before it touches the network. Roughly:
 *
 * ```
 * suspend fun canSync(): Boolean {
 *     if (!withContext(IO) { NetworkUtils.hasInternetConnection() }) return false
 *     if (!prefs.hasMadeConsentChoice()) return false
 *     if (prefs.isOptedOut()) return false      // <- fatal here
 *     return true
 * }
 * ```
 *
 * The third condition is why pairing fails on this build. "Disable All Telemetry" forces
 * `isOptedOut()` to return true so no uploader ever sends anything — correct for its own purpose,
 * and deliberately left alone — but this precheck reads the same flag as permission to sync at
 * all. So the pairing coroutine gets a false here, returns null *without building a Retrofit
 * client*, and the caller paints the generic "Something went wrong, please try again…". Nothing
 * reaches the local server, which is why the failure is instant and leaves no request in its log.
 *
 * Anchored on constructing the `withContext` body that calls `hasInternetConnection()` — in
 * 20.17.0 `Lu38;`, the only one of the five classes that construct it whose caller is a
 * `(L)Ljava/lang/Object;` named `a`. The other `()Z` helpers on this class are permission/OEM
 * checks that build no coroutine body.
 *
 * Both names shift every release (20.16.1: `Lt38;->a` with body `Lr38;`), so the body class is
 * resolved by its single unobfuscated call — `NetworkUtils.hasInternetConnection()` — rather than
 * hardcoded; only the two R8-renumbered digits ever move.
 */
object SyncPreconditionFingerprint : Fingerprint(
    name = "a",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    filters = listOf(
        methodCall(definingClass = "Lu38;", name = "<init>"),
    ),
)

/**
 * `Lyl2;->s(Lpq2;Ly92;)Ljava/lang/Object;` in 20.17.0 — the repository method that reloads the
 * paired-device list out of the Room `Device` table and publishes it for the UI:
 *
 * ```
 * suspend fun reloadDevices(db: Database) {
 *     devices = db.getDevices()            // -> Lyl2;->B0:Ljava/util/List;
 *     deviceListChangedAt.postValue(now)   // -> Lyl2;->T:Lu87;
 * }
 * ```
 *
 * The second line is the bug. Settings > Paired Devices (`Lst9;`) — and eight other screens —
 * read the device list out of the static `B0` and wrap it in a Compose cache keyed on a
 * *different* flow, `Lyl2;->h0:Lu87;`. Across the whole app `T` is written here and read nowhere,
 * while `h0` is read by every one of those screens and written nowhere but `<clinit>`. The two
 * halves of the invalidation were never connected, so the screen composes once against whatever
 * `B0` held at the time (an empty list on a cold start) and is never told to recompute.
 *
 * Nothing about this is specific to local sync — it is StayFree's own defect — but it only becomes
 * visible once pairing works, because before that the list was legitimately empty.
 *
 * Anchored on the `B0` write together with the `T` post: `pq2.e()` (the device read) appears in
 * seven methods and the two field accesses appear in no other method, so the three together pin
 * this one.
 */
object DeviceListPublishFingerprint : Fingerprint(
    name = "s",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L", "L"),
    filters = listOf(
        fieldAccess(definingClass = DEVICE_REPOSITORY, name = "B0", opcode = Opcode.SPUT_OBJECT),
        fieldAccess(definingClass = DEVICE_REPOSITORY, name = "T", opcode = Opcode.SGET_OBJECT),
    ),
)

/**
 * SensorTower's captive-portal check, `NetworkUtils.hasInternetConnection()`. It GETs
 * `https://clients3.google.com/generate_204`, falls back to `https://www.qualcomm.cn/generate_204`,
 * and returns true only on an exact HTTP 204.
 *
 * The class is in a library that R8 does not rename, so it is matched by its own name rather than
 * by a fingerprint over obfuscated callers: the no-arg overload is the only entry point, and the
 * private `(String)Z` worker it delegates to keeps the URLs as fields, so there is no string left
 * in the public method to anchor on.
 */
object HasInternetConnectionFingerprint : Fingerprint(
    definingClass = "Lcom/sensortower/network/glidesupport/util/NetworkUtils;",
    name = "hasInternetConnection",
    returnType = "Z",
    parameters = emptyList(),
)
private const val GLIDE_SUPPORT = "Lcom/sensortower/network/glidesupport/glide"

/**
 * `DataFetcher.loadData(Priority, DataCallback)` of SensorTower's three network-backed Glide icon
 * fetchers: brand icon URLs, website favicons, and icons of apps that aren't installed. Same
 * unrenamed library as `NetworkUtils`, so matched by name. Each falls back to a cached
 * placeholder bitmap from `DataFetchersKt.getDefault*Icon` when the download fails.
 */
object IconUrlDataFetcherFingerprint : Fingerprint(
    definingClass = "$GLIDE_SUPPORT/IconUrlDataFetcher;",
    name = "loadData",
    returnType = "V",
)

object WebsiteIconDataFetcherFingerprint : Fingerprint(
    definingClass = "$GLIDE_SUPPORT/WebsiteIconDataFetcher;",
    name = "loadData",
    returnType = "V",
)

object AppIconDataFetcherFingerprint : Fingerprint(
    definingClass = "$GLIDE_SUPPORT/AppIconDataFetcher;",
    name = "loadData",
    returnType = "V",
)
