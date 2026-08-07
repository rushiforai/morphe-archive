.class public Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public audioCodec:Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;

.field public audioProfile:Lcom/ss/bytertc/engine/live/MixedStreamAudioProfile;

.field public bitrate:I

.field public channels:I

.field public sampleRate:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;->MIXED_STREAM_AUDIO_CODEC_TYPE_AAC:Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->audioCodec:Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;

    .line 7
    .line 8
    const/16 v0, 0x40

    .line 9
    .line 10
    iput v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->bitrate:I

    .line 11
    .line 12
    const v0, 0xbb80

    .line 13
    .line 14
    .line 15
    iput v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->sampleRate:I

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    iput v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->channels:I

    .line 19
    .line 20
    sget-object v0, Lcom/ss/bytertc/engine/live/MixedStreamAudioProfile;->MIXED_STREAM_AUDIO_PROFILE_LC:Lcom/ss/bytertc/engine/live/MixedStreamAudioProfile;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->audioProfile:Lcom/ss/bytertc/engine/live/MixedStreamAudioProfile;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "MixedStreamAudioConfig{audioProfile=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->audioProfile:Lcom/ss/bytertc/engine/live/MixedStreamAudioProfile;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', channels="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->channels:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", sampleRate="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->sampleRate:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ", bitrate="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->bitrate:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", audioCodec="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/MixedStreamAudioConfig;->audioCodec:Lcom/ss/bytertc/engine/live/MixedStreamAudioCodecType;

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const/16 p0, 0x7d

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
