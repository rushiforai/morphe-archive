package app.template.patches.wps

import app.morphe.patcher.Fingerprint

// ============================================================================
// WPS Office 26.11.0 (b1650) - privilege gate targets
//
// WPS is *not* obfuscated in this area: the class and method names below are
// stable, readable symbols taken from the stock 26.11.0 bundle. They are pinned
// by `COMPATIBILITY_WPS_OFFICE`, so exact-name fingerprints are correct here -
// a fuzzy match would be less safe, not more.
//
// The whole premium system funnels through three layers:
//
//   cn.wps.moffice.main.thirdpayshell.PrivilegeUtil      (thin facade)
//     -> IPrivilegeAssembly / PrivilegeAssembly          (public service, 1.7k call sites)
//          -> cn.wps.kprivilege.impl.KPrivilege           (cache + server protocol)
//
//   cn.wps.moffice.privilege.EnVasPrivilegeUtil          (pay sheet / upgrade UI)
//     -> cn.wps.moffice.KEnVasAssembly                   (pay entry points)
//
// Every boolean reader in those layers is fingerprinted below. Nothing here
// touches the network or the cache objects themselves, so a mistaken patch can
// only produce a wrong *answer*, never a corrupted cache or a failed sign-in.
// ============================================================================

internal const val WPS_PRIVILEGE_ASSEMBLY =
    "Lcn/wpsx/module/communication/vas/service/impl/PrivilegeAssembly;"

/** Anonymous `IPrivilegeAssembly$ListCallback` adapter that turns a map into `ConsumePrivilege`s. */
internal const val WPS_PRIVILEGE_ASSEMBLY_CALLBACK =
    "Lcn/wpsx/module/communication/vas/service/impl/PrivilegeAssembly\$2;"

internal const val WPS_ENVAS_PRIVILEGE_UTIL = "Lcn/wps/moffice/privilege/EnVasPrivilegeUtil;"

internal const val WPS_KENVAS_ASSEMBLY = "Lcn/wps/moffice/KEnVasAssembly;"

internal const val WPS_MOFFICE_DELEGATE_IMPL = "Lcn/wps/moffice/MofficeDelegateImpl;"

/** Continuation body of the newer VAS interceptor; holds the deny path for `PrivilegeEngine`. */
internal const val WPS_PRIVILEGE_INTERCEPT_CONTINUATION =
    "Lcn/wps/moffice/vas/privilege/biz/interceptor/PrivilegeInterceptor\$intercept\$2\$1;"

internal const val WPS_SIGNATURE_UTILS = "Lcn/wps/moffice/firebase/SignatureUtils;"

internal const val WPS_CONSUME_PRIVILEGE =
    "Lcn/wpsx/module/communication/vas/bean/ConsumePrivilege;"

internal const val WPS_SUCCESS_RESPONSE =
    "Lcn/wps/moffice/vas/privilege/request/SuccessResponse;"

internal const val WPS_PRIVILEGE_CONTEXT = "Lcn/wps/moffice/vas/privilege/request/VasContext;"

/**
 * `PrivilegeAssembly.checkFromCache(String)Z`
 *
 * The single synchronous "do I own this privilege" shortcut. Every caller that
 * asks without an Activity (ad gate, font/template gates, `ADUtil.j`) lands
 * here. In stock it just calls `KPrivilege.i(..., ex=false)` and looks the id up
 * in the returned map.
 */
internal object WpsCheckFromCacheFingerprint : Fingerprint(
    definingClass = WPS_PRIVILEGE_ASSEMBLY,
    name = "checkFromCache",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
)

/**
 * `PrivilegeAssembly$2.b(Object)V`
 *
 * The asynchronous dispatcher: receives the privilege map from `KPrivilege`,
 * converts entries into `ConsumePrivilege` and calls
 * `IPrivilegeAssembly$ListCallback.b(HashMap)`. Every `noHasPrivilege(-99999)`
 * decision for the ~1,760 `check()` call sites is made here.
 */
internal object WpsPrivilegeDispatchFingerprint : Fingerprint(
    definingClass = WPS_PRIVILEGE_ASSEMBLY_CALLBACK,
    name = "b",
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
)

/** `PrivilegeAssembly.getAllMemberList()Ljava/util/ArrayList;` - SKU list behind every member badge. */
internal object WpsMemberListFingerprint : Fingerprint(
    definingClass = WPS_PRIVILEGE_ASSEMBLY,
    name = "getAllMemberList",
    returnType = "Ljava/util/ArrayList;",
    parameters = emptyList(),
)

