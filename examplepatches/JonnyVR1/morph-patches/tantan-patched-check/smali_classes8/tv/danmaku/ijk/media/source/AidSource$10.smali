.class Ltv/danmaku/ijk/media/source/AidSource$10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;


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
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$10;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onError(Ltv/danmaku/ijk/media/player/IMediaPlayer;II)Z
    .locals 6

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "AidSource: <OnError> cost time:"

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
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/AidSource$10;->a:Ltv/danmaku/ijk/media/source/AidSource;

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
    const-string v0, "ms, "

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p2, ","

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string p2, "aidStream"

    .line 43
    .line 44
    invoke-static {p2, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$10;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 48
    .line 49
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    const-string p3, "AidSource: msg:210"

    .line 54
    .line 55
    const/16 v0, 0xd2

    .line 56
    .line 57
    const/4 v1, 0x0

    .line 58
    const/4 v2, 0x0

    .line 59
    const/16 v3, 0xc8

    .line 60
    .line 61
    const/4 v4, 0x1

    .line 62
    if-eqz p1, :cond_3

    .line 63
    .line 64
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$10;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 65
    .line 66
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-ne p1, v4, :cond_0

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$10;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 74
    .line 75
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    const/4 v5, 0x2

    .line 80
    if-eq p1, v5, :cond_2

    .line 81
    .line 82
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$10;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 83
    .line 84
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    const/4 v5, 0x3

    .line 89
    if-eq p1, v5, :cond_2

    .line 90
    .line 91
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$10;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 92
    .line 93
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    const/16 v5, 0x9

    .line 98
    .line 99
    if-ne p1, v5, :cond_1

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_1
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$10;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 103
    .line 104
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    const/16 v5, 0x8

    .line 109
    .line 110
    if-ne p1, v5, :cond_4

    .line 111
    .line 112
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$10;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 113
    .line 114
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->i2(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-static {p1, v3, v0, v2, v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    invoke-static {p2, p3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_2
    :goto_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$10;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 126
    .line 127
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->i2(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    const/16 p3, 0xd1

    .line 132
    .line 133
    invoke-static {p1, v3, p3, v2, v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    const-string p1, "AidSource: msg:209"

    .line 137
    .line 138
    invoke-static {p2, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    .line 140
    .line 141
    goto :goto_2

    .line 142
    :cond_3
    :goto_1
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$10;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 143
    .line 144
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->i2(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-static {p1, v3, v0, v2, v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 149
    .line 150
    .line 151
    invoke-static {p2, p3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    .line 153
    .line 154
    :cond_4
    :goto_2
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$10;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 155
    .line 156
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/source/AidSource;->q2()Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    if-eqz p1, :cond_5

    .line 161
    .line 162
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$10;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 163
    .line 164
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    if-ne p1, v4, :cond_5

    .line 169
    .line 170
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$10;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 171
    .line 172
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/source/AidSource;->q2()Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    const/16 p2, 0x160

    .line 177
    .line 178
    const/16 p3, 0x280

    .line 179
    .line 180
    invoke-interface {p1, p2, p3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;->a(II)V

    .line 181
    .line 182
    .line 183
    :cond_5
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource$10;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 184
    .line 185
    invoke-static {p0, v4}, Ltv/danmaku/ijk/media/source/AidSource;->Y1(Ltv/danmaku/ijk/media/source/AidSource;Z)V

    .line 186
    .line 187
    .line 188
    return v4
.end method
