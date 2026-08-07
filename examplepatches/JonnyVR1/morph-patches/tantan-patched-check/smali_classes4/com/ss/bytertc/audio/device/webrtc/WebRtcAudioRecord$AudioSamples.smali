.class public Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioSamples;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AudioSamples"
.end annotation


# instance fields
.field private final audioFormat:I

.field private final channelCount:I

.field private final data:[B

.field private final sampleRate:I


# direct methods
.method private constructor <init>(Landroid/media/AudioRecord;[B)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/media/AudioRecord;->getAudioFormat()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioSamples;->audioFormat:I

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/media/AudioRecord;->getChannelCount()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioSamples;->channelCount:I

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/media/AudioRecord;->getSampleRate()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iput p1, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioSamples;->sampleRate:I

    .line 21
    .line 22
    iput-object p2, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioSamples;->data:[B

    .line 23
    .line 24
    return-void
.end method

.method public synthetic constructor <init>(Landroid/media/AudioRecord;[BLcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$1;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1, p2}, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioSamples;-><init>(Landroid/media/AudioRecord;[B)V

    return-void
.end method


# virtual methods
.method public getAudioFormat()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioSamples;->audioFormat:I

    .line 2
    .line 3
    return p0
.end method

.method public getChannelCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioSamples;->channelCount:I

    .line 2
    .line 3
    return p0
.end method

.method public getData()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioSamples;->data:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getSampleRate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/audio/device/webrtc/WebRtcAudioRecord$AudioSamples;->sampleRate:I

    .line 2
    .line 3
    return p0
.end method
