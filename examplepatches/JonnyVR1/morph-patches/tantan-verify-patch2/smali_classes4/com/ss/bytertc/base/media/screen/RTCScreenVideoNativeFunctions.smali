.class public final Lcom/ss/bytertc/base/media/screen/RTCScreenVideoNativeFunctions;
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

.method public static native nativeOnCapturerError(JILjava/lang/String;)V
.end method

.method public static native nativeOnCapturerSetType(JI)V
.end method

.method public static native nativeOnCapturerStarted(J)V
.end method

.method public static native nativeOnCapturerStopped(J)V
.end method

.method public static native nativeOnFrameCaptured(JLcom/bytedance/realx/video/VideoFrame;)V
.end method
