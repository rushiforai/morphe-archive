// Ported from Solvo37/VK-Video-Morphe-Patches (GPLv3), dev/solvo37/vkvideopatches/Patches.kt.
package app.ru_apps.vkvideo

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.privacy.patches.analytics.jl4ctuk.disableAnalyticsDependency
import app.ru_apps.vkvideo.Constants.VK_VIDEO
import com.android.tools.smali.dexlib2.Opcode
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

    dependsOn(disableAnalyticsDependency)

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

        // Ordinary videos in 1.164 still carry a separate legacy ads object
        // inside VideoVideoFullDto. Make that payload inert before the mapper
        // can turn it into InstreamAd and start preroll playback.
        VideoAdsConstructorFingerprint.method.addInstructions(
            0,
            """
                const/4 p1, 0x0
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object p2
                const/4 p3, 0x0
                invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                move-result-object p4
                sget-object p5, Lcom/vk/api/generated/base/dto/BaseBoolIntDto;->NO:Lcom/vk/api/generated/base/dto/BaseBoolIntDto;
                const/4 p6, 0x0
                sget-object p7, Lcom/vk/api/generated/base/dto/BaseBoolIntDto;->NO:Lcom/vk/api/generated/base/dto/BaseBoolIntDto;
            """
        )

        // Fail closed at the object boundary as well. The ordinary-video
        // mapper treats a null ads object as no InstreamAd at all.
        VideoFullAdsGetterFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
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

        // Provider internals are R8-obfuscated and can move between app versions.
        // Treat these as defense-in-depth only: the stable feature gates, server
        // feed filter and SDK mappers below remain mandatory fail-closed layers.
        listOfNotNull(
            ClipAdsPromoProviderFingerprint.methodOrNull,
            ClipAdsStaticProviderFingerprint.methodOrNull,
            ClipAdsLabelProviderFingerprint.methodOrNull,
            ClipMarketAdProviderFingerprint.methodOrNull,
            ClipMarketAdChoicesProviderFingerprint.methodOrNull,
            ClipAdsVideoOwnerProviderFingerprint.methodOrNull,
            ClipFeedEndRewatchAdProviderFingerprint.methodOrNull,
            ClipAdsVideoProviderFingerprint.methodOrNull,
            ClipAdsCarouselProviderFingerprint.methodOrNull,
        ).forEach { method ->
            check(method.implementation!!.registerCount >= 2) {
                "Clips ad provider method ${method.name} has no free local register"
            }
            method.addInstructions(0, returnFalse)
        }

        // These config-provider hooks are likewise optional across R8 revisions.
        // If they still match the 1.163 provider shape, keep applying them.
        ClipYandexAdParamsProviderFingerprint.methodOrNull?.addInstructions(
            0,
            """
                sget-object v0, Lwo0/k;->b:Lwo0/k;
                return-object v0
            """
        )

        ClipMarketAdHeaderClicksProviderFingerprint.methodOrNull?.addInstructions(
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

        ClipSellerBannerCompanionProviderFingerprint.methodOrNull?.addInstructions(
            0,
            returnDisabledBannerCompanion
        )
        ClipBannerCompanionProviderFingerprint.methodOrNull?.addInstructions(
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
        // Runtime-validated hotfix: API deserializers may supply an immutable list. Both response
        // mappers remove ad entries in-place, so own a mutable copy first.
        ClipServerFeedConstructorFingerprint.method.apply {
            val fieldReferences = implementation!!.instructions
                .mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
            val itemsField = fieldReferences.firstOrNull {
                it.startsWith("Lcom/vk/api/generated/shortVideo/dto/ShortVideoRecomFeedDto;->") &&
                    it.endsWith(":Ljava/util/List;")
            } ?: error("Clips feed items field was not found")
            val pageAnchorField = fieldReferences.firstOrNull {
                it.startsWith("Lcom/vk/api/generated/shortVideo/dto/ShortVideoRecomFeedDto;->") &&
                    it.endsWith(":Ljava/lang/String;")
            } ?: error("Clips feed page anchor field was not found")

            addInstructions(
                0,
                """
                    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
                    iput-object p2, p0, $pageAnchorField
                    new-instance p2, Ljava/util/ArrayList;
                    invoke-direct {p2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
                    iput-object p2, p0, $itemsField
                    return-void
                """
            )
        }

        ClipServerFeedMapperFingerprint.method.apply {
            // The mapper class, method name and generated getter name move under
            // R8 between VK Video releases. Resolve the two stable API calls
            // from the matched method instead of hard-coding the 1.163 names.
            check(implementation!!.registerCount >= 6) {
                "Clips feed mapper has insufficient local registers; fingerprint needs updating"
            }

            val mapperReferences = implementation!!.instructions
                .mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }

            val responseFeedReference = mapperReferences.firstOrNull {
                it.startsWith("Lcom/vk/api/generated/shortVideo/dto/ShortVideoGetRecomResponseDto;->") &&
                    it.endsWith("()Lcom/vk/api/generated/shortVideo/dto/ShortVideoRecomFeedDto;")
            } ?: error("ShortVideo recom feed getter was not found in Clips mapper")

            val feedItemsReference = mapperReferences.firstOrNull {
                it.startsWith("Lcom/vk/api/generated/shortVideo/dto/ShortVideoRecomFeedDto;->") &&
                    it.endsWith("()Ljava/util/List;")
            } ?: error("ShortVideo recom feed items getter was not found in Clips mapper")

            addInstructionsWithLabels(
                0,
                """
                    invoke-virtual/range {p0 .. p0}, $responseFeedReference
                    move-result-object v0

                    invoke-virtual {v0}, $feedItemsReference
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

        // Do not mutate the API response in the shared synthetic Function1.
        // That callback has additional consumers which assume the original
        // response shape and crashed when opening Clips. Ads are filtered in
        // the dedicated mapper above and in the lower SDK conversion patch.
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
            // This method is a positive "may start" gate. Returning true here
            // used to enable the MIDROLL branch instead of blocking it. Deny
            // every instream section so preroll/postroll cannot move the main
            // player's timeline either.
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
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
        ClipSdkAdVideoMapperFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static {p1}, Lzz0/c;->f(Lcom/vk/clips/sdk/shared/api/deps/video/SdkVideoFile;)Z
                    move-result v0
                    if-eqz v0, :original

                    const/4 v0, 0x0
                    return-object v0
                """,
                ExternalLabel("original", getInstruction(0))
            )
        }

        ClipSdkIntermediateListFingerprint.method.apply {
            check(implementation!!.registerCount >= 7) {
                "Clips SDK list mapper has insufficient local registers"
            }

            // R8 renames the intermediate sealed class package between releases.
            // Derive the StaticAds ($d) and MarketAds ($b) concrete types from
            // the mapper's own INSTANCE_OF instructions instead of hard-coding
            // their 1.163 names.
            val intermediateTypes = implementation!!.instructions
                .filter { it.opcode == Opcode.INSTANCE_OF }
                .mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
                .distinct()

            val staticAdIntermediate = intermediateTypes.firstOrNull { it.endsWith("\$d;") }
                ?: error("StaticAds intermediate type was not found")
            val marketAdIntermediate = intermediateTypes.firstOrNull { it.endsWith("\$b;") }
                ?: error("MarketAds intermediate type was not found")
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
            val adFactoryIndex = implementation!!.instructions.indexOfFirst { instruction ->
                (instruction as? ReferenceInstruction)?.reference?.toString()
                    ?.endsWith(")Lcom/vk/catalog2/common/ui/holders/ads/AdShowCaseBannerVh;") == true
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
                "VideoAdvertisementsComponentImpl.V6() has no safe local register"
            }

            addInstructions(
                0,
                """
                    sget-object v0, Lcom/vk/libvideo/api/di/VideoAdvertisementsComponent;->Companion:$VIDEO_ADS_COMPANION
                    invoke-virtual {v0}, $VIDEO_ADS_COMPANION->getSTUB()Lcom/vk/libvideo/api/di/VideoAdvertisementsComponent;
                    move-result-object v0
                    invoke-interface {v0}, Lcom/vk/libvideo/api/di/VideoAdvertisementsComponent;->V6()Lcom/vk/libvideo/api/ad/VideoAdvertisementsRepository;
                    move-result-object v0
                    return-object v0
                """
            )
        }
    }
}

