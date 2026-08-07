.class public Lcom/momo/xengine/media/types/AudioFrame;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private channelLayout:Lcom/momo/xengine/media/types/AudioChannelLayout;

.field private data:[B

.field private sampleFormat:Lcom/momo/xengine/media/types/SampleFormat;

.field private samples:J

.field private samplesRate:I

.field private timestamp:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/xengine/media/types/AudioFrame;->data:[B

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/momo/xengine/media/types/AudioFrame;->samples:J

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/momo/xengine/media/types/AudioFrame;->timestamp:J

    .line 12
    .line 13
    const v0, 0xac44

    .line 14
    .line 15
    .line 16
    iput v0, p0, Lcom/momo/xengine/media/types/AudioFrame;->samplesRate:I

    .line 17
    .line 18
    sget-object v0, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_FLOAT_PLANAR:Lcom/momo/xengine/media/types/SampleFormat;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/momo/xengine/media/types/AudioFrame;->sampleFormat:Lcom/momo/xengine/media/types/SampleFormat;

    .line 21
    .line 22
    sget-object v0, Lcom/momo/xengine/media/types/AudioChannelLayout;->CHANNELS_STEREO:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/momo/xengine/media/types/AudioFrame;->channelLayout:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public getChannelLayout()Lcom/momo/xengine/media/types/AudioChannelLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/types/AudioFrame;->channelLayout:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getData()[B
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/types/AudioFrame;->data:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getSampleFormat()Lcom/momo/xengine/media/types/SampleFormat;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/types/AudioFrame;->sampleFormat:Lcom/momo/xengine/media/types/SampleFormat;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSamples()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/types/AudioFrame;->samples:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getSamplesRate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/types/AudioFrame;->samplesRate:I

    .line 2
    .line 3
    return p0
.end method

.method public getTimestamp()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/types/AudioFrame;->timestamp:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public setChannelLayout(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/momo/xengine/media/types/AudioChannelLayout;->valueOf(I)Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/momo/xengine/media/types/AudioFrame;->channelLayout:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 6
    .line 7
    return-void
.end method

.method public setChannelLayout(Lcom/momo/xengine/media/types/AudioChannelLayout;)V
    .locals 0

    .line 8
    iput-object p1, p0, Lcom/momo/xengine/media/types/AudioFrame;->channelLayout:Lcom/momo/xengine/media/types/AudioChannelLayout;

    return-void
.end method

.method public setData([B)V
    .locals 0
    .param p1    # [B
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/types/AudioFrame;->data:[B

    .line 2
    .line 3
    return-void
.end method

.method public setSampleFormat(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/momo/xengine/media/types/SampleFormat;->getAudioFormat(I)Lcom/momo/xengine/media/types/SampleFormat;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/momo/xengine/media/types/AudioFrame;->sampleFormat:Lcom/momo/xengine/media/types/SampleFormat;

    .line 6
    .line 7
    return-void
.end method

.method public setSampleFormat(Lcom/momo/xengine/media/types/SampleFormat;)V
    .locals 0

    .line 8
    iput-object p1, p0, Lcom/momo/xengine/media/types/AudioFrame;->sampleFormat:Lcom/momo/xengine/media/types/SampleFormat;

    return-void
.end method

.method public setSamples(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xengine/media/types/AudioFrame;->samples:J

    .line 2
    .line 3
    return-void
.end method

.method public setSamplesRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/types/AudioFrame;->samplesRate:I

    .line 2
    .line 3
    return-void
.end method

.method public setTimestamp(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xengine/media/types/AudioFrame;->timestamp:J

    .line 2
    .line 3
    return-void
.end method
