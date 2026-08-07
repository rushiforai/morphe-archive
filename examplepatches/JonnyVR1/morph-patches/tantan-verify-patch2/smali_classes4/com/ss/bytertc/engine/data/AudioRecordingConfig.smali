.class public Lcom/ss/bytertc/engine/data/AudioRecordingConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public absoluteFileName:Ljava/lang/String;

.field public channel:Lcom/ss/bytertc/engine/data/AudioChannel;

.field public frameSource:Lcom/ss/bytertc/engine/data/AudioFrameSource;

.field public quality:Lcom/ss/bytertc/engine/data/AudioQuality;

.field public sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/AudioRecordingConfig;->absoluteFileName:Ljava/lang/String;

    .line 6
    .line 7
    sget-object v0, Lcom/ss/bytertc/engine/data/AudioSampleRate;->AUDIO_SAMPLE_RATE_AUTO:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/AudioRecordingConfig;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 10
    .line 11
    sget-object v0, Lcom/ss/bytertc/engine/data/AudioChannel;->AUDIO_CHANNEL_AUTO:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/AudioRecordingConfig;->channel:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 14
    .line 15
    sget-object v0, Lcom/ss/bytertc/engine/data/AudioFrameSource;->AUDIO_FRAME_SOURCE_MIXED:Lcom/ss/bytertc/engine/data/AudioFrameSource;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/AudioRecordingConfig;->frameSource:Lcom/ss/bytertc/engine/data/AudioFrameSource;

    .line 18
    .line 19
    sget-object v0, Lcom/ss/bytertc/engine/data/AudioQuality;->AUDIO_QUALITY_MEDIUM:Lcom/ss/bytertc/engine/data/AudioQuality;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/AudioRecordingConfig;->quality:Lcom/ss/bytertc/engine/data/AudioQuality;

    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/ss/bytertc/engine/data/AudioSampleRate;Lcom/ss/bytertc/engine/data/AudioChannel;Lcom/ss/bytertc/engine/data/AudioFrameSource;Lcom/ss/bytertc/engine/data/AudioQuality;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/ss/bytertc/engine/data/AudioRecordingConfig;->absoluteFileName:Ljava/lang/String;

    .line 26
    iput-object p2, p0, Lcom/ss/bytertc/engine/data/AudioRecordingConfig;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 27
    iput-object p3, p0, Lcom/ss/bytertc/engine/data/AudioRecordingConfig;->channel:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 28
    iput-object p4, p0, Lcom/ss/bytertc/engine/data/AudioRecordingConfig;->frameSource:Lcom/ss/bytertc/engine/data/AudioFrameSource;

    .line 29
    iput-object p5, p0, Lcom/ss/bytertc/engine/data/AudioRecordingConfig;->quality:Lcom/ss/bytertc/engine/data/AudioQuality;

    return-void
.end method
