.class public Lcom/ss/bytertc/engine/NativeAudioDeviceManagerFunctions;
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

.method public static native nativeStartAudioDeviceRecordTest(JI)I
.end method

.method public static native nativeStartAudioPlaybackDeviceTest(JLjava/lang/String;I)I
.end method

.method public static native nativeStopAudioDevicePlayTest(J)I
.end method

.method public static native nativeStopAudioDeviceRecordAndPlayTest(J)I
.end method

.method public static native nativeStopAudioPlaybackDeviceTest(J)I
.end method
