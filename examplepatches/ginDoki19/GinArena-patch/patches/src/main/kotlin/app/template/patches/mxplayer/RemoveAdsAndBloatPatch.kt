package app.template.patches.mxplayer

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MX_PLAYER_AD
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

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

            val welcomeFlagClass = WelcomeAdEnabledFingerprint.classDef
            welcomeFlagClass.returnBoolean(WelcomeAdEnabledFingerprint.method, false)
            welcomeFlagClass.returnBoolean(
                welcomeFlagClass.requireMethod("a", "Z", emptyList()),
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

            screenClass.returnVoid(preRollMethod)
            screenClass.returnVoid(playerBannerMethod)
            screenClass.returnVoid(midRollMethod)
            val pauseMethodName = pauseHookMethod.name
            screenClass.replaceMethodBody(
                method = pauseHookMethod,
                localRegisters = 0,
                smaliInstructions = """
                    invoke-super {p0}, $BASE_ACTIVITY_SCREEN_CLASS->$pauseMethodName()V
                    return-void
                """.trimIndent(),
            )
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
        }
    }
}
