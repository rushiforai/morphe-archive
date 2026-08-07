.class Ltv/danmaku/ijk/media/source/AidSource$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;


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
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$4;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCompletion(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
    .locals 6

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "----AidSource: <onCompletion> cost time:"

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/AidSource$4;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 13
    .line 14
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/AidSource;->V1(Ltv/danmaku/ijk/media/source/AidSource;)J

    .line 15
    .line 16
    .line 17
    move-result-wide v2

    .line 18
    sub-long/2addr v0, v2

    .line 19
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v0, "ms"

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "aidStream"

    .line 32
    .line 33
    invoke-static {v0, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$4;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 37
    .line 38
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    const/4 v1, 0x0

    .line 43
    const/16 v2, 0xc8

    .line 44
    .line 45
    const/4 v3, 0x1

    .line 46
    const/4 v4, 0x0

    .line 47
    if-eqz p1, :cond_3

    .line 48
    .line 49
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$4;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 50
    .line 51
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-ne p1, v3, :cond_0

    .line 56
    .line 57
    goto :goto_2

    .line 58
    :cond_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$4;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 59
    .line 60
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    const/4 v5, 0x3

    .line 65
    if-eq p1, v5, :cond_2

    .line 66
    .line 67
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$4;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 68
    .line 69
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    const/16 v5, 0x9

    .line 74
    .line 75
    if-ne p1, v5, :cond_1

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_1
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$4;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 79
    .line 80
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    const/4 v5, 0x2

    .line 85
    if-ne p1, v5, :cond_4

    .line 86
    .line 87
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$4;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 88
    .line 89
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->i2(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    const/16 v5, 0xcd

    .line 94
    .line 95
    invoke-static {p1, v2, v5, v4, v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    const-string p1, "AidSource: msg:205"

    .line 99
    .line 100
    invoke-static {v0, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    :goto_0
    move v4, v3

    .line 104
    goto :goto_3

    .line 105
    :cond_2
    :goto_1
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$4;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 106
    .line 107
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->i2(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    const/16 v5, 0xce

    .line 112
    .line 113
    invoke-static {p1, v2, v5, v4, v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    const-string p1, "AidSource: msg:206"

    .line 117
    .line 118
    invoke-static {v0, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    goto :goto_3

    .line 122
    :cond_3
    :goto_2
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$4;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 123
    .line 124
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->i2(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    const/16 v5, 0xcb

    .line 129
    .line 130
    invoke-static {p1, v2, v5, v4, v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 131
    .line 132
    .line 133
    const-string p1, "AidSource: msg:203"

    .line 134
    .line 135
    invoke-static {v0, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_4
    :goto_3
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$4;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 140
    .line 141
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/source/AidSource;->q2()Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    if-eqz p1, :cond_5

    .line 146
    .line 147
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$4;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 148
    .line 149
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    if-ne p1, v3, :cond_5

    .line 154
    .line 155
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$4;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 156
    .line 157
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/source/AidSource;->q2()Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    const/16 v0, 0x160

    .line 162
    .line 163
    const/16 v1, 0x280

    .line 164
    .line 165
    invoke-interface {p1, v0, v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;->a(II)V

    .line 166
    .line 167
    .line 168
    :cond_5
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource$4;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 169
    .line 170
    invoke-static {p0, v4}, Ltv/danmaku/ijk/media/source/AidSource;->Y1(Ltv/danmaku/ijk/media/source/AidSource;Z)V

    .line 171
    .line 172
    .line 173
    return-void
.end method
