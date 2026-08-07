.class public Lcom/ss/bytertc/engine/NativeRTCVideoFunctionsEx;
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

.method public static native nativeCreateRTCVideoEx(Landroid/content/Context;Ljava/lang/String;Lcom/ss/bytertc/engine/handler/RTCVideoEventHandler;Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;Ljava/lang/String;)J
.end method

.method public static native nativeCreateRTCVideoExMulti(Landroid/content/Context;Ljava/lang/String;Lcom/ss/bytertc/engine/handler/RTCVideoEventHandler;Ljava/lang/String;Lcom/bytedance/realx/video/EglBase$Context;Ljava/lang/String;)J
.end method

.method public static native nativeDestroyRTCVideoEx(J)V
.end method

.method public static native nativeDestroyRTCVideoExMulti(J)V
.end method

.method public static native nativePushExternalVideoFrame(JILcom/ss/bytertc/engine/data/VideoFrameData;)I
.end method

.method public static native nativeSetAudioContentType(JIZZZ)I
.end method

.method public static native nativeSetAudioEncodeConfig(JIIIIIIIII)I
.end method

.method public static native nativeSetAudioSourceVolume(JII)I
.end method

.method public static native nativeSetCaptureVolume(JI)I
.end method

.method public static native nativeSetLocalStreamPriority(JII)I
.end method

.method public static native nativeSetScreenCaptureVolume(JI)I
.end method

.method public static native nativeSetVideoCaptureConfig(JILcom/ss/bytertc/engine/InternalVideoCaptureConfig;)I
.end method

.method public static native nativeSetVideoEncoderConfig(JILjava/util/List;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JI",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/InternalVideoEncoderConfig;",
            ">;)I"
        }
    .end annotation
.end method

.method public static native nativeSetVideoSource(JIII)I
.end method

.method public static native nativeStartVideoCapture(JILjava/lang/String;)I
.end method

.method public static native nativeStopVideoCapture(JI)I
.end method
