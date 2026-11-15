package app.template.patches.wps

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants.COMPATIBILITY_WPS_OFFICE
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

// ============================================================================
// User-facing options - every gate below is independent. Nothing is forced:
// turning all of them off yields a stock-equivalent build. This patch does not
// touch the manifest at all; package visibility lives in the MicroG patch,
// which is the only thing that needs it.
//
// TWO PROFILES:
//
//   UNLOCKED (defaults)
//                    - answers the VAS interceptor chain with success (see
//                      bypassPrivilegeInterceptor) and reports the Pro tier.
//                      This is the profile VERIFIED ON DEVICE against the
//                      stock 26.11.0 build, and the one that matches the
//                      behaviour of the working third-party mod. Every option
//                      stays independent, so it can be walked back one gate at
//                      a time.
//
//   POLITE           - turn bypassPrivilegeInterceptor off. Refusals are then
//                      answered honestly, so premium tools stay on the local
//                      path and are refused rather than unlocked: image-to-PDF
//                      export and the PDF toolkit show the Pro+ sheet. Kept for
//                      anyone who wants the least invasive build.
//
//   AI-HONEST       - add denyAiPrivileges on top of either profile: every
//                      privilege id containing "ai" / "_ai" / "aigc" is answered
//                      as not held. Do NOT use this as a default: ai_extract
//                      drives OCR text extraction, so denying it puts the
//                      upsell back on a feature that works when granted.
// ============================================================================

// ----------------------------------------------------------------------------
// ORDER MATTERS FOR THE USER, NOT FOR THE PATCH.
//
// These are declared master-switch-first, then the switches that default to ON,
// then the ones that default to OFF. Morphe Manager and the generated README
// both list options in declaration order, so this is the order a first-time
// user reads. Keep it: everything above the line is on, everything below is off.
// ----------------------------------------------------------------------------

// == ON by default ===========================================================

internal val bypassPrivilegeInterceptorOption = booleanOption(
    key = "bypassPrivilegeInterceptor",
    default = true,
    title = "Unlock premium tools (main switch)",
    description = "Answers every premium check with \"yes\". This is the switch that actually unlocks the app - " +
        "the options below it only tidy up what it produces.",
)

internal val unlockPremiumIdentityOption = booleanOption(
    key = "unlockPremiumIdentity",
    default = true,
    title = "Show a Pro account",
    description = "Shows your account as Premium, so upgrade banners and price cards go away.",
)

internal val unlockMemberLevelOption = booleanOption(
    key = "unlockMemberLevel",
    default = true,
    title = "Open Pro menus",
    description = "Tells the app you have a Pro membership, which opens the menu entries locked behind it.",
)

internal val unlockPrivilegeChecksOption = booleanOption(
    key = "unlockPrivilegeChecks",
    default = true,
    title = "Pass ownership checks",
    description = "Answers \"do I own this?\" with yes, so premium fonts, templates and PDF tools open.",
)

internal val removeAdsOption = booleanOption(
    key = "removeAds",
    default = true,
    title = "Remove ads",
    description = "Tells the app you are ad-free, so banner and full-screen ads are never requested.",
)

internal val hideOwnedPrivilegeDialogOption = booleanOption(
    key = "hideOwnedPrivilegeDialog",
    default = true,
    title = "Hide the \"already a member\" popup",
    description = "Stops the popup that says you are already a WPS Premium user.",
)

// == OFF by default ==========================================================

internal val bypassAsyncPrivilegeChecksOption = booleanOption(
    key = "bypassAsyncPrivilegeChecks",
    default = false,
    title = "Hide the upgrade banner on tool pages",
    description = "Removes the \"Upgrade to WPS Membership\" banner shown above the tool pages. " +
        "It can invent usage counters, so it stays off until you want it.",
)

internal val denyAiPrivilegesOption = booleanOption(
    key = "denyAiPrivileges",
    default = false,
    title = "Turn AI features off",
    description = "Answers every AI request as not owned. Use it only if an AI tool keeps loading forever.",
)

internal val reportAdGateOfflineOption = booleanOption(
    key = "reportAdGateOffline",
    default = false,
    title = "Skip the ad pre-check",
    description = "Tells the app ads are off before it contacts the server, so those requests never start.",
)

internal val passSignatureCheckOption = booleanOption(
    key = "passSignatureCheck",
    default = false,
    title = "Report the stock signature",
    description = "Only analytics reads this. It does not affect premium, ads or sign-in.",
)

