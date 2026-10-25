package app.template.patches.firefox.misc.promotions

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.returnEarly
import app.template.patches.firefox.shared.concreteMethod
import app.template.patches.firefox.shared.fieldRef
import app.template.patches.firefox.shared.firefoxClass
import app.template.patches.firefox.shared.insns
import app.template.patches.firefox.shared.methodRef
import app.template.patches.firefox.shared.moveResultRegister
import app.template.patches.firefox.shared.params
import app.template.patches.firefox.shared.registers
import app.template.patches.firefox.shared.returnNull
import app.template.patches.firefox.shared.returnUnit
import app.template.patches.firefox.shared.settingsGetter
import app.template.patches.firefox.shared.smali
import app.template.patches.firefox.shared.typeRef
import app.template.patches.shared.Constants.COMPATIBILITY_FIREFOX
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

internal const val NIMBUS_MESSAGING_STORAGE = "Lmozilla/components/service/nimbus/messaging/NimbusMessagingStorage;"
internal const val MESSAGE_NOTIFICATION_WORKER = "Lorg/mozilla/fenix/messaging/MessageNotificationWorker;"
internal const val WORKER_RESULT_SUCCESS = "Landroidx/work/ListenableWorker\$Result\$Success;"
internal const val HOME_ACTIVITY = "Lorg/mozilla/fenix/HomeActivity;"
internal const val BROWSERS_COMPANION = "Lmozilla/components/support/utils/Browsers\$Companion;"
internal const val SET_AS_DEFAULT_PROMPT_LAMBDA = "Lorg/mozilla/fenix/HomeActivity\$maybeShowSetAsDefaultBrowserPrompt\$1;"
internal const val ONBOARDING_MAPPER_LAMBDA_PREFIX = "Lorg/mozilla/fenix/onboarding/view/OnboardingMapperKt\$\$"
internal const val ONBOARDING_CARD_DATA = "Lorg/mozilla/fenix/nimbus/OnboardingCardData;"
internal const val ONBOARDING_CARD_TYPE = "Lorg/mozilla/fenix/nimbus/OnboardingCardType;"
internal const val CONTINUOUS_ONBOARDING_FEATURE = "Lorg/mozilla/fenix/onboarding/continuous/ContinuousOnboardingFeature;"
internal const val SHOW_REVIEW_PROMPT_BINDING = "Lorg/mozilla/fenix/reviewprompt/ShowReviewPromptBinding;"

