.class public Lcom/ss/bytertc/engine/handler/NativeAudioFrameProcessor;
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

.method private static createAudioFrameImpl(Ljava/nio/ByteBuffer;III)Lcom/ss/bytertc/engine/utils/IAudioFrame;
    .locals 1
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
    new-instance v0, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;

    .line 9
    .line 10
    invoke-static {p2}, Lcom/ss/bytertc/engine/data/AudioSampleRate;->fromId(I)Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-static {p3}, Lcom/ss/bytertc/engine/data/AudioChannel;->fromId(I)Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/ss/bytertc/engine/utils/AudioFrameImpl;-><init>(Ljava/nio/ByteBuffer;ILcom/ss/bytertc/engine/data/AudioSampleRate;Lcom/ss/bytertc/engine/data/AudioChannel;)V

    .line 19
    .line 20
    .line 21
    return-object v0
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
