.class public final Ll/hbr0;
.super Ll/kwy0;
.source "SourceFile"

# interfaces
.implements Ll/mbr0;


# static fields
.field public static final B1:[I

.field public static C1:Z

.field public static D1:Z


# instance fields
.field public A1:Ll/ycr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final a1:Landroid/content/Context;

.field public final b1:Ll/zcr0;

.field public final c1:Ll/ucr0;

.field public final d1:Z

.field public final e1:Ll/nbr0;

.field public final f1:Ll/lbr0;

.field public g1:Ll/gbr0;

.field public h1:Z

.field public i1:Z

.field public j1:Landroid/view/Surface;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public k1:Lcom/google/android/gms/internal/ads/zzaak;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public l1:Z

.field public m1:I

.field public n1:J

.field public o1:I

.field public p1:I

.field public q1:I

.field public r1:J

.field public s1:I

.field public t1:J

.field public u1:Ll/aou0;

.field public v1:Ll/aou0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public w1:Z

.field public x1:Z

.field public y1:I

.field public z1:Ll/kbr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x9

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/hbr0;->B1:[I

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 4
        0x780
        0x640
        0x5a0
        0x500
        0x3c0
        0x356
        0x280
        0x21c
        0x1e0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Ll/zvy0;Ll/dxy0;JZLandroid/os/Handler;Ll/vcr0;IF)V
    .locals 6
    .param p7    # Landroid/os/Handler;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # Ll/vcr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v4, 0x0

    .line 2
    const/high16 v5, 0x41f00000    # 30.0f

    .line 3
    .line 4
    const/4 v1, 0x2

    .line 5
    move-object v0, p0

    .line 6
    move-object v2, p2

    .line 7
    move-object v3, p3

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/kwy0;-><init>(ILl/zvy0;Ll/dxy0;ZF)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/hbr0;->a1:Landroid/content/Context;

    .line 16
    .line 17
    new-instance p2, Ll/ucr0;

    .line 18
    .line 19
    invoke-direct {p2, p7, p8}, Ll/ucr0;-><init>(Landroid/os/Handler;Ll/vcr0;)V

    .line 20
    .line 21
    .line 22
    iput-object p2, p0, Ll/hbr0;->c1:Ll/ucr0;

    .line 23
    .line 24
    new-instance p2, Ll/i7z0;

    .line 25
    .line 26
    invoke-direct {p2, p1}, Ll/i7z0;-><init>(Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    new-instance p3, Ll/nbr0;

    .line 30
    .line 31
    const-wide/16 p4, 0x0

    .line 32
    .line 33
    invoke-direct {p3, p1, p0, p4, p5}, Ll/nbr0;-><init>(Landroid/content/Context;Ll/mbr0;J)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2, p3}, Ll/i7z0;->c(Ll/nbr0;)Ll/i7z0;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2}, Ll/i7z0;->d()Ll/cbr0;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 44
    .line 45
    invoke-interface {p1}, Ll/zcr0;->zza()Ll/nbr0;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Ll/hbr0;->e1:Ll/nbr0;

    .line 50
    .line 51
    new-instance p1, Ll/lbr0;

    .line 52
    .line 53
    invoke-direct {p1}, Ll/lbr0;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Ll/hbr0;->f1:Ll/lbr0;

    .line 57
    .line 58
    const-string p1, "NVIDIA"

    .line 59
    .line 60
    sget-object p2, Ll/mpw0;->c:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    iput-boolean p1, p0, Ll/hbr0;->d1:Z

    .line 67
    .line 68
    const/4 p1, 0x1

    .line 69
    iput p1, p0, Ll/hbr0;->m1:I

    .line 70
    .line 71
    sget-object p1, Ll/aou0;->e:Ll/aou0;

    .line 72
    .line 73
    iput-object p1, p0, Ll/hbr0;->u1:Ll/aou0;

    .line 74
    .line 75
    const/4 p1, 0x0

    .line 76
    iput p1, p0, Ll/hbr0;->y1:I

    .line 77
    .line 78
    const/4 p1, 0x0

    .line 79
    iput-object p1, p0, Ll/hbr0;->v1:Ll/aou0;

    .line 80
    .line 81
    return-void
.end method