@Suppress("unused")
val hidePromotionalPromptsPatch = bytecodePatch(
    name = "Hide promotional prompts",
    description = "Hides default browser, rating and promo prompts.",
) {
    compatibleWith(COMPATIBILITY_FIREFOX)

    execute {
        // ── 1. Nimbus messages (home cards, notifications): there is never a next message ───
        //  getNextMessage(surface, messages) is the public entry every surface asks; its
        //  private 4-argument overload is only called from it. The result is nullable.
        concreteMethod(NIMBUS_MESSAGING_STORAGE, "getNextMessage", listOf("Ljava/lang/String;", "Ljava/util/List;"))
            .returnNull()

        // ── 2. Microsurveys read as switched off ────────────────────────────────────────────
        settingsGetter("getMicrosurveyFeatureEnabled").returnEarly(false)

        // ── 3. The message notification worker succeeds without posting anything ────────────
        //  Result.success() is the `new Result$Success` + `<init>()V` the method already uses.
        val doWork = concreteMethod(MESSAGE_NOTIFICATION_WORKER, "doWork", listOf("Lkotlin/coroutines/Continuation;"))
        val successInit = doWork.insns().firstNotNullOfOrNull { insn ->
            insn.methodRef()?.takeIf {
                insn.opcode == Opcode.INVOKE_DIRECT && it.definingClass == WORKER_RESULT_SUCCESS && it.name == "<init>" &&
                    it.parameterTypes.isEmpty()
            }
        } ?: throw PatchException("$MESSAGE_NOTIFICATION_WORKER->doWork builds no $WORKER_RESULT_SUCCESS")
        doWork.addInstructionsChecked(
            0,
            """
                new-instance v0, $WORKER_RESULT_SUCCESS
                invoke-direct {v0}, ${successInit.smali()}
                return-object v0
            """,
        )

        // ── 4. "Set as default browser" system prompt at start: Firefox reads as default ────
        //  HomeActivity.onCreate inlines maybeShowSetAsDefaultBrowserPrompt(shouldShow,
        //  isDefaultBrowser, sdk >= Q). The single Browsers.isDefaultBrowser(Context) result is
        //  set to true right after its move-result; it only feeds that check.
        val onCreate = concreteMethod(HOME_ACTIVITY, "onCreate", listOf("Landroid/os/Bundle;"))
        val onCreateInsns = onCreate.insns()
        val isDefaultCalls = onCreateInsns.indices.filter {
            onCreateInsns[it].opcode == Opcode.INVOKE_STATIC &&
                onCreateInsns[it].methodRef()?.let { ref ->
                    ref.definingClass == BROWSERS_COMPANION && ref.name == "isDefaultBrowser" &&
                        ref.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;")
                } == true
        }
        val isDefaultCall = isDefaultCalls.singleOrNull()
            ?: throw PatchException("$HOME_ACTIVITY.onCreate calls isDefaultBrowser ${isDefaultCalls.size} times, expected 1")
        val isDefaultRegister = onCreate.moveResultRegister(isDefaultCall + 1)
        val promptWindow = onCreateInsns.subList(isDefaultCall, minOf(onCreateInsns.size, isDefaultCall + 60))
        val checksSdkQ = promptWindow.take(6).any {
            it.opcode == Opcode.CONST_16 && (it as NarrowLiteralInstruction).narrowLiteral == 0x1d
        }
        val showsPrompt = promptWindow.any {
            it.opcode == Opcode.SGET_OBJECT && it.fieldRef()?.definingClass == SET_AS_DEFAULT_PROMPT_LAMBDA
        }
        if (!checksSdkQ || !showsPrompt) {
            throw PatchException(
                "$HOME_ACTIVITY.onCreate: isDefaultBrowser is not the default-browser prompt check " +
                    "(SDK Q check $checksSdkQ, prompt lambda $showsPrompt)",
            )
        }
        onCreate.requireNoBranchTargetAt(isDefaultCall + 2, "forcing isDefaultBrowser true")
        onCreate.addInstructionChecked(isDefaultCall + 2, "const/16 v$isDefaultRegister, 0x1")

        // ── 5. Onboarding: no "Set as default" card and no Sync sign-in page ────────────────
        //  toPageUiData filters the Nimbus cards through an R8 lambda capturing (showDefaultBrowser,
        //  showNotification, showAddWidget, showToolbar), found by shape: the only Function1 in
        //  OnboardingMapperKt with an <init>(ZZZZ)V. Its first flag is forced false. The Sync
        //  sign-in card has no flag (it only checks the card's enabled), so the filter answers
        //  false for SYNC_SIGN_IN. Terms of service, notifications, widget, toolbar and marketing
        //  pages stay; sign-in in the menu and settings is untouched.
        val lambdas = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith(ONBOARDING_MAPPER_LAMBDA_PREFIX) &&
                "Lkotlin/jvm/functions/Function1;" in classDef.interfaces &&
                classDef.methods.any { it.name == "<init>" && it.params() == listOf("Z", "Z", "Z", "Z") }
            ) {
                lambdas += classDef.type
            }
        }
        val lambda = firefoxClass(
            lambdas.singleOrNull() ?: throw PatchException("Expected one OnboardingMapperKt (ZZZZ) Function1, found $lambdas"),
        )
        val lambdaInit = concreteMethod(lambda.type, "<init>", listOf("Z", "Z", "Z", "Z"))
        val filter = concreteMethod(lambda.type, "invoke", listOf("Ljava/lang/Object;"))
        // Proves p1 is the DEFAULT_BROWSER flag (158.0: f$0, WhenMappings case 1 = ordinal 1)
        // before anything is edited; a reordered capture list fails here instead of hiding
        // another card. p1 = v(registers - 4): this plus four booleans.
        proveOnboardingCardFlag(
            lambdaType = lambda.type,
            init = lambdaInit,
            initRegister = lambdaInit.implementation!!.registerCount - 4,
            filter = filter,
            enumType = ONBOARDING_CARD_TYPE,
            constant = "DEFAULT_BROWSER",
        )
        lambdaInit.addInstructionChecked(0, "const/4 p1, 0x0")

        val filterInsns = filter.insns()
        if (filterInsns.firstOrNull()?.let { it.opcode == Opcode.CHECK_CAST && it.typeRef() == ONBOARDING_CARD_DATA } != true) {
            throw PatchException("${lambda.type}->invoke does not start by casting to $ONBOARDING_CARD_DATA")
        }
        val cardTypeCasts = filterInsns.indices.filter {
            filterInsns[it].opcode == Opcode.CHECK_CAST && filterInsns[it].typeRef() == ONBOARDING_CARD_TYPE
        }
        val cardTypeCast = cardTypeCasts.singleOrNull()
            ?: throw PatchException("${lambda.type}->invoke casts to $ONBOARDING_CARD_TYPE ${cardTypeCasts.size} times, expected 1")
        val cardType = (filterInsns[cardTypeCast] as OneRegisterInstruction).registerA
        val locals = filter.implementation!!.registerCount - 2
        // A scratch local other than the card type, written before it is read on the stock path
        // (158.0: v1, set by the WhenMappings sget-object or the const/4 0x1 that follows).
        val scratch = (0 until minOf(locals, 16)).firstOrNull { it != cardType }
            ?: throw PatchException("${lambda.type}->invoke has no scratch register")
        val nextUse = filterInsns.drop(cardTypeCast + 1).firstOrNull { scratch in it.registers() }
        if (nextUse == null || nextUse.opcode !in setOf(Opcode.SGET_OBJECT, Opcode.CONST_4, Opcode.CONST_16)) {
            throw PatchException("${lambda.type}->invoke reads v$scratch before writing it (${nextUse?.opcode})")
        }
        filter.addInstructionsWithLabelsChecked(
            cardTypeCast + 1,
            """
                sget-object v$scratch, $ONBOARDING_CARD_TYPE->SYNC_SIGN_IN:$ONBOARDING_CARD_TYPE
                if-ne v$cardType, v$scratch, :stock
                const/4 v$scratch, 0x0
                invoke-static {v$scratch}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                move-result-object v$scratch
                return-object v$scratch
            """,
            ExternalLabel("stock", filter.getInstruction(cardTypeCast + 1)),
        )

        // ── 6. Follow-up onboarding (day 2/3 default browser, day 5 sign-in, day 7 VPN) ─────
        concreteMethod(CONTINUOUS_ONBOARDING_FEATURE, "start", emptyList()).returnEarly()

        // ── 7. The automatic rating prompt never opens ──────────────────────────────────────
        //  The binding that reacts to "eligible" returns Unit at once. Settings > Rate on Google
        //  Play calls tryLaunchPlayStoreReview directly and keeps working.
        concreteMethod(
            SHOW_REVIEW_PROMPT_BINDING,
            "onState",
            listOf("Lkotlinx/coroutines/flow/Flow;", "Lkotlin/coroutines/Continuation;"),
        ).returnUnit()
    }
}
