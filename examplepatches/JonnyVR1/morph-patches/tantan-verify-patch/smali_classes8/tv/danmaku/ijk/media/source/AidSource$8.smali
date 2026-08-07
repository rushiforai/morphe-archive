.class Ltv/danmaku/ijk/media/source/AidSource$8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnVideoMediacodecChangedListener;


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
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$8;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onVideoMediacodecChanged(Ltv/danmaku/ijk/media/player/IMediaPlayer;I)V
    .locals 7

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "----AidSource: <MediacodecChanged> "

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource$8;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 9
    .line 10
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/AidSource;->Z1(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v0, ","

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v0, "aidStream"

    .line 30
    .line 31
    invoke-static {v0, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    const/4 p1, 0x1

    .line 35
    if-ne p2, p1, :cond_7

    .line 36
    .line 37
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$8;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 38
    .line 39
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/AidSource;->Z1(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-ne p2, p1, :cond_7

    .line 44
    .line 45
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$8;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-static {p2, v1}, Ltv/danmaku/ijk/media/source/AidSource;->a2(Ltv/danmaku/ijk/media/source/AidSource;I)I

    .line 49
    .line 50
    .line 51
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$8;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 52
    .line 53
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/AidSource;->S1(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    if-eqz p2, :cond_0

    .line 58
    .line 59
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$8;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 60
    .line 61
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/AidSource;->S1(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/AidSource$8;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 66
    .line 67
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/AidSource;->Z1(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    invoke-virtual {p2, v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->x1(I)I

    .line 72
    .line 73
    .line 74
    :cond_0
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$8;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 75
    .line 76
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    const-string v2, "AidSource: msg:210"

    .line 81
    .line 82
    const/16 v3, 0xd2

    .line 83
    .line 84
    const/4 v4, 0x0

    .line 85
    const/16 v5, 0xc8

    .line 86
    .line 87
    if-eqz p2, :cond_4

    .line 88
    .line 89
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$8;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 90
    .line 91
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    if-ne p2, p1, :cond_1

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_1
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$8;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 99
    .line 100
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 101
    .line 102
    .line 103
    move-result p2

    .line 104
    const/4 v6, 0x2

    .line 105
    if-eq p2, v6, :cond_3

    .line 106
    .line 107
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$8;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 108
    .line 109
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    const/4 v6, 0x3

    .line 114
    if-eq p2, v6, :cond_3

    .line 115
    .line 116
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$8;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 117
    .line 118
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 119
    .line 120
    .line 121
    move-result p2

    .line 122
    const/16 v6, 0x9

    .line 123
    .line 124
    if-ne p2, v6, :cond_2

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_2
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$8;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 128
    .line 129
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 130
    .line 131
    .line 132
    move-result p2

    .line 133
    const/16 v6, 0x8

    .line 134
    .line 135
    if-ne p2, v6, :cond_5

    .line 136
    .line 137
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$8;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 138
    .line 139
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/AidSource;->i2(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    invoke-static {p2, v5, v3, v1, v4}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 144
    .line 145
    .line 146
    invoke-static {v0, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    .line 148
    .line 149
    goto :goto_2

    .line 150
    :cond_3
    :goto_0
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$8;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 151
    .line 152
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/AidSource;->i2(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 153
    .line 154
    .line 155
    move-result-object p2

    .line 156
    const/16 v2, 0xd1

    .line 157
    .line 158
    invoke-static {p2, v5, v2, v1, v4}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 159
    .line 160
    .line 161
    const-string p2, "AidSource: msg:209"

    .line 162
    .line 163
    invoke-static {v0, p2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    .line 165
    .line 166
    goto :goto_2

    .line 167
    :cond_4
    :goto_1
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$8;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 168
    .line 169
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/AidSource;->i2(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 170
    .line 171
    .line 172
    move-result-object p2

    .line 173
    invoke-static {p2, v5, v3, v1, v4}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 174
    .line 175
    .line 176
    invoke-static {v0, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    .line 178
    .line 179
    :cond_5
    :goto_2
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$8;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 180
    .line 181
    invoke-virtual {p2}, Ltv/danmaku/ijk/media/source/AidSource;->q2()Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;

    .line 182
    .line 183
    .line 184
    move-result-object p2

    .line 185
    if-eqz p2, :cond_6

    .line 186
    .line 187
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$8;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 188
    .line 189
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 190
    .line 191
    .line 192
    move-result p2

    .line 193
    if-ne p2, p1, :cond_6

    .line 194
    .line 195
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$8;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 196
    .line 197
    invoke-virtual {p2}, Ltv/danmaku/ijk/media/source/AidSource;->q2()Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;

    .line 198
    .line 199
    .line 200
    move-result-object p2

    .line 201
    const/16 v0, 0x160

    .line 202
    .line 203
    const/16 v1, 0x280

    .line 204
    .line 205
    invoke-interface {p2, v0, v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;->a(II)V

    .line 206
    .line 207
    .line 208
    :cond_6
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource$8;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 209
    .line 210
    invoke-static {p0, p1}, Ltv/danmaku/ijk/media/source/AidSource;->Y1(Ltv/danmaku/ijk/media/source/AidSource;Z)V

    .line 211
    .line 212
    .line 213
    :cond_7
    return-void
.end method