@Suppress("unused")
val disableAdFreeSubscriptionPromoPatch = bytecodePatch(
    name = "Disable ad-free subscription promo",
    description = "Disables VK's VIDEO_AD_FREE_SUBSCRIPTION feature gate so profile promo items are never created.",
    default = true
) {
    compatibleWith(VK_VIDEO)

    execute {
        VideoFeaturesEnabledFingerprint.method.apply {
            check(implementation!!.registerCount >= 2) {
                "VideoFeatures.a() has no safe local register for the ad-free promo gate"
            }

            addInstructionsWithLabels(
                0,
                """
                    sget-object v0, $VIDEO_FEATURES->VIDEO_AD_FREE_SUBSCRIPTION:$VIDEO_FEATURES
                    if-ne p0, v0, :original

                    const/4 v0, 0x0
                    return v0
                """,
                ExternalLabel("original", getInstruction(0))
            )
        }
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
val disableOpenTelemetryPatch = bytecodePatch(
    name = "Disable OpenTelemetry APM",
    description = "Disables the ru.ok.tracer/OpenTelemetry pipeline (OkHttp request interception, CPU/network tech-stats, span/metric/log upload) by forcing its tracing-enabled gate off.",
    default = true
) {
    compatibleWith(VK_VIDEO)

    execute {
        OpenTelemetryTracingEnabledFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
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
