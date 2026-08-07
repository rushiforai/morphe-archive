.class public Lcom/momo/xengine/media/types/VideoFormat;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private audioSampleChannels:I

.field private audioSampleRate:I

.field private audio_channel:Lcom/momo/xengine/media/types/AudioChannelLayout;

.field private audio_format:Lcom/momo/xengine/media/types/SampleFormat;

.field private bitrate:J

.field private color_trc:Lcom/momo/xengine/media/types/VideoTrc;

.field private colorspace:Lcom/momo/xengine/media/types/ColorSpace;

.field private duration:J

.field private filename:Ljava/lang/String;

.field private frameRate:I

.field private full_range:Z

.field private path:Ljava/lang/String;

.field private range:Lcom/momo/xengine/media/types/VideoRangeType;

.field private rotation:D

.field private videoHeight:I

.field private videoWidth:I

.field private video_format:Lcom/momo/xengine/media/types/PixelFormat;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/xengine/media/types/VideoFormat;->duration:J

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/momo/xengine/media/types/VideoFormat;->bitrate:J

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput v0, p0, Lcom/momo/xengine/media/types/VideoFormat;->frameRate:I

    .line 12
    .line 13
    const-wide/16 v1, 0x0

    .line 14
    .line 15
    iput-wide v1, p0, Lcom/momo/xengine/media/types/VideoFormat;->rotation:D

    .line 16
    .line 17
    sget-object v1, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_NONE:Lcom/momo/xengine/media/types/PixelFormat;

    .line 18
    .line 19
    iput-object v1, p0, Lcom/momo/xengine/media/types/VideoFormat;->video_format:Lcom/momo/xengine/media/types/PixelFormat;

    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/momo/xengine/media/types/VideoFormat;->full_range:Z

    .line 22
    .line 23
    sget-object v0, Lcom/momo/xengine/media/types/VideoRangeType;->VIDEO_RANGE_DEFAULT:Lcom/momo/xengine/media/types/VideoRangeType;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/momo/xengine/media/types/VideoFormat;->range:Lcom/momo/xengine/media/types/VideoRangeType;

    .line 26
    .line 27
    sget-object v0, Lcom/momo/xengine/media/types/ColorSpace;->VIDEO_CS_DEFAULT:Lcom/momo/xengine/media/types/ColorSpace;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/momo/xengine/media/types/VideoFormat;->colorspace:Lcom/momo/xengine/media/types/ColorSpace;

    .line 30
    .line 31
    sget-object v0, Lcom/momo/xengine/media/types/VideoTrc;->VIDEO_TRC_DEFAULT:Lcom/momo/xengine/media/types/VideoTrc;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/momo/xengine/media/types/VideoFormat;->color_trc:Lcom/momo/xengine/media/types/VideoTrc;

    .line 34
    .line 35
    sget-object v0, Lcom/momo/xengine/media/types/SampleFormat;->AUDIO_FORMAT_UNKNOWN:Lcom/momo/xengine/media/types/SampleFormat;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/momo/xengine/media/types/VideoFormat;->audio_format:Lcom/momo/xengine/media/types/SampleFormat;

    .line 38
    .line 39
    sget-object v0, Lcom/momo/xengine/media/types/AudioChannelLayout;->CHANNELS_UNKNOWN:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 40
    .line 41
    iput-object v0, p0, Lcom/momo/xengine/media/types/VideoFormat;->audio_channel:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public getAudioFormat()Lcom/momo/xengine/media/types/SampleFormat;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/types/VideoFormat;->audio_format:Lcom/momo/xengine/media/types/SampleFormat;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAudioSampleChannels()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/types/VideoFormat;->audioSampleChannels:I

    .line 2
    .line 3
    return p0
.end method

.method public getAudioSampleRate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/types/VideoFormat;->audioSampleRate:I

    .line 2
    .line 3
    return p0
.end method

.method public getAudio_channel()Lcom/momo/xengine/media/types/AudioChannelLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/types/VideoFormat;->audio_channel:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBitrate()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/types/VideoFormat;->bitrate:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getColor_trc()Lcom/momo/xengine/media/types/VideoTrc;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/types/VideoFormat;->color_trc:Lcom/momo/xengine/media/types/VideoTrc;

    .line 2
    .line 3
    return-object p0
