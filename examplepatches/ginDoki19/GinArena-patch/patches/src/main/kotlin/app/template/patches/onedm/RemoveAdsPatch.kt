package app.template.patches.onedm

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.COMPATIBILITY_ONEDM
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private fun FieldReference.toSmali() = "$definingClass->$name:$type"

private fun Instruction.stringOrNull(): String? {
    if (opcode != Opcode.CONST_STRING && opcode != Opcode.CONST_STRING_JUMBO) return null
    return getReference<StringReference>()?.string
}

private fun nullRegisterInstruction(register: Int): String {
    val opcode = if (register < 16) "const/4" else "const/16"
    return "$opcode v$register, 0x0"
}

private fun Method.firstFieldReference(
    opcode: Opcode,
    type: String,
    definingClass: String? = null
): FieldReference {
    return instructions.firstNotNullOfOrNull { instruction ->
        if (instruction.opcode != opcode) return@firstNotNullOfOrNull null
        val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            ?: return@firstNotNullOfOrNull null
        if (reference.type != type) return@firstNotNullOfOrNull null
        if (definingClass != null && reference.definingClass != definingClass) {
            return@firstNotNullOfOrNull null
        }
        reference
    } ?: throw PatchException("Could not find $opcode field of type $type in $this")
}

private fun MutableMethod.tempRegisterAt(index: Int, vararg exclude: Int): Int {
    return if (p0Register > 0) 0 else findFreeRegister(index, p0Register, *exclude)
}

private fun MutableMethod.hideThisAndReturn(callSuperOnFinishInflate: Boolean = false) {
    val tempRegister = tempRegisterAt(0, p0Register)
    val superCall = if (callSuperOnFinishInflate) {
        "invoke-super {p0}, Landroid/view/View;->onFinishInflate()V"
    } else {
        ""
    }

    addInstructions(
        0,
        """
            $superCall
            const/16 v$tempRegister, 0x8
            invoke-virtual {p0, v$tempRegister}, Landroid/view/View;->setVisibility(I)V
            return-void
        """
    )
}

private fun MutableMethod.hideThisBeforeReturn() {
    val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
    if (returnIndex < 0) throw PatchException("No return-void found in $this")
    val tempRegister = tempRegisterAt(returnIndex, p0Register)

    addInstructions(
        returnIndex,
        """
            const/16 v$tempRegister, 0x8
            invoke-virtual {p0, v$tempRegister}, Landroid/view/View;->setVisibility(I)V
        """
    )
}

private fun MutableMethod.forceSuperVisibilityGoneAndReturn() {
    addInstructions(
        0,
        """
            const/16 p1, 0x8
            invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V
            return-void
        """
    )
}

