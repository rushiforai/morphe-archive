.class public Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public audioBitrate:I

.field public audioChannels:I

.field public audioSampleRate:I

.field public businessType:I

.field public cdnType:I

.field public encodeHeight:I

.field public encodeWidth:I

.field public ipv6Url:Ljava/lang/String;

.field public sei:Ljava/lang/String;

.field public url:Ljava/lang/String;

.field public videoBitRate:I

.field public videoCodecType:I

.field public videoFPS:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xf

    .line 5
    .line 6
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoFPS:I

    .line 7
    .line 8
    const/16 v0, 0x210

    .line 9
    .line 10
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeWidth:I

    .line 11
    .line 12
    const/16 v0, 0x3c0

    .line 13
    .line 14
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeHeight:I

    .line 15
    .line 16
    const v0, 0xc3500

    .line 17
    .line 18
    .line 19
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoBitRate:I

    .line 20
    .line 21
    const v0, 0xfa00

    .line 22
    .line 23
    .line 24
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioBitrate:I

    .line 25
    .line 26
    const v0, 0xac44

    .line 27
    .line 28
    .line 29
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioSampleRate:I

    .line 30
    .line 31
    const/4 v0, 0x2

    .line 32
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioChannels:I

    .line 33
    .line 34
    const-string v0, ""

    .line 35
    .line 36
    iput-object v0, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->ipv6Url:Ljava/lang/String;

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    iput v1, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoCodecType:I

    .line 40
    .line 41
    iput-object v0, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->sei:Ljava/lang/String;

    .line 42
    .line 43
    iput v1, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->cdnType:I

    .line 44
    .line 45
    iput v1, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->businessType:I

    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "<encodeWidth:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeWidth:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ",encodeHeight:"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeHeight:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ",videoBitRate:"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoBitRate:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ",videofps:"

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoFPS:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ",audioSampleRate:"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioSampleRate:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, "audioChannels\uff0c"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioChannels:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ",url:"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->url:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ",ipv6url"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->ipv6Url:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, ",videoCode:"

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoCodecType:I

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v1, "sei:"

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget-object v1, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->sei:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const-string v1, "cdnType:"

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    iget v1, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->cdnType:I

    .line 113
    .line 114
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const-string v1, "businessType:"

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    iget p0, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->businessType:I

    .line 123
    .line 124
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const/16 p0, 0x3e

    .line 128
    .line 129
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    return-object p0
.end method