.end method

.method public getColorspace()Lcom/momo/xengine/media/types/ColorSpace;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/types/VideoFormat;->colorspace:Lcom/momo/xengine/media/types/ColorSpace;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDuration()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/types/VideoFormat;->duration:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getFilename()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/types/VideoFormat;->filename:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFrameRate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/types/VideoFormat;->frameRate:I

    .line 2
    .line 3
    return p0
.end method

.method public getPath()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/types/VideoFormat;->path:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRange()Lcom/momo/xengine/media/types/VideoRangeType;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/types/VideoFormat;->range:Lcom/momo/xengine/media/types/VideoRangeType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRotation()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/types/VideoFormat;->rotation:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public getVideoFormat()Lcom/momo/xengine/media/types/PixelFormat;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/types/VideoFormat;->video_format:Lcom/momo/xengine/media/types/PixelFormat;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/types/VideoFormat;->videoHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getVideoWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/types/VideoFormat;->videoWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public isFull_range()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xengine/media/types/VideoFormat;->full_range:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAudioFormat(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/momo/xengine/media/types/SampleFormat;->getAudioFormat(I)Lcom/momo/xengine/media/types/SampleFormat;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/momo/xengine/media/types/VideoFormat;->audio_format:Lcom/momo/xengine/media/types/SampleFormat;

    .line 6
    .line 7
    return-void
.end method

.method public setAudioSampleChannels(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/types/VideoFormat;->audioSampleChannels:I

    .line 2
    .line 3
    return-void
.end method

.method public setAudioSampleRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/types/VideoFormat;->audioSampleRate:I

    .line 2
    .line 3
    return-void
.end method

.method public setAudio_channel(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/momo/xengine/media/types/AudioChannelLayout;->valueOf(I)Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/momo/xengine/media/types/VideoFormat;->audio_channel:Lcom/momo/xengine/media/types/AudioChannelLayout;

    .line 6
    .line 7
    return-void
.end method

.method public setBitrate(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xengine/media/types/VideoFormat;->bitrate:J

    .line 2
    .line 3
    return-void
.end method

.method public setColor_trc(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/momo/xengine/media/types/VideoTrc;->getVideoTrc(I)Lcom/momo/xengine/media/types/VideoTrc;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/momo/xengine/media/types/VideoFormat;->color_trc:Lcom/momo/xengine/media/types/VideoTrc;

    .line 6
    .line 7
    return-void
.end method

.method public setColorspace(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/momo/xengine/media/types/ColorSpace;->valueOf(I)Lcom/momo/xengine/media/types/ColorSpace;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/momo/xengine/media/types/VideoFormat;->colorspace:Lcom/momo/xengine/media/types/ColorSpace;

    .line 6
    .line 7
    return-void
.end method

.method public setDuration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xengine/media/types/VideoFormat;->duration:J

    .line 2
    .line 3
    return-void
.end method

.method public setFilename(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/types/VideoFormat;->filename:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setFrameRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/types/VideoFormat;->frameRate:I

    .line 2
    .line 3
    return-void
.end method

.method public setFull_range(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xengine/media/types/VideoFormat;->full_range:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPath(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/types/VideoFormat;->path:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setRange(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/momo/xengine/media/types/VideoRangeType;->getVideoRange(I)Lcom/momo/xengine/media/types/VideoRangeType;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/momo/xengine/media/types/VideoFormat;->range:Lcom/momo/xengine/media/types/VideoRangeType;

    .line 6
    .line 7
    return-void
.end method

.method public setRotation(D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/xengine/media/types/VideoFormat;->rotation:D

    .line 2
    .line 3
    return-void
.end method

.method public setVideoFormat(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/momo/xengine/media/types/PixelFormat;->valueOf(I)Lcom/momo/xengine/media/types/PixelFormat;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/momo/xengine/media/types/VideoFormat;->video_format:Lcom/momo/xengine/media/types/PixelFormat;

    .line 6
    .line 7
    return-void
.end method

.method public setVideoHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/types/VideoFormat;->videoHeight:I

    .line 2
    .line 3
    return-void
.end method

.method public setVideoWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xengine/media/types/VideoFormat;->videoWidth:I

    .line 2
    .line 3
    return-void
.end method
