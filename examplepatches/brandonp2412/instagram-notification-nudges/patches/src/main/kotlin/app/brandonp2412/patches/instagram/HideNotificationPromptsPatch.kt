package app.brandonp2412.patches.instagram

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.matchSingle
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * Suppresses only Instagram's notification opt-in UI, never the Android notification API,
 * actual notification delivery or the per-account notification settings.
 *
 * The fingerprints below are intentionally pinned to the validated 454.0.0.13.77 APK.
 * A different obfuscation build must be explicitly reviewed and tested before extending
 * the compatibility declaration. All targets are mandatory, so a mismatch fails closed.
 */
private val instagram454 = Compatibility(
    name = "Instagram",
    packageName = "com.instagram.android",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xDD2A7B,
    targets = listOf(AppTarget(version = "454.0.0.13.77"))
)

private val feedUpsell = Fingerprint(
    definingClass = "LX/05QL;",
    name = "A00",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Lcom/instagram/common/session/UserSession;", "Ljava/lang/String;"),
    strings = listOf("notification_feed", "direct_inbox", "preference_has_allowed_push_system_dialog")
)

private val onboardingOptIn = Fingerprint(
    definingClass = "LX/0gKg;",
    name = "A00",
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("skip_push_opt_in_already_asked", "skip_push_opt_in_has_permission_already")
)

private val activityUpsellRow = Fingerprint(
    definingClass = "LX/0C4e;",
    name = "A0H",
    returnType = "V",
    parameters = listOf("LX/1BaO;", "Ljava/lang/String;", "Lkotlin/jvm/functions/Function1;", "I")
)

private val reachabilityFactory = Fingerprint(
    definingClass = "LX/0STR;",
    filters = listOf(
        newInstance("LX/0S6U;"),
        newInstance("LX/0RJO;"),
        newInstance("LX/0S47;"),
        newInstance("LX/0hf6;")
    )
)

private val reachabilityClasses = listOf("0S6U", "0RJO", "0S47", "0hf6")

private val delayedPermissionPrompt = Fingerprint(
    definingClass = "LX/05QN;",
    name = "A00",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "Landroid/view/View;",
        "Lcom/instagram/common/session/UserSession;", "Ljava/lang/Integer;"),
    strings = listOf("preference_has_asked_push_permission_in_nux", "direct_inbox", "notification_feed")
)

private val reforegroundToast = Fingerprint(
    definingClass = "LX/0QBE;",
    name = "A01",
    returnType = "V",
    strings = listOf("V2_REACHABILITY_UPSELL_REFOREGROUND_TOAST_LAST_SHOWN_TIMESTAMP")
)

private val directThread = Fingerprint(
    definingClass = "LX/02Ru;",
    name = "A00",
    returnType = "V",
    parameters = listOf("Lcom/instagram/common/session/UserSession;", "LX/02Nt;", "LX/0QaX;", "LX/02Ru;"),
    strings = listOf("NF_REACHABILITY_UPSELL_LAST_FIBONACCI_COOL_DOWN_UNTIL", "nf_reachability_upsell_limits_direct_thread"),
    filters = listOf(
        fieldAccess(smali = "LX/02Ru;->A00:Ljava/lang/Integer;"),
        opcode(Opcode.IF_NEZ, MatchAfterWithin(3))
    )
)

private val profileNotificationStub = Fingerprint(
    definingClass = "LX/0QCd;",
    name = "A01",
    isStatic = true,
    returnType = "V",
    filters = listOf(
        literal(0x20042),
        methodCall(definingClass = "LX/03ii;", name = "A01", returnType = "Z"),
        opcode(Opcode.MOVE_RESULT, MatchAfterWithin(1)),
        opcode(Opcode.IF_EQZ, MatchAfterWithin(1))
    )
)

private val quickPromotionLoop = Fingerprint(
    definingClass = "LX/02jE;",
    name = "Gz9",
    returnType = "V",
    strings = listOf("notification_permission_prompt"),
    filters = listOf(methodCall(definingClass = "Ljava/util/Iterator;", name = "hasNext"))
)

private val quickPromotionSurface = Fingerprint(
    definingClass = "LX/02jE;",
    name = "Gz9",
    returnType = "V",
    strings = listOf("notification_permission_prompt"),
    filters = listOf(fieldAccess(smali =
        "LX/044I;->A07:Lcom/instagram/quickpromotion/intf/QuickPromotionSurface;"))
)

@Suppress("unused")
val hideNotificationPromptsPatch = patch(
    name = "Hide notification prompts",
    description = "Hide Instagram's notification opt-in nags without disabling notifications.",
    default = false
) {
    compatibleWith(instagram454)

    execute {
        // These methods exist only to decide whether to show a permission upsell.
        feedUpsell.method.returnEarly(false)
        onboardingOptIn.method.returnEarly(false)
        activityUpsellRow.method.returnEarly()

        // Verify the four eligibility implementations are still created by the
        // notification reachability factory, before disabling presentation.
        reachabilityFactory.matchSingle()
        for (name in reachabilityClasses) {
            Fingerprint(
                definingClass = "LX/$name;",
                name = "B28",
                returnType = "Z",
                parameters = emptyList()
            ).method.returnEarly(false)
        }
        delayedPermissionPrompt.method.returnEarly()
        reforegroundToast.method.returnEarly()

        // The Direct-thread banner is the first branch of this method. Force the
        // existing branch to skip it; the unrelated conversation banners continue.
        directThread.let { fp ->
            val branch = fp.instructionMatches.last()
            val register = branch.getInstruction<OneRegisterInstruction>().registerA
            fp.method.addInstructions(branch.index, "const/4 v$register, 0x1")
        }

        // Disable only the profile notification ViewStub, not the surrounding
        // profile and follow-button setup. Keep its existing skip branch.
        profileNotificationStub.let { fp ->
            val branch = fp.instructionMatches.last()
            val register = branch.getInstruction<OneRegisterInstruction>().registerA
            fp.method.addInstructions(branch.index, "const/4 v$register, 0x0")
        }

        // The Quick Promotion resolver handles many unrelated promotions. Only
        // reject the specific notification permission promotion at the list iterator,
        // leaving all other promotions and the permission API untouched.
        val loop = quickPromotionLoop.instructionMatches.single().index
        val surface = quickPromotionSurface.instructionMatches.single().index
        // The loop starts with const/4 v13, 0x0, immediately before hasNext.
        require(loop > 0 && surface > loop && quickPromotionLoop.method === quickPromotionSurface.method) {
            "Quick Promotion iterator changed; refusing to patch"
        }
        quickPromotionSurface.method.addInstructionsWithLabels(
            surface,
            """
                iget-object v0, v5, LX/044I;->A0A:LX/09ZY;
                iget-object v0, v0, LX/09ZY;->A00:Ljava/lang/String;
                const-string v1, "notification_permission_prompt"
                invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-nez v0, :nextPromotion
            """,
            ExternalLabel("nextPromotion", loop - 1)
        )
    }
}
