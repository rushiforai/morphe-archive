package app.template.patches.cricfy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_CRICFY_TV
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

@Suppress("unused")
val removeAdsProxyAndRestrictionsPatch = bytecodePatch(
    name = "Remove ads, proxy & restrictions",
    description = "Removes CashRaven background bandwidth sharing, all ads and sponsor/unlock gates, " +
        "external browser redirects, the startup Telegram join dialog, promo marquee banners, " +
        "forced-update lockouts, and promo push notifications. Optional clone/sniffer-check " +
        "bypass and native-library stripping are off by default.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRICFY_TV)

    dependsOn(nativeIntegrityAndDebloatPatch)

    val hidePromoMarquee by booleanOption(
        key = "hidePromoMarquee",
        default = true,
        title = "Hide promo marquee ticker",
        description = "Hides the scrolling announcement/redirect marquee bar on Home and Player screens.",
    )

    val bypassUpdateGate by booleanOption(
        key = "bypassUpdateGate",
        default = true,
        title = "Bypass update & force-update screen",
        description = "Skips optional and forced update prompts on Splash startup.",
    )

    val blockPromoPushNotifications by booleanOption(
        key = "blockPromoPushNotifications",
        default = true,
        title = "Block promotional push notifications",
        description = "Suppresses promotional/browser-redirect FCM notifications and skips the startup " +
            "notification permission prompt while preserving silent RemoteConfig API updates.",
    )

    val bypassEnvironmentChecks by booleanOption(
        key = "bypassEnvironmentChecks",
        default = false,
        title = "Bypass clone, work-profile & sniffer checks",
        description = "Allows running inside work profiles, app cloners, or alongside HTTP debugging tools.",
    )

    // Register shared native/asset strip option on this user-facing patch.
    stripNativeBloatOption()

    execute {
        // ====================================================================
        // 1. Remove CashRaven Bandwidth-Sharing Proxy & Guard Drawer UI
        // ====================================================================

        // 1a. Strip CashRaven init + forced optIn() + lifecycle hook from App.onCreate()
        // while keeping Koin DI, Firebase Messaging, and Firebase RemoteConfig ("cric_api2") intact.
        // Also supports idempotent re-patching if the input APK already had CashRaven removed.
        run {
            if (AppOnCreateFingerprint.matchOrNull() != null) {
                val appOnCreate = AppOnCreateFingerprint.repairedMethod
                val matches = AppOnCreateFingerprint.instructionMatches
                val superIdx = matches[0].index
                val optInIdx = matches[2].index
                val lifecycleIdx = matches[3].index
                val insns = appOnCreate.instructions

                val thisReg = (insns[superIdx] as FiveRegisterInstruction).registerC

                val nullReg = ((superIdx + 1) until optInIdx)
                    .map { insns[it] }
                    .first { it.opcode == Opcode.CONST_4 && (it as NarrowLiteralInstruction).narrowLiteral == 0 }
                    .let { (it as OneRegisterInstruction).registerA }

                val selfAliasReg = ((superIdx + 1) until optInIdx)
                    .map { insns[it] }
                    .first { it.opcode == Opcode.MOVE_OBJECT && (it as TwoRegisterInstruction).registerB == thisReg }
                    .let { (it as TwoRegisterInstruction).registerA }

                val oneReg = ((optInIdx + 1) until lifecycleIdx)
                    .map { insns[it] }
                    .first { it.opcode == Opcode.CONST_4 && (it as NarrowLiteralInstruction).narrowLiteral == 1 }
                    .let { (it as OneRegisterInstruction).registerA }

                appOnCreate.removeInstructions(superIdx + 1, lifecycleIdx - superIdx)
                appOnCreate.addInstructions(
                    superIdx + 1,
                    """
                        const/4 v$nullReg, 0x0
                        move-object v$selfAliasReg, v$thisReg
                        const/4 v$oneReg, 0x1
                    """,
                )
            } else {
                // Verify App.onCreate exists AND truly has no CashRaven references (already patched or CR-free build).
                val baseMethod = AppOnCreateBaseFingerprint.originalMethod
                if (baseMethod.referencesDescriptor("Lio/cashraven/sdk/")) {
                    throw AppOnCreateFingerprint.patchException()
                }
            }
        }

        // 1b. Cleanly replace App.c(Context), AppExitGuardService.onTaskRemoved,
        // CashRavenService.onStartCommand, and CrBootReceiver.onReceive bodies.
        if (AppStartServicesFingerprint.matchOrNull() != null) {
            replaceMethodBody(AppStartServicesFingerprint.repairedMethod, "return-void")
        } else {
            val appClass = AppOnCreateBaseFingerprint.originalClassDef
            if (appClass.methods.any { it.referencesDescriptor("Lio/cashraven/sdk/CashRavenService") }) {
                throw AppStartServicesFingerprint.patchException()
            }
        }

        if (AppExitGuardTaskRemovedFingerprint.matchOrNull() != null) {
            replaceMethodBody(
                AppExitGuardTaskRemovedFingerprint.repairedMethod,
                """
                    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V
                    invoke-super {p0, p1}, Landroid/app/Service;->onTaskRemoved(Landroid/content/Intent;)V
                    return-void
                """,
            )
        }

        if (CashRavenServiceStartFingerprint.matchOrNull() != null) {
            replaceMethodBody(
                CashRavenServiceStartFingerprint.repairedMethod,
                """
                    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V
                    const/4 v0, 0x2
                    return v0
                """,
            )
        }

        if (CrBootReceiverFingerprint.matchOrNull() != null) {
            replaceMethodBody(CrBootReceiverFingerprint.repairedMethod, "return-void")
        }

        // 1c. Extract the "Bandwidth Sharing" menu item ID dynamically and bypass its drawer click branch
        // so App.a() can never throw UninitializedPropertyAccessException("cashRaven").
        val bandwidthMenuItemId: Int? = if (DrawerMenuClickHandlerFingerprint.matchOrNull() != null) {
            val drawerClickMethod = DrawerMenuClickHandlerFingerprint.repairedMethod
            val matches = DrawerMenuClickHandlerFingerprint.instructionMatches
            val idConstIdx = matches[1].index
            val branchIdx = matches[2].index

            val itemId = (drawerClickMethod.instructions[idConstIdx] as NarrowLiteralInstruction).narrowLiteral
            val branchInsn = drawerClickMethod.instructions[branchIdx]
            if (branchInsn.opcode != Opcode.GOTO_32) {
                val skipBranch = branchInsn as BuilderOffsetInstruction
                drawerClickMethod.replaceInstruction(
                    branchIdx,
                    BuilderInstruction30t(Opcode.GOTO_32, skipBranch.target),
                )
            }
            itemId
        } else {
            null
        }

        // ====================================================================
        // 2. Complete Ad, Sponsor-Gate, Redirect & Telegram Popup Removal
        // ====================================================================

        // 2a–2c. Disable Unity Ads startup initializer and replace all AdsManager (`Lm7;`)
        // ad/banner/redirect/gate methods after resolving all fingerprints against the original class.
        if (AdsSdkInitializerFingerprint.matchOrNull() != null) {
            replaceMethodBody(AdsSdkInitializerFingerprint.repairedMethod, "return-void")
        }

        run {
            repairClassPayloads(AdsManagerConstructorFingerprint.originalClassDef.type)

            val adsCtor = AdsManagerConstructorFingerprint.method
            val unityGateIdx = AdsManagerConstructorFingerprint.instructionMatches[1].index
            val unityGateInsn = adsCtor.instructions[unityGateIdx]

            if (unityGateInsn.opcode != Opcode.GOTO_32) {
                val alertGateMethod = AlertGateCheckFingerprint.method
                val bannerEnabledMethod = SponsorBannerEnabledFingerprint.method
                val bannerRenderMethod = SponsorBannerRenderFingerprint.method
                val unityScheduleMethod = UnityAdScheduleFingerprint.method
                val redirectLaunchMethod = AdRedirectLaunchFingerprint.method
                val gateMethod = SponsorGateFingerprint.method

                // Skip UnityAds.initialize() inside AdsManager.<init>.
                val unityGate = unityGateInsn as BuilderOffsetInstruction
                adsCtor.replaceInstruction(
                    unityGateIdx,
                    BuilderInstruction30t(Opcode.GOTO_32, unityGate.target),
                )

                // Disable AlertNew gates (m7.a), banners (m7.b & m7.c), Unity interstitial/rewarded load (m7.d),
                // and external browser / WebActivity ad redirects (m7.e).
                replaceMethodBody(
                    alertGateMethod,
                    """
                        const/4 v0, 0x0
                        return v0
                    """,
                )

                replaceMethodBody(
                    bannerEnabledMethod,
                    """
                        const/4 v0, 0x0
                        return v0
                    """,
                )

                replaceMethodBody(bannerRenderMethod, "return-void")
                replaceMethodBody(unityScheduleMethod, "return-void")
                replaceMethodBody(redirectLaunchMethod, "return-void")

                // Bypass ALL pre-playback sponsor gates in m7.g (sponsors[1] locked channel dialog,
                // sponsors[2] countdown WebActivity, sponsors[3] external browser redirect) by replacing
                // the entire method body with direct invocation of the stream-open callback (`p3.invoke()`).
                val gateInsns = gateMethod.instructions
                val directOpenIdx = gateInsns.indices.lastOrNull { idx ->
                    idx < gateInsns.lastIndex &&
                        gateInsns[idx].opcode == Opcode.INVOKE_INTERFACE_RANGE &&
                        gateInsns[idx + 1].opcode == Opcode.RETURN_VOID
                } ?: error("Could not locate direct-open callback exit in sponsor gate method.")

                val callbackInvokeRef = (gateInsns[directOpenIdx] as ReferenceInstruction).reference
                replaceMethodBody(
                    gateMethod,
                    """
                        invoke-interface/range {p3 .. p3}, $callbackInvokeRef
                        return-void
                    """,
                )
            }
        }

        // 2d. Patch MainActivity.onCreate:
        //   - Skip startup Telegram join popup (`DialogTgJoinBinding` / `dialog_alert` / `start_alert`)
        //   - Skip startup full-screen custom ad (`CustomAdFullBinding` / `fullTries`)
        //   - Remove "Bandwidth Sharing" menu item from NavigationView drawer on both Phone/Tablet & Android TV
        run {
            val mainOnCreate = MainActivityOnCreateFingerprint.repairedMethod
            val matches = MainActivityOnCreateFingerprint.instructionMatches
            val sharedNavListenerIdx = matches[1].index
            val backDispatcherIdx = matches[2].index
            val dialogAlertIdx = matches[3].index
            val tgInflateIdx = matches[4].index
            val fullTriesIdx = matches[5].index
            val customAdInflateIdx = matches[6].index
            val insns = mainOnCreate.instructions

            // Replace CustomAdFull enabled check with unconditional skip jump if not already patched.
            val adGateIdx = (fullTriesIdx - 1 downTo tgInflateIdx).firstOrNull { idx ->
                val insn = insns[idx]
                (insn.opcode == Opcode.IF_EQZ || insn.opcode == Opcode.GOTO_32) &&
                    (insn as BuilderOffsetInstruction).target.location.index > customAdInflateIdx
            } ?: error("Could not find CustomAdFull gate branch in MainActivity.onCreate.")
            if (insns[adGateIdx].opcode != Opcode.GOTO_32) {
                val adGate = insns[adGateIdx] as BuilderOffsetInstruction
                mainOnCreate.replaceInstruction(
                    adGateIdx,
                    BuilderInstruction30t(Opcode.GOTO_32, adGate.target),
                )
            }

            // Replace Telegram DialogTgJoinBinding startup alert gate with unconditional skip jump if not already patched.
            val tgGateIdx = ((dialogAlertIdx - 1) downTo (dialogAlertIdx - 12).coerceAtLeast(0))
                .lastOrNull { idx ->
                    val insn = insns[idx]
                    (insn.opcode == Opcode.IF_NEZ || insn.opcode == Opcode.GOTO_32) &&
                        (insn as BuilderOffsetInstruction).target.location.index in (tgInflateIdx + 1)..fullTriesIdx
                } ?: error("Could not find DialogTgJoin startup alert gate branch in MainActivity.onCreate.")
            if (insns[tgGateIdx].opcode != Opcode.GOTO_32) {
                val tgGate = insns[tgGateIdx] as BuilderOffsetInstruction
                mainOnCreate.replaceInstruction(
                    tgGateIdx,
                    BuilderInstruction30t(Opcode.GOTO_32, tgGate.target),
                )
            }

            // Remove the dead "Bandwidth Sharing" entry from NavigationView's Menu if not already inserted.
            if (bandwidthMenuItemId != null && backDispatcherIdx == sharedNavListenerIdx + 1) {
                val navListenerCall = insns[sharedNavListenerIdx] as FiveRegisterInstruction
                val navViewReg = navListenerCall.registerC
                val idScratchReg = navListenerCall.registerD

                mainOnCreate.addInstructions(
                    sharedNavListenerIdx + 1,
                    """
                        invoke-virtual {v$navViewReg}, Lcom/google/android/material/navigation/NavigationView;->getMenu()Landroid/view/Menu;
                        move-result-object v$navViewReg
                        const v$idScratchReg, $bandwidthMenuItemId
                        invoke-interface {v$navViewReg, v$idScratchReg}, Landroid/view/Menu;->removeItem(I)V
                    """,
                )
            } else {
                check(bandwidthMenuItemId == null || backDispatcherIdx == sharedNavListenerIdx + 5) {
                    "Unexpected instruction sequence after shared NavigationView listener in MainActivity.onCreate."
                }
            }
        }

        // 2e. Hide scrolling promo marquee ticker & external browser click redirect across Home & Player screens.
        if (hidePromoMarquee == true) {
            replaceMethodBody(PromoMarqueeFingerprint.repairedMethod, "return-void")
        }

        // ====================================================================
        // 3. Anti-Sniffer, Clone/Work-Profile, Update Gate & Push Refinements
        // ====================================================================

        if (bypassEnvironmentChecks == true || blockPromoPushNotifications == true) {
            if (SplashOnCreateFingerprint.matchOrNull() != null) {
                val splashOnCreate = SplashOnCreateFingerprint.repairedMethod
                val splashMatches = SplashOnCreateFingerprint.instructionMatches

                // Apply bottom-to-top on Splash.onCreate so earlier instruction indices stay valid:
                // 1. Skip Android 13+ POST_NOTIFICATIONS runtime permission prompt when promo pushes are blocked.
                if (blockPromoPushNotifications == true) {
                    val permIfLtIdx = splashMatches[5].index
                    val permSkipTargetIdx = (splashOnCreate.instructions[permIfLtIdx] as BuilderOffsetInstruction)
                        .target.location.index
                    val sdkReadIdx = permIfLtIdx - 2
                    splashOnCreate.removeInstructions(sdkReadIdx, permSkipTargetIdx - sdkReadIdx)
                }

                // 2. Strip Splash's package/work-profile("999")/clone/sniffer gate and trailing finishAffinity()
                // so startup falls straight into the normal config fetch (`U().j()`).
                if (bypassEnvironmentChecks == true) {
                    if (PacketSnifferCheckFingerprint.matchOrNull() != null) {
                        replaceMethodBody(
                            PacketSnifferCheckFingerprint.repairedMethod,
                            """
                                const/4 v0, 0x1
                                return v0
                            """,
                        )
                    }

                    val cloneCheckStartIdx = splashMatches[0].index
                    val normalConfigLoadIdx = splashMatches[3].index
                    val trailingFinishIdx = splashMatches[4].index

                    check(trailingFinishIdx == normalConfigLoadIdx + 4) {
                        "Unexpected Splash.onCreate control-flow layout ($trailingFinishIdx != ${normalConfigLoadIdx + 4})."
                    }

                    splashOnCreate.removeInstructions(normalConfigLoadIdx + 3, 2)
                    splashOnCreate.removeInstructions(cloneCheckStartIdx, normalConfigLoadIdx - cloneCheckStartIdx)
                }
            } else {
                // Re-patching an already-patched Splash.onCreate: verify expected gates are already absent.
                val baseSplash = SplashOnCreateBaseFingerprint.originalMethod
                if (bypassEnvironmentChecks == true && baseSplash.containsStringLiteral("999")) {
                    throw SplashOnCreateFingerprint.patchException()
                }
                if (bypassEnvironmentChecks == true && PacketSnifferCheckFingerprint.matchOrNull() != null) {
                    replaceMethodBody(
                        PacketSnifferCheckFingerprint.repairedMethod,
                        """
                            const/4 v0, 0x1
                            return v0
                        """,
                    )
                }
            }
        }

        if (bypassUpdateGate == true) {
            // Force Splash's AppData observer to always take the `Splash.W()` branch instead of `FragmentUpdate`.
            val observerMethod = UpdateGateObserverFingerprint.repairedMethod
            val observerMatches = UpdateGateObserverFingerprint.instructionMatches
            val versionCmpIdx = observerMatches[1].index
            val splashProceedIdx = observerMatches[3].index

            val versionBranch = observerMethod.instructions[versionCmpIdx] as BuilderOffsetInstruction
            check(versionBranch.target.location.index == splashProceedIdx) {
                "Unexpected Splash update-gate branch target (${versionBranch.target.location.index} != $splashProceedIdx)."
            }

            if (versionBranch.opcode != Opcode.GOTO_32) {
                observerMethod.replaceInstruction(
                    versionCmpIdx,
                    BuilderInstruction30t(Opcode.GOTO_32, versionBranch.target),
                )
            }
        }

        if (blockPromoPushNotifications == true) {
            // Preserve `type == 3` silent RemoteConfig refresh (`PUSH_RC` -> return-void) and
            // truncate all promotional / ACTION_VIEW notification construction ("rtstv" onwards).
            if (PushNotificationHandlerFingerprint.matchOrNull() != null) {
                val pushMatches = PushNotificationHandlerFingerprint.instructionMatches
                val rcReturnIdx = pushMatches[1].index
                val promoStartIdx = pushMatches[2].index
                check(promoStartIdx == rcReturnIdx + 1) {
                    "Unexpected PushService control flow ($promoStartIdx != ${rcReturnIdx + 1})."
                }

                truncateVoidMethodAt(PushNotificationHandlerFingerprint.originalMethod, promoStartIdx)
            } else {
                val basePush = PushNotificationBaseFingerprint.originalMethod
                if (basePush.containsStringLiteral("rtstv")) {
                    throw PushNotificationHandlerFingerprint.patchException()
                }
            }
        }
    }
}

private fun Method.referencesDescriptor(prefix: String): Boolean =
    implementation?.instructions?.any { insn ->
        (insn as? ReferenceInstruction)?.reference?.toString()?.contains(prefix) == true
    } == true

private fun Method.containsStringLiteral(value: String): Boolean =
    implementation?.instructions?.any { insn ->
        ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string == value
    } == true
