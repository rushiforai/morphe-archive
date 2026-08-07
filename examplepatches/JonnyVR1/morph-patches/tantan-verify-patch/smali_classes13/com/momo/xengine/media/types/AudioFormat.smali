.class public Lcom/momo/xengine/media/types/AudioFormat;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private channelLayout:Lcom/momo/xengine/media/types/AudioChannelLayout;

.field private sampleFormat:Lcom/momo/xengine/media/types/SampleFormat;

.field private sampleRate:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/momo/xengine/media/types/AudioChannelLayout;->CHANNELS_STEREO:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/xengine/media/types/AudioFormat;->channelLayout:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 7
    .line 8
    const v0, 0xac44

    .line 9
    .line 10
    .line 11
    iput v0, p0, Lcom/momo/xengine/media/types/AudioFormat;->sampleRate:I

    .line 12
    .line 13
    sget-object v0, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_16BIT:Lcom/momo/xengine/media/types/SampleFormat;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/momo/xengine/media/types/AudioFormat;->sampleFormat:Lcom/momo/xengine/media/types/SampleFormat;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public getChannelLayout()Lcom/momo/xengine/media/types/AudioChannelLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/types/AudioFormat;->channelLayout:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSampleFormat()Lcom/momo/xengine/media/types/SampleFormat;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/types/AudioFormat;->sampleFormat:Lcom/momo/xengine/media/types/SampleFormat;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSampleRate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/types/AudioFormat;->sampleRate:I

    .line 2
    .line 3
    return p0
.end method

.method public getSamplesSize(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/media/types/AudioFormat;->channelLayout:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/momo/xengine/media/types/AudioChannelLayout;->getChannelNum()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/2addr p1, v0

    .line 8
    iget-object p0, p0, Lcom/momo/xengine/media/types/AudioFormat;->sampleFormat:Lcom/momo/xengine/media/types/SampleFormat;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/momo/xengine/media/types/SampleFormat;->getSampleBit()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    mul-int/2addr p1, p0

    .line 15
    return p1
.end method

.method public setChannelLayout(Lcom/momo/xengine/media/types/AudioChannelLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/types/AudioFormat;->channelLayout:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 2
    .line 3
    return-void
.end method

.method public setSampleFormat(Lcom/momo/xengine/media/types/SampleFormat;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/types/AudioFormat;->sampleFormat:Lcom/momo/xengine/media/types/SampleFormat;

    .line 2
    .line 3
    return-void
.end method

.method public setSampleRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/types/AudioFormat;->sampleRate:I

    .line 2
    .line 3
    return-void
.end method
