package dev.solvo37.vkvideopatches

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import dev.solvo37.vkvideopatches.Constants.VK_VIDEO
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val VIDEO_FEATURES = "Lcom/vk/toggle/features/VideoFeatures;"
private const val CLIPS_FEATURES = "Lcom/vk/toggle/features/ClipsFeatures;"
private const val EMPTY_DISPOSABLE = "Lio/reactivex/rxjava3/internal/disposables/EmptyDisposable;"
private const val VIDEO_ADS_COMPANION = "Lcom/vk/libvideo/api/di/VideoAdvertisementsComponent\$Companion;"

@Suppress("unused")
val disableInAppUpdatePatch = bytecodePatch(
    name = "Disable in-app update",
    description = "Disables the VK Video in-app update check and update prompt.",
    default = true
) {
    compatibleWith(VK_VIDEO)

    execute {
        InAppUpdateBootstrapFingerprint.method.addInstruction(0, "return-void")
    }
}

@Suppress("unused")
val removeVideoAdsPatch = bytecodePatch(
    name = "Remove video ads",
    description = "Disables player ad feature gates and strips server-provided instream/mobile/sport/banner ad payloads.",
    default = true
) {
    compatibleWith(VK_VIDEO)

    execute {
        VideoFeaturesEnabledFingerprint.method.apply {
            // VK Video 1.163 has one local register (v0) plus p0.
            // Refuse to patch a future build if that invariant changes.
            check(implementation!!.registerCount >= 2) {
                "VideoFeatures.a() has no free local register; fingerprint needs updating"
            }

            addInstructionsWithLabels(
                0,
                """
                    sget-object v0, $VIDEO_FEATURES->VIDEO_INSTREAM_ADS_OFF:$VIDEO_FEATURES
                    if-eq p0, v0, :force_enabled

                    sget-object v0, $VIDEO_FEATURES->VIDEO_OVERLAY_AD:$VIDEO_FEATURES
                    if-eq p0, v0, :force_disabled

                    sget-object v0, $VIDEO_FEATURES->VIDEO_MOTION_AD_ENABLED:$VIDEO_FEATURES
                    if-eq p0, v0, :force_disabled

                    goto :original

                    :force_enabled
                    const/4 v0, 0x1
                    return v0

                    :force_disabled
                    const/4 v0, 0x0
                    return v0
                """,
                ExternalLabel("original", getInstruction(0))
            )
        }

        // VK Video 1.163 also has a separate server-driven ad path. Null every
        // ad payload as it enters the generated API model so account/login
        // configuration cannot reactivate preroll/midroll or related payloads.
        VideoGetAdsResponseConstructorFingerprint.method.addInstructions(
            0,
            """
                const/4 p1, 0x0
                const/4 p2, 0x0
                const/4 p3, 0x0
                const/4 p4, 0x0
            """
        )

        // Defense in depth for direct instream construction: remove all
        // preroll, midroll and postroll section lists.
        VideoInstreamSectionsConstructorFingerprint.method.addInstructions(
            0,
            """
                const/4 p1, 0x0
                const/4 p2, 0x0
                const/4 p3, 0x0
            """
        )
    }
}