// ============================================================================
// Bytecode patch.
// ============================================================================

@Suppress("unused")
val wpsPremiumPatch = bytecodePatch(
    name = "Unlock premium features",
    description = "Opens the paid tools - PDF, export, editing, fonts and templates - by answering the app's " +
        "payment checks. Every part has its own switch, so you choose what is unlocked. " +
        "Sign in first: signed out, WPS reports no membership at all.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WPS_OFFICE)

    val bypassPrivilegeInterceptor by bypassPrivilegeInterceptorOption()
    val unlockPremiumIdentity by unlockPremiumIdentityOption()
    val unlockMemberLevel by unlockMemberLevelOption()
    val unlockPrivilegeChecks by unlockPrivilegeChecksOption()
    val removeAds by removeAdsOption()
    val hideOwnedPrivilegeDialog by hideOwnedPrivilegeDialogOption()
    val bypassAsyncPrivilegeChecks by bypassAsyncPrivilegeChecksOption()
    val denyAiPrivileges by denyAiPrivilegesOption()
    val reportAdGateOffline by reportAdGateOfflineOption()
    val passSignatureCheck by passSignatureCheckOption()

    execute {
        // --------------------------------------------------------------------
        // 1. Premium identity - EnVas pay sheet + KEnVas pay entry points.
        //    All five are pure boolean readers over `EnVasPrivilegeUtil.b()`;
        //    answering them directly changes nothing else in the app state.
        // --------------------------------------------------------------------
        if (unlockPremiumIdentity == true) {
            listOf(
                "EnVasPrivilegeUtil.d" to WpsEnVasPremiumFingerprint,
                "EnVasPrivilegeUtil.f" to WpsEnVasProFingerprint,
                "KEnVasAssembly.isPremiumVipMember" to WpsKEnVasPremiumFingerprint,
                "KEnVasAssembly.isProVipMember" to WpsKEnVasProFingerprint,
                "KEnVasAssembly.hasPremiumVipPrivilege" to WpsKEnVasHasPremiumFingerprint,
            ).forEach { (label, fingerprint) ->
                fingerprint.method.replaceWithCleanBody(
                    owner = fingerprint.classDef,
                    registerCount = 2,
                    label = label,
                    smaliBody = """
                        const/4 v0, 0x1
                        return v0
                    """,
                )
            }
        }

        // --------------------------------------------------------------------
        // 2. Member level - `getAllMemberList()` feeds `isBasicVip`,
        //    `isSeniorVip`, `isVipAi` and `getSortedMemberLevel`.
        //
        //    The list is rebuilt instead of early-returned so the return type
        //    stays an ArrayList and no caller sees a null. Cache-derived SKUs
        //    are not consulted at all; every tier is reported as held.
        // --------------------------------------------------------------------
        if (unlockMemberLevel == true) {
            WpsMemberListFingerprint.method.replaceWithCleanBody(
                owner = WpsMemberListFingerprint.classDef,
                registerCount = 3,
                label = "PrivilegeAssembly.getAllMemberList",
                smaliBody = """
                    new-instance v0, Ljava/util/ArrayList;
                    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

                    const-string v1, "vip_pro"
                    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

                    const-string v1, "vip_pro_plus"
                    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

                    return-object v0
                """,
            )

            WpsMemberLevelFingerprint.method.replaceWithCleanBody(
                owner = WpsMemberLevelFingerprint.classDef,
                registerCount = 2,
                label = "PrivilegeAssembly.getMemberLevel",
                smaliBody = """
                    const-string v0, "vip_pro_plus"
                    return-object v0
                """,
            )

            listOf(
                "PrivilegeAssembly.isBasicVip" to WpsBasicVipFingerprint,
                "PrivilegeAssembly.isSeniorVip" to WpsSeniorVipFingerprint,
                // NOTE: isVipAi is deliberately NOT forced to true. With vip_ai absent from
                // getAllMemberList() it answers false naturally, which is what keeps AI work
                // on the local path instead of stalling on a cloud call.
            ).forEach { (label, fingerprint) ->
                fingerprint.method.replaceWithCleanBody(
                    owner = fingerprint.classDef,
                    registerCount = 2,
                    label = label,
                    smaliBody = """
                        const/4 v0, 0x1
                        return v0
                    """,
                )
            }
        }

        // --------------------------------------------------------------------
        // 3. Synchronous privilege checks.
        //    `checkFromCache` is the single shortcut used by every non-Activity
        //    caller; `EnVasPrivilegeUtil.e` is the same question asked from the
        //    pay sheet side.
        // --------------------------------------------------------------------
        if (unlockPrivilegeChecks == true) {
            // The AI guard is OPT-IN. ai_extract (OCR text extraction) and
            // ai_parallel_translate (translation) are checked through
            // checkFromCache, and denying them puts an upsell on features that
            // work when granted. Cloud hangs are prevented at the source by
            // leaving vip_ai out of the member list, not here.
            val aiGuard = denyAiPrivileges == true

            // instance method: p0 = this, p1 = the privilege id
            val instanceBody = if (aiGuard) """
                    if-eqz p1, :grant

                    const-string v1, "ai"
                    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
                    move-result v1
                    if-eqz v1, :deny

                    const-string v1, "_ai"
                    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                    move-result v1
                    if-eqz v1, :deny

                    const-string v1, "aigc"
                    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                    move-result v1
                    if-eqz v1, :deny

                    :grant
                    const/4 v0, 0x1
                    return v0

                    :deny
                    const/4 v0, 0x0
                    return v0
                """ else """
                    const/4 v0, 0x1
                    return v0
                """

            // STATIC method: the single String argument is p0 (v2 at registerCount 3).
            val staticBody = if (aiGuard) """
                    if-eqz p0, :grant

                    const-string v1, "ai"
                    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
                    move-result v1
                    if-eqz v1, :deny

                    const-string v1, "_ai"
                    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                    move-result v1
                    if-eqz v1, :deny

                    const-string v1, "aigc"
                    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                    move-result v1
                    if-eqz v1, :deny

                    :grant
                    const/4 v0, 0x1
                    return v0

                    :deny
                    const/4 v0, 0x0
                    return v0
                """ else """
                    const/4 v0, 0x1
                    return v0
                """

            WpsCheckFromCacheFingerprint.method.replaceWithCleanBody(
                owner = WpsCheckFromCacheFingerprint.classDef,
                registerCount = 4,
                label = "PrivilegeAssembly.checkFromCache",
                smaliBody = instanceBody,
            )

            WpsEnVasPackFingerprint.method.replaceWithCleanBody(
                owner = WpsEnVasPackFingerprint.classDef,
                registerCount = 4,
                label = "EnVasPrivilegeUtil.e",
                smaliBody = staticBody,
            )
        }

        // --------------------------------------------------------------------
        // 4. Ads - the host-side ad-free flag.
        //    `ADUtil.j(adType)` short-circuits on this privilege and is the
        //    gate in front of every placement, so no SDK is loaded for a
        //    suppressed slot.
        // --------------------------------------------------------------------
        if (removeAds == true) {
            WpsAdPrivilegeFingerprint.method.replaceWithCleanBody(
                owner = WpsAdPrivilegeFingerprint.classDef,
                registerCount = 2,
                label = "MofficeDelegateImpl.isAdPrivilege",
                smaliBody = """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }

        // --------------------------------------------------------------------
        // 5. Asynchronous checks (advanced, default off).
        //
        //    Two deny paths exist:
        //      a) `PrivilegeAssembly$2.b(Object)` - converts the real privilege
        //         map into `ConsumePrivilege` objects and hands it to the
        //         callback. Stock answers `noHasPrivilege(-99999)` whenever the
        //         map is empty or an id is missing.
        //      b) `PrivilegeInterceptor$intercept$2$1.noHasPrivilege(I)` - the
        //         newer engine's deny path, which resumes the coroutine with a
        //         `FailResponse` (and toasts for codes outside 10007/10011/
        //         10012/10013/10015).
        //
        //    (a) reuses real entries when the cache has them and only
        //    synthesises the missing ones, with counters far above any real
        //    usage and an expiry in 2100 so "uses left"/"expired" checks cannot
        //    trip. (b) resumes success instead of failure.
        // --------------------------------------------------------------------
        if (bypassAsyncPrivilegeChecks == true) {
            val callbackClass = WpsPrivilegeDispatchFingerprint.classDef
            val listCallbackField = callbackClass.fields.firstOrNull { it.name == "b" }
            val requestedIdsField = callbackClass.fields.firstOrNull { it.name == "c" }

            guard(
                listCallbackField?.type ==
                    "Lcn/wpsx/module/communication/vas/service/IPrivilegeAssembly\$ListCallback;",
                "PrivilegeAssembly\$2.b field type ${listCallbackField?.type}",
            )
            guard(
                requestedIdsField?.type == "[Ljava/lang/String;",
                "PrivilegeAssembly\$2.c field type ${requestedIdsField?.type}",
            )

            WpsPrivilegeDispatchFingerprint.method.replaceWithCleanBody(
                owner = callbackClass,
                registerCount = 12,
                label = "PrivilegeAssembly\$2.b",
                smaliBody = """
                    new-instance v0, Ljava/util/HashMap;
                    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

                    iget-object v1, p0, $WPS_PRIVILEGE_ASSEMBLY_CALLBACK->c:[Ljava/lang/String;
                    if-eqz v1, :emit

                    move-object v5, p1
                    check-cast v5, Ljava/util/Map;
                    array-length v2, v1
                    const/4 v3, 0x0

                    :loop
                    if-ge v3, v2, :emit
                    aget-object v4, v1, v3

                    # Every requested id always gets a ConsumePrivilege: the callback
                    # contract hands out ConsumePrivilege values, never raw Privilege ones.
                    new-instance v6, $WPS_CONSUME_PRIVILEGE
                    invoke-direct {v6}, $WPS_CONSUME_PRIVILEGE-><init>()V

                    # Defaults: counters above any real usage, expiry in 2100.
                    const-wide/32 v7, 0x7fffffff
                    iput-wide v7, v6, $WPS_CONSUME_PRIVILEGE->a:J
                    iput-wide v7, v6, $WPS_CONSUME_PRIVILEGE->b:J
                    const-wide v7, 0xf4865700L
                    iput-wide v7, v6, $WPS_CONSUME_PRIVILEGE->c:J

                    # When the cache really holds this privilege, keep its real values.
                    if-nez v5, :put
                    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v9
                    if-nez v9, :put
                    check-cast v9, Lcn/wps/api/Privilege;
                    iget-wide v7, v9, Lcn/wps/api/CachePrivilege;->a:J
                    iput-wide v7, v6, $WPS_CONSUME_PRIVILEGE->a:J
                    iget-wide v7, v9, Lcn/wps/api/CachePrivilege;->b:J
                    iput-wide v7, v6, $WPS_CONSUME_PRIVILEGE->b:J
                    iget-wide v7, v9, Lcn/wps/api/CachePrivilege;->d:J
                    iput-wide v7, v6, $WPS_CONSUME_PRIVILEGE->c:J

                    :put
                    invoke-virtual {v0, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    add-int/lit8 v3, v3, 0x1
                    goto :loop

                    :emit
                    iget-object v4, p0, $WPS_PRIVILEGE_ASSEMBLY_CALLBACK->b:Lcn/wpsx/module/communication/vas/service/IPrivilegeAssembly${'$'}ListCallback;
                    invoke-interface {v4, v0}, Lcn/wpsx/module/communication/vas/service/IPrivilegeAssembly${'$'}ListCallback;->b(Ljava/util/HashMap;)V
                    return-void
                """,
            )

            WpsAsyncDenialFingerprint.method.replaceWithCleanBody(
                owner = WpsAsyncDenialFingerprint.classDef,
                registerCount = 5,
                label = "PrivilegeInterceptor\$intercept\$2\$1.noHasPrivilege",
                smaliBody = """
                    iget-object v2, p0, $WPS_PRIVILEGE_INTERCEPT_CONTINUATION->a:Lkotlinx/coroutines/CancellableContinuation;
                    invoke-interface {v2}, Lkotlinx/coroutines/CancellableContinuation;->isActive()Z
                    move-result v1
                    if-eqz v1, :done

                    new-instance v0, $WPS_SUCCESS_RESPONSE
                    iget-object v1, p0, $WPS_PRIVILEGE_INTERCEPT_CONTINUATION->b:$WPS_PRIVILEGE_CONTEXT
                    invoke-direct {v0, v1}, $WPS_SUCCESS_RESPONSE-><init>($WPS_PRIVILEGE_CONTEXT)V
                    invoke-interface {v2, v0}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

                    :done
                    return-void
                """,
            )
        }

        // --------------------------------------------------------------------
        // 6. Signature check - cosmetic, Firebase analytics only.
        // --------------------------------------------------------------------
        if (passSignatureCheck == true) {
            WpsSignatureUtilsFingerprint.method.replaceWithCleanBody(
                owner = WpsSignatureUtilsFingerprint.classDef,
                registerCount = 2,
                label = "SignatureUtils.a",
                smaliBody = """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }

        // --------------------------------------------------------------------
        // 7. Privilege interceptor - the whole-request shortcut.
        //
        //    Stock walks: validate privilegeId -> look up IPrivilegeAssembly ->
        //    suspend on assembly.check(...). Any failure becomes a FailResponse.
        //    This answers with the same SuccessResponse type the async path
        //    uses, so callers receive a well-formed result and never null.
        // --------------------------------------------------------------------
        if (bypassPrivilegeInterceptor == true) {
            val method = WpsPrivilegeInterceptorFingerprint.method
            val registers = method.implementation?.registerCount
                ?: throw PatchException("PrivilegeInterceptor.a has no body to replace")
            method.replaceWithCleanBody(
                owner = WpsPrivilegeInterceptorFingerprint.classDef,
                registerCount = registers,
                label = "PrivilegeInterceptor.a",
                smaliBody = """
                    iget-object v1, p1, Lcn/wps/moffice/vas/privilege/intercept/InterceptorChain;->a:$WPS_PRIVILEGE_CONTEXT
                    new-instance v0, $WPS_SUCCESS_RESPONSE
                    invoke-direct {v0, v1}, $WPS_SUCCESS_RESPONSE-><init>($WPS_PRIVILEGE_CONTEXT)V
                    return-object v0
                """,
            )
        }

        // --------------------------------------------------------------------
        // 8. "Already owned" pay dialog - drop the show() call only.
        //
        //    `s74.run()` builds the dialog, configures the button and then shows
        //    it. Only that last invoke is nop'd: the dialog object stays built
        //    (so the surrounding code still sees it) and every other branch of
        //    the run() switch is untouched.
        // --------------------------------------------------------------------
        if (hideOwnedPrivilegeDialog == true) {
            val method = WpsOwnedPrivilegeDialogFingerprint.method
            val instructions = method.implementation?.instructions
                ?: throw PatchException("owned_privilege_dialog run() has no body")
            var showIndex = -1
            instructions.forEachIndexed { index, instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ?: return@forEachIndexed
                if (reference.definingClass == "Lcn/wps/moffice/common/beans/CustomDialog;" &&
                    reference.name == "show"
                ) {
                    showIndex = index
                }
            }
            guard(showIndex >= 0, "CustomDialog.show() not found in the owned-privilege dialog")
            method.replaceInstruction(showIndex, "nop")
        }

        // --------------------------------------------------------------------
        // 9. Remote ad gate - `ADUtil.l()`.
        //
        //    Stock returns the negation of the "a_online_a" server toggle, i.e.
        //    true means "do not request ads" (visitor mode, S2S and the ad
        //    pre-check all skip on true). Answering true stops those requests
        //    at the gate instead of after it.
        // --------------------------------------------------------------------
        if (reportAdGateOffline == true) {
            val method = WpsAdOnlineGateFingerprint.method
            val registers = method.implementation?.registerCount ?: 1
            method.replaceWithCleanBody(
                owner = WpsAdOnlineGateFingerprint.classDef,
                registerCount = registers,
                label = "ADUtil.l",
                smaliBody = """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }
    }
}

// ============================================================================
// Helpers
// ============================================================================

private fun guard(ok: Boolean, message: String) {
    if (!ok) throw PatchException("WPS premium patch 26.11.0 structural check failed: $message")
}

/**
 * Replaces a method body with `smaliBody`, preserving its annotations and
 * hidden-API flags. `registerCount` must cover the method's own parameters:
 * for an instance method it is `1 + parameters.size + locals`.
 */
private fun MutableMethod.replaceWithCleanBody(
    owner: MutableClass,
    registerCount: Int,
    label: String,
    smaliBody: String,
): MutableMethod {
    guard(
        registerCount > parameterTypes.size,
        "$label register count $registerCount for ${parameterTypes.size} parameters",
    )

    val cleanMethod = ImmutableMethod(
        definingClass,
        name,
        parameters,
        returnType,
        accessFlags,
        annotations,
        hiddenApiRestrictions,
        MutableMethodImplementation(registerCount),
    ).toMutable()

    cleanMethod.addInstructions(0, smaliBody.trimIndent())
    owner.methods.remove(this)
    owner.methods.add(cleanMethod)
    return cleanMethod
}
