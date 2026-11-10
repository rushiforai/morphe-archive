package app.template.patches.kayo

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_KAYO_SPORTS
import app.template.patches.shared.Constants.COMPATIBILITY_KAYO_SPORTS_TV
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.Opcode

private const val EXTENSION_CLASS_DESCRIPTOR = "Lapp/template/extension/kayo/KayoPatch;"

private inline fun safeHook(name: String, block: () -> Unit) {
    try {
        block()
    } catch (e: Throwable) {
        println("Optional hook '$name' skipped: ${e.message}")
    }
}

@Suppress("unused")
val inPlayerQualityMenuPatch = bytecodePatch(
    name = "In-player quality menu",
    description = "Adds a menu that lists the available video qualities so the user can pick a specific resolution when watching a live stream on Kayo Sports instead of adaptive streaming.",
    default = true
) {
    compatibleWith(
        COMPATIBILITY_KAYO_SPORTS,
        COMPATIBILITY_KAYO_SPORTS_TV
    )

    extendWith("extensions/extension.mpe")

    execute {
        // =====================================================================
        // Mobile Specific Hooks (au.com.kayosports)
        // =====================================================================

        // 1. Capture DefaultTrackSelector instance when ProfileBasedTrackSelector (Lpx/e;) is constructed.
        safeHook("ProfileBasedTrackSelectorConstructor") {
            ProfileBasedTrackSelectorConstructorFingerprint.methodOrNull?.let { method ->
                method.addInstruction(
                    0,
                    "invoke-static {p1}, $EXTENSION_CLASS_DESCRIPTOR->onTrackSelectorInit(Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;)V"
                )
            }
        }

        // 2. Intercept ProfileBasedTrackSelector.f(Tracks) (called by onTracksChanged(Tracks))
        // to capture the available video tracks, update the in-player quality badge, and re-apply
        // any manual resolution lock.
        safeHook("ProfileBasedTrackSelectorUpdateTracks") {
            ProfileBasedTrackSelectorUpdateTracksFingerprint.methodOrNull?.let { method ->
                val fp = ProfileBasedTrackSelectorUpdateTracksFingerprint
                val selectorFieldIndex = fp.instructionMatches[1].index
                val selectorFieldRef = method.getInstruction<ReferenceInstruction>(selectorFieldIndex).reference as FieldReference

                method.addInstructions(
                    0,
                    """
                        iget-object v0, p0, $selectorFieldRef
                        invoke-static {v0, p1}, $EXTENSION_CLASS_DESCRIPTOR->onTracksChanged(Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;Lcom/google/android/exoplayer2/Tracks;)Z
                    """
                )
            }
        }

        // 3. Prevent Kayo's automatic TrackBitrateLimiter / ProfileBitrate from overriding
        // a manually selected video resolution in b(int maxVideoBitrate) and c(int maxVideoHeight).
        safeHook("ProfileBasedTrackSelectorSetMaxBitrate") {
            ProfileBasedTrackSelectorSetMaxBitrateFingerprint.methodOrNull?.let { method ->
                method.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static {}, $EXTENSION_CLASS_DESCRIPTOR->shouldIgnoreBitrateLimit()Z
                        move-result v0
                        if-eqz v0, :allow_adaptive_bitrate
                        return-void
                        :allow_adaptive_bitrate
                        nop
                    """
                )
            }
        }

        // Neutralize Kayo's client-side maxVideoHeight cap so ExoPlayer is never constrained to 720p
        safeHook("ProfileBasedTrackSelectorSetMaxSize") {
            ProfileBasedTrackSelectorSetMaxSizeFingerprint.methodOrNull?.let { method ->
                method.addInstruction(
                    0,
                    "return-void"
                )
            }
        }

        // 4. Force the top-bar track selector button (toggle_track_selector) to always be visible
        // on live streams (Kayo normally hides it on live streams when there is only 1 audio track).
        safeHook("AbstractDaznPlayerControlsTrackSelectorVisibility") {
            AbstractDaznPlayerControlsTrackSelectorVisibilityFingerprint.methodOrNull?.let { method ->
                method.addInstructions(
                    0,
                    """
                        invoke-static {p1}, $EXTENSION_CLASS_DESCRIPTOR->overrideTrackSelectorVisibility(Z)Z
                        move-result p1
                    """
                )
            }
        }

        // 5. Inject our live resolution pill badge ("AUTO (1080p)" / "1080p50" / "4K") and attach the
        // Video Quality selector menu click listener after AbstractDaznPlayerControls sets up
        // getTrackSelectorButton().setOnClickListener(this).
        safeHook("AbstractDaznPlayerControlsSetup") {
            AbstractDaznPlayerControlsSetupFingerprint.methodOrNull?.let { method ->
                val fp = AbstractDaznPlayerControlsSetupFingerprint
                val moveResultIndex = fp.instructionMatches[3].index
                val setOnClickIndex = fp.instructionMatches[4].index
                val buttonRegister = method.getInstruction<OneRegisterInstruction>(moveResultIndex).registerA

                method.addInstruction(
                    setOnClickIndex + 1,
                    "invoke-static {v$buttonRegister}, $EXTENSION_CLASS_DESCRIPTOR->onControlsInitialized(Landroid/view/View;)V"
                )
            }
        }

        // 6. Also hook DefaultPlayerControls (v2 controls) if present in the APK.
        safeHook("DefaultPlayerControlsConstructor") {
            DefaultPlayerControlsConstructorFingerprint.methodOrNull?.let { method ->
                val fp = DefaultPlayerControlsConstructorFingerprint
                val moveResultIndex = fp.instructionMatches[2].index
                val setOnClickIndex = fp.instructionMatches[3].index
                val buttonRegister = method.getInstruction<OneRegisterInstruction>(moveResultIndex).registerA

                method.addInstruction(
                    setOnClickIndex + 1,
                    "invoke-static {v$buttonRegister}, $EXTENSION_CLASS_DESCRIPTOR->onControlsInitialized(Landroid/view/View;)V"
                )
            }
        }

        // 7. Force full playback capabilities ("mta,50fps,lowlatency,hevc,hdr") in the stream request
        safeHook("PlaybackServiceDelegateCapabilities") {
            PlaybackServiceDelegateCapabilitiesFingerprint.methodOrNull?.let { method ->
                method.addInstructions(
                    0,
                    """
                        const-string v0, "mta,50fps,lowlatency,hevc,hdr"
                        return-object v0
                    """
                )

                // 8. Prevent sending "low" DRM tier in the playback request body (which restricts CDN to 720p)
                safeHook("PlaybackServiceDelegateDrmTier") {
                    PlaybackServiceDelegateDrmTierFingerprint.methodOrNull?.let { drmTierMethod ->
                        drmTierMethod.addInstructions(
                            0,
                            """
                                const/4 v0, 0x0
                                return-object v0
                            """
                        )
                    }
                }
            }
        }

        // 9. Force DrmTierService.b() to return false (not low tier)
        safeHook("DrmTierServiceIsLowTier") {
            DrmTierServiceIsLowTierFingerprint.methodOrNull?.let { method ->
                method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x0
                        return v0
                    """
                )
            }
        }

        // 10. Force HEVC decoder support check to return true
        safeHook("PlaybackCodecsServiceIsHevcSupported") {
            PlaybackCodecsServiceIsHevcSupportedFingerprint.methodOrNull?.let { method ->
                method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x1
                        return v0
                    """
                )
            }
        }

        // 11. Capture active ExoPlayer instance when attached in PlayerInterfaceDazn.R1(ExoPlayer)
        safeHook("PlayerInterfaceAttachExoPlayer") {
            PlayerInterfaceAttachExoPlayerFingerprint.methodOrNull?.let { method ->
                method.addInstruction(
                    0,
                    "invoke-static {p1}, $EXTENSION_CLASS_DESCRIPTOR->onExoPlayerAttached(Lcom/google/android/exoplayer2/ExoPlayer;)V"
                )
            }
        }

        // 11b. Hook ProfileBasedTrackSelector.setAudioTrack(String) so Kayo's native Audio/CC menu
        // and our in-player Audio dialog stay synchronized and can switch audio repeatedly without conflict.
        safeHook("ProfileBasedTrackSelectorSetAudioTrack") {
            ProfileBasedTrackSelectorSetAudioTrackFingerprint.methodOrNull?.let { method ->
                val fp = ProfileBasedTrackSelectorSetAudioTrackFingerprint
                val selectorFieldIndex = fp.instructionMatches[0].index
                val selectorFieldRef = method.getInstruction<ReferenceInstruction>(selectorFieldIndex).reference as FieldReference

                method.addInstructions(
                    0,
                    """
                        iget-object v0, p0, $selectorFieldRef
                        invoke-static {v0, p1}, $EXTENSION_CLASS_DESCRIPTOR->onSetAudioTrack(Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;Ljava/lang/String;)V
                        return-void
                    """
                )
            }
        }

        // 11c. Hook TrackSelectorService.i(Tracks) so currentTracks is always updated even when
        // LHv/P.skipNextTrackReselection (o0) skips ProfileBasedTrackSelector.onTracksChanged(Tracks).
        safeHook("TrackSelectorServiceOnTracksChanged") {
            TrackSelectorServiceOnTracksChangedFingerprint.methodOrNull?.let { method ->
                method.addInstruction(
                    0,
                    "invoke-static {p1}, $EXTENSION_CLASS_DESCRIPTOR->onTracksUpdated(Lcom/google/android/exoplayer2/Tracks;)V"
                )
            }
        }

        // 11d. Hook PlaybackForceQualityModeService.a() to return 0 so Featurevisor's MAX_RESOLUTION_HEIGHT (720p) is disabled.
        safeHook("PlaybackForceQualityModeMaxResolutionHeight") {
            PlaybackForceQualityModeMaxResolutionHeightFingerprint.methodOrNull?.let { method ->
                method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x0
                        return v0
                    """
                )
            }
        }

        // 11e. Force MediaCodecUtil.forceDisableFrameRateCheck(true) in LHv/P;->m1(...) so 1080p50 / 4K50
        // is never rejected with FORMAT_EXCEEDS_CAPABILITIES by strict hardware decoder frame-rate checks on mobile.
        safeHook("PlayerInterfaceForceDisableFrameRateCheck") {
            PlayerInterfaceInitExoPlayerFingerprint.methodOrNull?.let { method ->
                val fp = PlayerInterfaceInitExoPlayerFingerprint
                val callIndex = fp.instructionMatches[0].index
                val argReg = method.getInstruction<OneRegisterInstruction>(callIndex - 1).registerA
                method.addInstruction(
                    callIndex,
                    "const/4 v$argReg, 0x1"
                )
            }
        }

        // =====================================================================
        // Android TV Specific Hooks (au.com.kayosports.tv)
        // =====================================================================

        // 12. Hook VideoCapabilitiesPlugin.execute to spoof 4K, 60fps, Widevine L1, HDCP 2.2, HEVC, and HDR
        safeHook("TvVideoCapabilitiesPluginExecute") {
            TvVideoCapabilitiesPluginExecuteFingerprint.methodOrNull?.let { method ->
                method.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static {p1, p2, p3}, $EXTENSION_CLASS_DESCRIPTOR->onVideoCapabilitiesExecute(Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :cond_native_exec
                        const/4 v0, 0x1
                        return v0
                        :cond_native_exec
                        nop
                    """
                )
            }
        }

        // 13. Hook DrmPlayer.setMaxVideoBitrate to override/uncap max bitrate on Android TV,
        // capture DrmPlayer and bandwidth meter, and configure builder for 4K UHD video parameters
        safeHook("TvDrmPlayerSetMaxBitrate") {
            TvDrmPlayerSetMaxBitrateFingerprint.methodOrNull?.let { method ->
                method.addInstructions(
                    0,
                    """
                        invoke-static {p0}, $EXTENSION_CLASS_DESCRIPTOR->onDrmPlayerAttached(Ljava/lang/Object;)V
                        invoke-static {p1}, $EXTENSION_CLASS_DESCRIPTOR->overrideTvMaxBitrate(I)I
                        move-result p1
                    """
                )

                val fp = TvDrmPlayerSetMaxBitrateFingerprint
                if (fp.instructionMatches.size >= 2) {
                    val iputIndex = fp.instructionMatches[1].index
                    val builderRegister = method.getInstruction<TwoRegisterInstruction>(iputIndex).registerB
                    method.addInstruction(
                        iputIndex + 1,
                        "invoke-static {v$builderRegister}, $EXTENSION_CLASS_DESCRIPTOR->configureTvTrackParametersBuilder(Ljava/lang/Object;)V"
                    )
                }
            }
        }

        // 13b. Hook DefaultTrackSelector$Parameters.<init>(DefaultTrackSelector$Parameters$Builder)
        // so every DefaultTrackSelector.Parameters instance ever constructed in Kayo TV has unconstrained
        // 4K UHD video/viewport parameters before TrackSelectionParameters.<init>(Builder) copies its fields.
        safeHook("TvDefaultTrackSelectorParametersConstructor") {
            TvDefaultTrackSelectorParametersConstructorFingerprint.methodOrNull?.let { method ->
                method.addInstruction(
                    0,
                    "invoke-static {p1}, $EXTENSION_CLASS_DESCRIPTOR->configureTvTrackParametersBuilder(Ljava/lang/Object;)V"
                )
            }
        }

        // 14. Hook PlayerView.setPlayer to capture active Media3 ExoPlayer instance and attach TV Quality Button
        safeHook("TvPlayerViewSetPlayer") {
            TvPlayerViewSetPlayerFingerprint.methodOrNull?.let { method ->
                method.addInstruction(
                    0,
                    "invoke-static {p0, p1}, $EXTENSION_CLASS_DESCRIPTOR->onTvPlayerViewSetPlayer(Landroid/view/View;Ljava/lang/Object;)V"
                )
            }
        }

        // 14b. Hook ExoPlayerEventsListener.onTracksChanged to capture active Tracks and Player on Android TV
        safeHook("TvExoPlayerEventsListenerOnTracksChanged") {
            TvExoPlayerEventsListenerOnTracksChangedFingerprint.methodOrNull?.let { method ->
                method.addInstruction(
                    0,
                    "invoke-static {p1, p0}, $EXTENSION_CLASS_DESCRIPTOR->onTvTracksChanged(Ljava/lang/Object;Ljava/lang/Object;)V"
                )
            }
        }

        // 15. Hook MainActivity.dispatchKeyEvent to handle Android TV remote keys (Info, Menu, Color keys)
        // for toggling Live Stream Diagnostics HUD and Quality Menu.
        safeHook("TvMainActivityDispatchKeyEvent") {
            TvMainActivityDispatchKeyEventFingerprint.methodOrNull?.let { method ->
                method.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static {p0, p1}, $EXTENSION_CLASS_DESCRIPTOR->onTvKeyEvent(Landroid/app/Activity;Landroid/view/KeyEvent;)Z
                        move-result v0
                        if-eqz v0, :cond_native_key
                        const/4 v0, 0x1
                        return v0
                        :cond_native_key
                        nop
                    """
                )
            }
        }

        // 16. Hook VideoPlugin.getPhysicalDisplaySize to return 3840x2160 (4K UHD)
        safeHook("TvVideoPluginGetPhysicalDisplaySize") {
            TvVideoPluginGetPhysicalDisplaySizeFingerprint.methodOrNull?.let { method ->
                method.addInstructions(
                    0,
                    """
                        invoke-static {}, $EXTENSION_CLASS_DESCRIPTOR->getPhysicalDisplaySizeSpoof()Lorg/json/JSONObject;
                        move-result-object v0
                        return-object v0
                    """
                )
            }
        }

        // 17. Hook DaznDrmSessionManager constructor to force useWidevineL3 = false (guaranteeing Widevine L1)
        safeHook("TvDaznDrmSessionManagerConstructor") {
            TvDaznDrmSessionManagerConstructorFingerprint.methodOrNull?.let { method ->
                method.addInstruction(
                    0,
                    "const/4 p3, 0x0"
                )
            }
        }

        // 18. Hook Util.getCurrentDisplayModeSize to report 3840x2160 (4K UHD) display mode size
        safeHook("TvMedia3UtilGetCurrentDisplayModeSize") {
            TvMedia3UtilGetCurrentDisplayModeSizeFingerprint.methodOrNull?.let { method ->
                method.addInstructions(
                    0,
                    """
                        new-instance v0, Landroid/graphics/Point;
                        const/16 v1, 0x0f00
                        const/16 v2, 0x0870
                        invoke-direct {v0, v1, v2}, Landroid/graphics/Point;-><init>(II)V
                        return-object v0
                    """
                )
            }
        }

        // 19. Hook Action$Companion.queryConnectedHdcpLevel to always return "2.2" for 4K UHD HDCP verification
        safeHook("TvHdcpLevelQuerier") {
            TvHdcpLevelQuerierFingerprint.methodOrNull?.let { method ->
                method.addInstructions(
                    0,
                    """
                        const-string v0, "2.2"
                        return-object v0
                    """
                )
            }
        }

        // 19b. Hook HdmiStatusPlugin.tryNotify to always report HDMI connected = true
        safeHook("TvHdmiStatusPluginTryNotify") {
            TvHdmiStatusPluginTryNotifyFingerprint.methodOrNull?.let { method ->
                method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x1
                        iput-boolean v0, p0, Lcom/dazn/plugins/hdmistatus/HdmiStatusPlugin;->isConnected:Z
                    """
                )
            }
        }

        // 20. Hook ResultKt.parse(JSONObject)LoadArguments to sanitize useWidevineL3 and maxVideoBitrate
        safeHook("TvLoadArgumentsParser") {
            TvLoadArgumentsParserFingerprint.methodOrNull?.let { method ->
                method.addInstruction(
                    0,
                    "invoke-static {p0}, $EXTENSION_CLASS_DESCRIPTOR->sanitizeLoadArgumentsJson(Lorg/json/JSONObject;)V"
                )
            }
        }

        // 21. Hook DefaultTrackSelector.selectTracksForType to enforce single-track selection when quality is locked
        safeHook("TvDefaultTrackSelectorSelectTracksForType") {
            TvDefaultTrackSelectorSelectTracksForTypeFingerprint.methodOrNull?.let { method ->
                val fp = TvDefaultTrackSelectorSelectTracksForTypeFingerprint
                if (fp.instructionMatches.isNotEmpty()) {
                    val pairCreateIdx = fp.instructionMatches[0].index
                    method.addInstructions(
                        pairCreateIdx + 2,
                        """
                            invoke-static {v0}, $EXTENSION_CLASS_DESCRIPTOR->overrideSelectTracksResult(Landroid/util/Pair;)Landroid/util/Pair;
                            move-result-object v0
                        """
                    )
                }
            }
        }

        // 21b. Hook ExoTrackSelection$Definition.<init>(int, TrackGroup, int[]) to narrow video track arrays
        // to [bestIndex] whenever quality is locked, forcing MediaPeriodHolder to create FixedTrackSelection.
        safeHook("TvExoTrackSelectionDefinitionConstructor") {
            TvExoTrackSelectionDefinitionConstructorFingerprint.methodOrNull?.let { method ->
                method.addInstructions(
                    0,
                    """
                        invoke-static {p2, p3}, $EXTENSION_CLASS_DESCRIPTOR->overrideDefinitionTracks(Ljava/lang/Object;[I)[I
                        move-result-object p3
                    """
                )
            }
        }

        // 21c. Hook AdaptiveTrackSelection.determineIdealSelectedIndex(long) to return locked selection index
        safeHook("TvAdaptiveTrackSelectionDetermineIdealSelectedIndex") {
            TvAdaptiveTrackSelectionDetermineIdealSelectedIndexFingerprint.methodOrNull?.let { method ->
                method.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static {p0}, $EXTENSION_CLASS_DESCRIPTOR->overrideIdealSelectedIndex(Ljava/lang/Object;)I
                        move-result v0
                        if-ltz v0, :cond_native_ideal
                        return v0
                        :cond_native_ideal
                        nop
                    """
                )
            }
        }

        // 21d. Hook AdaptiveTrackSelection.getSelectedIndex() to return locked selection index
        safeHook("TvAdaptiveTrackSelectionGetSelectedIndex") {
            TvAdaptiveTrackSelectionGetSelectedIndexFingerprint.methodOrNull?.let { method ->
                method.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static {p0}, $EXTENSION_CLASS_DESCRIPTOR->overrideSelectedIndex(Ljava/lang/Object;)I
                        move-result v0
                        if-ltz v0, :cond_native_selected
                        return v0
                        :cond_native_selected
                        nop
                    """
                )
            }
        }

        // 21e. Hook AdaptiveTrackSelection.updateSelectedTrack(...) to lock selectedIndex = targetIdx and reason = 2 (MANUAL)
        safeHook("TvAdaptiveTrackSelectionUpdateSelectedTrack") {
            TvAdaptiveTrackSelectionUpdateSelectedTrackFingerprint.methodOrNull?.let { method ->
                method.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static {p0}, $EXTENSION_CLASS_DESCRIPTOR->onUpdateSelectedTrack(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :cond_native_update
                        return-void
                        :cond_native_update
                        nop
                    """
                )
            }
        }

        // 21f. Hook AdaptiveTrackSelection.evaluateQueueSize(long, List) to retain full buffer when quality is locked
        safeHook("TvAdaptiveTrackSelectionEvaluateQueueSize") {
            TvAdaptiveTrackSelectionEvaluateQueueSizeFingerprint.methodOrNull?.let { method ->
                method.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static {p0, p3}, $EXTENSION_CLASS_DESCRIPTOR->overrideEvaluateQueueSize(Ljava/lang/Object;Ljava/util/List;)I
                        move-result v0
                        if-ltz v0, :cond_native_queue
                        return v0
                        :cond_native_queue
                        nop
                    """
                )
            }
        }

        // 22. Hook DrmPlayer.releasePlayer to clean up TV player state and hide TV Quality Button when stream closes
        safeHook("TvDrmPlayerReleasePlayer") {
            TvDrmPlayerReleasePlayerFingerprint.methodOrNull?.let { method ->
                method.addInstruction(
                    0,
                    "invoke-static {}, $EXTENSION_CLASS_DESCRIPTOR->onTvPlayerReleased()V"
                )
            }
        }

        // 23. Hook DeviceStatsPlugin.readProcCpuInfoMHz to return 2000 MHz so ARM64 TV boxes never report -1 MHz
        safeHook("TvDeviceStatsReadCpuMHz") {
            TvDeviceStatsReadCpuMHzFingerprint.methodOrNull?.let { method ->
                method.addInstructions(
                    0,
                    """
                        const/16 v0, 0x07d0
                        return v0
                    """
                )
            }
        }

        // 24. Hook DefaultLoadControl.<init>()V to configure larger startup/rebuffer thresholds and forward buffer
        safeHook("TvDefaultLoadControlConstructor") {
            val fp = TvDefaultLoadControlConstructorFingerprint
            fp.methodOrNull?.let { method ->
                val returnVoidIdx = fp.instructionMatches.firstOrNull()?.index ?: -1
                if (returnVoidIdx >= 0) {
                    method.addInstruction(
                        returnVoidIdx,
                        "invoke-static {p0}, $EXTENSION_CLASS_DESCRIPTOR->configureDefaultLoadControl(Ljava/lang/Object;)V"
                    )
                }
            }
        }

        // 25. Hook DefaultLivePlaybackSpeedControl.<init>(JJ)V to prevent 1.03x live catch-up from draining buffer
        safeHook("TvDefaultLivePlaybackSpeedControlConstructor") {
            val fp = TvDefaultLivePlaybackSpeedControlConstructorFingerprint
            fp.methodOrNull?.let { method ->
                val returnVoidIdx = fp.instructionMatches.firstOrNull()?.index ?: -1
                if (returnVoidIdx >= 0) {
                    method.addInstruction(
                        returnVoidIdx,
                        "invoke-static {p0}, $EXTENSION_CLASS_DESCRIPTOR->configureLivePlaybackSpeedControl(Ljava/lang/Object;)V"
                    )
                }
            }
        }

        // 26. Hook ExoPlayerConfig parser and constructor to ensure safe live target offset and disable live-edge join clipping
        safeHook("TvExoPlayerConfigParser") {
            TvExoPlayerConfigParserFingerprint.methodOrNull?.let { method ->
                method.addInstruction(
                    0,
                    "invoke-static {p0}, $EXTENSION_CLASS_DESCRIPTOR->sanitizeExoPlayerConfigJson(Lorg/json/JSONObject;)V"
                )
            }
        }

        safeHook("TvExoPlayerConfigConstructor") {
            val fp = TvExoPlayerConfigConstructorFingerprint
            fp.methodOrNull?.let { method ->
                val returnVoidIdx = fp.instructionMatches.firstOrNull()?.index ?: -1
                if (returnVoidIdx >= 0) {
                    method.addInstruction(
                        returnVoidIdx,
                        "invoke-static {p0}, $EXTENSION_CLASS_DESCRIPTOR->sanitizeExoPlayerConfig(Ljava/lang/Object;)V"
                    )
                }
            }
        }

        // 27. Hook DefaultBandwidthMeter.getInitialBitrateEstimate to return 80 Mbps instead of 1 Mbps
        safeHook("TvDefaultBandwidthMeterGetInitialEstimate") {
            TvDefaultBandwidthMeterGetInitialEstimateFingerprint.methodOrNull?.let { method ->
                method.addInstructions(
                    0,
                    """
                        const-wide/32 v0, 0x04c4b400
                        return-wide v0
                    """
                )
            }
        }

        // 28. Hook Notificator.onBandwidthSample(IJJ)V so JS layer never sees artificial bandwidth dips
        safeHook("TvNotificatorOnBandwidthSample") {
            TvNotificatorOnBandwidthSampleFingerprint.methodOrNull?.let { method ->
                method.addInstructions(
                    0,
                    """
                        invoke-static {p4, p5}, $EXTENSION_CLASS_DESCRIPTOR->overrideReportedBandwidth(J)J
                        move-result-wide p4
                    """
                )
            }
        }

        // 29. Hook Mobile CustomLoadControlProvider.a(LNu/u;)LoadControl and DefaultLoadControl.<init>()V
        safeHook("MobileCustomLoadControlProvider") {
            MobileCustomLoadControlProviderFingerprint.methodOrNull?.let { method ->
                val instructions = method.instructions
                for (i in instructions.size - 1 downTo 0) {
                    if (instructions[i].opcode == Opcode.RETURN_OBJECT) {
                        val reg = (instructions[i] as OneRegisterInstruction).registerA
                        method.addInstruction(
                            i,
                            "invoke-static {v$reg}, $EXTENSION_CLASS_DESCRIPTOR->configureDefaultLoadControl(Ljava/lang/Object;)V"
                        )
                    }
                }
            }
        }

        safeHook("MobileDefaultLoadControlConstructor") {
            val fp = MobileDefaultLoadControlConstructorFingerprint
            fp.methodOrNull?.let { method ->
                val returnVoidIdx = fp.instructionMatches.firstOrNull()?.index ?: -1
                if (returnVoidIdx >= 0) {
                    method.addInstruction(
                        returnVoidIdx,
                        "invoke-static {p0}, $EXTENSION_CLASS_DESCRIPTOR->configureDefaultLoadControl(Ljava/lang/Object;)V"
                    )
                }
            }
        }

        // 30. Hook Mobile DefaultLivePlaybackSpeedControl.<init> to prevent 1.03x live catch-up from draining buffer
        safeHook("MobileDefaultLivePlaybackSpeedControlConstructor") {
            val fp = MobileDefaultLivePlaybackSpeedControlConstructorFingerprint
            fp.methodOrNull?.let { method ->
                val returnVoidIdx = fp.instructionMatches.firstOrNull()?.index ?: -1
                if (returnVoidIdx >= 0) {
                    method.addInstruction(
                        returnVoidIdx,
                        "invoke-static {p0}, $EXTENSION_CLASS_DESCRIPTOR->configureLivePlaybackSpeedControl(Ljava/lang/Object;)V"
                    )
                }
            }
        }

        // 31. Hook Mobile DefaultBandwidthMeter.getInitialBitrateEstimateForNetworkType(I)J to return 80 Mbps
        safeHook("MobileDefaultBandwidthMeterGetInitialEstimate") {
            MobileDefaultBandwidthMeterGetInitialEstimateFingerprint.methodOrNull?.let { method ->
                method.addInstructions(
                    0,
                    """
                        const-wide/32 v0, 0x04c4b400
                        return-wide v0
                    """
                )
            }
        }

        // 32. Hook Mobile PlayerInterfaceDazn.X0(DefaultRenderersFactory) to always enable decoder fallback
        safeHook("MobileConfigureRenderersFactory") {
            MobileConfigureRenderersFactoryFingerprint.methodOrNull?.let { method ->
                method.addInstruction(
                    0,
                    "invoke-static {p1}, $EXTENSION_CLASS_DESCRIPTOR->configureRenderersFactory(Ljava/lang/Object;)V"
                )
            }
        }

        // 33. Hook Mobile ExoTrackSelection$Definition.<init>(TrackGroup, int[], int) & AdaptiveTrackSelection
        safeHook("MobileExoTrackSelectionDefinitionConstructor") {
            MobileExoTrackSelectionDefinitionConstructorFingerprint.methodOrNull?.let { method ->
                method.addInstructions(
                    0,
                    """
                        invoke-static {p1, p2}, $EXTENSION_CLASS_DESCRIPTOR->overrideDefinitionTracks(Ljava/lang/Object;[I)[I
                        move-result-object p2
                    """
                )
            }
        }

        safeHook("MobileAdaptiveTrackSelectionDetermineIdealSelectedIndex") {
            MobileAdaptiveTrackSelectionDetermineIdealSelectedIndexFingerprint.methodOrNull?.let { method ->
                method.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static {p0}, $EXTENSION_CLASS_DESCRIPTOR->overrideIdealSelectedIndex(Ljava/lang/Object;)I
                        move-result v0
                        if-ltz v0, :cond_native_ideal_mob
                        return v0
                        :cond_native_ideal_mob
                        nop
                    """
                )
            }
        }

        safeHook("MobileAdaptiveTrackSelectionGetSelectedIndex") {
            MobileAdaptiveTrackSelectionGetSelectedIndexFingerprint.methodOrNull?.let { method ->
                method.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static {p0}, $EXTENSION_CLASS_DESCRIPTOR->overrideSelectedIndex(Ljava/lang/Object;)I
                        move-result v0
                        if-ltz v0, :cond_native_selected_mob
                        return v0
                        :cond_native_selected_mob
                        nop
                    """
                )
            }
        }

        safeHook("MobileAdaptiveTrackSelectionUpdateSelectedTrack") {
            MobileAdaptiveTrackSelectionUpdateSelectedTrackFingerprint.methodOrNull?.let { method ->
                method.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static {p0}, $EXTENSION_CLASS_DESCRIPTOR->onUpdateSelectedTrack(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :cond_native_update_mob
                        return-void
                        :cond_native_update_mob
                        nop
                    """
                )
            }
        }

        safeHook("MobileAdaptiveTrackSelectionEvaluateQueueSize") {
            MobileAdaptiveTrackSelectionEvaluateQueueSizeFingerprint.methodOrNull?.let { method ->
                method.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static {p0, p3}, $EXTENSION_CLASS_DESCRIPTOR->overrideEvaluateQueueSize(Ljava/lang/Object;Ljava/util/List;)I
                        move-result v0
                        if-ltz v0, :cond_native_queue_mob
                        return v0
                        :cond_native_queue_mob
                        nop
                    """
                )
            }
        }
    }
}