@Suppress("unused")
val removeClipAdsPatch = bytecodePatch(
    name = "Remove clip ads",
    description = "Disables VK Clips ad feature gates, ad configs, and SDK ad feature parameters.",
    default = true
) {
    compatibleWith(VK_VIDEO)

    execute {
        // Clips have a separate ad stack from the regular video player. Disable
        // direct ClipsFeatures callers first, then the concrete config provider
        // used by the feed mapper / Clips SDK in VK Video 1.163.
        ClipsFeaturesEnabledFingerprint.method.apply {
            check(implementation!!.registerCount >= 2) {
                "ClipsFeatures.a() has no free local register; fingerprint needs updating"
            }

            addInstructionsWithLabels(
                0,
                """
                    sget-object v0, $CLIPS_FEATURES->CLIPS_YANDEX_AD_PARAMS:$CLIPS_FEATURES
                    if-eq p0, v0, :force_disabled

                    sget-object v0, $CLIPS_FEATURES->CLIPS_MARKET_AD:$CLIPS_FEATURES
                    if-eq p0, v0, :force_disabled

                    sget-object v0, $CLIPS_FEATURES->CLIPS_MARKET_AD_CHOICES:$CLIPS_FEATURES
                    if-eq p0, v0, :force_disabled

                    sget-object v0, $CLIPS_FEATURES->CLIPS_AD_BANNER_COMPANION:$CLIPS_FEATURES
                    if-eq p0, v0, :force_disabled

                    sget-object v0, $CLIPS_FEATURES->CLIPS_AD_BANNER_COMPANION_FOR_SELLERS:$CLIPS_FEATURES
                    if-eq p0, v0, :force_disabled

                    sget-object v0, $CLIPS_FEATURES->CLIPS_ADS_SDK_VIDEO:$CLIPS_FEATURES
                    if-eq p0, v0, :force_disabled

                    sget-object v0, $CLIPS_FEATURES->CLIPS_ADS_SDK_STATIC_AD:$CLIPS_FEATURES
                    if-eq p0, v0, :force_disabled

                    sget-object v0, $CLIPS_FEATURES->CLIPS_ADS_SDK_CAROUSEL:$CLIPS_FEATURES
                    if-eq p0, v0, :force_disabled

                    sget-object v0, $CLIPS_FEATURES->CLIPS_ADS_SDK_PROMO:$CLIPS_FEATURES
                    if-eq p0, v0, :force_disabled

                    sget-object v0, $CLIPS_FEATURES->CLIPS_ADS_SDK_VIDEO_OWNER:$CLIPS_FEATURES
                    if-eq p0, v0, :force_disabled

                    sget-object v0, $CLIPS_FEATURES->CLIPS_ADS_SDK_LABEL:$CLIPS_FEATURES
                    if-eq p0, v0, :force_disabled

                    sget-object v0, $CLIPS_FEATURES->FEED_END_REWATCH_NEW_AD:$CLIPS_FEATURES
                    if-eq p0, v0, :force_disabled

                    sget-object v0, $CLIPS_FEATURES->CLIPS_MARKET_AD_HEADER_CLICKS:$CLIPS_FEATURES
                    if-eq p0, v0, :force_disabled

                    goto :original

                    :force_disabled
                    const/4 v0, 0x0
                    return v0
                """,
                ExternalLabel("original", getInstruction(0))
            )
        }

        val returnFalse = """
            const/4 v0, 0x0
            return v0
        """.trimIndent()

        listOf(
            ClipAdsPromoProviderFingerprint.method,
            ClipAdsStaticProviderFingerprint.method,
            ClipAdsLabelProviderFingerprint.method,
            ClipMarketAdProviderFingerprint.method,
            ClipMarketAdChoicesProviderFingerprint.method,
            ClipAdsVideoOwnerProviderFingerprint.method,
            ClipFeedEndRewatchAdProviderFingerprint.method,
            ClipAdsVideoProviderFingerprint.method,
            ClipAdsCarouselProviderFingerprint.method,
        ).forEach { method ->
            check(method.implementation!!.registerCount >= 2) {
                "Clips ad provider method ${method.name} has no free local register"
            }
            method.addInstructions(0, returnFalse)
        }

        ClipYandexAdParamsProviderFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lwo0/k;->b:Lwo0/k;
                return-object v0
            """
        )

        ClipMarketAdHeaderClicksProviderFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lcom/vk/clips/sdk/shared/viewer/experiments/models/ClipsMarketAdHeaderClickConfig;->c:Lcom/vk/clips/sdk/shared/viewer/experiments/models/ClipsMarketAdHeaderClickConfig;
                return-object v0
            """
        )

        val returnDisabledBannerCompanion = """
            sget-object v0, Lcom/vk/clips/sdk/shared/viewer/experiments/models/ClipsBannerCompanionConfig;->d:Lcom/vk/clips/sdk/shared/viewer/experiments/models/ClipsBannerCompanionConfig;
            return-object v0
        """.trimIndent()

        ClipSellerBannerCompanionProviderFingerprint.method.addInstructions(
            0,
            returnDisabledBannerCompanion
        )
        ClipBannerCompanionProviderFingerprint.method.addInstructions(
            0,
            returnDisabledBannerCompanion
        )

        // ClipVideoFileAdapter already treats null as "no server ad feature params".
        ClipVideoFileAdsFeaturesParamsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )
    }
}

