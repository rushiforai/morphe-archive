.class Lcom/immomo/moment/mediautils/g$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/moment/mediautils/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/moment/mediautils/g;


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v0, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 4
    .line 5
    iget v2, v0, Lcom/immomo/moment/mediautils/m;->f:I

    .line 6
    .line 7
    if-gtz v2, :cond_0

    .line 8
    .line 9
    iget v2, v0, Lcom/immomo/moment/mediautils/m;->c:I

    .line 10
    .line 11
    iput v2, v0, Lcom/immomo/moment/mediautils/m;->f:I

    .line 12
    .line 13
    :cond_0
    iget v2, v0, Lcom/immomo/moment/mediautils/m;->h:I

    .line 14
    .line 15
    if-gtz v2, :cond_1

    .line 16
    .line 17
    iget v2, v0, Lcom/immomo/moment/mediautils/m;->e:I

    .line 18
    .line 19
    iput v2, v0, Lcom/immomo/moment/mediautils/m;->h:I

    .line 20
    .line 21
    :cond_1
    iget v2, v0, Lcom/immomo/moment/mediautils/m;->g:I

    .line 22
    .line 23
    if-gtz v2, :cond_2

    .line 24
    .line 25
    iget v2, v0, Lcom/immomo/moment/mediautils/m;->d:I

    .line 26
    .line 27
    iput v2, v0, Lcom/immomo/moment/mediautils/m;->g:I

    .line 28
    .line 29
    :cond_2
    iget-object v2, v0, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 30
    .line 31
    if-nez v2, :cond_3

    .line 32
    .line 33
    new-instance v2, Landroid/media/MediaFormat;

    .line 34
    .line 35
    invoke-direct {v2}, Landroid/media/MediaFormat;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v2, v0, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 39
    .line 40
    :cond_3
    iget-object v0, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 41
    .line 42
    iget-object v2, v0, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 43
    .line 44
    const-string v3, "channel-count"

    .line 45
    .line 46
    iget v0, v0, Lcom/immomo/moment/mediautils/m;->h:I

    .line 47
    .line 48
    invoke-virtual {v2, v3, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 52
    .line 53
    iget-object v2, v0, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 54
    .line 55
    const-string v3, "sample-rate"

    .line 56
    .line 57
    iget v0, v0, Lcom/immomo/moment/mediautils/m;->f:I

    .line 58
    .line 59
    invoke-virtual {v2, v3, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 63
    .line 64
    iget-object v2, v0, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 65
    .line 66
    const-string v3, "bit-width"

    .line 67
    .line 68
    iget v0, v0, Lcom/immomo/moment/mediautils/m;->g:I

    .line 69
    .line 70
    invoke-virtual {v2, v3, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 71
    .line 72
    .line 73
    iget-object v0, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 74
    .line 75
    iget-object v2, v0, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 76
    .line 77
    if-eqz v2, :cond_4

    .line 78
    .line 79
    iget-object v0, v0, Lcom/immomo/moment/mediautils/m;->A:Landroid/media/MediaFormat;

    .line 80
    .line 81
    invoke-interface {v2, v0}, Lcom/immomo/moment/mediautils/m$c;->d(Landroid/media/MediaFormat;)V

    .line 82
    .line 83
    .line 84
    :cond_4
    iget-object v0, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 85
    .line 86
    iget v2, v0, Lcom/immomo/moment/mediautils/m;->g:I

    .line 87
    .line 88
    mul-int/lit16 v2, v2, 0x400

    .line 89
    .line 90
    iget v0, v0, Lcom/immomo/moment/mediautils/m;->h:I

    .line 91
    .line 92
    mul-int/2addr v2, v0

    .line 93
    div-int/lit8 v2, v2, 0x8

    .line 94
    .line 95
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    iget-object v0, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 100
    .line 101
    iget-wide v3, v0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 102
    .line 103
    const-wide/16 v5, 0x0

    .line 104
    .line 105
    cmp-long v7, v3, v5

    .line 106
    .line 107
    if-ltz v7, :cond_6

    .line 108
    .line 109
    iget-wide v7, v0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 110
    .line 111
    cmp-long v9, v7, v5

    .line 112
    .line 113
    if-lez v9, :cond_6

    .line 114
    .line 115
    cmp-long v9, v7, v3

    .line 116
    .line 117
    if-lez v9, :cond_6

    .line 118
    .line 119
    sub-long/2addr v7, v3

    .line 120
    iget-wide v9, v0, Lcom/immomo/moment/mediautils/m;->m:J

    .line 121
    .line 122
    cmp-long v0, v7, v9

    .line 123
    .line 124
    if-lez v0, :cond_5

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_5
    add-long v9, v7, v3

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_6
    iget-wide v9, v0, Lcom/immomo/moment/mediautils/m;->m:J

    .line 131
    .line 132
    move-wide v3, v5

    .line 133
    :goto_0
    iget-object v0, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 134
    .line 135
    invoke-static {v0}, Lcom/immomo/moment/mediautils/g;->D(Lcom/immomo/moment/mediautils/g;)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    const/4 v7, 0x1

    .line 140
    if-nez v0, :cond_e

    .line 141
    .line 142
    iget-object v0, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 143
    .line 144
    invoke-static {v0}, Lcom/immomo/moment/mediautils/g;->E(Lcom/immomo/moment/mediautils/g;)Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    const-wide/16 v11, 0x5

    .line 149
    .line 150
    if-nez v0, :cond_c

    .line 151
    .line 152
    iget-object v0, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 153
    .line 154
    invoke-static {v0}, Lcom/immomo/moment/mediautils/g;->N(Lcom/immomo/moment/mediautils/g;)J

    .line 155
    .line 156
    .line 157
    move-result-wide v13

    .line 158
    iget-object v0, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 159
    .line 160
    invoke-static {v0}, Lcom/immomo/moment/mediautils/g;->P(Lcom/immomo/moment/mediautils/g;)J

    .line 161
    .line 162
    .line 163
    move-result-wide v15

    .line 164
    sub-long/2addr v13, v15

    .line 165
    const-wide/16 v15, 0x7530

    .line 166
    .line 167
    cmp-long v0, v13, v15

    .line 168
    .line 169
    if-lez v0, :cond_7

    .line 170
    .line 171
    goto :goto_1

    .line 172
    :cond_7
    cmp-long v0, v3, v9

    .line 173
    .line 174
    iget-object v8, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 175
    .line 176
    if-lez v0, :cond_a

    .line 177
    .line 178
    iget-boolean v0, v8, Lcom/immomo/moment/mediautils/m;->s:Z

    .line 179
    .line 180
    if-eqz v0, :cond_8

    .line 181
    .line 182
    goto :goto_2

    .line 183
    :cond_8
    iget-object v0, v8, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 184
    .line 185
    if-eqz v0, :cond_9

    .line 186
    .line 187
    invoke-static {v8}, Lcom/immomo/moment/mediautils/g;->R(Lcom/immomo/moment/mediautils/g;)Z

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    if-nez v0, :cond_9

    .line 192
    .line 193
    iget-object v0, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 194
    .line 195
    iget-object v0, v0, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 196
    .line 197
    invoke-interface {v0}, Lcom/immomo/moment/mediautils/m$c;->c()V

    .line 198
    .line 199
    .line 200
    iget-object v0, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 201
    .line 202
    invoke-static {v0, v7}, Lcom/immomo/moment/mediautils/g;->S(Lcom/immomo/moment/mediautils/g;Z)Z

    .line 203
    .line 204
    .line 205
    :cond_9
    :try_start_0
    invoke-static {v11, v12}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 206
    .line 207
    .line 208
    goto :goto_0

    .line 209
    :catch_0
    move-exception v0

    .line 210
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 211
    .line 212
    .line 213
    goto :goto_0

    .line 214
    :cond_a
    iget-object v0, v8, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 215
    .line 216
    if-eqz v0, :cond_b

    .line 217
    .line 218
    const/4 v0, 0x0

    .line 219
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 220
    .line 221
    .line 222
    iget-object v0, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 223
    .line 224
    iget-object v0, v0, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 225
    .line 226
    invoke-virtual {v2}, Ljava/nio/Buffer;->capacity()I

    .line 227
    .line 228
    .line 229
    move-result v7

    .line 230
    invoke-interface {v0, v2, v7, v3, v4}, Lcom/immomo/moment/mediautils/m$c;->e(Ljava/nio/ByteBuffer;IJ)V

    .line 231
    .line 232
    .line 233
    :cond_b
    long-to-double v3, v3

    .line 234
    iget-object v0, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 235
    .line 236
    iget v7, v0, Lcom/immomo/moment/mediautils/m;->f:I

    .line 237
    .line 238
    int-to-double v7, v7

    .line 239
    const-wide/high16 v11, 0x4090000000000000L    # 1024.0

    .line 240
    .line 241
    div-double/2addr v11, v7

    .line 242
    const-wide v7, 0x412e848000000000L    # 1000000.0

    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    mul-double/2addr v11, v7

    .line 248
    add-double/2addr v3, v11

    .line 249
    double-to-long v3, v3

    .line 250
    invoke-static {v0, v3, v4}, Lcom/immomo/moment/mediautils/g;->O(Lcom/immomo/moment/mediautils/g;J)J

    .line 251
    .line 252
    .line 253
    goto :goto_0

    .line 254
    :cond_c
    :goto_1
    iget-object v0, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 255
    .line 256
    invoke-static {v0}, Lcom/immomo/moment/mediautils/g;->E(Lcom/immomo/moment/mediautils/g;)Z

    .line 257
    .line 258
    .line 259
    move-result v0

    .line 260
    if-eqz v0, :cond_d

    .line 261
    .line 262
    move-wide v3, v5

    .line 263
    :cond_d
    :try_start_1
    invoke-static {v11, v12}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 264
    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :catch_1
    move-exception v0

    .line 269
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 270
    .line 271
    .line 272
    goto/16 :goto_0

    .line 273
    .line 274
    :cond_e
    :goto_2
    iget-object v0, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 275
    .line 276
    iget-object v2, v0, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 277
    .line 278
    if-eqz v2, :cond_10

    .line 279
    .line 280
    invoke-static {v0}, Lcom/immomo/moment/mediautils/g;->T(Lcom/immomo/moment/mediautils/g;)Z

    .line 281
    .line 282
    .line 283
    move-result v0

    .line 284
    if-eqz v0, :cond_10

    .line 285
    .line 286
    iget-object v0, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 287
    .line 288
    invoke-static {v0}, Lcom/immomo/moment/mediautils/g;->R(Lcom/immomo/moment/mediautils/g;)Z

    .line 289
    .line 290
    .line 291
    move-result v0

    .line 292
    if-nez v0, :cond_f

    .line 293
    .line 294
    iget-object v0, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 295
    .line 296
    iget-object v0, v0, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 297
    .line 298
    invoke-interface {v0}, Lcom/immomo/moment/mediautils/m$c;->c()V

    .line 299
    .line 300
    .line 301
    iget-object v0, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 302
    .line 303
    invoke-static {v0, v7}, Lcom/immomo/moment/mediautils/g;->S(Lcom/immomo/moment/mediautils/g;Z)Z

    .line 304
    .line 305
    .line 306
    :cond_f
    iget-object v0, v1, Lcom/immomo/moment/mediautils/g$a;->a:Lcom/immomo/moment/mediautils/g;

    .line 307
    .line 308
    iget-object v0, v0, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 309
    .line 310
    invoke-interface {v0}, Lcom/immomo/moment/mediautils/m$c;->a()V

    .line 311
    .line 312
    .line 313
    :cond_10
    return-void
.end method
