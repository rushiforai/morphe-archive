.class public Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/ijk/media/player/misc/ITrackInfo;


# instance fields
.field private mStreamMeta:Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;

.field private mTrackType:I


# direct methods
.method public constructor <init>(Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;->mTrackType:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;->mStreamMeta:Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public getFormat()Lcom/tantanapp/ijk/media/player/misc/IMediaFormat;
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;->mStreamMeta:Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;-><init>(Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public getInfoInline()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const/16 v1, 0x80

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;->mTrackType:I

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    const-string v3, ", "

    .line 12
    .line 13
    if-eq v1, v2, :cond_3

    .line 14
    .line 15
    const/4 v2, 0x2

    .line 16
    if-eq v1, v2, :cond_2

    .line 17
    .line 18
    const/4 v2, 0x3

    .line 19
    if-eq v1, v2, :cond_1

    .line 20
    .line 21
    const/4 p0, 0x4

    .line 22
    if-eq v1, p0, :cond_0

    .line 23
    .line 24
    const-string p0, "UNKNOWN"

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string p0, "SUBTITLE"

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const-string v1, "TIMEDTEXT, "

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;->mStreamMeta:Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;->mLanguage:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    const-string v1, "AUDIO, "

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;->mStreamMeta:Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;->getCodecShortNameInline()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;->mStreamMeta:Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;->getBitrateInline()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;->mStreamMeta:Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;->getSampleRateInline()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_3
    const-string v1, "VIDEO, "

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    iget-object v1, p0, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;->mStreamMeta:Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;

    .line 94
    .line 95
    invoke-virtual {v1}, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;->getCodecShortNameInline()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    iget-object v1, p0, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;->mStreamMeta:Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;->getBitrateInline()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;->mStreamMeta:Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;->getResolutionInline()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    return-object p0
.end method

.method public getLanguage()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;->mStreamMeta:Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;->mLanguage:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;->mStreamMeta:Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;->mLanguage:Ljava/lang/String;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    :goto_0
    const-string p0, "und"

    .line 20
    .line 21
    return-object p0
.end method

.method public getTrackType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;->mTrackType:I

    .line 2
    .line 3
    return p0
.end method

.method public setMediaMeta(Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;->mStreamMeta:Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;

    .line 2
    .line 3
    return-void
.end method

.method public setTrackType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;->mTrackType:I

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const/16 v1, 0x7b

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/tantanapp/ijk/media/player/misc/IjkTrackInfo;->getInfoInline()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p0, "}"

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method
