.class public Lcom/ss/bytertc/engine/handler/RTCAudioFrameObserver;
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

.method private static createAudioFrameImpl(Ljava/nio/ByteBuffer;IIILjava/nio/ByteBuffer;)Lcom/ss/bytertc/engine/utils/IAudioFrame;
    .locals 7
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 6
    .line 7
    .line 8
    if-eqz p4, :cond_0

    .line 9
    .line 10
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p4, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    :cond_0
    new-instance v1, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;

    .line 18
    .line 19
    invoke-static {p2}, Lcom/ss/bytertc/engine/data/AudioSampleRate;->fromId(I)Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-static {p3}, Lcom/ss/bytertc/engine/data/AudioChannel;->fromId(I)Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    move-object v2, p0

    .line 28
    move v3, p1

    .line 29
    move-object v6, p4

    .line 30
    invoke-direct/range {v1 .. v6}, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;-><init>(Ljava/nio/ByteBuffer;ILcom/ss/bytertc/engine/data/AudioSampleRate;Lcom/ss/bytertc/engine/data/AudioChannel;Ljava/nio/ByteBuffer;)V

    .line 31
    .line 32
    .line 33
    return-object v1
.end method

.method private static createRemoteStreamKey(Ljava/lang/String;Ljava/lang/String;I)Lcom/ss/bytertc/engine/data/RemoteStreamKey;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/data/RemoteStreamKey;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/ss/bytertc/engine/data/StreamIndex;->fromId(I)Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-direct {v0, p0, p1, p2}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/StreamIndex;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method
