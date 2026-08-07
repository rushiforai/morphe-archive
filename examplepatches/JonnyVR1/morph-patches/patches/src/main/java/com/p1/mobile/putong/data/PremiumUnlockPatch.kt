package com.p1.mobile.putong.data

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.Method

/**
 * Unified premium unlock patch.
 *
 * Anchors every obfuscated class/method by stable behavioral fingerprints
 * (string literals, calls into stable APIs, signature shape) rather than by
 * obfuscated names like `Lp001l/xma;` or `S3`/`u4`/`x4`/... Those names
 * change between Tantan releases but the underlying product semantics do not,
 * so the patches here survive obfuscation churn.
 *
 * Stable, un-obfuscated classes (User, CounterSuperlikeAndUndoLimit,
 * CoreProduct, CoreBusinessServiceIml) keep their classDefForEach dispatch.
 */

private const val RETURN_TRUE = """
    const/4 v0, 0x1
    return v0
"""

private const val RETURN_FALSE = """
    const/4 v0, 0x0
    return v0
"""

// ── Diagnostic logging DISABLED — smali invoke-static caused startup crashes ──
// All LOG_* variants reverted to plain return values (no MorphDebug calls).

private val LOG_AND_RETURN_NULL = """
    const/4 v0, 0x0
    return-object v0
"""

// LOG_XMA_SERVER_REFRESH_NULL removed - xma server refresh patch no longer used
private val LOG_XMA_X3_FALSE = RETURN_FALSE
private val LOG_SWIPE_M_B_FALSE = RETURN_FALSE
private val LOG_TH5_FALSE = RETURN_FALSE
private val LOG_COREPRODUCT_U4_TRUE = RETURN_TRUE
private val LOG_COREPRODUCT_GATE_FALSE = RETURN_FALSE
private val LOG_SB90_FALSE = RETURN_FALSE
// pib.W9() and xma server refresh patches REMOVED - let server calls run normally.
//
// Evolution:
// - null: caused NPE on subscribe → infinite loading
// - Observable.just(roj0.a): emitted Unit but skipped M8 side effects → swipe hung
// - Observable.empty(): completed without emitting → swipe worked but picks blank
// - NO PATCH: let server call run → M8 side effects execute normally
//
// xma server refresh methods (u4/x4) return RxJava Observable (Lrx/c;).
// Patching to null causes NoClassDefFoundError for rx.Observable when calling
// code tries to use the returned value. Let these methods run normally.
//
// RATIONALE: The existing patches to User.isVIP(), isUltraPremium(), isMembership(), etc.
// already check isMe() first and return true for the current user, regardless of what the
// server sends. By letting the server call run:
// 1. Swipe interface works (M8 side effects q9 + Q.y3 execute, updating UI state)
// 2. Picks section shows real data (picksUsers fetched from server)
// 3. Premium status preserved (patched getters return true for current user)
//
// The server response updates User.membership fields, but our patched getter methods
// override the return values for the current user, so premium status is preserved.
private val LOG_XMA_F3_TRUE = RETURN_TRUE
private val LOG_XMA_Y3_TRUE = RETURN_TRUE

private const val RETURN_TRUE_WITH_ME_CHECK = """
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z
    move-result v0
    if-eqz v0, :cond_0
    const/4 v0, 0x1
    return v0
    :cond_0
"""

private const val RETURN_FALSE_WITH_ME_CHECK = """
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z
    move-result v0
    if-eqz v0, :cond_0
    const/4 v0, 0x0
    return v0
    :cond_0
"""

private const val RETURN_NULL_OBJECT = """
    const/4 v0, 0x0
    return-object v0
"""

private const val RETURN_VOID = "return-void"

private const val RETURN_LONG_MAX = """
    const-wide v0, 0x7fffffffffffffffL
    return-wide v0
"""

private const val RETURN_LONG_365 = """
    const-wide/16 v0, 0x16d
    return-wide v0
"""

private const val RETURN_INT_200000 = """
    const v0, 0x30d40
    return v0
"""

private const val RETURN_INT_365 = """
    const v0, 0x16d
    return v0
"""

private const val RETURN_INT_100 = """
    const v0, 0x64
    return v0
"""

private const val RETURN_INT_1 = """
    const v0, 0x1
    return v0
"""

private const val RETURN_INTEGER_200000 = """
    const v0, 0x30d40
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    return-object v0
"""

private const val RETURN_INTEGER_100 = """
    const v0, 0x64
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    return-object v0
"""

private const val RETURN_INTEGER_18 = """
    const v0, 0x12
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    return-object v0
"""

private const val RETURN_INTEGER_1 = """
    const v0, 0x1
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    move-result-object v0
    return-object v0
"""

// 365 days in milliseconds
private val FAR_FUTURE_MS_BODY: String = """
    const-wide v0, 0x66700F60000L
    return-wide v0
"""

private val QGL0_D_BODY: String = """
    if-eqz p0, :qgl0_skip
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;
    if-eqz v0, :qgl0_skip
    iget-wide v1, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->expiredTime:J
    const-wide/16 v3, 0x0
    cmp-long v5, v1, v3
    if-nez v5, :qgl0_skip
    const-wide v1, 0x66700F60000L
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->expiredTime:J
    :qgl0_skip
"""

// PIB_G9_BODY REMOVED for 7.3.3 - pib.g9 no longer references Membership.active field

// pib.S9() and M8() patches removed - can't mock Observable due to classpath issues

private val U59_V_BODY: String = """
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z
    move-result v0
    if-eqz v0, :not_me
    const/4 v0, 0x1
    return v0
    :not_me
    const/4 v0, 0x0
    return v0
"""

private val ZVA0_B0_BODY: String = """
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z
    move-result v0
    if-eqz v0, :not_me
    const/4 v0, 0x2
    return v0
    :not_me
"""

private val GET_VIP_EXPIRE_FAR_FUTURE_BODY: String = """
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z
    move-result v0
    if-eqz v0, :not_me
    const-wide v0, 0x7fffffffffffffffL
    return-wide v0
    :not_me
"""

private val USER_NULL_CHECK_BODY: String = """
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;
    if-nez v0, :status_not_null
    new-instance v0, Ljava/util/ArrayList;
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;
    :status_not_null
"""

// ProfileImagesItemHolder.t(): defensive null-K2 guard
//
// `t()` is the holder's bind method. It reads `User userK2 = O().K2()` and
// then `arrayList.addAll(userK2.pictures)` (NPE site: `iget-object v5, v0,
// User->pictures` at offset ~14 of the original body). On a first-frame
// cache miss, RxJava combineLatest can dispatch the bind call before the
// second source has emitted, so K2() returns null and `t()` NPEs.
//
// Real Tantan doesn't hit this because the production fragment gates the
// bind call behind `viewModel.user.distinctUntilChanged()` etc. — but our
// patches have shifted timing enough that the race is visible in the
// patched build.
//
// Patch shape: load K2() into v1, branch over the original body if null.
// `goto :t_continue` falls through to the original body's first instruction
// when v1 != 0. v1 is overwritten by the original body at offset 5
// (`move-result-object v1` after the second O() call) so no register
// conflict; `.registers 8` stays unchanged.
//
// Mirrors the original bytecode 1:1 (including the `Lp153l/c5m;` interface
// dispatch for K2()) so behavior is byte-identical when K2() != null.
private val PROFILE_IMAGES_NULL_GUARD_BODY: String = """
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->O()Lp153l/a1m;
    move-result-object v0
    invoke-interface {v0}, Lp153l/c5m;->K2()Lcom/p1/mobile/putong/data/User;
    move-result-object v1
    if-eqz v1, :t_early_exit
    goto :t_continue
    :t_early_exit
    return-void
    :t_continue
"""

// ── Class-level fingerprints (resolve obfuscated classes by stable strings /
//    field-access / method-call anchors) ──

// LikeFrom redirect REMOVED — was causing normal match swipes to route through instant match
// server path, resulting in infinite loading and server errors. Normal cards now use the
// standard /relationships/ endpoint without business_type="instantChat".
// Commercial cards (payCardStyle="match") may still have issues but normal swipe interface works.

// Ll/xma; uniquely references "/summarized-privileges?with=diamond" in both
// its u4() and x4() refresh methods. The shorter "/summarized-privileges"
// literal also appears in Lcom/p1/mobile/putong/core/api/a;->o2 (the URL
// builder), so using the bare string makes the class fingerprint ambiguous
// and it sometimes resolves to the URL-builder class instead of xma.
// Anchoring on the "?with=diamond" variant forces a unique match to xma.
private val xmaClassFingerprint = Fingerprint(
    filters = listOf(string("/summarized-privileges?with=diamond")),
)

private val n3b0ClassFingerprint = Fingerprint(
    filters = listOf(
        // n3b0.q() and g() both touch Counter.likersLimit
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/data/Counter;",
            name = "likersLimit",
        ),
    ),
)

private val secretCrushClassFingerprint = Fingerprint(
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/data/Counter;",
            name = "secretCrushLimit",
        ),
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;",
            name = "remaining",
        ),
    ),
)

private val coreDataClassFingerprint = Fingerprint(
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/core/data/CoreData;",
            name = "surpriseGiftExpirationTime",
        ),
    ),
)

private val sb90CompanionClassFingerprint = Fingerprint(
    returnType = "Z",
    parameters = listOf("Lcom/p1/mobile/putong/data/User;"),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/data/User;",
            name = "localRelationship",
            type = "Lcom/p1/mobile/putong/data/Relationship;",
        ),
        string("matched"),
        methodCall(
            definingClass = "Lcom/p1/mobile/putong/data/User;",
            name = "isSupremePartnerOpenMystery",
            parameters = emptyList(),
            returnType = "Z",
        ),
        methodCall(
            definingClass = "Lcom/p1/mobile/putong/data/User;",
            name = "isHideIconFromSVipWithMe",
            parameters = emptyList(),
            returnType = "Z",
        ),
    ),
)

private val u59ClassFingerprint = Fingerprint(
    filters = listOf(
        string("intl_sl_guide_config"),
    ),
)

private val tm90ClassFingerprint = Fingerprint(
    filters = listOf(
        string("intl_good_c_bage_config"),
    ),
)

private val gqf0ClassFingerprint = Fingerprint(
    filters = listOf(
        string("e_intl_spotlight_activity_card"),
    ),
)

private val h6aClassFingerprint = Fingerprint(
    filters = listOf(
        string("ttt_membership_price_diff"),
    ),
)

private val ugc0ClassFingerprint = Fingerprint(
    filters = listOf(
        string("seeUpgradeToPremium"),
    ),
)

private val zva0ClassFingerprint = Fingerprint(
    filters = listOf(
        string("e_vip_banner"),
    ),
)

private val th5ClassFingerprint = Fingerprint(
    filters = listOf(
        string("vas_commercial_card_right_slide_strategy"),
    ),
)

private val qgl0ClassFingerprint = Fingerprint(
    filters = listOf(
        string("暂未激活黑金会员"),
    ),
)

// src0ClassFingerprint removed - class matching issues in 7.3.3

private val sjaClassFingerprint = Fingerprint(
    filters = listOf(
        string("picksUser id is not found in users : "),
    ),
)

// ── CoreBusinessServiceIml: only the first 3 parameter types are stable ──

private val coreBusinessLfFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(
        "Lcom/p1/mobile/android/app/Act;",
        "Ljava/lang/String;",
        "Lcom/p1/mobile/putong/core/data/Privilege;",
        "L",
        "L",
    ),
)

private val coreBusinessR6Fingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(
        "Lcom/p1/mobile/android/app/Act;",
        "Ljava/lang/String;",
        "Lcom/p1/mobile/putong/core/data/Privilege;",
        "L",
        "L",
    ),
)

private val coreBusinessSlFingerprint = Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(
        "Lcom/p1/mobile/android/app/Act;",
        "Ljava/lang/String;",
        "Lcom/p1/mobile/putong/core/data/Privilege;",
        "L",
        "Ljava/lang/Object;",
    ),
)

// ── xma method fingerprints (grouped by behavior) ──

// Expiry-checker (static SummarizedPrivilegesId → Z, calls guessedCurrentServerTime): patch → false
private val xmaS3Fingerprint = Fingerprint(
    classFingerprint = xmaClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;"),
    filters = listOf(methodCall(name = "guessedCurrentServerTime")),
)

// Expiry-reader (static SummarizedPrivilegesId → J): patch → MAX. Matches v3 and w3.
private val xmaV3W3Fingerprint = Fingerprint(
    classFingerprint = xmaClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "J",
    parameters = listOf("Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;"),
)

// Long timestamp wrappers (static no-arg → J). q3 → femaleVip, s3 → limitedTrialSee.
private val xmaQ3Fingerprint = Fingerprint(
    classFingerprint = xmaClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "J",
    parameters = emptyList(),
    filters = listOf(string("femaleVip")),
)

private val xmaS3LongWrapperFingerprint = Fingerprint(
    classFingerprint = xmaClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "J",
    parameters = emptyList(),
    filters = listOf(string("limitedTrialSee")),
)

// Instance expiry check (static UserPrivilege → Z, calls guessedCurrentServerTime): patch → false
private val xmaT3Fingerprint = Fingerprint(
    classFingerprint = xmaClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Lcom/p1/mobile/putong/core/data/UserPrivilege;"),
    filters = listOf(methodCall(name = "guessedCurrentServerTime")),
)

// Purchase expiry (static PurchaseType → Z, loads "unknown_"/"svip"): patch → false
private val xmaA4Fingerprint = Fingerprint(
    classFingerprint = xmaClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Lcom/p1/mobile/putong/core/data/PurchaseType;"),
    filters = listOf(string("unknown_")),
)

// Credit-count methods (static no-arg → I): patch → 200000
private val xmaCreditCountFingerprint = Fingerprint(
    classFingerprint = xmaClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = emptyList(),
)

// ── Other class fingerprints ──

// sja: picks remaining count (static no-arg → I). Matches both r3 and B3.
private val sjaPicksRemainingFingerprint = Fingerprint(
    classFingerprint = sjaClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = emptyList(),
)

// src0WDaysRemainingFingerprint removed

// src0XDaysRemainingFingerprint removed

// gqf0: spotlight pass-through. The single static no-arg Z method (f()) → true.
private val gqf0FFingerprint = Fingerprint(
    classFingerprint = gqf0ClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
)

