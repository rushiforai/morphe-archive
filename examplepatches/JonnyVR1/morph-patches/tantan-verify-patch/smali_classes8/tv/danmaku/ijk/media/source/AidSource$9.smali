.class Ltv/danmaku/ijk/media/source/AidSource$9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;


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
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onVideoSizeChanged(Ltv/danmaku/ijk/media/player/IMediaPlayer;IIII)V
    .locals 7

    .line 1
    invoke-interface {p1}, Ltv/danmaku/ijk/media/player/IMediaPlayer;->getVideoWidth()I

    .line 2
    .line 3
    .line 4
    move-result p4

    .line 5
    invoke-interface {p1}, Ltv/danmaku/ijk/media/player/IMediaPlayer;->getVideoHeight()I

    .line 6
    .line 7
    .line 8
    move-result p5

    .line 9
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 10
    .line 11
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/AidSource;->k2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, -0x1

    .line 16
    if-eq v0, v1, :cond_8

    .line 17
    .line 18
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 19
    .line 20
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/AidSource;->m2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-ne v0, v1, :cond_0

    .line 25
    .line 26
    goto/16 :goto_1

    .line 27
    .line 28
    :cond_0
    const-string v0, "aidStream"

    .line 29
    .line 30
    const-string v1, ","

    .line 31
    .line 32
    if-ne p4, p2, :cond_1

    .line 33
    .line 34
    if-eq p5, p3, :cond_2

    .line 35
    .line 36
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v3, "----AidSource: <changed> no same"

    .line 39
    .line 40
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-static {v0, p2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    :cond_2
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 60
    .line 61
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/AidSource;->k2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    if-ne p4, p2, :cond_3

    .line 66
    .line 67
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 68
    .line 69
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/AidSource;->m2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-eq p5, p2, :cond_8

    .line 74
    .line 75
    :cond_3
    new-instance p2, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    const-string p3, "----AidSource: <changed>("

    .line 78
    .line 79
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget-object p3, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 83
    .line 84
    invoke-static {p3}, Ltv/danmaku/ijk/media/source/AidSource;->k2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 85
    .line 86
    .line 87
    move-result p3

    .line 88
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    iget-object p3, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 95
    .line 96
    invoke-static {p3}, Ltv/danmaku/ijk/media/source/AidSource;->m2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 97
    .line 98
    .line 99
    move-result p3

    .line 100
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string p3, ")--->("

    .line 104
    .line 105
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p2, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    const-string p3, "), cost time:"

    .line 118
    .line 119
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 123
    .line 124
    .line 125
    move-result-wide v1

    .line 126
    iget-object p3, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 127
    .line 128
    invoke-static {p3}, Ltv/danmaku/ijk/media/source/AidSource;->V1(Ltv/danmaku/ijk/media/source/AidSource;)J

    .line 129
    .line 130
    .line 131
    move-result-wide v3

    .line 132
    sub-long/2addr v1, v3

    .line 133
    invoke-virtual {p2, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    const-string p3, "ms, mAidMode="

    .line 137
    .line 138
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    iget-object p3, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 142
    .line 143
    invoke-static {p3}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 144
    .line 145
    .line 146
    move-result p3

    .line 147
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p2

    .line 154
    invoke-static {v0, p2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    .line 156
    .line 157
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 158
    .line 159
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/AidSource;->k2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 160
    .line 161
    .line 162
    move-result p2

    .line 163
    if-eqz p2, :cond_7

    .line 164
    .line 165
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 166
    .line 167
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/AidSource;->m2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 168
    .line 169
    .line 170
    move-result p2

    .line 171
    if-nez p2, :cond_4

    .line 172
    .line 173
    goto :goto_0

    .line 174
    :cond_4
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 175
    .line 176
    invoke-static {p1, p4}, Ltv/danmaku/ijk/media/source/AidSource;->l2(Ltv/danmaku/ijk/media/source/AidSource;I)I

    .line 177
    .line 178
    .line 179
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 180
    .line 181
    invoke-static {p1, p5}, Ltv/danmaku/ijk/media/source/AidSource;->n2(Ltv/danmaku/ijk/media/source/AidSource;I)I

    .line 182
    .line 183
    .line 184
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 185
    .line 186
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->W1(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    if-eqz p1, :cond_5

    .line 191
    .line 192
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 193
    .line 194
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->W1(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 199
    .line 200
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->b2(Ltv/danmaku/ijk/media/source/AidSource;)J

    .line 201
    .line 202
    .line 203
    move-result-wide v1

    .line 204
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 205
    .line 206
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->k2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 207
    .line 208
    .line 209
    move-result v3

    .line 210
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 211
    .line 212
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->m2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 213
    .line 214
    .line 215
    move-result v4

    .line 216
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 217
    .line 218
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->j2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 219
    .line 220
    .line 221
    move-result v6

    .line 222
    const/4 v5, 0x1

    .line 223
    invoke-virtual/range {v0 .. v6}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->X0(JIIII)V

    .line 224
    .line 225
    .line 226
    :cond_5
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 227
    .line 228
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/source/AidSource;->r2()Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    if-eqz p1, :cond_6

    .line 233
    .line 234
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 235
    .line 236
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/source/AidSource;->r2()Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 241
    .line 242
    invoke-static {p2}, Ltv/danmaku/ijk/media/source/AidSource;->k2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 243
    .line 244
    .line 245
    move-result p2

    .line 246
    iget-object p3, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 247
    .line 248
    invoke-static {p3}, Ltv/danmaku/ijk/media/source/AidSource;->m2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 249
    .line 250
    .line 251
    move-result p3

    .line 252
    invoke-interface {p1, p2, p3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;->a(II)V

    .line 253
    .line 254
    .line 255
    :cond_6
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 256
    .line 257
    invoke-static {p1}, Ltv/danmaku/ijk/media/source/AidSource;->k2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 258
    .line 259
    .line 260
    move-result p2

    .line 261
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 262
    .line 263
    invoke-static {p0}, Ltv/danmaku/ijk/media/source/AidSource;->m2(Ltv/danmaku/ijk/media/source/AidSource;)I

    .line 264
    .line 265
    .line 266
    move-result p0

    .line 267
    invoke-virtual {p1, p2, p0}, Ltv/danmaku/ijk/media/source/AidSource;->w2(II)V

    .line 268
    .line 269
    .line 270
    return-void

    .line 271
    :cond_7
    :goto_0
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 272
    .line 273
    invoke-static {p2, p4}, Ltv/danmaku/ijk/media/source/AidSource;->l2(Ltv/danmaku/ijk/media/source/AidSource;I)I

    .line 274
    .line 275
    .line 276
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 277
    .line 278
    invoke-static {p2, p5}, Ltv/danmaku/ijk/media/source/AidSource;->n2(Ltv/danmaku/ijk/media/source/AidSource;I)I

    .line 279
    .line 280
    .line 281
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource$9;->a:Ltv/danmaku/ijk/media/source/AidSource;

    .line 282
    .line 283
    invoke-static {p0, p1}, Ltv/danmaku/ijk/media/source/AidSource;->X1(Ltv/danmaku/ijk/media/source/AidSource;Ltv/danmaku/ijk/media/player/IMediaPlayer;)V

    .line 284
    .line 285
    .line 286
    :cond_8
    :goto_1
    return-void
.end method