@Suppress("unused")
val filterClipServerFeedAdsPatch = bytecodePatch(
    name = "Filter clip feed ads",
    description = "Removes server-provided StaticAd, MarketAd, FloatingAd, and MyTarget ad items before the VK Clips feed mapper can render them.",
    default = true
) {
    compatibleWith(VK_VIDEO)

    execute {
        ClipServerFeedMapperFingerprint.method.apply {
            // ee1.j.a() in VK Video 1.163 has 74 local registers plus two
            // parameters. Filter the mutable API feed list before the original
            // mapper converts ad DTOs into SDK items / install CTA buttons.
            check(implementation!!.registerCount >= 6) {
                "Clips feed mapper has insufficient local registers; fingerprint needs updating"
            }

            addInstructionsWithLabels(
                0,
                """
                    invoke-virtual/range {p0 .. p0}, Lcom/vk/api/generated/shortVideo/dto/ShortVideoGetRecomResponseDto;->e()Lcom/vk/api/generated/shortVideo/dto/ShortVideoRecomFeedDto;
                    move-result-object v0

                    invoke-virtual {v0}, Lcom/vk/api/generated/shortVideo/dto/ShortVideoRecomFeedDto;->b()Ljava/util/List;
                    move-result-object v0

                    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                    move-result-object v1

                    :clip_filter_loop
                    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
                    move-result v2
                    if-eqz v2, :original

                    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                    move-result-object v2

                    instance-of v3, v2, Lcom/vk/api/generated/shortVideo/dto/ShortVideoRecomFeedItemDto${'$'}ShortVideoFeedItemShortVideoStaticAdDto;
                    if-nez v3, :clip_remove_ad

                    instance-of v3, v2, Lcom/vk/api/generated/shortVideo/dto/ShortVideoRecomFeedItemDto${'$'}ShortVideoFeedItemShortVideoMarketAdDto;
                    if-nez v3, :clip_remove_ad

                    instance-of v3, v2, Lcom/vk/api/generated/shortVideo/dto/ShortVideoRecomFeedItemDto${'$'}ShortVideoFeedItemShortVideoFloatingAdDto;
                    if-nez v3, :clip_remove_ad

                    instance-of v3, v2, Lcom/vk/api/generated/shortVideo/dto/ShortVideoRecomFeedItemDto${'$'}ShortVideoFeedItemShortVideoMytargetSdkAdDto;
                    if-nez v3, :clip_remove_ad

                    instance-of v3, v2, Lcom/vk/api/generated/shortVideo/dto/ShortVideoRecomFeedItemDto${'$'}ShortVideoFeedItemShortVideoMytargetSdkStaticDto;
                    if-nez v3, :clip_remove_ad

                    instance-of v3, v2, Lcom/vk/api/generated/shortVideo/dto/ShortVideoRecomFeedItemDto${'$'}ShortVideoFeedItemShortVideoMytargetSdkVideoDto;
                    if-nez v3, :clip_remove_ad

                    instance-of v3, v2, Lcom/vk/api/generated/shortVideo/dto/ShortVideoRecomFeedItemDto${'$'}ShortVideoFeedItemShortVideoMytargetSdkCarouselDto;
                    if-nez v3, :clip_remove_ad

                    instance-of v3, v2, Lcom/vk/api/generated/shortVideo/dto/ShortVideoRecomFeedItemDto${'$'}ShortVideoFeedItemShortVideoMytargetSdkPromoDto;
                    if-nez v3, :clip_remove_ad

                    goto :clip_filter_loop

                    :clip_remove_ad
                    invoke-interface {v1}, Ljava/util/Iterator;->remove()V
                    goto :clip_filter_loop
                """,
                ExternalLabel("original", getInstruction(0))
            )
        }
    }
}

