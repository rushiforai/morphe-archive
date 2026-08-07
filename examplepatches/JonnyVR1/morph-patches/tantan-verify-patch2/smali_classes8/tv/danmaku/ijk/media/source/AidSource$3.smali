.class Ltv/danmaku/ijk/media/source/AidSource$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/source/AidSource;-><init>(Landroid/app/Activity;Ltv/danmaku/ijk/media/streamer/StreamProducer;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;Ljava/lang/String;Ltv/danmaku/ijk/media/streamer/MomoSurface;JLtv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;IILtv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ltv/danmaku/ijk/media/source/AidSource;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/source/AidSource;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$3;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPrepared(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource$3;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 2
    .line 3
    invoke-interface {p1}, Ltv/danmaku/ijk/media/player/IMediaPlayer;->getVideoWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/source/AidSource;->l2(Ltv/danmaku/ijk/media/source/AidSource;I)I

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource$3;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 11
    .line 12
    invoke-interface {p1}, Ltv/danmaku/ijk/media/player/IMediaPlayer;->getVideoHeight()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/source/AidSource;->n2(Ltv/danmaku/ijk/media/source/AidSource;I)I

    .line 17
    .line 18
    .line 19
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v1, "----AidSource: <onPrepared> cost time:"

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 27
    .line 28
    .line 29
    move-result-wide v1

    .line 30
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/AidSource$3;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 31
    .line 32
    invoke-static {v3}, Ltv/danmaku/ijk/media/source/AidSource;->V1(Ltv/danmaku/ijk/media/source/AidSource;)J

    .line 33
    .line 34
    .line 35
    move-result-wide v3

    .line 36
    sub-long/2addr v1, v3

    .line 37
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v1, "ms,mAidMode="

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/AidSource$3;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 46
    .line 47
    invoke-static {v1}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, ",width="

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/AidSource$3;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 60
    .line 61
    invoke-static {v1}, Ltv/danmaku/ijk/media/source/AidSource;->k2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v1, ", height="

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/AidSource$3;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 74
    .line 75
    invoke-static {v1}, Ltv/danmaku/ijk/media/source/AidSource;->m2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const-string v1, "aidStream"

    .line 87
    .line 88
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource$3;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 92
    .line 93
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/AidSource;->W1(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    if-eqz v0, :cond_0

    .line 98
    .line 99
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource$3;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 100
    .line 101
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/AidSource;->m2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-lez v0, :cond_0

    .line 106
    .line 107
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource$3;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 108
    .line 109
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/AidSource;->k2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-lez v0, :cond_0

    .line 114
    .line 115
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource$3;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 116
    .line 117
    invoke-static {p0, p1}, Ltv/danmaku/ijk/media/source/AidSource;->X1(Ltv/danmaku/ijk/media/source/AidSource;Ltv/danmaku/ijk/media/player/IMediaPlayer;)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    const-string v0, "----AidSource: <onPrepared> get size["

    .line 124
    .line 125
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource$3;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 129
    .line 130
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/AidSource;->k2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string v0, ","

    .line 138
    .line 139
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource$3;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 143
    .line 144
    invoke-static {p0}, Ltv/danmaku/ijk/media/source/AidSource;->m2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 145
    .line 146
    .line 147
    move-result p0

    .line 148
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    const-string p0, "] params failed!!!"

    .line 152
    .line 153
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    .line 162
    .line 163
    return-void
.end method
