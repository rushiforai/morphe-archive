.class Ll/fnw$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnVideoMediacodecChangedListener;
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnInfoListener;
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$RenderTimestampListener;
.implements Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;
.implements Ltv/danmaku/ijk/media/player/IjkMediaPlayer$JsonDateCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fnw;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field private a:Ll/dnw;

.field final synthetic b:Ll/fnw;


# direct methods
.method public constructor <init>(Ll/fnw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public JsonDateCallback([BILtv/danmaku/ijk/media/player/IjkMediaPlayer;)V
    .locals 2

    .line 1
    const-string p3, "JsonDateCallback->onRecvUserInfo: "

    .line 2
    .line 3
    iget-object v0, p0, Ll/fnw$a;->a:Ll/dnw;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    :try_start_0
    const-string v0, "MMLivePlayer"

    .line 8
    .line 9
    new-instance v1, Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {v1, p1}, Ljava/lang/String;-><init>([B)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-static {v0, p3}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 19
    .line 20
    .line 21
    iget-object p3, p0, Ll/fnw$a;->a:Ll/dnw;

    .line 22
    .line 23
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 24
    .line 25
    new-instance v1, Ljava/lang/String;

    .line 26
    .line 27
    invoke-direct {v1, p1}, Ljava/lang/String;-><init>([B)V

    .line 28
    .line 29
    .line 30
    invoke-direct {v0, v1}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p3, v0}, Ll/dnw;->j(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/fnw$a;->a:Ll/dnw;

    .line 37
    .line 38
    invoke-virtual {p0, p1, p2}, Ll/dnw;->a([BI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .line 40
    .line 41
    :catch_0
    :cond_0
    return-void
.end method

.method public a(Ll/dnw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fnw$a;->a:Ll/dnw;

    .line 2
    .line 3
    return-void
.end method

.method public onBufferingUpdate(Ltv/danmaku/ijk/media/player/IMediaPlayer;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fnw$a;->a:Ll/dnw;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p2}, Ll/dnw;->b(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onCompletion(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
    .locals 1

    .line 1
    const-string p1, "MMLivePlayer"

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/fnw$a;->a:Ll/dnw;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/dnw;->f()V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 16
    .line 17
    sget-object p1, Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;->MMLivePlayerStatusFinished:Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;

    .line 18
    .line 19
    invoke-static {p0, p1}, Ll/fnw;->b(Ll/fnw;Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;)Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onError(Ltv/danmaku/ijk/media/player/IMediaPlayer;II)Z
    .locals 5

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "onError: what="

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string p2, ", extra="

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string p2, "MMLivePlayer"

    .line 24
    .line 25
    invoke-static {p2, p1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 29
    .line 30
    invoke-static {p1}, Ll/fnw;->a(Ll/fnw;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const/4 p2, 0x1

    .line 35
    if-eqz p1, :cond_6

    .line 36
    .line 37
    iget-object p1, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 38
    .line 39
    invoke-static {p1}, Ll/fnw;->a(Ll/fnw;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getCurrentUrlInfo()Ll/p4k0;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget-object v0, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 48
    .line 49
    invoke-static {v0}, Ll/fnw;->a(Ll/fnw;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->hasPrepared()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    new-instance v2, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    const-string v3, "hasPrepared:"

    .line 64
    .line 65
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    const-string v3, "onError"

    .line 76
    .line 77
    filled-new-array {v3, v2}, [Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-virtual {v1, v2}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    if-eqz p1, :cond_0

    .line 85
    .line 86
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    new-instance v2, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    const-string v4, "url:"

    .line 93
    .line 94
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p1}, Ll/p4k0;->d()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v4, ",type:"

    .line 105
    .line 106
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1}, Ll/p4k0;->b()Lcom/immomo/network/bean/UrlType;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    filled-new-array {v3, v2}, [Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-virtual {v1, v2}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    :cond_0
    if-eqz p1, :cond_5

    .line 128
    .line 129
    invoke-virtual {p1}, Ll/p4k0;->b()Lcom/immomo/network/bean/UrlType;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    sget-object v2, Lcom/immomo/network/bean/UrlType;->IPV6:Lcom/immomo/network/bean/UrlType;

    .line 134
    .line 135
    if-ne v1, v2, :cond_5

    .line 136
    .line 137
    if-nez v0, :cond_5

    .line 138
    .line 139
    invoke-static {}, Ll/qj20;->f()Ll/qj20;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    const/4 v1, 0x0

    .line 144
    invoke-virtual {v0, p1, v1, v1}, Ll/qj20;->r(Ll/p4k0;ZZ)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 148
    .line 149
    invoke-static {p1}, Ll/fnw;->c(Ll/fnw;)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    if-eqz p1, :cond_2

    .line 158
    .line 159
    iget-object p1, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 160
    .line 161
    invoke-static {p1}, Ll/fnw;->d(Ll/fnw;)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 166
    .line 167
    .line 168
    move-result p1

    .line 169
    if-nez p1, :cond_1

    .line 170
    .line 171
    goto :goto_0

    .line 172
    :cond_1
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    const-string v0, "onError: NetworkDetector\u6ca1\u6709\u8fd4\u56de\u53ef\u7528URL"

    .line 177
    .line 178
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {p1, v0}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 183
    .line 184
    .line 185
    goto/16 :goto_3

    .line 186
    .line 187
    :cond_2
    :goto_0
    :try_start_0
    iget-object p1, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 188
    .line 189
    invoke-static {p1}, Ll/fnw;->a(Ll/fnw;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->stop()V

    .line 194
    .line 195
    .line 196
    iget-object p1, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 197
    .line 198
    invoke-static {p1}, Ll/fnw;->a(Ll/fnw;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->resetInternal()V

    .line 203
    .line 204
    .line 205
    iget-object p1, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 206
    .line 207
    invoke-static {p1}, Ll/fnw;->e(Ll/fnw;)Landroid/view/Surface;

    .line 208
    .line 209
    .line 210
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 211
    iget-object v0, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 212
    .line 213
    if-eqz p1, :cond_3

    .line 214
    .line 215
    :try_start_1
    invoke-static {v0}, Ll/fnw;->a(Ll/fnw;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    iget-object v0, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 220
    .line 221
    invoke-static {v0}, Ll/fnw;->e(Ll/fnw;)Landroid/view/Surface;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    invoke-virtual {p1, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 226
    .line 227
    .line 228
    goto :goto_1

    .line 229
    :catch_0
    move-exception p1

    .line 230
    goto :goto_2

    .line 231
    :cond_3
    invoke-static {v0}, Ll/fnw;->f(Ll/fnw;)Landroid/view/SurfaceHolder;

    .line 232
    .line 233
    .line 234
    move-result-object p1

    .line 235
    if-eqz p1, :cond_4

    .line 236
    .line 237
    iget-object p1, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 238
    .line 239
    invoke-static {p1}, Ll/fnw;->a(Ll/fnw;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    iget-object v0, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 244
    .line 245
    invoke-static {v0}, Ll/fnw;->f(Ll/fnw;)Landroid/view/SurfaceHolder;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    invoke-virtual {p1, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setDisplay(Landroid/view/SurfaceHolder;)V

    .line 250
    .line 251
    .line 252
    :cond_4
    :goto_1
    iget-object p1, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 253
    .line 254
    invoke-static {p1}, Ll/fnw;->a(Ll/fnw;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 255
    .line 256
    .line 257
    move-result-object p1

    .line 258
    iget-object v0, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 259
    .line 260
    invoke-static {v0}, Ll/fnw;->c(Ll/fnw;)Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    iget-object v2, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 265
    .line 266
    invoke-static {v2}, Ll/fnw;->d(Ll/fnw;)Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    invoke-virtual {p1, v0, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setDataSource(Ljava/lang/String;Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    iget-object p1, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 274
    .line 275
    invoke-static {p1}, Ll/fnw;->a(Ll/fnw;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    invoke-virtual {p1, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setScreenOnWhilePlaying(Z)V

    .line 280
    .line 281
    .line 282
    iget-object p1, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 283
    .line 284
    invoke-static {p1}, Ll/fnw;->a(Ll/fnw;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 285
    .line 286
    .line 287
    move-result-object p1

    .line 288
    const/16 v0, 0x4e38

    .line 289
    .line 290
    const-wide/32 v2, 0xac44

    .line 291
    .line 292
    .line 293
    invoke-virtual {p1, v0, v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 294
    .line 295
    .line 296
    iget-object p1, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 297
    .line 298
    invoke-static {p1}, Ll/fnw;->a(Ll/fnw;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 299
    .line 300
    .line 301
    move-result-object p1

    .line 302
    const/16 v0, 0x4e36

    .line 303
    .line 304
    const-wide/16 v2, 0x2

    .line 305
    .line 306
    invoke-virtual {p1, v0, v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 307
    .line 308
    .line 309
    iget-object p1, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 310
    .line 311
    invoke-static {p1}, Ll/fnw;->a(Ll/fnw;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 312
    .line 313
    .line 314
    move-result-object p1

    .line 315
    const/16 v0, 0x4e37

    .line 316
    .line 317
    const-wide/16 v2, 0x3

    .line 318
    .line 319
    invoke-virtual {p1, v0, v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 320
    .line 321
    .line 322
    iget-object p1, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 323
    .line 324
    invoke-static {p1}, Ll/fnw;->a(Ll/fnw;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 325
    .line 326
    .line 327
    move-result-object p1

    .line 328
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->prepareAsync()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 329
    .line 330
    .line 331
    return v1

    .line 332
    :goto_2
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 333
    .line 334
    .line 335
    move-result-object v0

    .line 336
    new-instance v1, Ljava/lang/StringBuilder;

    .line 337
    .line 338
    const-string v2, "retry play err"

    .line 339
    .line 340
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 341
    .line 342
    .line 343
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object v2

    .line 347
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    .line 349
    .line 350
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object v1

    .line 354
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 355
    .line 356
    .line 357
    move-result-object v1

    .line 358
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 359
    .line 360
    .line 361
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 362
    .line 363
    .line 364
    goto :goto_3

    .line 365
    :cond_5
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 366
    .line 367
    .line 368
    move-result-object v0

    .line 369
    new-instance v1, Ljava/lang/StringBuilder;

    .line 370
    .line 371
    const-string v2, "onError: currentUrlInfo"

    .line 372
    .line 373
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 374
    .line 375
    .line 376
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 377
    .line 378
    .line 379
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object p1

    .line 383
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 384
    .line 385
    .line 386
    move-result-object p1

    .line 387
    invoke-virtual {v0, p1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 388
    .line 389
    .line 390
    :cond_6
    :goto_3
    iget-object p1, p0, Ll/fnw$a;->a:Ll/dnw;

    .line 391
    .line 392
    if-eqz p1, :cond_7

    .line 393
    .line 394
    invoke-virtual {p1, p3}, Ll/dnw;->e(I)V

    .line 395
    .line 396
    .line 397
    :cond_7
    iget-object p0, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 398
    .line 399
    sget-object p1, Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;->MMLivePlayerStatusFailed:Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;

    .line 400
    .line 401
    invoke-static {p0, p1}, Ll/fnw;->b(Ll/fnw;Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;)Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;

    .line 402
    .line 403
    .line 404
    return p2
.end method

.method public onInfo(Ltv/danmaku/ijk/media/player/IMediaPlayer;II)Z
    .locals 1

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v0, " / "

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string p3, "MMLivePlayer"

    .line 24
    .line 25
    invoke-static {p3, p1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x3

    .line 29
    if-eq p2, p1, :cond_3

    .line 30
    .line 31
    const/16 p1, 0x2bd

    .line 32
    .line 33
    if-eq p2, p1, :cond_1

    .line 34
    .line 35
    const/16 p1, 0x2be

    .line 36
    .line 37
    if-eq p2, p1, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const-string p1, "Info: MEDIA_INFO_BUFFERING_END"

    .line 41
    .line 42
    invoke-static {p3, p1}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/fnw$a;->a:Ll/dnw;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/dnw;->d()V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    const-string p1, "Info: MEDIA_INFO_BUFFERING_START"

    .line 54
    .line 55
    invoke-static {p3, p1}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/fnw$a;->a:Ll/dnw;

    .line 59
    .line 60
    if-eqz p1, :cond_2

    .line 61
    .line 62
    invoke-virtual {p1}, Ll/dnw;->i()V

    .line 63
    .line 64
    .line 65
    :cond_2
    iget-object p0, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 66
    .line 67
    sget-object p1, Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;->MMLivePlayerStatusBuffering:Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;

    .line 68
    .line 69
    invoke-static {p0, p1}, Ll/fnw;->b(Ll/fnw;Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;)Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    const-string p1, "Info: MEDIA_INFO_VIDEO_RENDERING_START"

    .line 74
    .line 75
    invoke-static {p3, p1}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Ll/fnw$a;->a:Ll/dnw;

    .line 79
    .line 80
    if-eqz p0, :cond_4

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/dnw;->g()V

    .line 83
    .line 84
    .line 85
    :cond_4
    :goto_0
    const/4 p0, 0x0

    .line 86
    return p0
.end method

.method public onMediaDateCallback([BIILtv/danmaku/ijk/media/player/IjkMediaPlayer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fnw$a;->a:Ll/dnw;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/dnw;->c([BIILtv/danmaku/ijk/media/player/IjkMediaPlayer;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onPrepared(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
    .locals 3

    .line 1
    const-string p1, "MMLivePlayer"

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 9
    .line 10
    invoke-static {p1}, Ll/fnw;->a(Ll/fnw;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iget-object p1, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 17
    .line 18
    invoke-static {p1}, Ll/fnw;->a(Ll/fnw;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getCurrentUrlInfo()Ll/p4k0;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/p4k0;->b()Lcom/immomo/network/bean/UrlType;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget-object v1, Lcom/immomo/network/bean/UrlType;->IPV6:Lcom/immomo/network/bean/UrlType;

    .line 33
    .line 34
    if-ne v0, v1, :cond_0

    .line 35
    .line 36
    invoke-static {}, Ll/qj20;->f()Ll/qj20;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const/4 v1, 0x1

    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-virtual {v0, p1, v1, v2}, Ll/qj20;->r(Ll/p4k0;ZZ)V

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object p1, p0, Ll/fnw$a;->b:Ll/fnw;

    .line 46
    .line 47
    invoke-static {p1}, Ll/fnw;->a(Ll/fnw;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPrepared()V

    .line 52
    .line 53
    .line 54
    :cond_1
    iget-object p0, p0, Ll/fnw$a;->a:Ll/dnw;

    .line 55
    .line 56
    if-eqz p0, :cond_2

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/dnw;->h()V

    .line 59
    .line 60
    .line 61
    :cond_2
    return-void
.end method

.method public onRenderTimestampChanged(J)V
    .locals 0

    .line 1
    const-string p0, "MMLivePlayer"

    .line 2
    .line 3
    const-string p1, ""

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onSeekComplete(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
    .locals 0

    .line 1
    const-string p0, "MMLivePlayer"

    .line 2
    .line 3
    const-string p1, ""

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onVideoMediacodecChanged(Ltv/danmaku/ijk/media/player/IMediaPlayer;I)V
    .locals 0

    .line 1
    const-string p0, "MMLivePlayer"

    .line 2
    .line 3
    const-string p1, ""

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onVideoSizeChanged(Ltv/danmaku/ijk/media/player/IMediaPlayer;IIII)V
    .locals 0

    .line 1
    const-string p1, "MMLivePlayer"

    .line 2
    .line 3
    const-string p4, ""

    .line 4
    .line 5
    invoke-static {p1, p4}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/fnw$a;->a:Ll/dnw;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p2, p3}, Ll/dnw;->k(II)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
