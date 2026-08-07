.class public Lcom/momo/momortc/live/MMLiveTranscoding;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoImage;,
        Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;,
        Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveAudioSampleRateType;,
        Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;
    }
.end annotation


# instance fields
.field private final TRANSINFO_LEN:I

.field public audioBitrate:I

.field public audioChannels:I

.field public audioSampleRate:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveAudioSampleRateType;

.field public backgroundImage:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoImage;

.field public channelid:Ljava/lang/String;

.field public height:D

.field public lowLatency:Z

.field public transcodingExtraInfo:Ljava/lang/String;

.field public transcodingUserMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;",
            ">;"
        }
    .end annotation
.end field

.field public uid:Ljava/lang/String;

.field public url:Ljava/lang/String;

.field public videoBitrate:I

.field public videoCodecProfile:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;

.field public videoFramerate:I

.field public videoGop:I

.field public watermark:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoImage;

.field public width:D


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x800

    .line 5
    .line 6
    iput v0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->TRANSINFO_LEN:I

    .line 7
    .line 8
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->transcodingUserMap:Ljava/util/Map;

    .line 14
    .line 15
    const-wide v0, 0x4080e00000000000L    # 540.0

    .line 16
    .line 17
    .line 18
    .line 19
    .line 20
    iput-wide v0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->width:D

    .line 21
    .line 22
    const-wide/high16 v0, 0x408e000000000000L    # 960.0

    .line 23
    .line 24
    iput-wide v0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->height:D

    .line 25
    .line 26
    const v0, 0xfa000

    .line 27
    .line 28
    .line 29
    iput v0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->videoBitrate:I

    .line 30
    .line 31
    const/16 v0, 0x1e

    .line 32
    .line 33
    iput v0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->videoFramerate:I

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    iput-boolean v0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->lowLatency:Z

    .line 37
    .line 38
    iput v0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->videoGop:I

    .line 39
    .line 40
    sget-object v1, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;->MMLiveVideoCodecProfileTypeHigh:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;

    .line 41
    .line 42
    iput-object v1, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->videoCodecProfile:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;

    .line 43
    .line 44
    const/high16 v1, 0x10000

    .line 45
    .line 46
    iput v1, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->audioBitrate:I

    .line 47
    .line 48
    iput v0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->audioChannels:I

    .line 49
    .line 50
    sget-object v0, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveAudioSampleRateType;->MMLiveAudioSampleRateType48000:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveAudioSampleRateType;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->audioSampleRate:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveAudioSampleRateType;

    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    iput-object v0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->watermark:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoImage;

    .line 56
    .line 57
    iput-object v0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->backgroundImage:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoImage;

    .line 58
    .line 59
    const-string v0, ""

    .line 60
    .line 61
    iput-object v0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->transcodingExtraInfo:Ljava/lang/String;

    .line 62
    .line 63
    return-void
.end method


# virtual methods
.method public getAudioBitrate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->audioBitrate:I

    .line 2
    .line 3
    return p0
.end method

.method public getAudioChannels()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->audioChannels:I

    .line 2
    .line 3
    return p0
.end method

.method public getAudioSampleRate()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->audioSampleRate:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveAudioSampleRateType;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveAudioSampleRateType;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getBackgroundImage()Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoImage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->backgroundImage:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoImage;

    .line 2
    .line 3
    return-object p0
.end method

.method public getChannelid()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->channelid:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHeight()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->height:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public getTranscodingExtraInfo()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->transcodingExtraInfo:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTranscodingUserMap()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->transcodingUserMap:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUid()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->uid:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->url:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoBitrate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->videoBitrate:I

    .line 2
    .line 3
    return p0
.end method

.method public getVideoCodecProfile()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->videoCodecProfile:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;->getValue()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getVideoFramerate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->videoFramerate:I

    .line 2
    .line 3
    return p0
.end method

.method public getVideoGop()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->videoGop:I

    .line 2
    .line 3
    return p0
.end method

.method public getWatermark()Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoImage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->watermark:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoImage;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWidth()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->width:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public isLowLatency()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->lowLatency:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAudioBitrate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->audioBitrate:I

    .line 2
    .line 3
    return-void
.end method

.method public setAudioChannels(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->audioChannels:I

    .line 2
    .line 3
    return-void
.end method

.method public setAudioSampleRate(Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveAudioSampleRateType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->audioSampleRate:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveAudioSampleRateType;

    .line 2
    .line 3
    return-void
.end method

.method public setBackgroundImage(Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->backgroundImage:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoImage;

    .line 2
    .line 3
    return-void
.end method

.method public setChannelid(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->channelid:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setHeight(D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->height:D

    .line 2
    .line 3
    return-void
.end method

.method public setLowLatency(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->lowLatency:Z

    .line 2
    .line 3
    return-void
.end method

.method public setTranscodingExtraInfo(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->transcodingExtraInfo:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTranscodingUserMap(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->transcodingUserMap:Ljava/util/Map;

    .line 2
    .line 3
    return-void
.end method

.method public setUid(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->uid:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->url:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setVideoBitrate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->videoBitrate:I

    .line 2
    .line 3
    return-void
.end method

.method public setVideoCodecProfile(Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->videoCodecProfile:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoCodecProfileType;

    .line 2
    .line 3
    return-void
.end method

.method public setVideoFramerate(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->videoFramerate:I

    .line 2
    .line 3
    return-void
.end method

.method public setVideoGop(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->videoGop:I

    .line 2
    .line 3
    return-void
.end method

.method public setWatermark(Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->watermark:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveVideoImage;

    .line 2
    .line 3
    return-void
.end method

.method public setWidth(D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/momortc/live/MMLiveTranscoding;->width:D

    .line 2
    .line 3
    return-void
.end method