.method public static final T0(Ljava/lang/String;)Z
    .locals 5

    .line 1
    const-string v0, "OMX.google"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    const-class p0, Ll/hbr0;

    .line 12
    .line 13
    monitor-enter p0

    .line 14
    :try_start_0
    sget-boolean v1, Ll/hbr0;->C1:Z

    .line 15
    .line 16
    if-nez v1, :cond_7

    .line 17
    .line 18
    sget v1, Ll/mpw0;->a:I

    .line 19
    .line 20
    const/16 v2, 0x1c

    .line 21
    .line 22
    const/4 v3, 0x1

    .line 23
    if-gt v1, v2, :cond_1

    .line 24
    .line 25
    sget-object v2, Ll/mpw0;->b:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 28
    .line 29
    .line 30
    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    sparse-switch v4, :sswitch_data_0

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :sswitch_0
    const-string v4, "machuca"

    .line 36
    .line 37
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :sswitch_1
    const-string v4, "once"

    .line 45
    .line 46
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :sswitch_2
    const-string v4, "magnolia"

    .line 54
    .line 55
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :sswitch_3
    const-string v4, "aquaman"

    .line 63
    .line 64
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-eqz v2, :cond_1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :sswitch_4
    const-string v4, "oneday"

    .line 72
    .line 73
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eqz v2, :cond_1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :sswitch_5
    const-string v4, "dangalUHD"

    .line 81
    .line 82
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-eqz v2, :cond_1

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :sswitch_6
    const-string v4, "dangalFHD"

    .line 90
    .line 91
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-eqz v2, :cond_1

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :sswitch_7
    const-string v4, "dangal"

    .line 99
    .line 100
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    if-eqz v2, :cond_1

    .line 105
    .line 106
    :goto_0
    move v0, v3

    .line 107
    goto/16 :goto_6

    .line 108
    .line 109
    :catchall_0
    move-exception v0

    .line 110
    goto/16 :goto_7

    .line 111
    .line 112
    :cond_1
    :goto_1
    const/16 v2, 0x1b

    .line 113
    .line 114
    if-gt v1, v2, :cond_2

    .line 115
    .line 116
    :try_start_1
    const-string v2, "HWEML"

    .line 117
    .line 118
    sget-object v4, Ll/mpw0;->b:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    if-eqz v2, :cond_2

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_2
    sget-object v2, Ll/mpw0;->d:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 130
    .line 131
    .line 132
    move-result v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 133
    sparse-switch v4, :sswitch_data_1

    .line 134
    .line 135
    .line 136
    goto :goto_3

    .line 137
    :sswitch_8
    const-string v4, "AFTEUFF014"

    .line 138
    .line 139
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v4

    .line 143
    if-eqz v4, :cond_3

    .line 144
    .line 145
    goto :goto_2

    .line 146
    :sswitch_9
    const-string v4, "AFTSO001"

    .line 147
    .line 148
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v4

    .line 152
    if-eqz v4, :cond_3

    .line 153
    .line 154
    goto :goto_2

    .line 155
    :sswitch_a
    const-string v4, "AFTEU014"

    .line 156
    .line 157
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v4

    .line 161
    if-eqz v4, :cond_3

    .line 162
    .line 163
    goto :goto_2

    .line 164
    :sswitch_b
    const-string v4, "AFTEU011"

    .line 165
    .line 166
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-result v4

    .line 170
    if-eqz v4, :cond_3

    .line 171
    .line 172
    goto :goto_2

    .line 173
    :sswitch_c
    const-string v4, "AFTR"

    .line 174
    .line 175
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result v4

    .line 179
    if-eqz v4, :cond_3

    .line 180
    .line 181
    goto :goto_2

    .line 182
    :sswitch_d
    const-string v4, "AFTN"

    .line 183
    .line 184
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 185
    .line 186
    .line 187
    move-result v4

    .line 188
    if-eqz v4, :cond_3

    .line 189
    .line 190
    goto :goto_2

    .line 191
    :sswitch_e
    const-string v4, "AFTA"

    .line 192
    .line 193
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v4

    .line 197
    if-eqz v4, :cond_3

    .line 198
    .line 199
    goto :goto_2

    .line 200
    :sswitch_f
    const-string v4, "AFTKMST12"

    .line 201
    .line 202
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    move-result v4

    .line 206
    if-eqz v4, :cond_3

    .line 207
    .line 208
    goto :goto_2

    .line 209
    :sswitch_10
    const-string v4, "AFTJMST12"

    .line 210
    .line 211
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result v4

    .line 215
    if-eqz v4, :cond_3

    .line 216
    .line 217
    :goto_2
    goto :goto_0

    .line 218
    :cond_3
    :goto_3
    const/16 v4, 0x1a

    .line 219
    .line 220
    if-gt v1, v4, :cond_6

    .line 221
    .line 222
    :try_start_2
    sget-object v1, Ll/mpw0;->b:Ljava/lang/String;

    .line 223
    .line 224
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 225
    .line 226
    .line 227
    move-result v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 228
    sparse-switch v4, :sswitch_data_2

    .line 229
    .line 230
    .line 231
    goto/16 :goto_5

    .line 232
    .line 233
    :sswitch_11
    const-string v4, "HWWAS-H"

    .line 234
    .line 235
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    if-eqz v1, :cond_4

    .line 240
    .line 241
    goto/16 :goto_4

    .line 242
    .line 243
    :sswitch_12
    const-string v4, "HWVNS-H"

    .line 244
    .line 245
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    if-eqz v1, :cond_4

    .line 250
    .line 251
    goto/16 :goto_4

    .line 252
    .line 253
    :sswitch_13
    const-string v4, "ELUGA_Prim"

    .line 254
    .line 255
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result v1

    .line 259
    if-eqz v1, :cond_4

    .line 260
    .line 261
    goto/16 :goto_4

    .line 262
    .line 263
    :sswitch_14
    const-string v4, "ELUGA_Note"

    .line 264
    .line 265
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 266
    .line 267
    .line 268
    move-result v1

    .line 269
    if-eqz v1, :cond_4

    .line 270
    .line 271
    goto/16 :goto_4

    .line 272
    .line 273
    :sswitch_15
    const-string v4, "ASUS_X00AD_2"

    .line 274
    .line 275
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    move-result v1

    .line 279
    if-eqz v1, :cond_4

    .line 280
    .line 281
    goto/16 :goto_4

    .line 282
    .line 283
    :sswitch_16
    const-string v4, "HWCAM-H"

    .line 284
    .line 285
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 286
    .line 287
    .line 288
    move-result v1

    .line 289
    if-eqz v1, :cond_4

    .line 290
    .line 291
    goto/16 :goto_4

    .line 292
    .line 293
    :sswitch_17
    const-string v4, "HWBLN-H"

    .line 294
    .line 295
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 296
    .line 297
    .line 298
    move-result v1

    .line 299
    if-eqz v1, :cond_4

    .line 300
    .line 301
    goto/16 :goto_4

    .line 302
    .line 303
    :sswitch_18
    const-string v4, "DM-01K"

    .line 304
    .line 305
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 306
    .line 307
    .line 308
    move-result v1

    .line 309
    if-eqz v1, :cond_4

    .line 310
    .line 311
    goto/16 :goto_4

    .line 312
    .line 313
    :sswitch_19
    const-string v4, "BRAVIA_ATV3_4K"

    .line 314
    .line 315
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    if-eqz v1, :cond_4

    .line 320
    .line 321
    goto/16 :goto_4

    .line 322
    .line 323
    :sswitch_1a
    const-string v4, "Infinix-X572"

    .line 324
    .line 325
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 326
    .line 327
    .line 328
    move-result v1

    .line 329
    if-eqz v1, :cond_4

    .line 330
    .line 331
    goto/16 :goto_4

    .line 332
    .line 333
    :sswitch_1b
    const-string v4, "PB2-670M"

    .line 334
    .line 335
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 336
    .line 337
    .line 338
    move-result v1

    .line 339
    if-eqz v1, :cond_4

    .line 340
    .line 341
    goto/16 :goto_4

    .line 342
    .line 343
    :sswitch_1c
    const-string v4, "santoni"

    .line 344
    .line 345
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 346
    .line 347
    .line 348
    move-result v1

    .line 349
    if-eqz v1, :cond_4

    .line 350
    .line 351
    goto/16 :goto_4

    .line 352
    .line 353
    :sswitch_1d
    const-string v4, "iball8735_9806"

    .line 354
    .line 355
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 356
    .line 357
    .line 358
    move-result v1

    .line 359
    if-eqz v1, :cond_4

    .line 360
    .line 361
    goto/16 :goto_4

    .line 362
    .line 363
    :sswitch_1e
    const-string v4, "CPH1715"

    .line 364
    .line 365
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 366
    .line 367
    .line 368
    move-result v1

    .line 369
    if-eqz v1, :cond_4

    .line 370
    .line 371
    goto/16 :goto_4

    .line 372
    .line 373
    :sswitch_1f
    const-string v4, "CPH1609"

    .line 374
    .line 375
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 376
    .line 377
    .line 378
    move-result v1

    .line 379
    if-eqz v1, :cond_4

    .line 380
    .line 381
    goto/16 :goto_4

    .line 382
    .line 383
    :sswitch_20
    const-string v4, "woods_f"

    .line 384
    .line 385
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 386
    .line 387
    .line 388
    move-result v1

    .line 389
    if-eqz v1, :cond_4

    .line 390
    .line 391
    goto/16 :goto_4

    .line 392
    .line 393
    :sswitch_21
    const-string v4, "htc_e56ml_dtul"

    .line 394
    .line 395
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 396
    .line 397
    .line 398
    move-result v1

    .line 399
    if-eqz v1, :cond_4

    .line 400
    .line 401
    goto/16 :goto_4

    .line 402
    .line 403
    :sswitch_22
    const-string v4, "EverStar_S"

    .line 404
    .line 405
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 406
    .line 407
    .line 408
    move-result v1

    .line 409
    if-eqz v1, :cond_4

    .line 410
    .line 411
    goto/16 :goto_4

    .line 412
    .line 413
    :sswitch_23
    const-string v4, "hwALE-H"

    .line 414
    .line 415
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 416
    .line 417
    .line 418
    move-result v1

    .line 419
    if-eqz v1, :cond_4

    .line 420
    .line 421
    goto/16 :goto_4

    .line 422
    .line 423
    :sswitch_24
    const-string v4, "itel_S41"

    .line 424
    .line 425
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 426
    .line 427
    .line 428
    move-result v1

    .line 429
    if-eqz v1, :cond_4

    .line 430
    .line 431
    goto/16 :goto_4

    .line 432
    .line 433
    :sswitch_25
    const-string v4, "LS-5017"

    .line 434
    .line 435
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 436
    .line 437
    .line 438
    move-result v1

    .line 439
    if-eqz v1, :cond_4

    .line 440
    .line 441
    goto/16 :goto_4

    .line 442
    .line 443
    :sswitch_26
    const-string v4, "panell_d"

    .line 444
    .line 445
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 446
    .line 447
    .line 448
    move-result v1

    .line 449
    if-eqz v1, :cond_4

    .line 450
    .line 451
    goto/16 :goto_4

    .line 452
    .line 453
    :sswitch_27
    const-string v4, "j2xlteins"

    .line 454
    .line 455
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 456
    .line 457
    .line 458
    move-result v1

    .line 459
    if-eqz v1, :cond_4

    .line 460
    .line 461
    goto/16 :goto_4

    .line 462
    .line 463
    :sswitch_28
    const-string v4, "A7000plus"

    .line 464
    .line 465
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 466
    .line 467
    .line 468
    move-result v1

    .line 469
    if-eqz v1, :cond_4

    .line 470
    .line 471
    goto/16 :goto_4

    .line 472
    .line 473
    :sswitch_29
    const-string v4, "manning"

    .line 474
    .line 475
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 476
    .line 477
    .line 478
    move-result v1

    .line 479
    if-eqz v1, :cond_4

    .line 480
    .line 481
    goto/16 :goto_4

    .line 482
    .line 483
    :sswitch_2a
    const-string v4, "GIONEE_WBL7519"

    .line 484
    .line 485
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 486
    .line 487
    .line 488
    move-result v1

    .line 489
    if-eqz v1, :cond_4

    .line 490
    .line 491
    goto/16 :goto_4

    .line 492
    .line 493
    :sswitch_2b
    const-string v4, "GIONEE_WBL7365"

    .line 494
    .line 495
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 496
    .line 497
    .line 498
    move-result v1

    .line 499
    if-eqz v1, :cond_4

    .line 500
    .line 501
    goto/16 :goto_4

    .line 502
    .line 503
    :sswitch_2c
    const-string v4, "GIONEE_WBL5708"

    .line 504
    .line 505
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 506
    .line 507
    .line 508
    move-result v1

    .line 509
    if-eqz v1, :cond_4

    .line 510
    .line 511
    goto/16 :goto_4

    .line 512
    .line 513
    :sswitch_2d
    const-string v4, "QM16XE_U"

    .line 514
    .line 515
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 516
    .line 517
    .line 518
    move-result v1

    .line 519
    if-eqz v1, :cond_4

    .line 520
    .line 521
    goto/16 :goto_4

    .line 522
    .line 523
    :sswitch_2e
    const-string v4, "Pixi5-10_4G"

    .line 524
    .line 525
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 526
    .line 527
    .line 528
    move-result v1

    .line 529
    if-eqz v1, :cond_4

    .line 530
    .line 531
    goto/16 :goto_4

    .line 532
    .line 533
    :sswitch_2f
    const-string v4, "TB3-850M"

    .line 534
    .line 535
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 536
    .line 537
    .line 538
    move-result v1

    .line 539
    if-eqz v1, :cond_4

    .line 540
    .line 541
    goto/16 :goto_4

    .line 542
    .line 543
    :sswitch_30
    const-string v4, "TB3-850F"

    .line 544
    .line 545
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 546
    .line 547
    .line 548
    move-result v1

    .line 549
    if-eqz v1, :cond_4

    .line 550
    .line 551
    goto/16 :goto_4

    .line 552
    .line 553
    :sswitch_31
    const-string v4, "TB3-730X"

    .line 554
    .line 555
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 556
    .line 557
    .line 558
    move-result v1

    .line 559
    if-eqz v1, :cond_4

    .line 560
    .line 561
    goto/16 :goto_4

    .line 562
    .line 563
    :sswitch_32
    const-string v4, "TB3-730F"

    .line 564
    .line 565
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 566
    .line 567
    .line 568
    move-result v1

    .line 569
    if-eqz v1, :cond_4

    .line 570
    .line 571
    goto/16 :goto_4

    .line 572
    .line 573
    :sswitch_33
    const-string v4, "A7020a48"

    .line 574
    .line 575
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 576
    .line 577
    .line 578
    move-result v1

    .line 579
    if-eqz v1, :cond_4

    .line 580
    .line 581
    goto/16 :goto_4

    .line 582
    .line 583
    :sswitch_34
    const-string v4, "A7010a48"

    .line 584
    .line 585
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 586
    .line 587
    .line 588
    move-result v1

    .line 589
    if-eqz v1, :cond_4

    .line 590
    .line 591
    goto/16 :goto_4

    .line 592
    .line 593
    :sswitch_35
    const-string v4, "griffin"

    .line 594
    .line 595
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 596
    .line 597
    .line 598
    move-result v1

    .line 599
    if-eqz v1, :cond_4

    .line 600
    .line 601
    goto/16 :goto_4

    .line 602
    .line 603
    :sswitch_36
    const-string v4, "marino_f"

    .line 604
    .line 605
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 606
    .line 607
    .line 608
    move-result v1

    .line 609
    if-eqz v1, :cond_4

    .line 610
    .line 611
    goto/16 :goto_4

    .line 612
    .line 613
    :sswitch_37
    const-string v4, "CPY83_I00"

    .line 614
    .line 615
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 616
    .line 617
    .line 618
    move-result v1

    .line 619
    if-eqz v1, :cond_4

    .line 620
    .line 621
    goto/16 :goto_4

    .line 622
    .line 623
    :sswitch_38
    const-string v4, "A2016a40"

    .line 624
    .line 625
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 626
    .line 627
    .line 628
    move-result v1

    .line 629
    if-eqz v1, :cond_4

    .line 630
    .line 631
    goto/16 :goto_4

    .line 632
    .line 633
    :sswitch_39
    const-string v4, "le_x6"

    .line 634
    .line 635
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 636
    .line 637
    .line 638
    move-result v1

    .line 639
    if-eqz v1, :cond_4

    .line 640
    .line 641
    goto/16 :goto_4

    .line 642
    .line 643
    :sswitch_3a
    const-string v4, "l5460"

    .line 644
    .line 645
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 646
    .line 647
    .line 648
    move-result v1

    .line 649
    if-eqz v1, :cond_4

    .line 650
    .line 651
    goto/16 :goto_4

    .line 652
    .line 653
    :sswitch_3b
    const-string v4, "i9031"

    .line 654
    .line 655
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 656
    .line 657
    .line 658
    move-result v1

    .line 659
    if-eqz v1, :cond_4

    .line 660
    .line 661
    goto/16 :goto_4

    .line 662
    .line 663
    :sswitch_3c
    const-string v4, "X3_HK"

    .line 664
    .line 665
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 666
    .line 667
    .line 668
    move-result v1

    .line 669
    if-eqz v1, :cond_4

    .line 670
    .line 671
    goto/16 :goto_4

    .line 672
    .line 673
    :sswitch_3d
    const-string v4, "V23GB"

    .line 674
    .line 675
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 676
    .line 677
    .line 678
    move-result v1

    .line 679
    if-eqz v1, :cond_4

    .line 680
    .line 681
    goto/16 :goto_4

    .line 682
    .line 683
    :sswitch_3e
    const-string v4, "Q4310"

    .line 684
    .line 685
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 686
    .line 687
    .line 688
    move-result v1

    .line 689
    if-eqz v1, :cond_4

    .line 690
    .line 691
    goto/16 :goto_4

    .line 692
    .line 693
    :sswitch_3f
    const-string v4, "Q4260"

    .line 694
    .line 695
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 696
    .line 697
    .line 698
    move-result v1

    .line 699
    if-eqz v1, :cond_4

    .line 700
    .line 701
    goto/16 :goto_4

    .line 702
    .line 703
    :sswitch_40
    const-string v4, "PRO7S"

    .line 704
    .line 705
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 706
    .line 707
    .line 708
    move-result v1

    .line 709
    if-eqz v1, :cond_4

    .line 710
    .line 711
    goto/16 :goto_4

    .line 712
    .line 713
    :sswitch_41
    const-string v4, "F3311"

    .line 714
    .line 715
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 716
    .line 717
    .line 718
    move-result v1

    .line 719
    if-eqz v1, :cond_4

    .line 720
    .line 721
    goto/16 :goto_4

    .line 722
    .line 723
    :sswitch_42
    const-string v4, "F3215"

    .line 724
    .line 725
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 726
    .line 727
    .line 728
    move-result v1

    .line 729
    if-eqz v1, :cond_4

    .line 730
    .line 731
    goto/16 :goto_4

    .line 732
    .line 733
    :sswitch_43
    const-string v4, "F3213"

    .line 734
    .line 735
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 736
    .line 737
    .line 738
    move-result v1

    .line 739
    if-eqz v1, :cond_4

    .line 740
    .line 741
    goto/16 :goto_4

    .line 742
    .line 743
    :sswitch_44
    const-string v4, "F3211"

    .line 744
    .line 745
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 746
    .line 747
    .line 748
    move-result v1

    .line 749
    if-eqz v1, :cond_4

    .line 750
    .line 751
    goto/16 :goto_4

    .line 752
    .line 753
    :sswitch_45
    const-string v4, "F3116"

    .line 754
    .line 755
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 756
    .line 757
    .line 758
    move-result v1

    .line 759
    if-eqz v1, :cond_4

    .line 760
    .line 761
    goto/16 :goto_4

    .line 762
    .line 763
    :sswitch_46
    const-string v4, "F3113"

    .line 764
    .line 765
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 766
    .line 767
    .line 768
    move-result v1

    .line 769
    if-eqz v1, :cond_4

    .line 770
    .line 771
    goto/16 :goto_4

    .line 772
    .line 773
    :sswitch_47
    const-string v4, "F3111"

    .line 774
    .line 775
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 776
    .line 777
    .line 778
    move-result v1

    .line 779
    if-eqz v1, :cond_4

    .line 780
    .line 781
    goto/16 :goto_4

    .line 782
    .line 783
    :sswitch_48
    const-string v4, "E5643"

    .line 784
    .line 785
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 786
    .line 787
    .line 788
    move-result v1

    .line 789
    if-eqz v1, :cond_4

    .line 790
    .line 791
    goto/16 :goto_4

    .line 792
    .line 793
    :sswitch_49
    const-string v4, "A1601"

    .line 794
    .line 795
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 796
    .line 797
    .line 798
    move-result v1

    .line 799
    if-eqz v1, :cond_4

    .line 800
    .line 801
    goto/16 :goto_4

    .line 802
    .line 803
    :sswitch_4a
    const-string v4, "Aura_Note_2"

    .line 804
    .line 805
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 806
    .line 807
    .line 808
    move-result v1

    .line 809
    if-eqz v1, :cond_4

    .line 810
    .line 811
    goto/16 :goto_4

    .line 812
    .line 813
    :sswitch_4b
    const-string v4, "602LV"

    .line 814
    .line 815
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 816
    .line 817
    .line 818
    move-result v1

    .line 819
    if-eqz v1, :cond_4

    .line 820
    .line 821
    goto/16 :goto_4

    .line 822
    .line 823
    :sswitch_4c
    const-string v4, "601LV"

    .line 824
    .line 825
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 826
    .line 827
    .line 828
    move-result v1

    .line 829
    if-eqz v1, :cond_4

    .line 830
    .line 831
    goto/16 :goto_4

    .line 832
    .line 833
    :sswitch_4d
    const-string v4, "MEIZU_M5"

    .line 834
    .line 835
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 836
    .line 837
    .line 838
    move-result v1

    .line 839
    if-eqz v1, :cond_4

    .line 840
    .line 841
    goto/16 :goto_4

    .line 842
    .line 843
    :sswitch_4e
    const-string v4, "p212"

    .line 844
    .line 845
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 846
    .line 847
    .line 848
    move-result v1

    .line 849
    if-eqz v1, :cond_4

    .line 850
    .line 851
    goto/16 :goto_4

    .line 852
    .line 853
    :sswitch_4f
    const-string v4, "mido"

    .line 854
    .line 855
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 856
    .line 857
    .line 858
    move-result v1

    .line 859
    if-eqz v1, :cond_4

    .line 860
    .line 861
    goto/16 :goto_4

    .line 862
    .line 863
    :sswitch_50
    const-string v4, "kate"

    .line 864
    .line 865
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 866
    .line 867
    .line 868
    move-result v1

    .line 869
    if-eqz v1, :cond_4

    .line 870
    .line 871
    goto/16 :goto_4

    .line 872
    .line 873
    :sswitch_51
    const-string v4, "fugu"

    .line 874
    .line 875
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 876
    .line 877
    .line 878
    move-result v1

    .line 879
    if-eqz v1, :cond_4

    .line 880
    .line 881
    goto/16 :goto_4

    .line 882
    .line 883
    :sswitch_52
    const-string v4, "XE2X"

    .line 884
    .line 885
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 886
    .line 887
    .line 888
    move-result v1

    .line 889
    if-eqz v1, :cond_4

    .line 890
    .line 891
    goto/16 :goto_4

    .line 892
    .line 893
    :sswitch_53
    const-string v4, "Q427"

    .line 894
    .line 895
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 896
    .line 897
    .line 898
    move-result v1

    .line 899
    if-eqz v1, :cond_4

    .line 900
    .line 901
    goto/16 :goto_4

    .line 902
    .line 903
    :sswitch_54
    const-string v4, "Q350"

    .line 904
    .line 905
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 906
    .line 907
    .line 908
    move-result v1

    .line 909
    if-eqz v1, :cond_4

    .line 910
    .line 911
    goto/16 :goto_4

    .line 912
    .line 913
    :sswitch_55
    const-string v4, "P681"

    .line 914
    .line 915
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 916
    .line 917
    .line 918
    move-result v1

    .line 919
    if-eqz v1, :cond_4

    .line 920
    .line 921
    goto/16 :goto_4

    .line 922
    .line 923
    :sswitch_56
    const-string v4, "F04J"

    .line 924
    .line 925
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 926
    .line 927
    .line 928
    move-result v1

    .line 929
    if-eqz v1, :cond_4

    .line 930
    .line 931
    goto/16 :goto_4

    .line 932
    .line 933
    :sswitch_57
    const-string v4, "F04H"

    .line 934
    .line 935
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 936
    .line 937
    .line 938
    move-result v1

    .line 939
    if-eqz v1, :cond_4

    .line 940
    .line 941
    goto/16 :goto_4

    .line 942
    .line 943
    :sswitch_58
    const-string v4, "F03H"

    .line 944
    .line 945
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 946
    .line 947
    .line 948
    move-result v1

    .line 949
    if-eqz v1, :cond_4

    .line 950
    .line 951
    goto/16 :goto_4

    .line 952
    .line 953
    :sswitch_59
    const-string v4, "F02H"

    .line 954
    .line 955
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 956
    .line 957
    .line 958
    move-result v1

    .line 959
    if-eqz v1, :cond_4

    .line 960
    .line 961
    goto/16 :goto_4

    .line 962
    .line 963
    :sswitch_5a
    const-string v4, "F01J"

    .line 964
    .line 965
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 966
    .line 967
    .line 968
    move-result v1

    .line 969
    if-eqz v1, :cond_4

    .line 970
    .line 971
    goto/16 :goto_4

    .line 972
    .line 973
    :sswitch_5b
    const-string v4, "F01H"

    .line 974
    .line 975
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 976
    .line 977
    .line 978
    move-result v1

    .line 979
    if-eqz v1, :cond_4

    .line 980
    .line 981
    goto/16 :goto_4

    .line 982
    .line 983
    :sswitch_5c
    const-string v4, "1714"

    .line 984
    .line 985
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 986
    .line 987
    .line 988
    move-result v1

    .line 989
    if-eqz v1, :cond_4

    .line 990
    .line 991
    goto/16 :goto_4

    .line 992
    .line 993
    :sswitch_5d
    const-string v4, "1713"

    .line 994
    .line 995
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 996
    .line 997
    .line 998
    move-result v1

    .line 999
    if-eqz v1, :cond_4

    .line 1000
    .line 1001
    goto/16 :goto_4

    .line 1002
    .line 1003
    :sswitch_5e
    const-string v4, "1601"

    .line 1004
    .line 1005
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1006
    .line 1007
    .line 1008
    move-result v1

    .line 1009
    if-eqz v1, :cond_4

    .line 1010
    .line 1011
    goto/16 :goto_4

    .line 1012
    .line 1013
    :sswitch_5f
    const-string v4, "flo"

    .line 1014
    .line 1015
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1016
    .line 1017
    .line 1018
    move-result v1

    .line 1019
    if-eqz v1, :cond_4

    .line 1020
    .line 1021
    goto/16 :goto_4

    .line 1022
    .line 1023
    :sswitch_60
    const-string v4, "deb"

    .line 1024
    .line 1025
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1026
    .line 1027
    .line 1028
    move-result v1

    .line 1029
    if-eqz v1, :cond_4

    .line 1030
    .line 1031
    goto/16 :goto_4

    .line 1032
    .line 1033
    :sswitch_61
    const-string v4, "cv3"

    .line 1034
    .line 1035
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1036
    .line 1037
    .line 1038
    move-result v1

    .line 1039
    if-eqz v1, :cond_4

    .line 1040
    .line 1041
    goto/16 :goto_4

    .line 1042
    .line 1043
    :sswitch_62
    const-string v4, "cv1"

    .line 1044
    .line 1045
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1046
    .line 1047
    .line 1048
    move-result v1

    .line 1049
    if-eqz v1, :cond_4

    .line 1050
    .line 1051
    goto/16 :goto_4

    .line 1052
    .line 1053
    :sswitch_63
    const-string v4, "Z80"

    .line 1054
    .line 1055
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1056
    .line 1057
    .line 1058
    move-result v1

    .line 1059
    if-eqz v1, :cond_4

    .line 1060
    .line 1061
    goto/16 :goto_4

    .line 1062
    .line 1063
    :sswitch_64
    const-string v4, "QX1"

    .line 1064
    .line 1065
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1066
    .line 1067
    .line 1068
    move-result v1

    .line 1069
    if-eqz v1, :cond_4

    .line 1070
    .line 1071
    goto/16 :goto_4

    .line 1072
    .line 1073
    :sswitch_65
    const-string v4, "PLE"

    .line 1074
    .line 1075
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1076
    .line 1077
    .line 1078
    move-result v1

    .line 1079
    if-eqz v1, :cond_4

    .line 1080
    .line 1081
    goto/16 :goto_4

    .line 1082
    .line 1083
    :sswitch_66
    const-string v4, "P85"

    .line 1084
    .line 1085
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1086
    .line 1087
    .line 1088
    move-result v1

    .line 1089
    if-eqz v1, :cond_4

    .line 1090
    .line 1091
    goto/16 :goto_4

    .line 1092
    .line 1093
    :sswitch_67
    const-string v4, "MX6"

    .line 1094
    .line 1095
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1096
    .line 1097
    .line 1098
    move-result v1

    .line 1099
    if-eqz v1, :cond_4

    .line 1100
    .line 1101
    goto/16 :goto_4

    .line 1102
    .line 1103
    :sswitch_68
    const-string v4, "M5c"

    .line 1104
    .line 1105
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1106
    .line 1107
    .line 1108
    move-result v1

    .line 1109
    if-eqz v1, :cond_4

    .line 1110
    .line 1111
    goto/16 :goto_4

    .line 1112
    .line 1113
    :sswitch_69
    const-string v4, "M04"

    .line 1114
    .line 1115
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1116
    .line 1117
    .line 1118
    move-result v1

    .line 1119
    if-eqz v1, :cond_4

    .line 1120
    .line 1121
    goto/16 :goto_4

    .line 1122
    .line 1123
    :sswitch_6a
    const-string v4, "JGZ"

    .line 1124
    .line 1125
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1126
    .line 1127
    .line 1128
    move-result v1

    .line 1129
    if-eqz v1, :cond_4

    .line 1130
    .line 1131
    goto/16 :goto_4

    .line 1132
    .line 1133
    :sswitch_6b
    const-string v4, "mh"

    .line 1134
    .line 1135
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1136
    .line 1137
    .line 1138
    move-result v1

    .line 1139
    if-eqz v1, :cond_4

    .line 1140
    .line 1141
    goto/16 :goto_4

    .line 1142
    .line 1143
    :sswitch_6c
    const-string v4, "b5"

    .line 1144
    .line 1145
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1146
    .line 1147
    .line 1148
    move-result v1

    .line 1149
    if-eqz v1, :cond_4

    .line 1150
    .line 1151
    goto/16 :goto_4

    .line 1152
    .line 1153
    :sswitch_6d
    const-string v4, "V5"

    .line 1154
    .line 1155
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1156
    .line 1157
    .line 1158
    move-result v1

    .line 1159
    if-eqz v1, :cond_4

    .line 1160
    .line 1161
    goto/16 :goto_4

    .line 1162
    .line 1163
    :sswitch_6e
    const-string v4, "V1"

    .line 1164
    .line 1165
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1166
    .line 1167
    .line 1168
    move-result v1

    .line 1169
    if-eqz v1, :cond_4

    .line 1170
    .line 1171
    goto/16 :goto_4

    .line 1172
    .line 1173
    :sswitch_6f
    const-string v4, "Q5"

    .line 1174
    .line 1175
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1176
    .line 1177
    .line 1178
    move-result v1

    .line 1179
    if-eqz v1, :cond_4

    .line 1180
    .line 1181
    goto/16 :goto_4

    .line 1182
    .line 1183
    :sswitch_70
    const-string v4, "C1"

    .line 1184
    .line 1185
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1186
    .line 1187
    .line 1188
    move-result v1

    .line 1189
    if-eqz v1, :cond_4

    .line 1190
    .line 1191
    goto/16 :goto_4

    .line 1192
    .line 1193
    :sswitch_71
    const-string v4, "woods_fn"

    .line 1194
    .line 1195
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1196
    .line 1197
    .line 1198
    move-result v1

    .line 1199
    if-eqz v1, :cond_4

    .line 1200
    .line 1201
    goto/16 :goto_4

    .line 1202
    .line 1203
    :sswitch_72
    const-string v4, "ELUGA_A3_Pro"

    .line 1204
    .line 1205
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1206
    .line 1207
    .line 1208
    move-result v1

    .line 1209
    if-eqz v1, :cond_4

    .line 1210
    .line 1211
    goto/16 :goto_4

    .line 1212
    .line 1213
    :sswitch_73
    const-string v4, "Z12_PRO"

    .line 1214
    .line 1215
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1216
    .line 1217
    .line 1218
    move-result v1

    .line 1219
    if-eqz v1, :cond_4

    .line 1220
    .line 1221
    goto/16 :goto_4

    .line 1222
    .line 1223
    :sswitch_74
    const-string v4, "BLACK-1X"

    .line 1224
    .line 1225
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1226
    .line 1227
    .line 1228
    move-result v1

    .line 1229
    if-eqz v1, :cond_4

    .line 1230
    .line 1231
    goto/16 :goto_4

    .line 1232
    .line 1233
    :sswitch_75
    const-string v4, "taido_row"

    .line 1234
    .line 1235
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1236
    .line 1237
    .line 1238
    move-result v1

    .line 1239
    if-eqz v1, :cond_4

    .line 1240
    .line 1241
    goto/16 :goto_4

    .line 1242
    .line 1243
    :sswitch_76
    const-string v4, "Pixi4-7_3G"

    .line 1244
    .line 1245
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1246
    .line 1247
    .line 1248
    move-result v1

    .line 1249
    if-eqz v1, :cond_4

    .line 1250
    .line 1251
    goto/16 :goto_4

    .line 1252
    .line 1253
    :sswitch_77
    const-string v4, "GIONEE_GBL7360"

    .line 1254
    .line 1255
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1256
    .line 1257
    .line 1258
    move-result v1

    .line 1259
    if-eqz v1, :cond_4

    .line 1260
    .line 1261
    goto/16 :goto_4

    .line 1262
    .line 1263
    :sswitch_78
    const-string v4, "GiONEE_CBL7513"

    .line 1264
    .line 1265
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1266
    .line 1267
    .line 1268
    move-result v1

    .line 1269
    if-eqz v1, :cond_4

    .line 1270
    .line 1271
    goto/16 :goto_4

    .line 1272
    .line 1273
    :sswitch_79
    const-string v4, "OnePlus5T"

    .line 1274
    .line 1275
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1276
    .line 1277
    .line 1278
    move-result v1

    .line 1279
    if-eqz v1, :cond_4

    .line 1280
    .line 1281
    goto/16 :goto_4

    .line 1282
    .line 1283
    :sswitch_7a
    const-string v4, "whyred"

    .line 1284
    .line 1285
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1286
    .line 1287
    .line 1288
    move-result v1

    .line 1289
    if-eqz v1, :cond_4

    .line 1290
    .line 1291
    goto/16 :goto_4

    .line 1292
    .line 1293
    :sswitch_7b
    const-string v4, "watson"

    .line 1294
    .line 1295
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1296
    .line 1297
    .line 1298
    move-result v1

    .line 1299
    if-eqz v1, :cond_4

    .line 1300
    .line 1301
    goto/16 :goto_4

    .line 1302
    .line 1303
    :sswitch_7c
    const-string v4, "SVP-DTV15"

    .line 1304
    .line 1305
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1306
    .line 1307
    .line 1308
    move-result v1

    .line 1309
    if-eqz v1, :cond_4

    .line 1310
    .line 1311
    goto/16 :goto_4

    .line 1312
    .line 1313
    :sswitch_7d
    const-string v4, "A7000-a"

    .line 1314
    .line 1315
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1316
    .line 1317
    .line 1318
    move-result v1

    .line 1319
    if-eqz v1, :cond_4

    .line 1320
    .line 1321
    goto/16 :goto_4

    .line 1322
    .line 1323
    :sswitch_7e
    const-string v4, "nicklaus_f"

    .line 1324
    .line 1325
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1326
    .line 1327
    .line 1328
    move-result v1

    .line 1329
    if-eqz v1, :cond_4

    .line 1330
    .line 1331
    goto/16 :goto_4

    .line 1332
    .line 1333
    :sswitch_7f
    const-string v4, "tcl_eu"

    .line 1334
    .line 1335
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1336
    .line 1337
    .line 1338
    move-result v1

    .line 1339
    if-eqz v1, :cond_4

    .line 1340
    .line 1341
    goto/16 :goto_4

    .line 1342
    .line 1343
    :sswitch_80
    const-string v4, "ELUGA_Ray_X"

    .line 1344
    .line 1345
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1346
    .line 1347
    .line 1348
    move-result v1

    .line 1349
    if-eqz v1, :cond_4

    .line 1350
    .line 1351
    goto/16 :goto_4

    .line 1352
    .line 1353
    :sswitch_81
    const-string v4, "s905x018"

    .line 1354
    .line 1355
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1356
    .line 1357
    .line 1358
    move-result v1

    .line 1359
    if-eqz v1, :cond_4

    .line 1360
    .line 1361
    goto/16 :goto_4

    .line 1362
    .line 1363
    :sswitch_82
    const-string v4, "A10-70L"

    .line 1364
    .line 1365
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1366
    .line 1367
    .line 1368
    move-result v1

    .line 1369
    if-eqz v1, :cond_4

    .line 1370
    .line 1371
    goto/16 :goto_4

    .line 1372
    .line 1373
    :sswitch_83
    const-string v4, "A10-70F"

    .line 1374
    .line 1375
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1376
    .line 1377
    .line 1378
    move-result v1

    .line 1379
    if-eqz v1, :cond_4

    .line 1380
    .line 1381
    goto/16 :goto_4

    .line 1382
    .line 1383
    :sswitch_84
    const-string v4, "namath"

    .line 1384
    .line 1385
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1386
    .line 1387
    .line 1388
    move-result v1

    .line 1389
    if-eqz v1, :cond_4

    .line 1390
    .line 1391
    goto/16 :goto_4

    .line 1392
    .line 1393
    :sswitch_85
    const-string v4, "Slate_Pro"

    .line 1394
    .line 1395
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1396
    .line 1397
    .line 1398
    move-result v1

    .line 1399
    if-eqz v1, :cond_4

    .line 1400
    .line 1401
    goto/16 :goto_4

    .line 1402
    .line 1403
    :sswitch_86
    const-string v4, "iris60"

    .line 1404
    .line 1405
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1406
    .line 1407
    .line 1408
    move-result v1

    .line 1409
    if-eqz v1, :cond_4

    .line 1410
    .line 1411
    goto/16 :goto_4

    .line 1412
    .line 1413
    :sswitch_87
    const-string v4, "BRAVIA_ATV2"

    .line 1414
    .line 1415
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1416
    .line 1417
    .line 1418
    move-result v1

    .line 1419
    if-eqz v1, :cond_4

    .line 1420
    .line 1421
    goto/16 :goto_4

    .line 1422
    .line 1423
    :sswitch_88
    const-string v4, "GiONEE_GBL7319"

    .line 1424
    .line 1425
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1426
    .line 1427
    .line 1428
    move-result v1

    .line 1429
    if-eqz v1, :cond_4

    .line 1430
    .line 1431
    goto/16 :goto_4

    .line 1432
    .line 1433
    :sswitch_89
    const-string v4, "panell_dt"

    .line 1434
    .line 1435
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1436
    .line 1437
    .line 1438
    move-result v1

    .line 1439
    if-eqz v1, :cond_4

    .line 1440
    .line 1441
    goto/16 :goto_4

    .line 1442
    .line 1443
    :sswitch_8a
    const-string v4, "panell_ds"

    .line 1444
    .line 1445
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1446
    .line 1447
    .line 1448
    move-result v1

    .line 1449
    if-eqz v1, :cond_4

    .line 1450
    .line 1451
    goto/16 :goto_4

    .line 1452
    .line 1453
    :sswitch_8b
    const-string v4, "panell_dl"

    .line 1454
    .line 1455
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1456
    .line 1457
    .line 1458
    move-result v1

    .line 1459
    if-eqz v1, :cond_4

    .line 1460
    .line 1461
    goto/16 :goto_4

    .line 1462
    .line 1463
    :sswitch_8c
    const-string v4, "vernee_M5"

    .line 1464
    .line 1465
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1466
    .line 1467
    .line 1468
    move-result v1

    .line 1469
    if-eqz v1, :cond_4

    .line 1470
    .line 1471
    goto/16 :goto_4

    .line 1472
    .line 1473
    :sswitch_8d
    const-string v4, "pacificrim"

    .line 1474
    .line 1475
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1476
    .line 1477
    .line 1478
    move-result v1

    .line 1479
    if-eqz v1, :cond_4

    .line 1480
    .line 1481
    goto/16 :goto_4

    .line 1482
    .line 1483
    :sswitch_8e
    const-string v4, "Phantom6"

    .line 1484
    .line 1485
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1486
    .line 1487
    .line 1488
    move-result v1

    .line 1489
    if-eqz v1, :cond_4

    .line 1490
    .line 1491
    goto/16 :goto_4

    .line 1492
    .line 1493
    :sswitch_8f
    const-string v4, "ComioS1"

    .line 1494
    .line 1495
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1496
    .line 1497
    .line 1498
    move-result v1

    .line 1499
    if-eqz v1, :cond_4

    .line 1500
    .line 1501
    goto/16 :goto_4

    .line 1502
    .line 1503
    :sswitch_90
    const-string v4, "XT1663"

    .line 1504
    .line 1505
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1506
    .line 1507
    .line 1508
    move-result v1

    .line 1509
    if-eqz v1, :cond_4

    .line 1510
    .line 1511
    goto/16 :goto_4

    .line 1512
    .line 1513
    :sswitch_91
    const-string v4, "RAIJIN"

    .line 1514
    .line 1515
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1516
    .line 1517
    .line 1518
    move-result v1

    .line 1519
    if-eqz v1, :cond_4

    .line 1520
    .line 1521
    goto/16 :goto_4

    .line 1522
    .line 1523
    :sswitch_92
    const-string v4, "AquaPowerM"

    .line 1524
    .line 1525
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1526
    .line 1527
    .line 1528
    move-result v1

    .line 1529
    if-eqz v1, :cond_4

    .line 1530
    .line 1531
    goto :goto_4

    .line 1532
    :sswitch_93
    const-string v4, "PGN611"

    .line 1533
    .line 1534
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1535
    .line 1536
    .line 1537
    move-result v1

    .line 1538
    if-eqz v1, :cond_4

    .line 1539
    .line 1540
    goto :goto_4

    .line 1541
    :sswitch_94
    const-string v4, "PGN610"

    .line 1542
    .line 1543
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1544
    .line 1545
    .line 1546
    move-result v1

    .line 1547
    if-eqz v1, :cond_4

    .line 1548
    .line 1549
    goto :goto_4

    .line 1550
    :sswitch_95
    const-string v4, "PGN528"

    .line 1551
    .line 1552
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1553
    .line 1554
    .line 1555
    move-result v1

    .line 1556
    if-eqz v1, :cond_4

    .line 1557
    .line 1558
    goto :goto_4

    .line 1559
    :sswitch_96
    const-string v4, "NX573J"

    .line 1560
    .line 1561
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1562
    .line 1563
    .line 1564
    move-result v1

    .line 1565
    if-eqz v1, :cond_4

    .line 1566
    .line 1567
    goto :goto_4

    .line 1568
    :sswitch_97
    const-string v4, "NX541J"

    .line 1569
    .line 1570
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1571
    .line 1572
    .line 1573
    move-result v1

    .line 1574
    if-eqz v1, :cond_4

    .line 1575
    .line 1576
    goto :goto_4

    .line 1577
    :sswitch_98
    const-string v4, "CP8676_I02"

    .line 1578
    .line 1579
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1580
    .line 1581
    .line 1582
    move-result v1

    .line 1583
    if-eqz v1, :cond_4

    .line 1584
    .line 1585
    goto :goto_4

    .line 1586
    :sswitch_99
    const-string v4, "K50a40"

    .line 1587
    .line 1588
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1589
    .line 1590
    .line 1591
    move-result v1

    .line 1592
    if-eqz v1, :cond_4

    .line 1593
    .line 1594
    goto :goto_4

    .line 1595
    :sswitch_9a
    const-string v4, "GIONEE_SWW1631"

    .line 1596
    .line 1597
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1598
    .line 1599
    .line 1600
    move-result v1

    .line 1601
    if-eqz v1, :cond_4

    .line 1602
    .line 1603
    goto :goto_4

    .line 1604
    :sswitch_9b
    const-string v4, "GIONEE_SWW1627"

    .line 1605
    .line 1606
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1607
    .line 1608
    .line 1609
    move-result v1

    .line 1610
    if-eqz v1, :cond_4

    .line 1611
    .line 1612
    goto :goto_4

    .line 1613
    :sswitch_9c
    const-string v4, "GIONEE_SWW1609"

    .line 1614
    .line 1615
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1616
    .line 1617
    .line 1618
    move-result v1

    .line 1619
    if-eqz v1, :cond_4

    .line 1620
    .line 1621
    :goto_4
    goto/16 :goto_0

    .line 1622
    .line 1623
    :cond_4
    :goto_5
    :try_start_3
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 1624
    .line 1625
    .line 1626
    move-result v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1627
    const v4, -0x236fe21d

    .line 1628
    .line 1629
    .line 1630
    if-eq v1, v4, :cond_5

    .line 1631
    .line 1632
    goto :goto_6

    .line 1633
    :cond_5
    const-string v1, "JSN-L21"

    .line 1634
    .line 1635
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1636
    .line 1637
    .line 1638
    move-result v1

    .line 1639
    if-eqz v1, :cond_6

    .line 1640
    .line 1641
    goto/16 :goto_0

    .line 1642
    .line 1643
    :cond_6
    :goto_6
    :try_start_4
    sput-boolean v0, Ll/hbr0;->D1:Z

    .line 1644
    .line 1645
    sput-boolean v3, Ll/hbr0;->C1:Z

    .line 1646
    .line 1647
    :cond_7
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1648
    sget-boolean p0, Ll/hbr0;->D1:Z

    .line 1649
    .line 1650
    return p0

    .line 1651
    :goto_7
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1652
    throw v0

    .line 1653
    :sswitch_data_0
    .sparse-switch
        -0x4fd0ea5f -> :sswitch_7
        -0x48b8f57f -> :sswitch_6
        -0x48b8bd30 -> :sswitch_5
        -0x3c588c8a -> :sswitch_4
        -0x2d5172e2 -> :sswitch_3
        -0x3de1850 -> :sswitch_2
        0x341e81 -> :sswitch_1
        0x31316ffa -> :sswitch_0
    .end sparse-switch

    .line 1654
    .line 1655
    .line 1656
    .line 1657
    .line 1658
    .line 1659
    .line 1660
    .line 1661
    .line 1662
    .line 1663
    .line 1664
    .line 1665
    .line 1666
    .line 1667
    .line 1668
    .line 1669
    .line 1670
    .line 1671
    .line 1672
    .line 1673
    .line 1674
    .line 1675
    .line 1676
    .line 1677
    .line 1678
    .line 1679
    .line 1680
    .line 1681
    .line 1682
    .line 1683
    .line 1684
    .line 1685
    .line 1686
    .line 1687
    :sswitch_data_1
    .sparse-switch
        -0x14d76e6c -> :sswitch_10
        -0x132295cd -> :sswitch_f
        0x1e9d52 -> :sswitch_e
        0x1e9d5f -> :sswitch_d
        0x1e9d63 -> :sswitch_c
        0x6a6b6031 -> :sswitch_b
        0x6a6b6034 -> :sswitch_a
        0x6b2deee6 -> :sswitch_9
        0x7e53ab34 -> :sswitch_8
    .end sparse-switch

    .line 1688
    .line 1689
    .line 1690
    .line 1691
    .line 1692
    .line 1693
    .line 1694
    .line 1695
    .line 1696
    .line 1697
    .line 1698
    .line 1699
    .line 1700
    .line 1701
    .line 1702
    .line 1703
    .line 1704
    .line 1705
    .line 1706
    .line 1707
    .line 1708
    .line 1709
    .line 1710
    .line 1711
    .line 1712
    .line 1713
    .line 1714
    .line 1715
    .line 1716
    .line 1717
    .line 1718
    .line 1719
    .line 1720
    .line 1721
    .line 1722
    .line 1723
    .line 1724
    .line 1725
    :sswitch_data_2
    .sparse-switch
        -0x7fd6c3bd -> :sswitch_9c
        -0x7fd6c381 -> :sswitch_9b
        -0x7fd6c368 -> :sswitch_9a
        -0x7d026749 -> :sswitch_99
        -0x78929d6a -> :sswitch_98
        -0x75f50a1e -> :sswitch_97
        -0x75f4fe9d -> :sswitch_96
        -0x736f875c -> :sswitch_95
        -0x736f83c2 -> :sswitch_94
        -0x736f83c1 -> :sswitch_93
        -0x7327ce1c -> :sswitch_92
        -0x705c574b -> :sswitch_91
        -0x651ebb62 -> :sswitch_90
        -0x6423293b -> :sswitch_8f
        -0x604f5117 -> :sswitch_8e
        -0x5f691e13 -> :sswitch_8d
        -0x5ca40cc4 -> :sswitch_8c
        -0x58520ec1 -> :sswitch_8b
        -0x58520eba -> :sswitch_8a
        -0x58520eb9 -> :sswitch_89
        -0x4eaed329 -> :sswitch_88
        -0x4892fb4f -> :sswitch_87
        -0x465b3df3 -> :sswitch_86
        -0x43e6c939 -> :sswitch_85
        -0x3ec0fcc5 -> :sswitch_84
        -0x3b33cca0 -> :sswitch_83
        -0x3b33cc9a -> :sswitch_82
        -0x398ae3f6 -> :sswitch_81
        -0x391f0fb4 -> :sswitch_80
        -0x346837ae -> :sswitch_7f
        -0x323788e3 -> :sswitch_7e
        -0x30f57652 -> :sswitch_7d
        -0x2f88a116 -> :sswitch_7c
        -0x2f61ed98 -> :sswitch_7b
        -0x2efd0837 -> :sswitch_7a
        -0x2e9e9441 -> :sswitch_79
        -0x2247b8b1 -> :sswitch_78
        -0x1f0fa2b7 -> :sswitch_77
        -0x19af3b41 -> :sswitch_76
        -0x114fad3e -> :sswitch_75
        -0x10dae90b -> :sswitch_74
        -0x1084b7b7 -> :sswitch_73
        -0xa5988e9 -> :sswitch_72
        -0x35f9fbf -> :sswitch_71
        0x84e -> :sswitch_70
        0xa04 -> :sswitch_6f
        0xa9b -> :sswitch_6e
        0xa9f -> :sswitch_6d
        0xc13 -> :sswitch_6c
        0xd9b -> :sswitch_6b
        0x11ebd -> :sswitch_6a
        0x12711 -> :sswitch_69
        0x127db -> :sswitch_68
        0x12beb -> :sswitch_67
        0x1334d -> :sswitch_66
        0x135c9 -> :sswitch_65
        0x13aea -> :sswitch_64
        0x158d2 -> :sswitch_63
        0x1821e -> :sswitch_62
        0x18220 -> :sswitch_61
        0x18401 -> :sswitch_60
        0x18c69 -> :sswitch_5f
        0x1716e6 -> :sswitch_5e
        0x171ac8 -> :sswitch_5d
        0x171ac9 -> :sswitch_5c
        0x208c61 -> :sswitch_5b
        0x208c63 -> :sswitch_5a
        0x208c80 -> :sswitch_59
        0x208c9f -> :sswitch_58
        0x208cbe -> :sswitch_57
        0x208cc0 -> :sswitch_56
        0x252f5f -> :sswitch_55
        0x25981d -> :sswitch_54
        0x259b88 -> :sswitch_53
        0x290a13 -> :sswitch_52
        0x3021fd -> :sswitch_51
        0x321e47 -> :sswitch_50
        0x332327 -> :sswitch_4f
        0x33ab63 -> :sswitch_4e
        0x27691fb -> :sswitch_4d
        0x30f8881 -> :sswitch_4c
        0x30f8c42 -> :sswitch_4b
        0x349f581 -> :sswitch_4a
        0x3ab0ea7 -> :sswitch_49
        0x3e53ea5 -> :sswitch_48
        0x3f25a44 -> :sswitch_47
        0x3f25a46 -> :sswitch_46
        0x3f25a49 -> :sswitch_45
        0x3f25e05 -> :sswitch_44
        0x3f25e07 -> :sswitch_43
        0x3f25e09 -> :sswitch_42
        0x3f261c6 -> :sswitch_41
        0x48dce49 -> :sswitch_40
        0x48dd589 -> :sswitch_3f
        0x48dd8af -> :sswitch_3e
        0x4d36832 -> :sswitch_3d
        0x4f0b0e7 -> :sswitch_3c
        0x5e2479e -> :sswitch_3b
        0x60acc05 -> :sswitch_3a
        0x6214744 -> :sswitch_39
        0x9d91379 -> :sswitch_38
        0xadc0551 -> :sswitch_37
        0xea056b3 -> :sswitch_36
        0x1121dbc3 -> :sswitch_35
        0x1255818c -> :sswitch_34
        0x1263990d -> :sswitch_33
        0x12d90f3a -> :sswitch_32
        0x12d90f4c -> :sswitch_31
        0x12d98b1b -> :sswitch_30
        0x12d98b22 -> :sswitch_2f
        0x1844c711 -> :sswitch_2e
        0x1e3e8044 -> :sswitch_2d
        0x2f5336ed -> :sswitch_2c
        0x2f54115e -> :sswitch_2b
        0x2f541849 -> :sswitch_2a
        0x31cf010e -> :sswitch_29
        0x36ad82f4 -> :sswitch_28
        0x391a0b61 -> :sswitch_27
        0x3f3728cd -> :sswitch_26
        0x448ec687 -> :sswitch_25
        0x46260f63 -> :sswitch_24
        0x4c505106 -> :sswitch_23
        0x4de67084 -> :sswitch_22
        0x506ac5a9 -> :sswitch_21
        0x5abad9cd -> :sswitch_20
        0x64d2e6e9 -> :sswitch_1f
        0x64d2eac5 -> :sswitch_1e
        0x65e4085b -> :sswitch_1d
        0x6f373556 -> :sswitch_1c
        0x719f1dcb -> :sswitch_1b
        0x75d9a0f0 -> :sswitch_1a
        0x7796d144 -> :sswitch_19
        0x785bcb26 -> :sswitch_18
        0x78fc0e50 -> :sswitch_17
        0x790521fb -> :sswitch_16
        0x7933207f -> :sswitch_15
        0x7a05a409 -> :sswitch_14
        0x7a0696bd -> :sswitch_13
        0x7a16dfe7 -> :sswitch_12
        0x7a1f0e95 -> :sswitch_11
    .end sparse-switch
