.class Lcom/momo/xengine/media/PCMDecoderImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xengine/media/IPCMDecoder;


# instance fields
.field private pointer:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/xengine/media/PCMDecoderImpl;->pointer:J

    .line 7
    .line 8
    return-void
.end method

.method private native nativeAddSupportChannels(JI)V
.end method

.method private native nativeAddSupportFormat(JI)V
.end method

.method private native nativeDecodeAudioFile(JLjava/lang/String;Lcom/momo/xengine/media/types/AudioFrame;)Z
.end method

.method private native nativeInit()J
.end method


# virtual methods
.method public DecodeAudioFile(Ljava/lang/String;)Lcom/momo/xengine/media/types/AudioFrame;
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/PCMDecoderImpl;->pointer:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    new-instance v0, Lcom/momo/xengine/media/types/AudioFrame;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/momo/xengine/media/types/AudioFrame;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-wide v2, p0, Lcom/momo/xengine/media/PCMDecoderImpl;->pointer:J

    .line 17
    .line 18
    invoke-direct {p0, v2, v3, p1, v0}, Lcom/momo/xengine/media/PCMDecoderImpl;->nativeDecodeAudioFile(JLjava/lang/String;Lcom/momo/xengine/media/types/AudioFrame;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_1
    return-object v1
.end method

.method public addSupportChannels(Lcom/momo/xengine/media/types/AudioChannelLayout;)V
    .locals 4
    .param p1    # Lcom/momo/xengine/media/types/AudioChannelLayout;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/PCMDecoderImpl;->pointer:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/AudioChannelLayout;->getValue()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-direct {p0, v0, v1, p1}, Lcom/momo/xengine/media/PCMDecoderImpl;->nativeAddSupportChannels(JI)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public addSupportFormat(Lcom/momo/xengine/media/types/SampleFormat;)V
    .locals 4
    .param p1    # Lcom/momo/xengine/media/types/SampleFormat;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/PCMDecoderImpl;->pointer:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/momo/xengine/media/types/SampleFormat;->getValue()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-direct {p0, v0, v1, p1}, Lcom/momo/xengine/media/PCMDecoderImpl;->nativeAddSupportFormat(JI)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public init()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/xengine/media/PCMDecoderImpl;->nativeInit()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/momo/xengine/media/PCMDecoderImpl;->pointer:J

    .line 6
    .line 7
    return-void
.end method
