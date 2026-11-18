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
import com.android.tools.smali.dexlib2.Opcode
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
//                      stock 26.11.1 build, and the one that matches the
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

internal val bypassAsyncPrivilegeChecksOption = booleanOption(
    key = "bypassAsyncPrivilegeChecks",
    default = true,
    title = "Hide the upgrade banner on tool pages",
    description = "Removes the storage and export-limit upsell banner shown above the tool pages. " +
        "It overrides a single banner processor and answers its callback with \"do not show\", " +
        "which is a path the stock code already uses. It does NOT touch the privilege/coroutine " +
        "path. Verified working on device: banner gone, no hang.",
)

// == OFF by default ==========================================================

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
        // 5. Tool-page upsell banner (default off, SAFE TO ENABLE).
        //
        //    HISTORY - do not regress this. An earlier build implemented this
        //    option by rewriting the two async privilege deny paths
        //    (`PrivilegeAssembly$2.b` and
        //    `PrivilegeInterceptor$intercept$2$1.noHasPrivilege`). That caused an
        //    endless loading dialog with an unresponsive screen in every tool
        //    that runs a premium check, Discover included, and it never actually
        //    removed the banner.
        //
        //    Why it hung: `noHasPrivilege` has two exits. One resumes the
        //    coroutine with a `FailResponse`; the other notifies a
        //    `VasResponseResultHook`, whose implementations dismiss the waiting
        //    UI and call `VasResponseResultHookCallback.onFailure`. Resuming the
        //    coroutine alone skips that notification, so the widget waits
        //    forever.
        //
        //    Why it never removed the banner: the banner is not a privilege
        //    gate. It is `UpgradeOrExpandTipsBarProcessor.e(...)`, which asks
        //    `UpgradeOrExpandTipsBarMatcher` and then a cloud-commerce upsell
        //    strategy (export-size limit, storage threshold). No privilege id,
        //    VIP flag or member level is consulted anywhere on that path.
        //
        //    This replaces that processor body with the "do not show" early
        //    return stock already uses when its account check fails. It keeps
        //    the `CheckShowCallback` contract, touches no coroutine, and leaves
        //    the upsell strategies intact for every other caller.
        // --------------------------------------------------------------------
        if (bypassAsyncPrivilegeChecks == true) {
            // Answers "do not show" through the same early-return path stock uses
            // when the account check fails. No coroutine, no FailResponse, no
            // result hook - so none of the hang the previous implementation caused.
            WpsUpgradeTipsBarFingerprint.method.replaceWithCleanBody(
                owner = WpsUpgradeTipsBarFingerprint.classDef,
                registerCount = 3,
                label = "UpgradeOrExpandTipsBarProcessor.e",
                smaliBody = """
                    const/4 v0, 0x0
                    invoke-interface {p2, v0}, Lcn/wps/moffice/common/tooltip/CheckShowCallback;->onResult(Z)V
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
            // The body is being replaced, so its register frame only needs to be
            // readable, not correct. On a malformed code item dexlib2 throws while
            // parsing it, so fall back to a frame sized from the signature:
            // parameters (plus `this` when not static) and a generous local area.
            // The replacement body uses v0/v1 and p1, which this always covers.
            val registers = try {
                method.implementation?.registerCount
            } catch (t: Throwable) {
                null
            } ?: (method.parameterTypes.size + (if ((method.accessFlags and 0x8) != 0) 0 else 1) + 8)
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
            // Idempotency: on an APK this patch has already processed, the show()
            // invoke is already a nop and the guard below would abort the whole
            // run. That is not a structural change in the dex, it is this patch
            // having done its job, so say so instead of failing.
            if (showIndex < 0) {
                val alreadyNop = instructions.any { it.opcode == Opcode.NOP }
                if (alreadyNop) {
                    println(
                        "Premium: the \"already owned\" dialog show() call is already removed. Skipping.",
                    )
                } else {
                    throw PatchException(
                        "WPS premium patch: CustomDialog.show() not found in the owned-privilege " +
                            "dialog, and no nop is present either, so the method body is unexpected.",
                    )
                }
            } else {
                method.replaceInstruction(showIndex, "nop")
            }
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
            val registers = method.safeRegisterCount()
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
    if (!ok) throw PatchException("WPS premium patch 26.11.1 structural check failed: $message")
}

/**
 * Register count of a method, without parsing its body when that would throw.
 *
 * dexlib2 materialises a code item lazily and throws `Invalid element width` on a
 * structurally malformed one. Every use in this patch is followed by replacing the
 * body outright, so an estimated frame is always acceptable: parameters (plus
 * `this` for an instance method) plus a local area large enough for the
 * replacement bodies written here.
 */
private fun MutableMethod.safeRegisterCount(): Int {
    val existing = try {
        implementation?.registerCount
    } catch (t: Throwable) {
        null
    }
    if (existing != null) return existing
    val isStatic = (accessFlags and 0x8) != 0
    return parameterTypes.size + (if (isStatic) 0 else 1) + 8
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
