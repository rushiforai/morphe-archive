.class public Lcom/ss/bytertc/engine/handler/RTCRemoteEncodedVideoFrameObserver;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "RTCRemoteEncodedVideoFrameObserver"


# instance fields
.field private mRtcVideoImpl:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRemoteEncodedVideoFrameObserver;->mRtcVideoImpl:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onRemoteEncodedVideoFrame(Ljava/lang/String;Ljava/lang/String;ILcom/ss/bytertc/engine/video/VideoStream;JJIII)V
    .locals 13
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p4, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRemoteEncodedVideoFrameObserver;->mRtcVideoImpl:Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->getRemoteEncodedVideoFrameObserver()Lcom/ss/bytertc/engine/mediaio/IRemoteEncodedVideoFrameObserver;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    new-instance v0, Lcom/ss/bytertc/engine/data/RemoteStreamKey;

    .line 23
    .line 24
    invoke-static/range {p3 .. p3}, Lcom/ss/bytertc/engine/data/StreamIndex;->fromId(I)Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-direct {v0, p1, p2, v1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/StreamIndex;)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;

    .line 32
    .line 33
    invoke-virtual/range {p4 .. p4}, Lcom/ss/bytertc/engine/video/VideoStream;->getBuffer()Lcom/ss/bytertc/engine/video/VideoStream$Buffer;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-interface {p1}, Lcom/ss/bytertc/engine/video/VideoStream$Buffer;->getData()Ljava/nio/ByteBuffer;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-virtual/range {p4 .. p4}, Lcom/ss/bytertc/engine/video/VideoStream;->getWidth()I

    .line 42
    .line 43
    .line 44
    move-result v8

    .line 45
    invoke-virtual/range {p4 .. p4}, Lcom/ss/bytertc/engine/video/VideoStream;->getHeight()I

    .line 46
    .line 47
    .line 48
    move-result v9

    .line 49
    invoke-static/range {p9 .. p9}, Lcom/ss/bytertc/engine/data/VideoCodecType;->fromId(I)Lcom/ss/bytertc/engine/data/VideoCodecType;

    .line 50
    .line 51
    .line 52
    move-result-object v10

    .line 53
    invoke-static/range {p10 .. p10}, Lcom/ss/bytertc/engine/data/VideoPictureType;->fromId(I)Lcom/ss/bytertc/engine/data/VideoPictureType;

    .line 54
    .line 55
    .line 56
    move-result-object v11

    .line 57
    invoke-static/range {p11 .. p11}, Lcom/ss/bytertc/engine/data/VideoRotation;->fromId(I)Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 58
    .line 59
    .line 60
    move-result-object v12

    .line 61
    move-wide/from16 v4, p5

    .line 62
    .line 63
    move-wide/from16 v6, p7

    .line 64
    .line 65
    invoke-direct/range {v2 .. v12}, Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;-><init>(Ljava/nio/ByteBuffer;JJIILcom/ss/bytertc/engine/data/VideoCodecType;Lcom/ss/bytertc/engine/data/VideoPictureType;Lcom/ss/bytertc/engine/data/VideoRotation;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, v0, v2}, Lcom/ss/bytertc/engine/mediaio/IRemoteEncodedVideoFrameObserver;->onRemoteEncodedVideoFrame(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    invoke-virtual/range {p4 .. p4}, Lcom/ss/bytertc/engine/video/VideoStream;->release()V

    .line 72
    .line 73
    .line 74
    return-void
.end method
