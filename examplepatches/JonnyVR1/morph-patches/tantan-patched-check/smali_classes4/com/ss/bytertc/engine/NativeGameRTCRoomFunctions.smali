.class public Lcom/ss/bytertc/engine/NativeGameRTCRoomFunctions;
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

.method public static native nativeEnableAudioReceive(JLjava/lang/String;Z)I
.end method

.method public static native nativeEnableAudioSend(JZ)I
.end method

.method public static native nativeEnableMicrophone(JZ)I
.end method

.method public static native nativeEnableSpeakerphone(JZ)I
.end method

.method public static native nativeGetRangeAudio(J)J
.end method

.method public static native nativeJoinRoom(JLjava/lang/String;Lcom/ss/bytertc/engine/UserInfo;)I
.end method

.method public static native nativeLeaveRoom(J)I
.end method

.method public static native nativeReleaseRTCRoomEventHandler(J)V
.end method

.method public static native nativeSetRTCRoomEventHandler(JLcom/ss/bytertc/engine/handler/RTCRoomEventHandler;)J
.end method

.method public static native nativeSetRemoteRoomAudioPlaybackVolume(JI)I
.end method

.method public static native nativeUpdateToken(JLjava/lang/String;)I
.end method