private fun MutableMethod.runRunnableAndReturn(registerName: String, invokeKindAndTarget: String) {
    addInstructions(
        0,
        """
            if-eqz $registerName, :onedm_done
            $invokeKindAndTarget
            :onedm_done
            return-void
        """
    )
}

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads and promotions",
    description = "Removes banner, interstitial, fallback, and Amazon ads, 1DM+ sale/VPN/drawer/rate promotions, sponsored browser tiles, promo FCM topics, and 17 ad/telemetry SDK initializers and native/asset payloads from free 1DM 20.0 (30257).",
    default = true
) {
    compatibleWith(COMPATIBILITY_ONEDM)
    dependsOn(manifestAndBloatPatch)

    execute {
        // 1. Banner/consent/rate-nag boolean gates -> false.
        listOf(
            MyAppIsShowBannerFingerprint,
            MyAppIsShowConsentAndInitializeAdsFingerprint,
            BrowserIsShowBannerFingerprint,
            BrowserIsShowConsentAndInitializeAdsFingerprint,
            MainIsShowBannerFingerprint,
            MainIsShowConsentAndInitializeAdsFingerprint,
            TorrentDetailsIsShowBannerFingerprint,
            RateMeMaybeShouldShowFingerprint,
            AmazonServiceIsInitializedFingerprint,
            AmazonServiceHasAdFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.returnEarly(false)
        }

        // 2. Consent/SDK init: preserve continuation callbacks without starting Appodeal/Amazon/Smaato.
        val currentActivityField = MyAppInitializeAdsAndRunFingerprint.originalMethod
            .firstFieldReference(Opcode.SGET_OBJECT, MYAPP)
            .toSmali()
        val firstInitField = MyAppInitializeConsentAndAdsFingerprint.originalMethod
            .firstFieldReference(Opcode.SGET_OBJECT, "Ljava/util/concurrent/atomic/AtomicBoolean;")
            .toSmali()

        MyAppInitializeConsentAndAdsFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, $firstInitField
                invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z
                move-result v1
                const/4 v2, 0x0
                if-eqz v1, :onedm_already_initialized
                invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
                sget-object v0, $currentActivityField
                if-eqz v0, :onedm_set_current_activity
                invoke-virtual {v0}, $MYAPP->destroyed()Z
                move-result v0
                if-eqz v0, :onedm_run_continuation
                :onedm_set_current_activity
                sput-object p0, $currentActivityField
                :onedm_run_continuation
                if-eqz p1, :onedm_return_true
                invoke-interface {p1}, Ljava/lang/Runnable;->run()V
                :onedm_return_true
                const/4 v0, 0x1
                return v0
                :onedm_already_initialized
                return v2
            """
        )

        MyAppInitializeAdsAndRunFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, $currentActivityField
                if-eqz v0, :onedm_set_current_activity
                invoke-virtual {v0}, $MYAPP->destroyed()Z
                move-result v0
                if-eqz v0, :onedm_run_continuation
                :onedm_set_current_activity
                sput-object p0, $currentActivityField
                :onedm_run_continuation
                if-eqz p1, :onedm_done
                invoke-interface {p1}, Ljava/lang/Runnable;->run()V
                :onedm_done
                return-void
            """
        )

        listOf(
            MyAppLoadBannerAdFingerprint,
            MyAppStartBannerManagerFingerprint,
            MyAppShowBannerAdFingerprint,
            MyAppShowBannerAdIfNecessaryFingerprint,
            BannerManagerLoadFingerprint,
            BannerManagerResumeFingerprint,
            BannerManagerPostAdFingerprint,
            BannerManagerRepostAdFingerprint,
            BannerManagerSetNetworkAdShowingAndNotifyFingerprint,
            AmazonServiceStartFingerprint,
            AmazonServiceFetchFingerprint,
            HouseBannerSyncFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.returnEarly()
        }

        BannerManagerGetCurrentAdFingerprint.method.returnEarly(null)

        // 3. House/network banner views: keep collapsed if any layout inflates or binds them.
        AcrBannerViewSetupAdViewFingerprint.method.hideThisAndReturn()
        AcrBannerViewSetAdFingerprint.method.hideThisAndReturn()
        AcrBannerViewOnAdReceivedFingerprint.method.hideThisAndReturn()
        IdmBannerViewOnFinishInflateFingerprint.method.hideThisAndReturn(callSuperOnFinishInflate = true)
        NewBannerViewOnFinishInflateFingerprint.method.hideThisAndReturn(callSuperOnFinishInflate = true)
        AppodealBannerViewSetVisibilityFingerprint.method.forceSuperVisibilityGoneAndReturn()
        AppodealBannerViewSetVisibilitySuperFingerprint.method.forceSuperVisibilityGoneAndReturn()

        // 4. Appodeal adapter (Li/om;) and SQLite FallbackNetwork adapter (Li/l82;).
        val omInitializeMatch = OmInitializeFingerprint.matchAll(1..1).first()
        val omManagerField = omInitializeMatch.originalMethod
            .firstFieldReference(Opcode.IPUT_OBJECT, PP0, definingClass = "Li/om;")
            .toSmali()
        omInitializeMatch.method.addInstructions(
            0,
            """
                iput-object p2, p0, $omManagerField
                return-void
            """
        )

        OmCacheFingerprint.matchAll(1..1).first().method.returnEarly()
        OmInterstitialFingerprint.matchAll(1..1).first().method.runRunnableAndReturn(
            registerName = "p2",
            invokeKindAndTarget = "invoke-interface {p2}, Ljava/lang/Runnable;->run()V"
        )
        OmCanShowFingerprint.matchAll(2..2).forEach { it.method.returnEarly(false) }
        OmShowWrappersFingerprint.matchAll(2..2).forEach { it.method.returnEarly(false) }

        val fallbackNetworkClass = FallbackNetworkTagFingerprint.matchAll(1..1).first().classDef
        fallbackNetworkClass.methods.forEach { method ->
            if (method.name == "<init>" || method.name == "getTag") return@forEach
            val params = method.parameterTypes.map { it.toString() }
            when {
                params == listOf(MYAPP, "Ljava/lang/Runnable;") && method.returnType == "V" ->
                    method.runRunnableAndReturn(
                        registerName = "p2",
                        invokeKindAndTarget = "invoke-interface {p2}, Ljava/lang/Runnable;->run()V"
                    )
                method.returnType == "V" -> method.returnEarly()
                method.returnType == "Z" -> method.returnEarly(false)
                method.returnType == "D" -> method.returnEarly(0.0)
            }
        }

        // 5. Central mediation/full-screen helpers & pp0 waterfall loops.
        val centralFullScreenMatch = CentralFullScreenHelperFingerprint.matchAll(1..1).first()
        val continuationType = centralFullScreenMatch.originalMethod.parameterTypes[2].toString()
        centralFullScreenMatch.method.runRunnableAndReturn(
            registerName = "p2",
            invokeKindAndTarget = "invoke-virtual {p2}, $continuationType->run()V"
        )
        CentralNetworkBannerHelperFingerprint.matchAll(1..1).first().method.returnEarly()
        Pp0BannerResumeFingerprint.matchAll(1..1).first().method.returnEarly()
        Pp0FullScreenSelectorFingerprint.matchAll(1..1).first().method.returnEarly(false)
        Pp0RefreshTimerFingerprint.matchAll(1..1).first().method.returnEarly()

        // Also disarm the pp0 case inside the shared Runnable/TimerTask dispatcher (Li/q6;->run).
        val dispatcherRun = RunnableDispatcherRunFingerprint.matchAll(1..1).first().method
        val pp0CastIdx = dispatcherRun.instructions.indexOfFirst { insn ->
            insn.opcode == Opcode.CHECK_CAST && insn.getReference<TypeReference>()?.type == PP0
        }
        if (pp0CastIdx < 0) throw PatchException("Could not find $PP0 case in $dispatcherRun")
        dispatcherRun.addInstructionsAtControlFlowLabel(pp0CastIdx + 1, "return-void")

        // 6. BrowserApp.initApp: skip Play Store InstallReferrerClient IPC and BannerManager.load
        // via structured in-place boolean-gate overrides (preserving try_items and CFG integrity).
        val initApp = BrowserAppInitAppFingerprint.matchAll(1..1).first().method
        val addObserverIdx = initApp.instructions.indexOfFirst { insn ->
            insn.getReference<MethodReference>()?.name == "addObserver"
        }
        if (addObserverIdx < 0) throw PatchException("Could not find addObserver in $initApp")
        val torrentConfigIdx = (addObserverIdx + 1 until initApp.instructions.size).firstOrNull { idx ->
            val insn = initApp.getInstruction(idx)
            val ref = insn.getReference<MethodReference>() ?: return@firstOrNull false
            insn.opcode == Opcode.INVOKE_STATIC &&
                ref.parameterTypes.isEmpty() &&
                ref.definingClass == ref.returnType &&
                ref.definingClass != "Li/xk;"
        } ?: throw PatchException("Could not find post-referrer torrent config block in $initApp")
        val initAppGates = (addObserverIdx + 1 until torrentConfigIdx).filter { idx ->
            initApp.getInstruction(idx).opcode == Opcode.IGET_BOOLEAN &&
                initApp.getInstruction(idx + 1).opcode == Opcode.IF_NEZ
        }
        if (initAppGates.size != 2) {
            throw PatchException("Expected 2 boolean gates (InstallReferrer + BannerManager) in $initApp, found ${initAppGates.size}")
        }
        initAppGates.forEach { gateIdx ->
            val gateReg = (initApp.getInstruction(gateIdx) as TwoRegisterInstruction).registerA
            initApp.replaceInstruction(gateIdx, "const/4 v$gateReg, 0x1")
        }

        // 7. ActivityLifecycleListener: strip post-ad WebView timer hack, resume interstitial check,
        // and AudioManager ad-volume tracking via structured in-place replacements (0 dead blocks).
        val onResumed = LifecycleOnActivityResumedFingerprint.matchAll(1..1).first().method
        if (onResumed.getInstruction(0).opcode != Opcode.INVOKE_STATIC ||
            onResumed.getInstruction(1).opcode != Opcode.MOVE_RESULT ||
            onResumed.getInstruction(2).opcode != Opcode.IF_NEZ
        ) {
            throw PatchException("Unexpected WebView-timer gate at start of $onResumed")
        }
        val resumedGateReg = (onResumed.getInstruction(1) as OneRegisterInstruction).registerA
        onResumed.replaceInstruction(0, "nop")
        onResumed.replaceInstruction(1, "const/4 v$resumedGateReg, 0x1")

        val appWasMinimizedIdx = onResumed.instructions.indexOfFirst { insn ->
            insn.opcode == Opcode.IGET_OBJECT &&
                insn.getReference<FieldReference>()?.name == "appWasMinimized"
        }
        if (appWasMinimizedIdx < 0 ||
            onResumed.getInstruction(appWasMinimizedIdx + 1).opcode != Opcode.INVOKE_VIRTUAL ||
            onResumed.getInstruction(appWasMinimizedIdx + 2).opcode != Opcode.MOVE_RESULT
        ) {
            throw PatchException("Unexpected appWasMinimized check layout in $onResumed")
        }
        val minGateReg = (onResumed.getInstruction(appWasMinimizedIdx + 2) as OneRegisterInstruction).registerA
        onResumed.replaceInstruction(appWasMinimizedIdx + 1, "nop")
        onResumed.replaceInstruction(appWasMinimizedIdx + 2, "const/4 v$minGateReg, 0x0")

        val onStateChanged = LifecycleOnStateChangedFingerprint.matchAll(1..1).first().method
        onStateChanged.instructions.withIndex().forEach { (idx, insn) ->
            val mRef = insn.getReference<MethodReference>()
            if (insn.opcode == Opcode.INVOKE_STATIC &&
                mRef?.parameterTypes?.map { it.toString() } == listOf("Landroid/media/AudioManager;") &&
                mRef.returnType == "I" &&
                onStateChanged.getInstruction(idx + 1).opcode == Opcode.MOVE_RESULT
            ) {
                val volReg = (onStateChanged.getInstruction(idx + 1) as OneRegisterInstruction).registerA
                onStateChanged.replaceInstruction(idx, "nop")
                onStateChanged.replaceInstruction(idx + 1, "const/4 v$volReg, 0x0")
            }
            val fRef = insn.getReference<FieldReference>()
            if (insn.opcode == Opcode.SPUT_OBJECT && fRef?.type == "Ljava/lang/Integer;") {
                onStateChanged.replaceInstruction(idx, "nop")
            }
        }

        // 8. MainActivity startup worker (Li/d34;->doInBackground): skip FirebaseMessaging topic RPCs
        // ("notify" / "notify_v2") before FirebaseMessaging.getInstance() is invoked.
        val doInBackground = MainStartupTaskDoInBackgroundFingerprint.matchAll(1..1).first().method
        val fcmStartIdx = doInBackground.instructions.indexOfFirst { insn ->
            insn.getReference<MethodReference>()?.definingClass ==
                "Lcom/google/firebase/messaging/FirebaseMessaging;"
        }
        val notifyV2SubIdx = doInBackground.instructions.indexOfFirst { insn ->
            val ref = insn.getReference<MethodReference>() ?: return@indexOfFirst false
            ref.definingClass == "Lcom/google/firebase/messaging/FirebaseMessaging;" &&
                ref.name == "subscribeToTopic"
        }
        if (fcmStartIdx < 0 || notifyV2SubIdx < 0) {
            throw PatchException("Could not find FirebaseMessaging topic calls in $doInBackground")
        }
        val afterFcmIdx = notifyV2SubIdx + 8
        if (doInBackground.getInstruction(afterFcmIdx - 2).opcode != Opcode.MOVE_EXCEPTION) {
            throw PatchException("Unexpected catch layout after subscribeToTopic in $doInBackground")
        }
        doInBackground.addInstructionsWithLabels(
            fcmStartIdx,
            "goto :onedm_skip_fcm_topics",
            ExternalLabel("onedm_skip_fcm_topics", doInBackground.getInstruction(afterFcmIdx))
        )

        // 9. Refinements in MainActivity: disable the sale state and hide the drawer upgrade footer.
        val titleBooleanFields = MainActivityTitleFingerprint.originalMethod.instructions.mapNotNull { instruction ->
            if (instruction.opcode != Opcode.IGET_BOOLEAN) return@mapNotNull null
            val reference = instruction.getReference<FieldReference>() ?: return@mapNotNull null
            if (reference.definingClass != MAIN_ACTIVITY || reference.type != "Z") {
                return@mapNotNull null
            }
            reference
        }
        val saleField = titleBooleanFields.getOrNull(1)
            ?: throw PatchException("Could not identify the 1DM+ sale flag from the title method")
        val saleFieldSmali = saleField.toSmali()

        val onCreateMatch = MainActivityOnCreateNavUpgradeFingerprint.matchAll(1..1).first()
        val onCreate = onCreateMatch.method
        val navMoveResult = onCreateMatch.instructionMatches.last()
        val navViewRegister = navMoveResult.getInstruction<OneRegisterInstruction>().registerA
        val navInsertIndex = navMoveResult.index + 1

        val salePut = onCreateMatch.originalMethod.instructions.withIndex().firstOrNull { (_, instruction) ->
            if (instruction.opcode != Opcode.IPUT_BOOLEAN) return@firstOrNull false
            val reference = instruction.getReference<FieldReference>() ?: return@firstOrNull false
            reference.toSmali() == saleFieldSmali
        } ?: throw PatchException("Could not find sale flag assignment in MainActivity.onCreate")
        val saleSourceRegister = (salePut.value as TwoRegisterInstruction).registerA

        val navTempRegister = onCreate.findFreeRegister(navInsertIndex, navViewRegister, onCreate.p0Register)
        if (navTempRegister > 15 || navViewRegister > 15 || saleSourceRegister > 15) {
            throw PatchException("MainActivity.onCreate requires 4-bit registers for View.setVisibility / sale flag")
        }
        onCreate.addInstructions(
            navInsertIndex,
            """
                const/16 v$navTempRegister, 0x8
                invoke-virtual {v$navViewRegister, v$navTempRegister}, Landroid/view/View;->setVisibility(I)V
            """
        )
        onCreate.addInstructionsAtControlFlowLabel(
            salePut.index,
            "const/4 v$saleSourceRegister, 0x0"
        )

        // 10. Collapse the 60dp banner container everywhere it is inflated.
        MaxHeightConstructorTwoArgsFingerprint.method.hideThisBeforeReturn()
        MaxHeightConstructorThreeArgsFingerprint.method.hideThisBeforeReturn()
        MaxHeightOnMeasureFingerprint.method.addInstructions(
            0,
            """
                const/4 p1, 0x0
                const/4 p2, 0x0
                invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V
                return-void
            """
        )

        // 11. Downloads-home promotional strip (`offer_vpnLL`) and browser sponsored start-page tiles.
        MainActivityPromoBarFingerprint.matchAll(1..1).first().method.addInstructions(
            0,
            "const/4 p1, 0x1"
        )

        BannerInfoIsTileAdFingerprint.method.returnEarly(false)

        val legacyStartPageMatch = LegacyStartPageHomepageFingerprint.matchAll(1..1).first()
        val firstSponsoredShortcutMatch = legacyStartPageMatch.instructionMatches[0]
        val secondSponsoredShortcutMatch = legacyStartPageMatch.instructionMatches[1]
        val firstSponsoredShortcutRegister =
            firstSponsoredShortcutMatch.getInstruction<FiveRegisterInstruction>().registerC
        val secondSponsoredShortcutRegister =
            secondSponsoredShortcutMatch.getInstruction<FiveRegisterInstruction>().registerC
        legacyStartPageMatch.method.addInstructionsAtControlFlowLabel(
            firstSponsoredShortcutMatch.index,
            """
                ${nullRegisterInstruction(firstSponsoredShortcutRegister)}
                ${nullRegisterInstruction(secondSponsoredShortcutRegister)}
            """
        )
    }
}