// h6a: pricing restriction (static no-arg → Z): patch → true.
private val h6aCFingerprint = Fingerprint(
    classFingerprint = h6aClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
)

// u59: regional gates. U/S/O/F/Z/a0/D all gate on IntlCountryCodeController.k()
// (returns true when NOT in a restricted region). We force all to true
// so premium tier availability is unconditional.
private val u59RegionalGateFingerprint = Fingerprint(
    classFingerprint = u59ClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/p1/mobile/putong/ab/IntlCountryCodeController;",
            name = "k",
        ),
    ),
)

// u59.R() — instant-match open-user gate. Unique config key.
private val u59RFingerprint = Fingerprint(
    classFingerprint = u59ClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(string("intl_instantmatch_open_user")),
)

private val u59VFingerprint = Fingerprint(
    classFingerprint = u59ClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Lcom/p1/mobile/putong/data/User;"),
    filters = listOf(methodCall(name = "isUltraPremium")),
)

// ugc0.k(PurchaseType) → true (subscription upgraded).
private val ugc0KFingerprint = Fingerprint(
    classFingerprint = ugc0ClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Lcom/p1/mobile/putong/core/data/PurchaseType;"),
)

// zva0.B0(User) → tier rank (3 = Ultra Premium) when current user, 0 otherwise.
private val zva0B0Fingerprint = Fingerprint(
    classFingerprint = zva0ClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "I",
    parameters = listOf("Lcom/p1/mobile/putong/data/User;"),
    filters = listOf(methodCall(name = "isUltraPremium")),
)

// zva0.S() → true (show banner)
private val zva0SFingerprint = Fingerprint(
    classFingerprint = zva0ClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
)

// th5: any static no-arg Z that references "showPurchaseDialog" → false (d/f/h).
private val th5PurchaseDialogFingerprint = Fingerprint(
    classFingerprint = th5ClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(string("showPurchaseDialog")),
)

// qgl0.d(UserPrivilege) → String: fix expiredTime when 0.
private val qgl0DFingerprint = Fingerprint(
    classFingerprint = qgl0ClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Lcom/p1/mobile/putong/core/data/UserPrivilege;"),
)

// n3b0.q() → false (likers limit not exceeded)
private val n3b0QFingerprint = Fingerprint(
    classFingerprint = n3b0ClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/data/LikersLimit;",
            name = "remaining",
        ),
    ),
)

// n3b0.g() → far-future timestamp
private val n3b0GFingerprint = Fingerprint(
    classFingerprint = n3b0ClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "J",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/data/LikersLimit;",
            name = "expiresTime",
        ),
    ),
)

// n3b0.d(Counter) → sum of BoostLimit.remaining → 200000
private val n3b0BoostRemainingFingerprint = Fingerprint(
    classFingerprint = n3b0ClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf("Lcom/p1/mobile/putong/data/Counter;"),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/data/Counter;",
            name = "boostLimits",
        ),
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/data/BoostLimit;",
            name = "remaining",
        ),
    ),
)

// n3b0.p() → boostLimits.size() > 0 → true
private val n3b0BoostHasFingerprint = Fingerprint(
    classFingerprint = n3b0ClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/data/Counter;",
            name = "boostLimits",
        ),
    ),
)

// n3b0.o() → boost remaining <= 0 → false (boost available)
private val n3b0BoostAvailableFingerprint = Fingerprint(
    classFingerprint = n3b0ClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        methodCall(name = "e"),
    ),
)

// secretCrush: remaining check (static no-arg → Z, reads CounterSecretCrushLimit.remaining) → false
private val secretCrushRemainingFingerprint = Fingerprint(
    classFingerprint = secretCrushClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;",
            name = "remaining",
        ),
    ),
)

// rbb0: Likers limit gate checks - matched directly without class fingerprint
// to avoid ambiguity with other classes that access LikersLimit.remaining

// hl3: Likers dialog creator
// hl3.J(Act, int, CoreLikers$a) creates the full modal dialog with LikersDialogView
// hl3.H(Act, int, List) creates the dialog with photo URLs (no-match variant)
// hl3.L(Act, int) creates the SVIP recover dialog
// Anchored on "p_offline_popup" OMS dialog ID + LikersDialogView method calls
// Resolution in classDefForEach below

// gg50: Dialog strategy for p_offline_popup
// gg50.b() checks if popup should show
// gg50.d() executes the popup display
// Anchored on "p_offline_popup" + j7d0 method calls

// qtk: Return-to-app guide dialog
// qtk.B0() generates "你离开后，仍有 %s 个人喜欢着你" text and shows reBackAppGuideDialog
// Anchored on "reBackAppGuideDialog" string

// CoreSuggested: Likers data source
// CoreSuggested.n8() initiates the likers poll with home_new_liker_float/home_total_liker_float triggers
// This is the ROOT SOURCE of data that feeds all popup chains
// Anchored on "home_new_liker_float" + "home_total_liker_float" strings

// secretCrush: expiration time (static no-arg → J, reads CounterSecretCrushLimit) → far future
private val secretCrushExpirationFingerprint = Fingerprint(
    classFingerprint = secretCrushClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "J",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/data/Counter;",
            name = "secretCrushLimit",
        ),
    ),
)

// coreData: surpriseGiftExpirationTime reader → far future
private val coreDataSurpriseGiftFingerprint = Fingerprint(
    classFingerprint = coreDataClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "J",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/core/data/CoreData;",
            name = "surpriseGiftExpirationTime",
        ),
    ),
)

// sb90 (Companion).c(User) → false. Outer sb90 just delegates, so patching
// Companion alone is sufficient.
private val sb90CFingerprint = Fingerprint(
    classFingerprint = sb90CompanionClassFingerprint,
    returnType = "Z",
    parameters = listOf("Lcom/p1/mobile/putong/data/User;"),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/p1/mobile/putong/data/User;",
            name = "localRelationship",
            type = "Lcom/p1/mobile/putong/data/Relationship;",
        ),
        string("matched"),
        methodCall(
            definingClass = "Lcom/p1/mobile/putong/data/User;",
            name = "isHideIconFromSVipWithMe",
            parameters = emptyList(),
            returnType = "Z",
        ),
    ),
)

// tm90.g(User) → false (no VIP badge override)
private val tm90GFingerprint = Fingerprint(
    classFingerprint = tm90ClassFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf("Lcom/p1/mobile/putong/data/User;"),
)

// pib.g9(String, User) fingerprint REMOVED for 7.3.3
// The g9 method no longer references Membership.active field, so this fingerprint won't match.
// The User.isVIP()/isUltraPremium() patches already override premium status via isMe() checks,
// so this membership flip is no longer needed.

// jh30U0Fingerprint removed — dark upgrade card suppression moved to Pass 2 (jh30ClassFingerprint)
// to handle both Me tab variants (xp30 and xnx) with dynamic getter resolution.

// ── Helpers ──────────────────────────────────────────────────────────────────

private val instructionCache = java.util.WeakHashMap<com.android.tools.smali.dexlib2.iface.Method, List<Instruction>>()

private fun com.android.tools.smali.dexlib2.iface.Method.cachedInstructions(): List<Instruction> =
    instructionCache.getOrPut(this) {
        implementation?.instructions?.toList() ?: emptyList()
    }

internal fun instructionsOf(method: com.android.tools.smali.dexlib2.iface.Method): Iterable<Instruction> =
    method.cachedInstructions()

private fun com.android.tools.smali.dexlib2.iface.Method.callsGuessedCurrentServerTime(): Boolean {
    return cachedInstructions().any { instr ->
        instr is ReferenceInstruction &&
            instr.reference is MethodReference &&
            (instr.reference as MethodReference).name == "guessedCurrentServerTime"
    }
}

private fun com.android.tools.smali.dexlib2.iface.Method.callsU4WithString(): Boolean {
    return try {
        cachedInstructions().any { instr ->
            instr is ReferenceInstruction &&
                instr.reference is MethodReference &&
                (instr.reference as MethodReference).definingClass == "Lcom/p1/mobile/putong/core/api/CoreProduct;" &&
                (instr.reference as MethodReference).parameterTypes.size == 1 &&
                (instr.reference as MethodReference).parameterTypes[0] == "Ljava/lang/String;" &&
                (instr.reference as MethodReference).returnType == "Z"
        }
    } catch (e: Exception) {
        false
    }
}

private fun com.android.tools.smali.dexlib2.iface.Method.hasNegation(): Boolean {
    return try {
        cachedInstructions().any { instr ->
            val opcode = instr.opcode
            opcode.name == "xor-int/lit8" || opcode.name == "not-int"
        }
    } catch (e: Exception) {
        false
    }
}

private fun com.android.tools.smali.dexlib2.iface.Method.callsMethodNamed(methodName: String): Boolean {
    return try {
        cachedInstructions().any { instr ->
            instr is ReferenceInstruction &&
                instr.reference is MethodReference &&
                (instr.reference as MethodReference).name == methodName
        }
    } catch (e: Exception) {
        false
    }
}

private fun com.android.tools.smali.dexlib2.iface.Method.isStaticSummarizedPrivilegesIdReturnBool(): Boolean =
    AccessFlags.PUBLIC.isSet(accessFlags) &&
        AccessFlags.STATIC.isSet(accessFlags) &&
        returnType == "Z" &&
        parameterTypes.size == 1 &&
        parameterTypes[0] == "Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;"

private fun com.android.tools.smali.dexlib2.iface.Method.isStaticUserPrivilegeReturnBool(): Boolean =
    AccessFlags.PUBLIC.isSet(accessFlags) &&
        AccessFlags.STATIC.isSet(accessFlags) &&
        returnType == "Z" &&
        parameterTypes.size == 1 &&
        parameterTypes[0] == "Lcom/p1/mobile/putong/core/data/UserPrivilege;"

private fun com.android.tools.smali.dexlib2.iface.Method.isStaticNoArgReturnBool(): Boolean =
    AccessFlags.PUBLIC.isSet(accessFlags) &&
        AccessFlags.STATIC.isSet(accessFlags) &&
        returnType == "Z" &&
        parameterTypes.isEmpty()

private fun com.android.tools.smali.dexlib2.iface.Method.containsString(str: String): Boolean =
    cachedInstructions().any { instr ->
        instr is ReferenceInstruction &&
            instr.reference is StringReference &&
            (instr.reference as StringReference).string == str
    }

private fun com.android.tools.smali.dexlib2.iface.Method.instructionCount(): Int =
    cachedInstructions().size

private fun com.android.tools.smali.dexlib2.iface.ClassDef.containsString(str: String): Boolean =
    methods.any { method ->
        instructionsOf(method).any { instr ->
            instr is ReferenceInstruction &&
                instr.reference is StringReference &&
                (instr.reference as StringReference).string == str
        }
    }

private fun com.android.tools.smali.dexlib2.iface.ClassDef.callsMethod(
    definingClass: String? = null,
    name: String? = null,
    returnType: String? = null,
): Boolean = methods.any { method ->
    instructionsOf(method).any { instr ->
        instr is ReferenceInstruction &&
            instr.reference is MethodReference &&
            (definingClass == null || (instr.reference as MethodReference).definingClass == definingClass) &&
            (name == null || (instr.reference as MethodReference).name == name) &&
            (returnType == null || (instr.reference as MethodReference).returnType == returnType)
    }
}

private fun com.android.tools.smali.dexlib2.iface.ClassDef.accessesField(
    definingClass: String? = null,
    name: String? = null,
): Boolean = methods.any { method ->
    instructionsOf(method).any { instr ->
        instr is ReferenceInstruction &&
            instr.reference is com.android.tools.smali.dexlib2.iface.reference.FieldReference &&
            (definingClass == null || (instr.reference as com.android.tools.smali.dexlib2.iface.reference.FieldReference).definingClass == definingClass) &&
            (name == null || (instr.reference as com.android.tools.smali.dexlib2.iface.reference.FieldReference).name == name)
    }
}



// ── Patch ────────────────────────────────────────────────────────────────────

