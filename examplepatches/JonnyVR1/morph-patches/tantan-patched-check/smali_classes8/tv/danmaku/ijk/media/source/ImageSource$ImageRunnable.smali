.class Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltv/danmaku/ijk/media/source/ImageSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ImageRunnable"
.end annotation


# instance fields
.field private volatile a:Z

.field private b:Ltv/danmaku/ijk/media/streamer/MomoSurface;

.field private c:Landroid/graphics/Bitmap;

.field private d:Z

.field private e:Lcom/immomo/mediacore/strinf/NotifyCenter;

.field private f:Ljava/lang/Object;

.field private g:I

.field private h:I

.field private i:I

.field private j:I

.field private k:I

.field private l:[Landroid/graphics/Bitmap;

.field private m:I

.field private n:I

.field final synthetic o:Ltv/danmaku/ijk/media/source/ImageSource;


# direct methods
.method private constructor <init>(Ltv/danmaku/ijk/media/source/ImageSource;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->o:Ltv/danmaku/ijk/media/source/ImageSource;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->a:Z

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->b:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 11
    .line 12
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->c:Landroid/graphics/Bitmap;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->d:Z

    .line 16
    .line 17
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 18
    .line 19
    new-instance v0, Ljava/lang/Object;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->f:Ljava/lang/Object;

    .line 25
    .line 26
    const/4 v0, -0x1

    .line 27
    iput v0, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->g:I

    .line 28
    .line 29
    iput v0, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->h:I

    .line 30
    .line 31
    iput v0, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->i:I

    .line 32
    .line 33
    iput v0, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->j:I

    .line 34
    .line 35
    iput p1, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->k:I

    .line 36
    .line 37
    const/16 v0, 0xa

    .line 38
    .line 39
    new-array v0, v0, [Landroid/graphics/Bitmap;

    .line 40
    .line 41
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->l:[Landroid/graphics/Bitmap;

    .line 42
    .line 43
    iput p1, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->m:I

    .line 44
    .line 45
    const/16 p1, 0x32

    .line 46
    .line 47
    iput p1, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->n:I

    .line 48
    .line 49
    return-void
.end method

.method public synthetic constructor <init>(Ltv/danmaku/ijk/media/source/ImageSource;Ltv/danmaku/ijk/media/source/ImageSource$1;)V
    .locals 0

    .line 50
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;-><init>(Ltv/danmaku/ijk/media/source/ImageSource;)V

    return-void
.end method

.method public static synthetic a(Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->d(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private b(Landroid/graphics/Bitmap;I)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    new-instance v3, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v4, "--------imageRunning: begin, input:["

    .line 14
    .line 15
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v4, ","

    .line 22
    .line 23
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v5, "], "

    .line 30
    .line 31
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    move-object/from16 v5, p1

    .line 35
    .line 36
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v5, "<--"

    .line 40
    .line 41
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget-object v5, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->c:Landroid/graphics/Bitmap;

    .line 45
    .line 46
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    const-string v5, "ImageStream"

    .line 54
    .line 55
    invoke-static {v5, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    iget v3, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->k:I

    .line 59
    .line 60
    const/4 v6, 0x1

    .line 61
    if-ne v3, v6, :cond_0

    .line 62
    .line 63
    iget v3, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->i:I

    .line 64
    .line 65
    iget v7, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->j:I

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    const/16 v3, 0x500

    .line 69
    .line 70
    if-lt v1, v2, :cond_1

    .line 71
    .line 72
    if-le v1, v3, :cond_2

    .line 73
    .line 74
    iget-object v7, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->o:Ltv/danmaku/ijk/media/source/ImageSource;

    .line 75
    .line 76
    invoke-static {v7, v1, v2, v3}, Ltv/danmaku/ijk/media/source/ImageSource;->S(Ltv/danmaku/ijk/media/source/ImageSource;III)I

    .line 77
    .line 78
    .line 79
    move-result v7

    .line 80
    goto :goto_0

    .line 81
    :cond_1
    if-le v2, v3, :cond_2

    .line 82
    .line 83
    iget-object v7, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->o:Ltv/danmaku/ijk/media/source/ImageSource;

    .line 84
    .line 85
    invoke-static {v7, v1, v2, v3}, Ltv/danmaku/ijk/media/source/ImageSource;->T(Ltv/danmaku/ijk/media/source/ImageSource;III)I

    .line 86
    .line 87
    .line 88
    move-result v7

    .line 89
    move/from16 v16, v7

    .line 90
    .line 91
    move v7, v3

    .line 92
    move/from16 v3, v16

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    move v3, v1

    .line 96
    move v7, v2

    .line 97
    :goto_0
    iget-object v8, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->o:Ltv/danmaku/ijk/media/source/ImageSource;

    .line 98
    .line 99
    invoke-static {v8, v3}, Ltv/danmaku/ijk/media/source/ImageSource;->U(Ltv/danmaku/ijk/media/source/ImageSource;I)I

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    iget-object v8, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->o:Ltv/danmaku/ijk/media/source/ImageSource;

    .line 104
    .line 105
    invoke-static {v8, v7}, Ltv/danmaku/ijk/media/source/ImageSource;->V(Ltv/danmaku/ijk/media/source/ImageSource;I)I

    .line 106
    .line 107
    .line 108
    move-result v7

    .line 109
    new-instance v8, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    const-string v9, "-----imageRunning: normal["

    .line 112
    .line 113
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    const-string v9, ", "

    .line 120
    .line 121
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const-string v9, "]<----old["

    .line 128
    .line 129
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    iget v9, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->i:I

    .line 133
    .line 134
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    iget v9, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->j:I

    .line 141
    .line 142
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    const-string v9, "]"

    .line 146
    .line 147
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v8

    .line 154
    invoke-static {v5, v8}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    .line 156
    .line 157
    iget v8, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->i:I

    .line 158
    .line 159
    if-ne v3, v8, :cond_4

    .line 160
    .line 161
    iget v8, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->j:I

    .line 162
    .line 163
    if-eq v7, v8, :cond_3

    .line 164
    .line 165
    goto :goto_1

    .line 166
    :cond_3
    const/4 v6, 0x0

    .line 167
    :cond_4
    :goto_1
    iput v3, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->i:I

    .line 168
    .line 169
    iput v7, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->j:I

    .line 170
    .line 171
    iget-object v8, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->o:Ltv/danmaku/ijk/media/source/ImageSource;

    .line 172
    .line 173
    iget-object v8, v8, Ltv/danmaku/ijk/media/source/ImageSource;->e:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 174
    .line 175
    iput v3, v8, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 176
    .line 177
    iput v7, v8, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 178
    .line 179
    iget v3, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->h:I

    .line 180
    .line 181
    if-ne v3, v2, :cond_5

    .line 182
    .line 183
    iget v3, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->g:I

    .line 184
    .line 185
    if-ne v3, v1, :cond_5

    .line 186
    .line 187
    if-eqz v6, :cond_6

    .line 188
    .line 189
    :cond_5
    iput v2, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->h:I

    .line 190
    .line 191
    iput v1, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->g:I

    .line 192
    .line 193
    new-instance v1, Ljava/lang/StringBuilder;

    .line 194
    .line 195
    const-string v2, "-----imageRunning: updateCamera, ["

    .line 196
    .line 197
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    iget v2, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->g:I

    .line 201
    .line 202
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    iget v2, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->h:I

    .line 209
    .line 210
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    const-string v2, "]--->["

    .line 214
    .line 215
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    iget v2, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->i:I

    .line 219
    .line 220
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    iget v2, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->j:I

    .line 227
    .line 228
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    invoke-static {v5, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    .line 240
    .line 241
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->b:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 242
    .line 243
    iget-object v2, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->o:Ltv/danmaku/ijk/media/source/ImageSource;

    .line 244
    .line 245
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/ImageSource;->e:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 246
    .line 247
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Y0(Lcom/immomo/mediacore/strinf/VideoQuality;)V

    .line 248
    .line 249
    .line 250
    iget-object v7, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->b:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 251
    .line 252
    iget v8, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->g:I

    .line 253
    .line 254
    iget v9, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->h:I

    .line 255
    .line 256
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->o:Ltv/danmaku/ijk/media/source/ImageSource;

    .line 257
    .line 258
    invoke-static {v1}, Ltv/danmaku/ijk/media/source/ImageSource;->W(Ltv/danmaku/ijk/media/source/ImageSource;)I

    .line 259
    .line 260
    .line 261
    move-result v12

    .line 262
    iget v14, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->i:I

    .line 263
    .line 264
    iget v15, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->j:I

    .line 265
    .line 266
    const/4 v10, 0x0

    .line 267
    const/4 v11, 0x0

    .line 268
    const/4 v13, 0x1

    .line 269
    invoke-virtual/range {v7 .. v15}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->e1(IIZIIIII)V

    .line 270
    .line 271
    .line 272
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 273
    .line 274
    invoke-interface {v1}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notifyUpdateResolution()V

    .line 275
    .line 276
    .line 277
    if-eqz v6, :cond_6

    .line 278
    .line 279
    new-instance v1, Ljava/lang/StringBuilder;

    .line 280
    .line 281
    const-string v2, "-----imageRunning: notifyResumeRecording, "

    .line 282
    .line 283
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    iget-object v2, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->o:Ltv/danmaku/ijk/media/source/ImageSource;

    .line 287
    .line 288
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/ImageSource;->e:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 289
    .line 290
    iget v2, v2, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 291
    .line 292
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 293
    .line 294
    .line 295
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 296
    .line 297
    .line 298
    iget-object v2, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->o:Ltv/danmaku/ijk/media/source/ImageSource;

    .line 299
    .line 300
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/ImageSource;->e:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 301
    .line 302
    iget v2, v2, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 303
    .line 304
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    invoke-static {v5, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 312
    .line 313
    .line 314
    iget-object v0, v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 315
    .line 316
    invoke-interface {v0}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notifyResumeRecording()V

    .line 317
    .line 318
    .line 319
    :cond_6
    const-string v0, "-----imageRunning: end"

    .line 320
    .line 321
    invoke-static {v5, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    .line 323
    .line 324
    return-void
.end method

.method private d(I)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->n:I

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->a:Z

    .line 3
    .line 4
    return-void
.end method

.method public e(Ltv/danmaku/ijk/media/streamer/MomoSurface;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->b:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->c:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move v1, v0

    .line 8
    :goto_0
    const/16 v2, 0xa

    .line 9
    .line 10
    if-ge v1, v2, :cond_0

    .line 11
    .line 12
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->l:[Landroid/graphics/Bitmap;

    .line 13
    .line 14
    aput-object p1, v2, v1

    .line 15
    .line 16
    add-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iput v0, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->m:I

    .line 20
    .line 21
    const/4 p1, -0x1

    .line 22
    iput p1, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->g:I

    .line 23
    .line 24
    iput p1, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->h:I

    .line 25
    .line 26
    iput p1, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->i:I

    .line 27
    .line 28
    iput p1, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->j:I

    .line 29
    .line 30
    return-void
.end method

.method public f(Lcom/immomo/mediacore/strinf/NotifyCenter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->e:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 2
    .line 3
    return-void
.end method

.method public g(II)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->i:I

    .line 2
    .line 3
    iput p2, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->j:I

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    iput p1, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->k:I

    .line 7
    .line 8
    return-void
.end method

.method public h(Landroid/graphics/Bitmap;IZ)V
    .locals 4

    .line 1
    const-string p2, "----running update: end  "

    .line 2
    .line 3
    const-string v0, "----running update: begin "

    .line 4
    .line 5
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->f:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    const-string v2, "ImageStream"

    .line 9
    .line 10
    new-instance v3, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget v0, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->m:I

    .line 16
    .line 17
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v0, ","

    .line 21
    .line 22
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v2, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    if-eqz p3, :cond_0

    .line 37
    .line 38
    iget-object p3, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->l:[Landroid/graphics/Bitmap;

    .line 39
    .line 40
    const/4 v2, 0x0

    .line 41
    aput-object p1, p3, v2

    .line 42
    .line 43
    iput v0, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->m:I

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception p0

    .line 47
    goto :goto_1

    .line 48
    :cond_0
    iget p3, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->m:I

    .line 49
    .line 50
    const/16 v2, 0xa

    .line 51
    .line 52
    if-ge p3, v2, :cond_1

    .line 53
    .line 54
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->l:[Landroid/graphics/Bitmap;

    .line 55
    .line 56
    aput-object p1, v2, p3

    .line 57
    .line 58
    add-int/2addr p3, v0

    .line 59
    iput p3, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->m:I

    .line 60
    .line 61
    :cond_1
    :goto_0
    const-string p1, "ImageStream"

    .line 62
    .line 63
    new-instance p3, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {p3, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    iget p0, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->m:I

    .line 69
    .line 70
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-static {p1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    monitor-exit v1

    .line 81
    return-void

    .line 82
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 83
    throw p0
.end method

.method public run()V
    .locals 8

    .line 1
    :goto_0
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "ImageStream"

    .line 6
    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "----image frame runnable:"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->a:Z

    .line 15
    .line 16
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v0, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    const-string p0, "ImageStream"

    .line 27
    .line 28
    const-string v0, "----image runnable thread exit success"

    .line 29
    .line 30
    invoke-static {p0, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    :try_start_0
    iget v0, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->n:I

    .line 35
    .line 36
    int-to-long v0, v0

    .line 37
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :catch_0
    move-exception v0

    .line 42
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 43
    .line 44
    .line 45
    :goto_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->f:Ljava/lang/Object;

    .line 46
    .line 47
    monitor-enter v0

    .line 48
    :try_start_1
    iget v1, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->m:I

    .line 49
    .line 50
    if-lez v1, :cond_5

    .line 51
    .line 52
    add-int/lit8 v1, v1, -0x1

    .line 53
    .line 54
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->l:[Landroid/graphics/Bitmap;

    .line 55
    .line 56
    aget-object v2, v2, v1

    .line 57
    .line 58
    iput-object v2, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->c:Landroid/graphics/Bitmap;

    .line 59
    .line 60
    const/4 v3, 0x0

    .line 61
    const/4 v4, 0x1

    .line 62
    if-eqz v2, :cond_2

    .line 63
    .line 64
    const-string v2, "ImageStream"

    .line 65
    .line 66
    new-instance v5, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    const-string v6, "----running run "

    .line 72
    .line 73
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    iget-object v6, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->c:Landroid/graphics/Bitmap;

    .line 77
    .line 78
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v5

    .line 85
    invoke-static {v2, v5}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->c:Landroid/graphics/Bitmap;

    .line 89
    .line 90
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    if-nez v2, :cond_1

    .line 95
    .line 96
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->c:Landroid/graphics/Bitmap;

    .line 97
    .line 98
    invoke-direct {p0, v2, v3}, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->b(Landroid/graphics/Bitmap;I)V

    .line 99
    .line 100
    .line 101
    goto :goto_2

    .line 102
    :catchall_0
    move-exception p0

    .line 103
    goto :goto_4

    .line 104
    :cond_1
    :goto_2
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->b:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 105
    .line 106
    if-eqz v2, :cond_2

    .line 107
    .line 108
    iget v5, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->g:I

    .line 109
    .line 110
    iget v6, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->h:I

    .line 111
    .line 112
    iget-object v7, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->c:Landroid/graphics/Bitmap;

    .line 113
    .line 114
    invoke-virtual {v2, v5, v6, v7, v4}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->f1(IILandroid/graphics/Bitmap;Z)V

    .line 115
    .line 116
    .line 117
    :cond_2
    :goto_3
    if-ge v3, v1, :cond_4

    .line 118
    .line 119
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->l:[Landroid/graphics/Bitmap;

    .line 120
    .line 121
    aget-object v2, v2, v3

    .line 122
    .line 123
    if-eqz v2, :cond_3

    .line 124
    .line 125
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    if-nez v2, :cond_3

    .line 130
    .line 131
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->l:[Landroid/graphics/Bitmap;

    .line 132
    .line 133
    aget-object v2, v2, v3

    .line 134
    .line 135
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 136
    .line 137
    .line 138
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->l:[Landroid/graphics/Bitmap;

    .line 139
    .line 140
    const/4 v5, 0x0

    .line 141
    aput-object v5, v2, v3

    .line 142
    .line 143
    iget v2, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->m:I

    .line 144
    .line 145
    sub-int/2addr v2, v4

    .line 146
    iput v2, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->m:I

    .line 147
    .line 148
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 149
    .line 150
    goto :goto_3

    .line 151
    :cond_4
    const-string v1, "ImageStream"

    .line 152
    .line 153
    new-instance v2, Ljava/lang/StringBuilder;

    .line 154
    .line 155
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 156
    .line 157
    .line 158
    const-string v3, "----running run: end "

    .line 159
    .line 160
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    iget v3, p0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->m:I

    .line 164
    .line 165
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    invoke-static {v1, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    .line 174
    .line 175
    :cond_5
    monitor-exit v0

    .line 176
    goto/16 :goto_0

    .line 177
    .line 178
    :goto_4
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 179
    throw p0
.end method
