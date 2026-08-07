.class public Lcom/ss/bytertc/engine/NativeRTCRoomFunctions;
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

.method public static native nativeDestory(J)V
.end method

.method public static native nativeDestroyRTSRoom(J)V
.end method

.method public static native nativeEnableSubscribeLocalStream(JZ)I
.end method

.method public static native nativeGetCallId(J)Ljava/lang/String;
.end method

.method public static native nativeGetPanoramicVideo(J)J
.end method

.method public static native nativeGetRangeAudio(J)J
.end method

.method public static native nativeGetRoomId(J)Ljava/lang/String;
.end method

.method public static native nativeGetSpatialAudio(J)J
.end method

.method public static native nativeJoinRTSRoom(JLjava/lang/String;Lcom/ss/bytertc/engine/UserInfo;)I
.end method

.method public static native nativeJoinRoomWithRoomConfig(JLjava/lang/String;Lcom/ss/bytertc/engine/UserInfo;ZLcom/ss/bytertc/engine/RTCRoomConfig;)I
.end method

.method public static native nativeLeaveRTSRoom(J)I
.end method

.method public static native nativeLeaveRoom(J)I
.end method

.method public static native nativePauseAllSubscribedStreamAudio(J)I
.end method

.method public static native nativePauseAllSubscribedStreamVideo(J)I
.end method

.method public static native nativePauseForwardStreamToAllRooms(J)I
.end method

.method public static native nativePublishScreenAudio(JZ)I
.end method

.method public static native nativePublishScreenVideo(JZ)I
.end method

.method public static native nativePublishStreamAudio(JZ)I
.end method

.method public static native nativePublishStreamEx(JII)I
.end method

.method public static native nativePublishStreamVideo(JZ)I
.end method

.method public static native nativeReleaseRTCRoomEventHandler(J)V
.end method

.method public static native nativeReleaseRTCRoomEventHandlerEx(J)V
.end method

.method public static native nativeReleaseRTCRoomEventHandlerRts(J)V
.end method

.method public static native nativeResumeAllSubscribedStreamAudio(J)I
.end method

.method public static native nativeResumeAllSubscribedStreamVideo(J)I
.end method

.method public static native nativeResumeForwardStreamToAllRooms(J)I
.end method

.method public static native nativeSendRTSRoomBinaryMessage(J[B)J
.end method

.method public static native nativeSendRTSRoomMessage(JLjava/lang/String;)J
.end method

.method public static native nativeSendRTSUserBinaryMessage(JLjava/lang/String;[BI)J
.end method

.method public static native nativeSendRTSUserMessage(JLjava/lang/String;Ljava/lang/String;I)J
.end method

.method public static native nativeSendRoomBinaryMessage(J[B)J
.end method

.method public static native nativeSendRoomMessage(JLjava/lang/String;)J
.end method

.method public static native nativeSendUserBinaryMessage(JLjava/lang/String;[BI)J
.end method

.method public static native nativeSendUserMessage(JLjava/lang/String;Ljava/lang/String;I)J
.end method

.method public static native nativeSetAudioSelectionConfig(JI)I
.end method

.method public static native nativeSetMultiDeviceAVSync(JLjava/lang/String;)I
.end method

.method public static native nativeSetRTCRoomEventHandler(JLcom/ss/bytertc/engine/handler/RTCRoomEventHandler;)J
.end method

.method public static native nativeSetRTCRoomEventHandlerEx(JLcom/ss/bytertc/engine/handler/RTCRoomEventHandlerEx;)J
.end method

.method public static native nativeSetRTCRoomEventHandlerRts(JLcom/ss/bytertc/engine/handler/RTCRoomEventHandlerRts;)J
.end method

.method public static native nativeSetRemoteRoomAudioPlaybackVolume(JI)I
.end method

.method public static native nativeSetRemoteSimulcastStreamType(JLjava/lang/String;I)I
.end method

.method public static native nativeSetRemoteVideoConfigEx(JLjava/lang/String;IIII)I
.end method

.method public static native nativeSetRoomExtraInfo(JLjava/lang/String;Ljava/lang/String;)J
.end method

.method public static native nativeSetUserVisibility(JZ)I
.end method

.method public static native nativeStartForwardStreamToRooms(JLjava/util/List;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/InternalForwardStreamInfo;",
            ">;)I"
        }
    .end annotation
.end method

.method public static native nativeStartSubtitle(JILjava/lang/String;)I
.end method

.method public static native nativeStopForwardStreamToRooms(J)I
.end method

.method public static native nativeStopSubtitle(J)I
.end method

.method public static native nativeSubscribeAllStreamsAudio(JZ)I
.end method

.method public static native nativeSubscribeAllStreamsVideo(JZ)I
.end method

.method public static native nativeSubscribeScreenAudio(JLjava/lang/String;Z)I
.end method

.method public static native nativeSubscribeScreenVideo(JLjava/lang/String;Z)I
.end method

.method public static native nativeSubscribeStreamAudio(JLjava/lang/String;Z)I
.end method

.method public static native nativeSubscribeStreamEx(JLjava/lang/String;II)I
.end method

.method public static native nativeSubscribeStreamVideo(JLjava/lang/String;Z)I
.end method

.method public static native nativeUnpublishStreamEx(JII)I
.end method

.method public static native nativeUnsubscribeStreamEx(JLjava/lang/String;II)I
.end method

.method public static native nativeUpdateForwardStreamToRooms(JLjava/util/List;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/InternalForwardStreamInfo;",
            ">;)I"
        }
    .end annotation
.end method

.method public static native nativeUpdateRTSToken(JLjava/lang/String;)I
.end method

.method public static native nativeUpdateToken(JLjava/lang/String;)I
.end method
