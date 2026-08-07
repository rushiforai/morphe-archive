.class public interface abstract Lio/agora/rtc2/video/IVideoFrameObserver;
.super Ljava/lang/Object;


# static fields
.field public static final POSITION_POST_CAPTURER:I = 0x1

.field public static final POSITION_PRE_ENCODER:I = 0x4

.field public static final POSITION_PRE_RENDERER:I = 0x2

.field public static final PROCESS_MODE_READ_ONLY:I = 0x0

.field public static final PROCESS_MODE_READ_WRITE:I = 0x1

.field public static final VIDEO_PIXEL_BGRA:I = 0x2

.field public static final VIDEO_PIXEL_DEFAULT:I = 0x0

.field public static final VIDEO_PIXEL_I420:I = 0x1

.field public static final VIDEO_PIXEL_I422:I = 0x10

.field public static final VIDEO_PIXEL_NV12:I = 0x8

.field public static final VIDEO_PIXEL_NV21:I = 0x3

.field public static final VIDEO_PIXEL_RGBA:I = 0x4

.field public static final VIDEO_TEXTURE_2D:I = 0xa

.field public static final VIDEO_TEXTURE_OES:I = 0xb


# virtual methods
.method public abstract getMirrorApplied()Z
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract getObservedFramePosition()I
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract getRotationApplied()Z
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract getVideoFormatPreference()I
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract getVideoFrameProcessMode()I
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onCaptureVideoFrame(ILio/agora/base/VideoFrame;)Z
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onMediaPlayerVideoFrame(Lio/agora/base/VideoFrame;I)Z
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onPreEncodeVideoFrame(ILio/agora/base/VideoFrame;)Z
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onRenderVideoFrame(Ljava/lang/String;ILio/agora/base/VideoFrame;)Z
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method