/** `PrivilegeAssembly.getMemberLevel()Ljava/lang/String;` - highest rank from `MEMBER_LEVEL_RANK`. */
internal object WpsMemberLevelFingerprint : Fingerprint(
    definingClass = WPS_PRIVILEGE_ASSEMBLY,
    name = "getMemberLevel",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

internal object WpsBasicVipFingerprint : Fingerprint(
    definingClass = WPS_PRIVILEGE_ASSEMBLY,
    name = "isBasicVip",
    returnType = "Z",
    parameters = emptyList(),
)

internal object WpsSeniorVipFingerprint : Fingerprint(
    definingClass = WPS_PRIVILEGE_ASSEMBLY,
    name = "isSeniorVip",
    returnType = "Z",
    parameters = emptyList(),
)

internal object WpsVipAiFingerprint : Fingerprint(
    definingClass = WPS_PRIVILEGE_ASSEMBLY,
    name = "isVipAi",
    returnType = "Z",
    parameters = emptyList(),
)

/** `EnVasPrivilegeUtil.d()Z` - "is Premium". */
internal object WpsEnVasPremiumFingerprint : Fingerprint(
    definingClass = WPS_ENVAS_PRIVILEGE_UTIL,
    name = "d",
    returnType = "Z",
    parameters = emptyList(),
)

/** `EnVasPrivilegeUtil.f()Z` - "is Pro or Premium". */
internal object WpsEnVasProFingerprint : Fingerprint(
    definingClass = WPS_ENVAS_PRIVILEGE_UTIL,
    name = "f",
    returnType = "Z",
    parameters = emptyList(),
)

/** `EnVasPrivilegeUtil.e(String)Z` - "does this privilege pack apply to me". */
internal object WpsEnVasPackFingerprint : Fingerprint(
    definingClass = WPS_ENVAS_PRIVILEGE_UTIL,
    name = "e",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
)

/** `KEnVasAssembly.isPremiumVipMember()Z`. */
internal object WpsKEnVasPremiumFingerprint : Fingerprint(
    definingClass = WPS_KENVAS_ASSEMBLY,
    name = "isPremiumVipMember",
    returnType = "Z",
    parameters = emptyList(),
)

/** `KEnVasAssembly.isProVipMember()Z`. */
internal object WpsKEnVasProFingerprint : Fingerprint(
    definingClass = WPS_KENVAS_ASSEMBLY,
    name = "isProVipMember",
    returnType = "Z",
    parameters = emptyList(),
)

/** `KEnVasAssembly.hasPremiumVipPrivilege()Z`. */
internal object WpsKEnVasHasPremiumFingerprint : Fingerprint(
    definingClass = WPS_KENVAS_ASSEMBLY,
    name = "hasPremiumVipPrivilege",
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * `MofficeDelegateImpl.isAdPrivilege()Z` - the host-side "ads are disabled" flag
 * the ad-free privilege check ends up in. `ADUtil.j("ads_free_i18n")` reads the
 * same id, so this is the second half of the client ad gate.
 */
internal object WpsAdPrivilegeFingerprint : Fingerprint(
    definingClass = WPS_MOFFICE_DELEGATE_IMPL,
    name = "isAdPrivilege",
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * `PrivilegeInterceptor$intercept$2$1.noHasPrivilege(I)V`
 *
 * Deny path of the newer `PrivilegeEngine`: code `10007/10011/10012/10013/10015`
 * are silent, anything else pops a toast and resumes with a `FailResponse`.
 */
internal object WpsAsyncDenialFingerprint : Fingerprint(
    definingClass = WPS_PRIVILEGE_INTERCEPT_CONTINUATION,
    name = "noHasPrivilege",
    returnType = "V",
    parameters = listOf("I"),
)

/**
 * `SignatureUtils.a(Context)Z` - compares the APK certificate MD5 against a
 * string built from two resources. Only `FbAnalyticsWithGP$1` consumes it, so
 * this is cosmetic (analytics flavour), not a functional gate.
 */
internal object WpsSignatureUtilsFingerprint : Fingerprint(
    definingClass = WPS_SIGNATURE_UTILS,
    name = "a",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

// ============================================================================
// Optional parity gates (added for the three default-off toggles)
//
// These mirror what the third-party ghost mod touches, but each one is a
// separate opt-in switch and each is written against the stock contract:
// nothing here fabricates state outside the method it replaces.
// ============================================================================

/**
 * `PrivilegeInterceptor.a(InterceptorChain, Continuation)Object`
 *
 * The newer VAS interceptor. Stock validates the privilegeId, resolves
 * `IPrivilegeAssembly` through ServiceManager and suspends on
 * `assembly.check(activity, id, callback)`, turning every failure into a
 * `FailResponse`. Replaced (optionally) with a `SuccessResponse`.
 */
internal object WpsPrivilegeInterceptorFingerprint : Fingerprint(
    definingClass = "Lcn/wps/moffice/vas/privilege/biz/interceptor/PrivilegeInterceptor;",
    name = "a",
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Lcn/wps/moffice/vas/privilege/intercept/InterceptorChain;",
        "Lkotlin/coroutines/Continuation;",
    ),
)

/**
 * The `run()` body that builds the PDF shop's "already owned" dialog. The
 * class is obfuscated (`Ls74;` in 26.11.0), so it is matched by the analytics
 * label it logs right after showing the dialog rather than by name.
 */
internal object WpsOwnedPrivilegeDialogFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    custom = { method, _ ->
        method.name == "run" && method.hasExactString("owned_privilege_dialog")
    },
)

/**
 * `ADUtil.l()Z` - the remote ad gate. Stock returns the negation of the
 * `a_online_a` server toggle, so `true` means "do not request ads"; visitor
 * mode, S2S request building and the ad pre-check all skip on `true`.
 */
internal object WpsAdOnlineGateFingerprint : Fingerprint(
    definingClass = "Lcn/wps/moffice/common/ADUtil;",
    name = "l",
    returnType = "Z",
    parameters = emptyList(),
)