@Suppress("unused")
val blockMidrollRuntimeAdsPatch = bytecodePatch(
    name = "Block midroll ads",
    description = "Stops the runtime MIDROLL branch before VideoAutoPlay pauses or switches the main video player to the instream ad engine.",
    default = true
) {
    compatibleWith(VK_VIDEO)

    execute {
        MidrollRuntimeGateFingerprint.method.apply {
            // x13.e.b() has five locals in 1.163. Return the same positive gate
            // result that VideoAutoPlay interprets as 'do not start this ad'.
            check(implementation!!.registerCount >= 4) {
                "Midroll gate has no safe local register; fingerprint needs updating"
            }

            addInstructionsWithLabels(
                0,
                """
                    sget-object v0, Lcom/vk/dto/common/AdSection;->MIDROLL:Lcom/vk/dto/common/AdSection;
                    if-ne p1, v0, :original

                    const/4 v0, 0x1
                    return v0
                """,
                ExternalLabel("original", getInstruction(0))
            )
        }
    }
}


@Suppress("unused")
val filterClipSdkAdsPatch = bytecodePatch(
    name = "Filter Clips SDK ads",
    description = "Drops client-side Clips SDK ad videos plus StaticAds/MarketAds before they enter the rendered feed.",
    default = true
) {
    compatibleWith(VK_VIDEO)

    execute {
        val returnNullForSdkAd = """
            invoke-static {p1}, Lc01/c;->f(Lcom/vk/clips/sdk/shared/api/deps/video/SdkVideoFile;)Z
            move-result v0
            if-eqz v0, :original

            const/4 v0, 0x0
            return-object v0
        """.trimIndent()

        ClipSdkAdVideoMapperFingerprint.method.apply {
            check(implementation!!.registerCount >= 4) {
                "Clips SDK ad mapper has no safe local register"
            }
            addInstructionsWithLabels(
                0,
                returnNullForSdkAd,
                ExternalLabel("original", getInstruction(0))
            )
        }

        ClipSdkAdVideoDefaultMapperFingerprint.method.apply {
            check(implementation!!.registerCount >= 5) {
                "Clips SDK default ad mapper has no safe local register"
            }
            addInstructionsWithLabels(
                0,
                returnNullForSdkAd,
                ExternalLabel("original", getInstruction(0))
            )
        }

        // r11.d.f(): e$d = StaticAds and e$b = MarketAds.
        val staticAdIntermediate = "Lk01/e\$d;"
        val marketAdIntermediate = "Lk01/e\$b;"

        ClipSdkIntermediateListFingerprint.method.apply {
            check(implementation!!.registerCount >= 7) {
                "Clips SDK list mapper has insufficient local registers"
            }
            addInstructionsWithLabels(
                0,
                """
                    new-instance v0, Ljava/util/ArrayList;
                    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

                    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;
                    move-result-object v1

                    :sdk_clip_filter_loop
                    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
                    move-result v2
                    if-eqz v2, :sdk_clip_filter_done

                    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
                    move-result-object v3

                    instance-of v4, v3, $staticAdIntermediate
                    if-nez v4, :sdk_clip_filter_loop

                    instance-of v4, v3, $marketAdIntermediate
                    if-nez v4, :sdk_clip_filter_loop

                    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
                    goto :sdk_clip_filter_loop

                    :sdk_clip_filter_done
                    move-object p1, v0
                """,
                ExternalLabel("original", getInstruction(0))
            )
        }
    }
}