@Suppress("unused")
@JvmField
val premiumUnlockPatch = bytecodePatch(
    name = "Premium Unlock",
    description = "Unlocks all premium features, tier statuses, subscription validation, and display",
    default = true,
) {
    compatibleWith(tantanCompatibility)
    execute {
        // ----------------------------------------------------------------------
        // Pass 1: Stable classes — O(1) direct lookups via classDefByOrNull
        // ----------------------------------------------------------------------
            // ── User: stable, real method names (no obfuscation) ──────────────
            //
            // We patch methods directly here (no fingerprint) because the same
            // `Fingerprint._matchOrNull` cache trap as in CoreProduct would
            // cause `matchOrNull(method)` to return the first match in each
            // set (e.g. isUltraPremium) for every subsequent call (e.g.
            // isSupremePartner), so only the first method in each `setOf(...)`
            // would actually get patched.
            classDefByOrNull(TANTAN_USER_CLASS)?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    when {
                        method.name in setOf("isUltraPremium", "isSupremePartner") &&
                            method.parameterTypes.isEmpty() && method.returnType == "Z" -> {
                            method.addInstructions(0, RETURN_TRUE_WITH_ME_CHECK)
                        }
                         // isVIP/isSVIP/isPlatinum: Ultra Premium is a superset that includes all
                         // VIP/SVIP/Platinum features. The app uses isVIP() as a baseline premium
                         // check across 50+ call sites (hide-last-seen, super likes, roaming, etc.).
                         // Returning FALSE broke all those features. Badge display (zva0.B0()) checks
                         // isUltraPremium() FIRST, so returning TRUE here doesn't affect badge precedence.
                         method.name in setOf("isVIP", "isSVIP", "isPlatinum") &&
                             method.parameterTypes.isEmpty() && method.returnType == "Z" -> {
                             method.addInstructions(0, RETURN_TRUE_WITH_ME_CHECK)
                         }
                        method.name in setOf("gpHideVip", "isHideIconFromSVipWithMe") &&
                            method.parameterTypes.isEmpty() && method.returnType == "Z" -> {
                            method.addInstructions(0, RETURN_FALSE_WITH_ME_CHECK)
                        }

                        method.name == "isVIPExpired" &&
                            method.parameterTypes.isEmpty() && method.returnType == "Z" -> {
                            method.addInstructions(0, RETURN_FALSE)
                        }
                        method.name == "isVIPUsed" &&
                            method.parameterTypes.isEmpty() && method.returnType == "Z" -> {
                            method.addInstructions(0, RETURN_TRUE_WITH_ME_CHECK)
                        }
                        method.name in setOf("getVipExpireTime", "getVipToExpireTimeInMill") &&
                            method.parameterTypes.isEmpty() && method.returnType == "J" -> {
                            method.addInstructions(0, GET_VIP_EXPIRE_FAR_FUTURE_BODY)
                        }
                        method.name == "isMembership" -> {
                            method.addInstructions(0, RETURN_TRUE_WITH_ME_CHECK)
                        }
                         method.name == "isMembershipUsed" -> {
                             method.addInstructions(0, RETURN_FALSE_WITH_ME_CHECK)
                         }
                         method.name in setOf("isPicVerificationVerified", "isIdCardVerified", "isStudentVerified", "isIdAndPicBothVerified") &&
                             method.parameterTypes.isEmpty() && method.returnType == "Z" -> {
                             method.addInstructions(0, RETURN_TRUE)
                         }
                        method.name == "isODiamond" &&
                            method.parameterTypes.isEmpty() && method.returnType == "Z" -> {
                            method.addInstructions(0, RETURN_TRUE_WITH_ME_CHECK)
                        }
                        method.name == "isBlackDiamondVIP" &&
                            method.parameterTypes.isEmpty() && method.returnType == "Z" -> {
                            method.addInstructions(0, RETURN_TRUE_WITH_ME_CHECK)
        // ── Messages tab promotional content suppression ──────────────────────

        // ConversationHeadRecommendLayout.f0(): data source for head carousel
        // Fetches friend suggestions from server via CoreModule.f18264c.f20384f0.m34147ug()
        // Patching to return Observable.just(null) prevents carousel from receiving promotional data
        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "f0" && method.parameterTypes.size == 1 &&
                    method.parameterTypes[0] == "Ljava/lang/String;" &&
                    method.returnType == "Lp137rx/C22421c;") {
                    method.addInstructions(0, """
                        const/4 v0, 0x0
                        invoke-static {v0}, Lp137rx/C22421c;->just(Ljava/lang/Object;)Lp137rx/C22421c;
                        move-result-object v0
                        return-object v0
                    """)
                }
            }
        }

        // ConversationRecommendItemView.X(): bind method for carousel item
        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "X" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // RecommendNormalUserView.a0(): bind method for normal user carousel item
        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "a0" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // ConversationAllPairItemView.Z(): bind method for pair carousel item
        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "Z" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // ConversationMatchItemLayout.P(): bind method for match carousel item
        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "P" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // ConversationSuperBoostItemView.D0(): bind method for super boost carousel item
        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/messages/ConversationSuperBoostItemView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "D0" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // ConversationHeadBackUserTipLayout.z(): bind method for back user tip carousel item
        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadBackUserTipLayout;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "z" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // ConversationCityCentreCardLayout.l(): bind method for city centre card carousel item
        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/messages/ConversationCityCentreCardLayout;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "l" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // NewMatchItemLayout.o(): bind method for new match carousel item
        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/messages/recommend/view/NewMatchItemLayout;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "o" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // ConversationItemUserStatesView.i(): bind method for user states conversation item (type 16)
        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/messages/ConversationItemUserStatesView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "i" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // ConversationFoldView.T(): bind method for fold conversation item (type 39)
        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/messages/ConversationFoldView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "T" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // IntlVisitorConversationView.m0(): bind method for visitor conversation item (type 48)
        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/messages/business/IntlVisitorConversationView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "m0" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // PrivilegePromotionHeaderView.d(): loads promotional image, prevents display
        // PrivilegePromotionHeaderView.e(): updates promotion text, prevents display
        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/messages/promotion/PrivilegePromotionHeaderView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name in setOf("d", "e") && method.parameterTypes.isEmpty() && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

    }
}
                 }
             }

            // ── CoreProduct: stable class, obfuscated methods ──────────────────
            //
            // NOTE: We deliberately do NOT use `coreProductZ4Fingerprint.matchOrNull(method)`
            // or `coreProductU4Fingerprint.matchOrNull(method)` here. Those overloads
            // share a global per-Fingerprint-instance cache (`_matchOrNull`) — the first
            // call to match a method caches the Match, and every subsequent call returns
            // the cached Match regardless of the method passed in. Iterating
            // classDef.methods.forEach { matchOrNull(it) } therefore patches only the
            // FIRST matching method (A4 in this case) and silently leaves B4/y4/T4/Q4/
            // z4/R4/L4/O4/P4 untouched. Those gates then keep returning their original
            // values — B4()/y4() keep calling u4("vip") which our u4-patch forces to
            // TRUE, so the "send message" / "see who liked me" purchase dialogs open
            // and crash with NPE on `FreeTrialData.titleText` (r0 was never populated).
            //
            // Since we've already narrowed to a single stable class, we can filter and
            // patch directly via `mutableClassDefBy(classDef).methods` (which returns
            // MutableMethod instances — the only type with `addInstructions(String)`).
            classDefByOrNull("Lcom/p1/mobile/putong/core/api/CoreProduct;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    when {
                        // u4(String) — the only public final Z(String) method
                        method.parameterTypes.size == 1 &&
                            method.parameterTypes[0] == "Ljava/lang/String;" &&
                            method.returnType == "Z" &&
                            AccessFlags.FINAL.isSet(method.accessFlags) -> {
                            method.addInstructions(0, LOG_COREPRODUCT_U4_TRUE)
                        }
                        // Upgrade dialog gates (A4, B4, Q4, y4, z4) — these call u4(String)
                        // with specific strings and should return FALSE to prevent upgrade dialogs.
                        // They have a simple structure: invoke u4(String) and return the result.
                        method.parameterTypes.isEmpty() &&
                            method.returnType == "Z" &&
                            AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                            method.callsU4WithString() -> {
                            method.addInstructions(0, LOG_COREPRODUCT_GATE_FALSE)
                        }
                        // X4(PurchaseType) → false (no purchase needed)
                        method.name == "X4" &&
                            method.parameterTypes.size == 1 &&
                            method.parameterTypes[0] == "Lcom/p1/mobile/putong/core/data/PurchaseType;" &&
                            method.returnType == "Z" -> {
                            method.addInstructions(0, RETURN_FALSE)
                        }
                        // Feature/data gates (L4, O4, P4, R4, T4) — these have different behavior
                        // and should NOT be patched. Leave them unpatched to preserve original behavior.
                    }
                }
            }

            // ── CounterSuperlikeAndUndoLimit: stable class, stable methods ────
            // (Direct patch — see CoreProduct note about the matchOrNull cache trap.)
            classDefByOrNull("Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name in setOf("remainToday", "remainAll") &&
                        method.parameterTypes.isEmpty() && method.returnType == "I"
                    ) {
                        method.addInstructions(0, RETURN_INT_200000)
                    }
                }
            }

            // ── ProfileImagesItemHolder.t(): defensive null-K2 guard ────────
            //
            // Stable CamelCase class, but `t()` is the obfuscated bind name.
            // Filter by signature (name == "t", no params, V return) — single
            // method match. Uses direct `mutableClassDefBy().methods.forEach`
            // to avoid the matchOrNull(method) cache trap (AGENTS.md §1b).
            classDefByOrNull("Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "t" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "V"
                    ) {
                        method.addInstructions(0, PROFILE_IMAGES_NULL_GUARD_BODY)
                    }
                }
            }

            // ── CoreBusinessServiceIml: stable class, obfuscated param types ──
            classDefByOrNull("Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;")?.let { classDef ->
                coreBusinessLfFingerprint.matchOrNull(classDef)?.let { match ->
                    match.method.addInstructions(0, RETURN_VOID)
                }
                coreBusinessR6Fingerprint.matchOrNull(classDef)?.let { match ->
                    match.method.addInstructions(0, RETURN_VOID)
                }
                coreBusinessSlFingerprint.matchOrNull(classDef)?.let { match ->
                    match.method.addInstructions(0, RETURN_VOID)
                }
                // Ai(Act) → true: allows boost activation (Gate 3 in f93.y())
                // Original: hardcoded `return false` — blocks actual boost activation.
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "Ai" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Lcom/p1/mobile/android/app/Act;" &&
                        method.returnType == "Z"
                    ) {
                        method.addInstructions(0, RETURN_TRUE)
                    }
                }
            }

            // ── Instant Match regional gate: REMOVED ──
            // Hardcoded descriptor Lcom/p1/mobile/putong/core/ui/match/a; is obfuscated in 7.3.3
            // and doesn't match the actual class in the APK. This patch would need fingerprint-based
            // discovery to work correctly. Removed to fix test failures.

            // ── Swipe right purchase dialog: REMOVED ──
            // Hardcoded descriptor Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/m; is obfuscated
            // in 7.3.3 and doesn't match the actual class in the APK. This patch would need fingerprint-based
            // discovery to work correctly. Removed to fix test failures.

            // ── Me tab affiliate discount entry banner: CoreIntlAffiliatePromotions.M3() ──
            //
            // The Me tab shows an affiliate discount banner driven by server-side promotion
            // data, NOT user tier. M3() checks if there's a cached IapAffiliatePromotion
            // for the given tab. Patching to FALSE hides ALL discount entry banners
            // (ME_TAB, MESSAGE_TAB, WHISPER_TAB, etc.) — desired for premium unlock.
            classDefByOrNull("Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "M3" &&
                        method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Lcom/p1/mobile/putong/core/api/CoreIntlAffiliatePromotions\$IntlAffiliateDiscountEntryTab;" &&
                        method.returnType == "Z"
                    ) {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                }
            }

            // ── Me tab profile privilege pay guide: ProfilePrivilegePayGuide.l0() ──
            //
            // The Me tab shows a profile privilege pay guide banner driven by server-side
            // IntlTabMePayGuide data. l0() checks if the guide was clicked within a time
            // window. Patching to FALSE makes the banner think it was already dismissed.
            classDefByOrNull("Lcom/p1/mobile/putong/core/newui/profile/newme/ProfilePrivilegePayGuide;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "l0" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "Z"
                    ) {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                }
            }

            // ── Me tab dark upgrade card suppression moved to Pass 2 ──
            // Uses jh30ClassFingerprint to avoid scanning every class in Pass 1

            // ── Daily like limit bypass: REMOVED ──
            // Hardcoded descriptors for h0, l1, m1 are obfuscated in 7.3.3 and don't match
            // the actual classes in the APK. These patches would need fingerprint-based
            // discovery to work correctly. Removed to fix test failures.

            // ── CoreProviderImpl.Er(): infinite loading fix ──
            //
            // CoreProviderImpl.Er() is hardcoded to return false, causing pib.q9()
            // to skip processing user data, leading to infinite loading.
            // Patching to return true allows pib.q9() to pass the guard condition
            // and call pa() to process user data.
            classDefByOrNull("Lcom/p1/mobile/putong/core/module/CoreProviderImpl;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "Er" &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "Z"
                    ) {
                        method.addInstructions(0, RETURN_TRUE)
                    }
                }
            }

            // ── Live streaming permissions: LiveAssertApi ──
            //
            // LiveAssertApi gates client-side live streaming capabilities:
            //   - isCanStartLive(): ability to start live streams
            //   - getCanUseMaskMode(): anonymous/mask mode in live streams
            //   - isUserStartVoiceLiveEnable(): voice live streaming capability
            // All three are static no-arg → Z. Patching to TRUE unlocks all live features.
            classDefByOrNull("Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name in setOf("isCanStartLive", "getCanUseMaskMode", "isUserStartVoiceLiveEnable") &&
                        method.parameterTypes.isEmpty() &&
                        method.returnType == "Z" &&
                        AccessFlags.STATIC.isSet(method.accessFlags)
                    ) {
                        method.addInstructions(0, RETURN_TRUE)
                    }
                }
            }

            // ── Search filter expansion + ultra premium flag: Settings ──
            classDefByOrNull("Lcom/p1/mobile/putong/data/Settings;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    when {
                        method.name == "getRadiusAllowedMaximum" &&
                            method.parameterTypes.isEmpty() &&
                            method.returnType == "Ljava/lang/Integer;" -> {
                            method.addInstructions(0, RETURN_INTEGER_200000)
                        }
                        method.name == "getRadiusAllowedMinimum" &&
                            method.parameterTypes.isEmpty() &&
                            method.returnType == "Ljava/lang/Integer;" -> {
                            method.addInstructions(0, RETURN_INTEGER_1)
                        }
                        method.name == "getSearchAgeAllowedMaximum" &&
                            method.parameterTypes.isEmpty() &&
                            method.returnType == "Ljava/lang/Integer;" -> {
                            method.addInstructions(0, RETURN_INTEGER_100)
                        }
                        method.name == "getSearchAgeAllowedMinimum" &&
                            method.parameterTypes.isEmpty() &&
                            method.returnType == "Ljava/lang/Integer;" -> {
                            method.addInstructions(0, RETURN_INTEGER_18)
                        }
                        method.name == "userIsODiamond" &&
                            method.parameterTypes.isEmpty() &&
                            method.returnType == "Z" -> {
                            method.addInstructions(0, RETURN_TRUE)
                        }
                        method.name == "getSearchRadius" &&
                            method.parameterTypes.isEmpty() &&
                            method.returnType == "Ljava/lang/Integer;" -> {
                            method.addInstructions(0, RETURN_INTEGER_200000)
                        }
                        method.name == "getSearchMaxAge" &&
                            method.parameterTypes.isEmpty() &&
                            method.returnType == "Ljava/lang/Integer;" -> {
                            method.addInstructions(0, RETURN_INTEGER_100)
                        }
                        method.name == "getSearchMinAge" &&
                            method.parameterTypes.isEmpty() &&
                            method.returnType == "Ljava/lang/Integer;" -> {
                            method.addInstructions(0, RETURN_INTEGER_18)
                        }
                        method.name == "isCityTop" &&
                            method.parameterTypes.isEmpty() &&
                            method.returnType == "Z" -> {
                            method.addInstructions(0, RETURN_TRUE)
                        }
                        method.name == "isPlatinum" &&
                            method.parameterTypes.isEmpty() &&
                            method.returnType == "Z" -> {
                            method.addInstructions(0, RETURN_TRUE)
                        }
                        method.name == "isSupremePartner" &&
                            method.parameterTypes.isEmpty() &&
                            method.returnType == "Z" -> {
                            method.addInstructions(0, RETURN_TRUE)
                        }
                        method.name == "isSupremePartnerOpenMystery" &&
                            method.parameterTypes.isEmpty() &&
                            method.returnType == "Z" -> {
                            method.addInstructions(0, RETURN_TRUE)
                        }
                    }
                }
            }

            // ── CoreProduct.S4(PurchaseType): no purchase needed ──
            // Merged with CoreProduct u4/gate patch above (single classDefByOrNull lookup)

            // ── BLiveCoin: REMOVED ──
            // Previously attempted to patch new_() factory to set available field to Long.MAX_VALUE.
            // Caused startup crashes due to register allocation issues (const-wide requires 2 registers,
            // but the method likely only has .registers 2, making v2 out of bounds).
            // Virtual currency is server-validated anyway, so local patching is ineffective.

            // ── Boost remaining count: BoostRemainingCountView ──
            //
            // getBoostLimitCount() sums BoostLimit.remaining across all boost types.
            // Patching to return 200000 makes the UI show unlimited boost availability.
            classDefByOrNull("Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.parameterTypes.isEmpty() &&
                        method.returnType == "I" &&
                        AccessFlags.PRIVATE.isSet(method.accessFlags)
                    ) {
                        method.addInstructions(0, RETURN_INT_200000)
                    }
                }
            }

            // ── Boost remaining count: LikersBoostRemainingCountView ──
            //
            // Same pattern as BoostRemainingCountView — getBoostLimitCount() sums
            // BoostLimit.remaining. Patch to 200000 for unlimited display.
            classDefByOrNull("Lcom/p1/mobile/putong/core/newui/home/LikersBoostRemainingCountView;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.parameterTypes.isEmpty() &&
                        method.returnType == "I" &&
                        AccessFlags.PRIVATE.isSet(method.accessFlags)
                    ) {
                        method.addInstructions(0, RETURN_INT_200000)
                    }
                }
            }

            // ── Meet entrance banner strategies: d9y, l8y, g9y ──
            //
            // The conversations tab shows teaser banners like "X girls Y miles away just liked you".
            // Multiple strategy classes (d9y, l8y, g9y, z8y) implement the bzl interface and each has
            // a c() method that gates visibility. In 7.3.3, xma and joa are the same class, so
            // patching joa.i4() alone isn't sufficient — we patch the banner strategies directly.
            // d9y: "X people new liked you" banner (gates on joa.i4() && newLikersUser != null)
            // l8y: "Unlock X people who like me" fallback banner (gates on !joa.M3() && totalLikersUsers != null)
            // g9y: "Who viewed me" banner (gates on joa.G3() && visitorData != null)
            // z8y: "Nearby girls" banner (gates on !joa.M3() && nearbyUser != null)
            // NOTE: Package is p153l (not Ll) in 7.3.3 - JADX renaming trap
            listOf("Lp153l/d9y;", "Lp153l/l8y;", "Lp153l/g9y;", "Lp153l/z8y;").forEach { descriptor ->
                classDefByOrNull(descriptor)?.let { classDef ->
                    mutableClassDefBy(classDef).methods.forEach { method ->
                        if (method.name == "c" &&
                            method.parameterTypes.isEmpty() &&
                            method.returnType == "Z"
                        ) {
                            method.addInstructions(0, RETURN_FALSE)
                        }
                    }
                }
            }

            // ── b8d0: Business entrance state manager singleton ──
            // This is the ROOT CAUSE of the persistent "x girls y miles away" banner.
            // b8d0 manages banner visibility state independently via MMKV and Observable.
            // Server responses set flags via zt6.S0() and lke0.G(), which update b8d0 state.
            // BusinessConversationView.init() checks b8d0.m102970g() to decide visibility.
            // CoreBusinessServiceIml calls b8d0.m102964d()/m102967j() to generate text.
            // We patch ALL b8d0 methods to prevent any banner display.
            // NOTE: Package is p153l (not Ll) in 7.3.3 - JADX renaming trap
            classDefByOrNull("Lp153l/b8d0;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    // Static text generation methods → return empty CharSequence
                    // m102964d(User, User) → CharSequence (delegates to m102965e)
                    if (method.name == "d" && method.parameterTypes.size == 2 && method.returnType == "Ljava/lang/CharSequence;" &&
                        AccessFlags.STATIC.isSet(method.accessFlags)) {
                        method.addInstructions(0, """
                            const-string v0, ""
                            return-object v0
                        """)
                    }
                    // m102965e(User, User) → CharSequence (actual implementation)
                    if (method.name == "e" && method.parameterTypes.size == 2 && method.returnType == "Ljava/lang/CharSequence;" &&
                        AccessFlags.STATIC.isSet(method.accessFlags)) {
                        method.addInstructions(0, """
                            const-string v0, ""
                            return-object v0
                        """)
                    }
                    // m102967j(int) → CharSequence ("X people liked you")
                    if (method.name == "j" && method.parameterTypes.size == 1 && method.returnType == "Ljava/lang/CharSequence;" &&
                        AccessFlags.STATIC.isSet(method.accessFlags)) {
                        method.addInstructions(0, """
                            const-string v0, ""
                            return-object v0
                        """)
                    }
                    // Instance state management methods
                    // m102970g() → boolean (checks if banner should show based on last show time)
                    if (method.name == "g" && method.parameterTypes.isEmpty() && method.returnType == "Z" &&
                        !AccessFlags.STATIC.isSet(method.accessFlags)) {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                    // m102971i() → void (sets last show time in MMKV)
                    if (method.name == "i" && method.parameterTypes.isEmpty() && method.returnType == "V" &&
                        !AccessFlags.STATIC.isSet(method.accessFlags)) {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    // m102972k(int) → void (sets new likes count)
                    if (method.name == "k" && method.parameterTypes.size == 1 && method.returnType == "V" &&
                        !AccessFlags.STATIC.isSet(method.accessFlags)) {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    // m102973l(boolean) → void (sets "today new likes changed" flag)
                    if (method.name == "l" && method.parameterTypes.size == 1 && method.returnType == "V" &&
                        !AccessFlags.STATIC.isSet(method.accessFlags)) {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }

            // ── zt6.S0(): Server data flag setter ──
            // zt6.S0(boolean) is called when server responses arrive.
            // It sets b8d0.f75421b = true and emits on b8d0.f75420a observable.
            // This allows server responses to trigger banner display even after our b8d0 patches.
            // We patch S0() to return-void to prevent server data from activating the banner.
            // NOTE: Package is p153l (not Ll) in 7.3.3 - JADX renaming trap
            classDefByOrNull("Lp153l/zt6;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "S0" && method.parameterTypes.size == 1 && method.returnType == "V") {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }

            // ── lke0.G(): "New likes changed" flag setter ──
            // lke0.G(bkj0) is called when CoreLikers data updates.
            // It calls b8d0.m102963b().m102973l(true) to mark "today new likes changed".
            // This triggers banner display in BusinessConversationView.
            // We patch G() to return-void to prevent the flag from being set.
            // NOTE: Package is p153l (not Ll) in 7.3.3 - JADX renaming trap
            classDefByOrNull("Lp153l/lke0;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "G" && method.parameterTypes.size == 1 && method.returnType == "V") {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }

            // ── b240 and kfe0 patches moved to Pass 2 (fingerprint-based) ──
            // Hardcoded descriptors (Lp153l/b240;, Lp153l/kfe0;) don't match actual DEX.
            // Using fingerprint-based discovery instead.

            // ── tje0.c(): Distance/age text generation for dialogs ──
            // tje0.c(User, Context, int[]) generates the "x girls y miles away" text for dialogs.
            // It's used by LikersDialogView and other promotional dialogs.
            // We patch c() to return empty CharSequence to prevent the text from being displayed.
            // NOTE: Package is p153l (not Ll) in 7.3.3 - JADX renaming trap
            classDefByOrNull("Lp153l/tje0;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "c" && method.parameterTypes.size == 3 && method.returnType == "Ljava/lang/CharSequence;" &&
                        AccessFlags.STATIC.isSet(method.accessFlags)) {
                        method.addInstructions(0, """
                            const-string v0, ""
                            return-object v0
                        """)
                    }
                }
            }

            // ── e230.b(): NewLikeView dialog strategy check ──
            // e230.b(p8l.C19323a) checks if the NewLikeView dialog should be shown.
            // It's registered in the home dialog queue by dal.m115127e().
            // Even though NewLikeView.E() is patched to return-void, we also patch e230.b()
            // to return false to prevent the dialog from even being considered.
            // NOTE: Package is p153l (not Ll) in 7.3.3 - JADX renaming trap
            classDefByOrNull("Lp153l/e230;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "b" && method.parameterTypes.size == 1 && method.returnType == "Z" &&
                        !AccessFlags.STATIC.isSet(method.accessFlags)) {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                }
            }

            // ── Messages tab promotional content suppression ──
            // Moved to Pass 2 using fingerprint-based discovery (see below)
            // The old hardcoded class descriptors (Ll/qa9;, Ll/hva;, etc.) don't exist in the APK.
            // Suppresses the "x girls just liked you" promotional dialog that appears on app launch
            classDefByOrNull("Lcom/p1/mobile/putong/core/ui/seepop/NewLikeView;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "E" && method.parameterTypes.size == 3 && method.returnType == "V") {
                        method.addInstructions(0, "return-void")
                    }
                }
            }

            // ConversationHeadLikerItemLayout: u(Act, C8266c) → return-void
            // Suppresses the "X+ people liked you" banner in the head recommend carousel
            classDefByOrNull("Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadLikerItemLayout;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "u" && method.parameterTypes.size == 2 && method.returnType == "V") {
                        method.addInstructions(0, "return-void")
                    }
                }
            }

            // ConversationHeadIntlSeeItem: L(C8265b) + K(C4870a) + M(int) → return-void
            // Suppresses the "See who liked you" / "Tap to respond" banner in the head recommend carousel
            // L() sets up click listener and subscribes to CoreLikers.S6() observable
            // K() is the callback that sets text on the views (title, subtitle, count)
            // M() sets the count text on the auto-fit text view (called from K when count <= 0)
            classDefByOrNull("Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadIntlSeeItem;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "L" && method.parameterTypes.size == 1 && method.returnType == "V") {
                        method.addInstructions(0, "return-void")
                    }
                    if (method.name == "K" && method.parameterTypes.size == 1 && method.returnType == "V") {
                        method.addInstructions(0, "return-void")
                    }
                    if (method.name == "M" && method.parameterTypes.size == 1 && method.returnType == "V") {
                        method.addInstructions(0, "return-void")
                    }
                }
            }

            // TODO: ViewTreeObserverOnGlobalLayoutListenerC8017b was renamed to ViewTreeObserverOnGlobalLayoutListenerC0351b
            // and moved to an inner class in com/p1/mobile/putong/feed/ui/moments/b.java
            // The old descriptor no longer exists. Needs fingerprint-based discovery to re-enable.
            // ── ViewTreeObserverOnGlobalLayoutListenerC8017b.u6(): Bubble display method ──
            // This is the FINAL method that renders the floating "x girls y miles away" bubble.
            // It calls act().m7() to display the bubble on screen.
            // Patching u6() to return-void prevents ANY bubble from being displayed, regardless
            // of which code path (u7, k8, w7) created it.
            // classDefByOrNull("Lcom/p1/mobile/putong/core/newui/home/ViewTreeObserverOnGlobalLayoutListenerC8017b;")?.let { classDef ->
            //     mutableClassDefBy(classDef).methods.forEach { method ->
            //         if (method.name == "u6" && method.parameterTypes.size == 8 && method.returnType == "V" &&
            //             !AccessFlags.STATIC.isSet(method.accessFlags)) {
            //             method.addInstructions(0, RETURN_VOID)
            //         }
            //     }
            // }

            // n1b0: Profile page "See who liked me" banner
            // Suppresses the banner that appears on the profile page
            classDefByOrNull("Lp153l/n1b0;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    // mo53912l() - visibility check → FALSE
                    if (method.name == "l" && method.parameterTypes.isEmpty() && method.returnType == "Z") {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                    // mo53914t() - text display → void
                    if (method.name == "t" && method.parameterTypes.isEmpty() && method.returnType == "V") {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }

            // ela0: Suggested users banner
            // Suppresses the "See who liked me" suggested users banner
            classDefByOrNull("Lp153l/ela0;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    // mo39153B() - text display → void
                    if (method.name == "B" && method.parameterTypes.size == 4 && method.returnType == "V") {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }

            // ip40: Me tab banner
            // Suppresses the banner click handler that navigates to LikersAct
            classDefByOrNull("Lp153l/ip40;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    // m141441g1() - banner click handler → void
                    if (method.name == "g1" && method.parameterTypes.isEmpty() && method.returnType == "V") {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }

            // jcp: Business conversation controller
            // Suppresses the business conversation banner display
            classDefByOrNull("Lp153l/jcp;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    // mo144365L() - display method → void
                    if (method.name == "L" && method.parameterTypes.isEmpty() && method.returnType == "V") {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    // mo144366M() - hide method → void
                    if (method.name == "M" && method.parameterTypes.isEmpty() && method.returnType == "V") {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }

            // IntlMeetLikersNewLikersView: Suppress "New like" section in intlmeet
            // Shows "x more girls liked you" / "x more people liked you" promotional content
            classDefByOrNull("Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersNewLikersView;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    // e(afo) - data binding method that populates the view
                    if (method.name == "e" && method.parameterTypes.size == 1 && method.returnType == "V") {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }

            // MeetLikersNewLikersView: Suppress "New like" section in meet
            // Similar promotional content for non-international meet section
            classDefByOrNull("Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersView;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    // e(afo) - data binding method that populates the view
                    if (method.name == "e" && method.parameterTypes.size == 1 && method.returnType == "V") {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }

            // LikersNewLikeBubble: Suppress animated floating bubble
            // Shows animated "new like" notifications that float on screen
            classDefByOrNull("Lcom/p1/mobile/putong/core/p053ui/vip/likers/LikersNewLikeBubble;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    // d() and e() - animation show/dismiss methods
                    if (method.name in setOf("d", "e") && method.parameterTypes.isEmpty() && method.returnType == "V") {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }

            // IntlMeetLikersNewLikersItem: Suppress individual new liker item binding in intlmeet
            classDefByOrNull("Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersNewLikersItem;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "S" && method.parameterTypes.size == 1 && method.parameterTypes[0] == "Lcom/p1/mobile/putong/data/User;" && method.returnType == "V") {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }

            // MeetLikersNewLikersItem: Suppress individual new liker item binding in meet
            classDefByOrNull("Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "T" && method.parameterTypes.size == 1 && method.parameterTypes[0] == "Lcom/p1/mobile/putong/data/User;" && method.returnType == "V") {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }

            // CoreSuggested: Likers data source - n8() initiates the likers poll
            classDefByOrNull("Lcom/p1/mobile/putong/core/api/CoreSuggested;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "n8" && method.parameterTypes.isEmpty() &&
                        (method.returnType.startsWith("Lrx/") || method.returnType.startsWith("Lio/reactivex/"))) {
                        method.addInstructions(0, """
                            invoke-static {}, Lrx/c;->a()Lrx/c;
                            move-result-object v0
                            return-object v0
                        """)
                    }
                }
            }

            // FakeLikersAct: Suppress fake likers activity launch
            classDefByOrNull("Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersAct;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "Y1" && AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.size == 2 && method.returnType == "Landroid/content/Intent;") {
                        method.addInstructions(0, """
                            const/4 v0, 0x0
                            return-object v0
                        """)
                    }
                    if (method.name == "a2" && AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.size == 2 && method.returnType == "V") {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }

            // FakeLikersItem: Suppress fake liker item binding
            classDefByOrNull("Lcom/p1/mobile/putong/core/ui/seepage/likers/FakeLikersItem;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "k" && method.parameterTypes.size == 2 && method.parameterTypes[0] == "Lcom/p1/mobile/putong/data/User;" && method.returnType == "V") {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    if (method.name == "l" && method.parameterTypes.size == 1 && method.parameterTypes[0] == "Lcom/p1/mobile/putong/data/User;" && method.returnType == "V") {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }

            // IntlFakeLikersItem: Suppress international fake liker item binding
            classDefByOrNull("Lcom/p1/mobile/putong/core/ui/seepage/likers/IntlFakeLikersItem;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "i" && method.parameterTypes.size == 1 && method.parameterTypes[0] == "Lcom/p1/mobile/putong/data/User;" && method.returnType == "V") {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }

            // IntlMeetFakeLikersItem: Suppress international meet fake liker item binding
            classDefByOrNull("Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetFakeLikersItem;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "n" && method.parameterTypes.size == 2 && method.returnType == "V") {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }

            // MeetPromotionItemView: Suppress promotion item display
            classDefByOrNull("Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetPromotionItemView;")?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "m" && method.parameterTypes.size == 2 && method.returnType == "V") {
                        method.addInstructions(0, RETURN_VOID)
                    }
                    if (method.name == "o" && method.parameterTypes.size == 1 && method.parameterTypes[0] == "I" && method.returnType == "V") {
                        method.addInstructions(0, RETURN_VOID)
                    }
                }
            }

            // DATA LAYER PATCHES - String formatter
            // Patch the string formatter that creates "people liked you" text
            // Anchored on the string "people liked you"
            val wid0StringFormatterFingerprint = Fingerprint(
                filters = listOf(string("people liked you")),
            )
            wid0StringFormatterFingerprint.matchOrNull()?.classDef?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    if (method.name == "j" && method.parameterTypes.size == 1 && method.parameterTypes[0] == "I" && method.returnType == "Ljava/lang/CharSequence;") {
                        method.addInstructions(0, """
                            const-string v0, ""
                            return-object v0
                        """)
                    }
                }
            }
            
            // ConversationsList adapter: Enhanced view hiding for promotional types
            // Instead of just setVisibility(GONE), also set height to 0 to prevent ListView from allocating space
            // This is more reliable than just GONE in ListView context
            
            // ConversationsList$e.getItemViewType() patch removed:
            // The previous smali patch had critical bugs:
            // 1. Used Conversation.convType instead of DbObject.id (wrong field)
            // 2. NPE when convType was null
            // 3. Returning view type 0 for fake conversations caused ClassCastException
            //    when the adapter tried to bind fake conversations as normal conversation views
            // Promotional items are now hidden by view-level patches (set GONE + zero height)
            // on each ConversationItem*View class, which is safe and doesn't interfere with
            // the adapter's view type mapping.

            // ConversationItem views: data-driven hiding
            val convItemHideBody = """
                const/16 v0, 0x8
                invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V
                const/4 v0, 0x0
                invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumHeight(I)V
                invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumWidth(I)V
                return-void
            """
            val convItemHideTargets = listOf(
                "Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;" to setOf("k"),
                "Lcom/p1/mobile/putong/core/newui/messages/ConversationItemReceiveLikeView;" to setOf("k"),
                "Lcom/p1/mobile/putong/core/newui/messages/ConversationItemInstantChatGuideView;" to setOf("m"),
                "Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;" to setOf("e"),
                "Lcom/p1/mobile/putong/core/newui/messages/ConversationItemSurpriseBoxEntrance;" to setOf("f"),
                "Lcom/p1/mobile/putong/core/newui/messages/ConversationItemProfileLikeEntrance;" to setOf("i"),
                "Lcom/p1/mobile/putong/core/newui/messages/ConversationItemPlatinumPinLike;" to setOf("q"),
                "Lcom/p1/mobile/putong/core/newui/messages/ConversationItemFriendMoments;" to setOf("o", "p", "q"),
                "Lcom/p1/mobile/putong/core/newui/messages/ConversationItemTeamGroup;" to setOf("o"),
                "Lcom/p1/mobile/putong/core/newui/messages/ConversationWeakenView;" to setOf("d0"),
            )
            convItemHideTargets.forEach { (descriptor, methodNames) ->
                classDefByOrNull(descriptor)?.let { classDef ->
                    mutableClassDefBy(classDef).methods.forEach { method ->
                        if (method.name in methodNames && method.returnType == "V") {
                            method.addInstructions(0, convItemHideBody)
                        }
                        if (method.name in setOf("getSubFrontText", "getSubContentText") &&
                            method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/String;") {
                            method.addInstructions(0, """
                                const-string v0, ""
                                return-object v0
                            """)
                        }
                        if (method.name == "o" && method.parameterTypes.isEmpty() && method.returnType == "V") {
                            method.addInstructions(0, "return-void")
                        }
                    }
                }
            }

        // ----------------------------------------------------------------------
        // Pass 2: Batch resolution of obfuscated class fingerprints
        // ----------------------------------------------------------------------

        val resolved = mutableMapOf<String, com.android.tools.smali.dexlib2.iface.ClassDef>()

        val anchorStrings = setOf(
            "/summarized-privileges?with=diamond",
            "intl_receive_like_guide_get", "receive_like_guide_get",
            "fake_conversation_surprise_gift_box", "fake_conversation_profile_like_enter",
            "fake_conversation_greeting", "conversation_feed_state", "meet_entrance",
            "fake_conversation_local_instant_chat_conversation", "fake_conversation_anonymous_greeting",
            "fake_conversation_local_team_group_conversation", "fake_conversation_local_limited_trial_see_fold",
            "intlSeeChatRequest", "intl_chat_request_insert_users", "fake_conversation_oof_pick",
            "matched", "intl_sl_guide_config", "intl_good_c_bage_config",
            "e_intl_spotlight_activity_card", "ttt_membership_price_diff", "seeUpgradeToPremium",
            "e_vip_banner", "vas_commercial_card_right_slide_strategy", "暂未激活黑金会员",
            "picksUser id is not found in users : ", "open_fill_info_debug",
            "fromWhoLikedMe", "e_red_dot_message_see",
            "%s people liked you", "MeetLikersNewLikersData", "IntlMeetLikersNewLikersData",
        )
        val anchorFieldNames = setOf(
            "likersLimit", "secretCrushLimit", "surpriseGiftExpirationTime",
            "TYPE_ROAMING_PKG", "INTL_SEE_ANIM_BUBBLE", "SEE_ANIM",
            "localRelationship",
        )
        val anchorMethodNames = setOf(
            "S6", "u6", "isSupremePartnerOpenMystery", "isHideIconFromSVipWithMe",
            "isVIP", "d", "clear", "isUltraPremium",
        )

        classDefForEach { classDef ->
            if (resolved.size == 47) return@classDefForEach

            val classType = classDef.type
            val isSettingsUi = classType.startsWith("Lcom/p1/mobile/putong/core/ui/settings/")

            val strings = mutableSetOf<String>()
            val methodCallFull = mutableSetOf<String>()
            val methodCallNames = mutableSetOf<String>()
            val fieldAccessFull = mutableSetOf<String>()
            val fieldNames = mutableSetOf<String>()
            val methodCallSigs = mutableSetOf<String>()
            val methodCallFullSigs = mutableSetOf<String>()
            val methodNameRet = mutableSetOf<String>()
            var hasZUserMethod = false

            classDef.methods.forEach { method ->
                if (method.returnType == "Z" && method.parameterTypes.size == 1 && method.parameterTypes[0] == "Lcom/p1/mobile/putong/data/User;") {
                    hasZUserMethod = true
                }
                instructionsOf(method).forEach { instr ->
                    if (instr is ReferenceInstruction) {
                        when (val ref = instr.reference) {
                            is StringReference -> {
                                strings.add(ref.string)
                            }
                            is MethodReference -> {
                                methodCallNames.add(ref.name)
                                methodCallFull.add("${ref.definingClass}.${ref.name}")
                                val sig = "${ref.name}.${ref.parameterTypes.size}.${ref.returnType}"
                                methodCallSigs.add(sig)
                                methodCallFullSigs.add("${ref.definingClass}.$sig")
                                methodNameRet.add("${ref.name}\u0001${ref.returnType}")
                            }
                            is FieldReference -> {
                                fieldAccessFull.add("${ref.definingClass}.${ref.name}")
                                fieldNames.add(ref.name)
                            }
                        }
                    }
                }
            }

            val hasAnchorString = strings.any { it in anchorStrings }
            val hasAnchorField = fieldNames.any { it in anchorFieldNames }
            val hasAnchorMethod = methodCallNames.any { it in anchorMethodNames }

            if (!hasAnchorString && !hasAnchorField && !hasAnchorMethod) return@classDefForEach

            val hasConvNew_ = "Lcom/p1/mobile/putong/core/data/Conversation;.new_.0.Lcom/p1/mobile/putong/core/data/Conversation;" in methodCallFullSigs

            if ("xma" !in resolved && !isSettingsUi && "/summarized-privileges?with=diamond" in strings) resolved["xma"] = classDef
            if ("qa9" !in resolved && "intl_receive_like_guide_get" in strings && hasConvNew_) resolved["qa9"] = classDef
            if ("hva" !in resolved && "receive_like_guide_get" in strings && hasConvNew_) resolved["hva"] = classDef
            if ("coreApiFakeConv" !in resolved && "fake_conversation_surprise_gift_box" in strings && hasConvNew_) resolved["coreApiFakeConv"] = classDef
            if ("profileLikeEnter" !in resolved && "fake_conversation_profile_like_enter" in strings && hasConvNew_) resolved["profileLikeEnter"] = classDef
            if ("greetingFakeConv" !in resolved && "fake_conversation_greeting" in strings && hasConvNew_) resolved["greetingFakeConv"] = classDef
            if ("feedStateFakeConv" !in resolved && "conversation_feed_state" in strings && hasConvNew_) resolved["feedStateFakeConv"] = classDef
            if ("meetEntranceBanner" !in resolved && "meet_entrance" in strings && "w.0.V" in methodCallSigs) resolved["meetEntranceBanner"] = classDef
            if ("instantChatGuide" !in resolved && "fake_conversation_local_instant_chat_conversation" in strings && hasConvNew_) resolved["instantChatGuide"] = classDef
            if ("mainUiFakeConv" !in resolved && "fake_conversation_anonymous_greeting" in strings && hasConvNew_) resolved["mainUiFakeConv"] = classDef
            if ("coreApiTeamGroup" !in resolved && "fake_conversation_local_team_group_conversation" in strings && hasConvNew_) resolved["coreApiTeamGroup"] = classDef
            if ("coreApiLimitedTrialFold" !in resolved && "fake_conversation_local_limited_trial_see_fold" in strings && hasConvNew_) resolved["coreApiLimitedTrialFold"] = classDef
            if ("intlSeeChatRequestCreator" !in resolved && "intlSeeChatRequest" in strings && hasConvNew_) resolved["intlSeeChatRequestCreator"] = classDef
            if ("r8n" !in resolved && "intl_chat_request_insert_users" in strings) resolved["r8n"] = classDef
            if ("headRecommendAdapter" !in resolved && "fake_conversation_profile_like_enter" in strings && "fake_conversation_oof_pick" in strings && "getItemViewType.1.I" in methodCallSigs) resolved["headRecommendAdapter"] = classDef
            if ("seeAnimBubbleCreator" !in resolved && "Lcom/p1/mobile/putong/core/api/CoreLikers;.S6" in methodCallFull && "u7\u0001V" in methodNameRet && "Lcom/p051p1/mobile/putong/core/p058ui/poplevel/CorePopLevel;.INTL_SEE_ANIM_BUBBLE" in fieldAccessFull) resolved["seeAnimBubbleCreator"] = classDef
            // TODO: seeAnimBubbleLifecycle fingerprint disabled - old descriptor no longer exists
            // if ("seeAnimBubbleLifecycle" !in resolved && "Lcom/p1/mobile/putong/core/newui/home/ViewTreeObserverOnGlobalLayoutListenerC8017b;.u6" in methodCallFull && "Lcom/p051p1/mobile/putong/core/newui/home/bubble/MagicBubble;.SEE_ANIM" in fieldAccessFull) resolved["seeAnimBubbleLifecycle"] = classDef
            // bubbleDisplayMethod: ViewTreeObserverOnGlobalLayoutListenerC8017b was renamed to C0351b - needs fingerprint-based discovery
            if ("sb90Companion" !in resolved && !isSettingsUi && "Lcom/p1/mobile/putong/data/User;.localRelationship" in fieldAccessFull && "matched" in strings && "Lcom/p1/mobile/putong/data/User;.isSupremePartnerOpenMystery" in methodCallFull && "Lcom/p1/mobile/putong/data/User;.isHideIconFromSVipWithMe" in methodCallFull && hasZUserMethod) resolved["sb90Companion"] = classDef
            if ("u59" !in resolved && !isSettingsUi && "intl_sl_guide_config" in strings) resolved["u59"] = classDef
            if ("tm90" !in resolved && !isSettingsUi && "intl_good_c_bage_config" in strings) resolved["tm90"] = classDef
            if ("gqf0" !in resolved && !isSettingsUi && "e_intl_spotlight_activity_card" in strings) resolved["gqf0"] = classDef
            if ("h6a" !in resolved && !isSettingsUi && "ttt_membership_price_diff" in strings) resolved["h6a"] = classDef
            if ("ugc0" !in resolved && !isSettingsUi && "seeUpgradeToPremium" in strings) resolved["ugc0"] = classDef
            if ("zva0" !in resolved && !isSettingsUi && "e_vip_banner" in strings) resolved["zva0"] = classDef
            if ("th5" !in resolved && !isSettingsUi && "vas_commercial_card_right_slide_strategy" in strings) resolved["th5"] = classDef
            if ("qgl0" !in resolved && !isSettingsUi && "暂未激活黑金会员" in strings) resolved["qgl0"] = classDef
            // src0 resolution removed
            if ("sja" !in resolved && !isSettingsUi && "picksUser id is not found in users : " in strings) resolved["sja"] = classDef
            if ("n3b0" !in resolved && !isSettingsUi && "Lcom/p1/mobile/putong/data/Counter;.likersLimit" in fieldAccessFull) resolved["n3b0"] = classDef
            // rbb0: Likers limit gate checks (q/r/s methods)
            // Anchored on LikersLimit.remaining field access + has static Z methods
            if ("rbb0" !in resolved && !isSettingsUi && "Lcom/p1/mobile/putong/data/LikersLimit;.remaining" in fieldAccessFull) {
                val hasStaticZWithCounter = classDef.methods.any { 
                    it.returnType == "Z" && 
                    AccessFlags.STATIC.isSet(it.accessFlags) && 
                    it.parameterTypes.size == 1 && 
                    it.parameterTypes[0] == "Lcom/p1/mobile/putong/data/Counter;"
                }
                if (hasStaticZWithCounter) resolved["rbb0"] = classDef
            }
            
            // hl3: Likers dialog creator
            // hl3.J(Act, int, CoreLikers$a) creates the full modal dialog with LikersDialogView
            // Anchored on "p_offline_popup" OMS dialog ID + LikersDialogView method calls
            if ("hl3" !in resolved && "p_offline_popup" in strings &&
                methodCallFull.any { it.contains("LikersDialogView") }) {
                resolved["hl3"] = classDef
            }
            
            // j7d0: Dialog orchestrator
            // j7d0.h0(b240) orchestrates the likers dialog display
            // Anchored on "last_likers_req_time" + "offline_dialog_show_time" strings
            if ("j7d0" !in resolved && "last_likers_req_time" in strings &&
                "offline_dialog_show_time" in strings &&
                methodCallFull.any { it.contains("hl3") }) {
                resolved["j7d0"] = classDef
            }
            
            // gg50: Dialog strategy for p_offline_popup
            // gg50.b() checks if popup should show, gg50.d() executes display
            // Anchored on "p_offline_popup" + j7d0.h0() method call
            if ("gg50" !in resolved && "p_offline_popup" in strings &&
                methodCallFull.any { it.contains("j7d0") && it.contains(".h0") }) {
                resolved["gg50"] = classDef
            }
            
            // qtk: Return-to-app guide dialog
            // qtk.B0() generates "你离开后，仍有 %s 个人喜欢着你" text
            // Anchored on "reBackAppGuideDialog" string
            if ("qtk" !in resolved && "reBackAppGuideDialog" in strings &&
                methodCallFull.any { it.contains("hlh0") }) {
                resolved["qtk"] = classDef
            }
            
            if ("secretCrush" !in resolved && !isSettingsUi && "Lcom/p1/mobile/putong/data/Counter;.secretCrushLimit" in fieldAccessFull && "Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;.remaining" in fieldAccessFull) resolved["secretCrush"] = classDef
            if ("coreData" !in resolved && !isSettingsUi && "Lcom/p1/mobile/putong/core/data/CoreData;.surpriseGiftExpirationTime" in fieldAccessFull) resolved["coreData"] = classDef
            if ("mb90" !in resolved && !isSettingsUi && "Lcom/p1/mobile/putong/data/User;.isVIP" in methodCallFull && "Lcom/p1/mobile/putong/core/data/PurchaseType;.TYPE_ROAMING_PKG" in fieldAccessFull && !classDef.type.contains("/ui/settings/")) {
                val hasPurchaseTypeZ = classDef.methods.any { it.parameterTypes.size == 1 && it.parameterTypes[0] == "Lcom/p1/mobile/putong/core/data/PurchaseType;" && it.returnType == "Z" }
                if (hasPurchaseTypeZ) resolved["mb90"] = classDef
            }
            // joa removed: in 7.3.3 xma and joa are the same class, xma patch handles these methods
            if ("jh30" !in resolved && "Lcom/p1/mobile/putong/core/newui/profile/newme/NewProfilePrivilegedPager;.d" in methodCallFull) resolved["jh30"] = classDef
            if ("businessEntranceAdapter" !in resolved && "open_fill_info_debug" in strings && "clear" in methodCallNames) resolved["businessEntranceAdapter"] = classDef

            // pm6: fromWhoLikedMe gate check for international version
            // pm6.f(Conversation) checks if conversation is a "fromWhoLikedMe" type
            // Used by ConversationItemHeadView to show "liked me" icon
            // Anchored on stable string "fromWhoLikedMe"
            if ("pm6" !in resolved && "fromWhoLikedMe" in strings &&
                "Lcom/p1/mobile/putong/core/data/Conversation;.property" in fieldAccessFull &&
                methodCallFull.any { it.contains("isFemale") }) {
                resolved["pm6"] = classDef
            }

            // bhe0: Business entrance navigation and analytics
            // bhe0.d() navigates to LikersAct/IntlMeetAct
            // bhe0.e()/f() fire analytics events for red dot
            // Anchored on stable string "e_red_dot_message_see"
            if ("bhe0" !in resolved && "e_red_dot_message_see" in strings &&
                "Lcom/p1/mobile/putong/core/newui/messages/business/BusinessEntranceStyle;" in methodCallFullSigs) {
                resolved["bhe0"] = classDef
            }

            // vqo, re90, i0p: Banner text generators for "x people liked you"
            // These classes generate promotional text independently of b8d0
            val hasCharSeqM = classDef.methods.any { it.name == "m" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/CharSequence;" }
            val hasCharSeqN = classDef.methods.any { it.name == "n" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/CharSequence;" }
            
            if (hasCharSeqM && hasCharSeqN) {
                val hasPairReturn = classDef.methods.any { it.returnType == "Landroid/util/Pair;" }
                val hasVPairMethod = classDef.methods.any { it.name == "v" && it.returnType == "Landroid/util/Pair;" }
                val hasCoreLikersCall = methodCallFull.any { it.startsWith("Lcom/p1/mobile/putong/core/api/CoreLikers;.") }
                val hasGStringReturn = methodCallFullSigs.any { it.contains(".G.") && it.endsWith(".Ljava/lang/String;") }
                
                // vqo: has method v() returning Pair + calls G() for number formatting
                if ("vqo" !in resolved && hasVPairMethod && hasGStringReturn) {
                    resolved["vqo"] = classDef
                }
                // re90: accesses CoreLikers + no Pair return (base class)
                else if ("re90" !in resolved && hasCoreLikersCall && !hasPairReturn) {
                    resolved["re90"] = classDef
                }
                // i0p: extends re90 (check superclass)
                else if ("i0p" !in resolved && hasCoreLikersCall && classDef.superclass?.contains("re90") == true) {
                    resolved["i0p"] = classDef
                }
            }

            // ajy: MeetLikersNewLikersData - has getNewLikersCount() returning int
            // Anchored on stable string "MeetLikersNewLikersData" in toString()
            if ("meetNewLikersData" !in resolved && "MeetLikersNewLikersData" in strings &&
                classDef.methods.any { it.parameterTypes.isEmpty() && it.returnType == "I" && it.name != "hashCode" }) {
                resolved["meetNewLikersData"] = classDef
            }

            // ano: IntlMeetLikersNewLikersData - has newLikersCount field
            // Anchored on stable string "IntlMeetLikersNewLikersData" in toString()
            if ("intlMeetNewLikersData" !in resolved && "IntlMeetLikersNewLikersData" in strings &&
                classDef.methods.any { it.parameterTypes.isEmpty() && it.returnType == "I" && it.name != "hashCode" }) {
                resolved["intlMeetNewLikersData"] = classDef
            }

            // zmo: IntlMeetLikersNewLikersAdapter - calls IntlMeetLikersNewLikersItem.S()
            // Anchored on method call to stable CamelCase class
            if ("intlMeetNewLikersAdapter" !in resolved &&
                methodCallFull.any { it.contains("Lcom/p1/mobile/putong/core/newui/intlmeet/likers/items/IntlMeetLikersNewLikersItem;") }) {
                resolved["intlMeetNewLikersAdapter"] = classDef
            }

            // ziy: MeetLikersNewLikersAdapter - calls MeetLikersNewLikersItem.T()
            // Anchored on method call to stable CamelCase class
            if ("meetNewLikersAdapter" !in resolved &&
                methodCallFull.any { it.contains("Lcom/p1/mobile/putong/core/newui/meet/likers/items/MeetLikersNewLikersItem;") }) {
                resolved["meetNewLikersAdapter"] = classDef
            }
        }

        resolved["xma"]?.let { xmaClassDef ->
            val mutableXma = mutableClassDefBy(xmaClassDef)
            val s3StyleKeys = setOf(
                "unlimitedSwipes", "roaming", "superLikeMembership", "undoMembership", "seeWhoLikedMe",
                "message_read_state", "top_like", "top_chat", "premium_compliment",
                "city_topping", "exclusive_dressing_up", "leave_message",
                "live_entry_animation", "block_harassing_words",
                "hide_me_from_nearby", "visitor_hide_footprint", "nearby_people",
            )
            val negatedKeys = setOf("ultraPremium", "platinum")
            val singleMethodKeys = mapOf(
                "svip" to false,
                "vip" to false,
                "intlReadMessage" to true,
                "revokeUnPair" to false
            )

            mutableXma.methods.forEach { method ->
                if (!AccessFlags.PUBLIC.isSet(method.accessFlags) || !AccessFlags.STATIC.isSet(method.accessFlags)) return@forEach
                when {
                    method.returnType == "Z" && method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;" &&
                        method.callsGuessedCurrentServerTime() -> {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                    method.returnType == "J" && method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;" -> {
                        method.addInstructions(0, RETURN_LONG_MAX)
                    }
                    method.returnType == "Z" && method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Lcom/p1/mobile/putong/core/data/UserPrivilege;" &&
                        method.callsGuessedCurrentServerTime() -> {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                    method.returnType == "Z" && method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Lcom/p1/mobile/putong/core/data/PurchaseType;" &&
                        method.containsString("unknown_") -> {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                    method.isStaticSummarizedPrivilegesIdReturnBool() -> {
                        method.addInstructions(0, RETURN_TRUE)
                    }
                    method.isStaticUserPrivilegeReturnBool() -> {
                        method.addInstructions(0, RETURN_TRUE)
                    }
                    method.returnType == "J" && method.parameterTypes.isEmpty() && method.containsString("femaleVip") -> {
                        method.addInstructions(0, RETURN_LONG_MAX)
                    }
                    method.returnType == "J" && method.parameterTypes.isEmpty() && method.containsString("limitedTrialSee") -> {
                        method.addInstructions(0, RETURN_LONG_MAX)
                    }
                    method.returnType == "I" && method.parameterTypes.isEmpty() -> {
                        method.addInstructions(0, RETURN_INT_200000)
                    }
                    method.returnType == "Z" && method.parameterTypes.isEmpty() && method.containsString("oDiamond") -> {
                        when {
                            method.hasNegation() -> method.addInstructions(0, LOG_XMA_F3_TRUE)
                            method.callsMethodNamed("c4") -> method.addInstructions(0, LOG_XMA_Y3_TRUE)
                            else -> method.addInstructions(0, LOG_XMA_X3_FALSE)
                        }
                    }
                    method.returnType == "Z" && method.parameterTypes.isEmpty() -> {
                        when {
                            method.callsMethodNamed("h5") -> method.addInstructions(0, RETURN_TRUE)
                            method.callsMethodNamed("TEnum") -> method.addInstructions(0, RETURN_FALSE)
                            negatedKeys.any { method.containsString(it) } && method.hasNegation() -> method.addInstructions(0, RETURN_TRUE)
                            s3StyleKeys.any { method.containsString(it) } -> method.addInstructions(0, RETURN_FALSE)
                            else -> {
                                singleMethodKeys.entries.firstOrNull { (key, _) -> method.containsString(key) }?.let { (_, returnValue) ->
                                    method.addInstructions(0, if (returnValue) RETURN_TRUE else RETURN_FALSE)
                                }
                            }
                        }
                    }
                }
            }
        }

        resolved["qa9"]?.let { qa9ClassDef ->
            mutableClassDefBy(qa9ClassDef).methods.forEach { method ->
                if (method.name == "D3" && method.parameterTypes == listOf("Ljava/lang/String;", "J") && method.returnType == "V") {
                    method.addInstructions(0, "return-void")
                }
                if (method.name == "w3" && method.parameterTypes.isEmpty() && method.returnType == "V") {
                    method.addInstructions(0, "return-void")
                }
                if (method.name == "C3" && method.parameterTypes == listOf("Ljava/lang/String;", "J") && method.returnType == "V") {
                    method.addInstructions(0, "return-void")
                }
                if (method.name == "J3" && method.parameterTypes == listOf("Ljava/lang/String;") && method.returnType == "V") {
                    method.addInstructions(0, "return-void")
                }
                if (method.name == "E3" && method.parameterTypes == listOf("Ljava/lang/String;") && method.returnType == "V") {
                    method.addInstructions(0, "return-void")
                }
                if (method.name == "y3" && method.parameterTypes.size == 2 && method.returnType == "V") {
                    method.addInstructions(0, "return-void")
                }
            }
        }

        resolved["hva"]?.let { hvaClassDef ->
            mutableClassDefBy(hvaClassDef).methods.forEach { method ->
                if (method.name == "u3" && method.parameterTypes.isEmpty() && method.returnType == "V") {
                    method.addInstructions(0, "return-void")
                }
                if (method.name == "E3" && method.parameterTypes.size == 2 && method.returnType == "V") {
                    method.addInstructions(0, "return-void")
                }
            }
        }

        resolved["coreApiFakeConv"]?.let { coreApiClassDef ->
            mutableClassDefBy(coreApiClassDef).methods.forEach { method ->
                if (method.name == "Xb" && method.parameterTypes.size == 2 && method.returnType == "V") {
                    method.addInstructions(0, "return-void")
                }
                if (method.name == "o7" && method.parameterTypes.size == 1 && method.returnType == "V") {
                    method.addInstructions(0, "return-void")
                }
                if (method.name == "Ti" && method.parameterTypes.size == 4 && method.returnType == "V") {
                    method.addInstructions(0, "return-void")
                }
            }
        }

        resolved["profileLikeEnter"]?.let { profileLikeEnterClassDef ->
            mutableClassDefBy(profileLikeEnterClassDef).methods.forEach { method ->
                if (method.name == "n3" && method.parameterTypes.isEmpty() && method.returnType == "V") {
                    method.addInstructions(0, "return-void")
                }
            }
        }

        resolved["greetingFakeConv"]?.let { greetingClassDef ->
            mutableClassDefBy(greetingClassDef).methods.forEach { method ->
                if (method.name == "Q3" && method.parameterTypes.isEmpty() && method.returnType == "V") {
                    method.addInstructions(0, "return-void")
                }
            }
        }

        resolved["feedStateFakeConv"]?.let { feedStateClassDef ->
            mutableClassDefBy(feedStateClassDef).methods.forEach { method ->
                if (method.name == "o3" && method.parameterTypes.size == 1 && method.returnType == "V") {
                    method.addInstructions(0, "return-void")
                }
            }
        }

        resolved["meetEntranceBanner"]?.let { meetEntranceClassDef ->
            mutableClassDefBy(meetEntranceClassDef).methods.forEach { method ->
                if (method.name == "w" && method.parameterTypes.isEmpty() && method.returnType == "V") {
                    method.addInstructions(0, "return-void")
                }
            }
        }

        resolved["instantChatGuide"]?.let { instantChatClassDef ->
            mutableClassDefBy(instantChatClassDef).methods.forEach { method ->
                if (method.name == "n3" && method.parameterTypes.size == 1 && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        resolved["mainUiFakeConv"]?.let { mainUiClassDef ->
            mutableClassDefBy(mainUiClassDef).methods.forEach { method ->
                if (method.name in setOf("Q3", "Xb", "o7") && method.parameterTypes.isEmpty() && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        resolved["coreApiTeamGroup"]?.let { teamGroupClassDef ->
            mutableClassDefBy(teamGroupClassDef).methods.forEach { method ->
                if (method.name == "n3" && method.parameterTypes.size == 1 && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        resolved["coreApiLimitedTrialFold"]?.let { limitedTrialClassDef ->
            mutableClassDefBy(limitedTrialClassDef).methods.forEach { method ->
                if (method.name == "n3" && method.parameterTypes.size == 1 && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        resolved["intlSeeChatRequestCreator"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "Vi" && method.parameterTypes.size == 1 && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
                if (method.name == "Wi" && method.parameterTypes.size == 1 && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        resolved["r8n"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "g" && method.parameterTypes.size == 1 &&
                    method.parameterTypes[0] == "Ljava/util/List;" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // headRecommendAdapter patch removed: returning 0 for all view types causes ClassCastException
        // when the carousel adapter tries to bind fake conversations to normal conversation view holders.
        // Promotional content in the head recommend carousel is already suppressed by:
        // - ConversationHeadLikerItemLayout.u() → return-void
        // - ConversationHeadIntlSeeItem.L()/K()/M() → return-void

        resolved["seeAnimBubbleCreator"]?.let { bubbleCreatorClassDef ->
            mutableClassDefBy(bubbleCreatorClassDef).methods.forEach { method ->
                // Patch z2() - subscription state handler (static method)
                // DEX name is "z2" (JADX renames to m101873z2)
                if (method.name == "z2" && method.parameterTypes.size == 1 && method.returnType == "V" &&
                    AccessFlags.STATIC.isSet(method.accessFlags)) {
                    method.addInstructions(0, RETURN_VOID)
                }
                // Patch u7() - "new likers" bubble creator (instance method)
                // DEX name is "u7" (JADX renames to m102077u7)
                if (method.name == "u7" && method.parameterTypes.size == 1 && method.returnType == "V" &&
                    !AccessFlags.STATIC.isSet(method.accessFlags)) {
                    method.addInstructions(0, RETURN_VOID)
                }
                // Patch k8() - "total likers" bubble creator (instance method, returns boolean)
                // DEX name is "k8" (JADX renames to m102036k8)
                if (method.name == "k8" && method.parameterTypes.size == 1 && method.returnType == "Z" &&
                    !AccessFlags.STATIC.isSet(method.accessFlags)) {
                    method.addInstructions(0, RETURN_FALSE)
                }
                // Patch w7() - "suggested users" bubble path (instance method)
                // DEX name is "w7" (JADX renames to m102085w7)
                if (method.name == "w7" && method.parameterTypes.size == 1 && method.returnType == "V" &&
                    !AccessFlags.STATIC.isSet(method.accessFlags)) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        resolved["seeAnimBubbleLifecycle"]?.let { bubbleLifecycleClassDef ->
            mutableClassDefBy(bubbleLifecycleClassDef).methods.forEach { method ->
                if (method.name == "A" && method.parameterTypes.isEmpty() && method.returnType == "I" &&
                    !AccessFlags.STATIC.isSet(method.accessFlags)) {
                    method.addInstructions(0, """
                        const/4 v0, 0x0
                        return v0
                    """)
                }
            }
        }

        // bubbleDisplayMethod: ViewTreeObserverOnGlobalLayoutListenerC8017b was renamed to C0351b
        // Patch disabled - needs fingerprint-based discovery (see TODO in Pass 1)

        resolved["sja"]?.let { sjaClassDef ->
            sjaPicksRemainingFingerprint.matchAll(sjaClassDef, 1..5).forEach { match ->
                match.method.addInstructions(0, RETURN_INT_200000)
            }
        }

        // src0 patch removed

        resolved["gqf0"]?.let { gqf0ClassDef ->
            gqf0FFingerprint.matchOrNull(gqf0ClassDef)?.let { match ->
                match.method.addInstructions(0, RETURN_TRUE)
            }
        }

        resolved["h6a"]?.let { h6aClassDef ->
            h6aCFingerprint.matchOrNull(h6aClassDef)?.let { match ->
                match.method.addInstructions(0, RETURN_TRUE)
            }
        }

        resolved["u59"]?.let { u59ClassDef ->
            mutableClassDefBy(u59ClassDef).methods.forEach { method ->
                if (!AccessFlags.PUBLIC.isSet(method.accessFlags) || !AccessFlags.STATIC.isSet(method.accessFlags)) return@forEach
                when {
                    method.returnType == "Z" && method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Lcom/p1/mobile/putong/data/User;" &&
                        method.callsMethodNamed("isUltraPremium") -> {
                        method.addInstructions(0, U59_V_BODY)
                    }
                    method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                        method.cachedInstructions().any { it is ReferenceInstruction && it.reference is MethodReference &&
                            (it.reference as MethodReference).definingClass == "Lcom/p1/mobile/putong/ab/IntlCountryCodeController;" &&
                            (it.reference as MethodReference).name == "k" } -> {
                        method.addInstructions(0, RETURN_TRUE)
                    }
                    method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                        method.containsString("intl_instantmatch_open_user") -> {
                        method.addInstructions(0, RETURN_TRUE)
                    }
                }
            }
        }

        resolved["ugc0"]?.let { ugc0ClassDef ->
            ugc0KFingerprint.matchOrNull(ugc0ClassDef)?.let { match ->
                match.method.addInstructions(0, RETURN_TRUE)
            }
        }

        resolved["zva0"]?.let { zva0ClassDef ->
            zva0B0Fingerprint.matchOrNull(zva0ClassDef)?.let { match ->
                match.method.addInstructions(0, ZVA0_B0_BODY)
            }
            zva0SFingerprint.matchOrNull(zva0ClassDef)?.let { match ->
                match.method.addInstructions(0, RETURN_TRUE)
            }
        }

        resolved["th5"]?.let { th5ClassDef ->
            th5PurchaseDialogFingerprint.matchAll(th5ClassDef, 1..10).forEach { match ->
                match.method.addInstructions(0, LOG_TH5_FALSE)
            }
        }

        resolved["qgl0"]?.let { qgl0ClassDef ->
            qgl0DFingerprint.matchOrNull(qgl0ClassDef)?.let { match ->
                match.method.addInstructions(0, QGL0_D_BODY)
            }
        }

        resolved["n3b0"]?.let { n3b0ClassDef ->
            mutableClassDefBy(n3b0ClassDef).methods.forEach { method ->
                if (!AccessFlags.STATIC.isSet(method.accessFlags)) return@forEach
                val instrs = method.cachedInstructions()
                when {
                    method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                        instrs.any { it is ReferenceInstruction && it.reference is FieldReference &&
                            (it.reference as FieldReference).definingClass == "Lcom/p1/mobile/putong/data/LikersLimit;" &&
                            (it.reference as FieldReference).name == "remaining" } -> {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                    method.returnType == "J" && method.parameterTypes.isEmpty() &&
                        instrs.any { it is ReferenceInstruction && it.reference is FieldReference &&
                            (it.reference as FieldReference).definingClass == "Lcom/p1/mobile/putong/data/LikersLimit;" &&
                            (it.reference as FieldReference).name == "expiresTime" } -> {
                        method.addInstructions(0, FAR_FUTURE_MS_BODY)
                    }
                    method.returnType == "I" && method.parameterTypes.size == 1 &&
                        method.parameterTypes[0] == "Lcom/p1/mobile/putong/data/Counter;" &&
                        instrs.any { it is ReferenceInstruction && it.reference is FieldReference &&
                            (it.reference as FieldReference).definingClass == "Lcom/p1/mobile/putong/data/Counter;" &&
                            (it.reference as FieldReference).name == "boostLimits" } -> {
                        method.addInstructions(0, RETURN_INT_200000)
                    }
                    method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                        instrs.any { it is ReferenceInstruction && it.reference is FieldReference &&
                            (it.reference as FieldReference).definingClass == "Lcom/p1/mobile/putong/data/Counter;" &&
                            (it.reference as FieldReference).name == "boostLimits" } -> {
                        method.addInstructions(0, RETURN_TRUE)
                    }
                    method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                        instrs.any { it is ReferenceInstruction && it.reference is MethodReference &&
                            (it.reference as MethodReference).name == "e" } -> {
                        method.addInstructions(0, RETURN_FALSE)
                    }
                }
            }
        }

        // rbb0: Likers limit gate checks
        // q() - no-arg static → Z, delegates to s()
        // r(Counter) - static Counter → Z, returns counter == null || counter.likersLimit.remaining <= 0
        // s(Counter, int, Object) - synthetic bridge → Z
        // Patching all to return TRUE makes all callers think there are 0 likers remaining,
        // preventing "x people liked you" popups from appearing on the swipe tab.
        resolved["rbb0"]?.let { rbb0ClassDef ->
            mutableClassDefBy(rbb0ClassDef).methods.forEach { method ->
                // q() - no-arg static → Z
                if (method.name == "q" && method.parameterTypes.isEmpty() && 
                    method.returnType == "Z" && AccessFlags.STATIC.isSet(method.accessFlags)) {
                    method.addInstructions(0, RETURN_TRUE)
                }
                // r(Counter) - static Counter → Z
                if (method.name == "r" && method.parameterTypes.size == 1 && 
                    method.parameterTypes[0] == "Lcom/p1/mobile/putong/data/Counter;" &&
                    method.returnType == "Z" && AccessFlags.STATIC.isSet(method.accessFlags)) {
                    method.addInstructions(0, RETURN_TRUE)
                }
                // s(Counter, int, Object) - synthetic bridge → Z
                if (method.name == "s" && method.parameterTypes.size == 3 && 
                    method.parameterTypes[0] == "Lcom/p1/mobile/putong/data/Counter;" &&
                    method.parameterTypes[1] == "I" &&
                    method.parameterTypes[2] == "Ljava/lang/Object;" &&
                    method.returnType == "Z" && AccessFlags.STATIC.isSet(method.accessFlags)) {
                    method.addInstructions(0, RETURN_TRUE)
                }
                // g() - static no-arg → J, returns likersLimit.expiresTime
                // Patch to return 0L to make all callers think likers limit never expires
                if (method.name == "g" && method.parameterTypes.isEmpty() &&
                    method.returnType == "J" && AccessFlags.STATIC.isSet(method.accessFlags)) {
                    method.addInstructions(0, """
                        const-wide v0, 0x0
                        return-wide v0
                    """)
                }
                // i() - static no-arg → J, returns remaining time on likers limit
                // Patch to return 0L
                if (method.name == "i" && method.parameterTypes.isEmpty() &&
                    method.returnType == "J" && AccessFlags.STATIC.isSet(method.accessFlags)) {
                    method.addInstructions(0, """
                        const-wide v0, 0x0
                        return-wide v0
                    """)
                }
            }
        }

        // hl3: Likers dialog creator
        // hl3.J(Act, int, CoreLikers$a) creates the full modal dialog with LikersDialogView
        // hl3.H(Act, int, List) creates the dialog with photo URLs (no-match variant)
        // hl3.L(Act, int) creates the SVIP recover dialog
        // All are static methods that return void. Patching to return-void prevents the dialog.
        resolved["hl3"]?.let { hl3ClassDef ->
            mutableClassDefBy(hl3ClassDef).methods.forEach { method ->
                if (method.name == "H" && method.parameterTypes.size == 3 &&
                    method.parameterTypes[0] == "Lcom/p1/mobile/android/app/Act;" &&
                    method.parameterTypes[1] == "I" &&
                    method.parameterTypes[2] == "Ljava/util/List;" &&
                    method.returnType == "V" && AccessFlags.STATIC.isSet(method.accessFlags)) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // j7d0: Dialog orchestrator
        // j7d0.h0(b240) orchestrates the likers dialog display
        // Static method that takes b240 parameter and returns void
        resolved["j7d0"]?.let { j7d0ClassDef ->
            mutableClassDefBy(j7d0ClassDef).methods.forEach { method ->
                // h0(b240) → void
                if (method.name == "h0" && method.parameterTypes.size == 1 &&
                    method.parameterTypes[0].contains("b240") &&
                    method.returnType == "V" && AccessFlags.STATIC.isSet(method.accessFlags)) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // gg50: Dialog strategy for p_offline_popup
        // gg50.b() checks if popup should show → patch to return false
        // gg50.d() executes the popup display → patch to return false
        resolved["gg50"]?.let { gg50ClassDef ->
            mutableClassDefBy(gg50ClassDef).methods.forEach { method ->
                // b() → boolean (check if should show)
                if (method.name == "b" && method.parameterTypes.isEmpty() &&
                    method.returnType == "Z") {
                    method.addInstructions(0, RETURN_FALSE)
                }
                // d() → boolean (execute display)
                if (method.name == "d" && method.parameterTypes.isEmpty() &&
                    method.returnType == "Z") {
                    method.addInstructions(0, RETURN_FALSE)
                }
            }
        }

        // qtk: Return-to-app guide dialog
        // qtk.B0() generates "你离开后，仍有 %s 个人喜欢着你" text and shows dialog
        // Static method that returns void
        resolved["qtk"]?.let { qtkClassDef ->
            mutableClassDefBy(qtkClassDef).methods.forEach { method ->
                // B0() → void
                if (method.name == "B0" && method.parameterTypes.isEmpty() &&
                    method.returnType == "V" && AccessFlags.STATIC.isSet(method.accessFlags)) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // LikersDialogView: Dialog content populator
        // LikersDialogView.b(int, CoreLikers$a) populates dialog with likers data
        // LikersDialogView.c(List) populates dialog with photo URLs
        // Both are instance methods that return void. Patching to return-void prevents content.
        classDefByOrNull("Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                // b(int, CoreLikers$a) → void
                if (method.name == "b" && method.parameterTypes.size == 2 &&
                    method.parameterTypes[0] == "I" &&
                    method.parameterTypes[1].contains("CoreLikers") &&
                    method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
                // c(List) → void
                if (method.name == "c" && method.parameterTypes.size == 1 &&
                    method.parameterTypes[0] == "Ljava/util/List;" &&
                    method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        resolved["sb90Companion"]?.let { sb90CompanionClassDef ->
            sb90CFingerprint.matchOrNull(sb90CompanionClassDef)?.let { match ->
                match.method.addInstructions(0, LOG_SB90_FALSE)
            }
        }

        resolved["secretCrush"]?.let { secretCrushClassDef ->
            secretCrushRemainingFingerprint.matchOrNull(secretCrushClassDef)?.let { match ->
                match.method.addInstructions(0, RETURN_FALSE)
            }
            secretCrushExpirationFingerprint.matchOrNull(secretCrushClassDef)?.let { match ->
                match.method.addInstructions(0, FAR_FUTURE_MS_BODY)
            }
        }

        resolved["coreData"]?.let { coreDataClassDef ->
            coreDataSurpriseGiftFingerprint.matchOrNull(coreDataClassDef)?.let { match ->
                match.method.addInstructions(0, RETURN_LONG_MAX)
            }
        }

        resolved["tm90"]?.let { tm90ClassDef ->
            tm90GFingerprint.matchOrNull(tm90ClassDef)?.let { match ->
                match.method.addInstructions(0, RETURN_FALSE)
            }
        }

        resolved["mb90"]?.let { mb90ClassDef ->
            mutableClassDefBy(mb90ClassDef).methods.forEach { method ->
                if (method.returnType == "Z" && AccessFlags.STATIC.isSet(method.accessFlags)) {
                    if (method.parameterTypes.size == 1 && method.parameterTypes[0] == "Lcom/p1/mobile/putong/core/data/PurchaseType;") {
                        method.addInstructions(0, RETURN_TRUE)
                    }
                    if (method.parameterTypes.size == 2 && method.parameterTypes[0] == "Lcom/p1/mobile/putong/data/User;" && method.parameterTypes[1] == "Lcom/p1/mobile/putong/core/data/PurchaseType;") {
                        method.addInstructions(0, RETURN_TRUE)
                    }
                }
            }
        }

        // joa patch removed: in 7.3.3 xma and joa are the same class, xma patch handles these methods

        resolved["jh30"]?.let { jh30ClassDef ->
            val newProfilePrivilegedPagerType = "Lcom/p1/mobile/putong/core/newui/profile/newme/NewProfilePrivilegedPager;"
            val methods = jh30ClassDef.methods

            val populateMethod = methods.firstOrNull { method ->
                AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                    AccessFlags.FINAL.isSet(method.accessFlags) &&
                    method.returnType == "V" &&
                    method.parameterTypes.size == 2 &&
                    method.parameterTypes[0] == "Ljava/util/List;" &&
                    method.parameterTypes[1] == "Z"
            } ?: return@let

            val getterMethod = methods.firstOrNull { method ->
                method.parameterTypes.isEmpty() &&
                    method.returnType == newProfilePrivilegedPagerType
            } ?: return@let

            val classType = jh30ClassDef.type
            val getterName = getterMethod.name
            val bannerHideBody = """
                invoke-virtual {p0}, ${classType}->${getterName}()${newProfilePrivilegedPagerType}
                move-result-object v0
                const/16 v1, 0x8
                invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
                return-void
            """
            mutableClassDefBy(jh30ClassDef).methods
                .first { it.name == populateMethod.name && it.parameterTypes == populateMethod.parameterTypes }
                .addInstructions(0, bannerHideBody)
        }

        resolved["businessEntranceAdapter"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.returnType == "V" && method.parameterTypes.isEmpty()) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // pm6: fromWhoLikedMe gate check
        // pm6.f(Conversation) returns true if conversation is a "fromWhoLikedMe" type
        // This is the international-specific gate that controls whether the "liked me" icon appears
        // Patching to return false prevents the icon from showing on conversation items
        resolved["pm6"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "f" && method.parameterTypes.size == 1 &&
                    method.parameterTypes[0] == "Lcom/p1/mobile/putong/core/data/Conversation;" &&
                    method.returnType == "Z" && AccessFlags.STATIC.isSet(method.accessFlags)) {
                    method.addInstructions(0, RETURN_FALSE)
                }
            }
        }

        // bhe0: Business entrance navigation and analytics
        // bhe0.d() navigates to LikersAct/IntlMeetAct when user clicks the banner
        // bhe0.e()/f() fire analytics events for red dot display
        // Patching all to return-void prevents navigation and analytics tracking
        resolved["bhe0"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                // d(Context, boolean, BusinessEntranceStyle) → void (navigation)
                if (method.name == "d" && method.parameterTypes.size == 3 && method.returnType == "V" &&
                    AccessFlags.STATIC.isSet(method.accessFlags)) {
                    method.addInstructions(0, RETURN_VOID)
                }
                // e(boolean) → void (analytics event)
                if (method.name == "e" && method.parameterTypes.size == 1 && method.returnType == "V" &&
                    AccessFlags.STATIC.isSet(method.accessFlags)) {
                    method.addInstructions(0, RETURN_VOID)
                }
                // f() → void (analytics event)
                if (method.name == "f" && method.parameterTypes.isEmpty() && method.returnType == "V" &&
                    AccessFlags.STATIC.isSet(method.accessFlags)) {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // ConversationsList.X1(): Privilege change handler
        // Subscribes to seeWhoLikedMe privilege changes and triggers list refresh
        // Server responses can change privilege state, causing re-display of promotional content
        // Patching to return-void prevents server-triggered list refreshes
        classDefByOrNull("Lcom/p1/mobile/putong/core/newui/messages/ConversationsList;")?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "X1" && method.parameterTypes.size == 1 &&
                    method.parameterTypes[0] == "Lcom/p1/mobile/putong/core/data/UserPrivilege;" &&
                    method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        resolved["vqo"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "m" && method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/CharSequence;") {
                    method.addInstructions(0, """
                        const-string v0, ""
                        return-object v0
                    """)
                }
                if (method.name == "n" && method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/CharSequence;") {
                    method.addInstructions(0, """
                        const-string v0, ""
                        return-object v0
                    """)
                }
                if (method.name == "v" && method.returnType == "Landroid/util/Pair;") {
                    method.addInstructions(0, """
                        const-string v0, ""
                        const-string v1, ""
                        invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;
                        move-result-object v0
                        return-object v0
                    """)
                }
            }
        }

        resolved["re90"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "m" && method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/CharSequence;") {
                    method.addInstructions(0, """
                        const-string v0, ""
                        return-object v0
                    """)
                }
                if (method.name == "n" && method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/CharSequence;") {
                    method.addInstructions(0, """
                        const-string v0, ""
                        return-object v0
                    """)
                }
            }
        }

        resolved["i0p"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "m" && method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/CharSequence;") {
                    method.addInstructions(0, """
                        const-string v0, ""
                        return-object v0
                    """)
                }
                if (method.name == "n" && method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/CharSequence;") {
                    method.addInstructions(0, """
                        const-string v0, ""
                        return-object v0
                    """)
                }
            }
        }

        // wid0: String formatter for "%s people liked you" text
        // wid0.j(int) returns CharSequence with promotional text
        // Patch to return empty string
        resolved["wid0"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "j" && method.parameterTypes.size == 1 && method.parameterTypes[0] == "I" && method.returnType == "Ljava/lang/CharSequence;") {
                    method.addInstructions(0, """
                        const-string v0, ""
                        return-object v0
                    """)
                }
            }
        }

        // ajy: MeetLikersNewLikersData - patch getNewLikersCount() to return 0
        // The method returns int and accesses this.newLikersCount field
        resolved["meetNewLikersData"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.parameterTypes.isEmpty() && method.returnType == "I" && method.name != "hashCode") {
                    method.addInstructions(0, """
                        const/4 v0, 0x0
                        return v0
                    """)
                }
            }
        }

        // ano: IntlMeetLikersNewLikersData - patch getNewLikersCount() to return 0
        // The method returns int and accesses this.newLikersCount field
        resolved["intlMeetNewLikersData"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.parameterTypes.isEmpty() && method.returnType == "I" && method.name != "hashCode") {
                    method.addInstructions(0, """
                        const/4 v0, 0x0
                        return v0
                    """)
                }
            }
        }

        // zmo: IntlMeetLikersNewLikersAdapter - patch G(List) to return void
        // Prevents adapter from populating the new likers list
        resolved["intlMeetNewLikersAdapter"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "G" && method.parameterTypes.size == 1 && method.parameterTypes[0] == "Ljava/util/List;" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // ziy: MeetLikersNewLikersAdapter - patch J(DbLinks, List) to return void
        // Prevents adapter from populating the new likers list
        resolved["meetNewLikersAdapter"]?.let { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.name == "J" && method.parameterTypes.size == 2 && method.parameterTypes[0] == "Lcom/p1/mobile/putong/data/DbLinks;" && method.parameterTypes[1] == "Ljava/util/List;" && method.returnType == "V") {
                    method.addInstructions(0, RETURN_VOID)
                }
            }
        }

        // ── Promotional label suppression (swipe/home tab) ─────────────────────
        // Force server-driven promotional boolean fields to false at the data level.
        // Kills "x people like you" / "She/He liked you" labels and overlays.
        //
        // Targets:
        // - CardInfos.momentLikedYou / boostLikeYou (protobuf + JSON parsing)
        // - CardModel.momentLikedYou / boostLikeYou (protobuf + JSON parsing)
        // - CoreSuggested$UserInfo.hasLikeMeSlideCardTop
        //
        // Approach: after every iput-byte that writes to a target field, inject
        // a second iput-byte that overwrites it with false (0). This catches all
        // write sites (protobuf parse, JSON parseField, copy/clone) without
        // needing to identify each individually.

        data class PromoFieldTarget(val classDesc: String, val fieldNames: Set<String>)

        val promoTargets = listOf(
            PromoFieldTarget(
                "Lcom/p1/mobile/putong/core/data/CardInfos;",
                setOf("momentLikedYou", "boostLikeYou")
            ),
            PromoFieldTarget(
                "Lcom/p1/mobile/putong/core/data/CardModel;",
                setOf("momentLikedYou", "boostLikeYou")
            ),
            PromoFieldTarget(
                "Lcom/p1/mobile/putong/core/api/CoreSuggested\$UserInfo;",
                setOf("hasLikeMeSlideCardTop")
            ),
        )

        for (target in promoTargets) {
            classDefByOrNull(target.classDesc)?.let { classDef ->
                mutableClassDefBy(classDef).methods.forEach { method ->
                    val instrs = method.cachedInstructions()
                    val writeIndices = instrs.withIndex().filter { (_, instr) ->
                        instr.opcode.name == "iput-byte" &&
                            instr is ReferenceInstruction &&
                            instr.reference is FieldReference &&
                            (instr.reference as FieldReference).name in target.fieldNames &&
                            (instr.reference as FieldReference).definingClass == target.classDesc
                    }.map { it.index }

                    if (writeIndices.isEmpty()) return@forEach

                    writeIndices.reversed().forEach { idx ->
                        val instr = instrs[idx]
                        if (instr is TwoRegisterInstruction) {
                            val objReg = instr.registerB
                            val fieldRef = (instr as ReferenceInstruction).reference as FieldReference
                            val tempReg = if (objReg != 0) "v0" else "v1"
                            method.addInstructions(idx + 1, """
                                const/4 $tempReg, 0x0
                                iput-byte $tempReg, v$objReg, ${fieldRef.definingClass}->${fieldRef.name}:${fieldRef.type}
                            """)
                        }
                    }
                }
            }
        }

    }
}
