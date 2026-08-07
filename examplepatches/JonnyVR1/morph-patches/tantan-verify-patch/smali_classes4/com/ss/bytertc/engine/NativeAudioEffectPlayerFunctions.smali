.class public Lcom/ss/bytertc/engine/NativeAudioEffectPlayerFunctions;
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

.method public static native nativeGetDuration(JI)I
.end method

.method public static native nativeGetPosition(JI)I
.end method

.method public static native nativeGetVolume(JI)I
.end method

.method public static native nativePause(JI)I
.end method

.method public static native nativePauseAll(J)I
.end method

.method public static native nativePreload(JILjava/lang/String;)I
.end method

.method public static native nativeResume(JI)I
.end method

.method public static native nativeResumeAll(J)I
.end method

.method public static native nativeSetEventHandler(JJLcom/ss/bytertc/engine/handler/RTCAudioEffectPlayerEventHandler;)I
.end method

.method public static native nativeSetPosition(JII)I
.end method

.method public static native nativeSetVolume(JII)I
.end method

.method public static native nativeSetVolumeAll(JI)I
.end method

.method public static native nativeStart(JILjava/lang/String;IIII)I
.end method

.method public static native nativeStop(JI)I
.end method

.method public static native nativeStopAll(J)I
.end method

.method public static native nativeUnload(JI)I
.end method

.method public static native nativeUnloadAll(J)I
.end method
