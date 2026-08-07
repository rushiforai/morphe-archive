.class public Lcom/ss/bytertc/engine/NativeKTVPlayerFunctions;
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

.method public static native nativePauseMusic(JLjava/lang/String;)V
.end method

.method public static native nativePlayMusic(JLjava/lang/String;II)V
.end method

.method public static native nativeReleaseKTVPlayerEventHandler(J)V
.end method

.method public static native nativeResumeMusic(JLjava/lang/String;)V
.end method

.method public static native nativeSeekMusic(JLjava/lang/String;I)V
.end method

.method public static native nativeSetMusicPitch(JLjava/lang/String;I)V
.end method

.method public static native nativeSetMusicVolume(JLjava/lang/String;I)V
.end method

.method public static native nativeSetPlayerEventHandler(JLcom/ss/bytertc/ktv/IKTVPlayerEventHandler;)J
.end method

.method public static native nativeStopMusic(JLjava/lang/String;)V
.end method

.method public static native nativeSwitchAudioTrackType(JLjava/lang/String;)V
.end method
