package arpit.morphe.patches.movieboxtv.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * VIP state of the signed-in account, the value the UI and the API layer read for
 * entitlement checks.
 *
 * `public final isVip()Ljava/lang/Boolean;` in
 * `com.transsion.tvdata.bean.BffGetVipUserInfoData` (classes4), verified against
 * `smali/classes4/com/transsion/tvdata/bean/BffGetVipUserInfoData.smali:2482`
 * (`.registers 2`, body `iget-object v0, p0, ...->isVip:Ljava/lang/Boolean; ; return-object v0`).
 */
object VipUserInfoFingerprint : Fingerprint(
    name = "isVip",
    definingClass = "Lcom/transsion/tvdata/bean/BffGetVipUserInfoData;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Boolean;",
    parameters = emptyList(),
)

/**
 * Same account flag on the older user bean, still returned by several endpoints.
 *
 * `public final isVip()Ljava/lang/Boolean;` in `com.transsion.tvdata.bean.BffUserInfoData`
 * (classes4), verified at `BffUserInfoData.smali:2482`.
 */
object UserInfoVipFingerprint : Fingerprint(
    name = "isVip",
    definingClass = "Lcom/transsion/tvdata/bean/BffUserInfoData;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Boolean;",
    parameters = emptyList(),
)

/**
 * Per-title VIP lock of the detail page.
 *
 * `public final isVip()Z` in `com.transsion.tvdata.bean.BffSubjectInfo` (classes), verified at
 * `smali/classes/com/transsion/tvdata/bean/BffSubjectInfo.smali:4074`.
 */
object SubjectVipFingerprint : Fingerprint(
    name = "isVip",
    definingClass = "Lcom/transsion/tvdata/bean/BffSubjectInfo;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Per-title VIP lock on short-drama cards.
 *
 * `public final isVip()Ljava/lang/Boolean;` in `com.transsion.tvdata.bean.BffShortTvInfo`
 * (classes4), verified at `BffShortTvInfo.smali:3577`.
 */
object ShortTvVipFingerprint : Fingerprint(
    name = "isVip",
    definingClass = "Lcom/transsion/tvdata/bean/BffShortTvInfo;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Boolean;",
    parameters = emptyList(),
)

/**
 * Per-title VIP lock on operating-page subjects.
 *
 * `public final isVip()Z` in `com.transsion.tvdata.bean.BffOperatingSubject` (classes), verified
 * at `smali/classes/com/transsion/tvdata/bean/BffOperatingSubject.smali:2782`.
 */
object OperatingSubjectVipFingerprint : Fingerprint(
    name = "isVip",
    definingClass = "Lcom/transsion/tvdata/bean/BffOperatingSubject;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Per-title VIP lock on an actor's works.
 *
 * `public final isVip()Z` in `com.transsion.tvdata.bean.BffActorWorkItem` (classes4), verified at
 * `smali/classes4/com/transsion/tvdata/bean/BffActorWorkItem.smali:3780`.
 */
object ActorWorkVipFingerprint : Fingerprint(
    name = "isVip",
    definingClass = "Lcom/transsion/tvdata/bean/BffActorWorkItem;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Per-title VIP lock on search results of the "ranking" shelf.
 *
 * `public final isVip()Z` in `com.transsion.tvdata.bean.BffSearchRankSubject` (classes),
 * verified at `smali/classes/com/transsion/tvdata/bean/BffSearchRankSubject.smali`
 * (`.registers 2`, body `iget-boolean v0, p0, ...->isVip:Z ; return v0`).
 */
object SearchRankSubjectVipFingerprint : Fingerprint(
    name = "isVip",
    definingClass = "Lcom/transsion/tvdata/bean/BffSearchRankSubject;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Region lock answered by the visitor/login endpoint, which blocks playback in unsupported
 * regions.
 *
 * `public final getRegionBlock()Ljava/lang/Boolean;` in
 * `com.transsion.tvdata.bean.BffVisitorLoginData` (classes4), verified at
 * `BffVisitorLoginData.smali:946`.
 */
object RegionBlockFingerprint : Fingerprint(
    name = "getRegionBlock",
    definingClass = "Lcom/transsion/tvdata/bean/BffVisitorLoginData;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Boolean;",
    parameters = emptyList(),
)

/**
 * Reader of the data layer's VIP state flow, the value `TvServiceLocator.q0()` (and through it
 * the player's resolution gate) consults. It is a plain `()Z` accessor, so it can be forced.
 *
 * `public final a()Z` in `com.transsion.tvdata.f0` (classes4), verified at
 * `smali/classes4/com/transsion/tvdata/f0.smali`: `sget-object v0, ->b;` / `getValue()` /
 * `check-cast Boolean` / `booleanValue()`.
 */
object VipStateFingerprint : Fingerprint(
    definingClass = "Lcom/transsion/tvdata/f0;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Setter of that same state singleton, called by the server VIP refresh. Forcing its argument
 * keeps a non-VIP answer from switching the app back to the pay-wall state.
 *
 * `public final c(Z)V` in `com.transsion.tvdata.f0` (classes4), verified at
 * `f0.smali`: `sget-object v0, ->b;` / `valueOf(Z)` / `setValue(Object)`.
 */
object VipStateWriterFingerprint : Fingerprint(
    definingClass = "Lcom/transsion/tvdata/f0;",
    name = "c",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Z"),
)

/**
 * Forced-update flag of the version check response (dialog that cannot be dismissed).
 *
 * `public final getForceUpdate()Z` in `com.transsion.version.update.RemoteVersionInfo`
 * (classes4), verified at `RemoteVersionInfo.smali:2216`.
 */
object ForceUpdateFingerprint : Fingerprint(
    name = "getForceUpdate",
    definingClass = "Lcom/transsion/version/update/RemoteVersionInfo;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Optional-update flag of the same response (the "new version" prompt on every launch).
 *
 * `public final getHasUpdate()Z` in `com.transsion.version.update.RemoteVersionInfo`
 * (classes4), verified at `RemoteVersionInfo.smali:2251`.
 */
object HasUpdateFingerprint : Fingerprint(
    name = "getHasUpdate",
    definingClass = "Lcom/transsion/version/update/RemoteVersionInfo;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
)
