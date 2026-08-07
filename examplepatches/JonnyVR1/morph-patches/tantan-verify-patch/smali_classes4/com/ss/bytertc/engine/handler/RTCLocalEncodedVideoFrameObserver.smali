.class public Lcom/ss/bytertc/engine/handler/RTCLocalEncodedVideoFrameObserver;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "RTCLocalEncodedVideoFrameObserver"


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
    iput-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCLocalEncodedVideoFrameObserver;->mRtcVideoImpl:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onLocalEncodedVideoFrame(ILcom/ss/bytertc/engine/video/VideoStream;JJIII)V
    .locals 11
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCLocalEncodedVideoFrameObserver;->mRtcVideoImpl:Ljava/lang/ref/WeakReference;

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
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/engineimpl/RTCEngineImpl;->getEncodedVideoFrameObserver()Lcom/ss/bytertc/engine/mediaio/ILocalEncodedVideoFrameObserver;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-static {p1}, Lcom/ss/bytertc/engine/data/StreamIndex;->fromId(I)Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;

    .line 27
    .line 28
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/video/VideoStream;->getBuffer()Lcom/ss/bytertc/engine/video/VideoStream$Buffer;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-interface {v1}, Lcom/ss/bytertc/engine/video/VideoStream$Buffer;->getData()Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/video/VideoStream;->getWidth()I

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/video/VideoStream;->getHeight()I

    .line 41
    .line 42
    .line 43
    move-result v7

    .line 44
    invoke-static/range {p7 .. p7}, Lcom/ss/bytertc/engine/data/VideoCodecType;->fromId(I)Lcom/ss/bytertc/engine/data/VideoCodecType;

    .line 45
    .line 46
    .line 47
    move-result-object v8

    .line 48
    invoke-static/range {p8 .. p8}, Lcom/ss/bytertc/engine/data/VideoPictureType;->fromId(I)Lcom/ss/bytertc/engine/data/VideoPictureType;

    .line 49
    .line 50
    .line 51
    move-result-object v9

    .line 52
    invoke-static/range {p9 .. p9}, Lcom/ss/bytertc/engine/data/VideoRotation;->fromId(I)Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 53
    .line 54
    .line 55
    move-result-object v10

    .line 56
    move-wide v2, p3

    .line 57
    move-wide/from16 v4, p5

    .line 58
    .line 59
    invoke-direct/range {v0 .. v10}, Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;-><init>(Ljava/nio/ByteBuffer;JJIILcom/ss/bytertc/engine/data/VideoCodecType;Lcom/ss/bytertc/engine/data/VideoPictureType;Lcom/ss/bytertc/engine/data/VideoRotation;)V

    .line 60
    .line 61
    .line 62
    invoke-interface {p0, p1, v0}, Lcom/ss/bytertc/engine/mediaio/ILocalEncodedVideoFrameObserver;->onLocalEncodedVideoFrame(Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/mediaio/RTCEncodedVideoFrame;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/video/VideoStream;->release()V

    .line 66
    .line 67
    .line 68
    return-void
.end method
