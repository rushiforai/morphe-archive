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
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x

/**
 * Suppresses only Instagram's notification opt-in UI, never the Android notification API,
 * actual notification delivery or the per-account notification settings.
 *
 * The fingerprints below are pinned to validated 454.0.0.13.77 and 456.0.0.53.78 APKs.
 * A different obfuscation build must be explicitly reviewed and tested before extending
 * the compatibility declaration. All targets are mandatory, so a mismatch fails closed.
 */
private val instagram = Compatibility(
    name = "Instagram",
    packageName = "com.instagram.android",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xDD2A7B,
    targets = listOf(AppTarget(version = "454.0.0.13.77"), AppTarget(version = "456.0.0.53.78"))
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
    compatibleWith(instagram)

    execute {
        if (Fingerprint(definingClass = "LX/0SQp;", name = "A01", returnType = "Z", parameters = emptyList(), strings = listOf("skip_push_opt_in_already_asked", "skip_push_opt_in_os_version_too_low")).matchOrNull() != null) {
            // Match the exact 456 notification presentation gates before editing.
            fun fp(owner: String, name: String, type: String, params: List<String>, strings: List<String> = emptyList()) =
                Fingerprint(definingClass = "LX/$owner;", name = name, returnType = type, parameters = params, strings = strings)
            fun ref(ins: Instruction) = (ins as? ReferenceInstruction)?.reference?.toString().orEmpty()
            fun string(ins: Instruction) = ((ins as? ReferenceInstruction)?.reference as? StringReference)?.string
            val session = "Lcom/instagram/common/session/UserSession;"
            val context = "Landroid/content/Context;"
            val feed = fp("0D9I", "A00", "Z", listOf(context, session, "Ljava/lang/String;"),
                listOf("preference_has_allowed_push_system_dialog", "notification_feed", "direct_inbox")).method
            val delayed = fp("0D9t", "A00", "V", listOf("Landroid/app/Activity;", "Landroid/view/View;", session, "Ljava/lang/Integer;"),
                listOf("notification_feed", "direct_inbox")).method
            require(delayed.implementation!!.instructions.any { ref(it).contains("LX/0a21;") })
            val onboarding = fp("0SQp", "A01", "Z", emptyList(),
                listOf("skip_push_opt_in_already_asked", "skip_push_opt_in_os_version_too_low")).method
            val enumInit = fp("05xR", "<clinit>", "V", emptyList(),
                listOf("RESHARE_REEL_PROMO_DIALOG", "STORY_REPLY_PROMO_DIALOG", "DIRECT_THREAD_BANNER", "COMMENT_POSTED")).method
            require(enumInit.implementation != null)
            val surfaceA = fp("05xR", "A00", "Z", listOf("LX/02mo;", session, "LX/05xR;")).method
            val surfaceB = fp("05xR", "A01", "Z", listOf(session)).method
            for ((method, marker) in listOf(surfaceA to "->Be6(LX/02mo;J)Z", surfaceB to "->Bdz(J)Z")) {
                val ins = method.implementation!!.instructions
                require(ins.any { ref(it).contains("->ordinal()I") } &&
                    ins.any { ref(it).contains(marker) } && ins.any { it.opcode == Opcode.PACKED_SWITCH })
            }
            val controllers = listOf("0D77", "0E9G", "0I27").flatMap { owner ->
                listOf("B2x", "B2y").map { name ->
                    Fingerprint(definingClass = "LX/$owner;", name = name, returnType = "Z",
                        parameters = emptyList(), interfaces = listOf("LX/0avn;")).method.also { method ->
                        val ins = method.implementation!!.instructions
                        require(ins.any { ref(it).contains("LX/05xR;") } &&
                            ins.any { ref(it).contains("LX/03fh;->A01(Landroid/content/Context;)Z") })
                    }
                }
            }
            val quick = fp("02Ah", "HDX", "V", listOf(context, "LX/0M0b;", session, "LX/0Nei;",
                "LX/0mra;", "Lcom/instagram/quickpromotion/intf/QuickPromotionSlot;", "Ljava/util/List;"),
                listOf("notification_permission_prompt")).method
            val qi = quick.implementation!!.instructions.toList()
            val q = qi.indices.single { string(qi[it]) == "notification_permission_prompt" }
            require(ref(qi[q + 1]) == "Ljava/lang/String;->equals(Ljava/lang/Object;)Z" &&
                qi[q + 2].opcode == Opcode.MOVE_RESULT && qi[q + 3].opcode == Opcode.IF_EQZ)
            val qTarget = (q + 4 until qi.size).first { ref(qi[it]) == "LX/0HHm;->A04:LX/0IAq;" && qi[it].opcode == Opcode.SPUT_OBJECT }
            require(qi.subList(q + 4, qTarget).any { ref(it).contains("LX/0VPY;->A00(") })

            val thread = fp("06MC", "A00", "V", listOf(session, "LX/05Ks;", "LX/0LcA;", "LX/06MC;"),
                listOf("nf_reachability_upsell_limits_direct_thread")).method
            val ti = thread.implementation!!.instructions.toList()
            val t = ti.indices.single { ref(ti[it]) == "LX/0avn;->B2x()Z" }
            require(ti[t + 1].opcode == Opcode.MOVE_RESULT && ti[t + 2].opcode == Opcode.IF_EQZ &&
                ref(ti[t + 3]) == "Landroid/view/ViewStub;->inflate()Landroid/view/View;")
            val threadTarget = (ti[t + 2] as BuilderOffsetInstruction).target

            val empty = fp("0tng", "A03", "V", listOf("LX/1Ghm;", "LX/01Lt;", "I")).method
            val ei = empty.implementation!!.instructions.toList()
            require(empty.implementation!!.registerCount == 45)
            fun literalCount(instructions: List<Instruction>, value: Int) =
                instructions.count { (it as? NarrowLiteralInstruction)?.narrowLiteral == value }
            require(literalCount(ei, 0x7f13312a) == 1 && literalCount(ei, 0x7f133127) == 1)
            val body = ei.indices.single { ei[it].opcode == Opcode.MOVE_RESULT_OBJECT &&
                (ei[it] as OneRegisterInstruction).registerA == 19 }
            require(ei[body + 1].opcode == Opcode.CONST_16 &&
                (ei[body + 1] as OneRegisterInstruction).registerA == 18 &&
                ei.count { it.opcode == Opcode.MOVE_RESULT_OBJECT && (it as OneRegisterInstruction).registerA == 26 } == 2)
            val button = ei.indices.single { ref(ei[it]) ==
                "LX/0WY9;->A0L(LX/1Ghm;LX/1GAM;Ljava/lang/Integer;Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V" }
            require(button > body)
            val banner = fp("0D9H", "A00", "Landroid/view/ViewGroup;", listOf(context, "Landroid/view/LayoutInflater;",
                "Landroid/view/View;", session, "LX/0avn;", "Z")).method
            val bi = banner.implementation!!.instructions.toList()
            require(literalCount(bi, 0x7f0b45b0) == 1 && literalCount(bi, 0x7f0e103f) == 1)
            val ret = bi.indices.single { bi[it].opcode == Opcode.RETURN_OBJECT &&
                (bi[it] as OneRegisterInstruction).registerA == 7 }

            feed.returnEarly(false)
            delayed.returnEarly()
            onboarding.returnEarly(false)
            surfaceA.returnEarly(false)
            surfaceB.returnEarly(false)
            controllers.forEach { it.returnEarly(false) }
            quick.addInstructionsWithLabels(q + 4, "goto/16 :skipPrompt", ExternalLabel("skipPrompt", qTarget))
            thread.implementation!!.apply {
                replaceInstruction(t, BuilderInstruction30t(Opcode.GOTO_32, threadTarget))
                // Remove the original move-result and conditional as well: a
                // move-result must never survive without its invoke.
                replaceInstruction(t + 1, BuilderInstruction10x(Opcode.NOP))
                replaceInstruction(t + 2, BuilderInstruction10x(Opcode.NOP))
            }
            // Preserve the non-notification empty-state copy. v40/v41 are scratch
            // registers here and are initialized again before their original use.
            empty.addInstructionsWithLabels(button, "if-eqz v19, :skipButton", ExternalLabel("skipButton", button + 1))
            empty.addInstructionsWithLabels(body + 1, """
                move-object/from16 v40, v26
                const-string v41, "Turn on notifications so you don't miss new messages."
                invoke-static/range {v40 .. v41}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z
                move-result v40
                if-eqz v40, :keepCopy
                const-string v26, ""
                const/16 v19, 0x0
                :keepCopy
                nop
            """)
            banner.addInstructions(ret, """
                const/16 v1, 0x8
                invoke-virtual {v7, v1}, Landroid/view/View;->setVisibility(I)V
            """)
        } else {
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
}
