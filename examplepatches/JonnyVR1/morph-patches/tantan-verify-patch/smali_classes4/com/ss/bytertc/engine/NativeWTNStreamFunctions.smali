.class public Lcom/ss/bytertc/engine/NativeWTNStreamFunctions;
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

.method public static native nativeSetWTNRemoteAudioPlaybackVolume(JLjava/lang/String;I)I
.end method

.method public static native nativeSetWTNRemoteVideoCanvas(JLjava/lang/String;Landroid/view/View;III)I
.end method

.method public static native nativeSetWTNRemoteVideoSink(JLjava/lang/String;Lcom/ss/bytertc/engine/video/IVideoSink;IIII)I
.end method

.method public static native nativeSetWTNStreamEventHandler(JLcom/ss/bytertc/engine/handler/NativeWTNStreamEventHandler;)I
.end method

.method public static native nativeSubscribeWTNAudioStream(JLjava/lang/String;Z)I
.end method

.method public static native nativeSubscribeWTNVideoStream(JLjava/lang/String;Z)I
.end method