.end method

.method public static U0(Landroid/content/Context;Ll/dxy0;Ll/sqr0;ZZ)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzth;
        }
    .end annotation

    .line 1
    iget-object v0, p2, Ll/sqr0;->l:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzgaa;->zzl()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    sget v1, Ll/mpw0;->a:I

    .line 11
    .line 12
    const/16 v2, 0x1a

    .line 13
    .line 14
    if-lt v1, v2, :cond_1

    .line 15
    .line 16
    const-string v1, "video/dolby-vision"

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-static {p0}, Ll/fbr0;->a(Landroid/content/Context;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-nez p0, :cond_1

    .line 29
    .line 30
    invoke-static {p1, p2, p3, p4}, Ll/oxy0;->d(Ll/dxy0;Ll/sqr0;ZZ)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_1
    invoke-static {p1, p2, p3, p4}, Ll/oxy0;->f(Ll/dxy0;Ll/sqr0;ZZ)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public static X0(Ll/hwy0;Ll/sqr0;)I
    .locals 7

    .line 1
    iget v0, p1, Ll/sqr0;->q:I

    .line 2
    .line 3
    iget v1, p1, Ll/sqr0;->r:I

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    if-eq v0, v2, :cond_5

    .line 7
    .line 8
    if-ne v1, v2, :cond_0

    .line 9
    .line 10
    goto/16 :goto_2

    .line 11
    .line 12
    :cond_0
    iget-object v3, p1, Ll/sqr0;->l:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    const-string v4, "video/dolby-vision"

    .line 18
    .line 19
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    const-string v5, "video/avc"

    .line 24
    .line 25
    const-string v6, "video/hevc"

    .line 26
    .line 27
    if-eqz v4, :cond_3

    .line 28
    .line 29
    invoke-static {p1}, Ll/oxy0;->a(Ll/sqr0;)Landroid/util/Pair;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p1, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    const/16 v3, 0x200

    .line 44
    .line 45
    if-eq p1, v3, :cond_1

    .line 46
    .line 47
    const/4 v3, 0x1

    .line 48
    if-eq p1, v3, :cond_1

    .line 49
    .line 50
    const/4 v3, 0x2

    .line 51
    if-ne p1, v3, :cond_2

    .line 52
    .line 53
    :cond_1
    move-object v3, v5

    .line 54
    goto :goto_0

    .line 55
    :cond_2
    move-object v3, v6

    .line 56
    :cond_3
    :goto_0
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    const/4 v4, 0x4

    .line 61
    sparse-switch p1, :sswitch_data_0

    .line 62
    .line 63
    .line 64
    goto/16 :goto_2

    .line 65
    .line 66
    :sswitch_0
    const-string p0, "video/x-vnd.on2.vp9"

    .line 67
    .line 68
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-eqz p0, :cond_5

    .line 73
    .line 74
    const/16 v4, 0x8

    .line 75
    .line 76
    goto/16 :goto_1

    .line 77
    .line 78
    :sswitch_1
    const-string p0, "video/x-vnd.on2.vp8"

    .line 79
    .line 80
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-eqz p0, :cond_5

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :sswitch_2
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-eqz p1, :cond_5

    .line 92
    .line 93
    sget-object p1, Ll/mpw0;->d:Ljava/lang/String;

    .line 94
    .line 95
    const-string v3, "BRAVIA 4K 2015"

    .line 96
    .line 97
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    if-nez v3, :cond_5

    .line 102
    .line 103
    const-string v3, "Amazon"

    .line 104
    .line 105
    sget-object v5, Ll/mpw0;->c:Ljava/lang/String;

    .line 106
    .line 107
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    if-eqz v3, :cond_4

    .line 112
    .line 113
    const-string v3, "KFSOWI"

    .line 114
    .line 115
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    if-nez v3, :cond_5

    .line 120
    .line 121
    const-string v3, "AFTS"

    .line 122
    .line 123
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-eqz p1, :cond_4

    .line 128
    .line 129
    iget-boolean p0, p0, Ll/hwy0;->f:Z

    .line 130
    .line 131
    if-nez p0, :cond_5

    .line 132
    .line 133
    :cond_4
    add-int/lit8 v0, v0, 0xf

    .line 134
    .line 135
    add-int/lit8 v1, v1, 0xf

    .line 136
    .line 137
    div-int/lit8 v0, v0, 0x10

    .line 138
    .line 139
    div-int/lit8 v1, v1, 0x10

    .line 140
    .line 141
    mul-int/2addr v0, v1

    .line 142
    mul-int/lit16 v0, v0, 0x300

    .line 143
    .line 144
    div-int/2addr v0, v4

    .line 145
    return v0

    .line 146
    :sswitch_3
    const-string p0, "video/mp4v-es"

    .line 147
    .line 148
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result p0

    .line 152
    if-eqz p0, :cond_5

    .line 153
    .line 154
    goto :goto_1

    .line 155
    :sswitch_4
    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    if-eqz p0, :cond_5

    .line 160
    .line 161
    mul-int/2addr v0, v1

    .line 162
    mul-int/lit8 v0, v0, 0x3

    .line 163
    .line 164
    div-int/2addr v0, v4

    .line 165
    const/high16 p0, 0x200000

    .line 166
    .line 167
    invoke-static {p0, v0}, Ljava/lang/Math;->max(II)I

    .line 168
    .line 169
    .line 170
    move-result p0

    .line 171
    return p0

    .line 172
    :sswitch_5
    const-string p0, "video/av01"

    .line 173
    .line 174
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result p0

    .line 178
    if-eqz p0, :cond_5

    .line 179
    .line 180
    goto :goto_1

    .line 181
    :sswitch_6
    const-string p0, "video/3gpp"

    .line 182
    .line 183
    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    if-eqz p0, :cond_5

    .line 188
    .line 189
    :goto_1
    mul-int/2addr v0, v1

    .line 190
    mul-int/lit8 v0, v0, 0x3

    .line 191
    .line 192
    div-int/2addr v0, v4

    .line 193
    return v0

    .line 194
    :cond_5
    :goto_2
    return v2

    .line 195
    :sswitch_data_0
    .sparse-switch
        -0x63306f58 -> :sswitch_6
        -0x631b55f6 -> :sswitch_5
        -0x63185e82 -> :sswitch_4
        0x46cdc642 -> :sswitch_3
        0x4f62373a -> :sswitch_2
        0x5f50bed8 -> :sswitch_1
        0x5f50bed9 -> :sswitch_0
    .end sparse-switch
.end method

.method public static Y0(Ll/hwy0;Ll/sqr0;)I
    .locals 3

    .line 1
    iget v0, p1, Ll/sqr0;->m:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    iget-object p0, p1, Ll/sqr0;->n:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    const/4 v0, 0x0

    .line 13
    move v1, v0

    .line 14
    :goto_0
    if-ge v0, p0, :cond_0

    .line 15
    .line 16
    iget-object v2, p1, Ll/sqr0;->n:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, [B

    .line 23
    .line 24
    array-length v2, v2

    .line 25
    add-int/2addr v1, v2

    .line 26
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget p0, p1, Ll/sqr0;->m:I

    .line 30
    .line 31
    add-int/2addr p0, v1

    .line 32
    return p0

    .line 33
    :cond_1
    invoke-static {p0, p1}, Ll/hbr0;->X0(Ll/hwy0;Ll/sqr0;)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method


# virtual methods
.method public final A()V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-super {p0}, Ll/kwy0;->A()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    .line 5
    iput-boolean v0, p0, Ll/hbr0;->x1:Z

    .line 6
    .line 7
    iget-object v0, p0, Ll/hbr0;->k1:Lcom/google/android/gms/internal/ads/zzaak;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/hbr0;->V0()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void

    .line 15
    :catchall_0
    move-exception v1

    .line 16
    iput-boolean v0, p0, Ll/hbr0;->x1:Z

    .line 17
    .line 18
    iget-object v0, p0, Ll/hbr0;->k1:Lcom/google/android/gms/internal/ads/zzaak;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    invoke-virtual {p0}, Ll/hbr0;->V0()V

    .line 24
    .line 25
    .line 26
    :goto_0
    throw v1
.end method

.method public final A0(Ljava/lang/String;Ll/xvy0;JJ)V
    .locals 0

    .line 1
    move-object p2, p1

    .line 2
    iget-object p1, p0, Ll/hbr0;->c1:Ll/ucr0;

    .line 3
    .line 4
    invoke-virtual/range {p1 .. p6}, Ll/ucr0;->a(Ljava/lang/String;JJ)V

    .line 5
    .line 6
    .line 7
    invoke-static {p2}, Ll/hbr0;->T0(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput-boolean p1, p0, Ll/hbr0;->h1:Z

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/kwy0;->N0()Ll/hwy0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    sget p2, Ll/mpw0;->a:I

    .line 21
    .line 22
    const/16 p3, 0x1d

    .line 23
    .line 24
    const/4 p4, 0x0

    .line 25
    if-lt p2, p3, :cond_1

    .line 26
    .line 27
    iget-object p2, p1, Ll/hwy0;->b:Ljava/lang/String;

    .line 28
    .line 29
    const-string p3, "video/x-vnd.on2.vp9"

    .line 30
    .line 31
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/hwy0;->h()[Landroid/media/MediaCodecInfo$CodecProfileLevel;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    array-length p2, p1

    .line 42
    move p3, p4

    .line 43
    :goto_0
    if-ge p3, p2, :cond_1

    .line 44
    .line 45
    aget-object p5, p1, p3

    .line 46
    .line 47
    iget p5, p5, Landroid/media/MediaCodecInfo$CodecProfileLevel;->profile:I

    .line 48
    .line 49
    const/16 p6, 0x4000

    .line 50
    .line 51
    if-ne p5, p6, :cond_0

    .line 52
    .line 53
    const/4 p4, 0x1

    .line 54
    goto :goto_1

    .line 55
    :cond_0
    add-int/lit8 p3, p3, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    :goto_1
    iput-boolean p4, p0, Ll/hbr0;->i1:Z

    .line 59
    .line 60
    return-void
.end method

.method public final B()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/hbr0;->o1:I

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/qwx0;->L()Ll/mfv0;

    .line 5
    .line 6
    .line 7
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    iput-wide v1, p0, Ll/hbr0;->n1:J

    .line 12
    .line 13
    const-wide/16 v1, 0x0

    .line 14
    .line 15
    iput-wide v1, p0, Ll/hbr0;->r1:J

    .line 16
    .line 17
    iput v0, p0, Ll/hbr0;->s1:I

    .line 18
    .line 19
    iget-object p0, p0, Ll/hbr0;->e1:Ll/nbr0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/nbr0;->g()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final B0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hbr0;->c1:Ll/ucr0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ucr0;->b(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final C()V
    .locals 7

    .line 1
    iget v0, p0, Ll/hbr0;->o1:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/qwx0;->L()Ll/mfv0;

    .line 7
    .line 8
    .line 9
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    iget-wide v4, p0, Ll/hbr0;->n1:J

    .line 14
    .line 15
    sub-long v4, v2, v4

    .line 16
    .line 17
    iget-object v0, p0, Ll/hbr0;->c1:Ll/ucr0;

    .line 18
    .line 19
    iget v6, p0, Ll/hbr0;->o1:I

    .line 20
    .line 21
    invoke-virtual {v0, v6, v4, v5}, Ll/ucr0;->d(IJ)V

    .line 22
    .line 23
    .line 24
    iput v1, p0, Ll/hbr0;->o1:I

    .line 25
    .line 26
    iput-wide v2, p0, Ll/hbr0;->n1:J

    .line 27
    .line 28
    :cond_0
    iget v0, p0, Ll/hbr0;->s1:I

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v2, p0, Ll/hbr0;->c1:Ll/ucr0;

    .line 33
    .line 34
    iget-wide v3, p0, Ll/hbr0;->r1:J

    .line 35
    .line 36
    invoke-virtual {v2, v3, v4, v0}, Ll/ucr0;->r(JI)V

    .line 37
    .line 38
    .line 39
    const-wide/16 v2, 0x0

    .line 40
    .line 41
    iput-wide v2, p0, Ll/hbr0;->r1:J

    .line 42
    .line 43
    iput v1, p0, Ll/hbr0;->s1:I

    .line 44
    .line 45
    :cond_1
    iget-object p0, p0, Ll/hbr0;->e1:Ll/nbr0;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/nbr0;->h()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final C0(Ll/sqr0;Landroid/media/MediaFormat;)V
    .locals 8
    .param p2    # Landroid/media/MediaFormat;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/kwy0;->L0()Ll/bwy0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v1, p0, Ll/hbr0;->m1:I

    .line 8
    .line 9
    invoke-interface {v0, v1}, Ll/bwy0;->d(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    const-string v0, "crop-right"

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const-string v2, "crop-top"

    .line 22
    .line 23
    const-string v3, "crop-bottom"

    .line 24
    .line 25
    const-string v4, "crop-left"

    .line 26
    .line 27
    const/4 v5, 0x1

    .line 28
    const/4 v6, 0x0

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-virtual {p2, v4}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p2, v3}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p2, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    move v1, v5

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    move v1, v6

    .line 52
    :goto_0
    if-eqz v1, :cond_2

    .line 53
    .line 54
    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    invoke-virtual {p2, v4}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    sub-int/2addr v0, v4

    .line 63
    add-int/2addr v0, v5

    .line 64
    goto :goto_1

    .line 65
    :cond_2
    const-string v0, "width"

    .line 66
    .line 67
    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    :goto_1
    if-eqz v1, :cond_3

    .line 72
    .line 73
    invoke-virtual {p2, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    invoke-virtual {p2, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    sub-int/2addr v1, p2

    .line 82
    add-int/2addr v1, v5

    .line 83
    goto :goto_2

    .line 84
    :cond_3
    const-string v1, "height"

    .line 85
    .line 86
    invoke-virtual {p2, v1}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    :goto_2
    iget p2, p1, Ll/sqr0;->u:F

    .line 91
    .line 92
    sget v2, Ll/mpw0;->a:I

    .line 93
    .line 94
    iget v2, p1, Ll/sqr0;->t:I

    .line 95
    .line 96
    const/16 v3, 0x5a

    .line 97
    .line 98
    if-eq v2, v3, :cond_4

    .line 99
    .line 100
    const/16 v3, 0x10e

    .line 101
    .line 102
    if-ne v2, v3, :cond_5

    .line 103
    .line 104
    :cond_4
    const/high16 v2, 0x3f800000    # 1.0f

    .line 105
    .line 106
    div-float p2, v2, p2

    .line 107
    .line 108
    move v7, v1

    .line 109
    move v1, v0

    .line 110
    move v0, v7

    .line 111
    :cond_5
    new-instance v2, Ll/aou0;

    .line 112
    .line 113
    invoke-direct {v2, v0, v1, v6, p2}, Ll/aou0;-><init>(IIIF)V

    .line 114
    .line 115
    .line 116
    iput-object v2, p0, Ll/hbr0;->u1:Ll/aou0;

    .line 117
    .line 118
    iget-object v2, p0, Ll/hbr0;->e1:Ll/nbr0;

    .line 119
    .line 120
    iget v3, p1, Ll/sqr0;->s:F

    .line 121
    .line 122
    invoke-virtual {v2, v3}, Ll/nbr0;->l(F)V

    .line 123
    .line 124
    .line 125
    iget-object p0, p0, Ll/hbr0;->A1:Ll/ycr0;

    .line 126
    .line 127
    if-nez p0, :cond_6

    .line 128
    .line 129
    return-void

    .line 130
    :cond_6
    invoke-virtual {p1}, Ll/sqr0;->b()Ll/znr0;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {p0, v0}, Ll/znr0;->C(I)Ll/znr0;

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, v1}, Ll/znr0;->i(I)Ll/znr0;

    .line 138
    .line 139
    .line 140
    invoke-virtual {p0, v6}, Ll/znr0;->v(I)Ll/znr0;

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0, p2}, Ll/znr0;->s(F)Ll/znr0;

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0}, Ll/znr0;->D()Ll/sqr0;

    .line 147
    .line 148
    .line 149
    const/4 p0, 0x0

    .line 150
    throw p0
.end method

.method public final E0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hbr0;->e1:Ll/nbr0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/nbr0;->f()V

    .line 4
    .line 5
    .line 6
    sget v0, Ll/mpw0;->a:I

    .line 7
    .line 8
    iget-object v0, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 9
    .line 10
    invoke-interface {v0}, Ll/zcr0;->zzk()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/kwy0;->J0()J

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    invoke-interface {v0, v1, v2}, Ll/zcr0;->d(J)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final G0(JJLl/bwy0;Ljava/nio/ByteBuffer;IIIJZZLl/sqr0;)Z
    .locals 16
    .param p5    # Ll/bwy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/nio/ByteBuffer;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p5

    .line 4
    .line 5
    move/from16 v2, p7

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1}, Ll/kwy0;->J0()J

    .line 11
    .line 12
    .line 13
    move-result-wide v3

    .line 14
    sub-long v3, p10, v3

    .line 15
    .line 16
    iget-object v5, v1, Ll/hbr0;->e1:Ll/nbr0;

    .line 17
    .line 18
    invoke-virtual {v1}, Ll/kwy0;->K0()J

    .line 19
    .line 20
    .line 21
    move-result-wide v12

    .line 22
    iget-object v15, v1, Ll/hbr0;->f1:Ll/lbr0;

    .line 23
    .line 24
    move-wide/from16 v8, p1

    .line 25
    .line 26
    move-wide/from16 v10, p3

    .line 27
    .line 28
    move-wide/from16 v6, p10

    .line 29
    .line 30
    move/from16 v14, p13

    .line 31
    .line 32
    invoke-virtual/range {v5 .. v15}, Ll/nbr0;->a(JJJJZLl/lbr0;)I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    const/4 v6, 0x1

    .line 37
    if-eqz p12, :cond_1

    .line 38
    .line 39
    if-eqz p13, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-virtual {v1, v0, v2, v3, v4}, Ll/hbr0;->a1(Ll/bwy0;IJ)V

    .line 43
    .line 44
    .line 45
    return v6

    .line 46
    :cond_1
    :goto_0
    iget-object v7, v1, Ll/hbr0;->j1:Landroid/view/Surface;

    .line 47
    .line 48
    iget-object v8, v1, Ll/hbr0;->k1:Lcom/google/android/gms/internal/ads/zzaak;

    .line 49
    .line 50
    const/4 v9, 0x0

    .line 51
    if-ne v7, v8, :cond_2

    .line 52
    .line 53
    iget-object v5, v1, Ll/hbr0;->f1:Ll/lbr0;

    .line 54
    .line 55
    invoke-virtual {v5}, Ll/lbr0;->c()J

    .line 56
    .line 57
    .line 58
    move-result-wide v7

    .line 59
    const-wide/16 v10, 0x7530

    .line 60
    .line 61
    cmp-long v5, v7, v10

    .line 62
    .line 63
    if-gez v5, :cond_3

    .line 64
    .line 65
    invoke-virtual {v1, v0, v2, v3, v4}, Ll/hbr0;->a1(Ll/bwy0;IJ)V

    .line 66
    .line 67
    .line 68
    iget-object v0, v1, Ll/hbr0;->f1:Ll/lbr0;

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/lbr0;->c()J

    .line 71
    .line 72
    .line 73
    move-result-wide v2

    .line 74
    invoke-virtual {v1, v2, v3}, Ll/hbr0;->S0(J)V

    .line 75
    .line 76
    .line 77
    return v6

    .line 78
    :cond_2
    iget-object v7, v1, Ll/hbr0;->A1:Ll/ycr0;

    .line 79
    .line 80
    if-nez v7, :cond_9

    .line 81
    .line 82
    if-eqz v5, :cond_8

    .line 83
    .line 84
    if-eq v5, v6, :cond_6

    .line 85
    .line 86
    const/4 v7, 0x2

    .line 87
    if-eq v5, v7, :cond_5

    .line 88
    .line 89
    const/4 v7, 0x3

    .line 90
    if-eq v5, v7, :cond_4

    .line 91
    .line 92
    :cond_3
    return v9

    .line 93
    :cond_4
    invoke-virtual {v1, v0, v2, v3, v4}, Ll/hbr0;->a1(Ll/bwy0;IJ)V

    .line 94
    .line 95
    .line 96
    iget-object v0, v1, Ll/hbr0;->f1:Ll/lbr0;

    .line 97
    .line 98
    invoke-virtual {v0}, Ll/lbr0;->c()J

    .line 99
    .line 100
    .line 101
    move-result-wide v2

    .line 102
    invoke-virtual {v1, v2, v3}, Ll/hbr0;->S0(J)V

    .line 103
    .line 104
    .line 105
    return v6

    .line 106
    :cond_5
    sget v3, Ll/mpw0;->a:I

    .line 107
    .line 108
    const-string v3, "dropVideoBuffer"

    .line 109
    .line 110
    invoke-static {v3}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    invoke-interface {v0, v2, v9}, Ll/bwy0;->e(IZ)V

    .line 114
    .line 115
    .line 116
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1, v9, v6}, Ll/hbr0;->R0(II)V

    .line 120
    .line 121
    .line 122
    iget-object v0, v1, Ll/hbr0;->f1:Ll/lbr0;

    .line 123
    .line 124
    invoke-virtual {v0}, Ll/lbr0;->c()J

    .line 125
    .line 126
    .line 127
    move-result-wide v2

    .line 128
    invoke-virtual {v1, v2, v3}, Ll/hbr0;->S0(J)V

    .line 129
    .line 130
    .line 131
    return v6

    .line 132
    :cond_6
    iget-object v5, v1, Ll/hbr0;->f1:Ll/lbr0;

    .line 133
    .line 134
    invoke-virtual {v5}, Ll/lbr0;->d()J

    .line 135
    .line 136
    .line 137
    move-result-wide v7

    .line 138
    invoke-virtual {v5}, Ll/lbr0;->c()J

    .line 139
    .line 140
    .line 141
    move-result-wide v9

    .line 142
    sget v5, Ll/mpw0;->a:I

    .line 143
    .line 144
    iget-wide v11, v1, Ll/hbr0;->t1:J

    .line 145
    .line 146
    cmp-long v5, v7, v11

    .line 147
    .line 148
    if-nez v5, :cond_7

    .line 149
    .line 150
    invoke-virtual {v1, v0, v2, v3, v4}, Ll/hbr0;->a1(Ll/bwy0;IJ)V

    .line 151
    .line 152
    .line 153
    move-wide v2, v7

    .line 154
    goto :goto_1

    .line 155
    :cond_7
    move-object/from16 p9, v0

    .line 156
    .line 157
    move-object/from16 p8, v1

    .line 158
    .line 159
    move/from16 p10, v2

    .line 160
    .line 161
    move-wide/from16 p11, v3

    .line 162
    .line 163
    move-wide/from16 p13, v7

    .line 164
    .line 165
    invoke-virtual/range {p8 .. p14}, Ll/hbr0;->Z0(Ll/bwy0;IJJ)V

    .line 166
    .line 167
    .line 168
    move-wide/from16 v2, p13

    .line 169
    .line 170
    :goto_1
    invoke-virtual {v1, v9, v10}, Ll/hbr0;->S0(J)V

    .line 171
    .line 172
    .line 173
    iput-wide v2, v1, Ll/hbr0;->t1:J

    .line 174
    .line 175
    return v6

    .line 176
    :cond_8
    move-wide v2, v3

    .line 177
    invoke-virtual {v1}, Ll/qwx0;->L()Ll/mfv0;

    .line 178
    .line 179
    .line 180
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 181
    .line 182
    .line 183
    move-result-wide v4

    .line 184
    sget v0, Ll/mpw0;->a:I

    .line 185
    .line 186
    move-object/from16 p9, p5

    .line 187
    .line 188
    move/from16 p10, p7

    .line 189
    .line 190
    move-object/from16 p8, v1

    .line 191
    .line 192
    move-wide/from16 p11, v2

    .line 193
    .line 194
    move-wide/from16 p13, v4

    .line 195
    .line 196
    invoke-virtual/range {p8 .. p14}, Ll/hbr0;->Z0(Ll/bwy0;IJJ)V

    .line 197
    .line 198
    .line 199
    iget-object v0, v1, Ll/hbr0;->f1:Ll/lbr0;

    .line 200
    .line 201
    invoke-virtual {v0}, Ll/lbr0;->c()J

    .line 202
    .line 203
    .line 204
    move-result-wide v2

    .line 205
    invoke-virtual {v1, v2, v3}, Ll/hbr0;->S0(J)V

    .line 206
    .line 207
    .line 208
    return v6

    .line 209
    :cond_9
    const/4 v0, 0x0

    .line 210
    :try_start_0
    throw v0
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzabn; {:try_start_0 .. :try_end_0} :catch_0

    .line 211
    :catch_0
    move-exception v0

    .line 212
    iget-object v2, v0, Lcom/google/android/gms/internal/ads/zzabn;->zza:Ll/sqr0;

    .line 213
    .line 214
    const/16 v3, 0x1b59

    .line 215
    .line 216
    invoke-virtual {v1, v0, v2, v9, v3}, Ll/qwx0;->M(Ljava/lang/Throwable;Ll/sqr0;ZI)Lcom/google/android/gms/internal/ads/zziz;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    throw v0
.end method

.method public final I0(Ll/evx0;)I
    .locals 0

    .line 1
    sget p0, Ll/mpw0;->a:I

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0
.end method

.method public final M0(Ljava/lang/Throwable;Ll/hwy0;)Lcom/google/android/gms/internal/ads/zzst;
    .locals 1
    .param p2    # Ll/hwy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/ads/zzaae;

    .line 2
    .line 3
    iget-object p0, p0, Ll/hbr0;->j1:Landroid/view/Surface;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2, p0}, Lcom/google/android/gms/internal/ads/zzaae;-><init>(Ljava/lang/Throwable;Ll/hwy0;Landroid/view/Surface;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public final P()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/hbr0;->v1:Ll/aou0;

    .line 3
    .line 4
    iget-object v0, p0, Ll/hbr0;->e1:Ll/nbr0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/nbr0;->d()V

    .line 7
    .line 8
    .line 9
    sget v0, Ll/mpw0;->a:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/hbr0;->l1:Z

    .line 13
    .line 14
    :try_start_0
    invoke-super {p0}, Ll/kwy0;->P()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/hbr0;->c1:Ll/ucr0;

    .line 18
    .line 19
    iget-object v1, p0, Ll/kwy0;->T0:Ll/vwx0;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/ucr0;->c(Ll/vwx0;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/hbr0;->c1:Ll/ucr0;

    .line 25
    .line 26
    sget-object v0, Ll/aou0;->e:Ll/aou0;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/ucr0;->t(Ll/aou0;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    iget-object v1, p0, Ll/hbr0;->c1:Ll/ucr0;

    .line 34
    .line 35
    iget-object v2, p0, Ll/kwy0;->T0:Ll/vwx0;

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ll/ucr0;->c(Ll/vwx0;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/hbr0;->c1:Ll/ucr0;

    .line 41
    .line 42
    sget-object v1, Ll/aou0;->e:Ll/aou0;

    .line 43
    .line 44
    invoke-virtual {p0, v1}, Ll/ucr0;->t(Ll/aou0;)V

    .line 45
    .line 46
    .line 47
    throw v0
.end method

.method public final P0(J)V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/kwy0;->P0(J)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Ll/hbr0;->q1:I

    .line 5
    .line 6
    add-int/lit8 p1, p1, -0x1

    .line 7
    .line 8
    iput p1, p0, Ll/hbr0;->q1:I

    .line 9
    .line 10
    return-void
.end method

.method public final Q(ZZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/kwy0;->Q(ZZ)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/qwx0;->N()Ll/dfy0;

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/hbr0;->c1:Ll/ucr0;

    .line 8
    .line 9
    iget-object v0, p0, Ll/kwy0;->T0:Ll/vwx0;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ll/ucr0;->e(Ll/vwx0;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/hbr0;->e1:Ll/nbr0;

    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ll/nbr0;->e(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final Q0(Ll/evx0;)V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    iget p1, p0, Ll/hbr0;->q1:I

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    iput p1, p0, Ll/hbr0;->q1:I

    .line 6
    .line 7
    sget p0, Ll/mpw0;->a:I

    .line 8
    .line 9
    return-void
.end method

.method public final R()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hbr0;->e1:Ll/nbr0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qwx0;->L()Ll/mfv0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/nbr0;->k(Ll/mfv0;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 11
    .line 12
    invoke-interface {p0, v1}, Ll/zcr0;->e(Ll/mfv0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final R0(II)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kwy0;->T0:Ll/vwx0;

    .line 2
    .line 3
    iget v1, v0, Ll/vwx0;->h:I

    .line 4
    .line 5
    add-int/2addr v1, p1

    .line 6
    iput v1, v0, Ll/vwx0;->h:I

    .line 7
    .line 8
    iget v1, v0, Ll/vwx0;->g:I

    .line 9
    .line 10
    add-int/2addr p1, p2

    .line 11
    add-int/2addr v1, p1

    .line 12
    iput v1, v0, Ll/vwx0;->g:I

    .line 13
    .line 14
    iget p2, p0, Ll/hbr0;->o1:I

    .line 15
    .line 16
    add-int/2addr p2, p1

    .line 17
    iput p2, p0, Ll/hbr0;->o1:I

    .line 18
    .line 19
    iget p2, p0, Ll/hbr0;->p1:I

    .line 20
    .line 21
    add-int/2addr p2, p1

    .line 22
    iput p2, p0, Ll/hbr0;->p1:I

    .line 23
    .line 24
    iget p0, v0, Ll/vwx0;->i:I

    .line 25
    .line 26
    invoke-static {p2, p0}, Ljava/lang/Math;->max(II)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    iput p0, v0, Ll/vwx0;->i:I

    .line 31
    .line 32
    return-void
.end method

.method public final S(JZ)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hbr0;->A1:Ll/ycr0;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    invoke-super {p0, p1, p2, p3}, Ll/kwy0;->S(JZ)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 9
    .line 10
    invoke-interface {p1}, Ll/zcr0;->zzk()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/kwy0;->J0()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    invoke-interface {p1, v0, v1}, Ll/zcr0;->d(J)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p1, p0, Ll/hbr0;->e1:Ll/nbr0;

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/nbr0;->i()V

    .line 28
    .line 29
    .line 30
    if-eqz p3, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Ll/hbr0;->e1:Ll/nbr0;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/nbr0;->c()V

    .line 35
    .line 36
    .line 37
    :cond_1
    sget p1, Ll/mpw0;->a:I

    .line 38
    .line 39
    const/4 p1, 0x0

    .line 40
    iput p1, p0, Ll/hbr0;->p1:I

    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    const/4 p0, 0x0

    .line 44
    throw p0
.end method

.method public final S0(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kwy0;->T0:Ll/vwx0;

    .line 2
    .line 3
    iget-wide v1, v0, Ll/vwx0;->k:J

    .line 4
    .line 5
    add-long/2addr v1, p1

    .line 6
    iput-wide v1, v0, Ll/vwx0;->k:J

    .line 7
    .line 8
    iget v1, v0, Ll/vwx0;->l:I

    .line 9
    .line 10
    add-int/lit8 v1, v1, 0x1

    .line 11
    .line 12
    iput v1, v0, Ll/vwx0;->l:I

    .line 13
    .line 14
    iget-wide v0, p0, Ll/hbr0;->r1:J

    .line 15
    .line 16
    add-long/2addr v0, p1

    .line 17
    iput-wide v0, p0, Ll/hbr0;->r1:J

    .line 18
    .line 19
    iget p1, p0, Ll/hbr0;->s1:I

    .line 20
    .line 21
    add-int/lit8 p1, p1, 0x1

    .line 22
    .line 23
    iput p1, p0, Ll/hbr0;->s1:I

    .line 24
    .line 25
    return-void
.end method

.method public final T(FLl/sqr0;[Ll/sqr0;)F
    .locals 3

    .line 1
    const/4 p0, 0x0

    .line 2
    const/high16 p2, -0x40800000    # -1.0f

    .line 3
    .line 4
    move v0, p2

    .line 5
    :goto_0
    array-length v1, p3

    .line 6
    if-ge p0, v1, :cond_1

    .line 7
    .line 8
    aget-object v1, p3, p0

    .line 9
    .line 10
    iget v1, v1, Ll/sqr0;->s:F

    .line 11
    .line 12
    cmpl-float v2, v1, p2

    .line 13
    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    cmpl-float p0, v0, p2

    .line 24
    .line 25
    if-nez p0, :cond_2

    .line 26
    .line 27
    return p2

    .line 28
    :cond_2
    mul-float/2addr v0, p1

    .line 29
    return v0
.end method

.method public final U(Ll/dxy0;Ll/sqr0;)I
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzth;
        }
    .end annotation

    .line 1
    iget-object v0, p2, Ll/sqr0;->l:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/a8t0;->h(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x80

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return v1

    .line 12
    :cond_0
    iget-object v0, p2, Ll/sqr0;->o:Lcom/google/android/gms/internal/ads/zzae;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    const/4 v3, 0x0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    move v0, v2

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    move v0, v3

    .line 21
    :goto_0
    iget-object v4, p0, Ll/hbr0;->a1:Landroid/content/Context;

    .line 22
    .line 23
    invoke-static {v4, p1, p2, v0, v3}, Ll/hbr0;->U0(Landroid/content/Context;Ll/dxy0;Ll/sqr0;ZZ)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    if-eqz v5, :cond_2

    .line 34
    .line 35
    iget-object v4, p0, Ll/hbr0;->a1:Landroid/content/Context;

    .line 36
    .line 37
    invoke-static {v4, p1, p2, v3, v3}, Ll/hbr0;->U0(Landroid/content/Context;Ll/dxy0;Ll/sqr0;ZZ)Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    :cond_2
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    if-eqz v5, :cond_3

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_3
    invoke-static {p2}, Ll/kwy0;->e0(Ll/sqr0;)Z

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    if-nez v5, :cond_4

    .line 53
    .line 54
    const/4 v2, 0x2

    .line 55
    :goto_1
    or-int/lit16 p0, v2, 0x80

    .line 56
    .line 57
    return p0

    .line 58
    :cond_4
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    check-cast v5, Ll/hwy0;

    .line 63
    .line 64
    invoke-virtual {v5, p2}, Ll/hwy0;->e(Ll/sqr0;)Z

    .line 65
    .line 66
    .line 67
    move-result v6

    .line 68
    if-nez v6, :cond_6

    .line 69
    .line 70
    move v7, v2

    .line 71
    :goto_2
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 72
    .line 73
    .line 74
    move-result v8

    .line 75
    if-ge v7, v8, :cond_6

    .line 76
    .line 77
    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v8

    .line 81
    check-cast v8, Ll/hwy0;

    .line 82
    .line 83
    invoke-virtual {v8, p2}, Ll/hwy0;->e(Ll/sqr0;)Z

    .line 84
    .line 85
    .line 86
    move-result v9

    .line 87
    if-eqz v9, :cond_5

    .line 88
    .line 89
    move v6, v2

    .line 90
    move v4, v3

    .line 91
    move-object v5, v8

    .line 92
    goto :goto_3

    .line 93
    :cond_5
    add-int/lit8 v7, v7, 0x1

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_6
    move v4, v2

    .line 97
    :goto_3
    if-eq v2, v6, :cond_7

    .line 98
    .line 99
    const/4 v7, 0x3

    .line 100
    goto :goto_4

    .line 101
    :cond_7
    const/4 v7, 0x4

    .line 102
    :goto_4
    invoke-virtual {v5, p2}, Ll/hwy0;->f(Ll/sqr0;)Z

    .line 103
    .line 104
    .line 105
    move-result v8

    .line 106
    if-eq v2, v8, :cond_8

    .line 107
    .line 108
    const/16 v8, 0x8

    .line 109
    .line 110
    goto :goto_5

    .line 111
    :cond_8
    const/16 v8, 0x10

    .line 112
    .line 113
    :goto_5
    iget-boolean v5, v5, Ll/hwy0;->g:Z

    .line 114
    .line 115
    if-eq v2, v5, :cond_9

    .line 116
    .line 117
    move v5, v3

    .line 118
    goto :goto_6

    .line 119
    :cond_9
    const/16 v5, 0x40

    .line 120
    .line 121
    :goto_6
    if-eq v2, v4, :cond_a

    .line 122
    .line 123
    move v1, v3

    .line 124
    :cond_a
    sget v4, Ll/mpw0;->a:I

    .line 125
    .line 126
    const/16 v9, 0x1a

    .line 127
    .line 128
    if-lt v4, v9, :cond_b

    .line 129
    .line 130
    iget-object v4, p2, Ll/sqr0;->l:Ljava/lang/String;

    .line 131
    .line 132
    const-string v9, "video/dolby-vision"

    .line 133
    .line 134
    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    if-eqz v4, :cond_b

    .line 139
    .line 140
    iget-object v4, p0, Ll/hbr0;->a1:Landroid/content/Context;

    .line 141
    .line 142
    invoke-static {v4}, Ll/fbr0;->a(Landroid/content/Context;)Z

    .line 143
    .line 144
    .line 145
    move-result v4

    .line 146
    if-nez v4, :cond_b

    .line 147
    .line 148
    const/16 v1, 0x100

    .line 149
    .line 150
    :cond_b
    if-eqz v6, :cond_c

    .line 151
    .line 152
    iget-object p0, p0, Ll/hbr0;->a1:Landroid/content/Context;

    .line 153
    .line 154
    invoke-static {p0, p1, p2, v0, v2}, Ll/hbr0;->U0(Landroid/content/Context;Ll/dxy0;Ll/sqr0;ZZ)Ljava/util/List;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    if-nez p1, :cond_c

    .line 163
    .line 164
    invoke-static {p0, p2}, Ll/oxy0;->g(Ljava/util/List;Ll/sqr0;)Ljava/util/List;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    check-cast p0, Ll/hwy0;

    .line 173
    .line 174
    invoke-virtual {p0, p2}, Ll/hwy0;->e(Ll/sqr0;)Z

    .line 175
    .line 176
    .line 177
    move-result p1

    .line 178
    if-eqz p1, :cond_c

    .line 179
    .line 180
    invoke-virtual {p0, p2}, Ll/hwy0;->f(Ll/sqr0;)Z

    .line 181
    .line 182
    .line 183
    move-result p0

    .line 184
    if-eqz p0, :cond_c

    .line 185
    .line 186
    const/16 v3, 0x20

    .line 187
    .line 188
    :cond_c
    or-int p0, v7, v8

    .line 189
    .line 190
    or-int/2addr p0, v3

    .line 191
    or-int/2addr p0, v5

    .line 192
    or-int/2addr p0, v1

    .line 193
    return p0
.end method

.method public final V(Ll/sqr0;)V
    .locals 3
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/hbr0;->w1:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/hbr0;->x1:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/zcr0;->zzk()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    :try_start_0
    iget-object v0, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Ll/zcr0;->b(Ll/sqr0;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/kwy0;->J0()J

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    invoke-interface {v0, v1, v2}, Ll/zcr0;->d(J)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/hbr0;->z1:Ll/kbr0;

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object v1, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 36
    .line 37
    invoke-interface {v1, v0}, Ll/zcr0;->f(Ll/kbr0;)V
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzabn; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catch_0
    move-exception v0

    .line 42
    const/4 v1, 0x0

    .line 43
    const/16 v2, 0x1b58

    .line 44
    .line 45
    invoke-virtual {p0, v0, p1, v1, v2}, Ll/qwx0;->M(Ljava/lang/Throwable;Ll/sqr0;ZI)Lcom/google/android/gms/internal/ads/zziz;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    throw p0

    .line 50
    :cond_0
    :goto_0
    iget-object p1, p0, Ll/hbr0;->A1:Ll/ycr0;

    .line 51
    .line 52
    if-nez p1, :cond_2

    .line 53
    .line 54
    iget-object p1, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 55
    .line 56
    invoke-interface {p1}, Ll/zcr0;->zzk()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-nez p1, :cond_1

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_1
    iget-object p1, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 64
    .line 65
    invoke-interface {p1}, Ll/zcr0;->zzb()Ll/ycr0;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iput-object p1, p0, Ll/hbr0;->A1:Ll/ycr0;

    .line 70
    .line 71
    invoke-static {}, Lcom/google/android/gms/internal/ads/u3;->b()Ljava/util/concurrent/Executor;

    .line 72
    .line 73
    .line 74
    const/4 p0, 0x0

    .line 75
    throw p0

    .line 76
    :cond_2
    :goto_1
    const/4 p1, 0x1

    .line 77
    iput-boolean p1, p0, Ll/hbr0;->x1:Z

    .line 78
    .line 79
    return-void
.end method

.method public final V0()V
    .locals 3
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x11
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hbr0;->j1:Landroid/view/Surface;

    .line 2
    .line 3
    iget-object v1, p0, Ll/hbr0;->k1:Lcom/google/android/gms/internal/ads/zzaak;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iput-object v2, p0, Ll/hbr0;->j1:Landroid/view/Surface;

    .line 9
    .line 10
    :cond_0
    if-eqz v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/google/android/gms/internal/ads/zzaak;->release()V

    .line 13
    .line 14
    .line 15
    iput-object v2, p0, Ll/hbr0;->k1:Lcom/google/android/gms/internal/ads/zzaak;

    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method public final W0(Ll/hwy0;)Z
    .locals 3

    .line 1
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x17

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-lt v0, v1, :cond_1

    .line 7
    .line 8
    iget-object v0, p1, Ll/hwy0;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Ll/hbr0;->T0(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget-boolean p1, p1, Ll/hwy0;->f:Z

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/hbr0;->a1:Landroid/content/Context;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/google/android/gms/internal/ads/zzaak;->b(Landroid/content/Context;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    return v2

    .line 30
    :cond_0
    return v0

    .line 31
    :cond_1
    return v2
.end method

.method public final X()V
    .locals 1
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/kwy0;->X()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/hbr0;->q1:I

    .line 6
    .line 7
    return-void
.end method

.method public final Z0(Ll/bwy0;IJJ)V
    .locals 0
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x15
    .end annotation

    .line 1
    sget p3, Ll/mpw0;->a:I

    .line 2
    .line 3
    const-string p3, "releaseOutputBuffer"

    .line 4
    .line 5
    invoke-static {p3}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p1, p2, p5, p6}, Ll/bwy0;->h(IJ)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/kwy0;->T0:Ll/vwx0;

    .line 15
    .line 16
    iget p2, p1, Ll/vwx0;->e:I

    .line 17
    .line 18
    const/4 p3, 0x1

    .line 19
    add-int/2addr p2, p3

    .line 20
    iput p2, p1, Ll/vwx0;->e:I

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    iput p1, p0, Ll/hbr0;->p1:I

    .line 24
    .line 25
    iget-object p1, p0, Ll/hbr0;->A1:Ll/ycr0;

    .line 26
    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    iget-object p1, p0, Ll/hbr0;->u1:Ll/aou0;

    .line 30
    .line 31
    sget-object p2, Ll/aou0;->e:Ll/aou0;

    .line 32
    .line 33
    invoke-virtual {p1, p2}, Ll/aou0;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    if-nez p2, :cond_0

    .line 38
    .line 39
    iget-object p2, p0, Ll/hbr0;->v1:Ll/aou0;

    .line 40
    .line 41
    invoke-virtual {p1, p2}, Ll/aou0;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    if-nez p2, :cond_0

    .line 46
    .line 47
    iput-object p1, p0, Ll/hbr0;->v1:Ll/aou0;

    .line 48
    .line 49
    iget-object p2, p0, Ll/hbr0;->c1:Ll/ucr0;

    .line 50
    .line 51
    invoke-virtual {p2, p1}, Ll/ucr0;->t(Ll/aou0;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object p1, p0, Ll/hbr0;->e1:Ll/nbr0;

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/nbr0;->p()Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_1

    .line 61
    .line 62
    iget-object p1, p0, Ll/hbr0;->j1:Landroid/view/Surface;

    .line 63
    .line 64
    if-eqz p1, :cond_1

    .line 65
    .line 66
    iget-object p2, p0, Ll/hbr0;->c1:Ll/ucr0;

    .line 67
    .line 68
    invoke-virtual {p2, p1}, Ll/ucr0;->q(Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    iput-boolean p3, p0, Ll/hbr0;->l1:Z

    .line 72
    .line 73
    :cond_1
    return-void
.end method

.method public final a1(Ll/bwy0;IJ)V
    .locals 0

    .line 1
    sget p3, Ll/mpw0;->a:I

    .line 2
    .line 3
    const-string p3, "skipVideoBuffer"

    .line 4
    .line 5
    invoke-static {p3}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p3, 0x0

    .line 9
    invoke-interface {p1, p2, p3}, Ll/bwy0;->e(IZ)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/kwy0;->T0:Ll/vwx0;

    .line 16
    .line 17
    iget p1, p0, Ll/vwx0;->f:I

    .line 18
    .line 19
    add-int/lit8 p1, p1, 0x1

    .line 20
    .line 21
    iput p1, p0, Ll/vwx0;->f:I

    .line 22
    .line 23
    return-void
.end method

.method public final d0(Ll/hwy0;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hbr0;->j1:Landroid/view/Surface;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/hbr0;->W0(Ll/hwy0;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public final e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "MediaCodecVideoRenderer"

    .line 2
    .line 3
    return-object p0
.end method

.method public final i(JJ)Z
    .locals 2

    .line 1
    const-wide/16 v0, -0x7530

    .line 2
    .line 3
    cmp-long p0, p1, v0

    .line 4
    .line 5
    if-gez p0, :cond_0

    .line 6
    .line 7
    const-wide/32 p0, 0x186a0

    .line 8
    .line 9
    .line 10
    cmp-long p0, p3, p0

    .line 11
    .line 12
    if-lez p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public final j(JJJZZ)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    const-wide/32 p5, -0x7a120

    .line 2
    .line 3
    .line 4
    cmp-long p1, p1, p5

    .line 5
    .line 6
    if-gez p1, :cond_3

    .line 7
    .line 8
    if-nez p7, :cond_3

    .line 9
    .line 10
    invoke-virtual {p0, p3, p4}, Ll/qwx0;->J(J)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    iget-object p2, p0, Ll/kwy0;->T0:Ll/vwx0;

    .line 18
    .line 19
    const/4 p3, 0x1

    .line 20
    if-eqz p8, :cond_1

    .line 21
    .line 22
    iget p4, p2, Ll/vwx0;->d:I

    .line 23
    .line 24
    add-int/2addr p4, p1

    .line 25
    iput p4, p2, Ll/vwx0;->d:I

    .line 26
    .line 27
    iget p1, p2, Ll/vwx0;->f:I

    .line 28
    .line 29
    iget p4, p0, Ll/hbr0;->q1:I

    .line 30
    .line 31
    add-int/2addr p1, p4

    .line 32
    iput p1, p2, Ll/vwx0;->f:I

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    iget p4, p2, Ll/vwx0;->j:I

    .line 36
    .line 37
    add-int/2addr p4, p3

    .line 38
    iput p4, p2, Ll/vwx0;->j:I

    .line 39
    .line 40
    iget p2, p0, Ll/hbr0;->q1:I

    .line 41
    .line 42
    invoke-virtual {p0, p1, p2}, Ll/hbr0;->R0(II)V

    .line 43
    .line 44
    .line 45
    :goto_0
    invoke-virtual {p0}, Ll/kwy0;->Z()Z

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/hbr0;->A1:Ll/ycr0;

    .line 49
    .line 50
    if-nez p0, :cond_2

    .line 51
    .line 52
    return p3

    .line 53
    :cond_2
    const/4 p0, 0x0

    .line 54
    throw p0

    .line 55
    :cond_3
    :goto_1
    const/4 p0, 0x0

    .line 56
    return p0
.end method

.method public final j0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hbr0;->v1:Ll/aou0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/hbr0;->c1:Ll/ucr0;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/ucr0;->t(Ll/aou0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final p(FF)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/kwy0;->p(FF)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ll/hbr0;->e1:Ll/nbr0;

    .line 5
    .line 6
    invoke-virtual {p2, p1}, Ll/nbr0;->n(F)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/hbr0;->A1:Ll/ycr0;

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    throw p0
.end method

.method public final r()Z
    .locals 4

    .line 1
    invoke-super {p0}, Ll/kwy0;->r()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Ll/hbr0;->A1:Ll/ycr0;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    move v0, v1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    throw p0

    .line 16
    :cond_1
    const/4 v0, 0x0

    .line 17
    :goto_0
    if-eqz v0, :cond_4

    .line 18
    .line 19
    iget-object v2, p0, Ll/hbr0;->k1:Lcom/google/android/gms/internal/ads/zzaak;

    .line 20
    .line 21
    if-eqz v2, :cond_2

    .line 22
    .line 23
    iget-object v3, p0, Ll/hbr0;->j1:Landroid/view/Surface;

    .line 24
    .line 25
    if-eq v3, v2, :cond_3

    .line 26
    .line 27
    :cond_2
    invoke-virtual {p0}, Ll/kwy0;->L0()Ll/bwy0;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    if-eqz v2, :cond_3

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_3
    return v1

    .line 35
    :cond_4
    :goto_1
    iget-object p0, p0, Ll/hbr0;->e1:Ll/nbr0;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ll/nbr0;->o(Z)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0
.end method

.method public final r0(Ll/hwy0;Ll/sqr0;Ll/sqr0;)Ll/zwx0;
    .locals 8

    .line 1
    invoke-virtual {p1, p2, p3}, Ll/hwy0;->b(Ll/sqr0;Ll/sqr0;)Ll/zwx0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, v0, Ll/zwx0;->e:I

    .line 6
    .line 7
    iget-object p0, p0, Ll/hbr0;->g1:Ll/gbr0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    iget v2, p3, Ll/sqr0;->q:I

    .line 13
    .line 14
    iget v3, p0, Ll/gbr0;->a:I

    .line 15
    .line 16
    if-gt v2, v3, :cond_0

    .line 17
    .line 18
    iget v2, p3, Ll/sqr0;->r:I

    .line 19
    .line 20
    iget v3, p0, Ll/gbr0;->b:I

    .line 21
    .line 22
    if-le v2, v3, :cond_1

    .line 23
    .line 24
    :cond_0
    or-int/lit16 v1, v1, 0x100

    .line 25
    .line 26
    :cond_1
    invoke-static {p1, p3}, Ll/hbr0;->Y0(Ll/hwy0;Ll/sqr0;)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    iget p0, p0, Ll/gbr0;->c:I

    .line 31
    .line 32
    if-le v2, p0, :cond_2

    .line 33
    .line 34
    or-int/lit8 v1, v1, 0x40

    .line 35
    .line 36
    :cond_2
    iget-object v3, p1, Ll/hwy0;->a:Ljava/lang/String;

    .line 37
    .line 38
    new-instance v2, Ll/zwx0;

    .line 39
    .line 40
    const/4 p0, 0x0

    .line 41
    if-eqz v1, :cond_3

    .line 42
    .line 43
    move v6, p0

    .line 44
    move v7, v1

    .line 45
    :goto_0
    move-object v4, p2

    .line 46
    move-object v5, p3

    .line 47
    goto :goto_1

    .line 48
    :cond_3
    iget p1, v0, Ll/zwx0;->d:I

    .line 49
    .line 50
    move v7, p0

    .line 51
    move v6, p1

    .line 52
    goto :goto_0

    .line 53
    :goto_1
    invoke-direct/range {v2 .. v7}, Ll/zwx0;-><init>(Ljava/lang/String;Ll/sqr0;Ll/sqr0;II)V

    .line 54
    .line 55
    .line 56
    return-object v2
.end method

.method public final s0(Ll/l9y0;)Ll/zwx0;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/kwy0;->s0(Ll/l9y0;)Ll/zwx0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p1, p1, Ll/l9y0;->a:Ll/sqr0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/hbr0;->c1:Ll/ucr0;

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0}, Ll/ucr0;->f(Ll/sqr0;Ll/zwx0;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public final u(ILjava/lang/Object;)V
    .locals 4
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p1, v0, :cond_6

    .line 3
    .line 4
    const/4 v1, 0x7

    .line 5
    if-eq p1, v1, :cond_5

    .line 6
    .line 7
    const/16 v1, 0xa

    .line 8
    .line 9
    if-eq p1, v1, :cond_4

    .line 10
    .line 11
    const/4 v1, 0x4

    .line 12
    if-eq p1, v1, :cond_3

    .line 13
    .line 14
    const/4 v1, 0x5

    .line 15
    if-eq p1, v1, :cond_2

    .line 16
    .line 17
    const/16 v1, 0xd

    .line 18
    .line 19
    if-eq p1, v1, :cond_1

    .line 20
    .line 21
    const/16 v0, 0xe

    .line 22
    .line 23
    if-eq p1, v0, :cond_0

    .line 24
    .line 25
    goto/16 :goto_4

    .line 26
    .line 27
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    check-cast p2, Ll/chw0;

    .line 31
    .line 32
    invoke-virtual {p2}, Ll/chw0;->b()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_11

    .line 37
    .line 38
    invoke-virtual {p2}, Ll/chw0;->a()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_11

    .line 43
    .line 44
    iget-object p1, p0, Ll/hbr0;->j1:Landroid/view/Surface;

    .line 45
    .line 46
    if-eqz p1, :cond_11

    .line 47
    .line 48
    iget-object p0, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 49
    .line 50
    invoke-interface {p0, p1, p2}, Ll/zcr0;->g(Landroid/view/Surface;Ll/chw0;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 58
    .line 59
    check-cast p2, Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {p1, p2}, Ll/zcr0;->c(Ljava/util/List;)V

    .line 62
    .line 63
    .line 64
    iput-boolean v0, p0, Ll/hbr0;->w1:Z

    .line 65
    .line 66
    return-void

    .line 67
    :cond_2
    iget-object p0, p0, Ll/hbr0;->e1:Ll/nbr0;

    .line 68
    .line 69
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    .line 71
    .line 72
    check-cast p2, Ljava/lang/Integer;

    .line 73
    .line 74
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    invoke-virtual {p0, p1}, Ll/nbr0;->j(I)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_3
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 83
    .line 84
    .line 85
    check-cast p2, Ljava/lang/Integer;

    .line 86
    .line 87
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    iput p1, p0, Ll/hbr0;->m1:I

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/kwy0;->L0()Ll/bwy0;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    if-eqz p0, :cond_11

    .line 98
    .line 99
    invoke-interface {p0, p1}, Ll/bwy0;->d(I)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 104
    .line 105
    .line 106
    check-cast p2, Ljava/lang/Integer;

    .line 107
    .line 108
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    iget p2, p0, Ll/hbr0;->y1:I

    .line 113
    .line 114
    if-eq p2, p1, :cond_11

    .line 115
    .line 116
    iput p1, p0, Ll/hbr0;->y1:I

    .line 117
    .line 118
    return-void

    .line 119
    :cond_5
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 120
    .line 121
    .line 122
    check-cast p2, Ll/kbr0;

    .line 123
    .line 124
    iput-object p2, p0, Ll/hbr0;->z1:Ll/kbr0;

    .line 125
    .line 126
    iget-object p0, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 127
    .line 128
    invoke-interface {p0, p2}, Ll/zcr0;->f(Ll/kbr0;)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_6
    instance-of p1, p2, Landroid/view/Surface;

    .line 133
    .line 134
    const/4 v0, 0x0

    .line 135
    if-eqz p1, :cond_7

    .line 136
    .line 137
    check-cast p2, Landroid/view/Surface;

    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_7
    move-object p2, v0

    .line 141
    :goto_0
    if-nez p2, :cond_9

    .line 142
    .line 143
    iget-object p1, p0, Ll/hbr0;->k1:Lcom/google/android/gms/internal/ads/zzaak;

    .line 144
    .line 145
    if-eqz p1, :cond_8

    .line 146
    .line 147
    move-object p2, p1

    .line 148
    goto :goto_1

    .line 149
    :cond_8
    invoke-virtual {p0}, Ll/kwy0;->N0()Ll/hwy0;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    if-eqz p1, :cond_9

    .line 154
    .line 155
    invoke-virtual {p0, p1}, Ll/hbr0;->W0(Ll/hwy0;)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-eqz v1, :cond_9

    .line 160
    .line 161
    iget-object p2, p0, Ll/hbr0;->a1:Landroid/content/Context;

    .line 162
    .line 163
    iget-boolean p1, p1, Ll/hwy0;->f:Z

    .line 164
    .line 165
    invoke-static {p2, p1}, Lcom/google/android/gms/internal/ads/zzaak;->a(Landroid/content/Context;Z)Lcom/google/android/gms/internal/ads/zzaak;

    .line 166
    .line 167
    .line 168
    move-result-object p2

    .line 169
    iput-object p2, p0, Ll/hbr0;->k1:Lcom/google/android/gms/internal/ads/zzaak;

    .line 170
    .line 171
    :cond_9
    :goto_1
    iget-object p1, p0, Ll/hbr0;->j1:Landroid/view/Surface;

    .line 172
    .line 173
    if-eq p1, p2, :cond_10

    .line 174
    .line 175
    iput-object p2, p0, Ll/hbr0;->j1:Landroid/view/Surface;

    .line 176
    .line 177
    iget-object p1, p0, Ll/hbr0;->e1:Ll/nbr0;

    .line 178
    .line 179
    invoke-virtual {p1, p2}, Ll/nbr0;->m(Landroid/view/Surface;)V

    .line 180
    .line 181
    .line 182
    const/4 p1, 0x0

    .line 183
    iput-boolean p1, p0, Ll/hbr0;->l1:Z

    .line 184
    .line 185
    invoke-virtual {p0}, Ll/qwx0;->s()I

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    invoke-virtual {p0}, Ll/kwy0;->L0()Ll/bwy0;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    if-eqz v1, :cond_c

    .line 194
    .line 195
    iget-object v2, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 196
    .line 197
    invoke-interface {v2}, Ll/zcr0;->zzk()Z

    .line 198
    .line 199
    .line 200
    move-result v2

    .line 201
    if-nez v2, :cond_c

    .line 202
    .line 203
    sget v2, Ll/mpw0;->a:I

    .line 204
    .line 205
    const/16 v3, 0x17

    .line 206
    .line 207
    if-lt v2, v3, :cond_b

    .line 208
    .line 209
    if-eqz p2, :cond_a

    .line 210
    .line 211
    iget-boolean v2, p0, Ll/hbr0;->h1:Z

    .line 212
    .line 213
    if-nez v2, :cond_b

    .line 214
    .line 215
    invoke-interface {v1, p2}, Ll/bwy0;->b(Landroid/view/Surface;)V

    .line 216
    .line 217
    .line 218
    goto :goto_2

    .line 219
    :cond_a
    move-object p2, v0

    .line 220
    :cond_b
    invoke-virtual {p0}, Ll/kwy0;->W()V

    .line 221
    .line 222
    .line 223
    invoke-virtual {p0}, Ll/kwy0;->O0()V

    .line 224
    .line 225
    .line 226
    :cond_c
    :goto_2
    if-eqz p2, :cond_e

    .line 227
    .line 228
    iget-object v1, p0, Ll/hbr0;->k1:Lcom/google/android/gms/internal/ads/zzaak;

    .line 229
    .line 230
    if-eq p2, v1, :cond_e

    .line 231
    .line 232
    invoke-virtual {p0}, Ll/hbr0;->j0()V

    .line 233
    .line 234
    .line 235
    const/4 v0, 0x2

    .line 236
    if-ne p1, v0, :cond_d

    .line 237
    .line 238
    iget-object p1, p0, Ll/hbr0;->e1:Ll/nbr0;

    .line 239
    .line 240
    invoke-virtual {p1}, Ll/nbr0;->c()V

    .line 241
    .line 242
    .line 243
    :cond_d
    iget-object p1, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 244
    .line 245
    invoke-interface {p1}, Ll/zcr0;->zzk()Z

    .line 246
    .line 247
    .line 248
    move-result p1

    .line 249
    if-eqz p1, :cond_f

    .line 250
    .line 251
    iget-object p0, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 252
    .line 253
    sget-object p1, Ll/chw0;->c:Ll/chw0;

    .line 254
    .line 255
    invoke-interface {p0, p2, p1}, Ll/zcr0;->g(Landroid/view/Surface;Ll/chw0;)V

    .line 256
    .line 257
    .line 258
    goto :goto_3

    .line 259
    :cond_e
    iput-object v0, p0, Ll/hbr0;->v1:Ll/aou0;

    .line 260
    .line 261
    iget-object p1, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 262
    .line 263
    invoke-interface {p1}, Ll/zcr0;->zzk()Z

    .line 264
    .line 265
    .line 266
    move-result p1

    .line 267
    if-eqz p1, :cond_f

    .line 268
    .line 269
    iget-object p0, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 270
    .line 271
    invoke-interface {p0}, Ll/zcr0;->zzc()V

    .line 272
    .line 273
    .line 274
    :cond_f
    :goto_3
    sget p0, Ll/mpw0;->a:I

    .line 275
    .line 276
    return-void

    .line 277
    :cond_10
    if-eqz p2, :cond_11

    .line 278
    .line 279
    iget-object p1, p0, Ll/hbr0;->k1:Lcom/google/android/gms/internal/ads/zzaak;

    .line 280
    .line 281
    if-eq p2, p1, :cond_11

    .line 282
    .line 283
    invoke-virtual {p0}, Ll/hbr0;->j0()V

    .line 284
    .line 285
    .line 286
    iget-object p1, p0, Ll/hbr0;->j1:Landroid/view/Surface;

    .line 287
    .line 288
    if-eqz p1, :cond_11

    .line 289
    .line 290
    iget-boolean p2, p0, Ll/hbr0;->l1:Z

    .line 291
    .line 292
    if-eqz p2, :cond_11

    .line 293
    .line 294
    iget-object p0, p0, Ll/hbr0;->c1:Ll/ucr0;

    .line 295
    .line 296
    invoke-virtual {p0, p1}, Ll/ucr0;->q(Ljava/lang/Object;)V

    .line 297
    .line 298
    .line 299
    :cond_11
    :goto_4
    return-void
.end method

.method public final v0(Ll/hwy0;Ll/sqr0;Landroid/media/MediaCrypto;F)Ll/xvy0;
    .locals 20
    .param p3    # Landroid/media/MediaCrypto;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p4

    .line 8
    .line 9
    iget-object v4, v0, Ll/hbr0;->k1:Lcom/google/android/gms/internal/ads/zzaak;

    .line 10
    .line 11
    if-eqz v4, :cond_0

    .line 12
    .line 13
    iget-boolean v5, v1, Ll/hwy0;->f:Z

    .line 14
    .line 15
    iget-boolean v4, v4, Lcom/google/android/gms/internal/ads/zzaak;->zza:Z

    .line 16
    .line 17
    if-eq v4, v5, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/hbr0;->V0()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v4, v1, Ll/hwy0;->c:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/qwx0;->F()[Ll/sqr0;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    iget v6, v2, Ll/sqr0;->q:I

    .line 29
    .line 30
    iget v7, v2, Ll/sqr0;->r:I

    .line 31
    .line 32
    invoke-static/range {p1 .. p2}, Ll/hbr0;->Y0(Ll/hwy0;Ll/sqr0;)I

    .line 33
    .line 34
    .line 35
    move-result v8

    .line 36
    array-length v9, v5

    .line 37
    const/4 v10, -0x1

    .line 38
    const/4 v13, 0x1

    .line 39
    if-ne v9, v13, :cond_2

    .line 40
    .line 41
    if-eq v8, v10, :cond_1

    .line 42
    .line 43
    invoke-static/range {p1 .. p2}, Ll/hbr0;->X0(Ll/hwy0;Ll/sqr0;)I

    .line 44
    .line 45
    .line 46
    move-result v5

    .line 47
    if-eq v5, v10, :cond_1

    .line 48
    .line 49
    int-to-float v8, v8

    .line 50
    const/high16 v9, 0x3fc00000    # 1.5f

    .line 51
    .line 52
    mul-float/2addr v8, v9

    .line 53
    float-to-int v8, v8

    .line 54
    invoke-static {v8, v5}, Ljava/lang/Math;->min(II)I

    .line 55
    .line 56
    .line 57
    move-result v8

    .line 58
    :cond_1
    const/16 p3, 0x0

    .line 59
    .line 60
    goto/16 :goto_9

    .line 61
    .line 62
    :cond_2
    const/4 v14, 0x0

    .line 63
    const/4 v15, 0x0

    .line 64
    :goto_0
    if-ge v14, v9, :cond_7

    .line 65
    .line 66
    const/16 p3, 0x0

    .line 67
    .line 68
    aget-object v11, v5, v14

    .line 69
    .line 70
    iget-object v12, v2, Ll/sqr0;->x:Ll/wwy0;

    .line 71
    .line 72
    if-eqz v12, :cond_3

    .line 73
    .line 74
    iget-object v12, v11, Ll/sqr0;->x:Ll/wwy0;

    .line 75
    .line 76
    if-nez v12, :cond_3

    .line 77
    .line 78
    invoke-virtual {v11}, Ll/sqr0;->b()Ll/znr0;

    .line 79
    .line 80
    .line 81
    move-result-object v11

    .line 82
    iget-object v12, v2, Ll/sqr0;->x:Ll/wwy0;

    .line 83
    .line 84
    invoke-virtual {v11, v12}, Ll/znr0;->a(Ll/wwy0;)Ll/znr0;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v11}, Ll/znr0;->D()Ll/sqr0;

    .line 88
    .line 89
    .line 90
    move-result-object v11

    .line 91
    :cond_3
    invoke-virtual {v1, v2, v11}, Ll/hwy0;->b(Ll/sqr0;Ll/sqr0;)Ll/zwx0;

    .line 92
    .line 93
    .line 94
    move-result-object v12

    .line 95
    iget v12, v12, Ll/zwx0;->d:I

    .line 96
    .line 97
    if-eqz v12, :cond_6

    .line 98
    .line 99
    iget v12, v11, Ll/sqr0;->q:I

    .line 100
    .line 101
    if-eq v12, v10, :cond_4

    .line 102
    .line 103
    iget v13, v11, Ll/sqr0;->r:I

    .line 104
    .line 105
    if-ne v13, v10, :cond_5

    .line 106
    .line 107
    :cond_4
    const/4 v13, 0x1

    .line 108
    goto :goto_1

    .line 109
    :cond_5
    const/4 v13, 0x0

    .line 110
    :goto_1
    or-int/2addr v15, v13

    .line 111
    invoke-static {v6, v12}, Ljava/lang/Math;->max(II)I

    .line 112
    .line 113
    .line 114
    move-result v6

    .line 115
    iget v12, v11, Ll/sqr0;->r:I

    .line 116
    .line 117
    invoke-static {v7, v12}, Ljava/lang/Math;->max(II)I

    .line 118
    .line 119
    .line 120
    move-result v7

    .line 121
    invoke-static {v1, v11}, Ll/hbr0;->Y0(Ll/hwy0;Ll/sqr0;)I

    .line 122
    .line 123
    .line 124
    move-result v11

    .line 125
    invoke-static {v8, v11}, Ljava/lang/Math;->max(II)I

    .line 126
    .line 127
    .line 128
    move-result v8

    .line 129
    :cond_6
    add-int/lit8 v14, v14, 0x1

    .line 130
    .line 131
    const/4 v13, 0x1

    .line 132
    goto :goto_0

    .line 133
    :cond_7
    const/16 p3, 0x0

    .line 134
    .line 135
    if-eqz v15, :cond_11

    .line 136
    .line 137
    new-instance v5, Ljava/lang/StringBuilder;

    .line 138
    .line 139
    const-string v9, "Resolutions unknown. Codec max resolution: "

    .line 140
    .line 141
    invoke-direct {v5, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string v9, "x"

    .line 148
    .line 149
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v5

    .line 159
    const-string v10, "MediaCodecVideoRenderer"

    .line 160
    .line 161
    invoke-static {v10, v5}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    iget v5, v2, Ll/sqr0;->r:I

    .line 165
    .line 166
    iget v11, v2, Ll/sqr0;->q:I

    .line 167
    .line 168
    if-le v5, v11, :cond_8

    .line 169
    .line 170
    const/4 v12, 0x1

    .line 171
    goto :goto_2

    .line 172
    :cond_8
    const/4 v12, 0x0

    .line 173
    :goto_2
    if-eqz v12, :cond_9

    .line 174
    .line 175
    move v13, v5

    .line 176
    :goto_3
    const/4 v14, 0x1

    .line 177
    goto :goto_4

    .line 178
    :cond_9
    move v13, v11

    .line 179
    goto :goto_3

    .line 180
    :goto_4
    if-ne v14, v12, :cond_a

    .line 181
    .line 182
    move v5, v11

    .line 183
    :cond_a
    sget-object v11, Ll/hbr0;->B1:[I

    .line 184
    .line 185
    const/4 v14, 0x0

    .line 186
    :goto_5
    const/16 v15, 0x9

    .line 187
    .line 188
    if-ge v14, v15, :cond_b

    .line 189
    .line 190
    int-to-float v15, v5

    .line 191
    move-object/from16 v16, v11

    .line 192
    .line 193
    int-to-float v11, v13

    .line 194
    move/from16 v17, v11

    .line 195
    .line 196
    aget v11, v16, v14

    .line 197
    .line 198
    move/from16 v18, v14

    .line 199
    .line 200
    int-to-float v14, v11

    .line 201
    if-le v11, v13, :cond_b

    .line 202
    .line 203
    div-float v15, v15, v17

    .line 204
    .line 205
    mul-float/2addr v14, v15

    .line 206
    float-to-int v14, v14

    .line 207
    if-gt v14, v5, :cond_c

    .line 208
    .line 209
    :cond_b
    move-object/from16 v5, p3

    .line 210
    .line 211
    goto :goto_8

    .line 212
    :cond_c
    sget v15, Ll/mpw0;->a:I

    .line 213
    .line 214
    const/4 v15, 0x1

    .line 215
    if-eq v15, v12, :cond_d

    .line 216
    .line 217
    move/from16 v17, v5

    .line 218
    .line 219
    move v5, v11

    .line 220
    goto :goto_6

    .line 221
    :cond_d
    move/from16 v17, v5

    .line 222
    .line 223
    move v5, v14

    .line 224
    :goto_6
    if-ne v15, v12, :cond_e

    .line 225
    .line 226
    goto :goto_7

    .line 227
    :cond_e
    move v11, v14

    .line 228
    :goto_7
    invoke-virtual {v1, v5, v11}, Ll/hwy0;->a(II)Landroid/graphics/Point;

    .line 229
    .line 230
    .line 231
    move-result-object v5

    .line 232
    iget v11, v2, Ll/sqr0;->s:F

    .line 233
    .line 234
    if-eqz v5, :cond_f

    .line 235
    .line 236
    float-to-double v14, v11

    .line 237
    iget v11, v5, Landroid/graphics/Point;->x:I

    .line 238
    .line 239
    move/from16 v19, v12

    .line 240
    .line 241
    iget v12, v5, Landroid/graphics/Point;->y:I

    .line 242
    .line 243
    invoke-virtual {v1, v11, v12, v14, v15}, Ll/hwy0;->g(IID)Z

    .line 244
    .line 245
    .line 246
    move-result v11

    .line 247
    if-eqz v11, :cond_10

    .line 248
    .line 249
    goto :goto_8

    .line 250
    :cond_f
    move/from16 v19, v12

    .line 251
    .line 252
    :cond_10
    add-int/lit8 v14, v18, 0x1

    .line 253
    .line 254
    move-object/from16 v11, v16

    .line 255
    .line 256
    move/from16 v5, v17

    .line 257
    .line 258
    move/from16 v12, v19

    .line 259
    .line 260
    goto :goto_5

    .line 261
    :goto_8
    if-eqz v5, :cond_11

    .line 262
    .line 263
    iget v11, v5, Landroid/graphics/Point;->x:I

    .line 264
    .line 265
    invoke-static {v6, v11}, Ljava/lang/Math;->max(II)I

    .line 266
    .line 267
    .line 268
    move-result v6

    .line 269
    iget v5, v5, Landroid/graphics/Point;->y:I

    .line 270
    .line 271
    invoke-static {v7, v5}, Ljava/lang/Math;->max(II)I

    .line 272
    .line 273
    .line 274
    move-result v7

    .line 275
    invoke-virtual {v2}, Ll/sqr0;->b()Ll/znr0;

    .line 276
    .line 277
    .line 278
    move-result-object v5

    .line 279
    invoke-virtual {v5, v6}, Ll/znr0;->C(I)Ll/znr0;

    .line 280
    .line 281
    .line 282
    invoke-virtual {v5, v7}, Ll/znr0;->i(I)Ll/znr0;

    .line 283
    .line 284
    .line 285
    invoke-virtual {v5}, Ll/znr0;->D()Ll/sqr0;

    .line 286
    .line 287
    .line 288
    move-result-object v5

    .line 289
    invoke-static {v1, v5}, Ll/hbr0;->X0(Ll/hwy0;Ll/sqr0;)I

    .line 290
    .line 291
    .line 292
    move-result v5

    .line 293
    invoke-static {v8, v5}, Ljava/lang/Math;->max(II)I

    .line 294
    .line 295
    .line 296
    move-result v8

    .line 297
    new-instance v5, Ljava/lang/StringBuilder;

    .line 298
    .line 299
    const-string v11, "Codec max resolution adjusted to: "

    .line 300
    .line 301
    invoke-direct {v5, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 302
    .line 303
    .line 304
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 308
    .line 309
    .line 310
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v5

    .line 317
    invoke-static {v10, v5}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 318
    .line 319
    .line 320
    :cond_11
    :goto_9
    new-instance v5, Ll/gbr0;

    .line 321
    .line 322
    invoke-direct {v5, v6, v7, v8}, Ll/gbr0;-><init>(III)V

    .line 323
    .line 324
    .line 325
    iput-object v5, v0, Ll/hbr0;->g1:Ll/gbr0;

    .line 326
    .line 327
    iget-boolean v6, v0, Ll/hbr0;->d1:Z

    .line 328
    .line 329
    new-instance v7, Landroid/media/MediaFormat;

    .line 330
    .line 331
    invoke-direct {v7}, Landroid/media/MediaFormat;-><init>()V

    .line 332
    .line 333
    .line 334
    const-string v8, "mime"

    .line 335
    .line 336
    invoke-virtual {v7, v8, v4}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 337
    .line 338
    .line 339
    iget v4, v2, Ll/sqr0;->q:I

    .line 340
    .line 341
    const-string v8, "width"

    .line 342
    .line 343
    invoke-virtual {v7, v8, v4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 344
    .line 345
    .line 346
    iget v4, v2, Ll/sqr0;->r:I

    .line 347
    .line 348
    const-string v8, "height"

    .line 349
    .line 350
    invoke-virtual {v7, v8, v4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 351
    .line 352
    .line 353
    iget-object v4, v2, Ll/sqr0;->n:Ljava/util/List;

    .line 354
    .line 355
    invoke-static {v7, v4}, Ll/g8w0;->b(Landroid/media/MediaFormat;Ljava/util/List;)V

    .line 356
    .line 357
    .line 358
    iget v4, v2, Ll/sqr0;->s:F

    .line 359
    .line 360
    const/high16 v8, -0x40800000    # -1.0f

    .line 361
    .line 362
    cmpl-float v9, v4, v8

    .line 363
    .line 364
    if-eqz v9, :cond_12

    .line 365
    .line 366
    const-string v9, "frame-rate"

    .line 367
    .line 368
    invoke-virtual {v7, v9, v4}, Landroid/media/MediaFormat;->setFloat(Ljava/lang/String;F)V

    .line 369
    .line 370
    .line 371
    :cond_12
    iget v4, v2, Ll/sqr0;->t:I

    .line 372
    .line 373
    const-string v9, "rotation-degrees"

    .line 374
    .line 375
    invoke-static {v7, v9, v4}, Ll/g8w0;->a(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 376
    .line 377
    .line 378
    iget-object v4, v2, Ll/sqr0;->x:Ll/wwy0;

    .line 379
    .line 380
    if-eqz v4, :cond_13

    .line 381
    .line 382
    const-string v9, "color-transfer"

    .line 383
    .line 384
    iget v10, v4, Ll/wwy0;->c:I

    .line 385
    .line 386
    invoke-static {v7, v9, v10}, Ll/g8w0;->a(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 387
    .line 388
    .line 389
    const-string v9, "color-standard"

    .line 390
    .line 391
    iget v10, v4, Ll/wwy0;->a:I

    .line 392
    .line 393
    invoke-static {v7, v9, v10}, Ll/g8w0;->a(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 394
    .line 395
    .line 396
    const-string v9, "color-range"

    .line 397
    .line 398
    iget v10, v4, Ll/wwy0;->b:I

    .line 399
    .line 400
    invoke-static {v7, v9, v10}, Ll/g8w0;->a(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 401
    .line 402
    .line 403
    iget-object v4, v4, Ll/wwy0;->d:[B

    .line 404
    .line 405
    if-eqz v4, :cond_13

    .line 406
    .line 407
    const-string v9, "hdr-static-info"

    .line 408
    .line 409
    invoke-static {v4}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 410
    .line 411
    .line 412
    move-result-object v4

    .line 413
    invoke-virtual {v7, v9, v4}, Landroid/media/MediaFormat;->setByteBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 414
    .line 415
    .line 416
    :cond_13
    iget-object v4, v2, Ll/sqr0;->l:Ljava/lang/String;

    .line 417
    .line 418
    const-string v9, "video/dolby-vision"

    .line 419
    .line 420
    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 421
    .line 422
    .line 423
    move-result v4

    .line 424
    if-eqz v4, :cond_14

    .line 425
    .line 426
    invoke-static {v2}, Ll/oxy0;->a(Ll/sqr0;)Landroid/util/Pair;

    .line 427
    .line 428
    .line 429
    move-result-object v4

    .line 430
    if-eqz v4, :cond_14

    .line 431
    .line 432
    iget-object v4, v4, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 433
    .line 434
    check-cast v4, Ljava/lang/Integer;

    .line 435
    .line 436
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 437
    .line 438
    .line 439
    move-result v4

    .line 440
    const-string v9, "profile"

    .line 441
    .line 442
    invoke-static {v7, v9, v4}, Ll/g8w0;->a(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 443
    .line 444
    .line 445
    :cond_14
    iget v4, v5, Ll/gbr0;->a:I

    .line 446
    .line 447
    const-string v9, "max-width"

    .line 448
    .line 449
    invoke-virtual {v7, v9, v4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 450
    .line 451
    .line 452
    iget v4, v5, Ll/gbr0;->b:I

    .line 453
    .line 454
    const-string v9, "max-height"

    .line 455
    .line 456
    invoke-virtual {v7, v9, v4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 457
    .line 458
    .line 459
    iget v4, v5, Ll/gbr0;->c:I

    .line 460
    .line 461
    const-string v5, "max-input-size"

    .line 462
    .line 463
    invoke-static {v7, v5, v4}, Ll/g8w0;->a(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 464
    .line 465
    .line 466
    sget v4, Ll/mpw0;->a:I

    .line 467
    .line 468
    const/16 v5, 0x17

    .line 469
    .line 470
    if-lt v4, v5, :cond_15

    .line 471
    .line 472
    const-string v4, "priority"

    .line 473
    .line 474
    const/4 v5, 0x0

    .line 475
    invoke-virtual {v7, v4, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 476
    .line 477
    .line 478
    cmpl-float v4, v3, v8

    .line 479
    .line 480
    if-eqz v4, :cond_15

    .line 481
    .line 482
    const-string v4, "operating-rate"

    .line 483
    .line 484
    invoke-virtual {v7, v4, v3}, Landroid/media/MediaFormat;->setFloat(Ljava/lang/String;F)V

    .line 485
    .line 486
    .line 487
    :cond_15
    if-eqz v6, :cond_16

    .line 488
    .line 489
    const-string v3, "no-post-process"

    .line 490
    .line 491
    const/4 v14, 0x1

    .line 492
    invoke-virtual {v7, v3, v14}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 493
    .line 494
    .line 495
    const-string v3, "auto-frc"

    .line 496
    .line 497
    const/4 v5, 0x0

    .line 498
    invoke-virtual {v7, v3, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 499
    .line 500
    .line 501
    :cond_16
    iget-object v3, v0, Ll/hbr0;->j1:Landroid/view/Surface;

    .line 502
    .line 503
    if-nez v3, :cond_19

    .line 504
    .line 505
    invoke-virtual/range {p0 .. p1}, Ll/hbr0;->W0(Ll/hwy0;)Z

    .line 506
    .line 507
    .line 508
    move-result v3

    .line 509
    if-eqz v3, :cond_18

    .line 510
    .line 511
    iget-object v3, v0, Ll/hbr0;->k1:Lcom/google/android/gms/internal/ads/zzaak;

    .line 512
    .line 513
    if-nez v3, :cond_17

    .line 514
    .line 515
    iget-object v3, v0, Ll/hbr0;->a1:Landroid/content/Context;

    .line 516
    .line 517
    iget-boolean v4, v1, Ll/hwy0;->f:Z

    .line 518
    .line 519
    invoke-static {v3, v4}, Lcom/google/android/gms/internal/ads/zzaak;->a(Landroid/content/Context;Z)Lcom/google/android/gms/internal/ads/zzaak;

    .line 520
    .line 521
    .line 522
    move-result-object v3

    .line 523
    iput-object v3, v0, Ll/hbr0;->k1:Lcom/google/android/gms/internal/ads/zzaak;

    .line 524
    .line 525
    :cond_17
    iget-object v3, v0, Ll/hbr0;->k1:Lcom/google/android/gms/internal/ads/zzaak;

    .line 526
    .line 527
    iput-object v3, v0, Ll/hbr0;->j1:Landroid/view/Surface;

    .line 528
    .line 529
    goto :goto_a

    .line 530
    :cond_18
    invoke-static {}, Ll/wpg0;->a()V

    .line 531
    .line 532
    .line 533
    return-object p3

    .line 534
    :cond_19
    :goto_a
    iget-object v3, v0, Ll/hbr0;->A1:Ll/ycr0;

    .line 535
    .line 536
    if-nez v3, :cond_1a

    .line 537
    .line 538
    iget-object v0, v0, Ll/hbr0;->j1:Landroid/view/Surface;

    .line 539
    .line 540
    move-object/from16 v3, p3

    .line 541
    .line 542
    invoke-static {v1, v7, v2, v0, v3}, Ll/xvy0;->b(Ll/hwy0;Landroid/media/MediaFormat;Ll/sqr0;Landroid/view/Surface;Landroid/media/MediaCrypto;)Ll/xvy0;

    .line 543
    .line 544
    .line 545
    move-result-object v0

    .line 546
    return-object v0

    .line 547
    :cond_1a
    move-object/from16 v3, p3

    .line 548
    .line 549
    throw v3
.end method

.method public final w(JJ)V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/kwy0;->w(JJ)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/hbr0;->A1:Ll/ycr0;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 p1, 0x0

    .line 10
    :try_start_0
    throw p1
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzabn; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    :catch_0
    move-exception p1

    .line 12
    iget-object p2, p1, Lcom/google/android/gms/internal/ads/zzabn;->zza:Ll/sqr0;

    .line 13
    .line 14
    const/4 p3, 0x0

    .line 15
    const/16 p4, 0x1b59

    .line 16
    .line 17
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/qwx0;->M(Ljava/lang/Throwable;Ll/sqr0;ZI)Lcom/google/android/gms/internal/ads/zziz;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    throw p0
.end method

.method public final w0(Ll/dxy0;Ll/sqr0;Z)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzth;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hbr0;->a1:Landroid/content/Context;

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    invoke-static {p0, p1, p2, p3, p3}, Ll/hbr0;->U0(Landroid/content/Context;Ll/dxy0;Ll/sqr0;ZZ)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-static {p0, p2}, Ll/oxy0;->g(Ljava/util/List;Ll/sqr0;)Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final x(JJZ)Z
    .locals 0

    .line 1
    const-wide/16 p3, -0x7530

    .line 2
    .line 3
    cmp-long p0, p1, p3

    .line 4
    .line 5
    if-gez p0, :cond_0

    .line 6
    .line 7
    if-nez p5, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public final y0(Ll/evx0;)V
    .locals 7
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1d
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/hbr0;->i1:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object p1, p1, Ll/evx0;->g:Ljava/nio/ByteBuffer;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x7

    .line 16
    if-lt v0, v1, :cond_2

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    const/4 v5, 0x0

    .line 39
    invoke-virtual {p1, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 40
    .line 41
    .line 42
    const/16 v6, -0x4b

    .line 43
    .line 44
    if-ne v0, v6, :cond_2

    .line 45
    .line 46
    const/16 v0, 0x3c

    .line 47
    .line 48
    if-ne v1, v0, :cond_2

    .line 49
    .line 50
    const/4 v0, 0x1

    .line 51
    if-ne v2, v0, :cond_2

    .line 52
    .line 53
    const/4 v1, 0x4

    .line 54
    if-ne v3, v1, :cond_2

    .line 55
    .line 56
    if-eqz v4, :cond_1

    .line 57
    .line 58
    if-ne v4, v0, :cond_2

    .line 59
    .line 60
    :cond_1
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    new-array v0, v0, [B

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ll/kwy0;->L0()Ll/bwy0;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 77
    .line 78
    .line 79
    new-instance p1, Landroid/os/Bundle;

    .line 80
    .line 81
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 82
    .line 83
    .line 84
    const-string v1, "hdr10-plus-info"

    .line 85
    .line 86
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    .line 87
    .line 88
    .line 89
    invoke-interface {p0, p1}, Ll/bwy0;->F(Landroid/os/Bundle;)V

    .line 90
    .line 91
    .line 92
    :cond_2
    :goto_0
    return-void
.end method

.method public final z()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/zcr0;->zzk()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/hbr0;->b1:Ll/zcr0;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/zcr0;->zze()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final z0(Ljava/lang/Exception;)V
    .locals 2

    .line 1
    const-string v0, "MediaCodecVideoRenderer"

    .line 2
    .line 3
    const-string v1, "Video codec error"

    .line 4
    .line 5
    invoke-static {v0, v1, p1}, Ll/y4w0;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/hbr0;->c1:Ll/ucr0;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/ucr0;->s(Ljava/lang/Exception;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final zzV()Z
    .locals 1

    .line 1
    invoke-super {p0}, Ll/kwy0;->zzV()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Ll/hbr0;->A1:Ll/ycr0;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    throw p0

    .line 15
    :cond_1
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final zzs()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hbr0;->e1:Ll/nbr0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/nbr0;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
