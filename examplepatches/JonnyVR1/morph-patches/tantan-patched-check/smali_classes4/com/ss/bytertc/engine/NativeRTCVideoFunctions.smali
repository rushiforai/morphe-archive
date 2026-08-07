.class public Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static native nativeAppendVideoEffectNodes(J[Ljava/lang/String;)I
.end method

.method public static native nativeApplyStickerEffect(JLjava/lang/String;)I
.end method

.method public static native nativeClearVideoWatermark(JI)I
.end method

.method public static native nativeCreateGameRoom(JLjava/lang/String;Lcom/ss/bytertc/engine/GameRoomConfig;)J
.end method

.method public static native nativeCreateRTCVideo(Landroid/content/Context;Ljava/lang/String;ZLcom/ss/bytertc/engine/handler/RTCVideoEventHandler;Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;Ljava/lang/String;)J
.end method

.method public static native nativeCreateRTCVideoMulti(Landroid/content/Context;Ljava/lang/String;Lcom/ss/bytertc/engine/handler/RTCVideoEventHandler;Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;Ljava/lang/String;)J
.end method

.method public static native nativeCreateRoom(JLjava/lang/String;)J
.end method

.method public static native nativeCreateRoomEx(JLjava/lang/String;)J
.end method

.method public static native nativeCreateRtsRoom(JLjava/lang/String;)J
.end method

.method public static native nativeDestroyRTCVideo(J)V
.end method

.method public static native nativeDestroyRTCVideoMulti(J)V
.end method

.method public static native nativeDisableAlphaChannelVideoEncode(JI)I
.end method

.method public static native nativeDisableAudioFrameCallback(JI)I
.end method

.method public static native nativeDisableAudioProcessor(JI)I
.end method

.method public static native nativeDisableFaceDetection(J)I
.end method

.method public static native nativeDisableVideoEffect(J)I
.end method

.method public static native nativeDisableVirtualBackground(J)I
.end method

.method public static native nativeEenableRescaleAudioVolume(JZ)I
.end method

.method public static native nativeEnableAlphaChannelVideoEncode(JII)I
.end method

.method public static native nativeEnableAudioAEDReport(JI)I
.end method

.method public static native nativeEnableAudioDecoding(JZ)I
.end method

.method public static native nativeEnableAudioEncoding(JZ)I
.end method

.method public static native nativeEnableAudioFrameCallback(JIII)I
.end method

.method public static native nativeEnableAudioProcessor(JIIII)I
.end method

.method public static native nativeEnableAudioPropertiesReport(JIZZIFIZ)I
.end method

.method public static native nativeEnableAudioVADReport(JI)I
.end method

.method public static native nativeEnableAutoSubscribe(JII)I
.end method

.method public static native nativeEnableCameraAutoExposureFaceMode(JZ)I
.end method

.method public static native nativeEnableCameraTorch(JZ)I
.end method

.method public static native nativeEnableEffectBeauty(JZ)I
.end method

.method public static native nativeEnableExternalSoundCard(JZ)I
.end method

.method public static native nativeEnableFaceDetection(JLcom/ss/bytertc/engine/handler/RTCFaceDetectionObserver;ILjava/lang/String;)I
.end method

.method public static native nativeEnableLocalVoiceReverb(JZ)I
.end method

.method public static native nativeEnablePlaybackDucking(JZ)I
.end method

.method public static native nativeEnableSimulcastMode(JZ)I
.end method

.method public static native nativeEnableVideoEffect(JZ)I
.end method

.method public static native nativeEnableVideoEffect2(J)I
.end method

.method public static native nativeEnableVirtualBackground(JLjava/lang/String;IILjava/lang/String;)I
.end method

.method public static native nativeEnableVocalInstrumentBalance(JZ)I
.end method

.method public static native nativeGetAmazingEffectInterface(J)J
.end method

.method public static native nativeGetAudioDeviceManager(J)J
.end method

.method public static native nativeGetAudioEffectPlayer(J)J
.end method

.method public static native nativeGetAudioRoute(J)I
.end method

.method public static native nativeGetCameraZoomMaxRatio(J)F
.end method

.method public static native nativeGetDownlinkNetworkBandwidthEstimationStatus(J)I
.end method

.method public static native nativeGetKTVManager(J)J
.end method

.method public static native nativeGetMediaPlayer(JI)J
.end method

.method public static native nativeGetNetworkTimeInfo(J)Lcom/ss/bytertc/engine/NetworkTimeInfo;
.end method

.method public static native nativeGetPeerOnlineStatus(JLjava/lang/String;)I
.end method

.method public static native nativeGetSDKVersion()Ljava/lang/String;
.end method

.method public static native nativeGetSingScoringManager(J)J
.end method

.method public static native nativeGetUplinkNetworkBandwidthEstimationStatus(J)I
.end method

.method public static native nativeGetVideoDeviceManager(J)J
.end method

.method public static native nativeGetVideoEffectHandle(J)J
.end method

.method public static native nativeGetWTNStream(J)J
.end method

.method public static native nativeInitCVResource(JLjava/lang/String;Ljava/lang/String;)I
.end method

.method public static native nativeIsCameraExposurePositionSupported(J)Z
.end method

.method public static native nativeIsCameraFocusPositionSupported(J)Z
.end method

.method public static native nativeIsCameraZoomSupported(J)Z
.end method

.method public static native nativeIsStreamUnpublished(JI)Z
.end method

.method public static native nativeIsSupportFlashLight(J)Z
.end method

.method public static native nativeLogin(JLjava/lang/String;Ljava/lang/String;)I
.end method

.method public static native nativeLogout(J)I
.end method

.method public static native nativeMuteAudioCapture(JIZ)I
.end method

.method public static native nativePullExternalAudioFrame(J[BIII)I
.end method

.method public static native nativePushClientMixedStreamExternalVideoFrame(JLjava/lang/String;Lcom/ss/bytertc/engine/data/VideoFrameData;)I
.end method

.method public static native nativePushExternalAudioFrame(J[BIII[B)I
.end method

.method public static native nativePushExternalEncodedAudioFrame(JILjava/nio/ByteBuffer;IJIIILjava/nio/ByteBuffer;I)I
.end method

.method public static native nativePushExternalEncodedVideoFrame(JIILjava/nio/ByteBuffer;JJIIIII)I
.end method

.method public static native nativePushExternalVideoFrame(JLcom/ss/bytertc/engine/data/VideoFrameData;)I
.end method

.method public static native nativePushReferenceAudioPCMData(J[BIII)I
.end method

.method public static native nativePushScreenAudioFrame(J[BIII)I
.end method

.method public static native nativePushScreenFrame(JLcom/ss/bytertc/engine/data/VideoFrameData;)I
.end method

.method public static native nativeRegisterLocalEncodedVideoFrameObserver(JLcom/ss/bytertc/engine/handler/RTCLocalEncodedVideoFrameObserver;)I
.end method

.method public static native nativeRegisterLocalVideoProcessor(JLcom/ss/bytertc/engine/handler/RTCVideoProcessor;I)I
.end method

.method public static native nativeRegisterRemoteEncodedVideoFrameObserver(JLcom/ss/bytertc/engine/handler/RTCRemoteEncodedVideoFrameObserver;)I
.end method

.method public static native nativeRemoveVideoEffectNodes(J[Ljava/lang/String;)I
.end method

.method public static native nativeReportFeedback(JJLcom/ss/bytertc/engine/type/ProblemFeedbackInfo;)I
.end method

.method public static native nativeRequestRemoteVideoKeyFrame(JLjava/lang/String;Ljava/lang/String;I)I
.end method

.method public static native nativeResetScreenVideoConfigs(J)V
.end method

.method public static native nativeSendMultiSEIMessagePerVideoFrame(JI[BII)I
.end method

.method public static native nativeSendPublicStreamSEIMessage(JII[BII)I
.end method

.method public static native nativeSendServerBinaryMessage(J[B)J
.end method

.method public static native nativeSendServerMessage(JLjava/lang/String;)J
.end method

.method public static native nativeSendStreamSyncInfo(J[BIII)I
.end method

.method public static native nativeSendUserBinaryMessageOutsideRoom(JLjava/lang/String;[BI)J
.end method

.method public static native nativeSendUserMessageOutsideRoom(JLjava/lang/String;Ljava/lang/String;I)J
.end method

.method public static native nativeSetAnsMode(JI)I
.end method

.method public static native nativeSetAppState(JLjava/lang/String;)V
.end method

.method public static native nativeSetAudioAlignmentProperty(JLjava/lang/String;Ljava/lang/String;II)I
.end method

.method public static native nativeSetAudioFrameObserver(JLcom/ss/bytertc/engine/IAudioFrameObserver;)I
.end method

.method public static native nativeSetAudioFrameProcessor(JLcom/ss/bytertc/engine/IAudioFrameProcessor;)I
.end method

.method public static native nativeSetAudioProfile(JI)I
.end method

.method public static native nativeSetAudioRenderType(JI)I
.end method

.method public static native nativeSetAudioRoute(JI)I
.end method

.method public static native nativeSetAudioScenario(JI)I
.end method

.method public static native nativeSetAudioSourceType(JI)I
.end method

.method public static native nativeSetBeautyIntensity(JIF)I
.end method

.method public static native nativeSetBusinessId(JLjava/lang/String;)I
.end method

.method public static native nativeSetCameraAdaptiveMinimumFrameRate(JI)I
.end method

.method public static native nativeSetCameraExposureCompensation(JF)I
.end method

.method public static native nativeSetCameraExposurePosition(JFF)I
.end method

.method public static native nativeSetCameraFocusPosition(JFF)I
.end method

.method public static native nativeSetCameraZoomRatio(JF)I
.end method

.method public static native nativeSetCaptureVolume(JII)I
.end method

.method public static native nativeSetCellularEnhancement(JLcom/ss/bytertc/engine/InternalMediaTypeEnhancementConfig;)I
.end method

.method public static native nativeSetClientMixedStreamObserver(JLcom/ss/bytertc/engine/live/PushMixedStreamToCDNObserver;)I
.end method

.method public static native nativeSetCustomizeEncryptHandler(JLcom/ss/bytertc/engine/handler/RTCEncryptHandler;)I
.end method

.method public static native nativeSetDefaultAudioRoute(JI)I
.end method

.method public static native nativeSetDummyCaptureImagePath(JLjava/lang/String;)I
.end method

.method public static native nativeSetEarMonitorMode(JI)I
.end method

.method public static native nativeSetEarMonitorMode2(JII)I
.end method

.method public static native nativeSetEarMonitorVolume(JI)I
.end method

.method public static native nativeSetEncryptInfo(JILjava/lang/String;)I
.end method

.method public static native nativeSetExternalSurface(JLjava/lang/String;Ljava/lang/String;ILandroid/view/Surface;)V
.end method

.method public static native nativeSetExternalVideoEncoderEventHandler(JLcom/ss/bytertc/engine/handler/RTCExternalVideoEncoderEventHandler;)I
.end method

.method public static native nativeSetLocalProxy(JLjava/util/List;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration;",
            ">;)I"
        }
    .end annotation
.end method

.method public static native nativeSetLocalSimulcastMode(JI)I
.end method

.method public static native nativeSetLocalSimulcastModeV1(JILjava/util/List;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JI",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;",
            ">;)I"
        }
    .end annotation
.end method

.method public static native nativeSetLocalVideoCanvas(JILandroid/view/View;Landroid/view/Surface;II)I
.end method

.method public static native nativeSetLocalVideoMirrorType(JI)I
.end method

.method public static native nativeSetLocalVideoSink(JILcom/ss/bytertc/engine/video/IVideoSink;I)I
.end method

.method public static native nativeSetLocalVoiceEqualization(JII)I
.end method

.method public static native nativeSetLocalVoicePitch(JI)I
.end method

.method public static native nativeSetLocalVoiceReverbParam(JFFFFFF)I
.end method

.method public static native nativeSetLogConfig(ILjava/lang/String;ILjava/lang/String;)I
.end method

.method public static native nativeSetNetworkRequestIntercept(I)V
.end method

.method public static native nativeSetPlaybackVolume(JI)I
.end method

.method public static native nativeSetPublishChannel(JLjava/lang/String;)I
.end method

.method public static native nativeSetPublishFallbackOption(JI)I
.end method

.method public static native nativeSetPublishSpecialStream(JI)I
.end method

.method public static native nativeSetPublishSpecialStreamWithStreamIndex(JII)I
.end method

.method public static native nativeSetRemoteAudioPlaybackVolume(JLjava/lang/String;Ljava/lang/String;II)I
.end method

.method public static native nativeSetRemoteEncodedAudioFrameObserver(JLcom/ss/bytertc/engine/IRemoteEncodedAudioFrameObserver;)I
.end method

.method public static native nativeSetRemoteSubscribeFallbackOption(JI)I
.end method

.method public static native nativeSetRemoteUserPriority(JLjava/lang/String;Ljava/lang/String;I)I
.end method

.method public static native nativeSetRemoteVideoCanvas(JLjava/lang/String;Ljava/lang/String;ILandroid/view/View;Landroid/view/Surface;III)I
.end method

.method public static native nativeSetRemoteVideoMirrorType(JLjava/lang/String;Ljava/lang/String;II)I
.end method

.method public static native nativeSetRemoteVideoSink(JLjava/lang/String;Ljava/lang/String;ILcom/ss/bytertc/engine/video/IVideoSink;I)I
.end method

.method public static native nativeSetRemoteVideoSuperResolution(JLjava/lang/String;Ljava/lang/String;II)I
.end method

.method public static native nativeSetRuntimeParameters(JLjava/lang/String;)I
.end method

.method public static native nativeSetScreenAudioSourceType(JI)I
.end method

.method public static native nativeSetScreenAudioStreamIndex(JI)I
.end method

.method public static native nativeSetScreenVideoConfigs(J)V
.end method

.method public static native nativeSetScreenVideoEncoderConfig(JLcom/ss/bytertc/engine/InternalVideoEncoderConfig;)I
.end method

.method public static native nativeSetServerParams(JLjava/lang/String;Ljava/lang/String;)I
.end method

.method public static native nativeSetSubscribeBaselineData(JLjava/lang/String;ZLcom/ss/bytertc/engine/SubscribeVideoBaseline;)V
.end method

.method public static native nativeSetSubscribeChannels(J[Ljava/lang/String;Z)I
.end method

.method public static native nativeSetSubscribeSpecialStream(J[I)I
.end method

.method public static native nativeSetVideoCaptureConfig(JLcom/ss/bytertc/engine/InternalVideoCaptureConfig;)I
.end method

.method public static native nativeSetVideoCaptureRotation(JI)I
.end method

.method public static native nativeSetVideoDecoderConfig(JLjava/lang/String;Ljava/lang/String;II)I
.end method

.method public static native nativeSetVideoDenoiser(JI)I
.end method

.method public static native nativeSetVideoDigitalZoomConfig(JIF)I
.end method

.method public static native nativeSetVideoDigitalZoomControl(JI)I
.end method

.method public static native nativeSetVideoEffectAlgoModelResourceFinder(JJJ)I
.end method

.method public static native nativeSetVideoEffectColorFilter(JLjava/lang/String;)I
.end method

.method public static native nativeSetVideoEffectColorFilterIntensity(JF)I
.end method

.method public static native nativeSetVideoEffectExpressionDetect(JLcom/ss/bytertc/engine/InternalExpressDetectConfig;)I
.end method

.method public static native nativeSetVideoEffectNodes(J[Ljava/lang/String;)I
.end method

.method public static native nativeSetVideoEncoderConfigV1(JLcom/ss/bytertc/engine/InternalVideoEncoderConfig;Ljava/lang/String;)I
.end method

.method public static native nativeSetVideoEncoderConfigWithMain(JLjava/util/List;Ljava/util/List;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;",
            ">;",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;",
            ">;)I"
        }
    .end annotation
.end method

.method public static native nativeSetVideoOrientation(JI)I
.end method

.method public static native nativeSetVideoRotationMode(JI)I
.end method

.method public static native nativeSetVideoSourceTypeWithStreamId(JII)I
.end method

.method public static native nativeSetVideoWatermark(JILjava/lang/String;ZFFFFFFFF)I
.end method

.method public static native nativeSetVoiceChangerType(JI)I
.end method

.method public static native nativeSetVoiceReverbType(JI)I
.end method

.method public static native nativeSetupLocalScreenSink(JLcom/ss/bytertc/engine/video/IVideoSink;Ljava/lang/String;)I
.end method

.method public static native nativeSetupLocalVideoSink(JLcom/ss/bytertc/engine/video/IVideoSink;Ljava/lang/String;)I
.end method

.method public static native nativeStartAudioCapture(J)I
.end method

.method public static native nativeStartAudioRecording(JLjava/lang/String;IIII)I
.end method

.method public static native nativeStartChorusCacheSync(JLcom/ss/bytertc/engine/live/ChorusCacheSyncConfig;Lcom/ss/bytertc/engine/live/ChorusCacheSyncObserver;)I
.end method

.method public static native nativeStartClientMixedStream(JLjava/lang/String;Lcom/ss/bytertc/engine/live/MixedStreamConfig;Lcom/ss/bytertc/engine/live/ClientMixedStreamConfig;)I
.end method

.method public static native nativeStartCloudProxy(JLjava/util/List;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/InternalCloudProxyInfo;",
            ">;)I"
        }
    .end annotation
.end method

.method public static native nativeStartEchoTest(JLcom/ss/bytertc/engine/data/EchoTestConfig;I)I
.end method

.method public static native nativeStartFileRecording(JILjava/lang/String;II)I
.end method

.method public static native nativeStartHardwareEchoDetection(JLjava/lang/String;)I
.end method

.method public static native nativeStartNetworkProbe(JZIZI)I
.end method

.method public static native nativeStartPushMixedStream(JLjava/lang/String;Lcom/ss/bytertc/engine/live/MixedStreamPushTargetConfig;Lcom/ss/bytertc/engine/live/MixedStreamConfig;)I
.end method

.method public static native nativeStartPushSingleStream(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/util/List;I)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/InternalDestInfo;",
            ">;I)I"
        }
    .end annotation
.end method

.method public static native nativeStartScreenAudioCapture(J)I
.end method

.method public static native nativeStartScreenCapture(JILandroid/content/Intent;)I
.end method

.method public static native nativeStartVideoCapture(J)I
.end method

.method public static native nativeStartVideoDigitalZoomControl(JI)I
.end method

.method public static native nativeStopAudioCapture(J)I
.end method

.method public static native nativeStopAudioRecording(J)I
.end method

.method public static native nativeStopChorusCacheSync(J)I
.end method

.method public static native nativeStopClientMixedStream(JLjava/lang/String;)I
.end method

.method public static native nativeStopCloudProxy(J)I
.end method

.method public static native nativeStopEchoTest(J)I
.end method

.method public static native nativeStopFileRecording(JI)I
.end method

.method public static native nativeStopHardwareEchoDetection(J)I
.end method

.method public static native nativeStopNetworkProbe(J)I
.end method

.method public static native nativeStopPushMixedStream(JLjava/lang/String;I)I
.end method

.method public static native nativeStopPushSingleStream(JLjava/lang/String;)I
.end method

.method public static native nativeStopScreenAudioCapture(J)I
.end method

.method public static native nativeStopScreenCapture(J)I
.end method

.method public static native nativeStopScreenVideoCapture(J)I
.end method

.method public static native nativeStopVideoCapture(J)I
.end method

.method public static native nativeStopVideoDigitalZoomControl(J)I
.end method

.method public static native nativeSwitchCamera(JI)I
.end method

.method public static native nativeTakeLocalSnapshot(JILcom/ss/bytertc/engine/video/ISnapshotResultCallback;)J
.end method

.method public static native nativeTakeRemoteSnapshot(JLjava/lang/String;Ljava/lang/String;ILcom/ss/bytertc/engine/video/ISnapshotResultCallback;)J
.end method

.method public static native nativeTakeSnapshotToFile(JLjava/lang/String;Ljava/lang/String;ILjava/lang/String;)J
.end method

.method public static native nativeUpdateClientMixedStream(JLjava/lang/String;Lcom/ss/bytertc/engine/live/MixedStreamConfig;Lcom/ss/bytertc/engine/live/ClientMixedStreamConfig;)I
.end method

.method public static native nativeUpdateLocalVideoCanvas(JIII)I
.end method

.method public static native nativeUpdateLoginToken(JLjava/lang/String;)I
.end method

.method public static native nativeUpdatePushMixedStream(JLjava/lang/String;Lcom/ss/bytertc/engine/live/MixedStreamPushTargetConfig;Lcom/ss/bytertc/engine/live/MixedStreamConfig;)I
.end method

.method public static native nativeUpdateRemoteVideoCanvas(JLjava/lang/String;Ljava/lang/String;IIII)I
.end method

.method public static native nativeUpdateScreenCapture(JI)I
.end method

.method public static native nativeUpdateVideoEffectNode(JLjava/lang/String;Ljava/lang/String;F)I
.end method

.method public static native nativeWriteLog(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public static native nativesetLocalVideoSink(JILcom/ss/bytertc/engine/video/IVideoSink;II)I
.end method

.method public static native nativesetRemoteVideoSink(JLjava/lang/String;Ljava/lang/String;ILcom/ss/bytertc/engine/video/IVideoSink;IIII)I
.end method