@Suppress("unused")
val blockDeepMidrollAdsPatch = bytecodePatch(
    name = "Block deep midroll ads",
    description = "Disables the dedicated request_midroll runnable, midpoint configuration, and direct named midroll starts.",
    default = true
) {
    compatibleWith(VK_VIDEO)

    execute {
        MidrollRequestRunnableFingerprint.method.addInstruction(0, "return-void")
        InstreamMidpointConfigFingerprint.method.addInstruction(0, "return-void")

        InstreamNamedSectionStartFingerprint.method.apply {
            check(implementation!!.registerCount >= 3) {
                "Instream named-section start has no safe local register"
            }
            addInstructionsWithLabels(
                0,
                """
                    const-string v0, "midroll"
                    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :original

                    return-void
                """,
                ExternalLabel("original", getInstruction(0))
            )
        }
    }
}
@Suppress("unused")
val hideHomeShowcaseAdsPatch = bytecodePatch(
    name = "Hide home showcase ads",
    description = "Replaces the native MyTarget showcase ad card on the home catalog with VK's EmptyVh.",
    default = true
) {
    compatibleWith(VK_VIDEO)

    execute {
        HomeShowcaseCatalogFactoryFingerprint.method.apply {
            val adFactoryReference =
                "Lcom/vk/catalog2/common/ui/mvp/configuration/a;->a(Lai0/f;Lwp/a;)Lcom/vk/catalog2/common/ui/holders/ads/AdShowCaseBannerVh;"

            val adFactoryIndex = implementation!!.instructions.indexOfFirst { instruction ->
                (instruction as? ReferenceInstruction)?.reference?.toString() == adFactoryReference
            }
            check(adFactoryIndex >= 0) {
                "Home showcase AdShowCaseBannerVh factory call not found"
            }

            // Do not reuse parameter registers here. In the real 1.163
            // method the active CatalogViewType has already been moved to a
            // local register, and p2 is not guaranteed to retain that type at
            // this branch. Returning a plain EmptyVh avoids verifier/type
            // hazards and mirrors existing branches in the same method.
            addInstructions(
                adFactoryIndex,
                """
                    new-instance v0, Lcom/vk/catalog2/common/ui/holders/EmptyVh;
                    invoke-direct {v0}, Lcom/vk/catalog2/common/ui/holders/EmptyVh;-><init>()V
                    return-object v0
                """
            )
        }
    }
}

@Suppress("unused")
val disableVideoAdRepositoryPatch = bytecodePatch(
    name = "Disable video ad repository",
    description = "Replaces the real video advertising repository with VK's built-in no-op STUB.",
    default = true
) {
    compatibleWith(VK_VIDEO)

    execute {
        VideoAdvertisementsRepositoryFingerprint.method.apply {
            check(implementation!!.registerCount >= 2) {
                "VideoAdvertisementsComponentImpl.Q6() has no safe local register"
            }

            addInstructions(
                0,
                """
                    sget-object v0, Lcom/vk/libvideo/api/di/VideoAdvertisementsComponent;->INSTANCE:$VIDEO_ADS_COMPANION
                    invoke-virtual {v0}, $VIDEO_ADS_COMPANION->getSTUB()Lcom/vk/libvideo/api/di/VideoAdvertisementsComponent;
                    move-result-object v0
                    invoke-interface {v0}, Lcom/vk/libvideo/api/di/VideoAdvertisementsComponent;->Q6()Lcom/vk/libvideo/api/ad/VideoAdvertisementsRepository;
                    move-result-object v0
                    return-object v0
                """
            )
        }
    }
}

@Suppress("unused")
val hideProfileAdFreePromoPatch = bytecodePatch(
    name = "Hide profile ad-free promo",
    description = "Removes the VK Premium / ad-free trial promotional card from the profile My screen before it enters the adapter list.",
    default = true
) {
    compatibleWith(VK_VIDEO)

    execute {
        // wc6.q.i(ArrayList) only appends AD_FREE_SUBSCRIPTION to the profile
        // menu when the feature/config gates are enabled. Returning here keeps
        // the item out of the list entirely, without touching other profile UI.
        ProfileAdFreeMenuItemFingerprint.method.addInstruction(0, "return-void")
    }
}

@Suppress("unused")
val hidePromotedBannerPatch = bytecodePatch(
    name = "Hide promoted banner content",
    description = "Forces VideoDiscoverAdsDto.canShowAdBanner to false.",
    default = true
) {
    compatibleWith(VK_VIDEO)

    execute {
        DiscoverAdBannerFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object v0
            """
        )
    }
}

@Suppress("unused")
val disableAdPixelTrackingPatch = bytecodePatch(
    name = "Disable ad pixel tracking",
    description = "Stops PixelStatsTrackerImpl from sending individual and batch ad pixels.",
    default = true
) {
    compatibleWith(VK_VIDEO)

    execute {
        val returnEmptyDisposable = """
            sget-object v0, $EMPTY_DISPOSABLE->INSTANCE:$EMPTY_DISPOSABLE
            return-object v0
        """.trimIndent()

        PixelStatsSingleFingerprint.method.addInstructions(0, returnEmptyDisposable)
        PixelStatsBatchFingerprint.method.addInstructions(0, returnEmptyDisposable)
    }
}
