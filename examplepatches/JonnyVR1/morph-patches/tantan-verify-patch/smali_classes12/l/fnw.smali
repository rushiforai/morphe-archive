.class public Ll/fnw;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fnw$a;
    }
.end annotation


# static fields
.field private static j:I


# instance fields
.field private a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

.field private b:Ll/fnw$a;

.field private c:Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;

.field private d:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

.field private e:Ltv/danmaku/ijk/media/player/PullWatchInfo;

.field private f:Ljava/lang/String;

.field private g:Ljava/lang/String;

.field private h:Landroid/view/Surface;

.field private i:Landroid/view/SurfaceHolder;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/immomo/momomediaext/utils/MMLiveUserConfig;)V
    .locals 9

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;->MMLivePlayerStatusStopped:Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;

    .line 5
    .line 6
    iput-object v0, p0, Ll/fnw;->c:Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;

    .line 7
    .line 8
    new-instance v1, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 9
    .line 10
    const-string v7, "100"

    .line 11
    .line 12
    const/4 v8, 0x1

    .line 13
    const-string v2, "0"

    .line 14
    .line 15
    const-string v3, "0"

    .line 16
    .line 17
    const-string v4, "0"

    .line 18
    .line 19
    const-string v5, "0"

    .line 20
    .line 21
    const-string v6, "0"

    .line 22
    .line 23
    invoke-direct/range {v1 .. v8}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Ll/fnw;->d:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 27
    .line 28
    new-instance v0, Ltv/danmaku/ijk/media/player/PullWatchInfo;

    .line 29
    .line 30
    invoke-direct {v0}, Ltv/danmaku/ijk/media/player/PullWatchInfo;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/fnw;->e:Ltv/danmaku/ijk/media/player/PullWatchInfo;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    iput-object v0, p0, Ll/fnw;->h:Landroid/view/Surface;

    .line 37
    .line 38
    iput-object v0, p0, Ll/fnw;->i:Landroid/view/SurfaceHolder;

    .line 39
    .line 40
    const-string v0, "MMLivePlayer"

    .line 41
    .line 42
    const-string v1, ""

    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 45
    .line 46
    .line 47
    new-instance v2, Ll/brx;

    .line 48
    .line 49
    invoke-direct {v2}, Ll/brx;-><init>()V

    .line 50
    .line 51
    .line 52
    if-nez p2, :cond_0

    .line 53
    .line 54
    iget-object p2, p0, Ll/fnw;->d:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 55
    .line 56
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    const-string v4, "userConfig"

    .line 61
    .line 62
    sget-object v5, Lcom/immomo/medialog/LogLevel;->ERROR:Lcom/immomo/medialog/LogLevel;

    .line 63
    .line 64
    invoke-virtual {v3, v0, v4, v5}, Ll/b7y;->a(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/medialog/LogLevel;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    invoke-virtual {p2}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getAppid()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {v2, v3}, Ll/brx;->o(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p2}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getMomoid()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-virtual {v2, v3}, Ll/brx;->u(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p2}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getRoomid()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-virtual {v2, v3}, Ll/brx;->s(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p2}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getSecret()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-virtual {v2, v3}, Ll/brx;->t(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p2}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getAppVersion()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-virtual {v2, v3}, Ll/brx;->n(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p2}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getAppPatch()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-virtual {v2, v3}, Ll/brx;->q(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    new-instance v3, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 110
    .line 111
    invoke-direct {v3, p1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;-><init>(Landroid/content/Context;Ll/brx;)V

    .line 112
    .line 113
    .line 114
    iput-object v3, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 115
    .line 116
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-static {}, Ll/y310;->a()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-virtual {p1, v2}, Ll/arx;->o(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    new-instance v2, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    const-string v3, "userConfig:"

    .line 134
    .line 135
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p2}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    filled-new-array {v0, v2}, [Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    invoke-virtual {p1, v2}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 154
    .line 155
    .line 156
    iput-object p2, p0, Ll/fnw;->d:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 157
    .line 158
    iget-object p1, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 159
    .line 160
    invoke-virtual {p2}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getRoomid()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p2

    .line 164
    new-instance v2, Ljava/lang/StringBuilder;

    .line 165
    .line 166
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 167
    .line 168
    .line 169
    iget-object v3, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 170
    .line 171
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    .line 172
    .line 173
    .line 174
    move-result v3

    .line 175
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    const/4 v2, 0x0

    .line 186
    invoke-virtual {p1, p2, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setLogRoomInfos(Ljava/lang/String;Ljava/lang/String;I)V

    .line 187
    .line 188
    .line 189
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    iget-object p2, p0, Ll/fnw;->d:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 194
    .line 195
    invoke-virtual {p2}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getAppid()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p2

    .line 199
    invoke-virtual {p1, p2}, Ll/arx;->h(Ljava/lang/String;)Ll/arx$d;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    if-eqz p1, :cond_1

    .line 204
    .line 205
    iget-object p2, p1, Ll/arx$d;->e:Ll/bsx;

    .line 206
    .line 207
    if-eqz p2, :cond_1

    .line 208
    .line 209
    invoke-static {}, Ll/vnk0;->a()Ll/vnk0;

    .line 210
    .line 211
    .line 212
    move-result-object p2

    .line 213
    iget-object p1, p1, Ll/arx$d;->e:Ll/bsx;

    .line 214
    .line 215
    invoke-virtual {p2, p1}, Ll/vnk0;->e(Ll/bsx;)V

    .line 216
    .line 217
    .line 218
    :cond_1
    iget-object p1, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 219
    .line 220
    invoke-static {}, Ll/fnw;->j()Z

    .line 221
    .line 222
    .line 223
    move-result p2

    .line 224
    if-eqz p2, :cond_2

    .line 225
    .line 226
    sget p2, Ltv/danmaku/ijk/media/player/option/AvFourCC;->a:I

    .line 227
    .line 228
    goto :goto_0

    .line 229
    :cond_2
    sget p2, Ltv/danmaku/ijk/media/player/option/AvFourCC;->b:I

    .line 230
    .line 231
    :goto_0
    invoke-virtual {p1, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setOverlayFormat(I)V

    .line 232
    .line 233
    .line 234
    sget p1, Ll/fnw;->j:I

    .line 235
    .line 236
    add-int/lit8 p1, p1, 0x1

    .line 237
    .line 238
    sput p1, Ll/fnw;->j:I

    .line 239
    .line 240
    new-instance p1, Ljava/lang/StringBuilder;

    .line 241
    .line 242
    const-string p2, "MomoMediaPlayer: Create: count:"

    .line 243
    .line 244
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    sget p2, Ll/fnw;->j:I

    .line 248
    .line 249
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    invoke-static {v0, p1}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    .line 258
    .line 259
    new-instance p1, Ll/fnw$a;

    .line 260
    .line 261
    invoke-direct {p1, p0}, Ll/fnw$a;-><init>(Ll/fnw;)V

    .line 262
    .line 263
    .line 264
    iput-object p1, p0, Ll/fnw;->b:Ll/fnw$a;

    .line 265
    .line 266
    iget-object p2, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 267
    .line 268
    invoke-virtual {p2, p1}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnPreparedListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;)V

    .line 269
    .line 270
    .line 271
    iget-object p1, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 272
    .line 273
    iget-object p2, p0, Ll/fnw;->b:Ll/fnw$a;

    .line 274
    .line 275
    invoke-virtual {p1, p2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnCompletionListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;)V

    .line 276
    .line 277
    .line 278
    iget-object p1, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 279
    .line 280
    iget-object p2, p0, Ll/fnw;->b:Ll/fnw$a;

    .line 281
    .line 282
    invoke-virtual {p1, p2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnVideoSizeChangedListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;)V

    .line 283
    .line 284
    .line 285
    iget-object p1, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 286
    .line 287
    iget-object p2, p0, Ll/fnw;->b:Ll/fnw$a;

    .line 288
    .line 289
    invoke-virtual {p1, p2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnErrorListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;)V

    .line 290
    .line 291
    .line 292
    iget-object p1, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 293
    .line 294
    iget-object p2, p0, Ll/fnw;->b:Ll/fnw$a;

    .line 295
    .line 296
    invoke-virtual {p1, p2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnSeekCompleteListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;)V

    .line 297
    .line 298
    .line 299
    iget-object p1, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 300
    .line 301
    iget-object p2, p0, Ll/fnw;->b:Ll/fnw$a;

    .line 302
    .line 303
    invoke-virtual {p1, p2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnInfoListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnInfoListener;)V

    .line 304
    .line 305
    .line 306
    iget-object p1, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 307
    .line 308
    iget-object p2, p0, Ll/fnw;->b:Ll/fnw$a;

    .line 309
    .line 310
    invoke-virtual {p1, p2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnBufferingUpdateListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;)V

    .line 311
    .line 312
    .line 313
    iget-object p1, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 314
    .line 315
    iget-object p2, p0, Ll/fnw;->b:Ll/fnw$a;

    .line 316
    .line 317
    invoke-virtual {p1, p2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnVideoMediacodecChangedListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnVideoMediacodecChangedListener;)V

    .line 318
    .line 319
    .line 320
    iget-object p1, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 321
    .line 322
    iget-object p2, p0, Ll/fnw;->b:Ll/fnw$a;

    .line 323
    .line 324
    invoke-virtual {p1, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDataCallback(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;)V

    .line 325
    .line 326
    .line 327
    iget-object p1, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 328
    .line 329
    iget-object p0, p0, Ll/fnw;->b:Ll/fnw$a;

    .line 330
    .line 331
    invoke-virtual {p1, p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setJsonDataCallback(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$JsonDateCallback;)V

    .line 332
    .line 333
    .line 334
    return-void
.end method

.method public static synthetic a(Ll/fnw;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/fnw;Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;)Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fnw;->c:Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic c(Ll/fnw;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fnw;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ll/fnw;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fnw;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Ll/fnw;)Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fnw;->h:Landroid/view/Surface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Ll/fnw;)Landroid/view/SurfaceHolder;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fnw;->i:Landroid/view/SurfaceHolder;

    .line 2
    .line 3
    return-object p0
.end method

.method private g(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fnw;->d:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getAppVersion()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Ll/fnw;->d:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getAppid()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/arx;->h(Ljava/lang/String;)Ll/arx$d;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, v0, Ll/arx$d;->e:Ll/bsx;

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    new-instance v0, Ll/bsx;

    .line 37
    .line 38
    invoke-direct {v0}, Ll/bsx;-><init>()V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    new-instance v0, Ll/bsx;

    .line 43
    .line 44
    invoke-direct {v0}, Ll/bsx;-><init>()V

    .line 45
    .line 46
    .line 47
    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-nez v1, :cond_2

    .line 52
    .line 53
    invoke-static {}, Ll/vnk0;->a()Ll/vnk0;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v1, p1}, Ll/vnk0;->b(Ljava/lang/String;)Ll/bsx;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget v1, p1, Ll/bsx;->F0:I

    .line 62
    .line 63
    iput v1, v0, Ll/bsx;->F0:I

    .line 64
    .line 65
    iget v1, p1, Ll/bsx;->G0:I

    .line 66
    .line 67
    iput v1, v0, Ll/bsx;->G0:I

    .line 68
    .line 69
    iget v1, p1, Ll/bsx;->H0:I

    .line 70
    .line 71
    iput v1, v0, Ll/bsx;->H0:I

    .line 72
    .line 73
    iget v1, p1, Ll/bsx;->I0:I

    .line 74
    .line 75
    iput v1, v0, Ll/bsx;->I0:I

    .line 76
    .line 77
    iget v1, p1, Ll/bsx;->J0:I

    .line 78
    .line 79
    iput v1, v0, Ll/bsx;->J0:I

    .line 80
    .line 81
    iget v1, p1, Ll/bsx;->K0:I

    .line 82
    .line 83
    iput v1, v0, Ll/bsx;->K0:I

    .line 84
    .line 85
    iget v1, p1, Ll/bsx;->L0:I

    .line 86
    .line 87
    iput v1, v0, Ll/bsx;->L0:I

    .line 88
    .line 89
    iget v1, p1, Ll/bsx;->M0:I

    .line 90
    .line 91
    iput v1, v0, Ll/bsx;->M0:I

    .line 92
    .line 93
    iget v1, p1, Ll/bsx;->N0:I

    .line 94
    .line 95
    iput v1, v0, Ll/bsx;->N0:I

    .line 96
    .line 97
    iget v1, p1, Ll/bsx;->O0:I

    .line 98
    .line 99
    iput v1, v0, Ll/bsx;->O0:I

    .line 100
    .line 101
    iget v1, p1, Ll/bsx;->P0:F

    .line 102
    .line 103
    iput v1, v0, Ll/bsx;->P0:F

    .line 104
    .line 105
    iget v1, p1, Ll/bsx;->R0:F

    .line 106
    .line 107
    iput v1, v0, Ll/bsx;->R0:F

    .line 108
    .line 109
    iget v1, p1, Ll/bsx;->U0:I

    .line 110
    .line 111
    iput v1, v0, Ll/bsx;->U0:I

    .line 112
    .line 113
    iget v1, p1, Ll/bsx;->W0:I

    .line 114
    .line 115
    iput v1, v0, Ll/bsx;->W0:I

    .line 116
    .line 117
    iget v1, p1, Ll/bsx;->X0:I

    .line 118
    .line 119
    iput v1, v0, Ll/bsx;->X0:I

    .line 120
    .line 121
    iget v1, p1, Ll/bsx;->Y0:I

    .line 122
    .line 123
    iput v1, v0, Ll/bsx;->Y0:I

    .line 124
    .line 125
    iget v1, p1, Ll/bsx;->Z0:I

    .line 126
    .line 127
    iput v1, v0, Ll/bsx;->Z0:I

    .line 128
    .line 129
    iget v1, p1, Ll/bsx;->a1:F

    .line 130
    .line 131
    iput v1, v0, Ll/bsx;->a1:F

    .line 132
    .line 133
    iget v1, p1, Ll/bsx;->b1:I

    .line 134
    .line 135
    iput v1, v0, Ll/bsx;->b1:I

    .line 136
    .line 137
    iget v1, p1, Ll/bsx;->c1:I

    .line 138
    .line 139
    iput v1, v0, Ll/bsx;->c1:I

    .line 140
    .line 141
    iget v1, p1, Ll/bsx;->d1:I

    .line 142
    .line 143
    iput v1, v0, Ll/bsx;->d1:I

    .line 144
    .line 145
    iget v1, p1, Ll/bsx;->e1:I

    .line 146
    .line 147
    iput v1, v0, Ll/bsx;->e1:I

    .line 148
    .line 149
    iget v1, p1, Ll/bsx;->f1:I

    .line 150
    .line 151
    iput v1, v0, Ll/bsx;->f1:I

    .line 152
    .line 153
    iget v1, p1, Ll/bsx;->g1:I

    .line 154
    .line 155
    iput v1, v0, Ll/bsx;->g1:I

    .line 156
    .line 157
    iget v1, p1, Ll/bsx;->h1:F

    .line 158
    .line 159
    iput v1, v0, Ll/bsx;->h1:F

    .line 160
    .line 161
    iget v1, p1, Ll/bsx;->i1:F

    .line 162
    .line 163
    iput v1, v0, Ll/bsx;->i1:F

    .line 164
    .line 165
    iget v1, p1, Ll/bsx;->j1:F

    .line 166
    .line 167
    iput v1, v0, Ll/bsx;->j1:F

    .line 168
    .line 169
    iget v1, p1, Ll/bsx;->k1:F

    .line 170
    .line 171
    iput v1, v0, Ll/bsx;->k1:F

    .line 172
    .line 173
    iget p1, p1, Ll/bsx;->l1:F

    .line 174
    .line 175
    iput p1, v0, Ll/bsx;->l1:F

    .line 176
    .line 177
    :cond_2
    iget-object p0, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 178
    .line 179
    if-eqz p0, :cond_3

    .line 180
    .line 181
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->applyMediaConfig(Ll/bsx;)V

    .line 182
    .line 183
    .line 184
    :cond_3
    return-void
.end method

.method private static j()Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    return v0
.end method


# virtual methods
.method public h()Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;
    .locals 2

    .line 1
    const-string v0, "MMLivePlayer"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->isPlaying()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;->MMLivePlayerStatusPlaying:Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    iget-object p0, p0, Ll/fnw;->c:Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;

    .line 22
    .line 23
    return-object p0
.end method

.method public i()Ltv/danmaku/ijk/media/player/PullWatchInfo;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/fnw;->e:Ltv/danmaku/ijk/media/player/PullWatchInfo;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getPullWatchInfo(Ltv/danmaku/ijk/media/player/PullWatchInfo;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, Ll/fnw;->e:Ltv/danmaku/ijk/media/player/PullWatchInfo;

    .line 11
    .line 12
    return-object p0
.end method

.method public k()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 10
    .line 11
    sget p0, Ll/fnw;->j:I

    .line 12
    .line 13
    add-int/lit8 p0, p0, -0x1

    .line 14
    .line 15
    sput p0, Ll/fnw;->j:I

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public l(Z)V
    .locals 3

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    const-string v1, "MMLivePlayer"

    .line 4
    .line 5
    invoke-static {v1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 17
    .line 18
    :goto_0
    invoke-virtual {v0, p1, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setVolume(FF)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v2, "setMute: value: "

    .line 24
    .line 25
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 32
    .line 33
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p0, ", count:"

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    sget p0, Ll/fnw;->j:I

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {v1, p0}, Ll/esx;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public m(Ll/dnw;)V
    .locals 2

    .line 1
    const-string v0, "MMLivePlayer"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/fnw;->b:Ll/fnw$a;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/fnw$a;->a(Ll/dnw;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public n(Landroid/view/Surface;)V
    .locals 3

    .line 1
    const-string v0, "MMLivePlayer"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Ll/fnw;->h:Landroid/view/Surface;

    .line 9
    .line 10
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v2, "setPlayerView surface:"

    .line 17
    .line 18
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {v0, p1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 36
    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    iget-object p0, p0, Ll/fnw;->h:Landroid/view/Surface;

    .line 40
    .line 41
    invoke-virtual {p1, p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public o(Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;)V
    .locals 5

    .line 1
    const-string v0, "MMLivePlayer"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v2, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v3, "MMLivePlayerConfig"

    .line 15
    .line 16
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v0, v2}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    :try_start_0
    iget-object v0, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 38
    .line 39
    if-eqz v0, :cond_4

    .line 40
    .line 41
    iget-object v0, p1, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->mode:Lcom/immomo/momomediaext/utils/MMLivePlayerConfig$MMLivePlayerMode;

    .line 42
    .line 43
    sget-object v2, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig$MMLivePlayerMode;->MMLivePlayerModeLive:Lcom/immomo/momomediaext/utils/MMLivePlayerConfig$MMLivePlayerMode;

    .line 44
    .line 45
    if-ne v0, v2, :cond_0

    .line 46
    .line 47
    iget-object v0, p1, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->mediaConfig:Ljava/lang/String;

    .line 48
    .line 49
    invoke-direct {p0, v0}, Ll/fnw;->g(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    iget-object v0, p0, Ll/fnw;->d:Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 53
    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    iget-object v2, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;->getRoomid()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v3, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    iget-object v4, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 68
    .line 69
    invoke-virtual {v4}, Ljava/lang/Object;->hashCode()I

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    iget v3, p1, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->cdnType:I

    .line 84
    .line 85
    invoke-virtual {v2, v0, v1, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setLogRoomInfos(Ljava/lang/String;Ljava/lang/String;I)V

    .line 86
    .line 87
    .line 88
    :cond_1
    iget-object v0, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 89
    .line 90
    iget v1, p1, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->businessType:I

    .line 91
    .line 92
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setBusinessType(I)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 96
    .line 97
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getHardDecoderFlagFromMediaConfig()Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaCodecEnabled(Z)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p1, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->ipv6Url:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    const-string v1, "startPlay"

    .line 111
    .line 112
    if-nez v0, :cond_2

    .line 113
    .line 114
    :try_start_1
    iget-object v0, p1, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->ipv6Url:Ljava/lang/String;

    .line 115
    .line 116
    iput-object v0, p0, Ll/fnw;->f:Ljava/lang/String;

    .line 117
    .line 118
    iget-object v0, p1, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->url:Ljava/lang/String;

    .line 119
    .line 120
    iput-object v0, p0, Ll/fnw;->g:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    const-string v2, "setDataSource ipv6, ipv4"

    .line 127
    .line 128
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 136
    .line 137
    iget-object v1, p1, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->ipv6Url:Ljava/lang/String;

    .line 138
    .line 139
    iget-object p1, p1, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->url:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {v0, v1, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setDataSource(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    goto :goto_0

    .line 145
    :cond_2
    iget-object v0, p1, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->url:Ljava/lang/String;

    .line 146
    .line 147
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-nez v0, :cond_3

    .line 152
    .line 153
    const/4 v0, 0x0

    .line 154
    iput-object v0, p0, Ll/fnw;->f:Ljava/lang/String;

    .line 155
    .line 156
    iput-object v0, p0, Ll/fnw;->g:Ljava/lang/String;

    .line 157
    .line 158
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    const-string v2, "setDataSource  ipv4"

    .line 163
    .line 164
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 169
    .line 170
    .line 171
    iget-object v0, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 172
    .line 173
    iget-object p1, p1, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->url:Ljava/lang/String;

    .line 174
    .line 175
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    goto :goto_0

    .line 179
    :cond_3
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    const-string v0, "MMLivePlayerConfig url or ipv6 is empty"

    .line 184
    .line 185
    sget-object v2, Lcom/immomo/medialog/LogLevel;->ERROR:Lcom/immomo/medialog/LogLevel;

    .line 186
    .line 187
    invoke-virtual {p1, v1, v0, v2}, Ll/b7y;->a(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/medialog/LogLevel;)V

    .line 188
    .line 189
    .line 190
    :goto_0
    iget-object p1, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 191
    .line 192
    const/4 v0, 0x1

    .line 193
    invoke-virtual {p1, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setScreenOnWhilePlaying(Z)V

    .line 194
    .line 195
    .line 196
    iget-object p1, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 197
    .line 198
    const/16 v0, 0x4e38

    .line 199
    .line 200
    const-wide/32 v1, 0xac44

    .line 201
    .line 202
    .line 203
    invoke-virtual {p1, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 204
    .line 205
    .line 206
    iget-object p1, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 207
    .line 208
    const/16 v0, 0x4e36

    .line 209
    .line 210
    const-wide/16 v1, 0x2

    .line 211
    .line 212
    invoke-virtual {p1, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 213
    .line 214
    .line 215
    iget-object p1, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 216
    .line 217
    const/16 v0, 0x4e37

    .line 218
    .line 219
    const-wide/16 v1, 0x3

    .line 220
    .line 221
    invoke-virtual {p1, v0, v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 222
    .line 223
    .line 224
    iget-object p0, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 225
    .line 226
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->prepareAsync()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 227
    .line 228
    .line 229
    :cond_4
    return-void

    .line 230
    :catch_0
    move-exception p0

    .line 231
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 232
    .line 233
    .line 234
    return-void
.end method

.method public p()V
    .locals 2

    .line 1
    const-string v0, "MMLivePlayer"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->stop()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/fnw;->a:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getCurrentUrlInfo()Ll/p4k0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {}, Ll/qj20;->f()Ll/qj20;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-virtual {v0, p0, v1, v1}, Ll/qj20;->r(Ll/p4k0;ZZ)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method
