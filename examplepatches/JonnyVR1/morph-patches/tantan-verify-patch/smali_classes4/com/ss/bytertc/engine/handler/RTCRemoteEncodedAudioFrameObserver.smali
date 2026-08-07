.class public Lcom/ss/bytertc/engine/handler/RTCRemoteEncodedAudioFrameObserver;
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

.method private static createEncodedAudioFrameImpl(ILjava/nio/ByteBuffer;IJIIILjava/nio/ByteBuffer;)Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;
    .locals 10
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    move-object/from16 v9, p8

    .line 2
    .line 3
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    .line 10
    if-eqz v9, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v9, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 17
    .line 18
    .line 19
    :cond_0
    new-instance v0, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/ss/bytertc/engine/type/AudioCodecType;->fromId(I)Lcom/ss/bytertc/engine/type/AudioCodecType;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {p5}, Lcom/ss/bytertc/engine/data/AudioSampleRate;->fromId(I)Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 26
    .line 27
    .line 28
    move-result-object v6

    .line 29
    invoke-static/range {p6 .. p6}, Lcom/ss/bytertc/engine/data/AudioChannel;->fromId(I)Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    move-object v2, p1

    .line 34
    move v3, p2

    .line 35
    move-wide v4, p3

    .line 36
    move/from16 v8, p7

    .line 37
    .line 38
    invoke-direct/range {v0 .. v9}, Lcom/ss/bytertc/engine/utils/EncodedAudioFrameData;-><init>(Lcom/ss/bytertc/engine/type/AudioCodecType;Ljava/nio/ByteBuffer;IJLcom/ss/bytertc/engine/data/AudioSampleRate;Lcom/ss/bytertc/engine/data/AudioChannel;ILjava/nio/ByteBuffer;)V

    .line 39
    .line 40
    .line 41
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
