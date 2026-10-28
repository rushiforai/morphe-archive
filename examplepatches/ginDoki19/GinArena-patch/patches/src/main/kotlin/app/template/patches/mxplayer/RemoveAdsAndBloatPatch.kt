package app.template.patches.mxplayer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MX_PLAYER_AD
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

@Suppress("unused")
val removeAdsAndBloatPatch = bytecodePatch(
    name = "Remove ads & bloat",
    description = "Removes banner, folder, player, interstitial, rewarded, app-open, exit, and Me-page ads, " +
        "removes the Home horizontal shortcut strip and online Zodiac App Themes, and disables Live TV, " +
        "mxplay OTT streaming, MX Tube, Shorts, and Games while keeping Local Music, All-Files-Access setup, " +
        "and 1-tap Classic Themes working offline and online.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MX_PLAYER_AD)

    dependsOn(mxIntegrityCorePatch)

    extendWith("extensions/mxplayer.mpe")

    execute {
        // =========================================================================
        // 1. Monetize-v2 Ad Engine & Placement Managers (3.3.1 / 3.4.0 / 3.4.1)
        // =========================================================================
        run {
            // AdInitializer: stub both non-constructor `()V` warm-up methods (`e` + `A5`/`z5`)
            // while keeping `c(App)` / `f(App)` intact so `AdManagerV2` singletons stay non-null.
            val adInitClass = AdInitializerNameFingerprint.classDef
            val adInitWarmups = adInitClass.methods.filter {
                it.parameterTypes.isEmpty() &&
                    it.returnType == "V" &&
                    it.name != "<init>" &&
                    it.name != "<clinit>"
            }
            if (adInitWarmups.isEmpty()) {
                throw PatchException("Failed to locate warm-up methods on ${adInitClass.type}")
            }
            adInitWarmups.toList().forEach(adInitClass::returnVoid)

            // SharedStateManager: `b()Z` delegates to `A0()Z` (3.3.1/3.4.0) or `z0()Z` (3.4.1).
            // Resolve the target dynamically from `b()Z` and force both to `false`.
            val sharedStateClass = SharedStateManagerInitFingerprint.classDef
            val isAdEnabledBridge = sharedStateClass.requireMethod("b", "Z", emptyList())
            val isAdEnabledTargetName = isAdEnabledBridge.instructions
                .filterIsInstance<ReferenceInstruction>()
                .mapNotNull { it.reference as? MethodReference }
                .firstOrNull { it.definingClass == sharedStateClass.type && it.parameterTypes.isEmpty() && it.returnType == "Z" }
                ?.name
                ?: throw PatchException("Failed to resolve SharedStateManager->b()Z target on ${sharedStateClass.type}")
            sharedStateClass.returnBoolean(isAdEnabledBridge, false)
            sharedStateClass.returnBoolean(
                sharedStateClass.requireMethod(isAdEnabledTargetName, "Z", emptyList()),
                false,
            )

            // SharedStateManager's non-`m` `()V` method (`P` in 3.3.1, `O` in 3.4.0/3.4.1) is the
            // mediation SDK bootstrap method name shared with `AdManagerV2`.
            val sdkBootstrapName = sharedStateClass.methods.firstOrNull {
                it.parameterTypes.isEmpty() &&
                    it.returnType == "V" &&
                    it.name != "<init>" &&
                    it.name != "<clinit>" &&
                    it.name != "m"
            }?.name ?: throw PatchException("Failed to locate mediation bootstrap method on ${sharedStateClass.type}")

            val adManagerClass = AdManagerV2InitFingerprint.classDef
            adManagerClass.returnVoid(adManagerClass.requireMethod(sdkBootstrapName, "V", emptyList()))

            // BannerManager: `b()Z -> false`.
            val bannerClass = BannerManagerEnabledFingerprint.classDef
            bannerClass.returnBoolean(BannerManagerEnabledFingerprint.method, false)

            // PanelNative: `"isNotification"` load method (`T`/`U`) -> `false` and the recursive
            // readiness/dispatch `()Z` method (>20 instructions, `Y` in 3.3.1 / `Z` in 3.4.x) -> `false`.
            val panelNativeClass = PanelNativeLoadFingerprint.classDef
            panelNativeClass.returnBoolean(PanelNativeLoadFingerprint.method, false)
            val panelReadyMethod = panelNativeClass.methods.firstOrNull { candidate ->
                candidate.parameterTypes.isEmpty() &&
                    candidate.returnType == "Z" &&
                    (candidate.implementation?.instructions?.count() ?: 0) > 20 &&
                    candidate.instructions.any { insn ->
                        val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                        ref?.definingClass == panelNativeClass.type && ref.name == candidate.name
                    }
            } ?: throw PatchException("Failed to locate PanelNative readiness method on ${panelNativeClass.type}")
            panelNativeClass.returnBoolean(panelReadyMethod, false)

            // InterstitialV2: show (`h`/`i`) -> `false`, `a(...,Z,JSONObject)V` -> `void`,
            // `b(...,Z,JSONObject)Z` -> `false`, and both `()Z` readiness checks reading `this.d` -> `false`.
            val interstitialClass = InterstitialShowFingerprint.classDef
            interstitialClass.returnBoolean(InterstitialShowFingerprint.method, false)
            interstitialClass.returnVoid(
                interstitialClass.methods.first { it.name == "a" && it.returnType == "V" && it.parameterTypes.size == 3 },
            )
            interstitialClass.returnBoolean(
                interstitialClass.methods.first { it.name == "b" && it.returnType == "Z" && it.parameterTypes.size == 3 },
                false,
            )
            val interstitialReadyChecks = interstitialClass.methods.filter { candidate ->
                candidate.parameterTypes.isEmpty() &&
                    candidate.returnType == "Z" &&
                    candidate.instructions.any { insn ->
                        val fRef = (insn as? ReferenceInstruction)?.reference as? FieldReference
                        fRef?.definingClass == interstitialClass.type && fRef.name == "d"
                    }
            }
            if (interstitialReadyChecks.isEmpty()) {
                throw PatchException("Failed to locate InterstitialV2 readiness methods on ${interstitialClass.type}")
            }
            interstitialReadyChecks.toList().forEach { interstitialClass.returnBoolean(it, false) }

            // RewardedAdPlacement: `(AdCall)Z` (`q`/`s`) -> `false`, `b(AdCall,Z,JSONObject)Z` -> `false`,
            // `(Z)V` referencing `AdCall` (`r`/`u`) -> `void`, and `()Z` readiness checks (`k,p`/`l,r`) -> `false`.
            val rewardedClass = RewardedAdPlacementInitFingerprint.classDef
            rewardedClass.returnBoolean(
                rewardedClass.methods.first {
                    it.returnType == "Z" && it.parameterTypes == listOf("Lcom/mxplay/monetize/v2/loader/AdCall;")
                },
                false,
            )
            rewardedClass.returnBoolean(
                rewardedClass.methods.first { it.name == "b" && it.returnType == "Z" && it.parameterTypes.size == 3 },
                false,
            )
            val rewardedPreload = rewardedClass.methods.firstOrNull { candidate ->
                candidate.returnType == "V" &&
                    candidate.parameterTypes == listOf("Z") &&
                    candidate.instructions.any { insn ->
                        val fRef = (insn as? ReferenceInstruction)?.reference as? FieldReference
                        fRef?.definingClass == "Lcom/mxplay/monetize/v2/loader/AdCall;"
                    }
            } ?: throw PatchException("Failed to locate RewardedAdPlacement preload method on ${rewardedClass.type}")
            rewardedClass.returnVoid(rewardedPreload)
            rewardedClass.methods
                .filter { it.parameterTypes.isEmpty() && it.returnType == "Z" }
                .toList()
                .forEach { rewardedClass.returnBoolean(it, false) }

            // TrayNative: `b(AdCall,Z,JSONObject)Z -> false`.
            val trayNativeClass = TrayNativeInitFingerprint.classDef
            trayNativeClass.returnBoolean(
                trayNativeClass.methods.first { it.name == "b" && it.returnType == "Z" && it.parameterTypes.size == 3 },
                false,
            )

            // VideoRollManager: return MX Player's built-in non-null disabled roll fallback field from `a(String)`.
            val videoRollClass = VideoRollManagerInitFingerprint.classDef
            val lookupMethod = videoRollClass.methods.first {
                it.name == "a" && it.parameterTypes == listOf("Ljava/lang/String;")
            }
            val dummyFieldRef = lookupMethod.instructions
                .filterIsInstance<ReferenceInstruction>()
                .mapNotNull { it.reference as? FieldReference }
                .firstOrNull { it.definingClass == videoRollClass.type && it.type != "Z" && !it.type.startsWith("Ljava/") }
                ?: throw PatchException("Failed to locate disabled VideoRoll fallback field on ${videoRollClass.type}")
            videoRollClass.replaceMethodBody(
                method = lookupMethod,
                localRegisters = 1,
                smaliInstructions = """
                    iget-object v0, p0, $dummyFieldRef
                    return-object v0
                """.trimIndent(),
            )

            // OpenAds, WelcomeAdFeatureFlag & LocalOnlyExitAdTest.
            val openAdsClass = OpenAdsShowWelcomeFingerprint.classDef
            openAdsClass.returnVoid(OpenAdsShowWelcomeFingerprint.method)
            openAdsClass.returnVoid(
                openAdsClass.requireMethod("f", "V", listOf("Landroid/app/Activity;")),
            )

            // WelcomeAdFeatureFlag (`Ltel;`): `b()Z` and `a()Z` are inverted disable flags (`return !z;`,
            // where `true` = Welcome Ad / cache DISABLED). Returning `true` sets `ActivityWelcomeMX.q0 = !tel.b()`
            // to `false`, completely preventing `WelcomeScreenAdFragment` (`yel`, "MX Player / Amazon") from
            // ever displaying on cold start or stacking/deadlocking across multi-theme `recreate()` cycles!
            val welcomeFlagClass = WelcomeAdEnabledFingerprint.classDef
            welcomeFlagClass.returnBoolean(WelcomeAdEnabledFingerprint.method, true)
            welcomeFlagClass.returnBoolean(
                welcomeFlagClass.requireMethod("a", "Z", emptyList()),
                true,
            )

            // Defense-in-depth: disarm `AppOpenAdManager.p()V` & `o()Z` so no caller can ever trigger
            // Welcome-Ad Room DB queries or CloudFront `HEAD` validation coroutines.
            val appOpenAdManagerClass = AppOpenAdManagerPrepareFingerprint.classDef
            appOpenAdManagerClass.returnVoid(AppOpenAdManagerPrepareFingerprint.method)
            appOpenAdManagerClass.returnBoolean(
                appOpenAdManagerClass.requireMethod("o", "Z", emptyList()),
                false,
            )

            val exitAdClass = LocalOnlyExitAdEnableFingerprint.classDef
            exitAdClass.returnBoolean(LocalOnlyExitAdEnableFingerprint.method, false)

            // ActivityScreen player ad hooks (resolved structurally across 3.3.1 / 3.4.0 / 3.4.1):
            // - pre-roll check (`Gb`/`Fb`, `"key_has_check_video_ad"`) -> void
            // - player banner (`Ob`/`Nb`, `"bannerForPlayer"`) -> void
            // - mid-roll progress check (`t9`/`s9` `(I, I)V` reading `a5`) -> void
            // - pause hook (`o9`/`n9`, `"local_pause_recomm"`) -> `super.${method.name}()V` only
            val screenClass = ActivityScreenInitFingerprint.classDef
            val preRollMethod = screenClass.methods.firstOrNull {
                it.parameterTypes.isEmpty() && it.returnType == "V" && it.containsString("key_has_check_video_ad")
            } ?: throw PatchException("ActivityScreen pre-roll method not found")
            val playerBannerMethod = screenClass.methods.firstOrNull {
                it.parameterTypes.isEmpty() && it.returnType == "V" && it.containsString("bannerForPlayer")
            } ?: throw PatchException("ActivityScreen bannerForPlayer method not found")
            val midRollMethod = screenClass.methods.firstOrNull { candidate ->
                candidate.parameterTypes == listOf("I", "I") &&
                    candidate.returnType == "V" &&
                    candidate.instructions.any { insn ->
                        val fRef = (insn as? ReferenceInstruction)?.reference as? FieldReference
                        fRef?.definingClass == screenClass.type && fRef.name == "a5"
                    }
            } ?: throw PatchException("ActivityScreen mid-roll (II)V method not found")
            val pauseHookMethod = screenClass.methods.firstOrNull {
                it.parameterTypes.isEmpty() && it.returnType == "V" && it.containsString("local_pause_recomm")
            } ?: throw PatchException("ActivityScreen pause recommendation method not found")
            val subscribeEntryMethod = screenClass.methods.firstOrNull { candidate ->
                candidate.parameterTypes.isEmpty() &&
                    candidate.returnType == "V" &&
                    candidate.instructions.any { insn ->
                        val ref = (insn as? ReferenceInstruction)?.reference
                        (ref as? TypeReference)?.type == "Lcom/airbnb/lottie/LottieAnimationView;" ||
                            (ref as? MethodReference)?.definingClass == "Lcom/airbnb/lottie/LottieAnimationView;"
                    }
            } ?: throw PatchException("ActivityScreen Lottie subscribe-entry method not found")
            val pauseAdSetupMethod = screenClass.methods.firstOrNull {
                it.parameterTypes.isEmpty() && it.returnType == "V" && it.containsString("preloadCustom")
            } ?: throw PatchException("ActivityScreen pause-ad setup method not found")
            val pauseAdRefreshMethod = screenClass.methods.firstOrNull { candidate ->
                candidate.parameterTypes.isEmpty() &&
                    candidate.returnType == "V" &&
                    candidate.instructions.any { insn ->
                        val fRef = (insn as? ReferenceInstruction)?.reference as? FieldReference
                        fRef?.definingClass == "Lcom/mxplay/monetize/v2/nativead/LoadedStatue;"
                    }
            } ?: throw PatchException("ActivityScreen pause-ad refresh method not found")
            val localToOnlineRecomGate = screenClass.methods.firstOrNull { candidate ->
                candidate.parameterTypes.isEmpty() &&
                    candidate.returnType == "Z" &&
                    candidate.instructions.any { insn ->
                        val mRef = (insn as? ReferenceInstruction)?.reference as? MethodReference
                        mRef?.name == "isLocalToOnlineRecom" && mRef.returnType == "Z"
                    }
            } ?: throw PatchException("ActivityScreen isLocalToOnlineRecom gate method not found")
            val progressChangedMethod = screenClass.requireMethod(
                "onProgressChanged",
                "V",
                listOf("Landroid/widget/SeekBar;", "I", "Z"),
            )

            screenClass.returnVoid(preRollMethod)
            screenClass.returnVoid(playerBannerMethod)
            screenClass.returnVoid(midRollMethod)
            screenClass.returnVoid(subscribeEntryMethod)
            screenClass.returnVoid(pauseAdSetupMethod)
            screenClass.returnVoid(pauseAdRefreshMethod)
            screenClass.returnBoolean(localToOnlineRecomGate, false)
            val pauseMethodName = pauseHookMethod.name
            screenClass.replaceMethodBody(
                method = pauseHookMethod,
                localRegisters = 0,
                smaliInstructions = """
                    invoke-super {p0}, $BASE_ACTIVITY_SCREEN_CLASS->$pauseMethodName()V
                    return-void
                """.trimIndent(),
            )
            screenClass.replaceMethodBody(
                method = progressChangedMethod,
                localRegisters = 0,
                smaliInstructions = """
                    invoke-super {p0, p1, p2, p3}, $BASE_ACTIVITY_SCREEN_CLASS->onProgressChanged(Landroid/widget/SeekBar;IZ)V
                    return-void
                """.trimIndent(),
            )

            // Disarm `playback` / `playback_end` (`localStarPlaySP`) background network telemetry
            // posted on video start and completion while keeping local stream history intact.
            val starPlayTelemetryClass = PlaybackStarPlayTelemetryFingerprint.classDef
            starPlayTelemetryClass.returnVoid(PlaybackStarPlayTelemetryFingerprint.method)
        }

        // =========================================================================
        // 3. GlobalConfig Pure-Local Mode & Feature Gates
        // =========================================================================
        run {
            val gc = GlobalConfigClinitFingerprint.classDef

            // Pure-local phone mode (`j -> true`, `C = !j -> false`) + Local Music (`B -> true`).
            // Hardware/TV gates (`h`, `p(Context)`, `k`, `m`, `n`, `r`) remain untouched.
            gc.returnBoolean(gc.requireMethod("j", "Z", emptyList()), true)
            gc.returnBoolean(gc.requireMethod("C", "Z", emptyList()), false)
            gc.returnBoolean(gc.requireMethod("B", "Z", emptyList()), true)

            val disabledGates = listOf(
                "i", // isIndia
                "o", // isSouthAsiaExIndia
                "F", // onlineOpen (mxplay OTT streaming)
                "y", // liveOpen (Live TV)
                "A", // mxtubeOpen (MX Tube)
                "w", // gameOpen (MX Games)
                "v", // fatafatOpen (Shorts / Fatafat)
                "E", // upcomingOpen
                "D", // ottDownloadOpen
                "t", // bazaarOpen
                "u", // downloadOpen (social video saver promo)
                "x", // secondary online tab gate
                "f", // AmazonGameXConfig.enable
                "l", // isOpenSearchYoutubeTab
            )
            for (gateName in disabledGates) {
                gc.returnBoolean(gc.requireMethod(gateName, "Z", emptyList()), false)
            }
        }

        // =========================================================================
        // 4. Instant Splash, Home Shortcut Strip & Banner Ad Removal,
        //    Me-Page Promo Removal & Classic Themes Offline/Online Reliability
        // =========================================================================
        run {
            // Bypass UMP splash stall & silence GdprLog timers.
            val nationalUtilClass = NationalUtilGdprRegionFingerprint.classDef
            nationalUtilClass.returnBoolean(NationalUtilGdprRegionFingerprint.method, false)

            val gdprLogClass = GdprLogClinitFingerprint.classDef
            gdprLogClass.methods.toList().forEach { method ->
                if (AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.returnType == "V" &&
                    method.name != "<clinit>"
                ) {
                    gdprLogClass.returnVoid(method)
                }
            }

            // Remove "MX For You" OTT virtual card from local folder list.
            val mediaListClass = MediaListForYouEntryFingerprint.classDef
            mediaListClass.returnBoolean(MediaListForYouEntryFingerprint.method, false)

            // Remove Home ("Folders") horizontal shortcut strip (`Music | File Transfer | Status Saver |
            // My Playlists | Cleaner | Privacy` + pager dots):
            // 1. Disarm all `()V` tile-fetch/push methods (`c`, `e`, `h`, `i`) on `LocalTilesManager`.
            // 2. Disarm `AdMediaListFragment`'s tile-request `(Z)V` (`Sa`/`Pa`), empty-view tile-header
            //    inflater `(TileResources, TileResources)V` (`La`/`Ia`), and RecyclerView `VIEW_TYPE = 20`
            //    shortcut-strip header injector `(List)Z` (`u9`/`r9`).
            val tilesManagerClass = LocalTilesManagerClinitFingerprint.classDef
            tilesManagerClass.methods
                .filter {
                    it.parameterTypes.isEmpty() &&
                        it.returnType == "V" &&
                        it.name != "<init>" &&
                        it.name != "<clinit>"
                }
                .toList()
                .forEach(tilesManagerClass::returnVoid)

            // Remove Page 1 Home banner/native ad row (`Ka`/`Ha` with `"topPageOffset"`),
            // floating promo button (`Ra`/`Oa` with `"fab_local"`), and Home shortcut strip hooks.
            val adMediaListClass = AdMediaListAttachFabFingerprint.classDef
            adMediaListClass.returnVoid(AdMediaListAttachFabFingerprint.method)
            val insertNativeAdRows = adMediaListClass.methods.firstOrNull {
                it.returnType == "V" &&
                    it.parameterTypes.size == 2 &&
                    it.parameterTypes[1] == "Ljava/util/List;" &&
                    it.containsString("topPageOffset")
            } ?: throw PatchException("AdMediaListFragment native/banner ad insertion method not found")
            adMediaListClass.returnVoid(insertNativeAdRows)

            val requestTilesMethod = adMediaListClass.methods.firstOrNull { candidate ->
                candidate.returnType == "V" &&
                    candidate.parameterTypes == listOf("Z") &&
                    candidate.instructions.any { insn ->
                        val fRef = (insn as? ReferenceInstruction)?.reference as? FieldReference
                        fRef?.type == LOCAL_TILES_MANAGER_CLASS
                    }
            } ?: throw PatchException("AdMediaListFragment requestLocalTiles (Z)V method not found")
            adMediaListClass.returnVoid(requestTilesMethod)

            val inflateEmptyTileHeader = adMediaListClass.methods.firstOrNull {
                it.returnType == "V" &&
                    it.parameterTypes == listOf(TILE_RESOURCES_CLASS, TILE_RESOURCES_CLASS)
            } ?: throw PatchException("AdMediaListFragment (TileResources, TileResources)V method not found")
            adMediaListClass.returnVoid(inflateEmptyTileHeader)

            val injectTileStripRow = adMediaListClass.methods.firstOrNull { candidate ->
                candidate.returnType == "Z" &&
                    candidate.parameterTypes == listOf("Ljava/util/List;") &&
                    candidate.instructions.any { insn ->
                        val mRef = (insn as? ReferenceInstruction)?.reference as? MethodReference
                        mRef?.definingClass == TILE_RESOURCES_CLASS && mRef.name == "getTiles"
                    }
            } ?: throw PatchException("AdMediaListFragment shortcut-strip (List)Z method not found")
            adMediaListClass.returnBoolean(injectTileStripRow, false)

            // Disable toolbar promo button (`"bar_local"`) in `ActivityMediaList.J0(Menu)V`.
            val baseMediaClass = BaseMediaPrepareMenuFingerprint.classDef
            val barLocalPromo = baseMediaClass.methods.firstOrNull {
                it.returnType == "V" &&
                    it.parameterTypes == listOf("Landroid/view/Menu;") &&
                    it.containsString("bar_local")
            } ?: throw PatchException("ActivityMediaList bar_local promo method not found")
            baseMediaClass.returnVoid(barLocalPromo)

            // Return null from `PromoteViewModel$Companion.c(String, LifecycleOwner)`.
            val promoteCompanionClass = PromoteViewModelCreateFingerprint.classDef
            promoteCompanionClass.returnNull(PromoteViewModelCreateFingerprint.method)

            // Remove Me-page promotional banner (`"openNavigationPromotion"`) and ad card (`(Z)Z -> false`),
            // and collapse their containers in `onViewCreated` & `onConfigurationChanged`.
            val localMeClass = LocalMeOnViewCreatedFingerprint.classDef
            val mePromoMethod = localMeClass.methods.firstOrNull {
                it.parameterTypes.isEmpty() && it.returnType == "V" && it.containsString("openNavigationPromotion")
            } ?: throw PatchException("LocalMeFragment openNavigationPromotion method not found")
            localMeClass.returnVoid(mePromoMethod)

            val meAdGateMethod = localMeClass.methods.firstOrNull {
                it.parameterTypes == listOf("Z") && it.returnType == "Z"
            } ?: throw PatchException("LocalMeFragment (Z)Z ad gate method not found")
            localMeClass.returnBoolean(meAdGateMethod, false)

            val bindingInfo = resolveLocalMeBinding(localMeClass)
            localMeClass.requireMethod("onViewCreated", "V", listOf("Landroid/view/View;", "Landroid/os/Bundle;"))
                .appendHideBindingViews(bindingInfo, bindingInfo.promoAndAdFields)
            localMeClass.requireMethod("onConfigurationChanged", "V", listOf("Landroid/content/res/Configuration;"))
                .appendHideBindingViews(bindingInfo, bindingInfo.promoAndAdFields)

            // Remove online Zodiac App Themes and wire in-memory 1-tap Classic Themes offline & online.
            installCleanClassicThemeEngine()

            // =========================================================================
            // 6. Cold-Start, Theme-Switch & Runtime Smoothness Optimizations (3.4.1)
            // =========================================================================
            // 6a. `SkinResourcePackHelper.a()V`: runs on every cold start and every theme `recreate()`;
            //     for `external_skin_local_classic_*`, stock fires an HTTP check for `"classic_..."` and
            //     scans/deletes files in the skin directory. Disarming makes theme recreates instant.
            val skinPackHelperClass = SkinResourcePackCheckFingerprint.classDef
            skinPackHelperClass.returnVoid(SkinResourcePackCheckFingerprint.method)

            // 6b. `GdprUtil.a()Z -> true` (`isNotGDPRRegion()`) + surgical call-site override inside
            //     `App.attachBaseContext`:
            //     - Keeping `GdprUtil.a()` `true` globally preserves the 2-line fast path in
            //       `ActivityWelcomeMX.u7()` (avoiding double `setContentView` splash flash + `sp7.h(true)`
            //       `FirebaseAnalytics.getInstance` wakeup), skips `w27.e()`'s cold-start `sp7.d(...)`
            //       call, and returns `false` on line 1 of `sp7.b(...)` in `ActivityScreen.onCreate`.
            //     - Replacing ONLY the single `invoke-static {}, Lsp7;->a()Z` + `move-result vX` inside
            //       `App.attachBaseContext` with `const/4 vX, 0x0` still routes `attachBaseContext` into
            //       the lightweight 7-initializer fast path (skipping `AppsFlyer`, `FacebookSdk`,
            //       `AccountKit`, `CleverTap`, and `Amazon PlayReady DRM`).
            val gdprUtilClass = GdprForeignCheckFingerprint.classDef
            val gdprUtilType = gdprUtilClass.type
            val gdprMethodName = GdprForeignCheckFingerprint.method.name
            gdprUtilClass.returnBoolean(GdprForeignCheckFingerprint.method, true)

            val attachMethod = AppAttachBaseContextFingerprint.method
            val attachInsns = attachMethod.instructions.toList()
            val sp7CallIdx = attachInsns.indexOfFirst { insn ->
                insn.opcode == Opcode.INVOKE_STATIC &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                        ref.definingClass == gdprUtilType &&
                            ref.name == gdprMethodName &&
                            ref.parameterTypes.isEmpty() &&
                            ref.returnType == "Z"
                    } == true
            }
            if (sp7CallIdx < 0 || sp7CallIdx + 1 >= attachInsns.size || attachInsns[sp7CallIdx + 1].opcode != Opcode.MOVE_RESULT) {
                throw PatchException("Expected Lsp7;->a()Z + move-result in App.attachBaseContext")
            }
            val destReg = (attachInsns[sp7CallIdx + 1] as OneRegisterInstruction).registerA
            attachMethod.removeInstructions(sp7CallIdx, 2)
            attachMethod.addInstructions(sp7CallIdx, "const/4 v$destReg, 0x0")

            // 6c. `DefaultMultiTypeViewCache.a(ds4$a)V -> return-void`: stops `ActivityWelcomeMX.g5()` from
            //     background-inflating 49 disabled OTT streaming card layouts + 10 OTT RecyclerViews and
            //     posting 59 messages onto the Main UI Looper during launch and folder scrolling, while
            //     keeping `ds4` and its `LayoutInflater` (`ds4.c`) non-null for `fvc.onCreateViewHolder`.
            val ottViewCacheClass = OttViewPreinflateEnqueueFingerprint.classDef
            ottViewCacheClass.returnVoid(OttViewPreinflateEnqueueFingerprint.method)

            // 6d. `ANRWatchDog.run()V -> return-void`: skips startup `getHistoricalProcessExitReasons` IPC
            //     and background 3000ms main-thread ping polling.
            val anrWatchDogClass = AnrWatchDogRunFingerprint.classDef
            anrWatchDogClass.returnVoid(AnrWatchDogRunFingerprint.method)

            // 6e. Disarm Amazon Minerva telemetry (`AMXPMetricInitializer.c` + `AMXPMetricEmitter` disabled flag).
            val amxpInitClass = AmxpMetricInitFingerprint.classDef
            amxpInitClass.returnVoid(AmxpMetricInitFingerprint.method)
            val amxpEmitterClass = AmxpMetricEmitterClinitFingerprint.classDef
            AmxpMetricEmitterClinitFingerprint.method.appendBeforeReturnVoid(
                """
                    const/4 v0, 0x1
                    sput-boolean v0, ${amxpEmitterClass.type}->d:Z
                """.trimIndent(),
            )

            // 6f. Disarm `FeatureMan2` (`rq6.c(Application)V`) network fetch while keeping `FeatureMan1` (`qq6`)
            //     intact so `pq6.m` remains initialized.
            val featureMan2Class = FeatureMan2InitFingerprint.classDef
            featureMan2Class.returnVoid(
                featureMan2Class.requireMethod("c", "V", listOf("Landroid/app/Application;")),
            )

            // 6g. Disarm `TrackerInitializer`, `App.X()`, `TrackingUtil` (`lvj`) static dispatchers,
            //     and `TrackingConst` (`Ldvj;`) lifecycle callbacks so 6 analytics pipelines
            //     (`evt.mxplay.com`, `falcon`, `search/tracking`, `gaana`, Firebase, Facebook) never
            //     boot on startup, every scroll/click telemetry call is a 0-alloc no-op, and
            //     `onActivityStopped` never blocks the Main Thread on `ActivityManager.getRunningAppProcesses()`.
            val trackerInitClass = TrackerInitializerFingerprint.classDef
            trackerInitClass.returnVoid(TrackerInitializerFingerprint.method)
            val mxAppClass = MxAppInitTrackingFingerprint.classDef
            mxAppClass.returnVoid(MxAppInitTrackingFingerprint.method)
            val trackingUtilClass = TrackingUtilClinitFingerprint.classDef
            trackingUtilClass.methods
                .filter {
                    AccessFlags.STATIC.isSet(it.accessFlags) &&
                        it.returnType == "V" &&
                        it.name != "<clinit>" &&
                        it.name != "a"
                }
                .toList()
                .forEach(trackingUtilClass::returnVoid)

            val trackingLifecycleClass = TrackingLifecycleCallbackFingerprint.classDef
            trackingLifecycleClass.returnVoid(TrackingLifecycleCallbackFingerprint.method)
            trackingLifecycleClass.returnVoid(
                trackingLifecycleClass.requireMethod("onActivityResumed", "V", listOf("Landroid/app/Activity;")),
            )

            // 6h. Disarm `App.t()` background bloat (`InAppPush` 5-second repeating timer, startup
            //     `GetGroupDetailsWithCache` HTTP fetch, `ComScore` `Analytics.start` / UX pings, and
            //     `CleverTap` `ActivityLifecycleCallback` on every Activity create/resume/pause)
            //     while keeping `App.t()` itself intact for Network Stream (`jxk.a`) and Chromecast!
            val inAppPushClass = InAppPushRunFingerprint.classDef
            inAppPushClass.returnVoid(InAppPushRunFingerprint.method)
            inAppPushClass.returnVoid(inAppPushClass.requireMethod("c", "V", emptyList()))

            val subGroupFetchClass = SubscriptionGroupFetchFingerprint.classDef
            subGroupFetchClass.returnVoid(SubscriptionGroupFetchFingerprint.method)

            val comScoreClass = ComScoreClinitFingerprint.classDef
            ComScoreClinitFingerprint.method.appendBeforeReturnVoid(
                """
                    const/4 v0, 0x1
                    sput-boolean v0, ${comScoreClass.type}->c:Z
                """.trimIndent(),
            )
            comScoreClass.returnVoid(comScoreClass.requireMethod("a", "V", listOf("Z")))
            comScoreClass.returnVoid(comScoreClass.requireMethod("b", "V", emptyList()))

            val cleverTapLifecycleClass = CleverTapLifecycleCallbackFingerprint.classDef
            cleverTapLifecycleClass.returnVoid(CleverTapLifecycleCallbackFingerprint.method)
            cleverTapLifecycleClass.returnVoid(
                cleverTapLifecycleClass.requireMethod("onActivityResumed", "V", listOf("Landroid/app/Activity;")),
            )
            cleverTapLifecycleClass.returnVoid(
                cleverTapLifecycleClass.requireMethod("onActivityPaused", "V", listOf("Landroid/app/Activity;")),
            )
            val cleverTapOuterType = cleverTapLifecycleClass.type.substringBefore('$') + ";"
            val cleverTapOuterClass = mutableClassDefBy(cleverTapOuterType)
            cleverTapOuterClass.methods.firstOrNull { it.name == "<clinit>" && it.parameterTypes.isEmpty() }
                ?.appendBeforeReturnVoid(
                    """
                        const/4 v0, 0x1
                        sput-boolean v0, $cleverTapOuterType->a:Z
                    """.trimIndent(),
                )

            // 6i. Disarm `AdInitializer` (`Llq;->a()V`) callback invoked from `ActivityWelcomeMX.onCreate`
            //     so cold launches and theme recreates never register `hif.b` or spawn `gd4.h` ad workers.
            val adInitCallbackClass = AdInitializerCallbackFingerprint.classDef
            adInitCallbackClass.returnVoid(AdInitializerCallbackFingerprint.method)

            // Promote inner classes of stripped outer classes to PUBLIC so BytecodeMode.STRIP_SAFE
            // never triggers cross-DEX package-private IllegalAccessError even on Android 7.0–7.1 (API 24–25).
            val innerPrefixesToPromote = listOf(
                "Lcom/mxtech/videoplayer/ad/ActivityScreen\$",
                "Lcom/mxtech/videoplayer/ad/App\$",
                "Lcom/mxtech/videoplayer/ad/online/abtest/LocalOnlyExitAdTest\$",
                "Lcom/mxtech/videoplayer/ad/online/ad/appopen/AppOpenAdManager\$",
                "Lcom/mxtech/videoplayer/ad/online/ad/appopen/AppOpenAdRequestManager\$validateAdUrl\$1;",
                "Lcom/mxtech/videoplayer/ad/online/theme/SkinResourcePackHelper\$",
                "Lcom/mxtech/videoplayer/ad/online/theme/ui/ThemeListViewModel\$",
                "Lcom/mxtech/videoplayer/ad/push/a\$",
                "Lcom/mxtech/videoplayer/ad/subscriptions/ui/GetGroupDetailsWithCache\$",
                "${ottViewCacheClass.type.dropLast(1)}\$",
                "${anrWatchDogClass.type.dropLast(1)}\$",
                "${trackingUtilClass.type.dropLast(1)}\$",
                "${comScoreClass.type.dropLast(1)}\$",
            )
            classDefForEach { classDef ->
                if (!AccessFlags.PUBLIC.isSet(classDef.accessFlags) &&
                    innerPrefixesToPromote.any(classDef.type::startsWith)
                ) {
                    mutableClassDefBy(classDef).let {
                        it.accessFlags = (it.accessFlags and AccessFlags.PRIVATE.value.inv() and AccessFlags.PROTECTED.value.inv()) or AccessFlags.PUBLIC.value
                    }
                }
            }
        }
    }
}
