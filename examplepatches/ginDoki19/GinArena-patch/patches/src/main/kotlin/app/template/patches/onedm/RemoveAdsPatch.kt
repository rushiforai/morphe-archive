package app.template.patches.onedm

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_ONEDM
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private fun FieldReference.toSmali() = "$definingClass->$name:$type"

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
    // v0 is a real local only when p0 is not v0. All of the view methods patched here have
    // at least one local register; findFreeRegister is kept as a safety net for tight methods.
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
    // p1 is the visibility argument; overwriting it avoids needing a spare local register
    // in AppodealBannerView.setVisibilitySuper(), which has no locals.
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
    description = "Removes visible banner/full-screen ads and 1DM+ promotions from free 1DM 20.0 (30257), including the downloads-home VPN promo bar and sponsored browser start-page tiles. User shortcuts remain available.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ONEDM)

    execute {
        // Banner/consent gates: force the app onto its no-ad paths.
        listOf(
            MyAppIsShowConsentAndInitializeAdsFingerprint,
            BrowserIsShowBannerFingerprint,
            BrowserIsShowConsentAndInitializeAdsFingerprint,
            MainIsShowBannerFingerprint,
            TorrentDetailsIsShowBannerFingerprint
        ).forEach { fingerprint ->
            fingerprint.method.returnEarly(false)
        }

        // Consent/SDK init: preserve the original first-call and continuation semantics,
        // but do not initialize Appodeal/Amazon/Smaato or request consent.
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
            MyAppStartBannerManagerFingerprint,
            MyAppShowBannerAdFingerprint,
            MyAppShowBannerAdIfNecessaryFingerprint,
            BannerManagerLoadFingerprint,
            BannerManagerResumeFingerprint,
            BannerManagerPostAdFingerprint,
            BannerManagerRepostAdFingerprint,
            BannerManagerSetNetworkAdShowingAndNotifyFingerprint
        ).forEach { fingerprint ->
            fingerprint.method.returnEarly()
        }

        BannerManagerGetCurrentAdFingerprint.method.returnEarly(null)

        // House/network banner views: keep them gone if any state tries to bind/show them.
        AcrBannerViewSetupAdViewFingerprint.method.hideThisAndReturn()
        AcrBannerViewSetAdFingerprint.method.hideThisAndReturn()
        AcrBannerViewOnAdReceivedFingerprint.method.hideThisAndReturn()
        IdmBannerViewOnFinishInflateFingerprint.method.hideThisAndReturn(
            callSuperOnFinishInflate = true
        )
        NewBannerViewOnFinishInflateFingerprint.method.hideThisAndReturn(
            callSuperOnFinishInflate = true
        )
        AppodealBannerViewSetVisibilityFingerprint.method.forceSuperVisibilityGoneAndReturn()
        AppodealBannerViewSetVisibilitySuperFingerprint.method.forceSuperVisibilityGoneAndReturn()

        // Appodeal adapter (obfuscated): store the mediation manager, but do not init/cache/show ads.
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
        OmCanShowFingerprint.matchAll(2..2).forEach { match ->
            match.method.returnEarly(false)
        }
        OmShowWrappersFingerprint.matchAll(2..2).forEach { match ->
            match.method.returnEarly(false)
        }

        // Central mediation/full-screen helpers.
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

        // Refinements in MainActivity: disable the sale state and hide the drawer upgrade footer.
        // The title method reads the update flag first and the sale flag second; preserve the
        // legitimate update behaviour by only forcing the sale flag assignment in onCreate.
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

        // Patch the later nav_upgrade site first so the earlier sale-site index stays valid.
        val navTempRegister = onCreate.findFreeRegister(navInsertIndex, navViewRegister, onCreate.p0Register)
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

        // Collapse the 60dp banner container everywhere it is inflated.
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

        // Downloads-home promotional strip (`offer_vpnLL`): p1 is this updater's own
        // force-hide flag. Forcing it true reuses the app's existing path that tags the
        // container "0", sets it GONE and returns, so neither the ProtonVPN offer nor the
        // strip's other promo variants can be shown. VPN settings/functionality elsewhere
        // in the app are not touched.
        MainActivityPromoBarFingerprint.matchAll(1..1).first().method.addInstructions(
            0,
            "const/4 p1, 0x1"
        )

        // Modern browser start page: BannerInfo entries are emitted as sponsored shortcut
        // tiles only if isTileAd() (adType == 1) returns true. Returning false removes those
        // database-backed promo tiles even if they were cached before patching. Custom
        // StartPageShortcutStore tiles and the Add Shortcut tile use a separate path.
        BannerInfoIsTileAdFingerprint.method.returnEarly(false)

        // Legacy/simple start page: null its two remotely configured sponsored shortcuts
        // just before their icon CSS is read. getIconCss() accepts null, and the HTML link
        // branches below only render a sponsored button when an object is non-null.
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
