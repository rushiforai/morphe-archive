.class public Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;
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

.method public static native nativeGetAudioTrackCount(J)I
.end method

.method public static native nativeGetPlaybackDuration(J)I
.end method

.method public static native nativeGetPosition(J)I
.end method

.method public static native nativeGetState(J)I
.end method

.method public static native nativeGetTotalDuration(J)I
.end method

.method public static native nativeGetVolume(JI)I
.end method

.method public static native nativeOpen(JLjava/lang/String;IIIZJZ)I
.end method

.method public static native nativeOpenWithCustomSource(JIILcom/ss/bytertc/engine/handler/RTCMediaPlayerCustomSourceProvider;IIIZJZ)I
.end method

.method public static native nativePause(J)I
.end method

.method public static native nativePushExternalAudioFrame(J[BIII)I
.end method

.method public static native nativeRegisterAudioFrameObserver(JLcom/ss/bytertc/engine/handler/RTCMediaPlayerAudioFrameObserver;)I
.end method

.method public static native nativeResume(J)I
.end method

.method public static native nativeSelectAudioTrack(JI)I
.end method

.method public static native nativeSetAudioDualMonoMode(JI)I
.end method

.method public static native nativeSetAudioPitch(JI)I
.end method

.method public static native nativeSetEventHandler(JLcom/ss/bytertc/engine/handler/RTCMediaPlayerEventHandler;)I
.end method

.method public static native nativeSetLoudness(JF)I
.end method

.method public static native nativeSetPlaybackSpeed(JI)I
.end method

.method public static native nativeSetPosition(JI)I
.end method

.method public static native nativeSetProgressInterval(JJ)I
.end method

.method public static native nativeSetVolume(JII)I
.end method

.method public static native nativeStart(J)I
.end method

.method public static native nativeStop(J)I
.end method
