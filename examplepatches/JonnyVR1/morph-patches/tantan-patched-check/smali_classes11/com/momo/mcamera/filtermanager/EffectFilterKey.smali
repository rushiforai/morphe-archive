.class public Lcom/momo/mcamera/filtermanager/EffectFilterKey;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile effectFilterKey:Lcom/momo/mcamera/filtermanager/EffectFilterKey;


# instance fields
.field public effectFilterMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 6
    .line 7
    new-instance v0, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->reflectEffectFilter()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static getInstance()Lcom/momo/mcamera/filtermanager/EffectFilterKey;
    .locals 2

    .line 1
    sget-object v0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterKey:Lcom/momo/mcamera/filtermanager/EffectFilterKey;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterKey:Lcom/momo/mcamera/filtermanager/EffectFilterKey;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/momo/mcamera/filtermanager/EffectFilterKey;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/momo/mcamera/filtermanager/EffectFilterKey;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterKey:Lcom/momo/mcamera/filtermanager/EffectFilterKey;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterKey:Lcom/momo/mcamera/filtermanager/EffectFilterKey;

    .line 27
    .line 28
    return-object v0
.end method

.method private reflectEffectFilter()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 2
    .line 3
    const-class v1, Ll/ze5;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "ColorChange"

    .line 10
    .line 11
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 15
    .line 16
    const-class v1, Ll/gri;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "FishEye"

    .line 23
    .line 24
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 28
    .line 29
    const-class v1, Ll/o610;

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v2, "Mosaic"

    .line 36
    .line 37
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 41
    .line 42
    const-class v1, Ll/qxb;

    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const-string v2, "Crosshatch"

    .line 49
    .line 50
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 54
    .line 55
    const-class v1, Lcom/momo/mcamera/mask/BigMouthMaskFilter;

    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    const-string v2, "BigMouthKP"

    .line 62
    .line 63
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 67
    .line 68
    const-class v1, Ll/zb00;

    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    const-string v2, "MirrorFlip"

    .line 75
    .line 76
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 80
    .line 81
    const-class v1, Ll/sxf0;

    .line 82
    .line 83
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    const-string v2, "MirrorVerticalFlip"

    .line 88
    .line 89
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 93
    .line 94
    const-class v1, Ll/rxf0;

    .line 95
    .line 96
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    const-string v2, "MirrorHorizontalFlip"

    .line 101
    .line 102
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 106
    .line 107
    const-class v1, Ll/jpp0;

    .line 108
    .line 109
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    const-string v2, "WaterReflection"

    .line 114
    .line 115
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 119
    .line 120
    const-class v1, Ll/irf0;

    .line 121
    .line 122
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    const-string v2, "Sketch"

    .line 127
    .line 128
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 132
    .line 133
    const-class v1, Ll/otf;

    .line 134
    .line 135
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    const-string v2, "RainDrops"

    .line 140
    .line 141
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 145
    .line 146
    const-class v1, Ll/fkc0;

    .line 147
    .line 148
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    const-string v2, "RainWindow"

    .line 153
    .line 154
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 158
    .line 159
    const-class v1, Ll/ltf;

    .line 160
    .line 161
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    const-string v2, "ParticleBlur"

    .line 166
    .line 167
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 171
    .line 172
    const-class v1, Ll/btf;

    .line 173
    .line 174
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    const-string v2, "GrainCam"

    .line 179
    .line 180
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 184
    .line 185
    const-class v1, Ll/duf0;

    .line 186
    .line 187
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    const-string v2, "SoulOut"

    .line 192
    .line 193
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 197
    .line 198
    const-class v1, Ll/tsf;

    .line 199
    .line 200
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    const-string v2, "Dazzling"

    .line 205
    .line 206
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 210
    .line 211
    const-class v1, Ll/ctf;

    .line 212
    .line 213
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    const-string v2, "Heartbeat"

    .line 218
    .line 219
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    .line 221
    .line 222
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 223
    .line 224
    const-class v1, Ll/ntf;

    .line 225
    .line 226
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    const-string v2, "RGBShift"

    .line 231
    .line 232
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 236
    .line 237
    const-class v1, Ll/qtf;

    .line 238
    .line 239
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    const-string v2, "Shadowing"

    .line 244
    .line 245
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 249
    .line 250
    const-class v1, Ll/mtf;

    .line 251
    .line 252
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    const-string v2, "Partition"

    .line 257
    .line 258
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    .line 260
    .line 261
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 262
    .line 263
    const-class v1, Ll/vsf;

    .line 264
    .line 265
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    const-string v2, "DoubleBW"

    .line 270
    .line 271
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 275
    .line 276
    const-class v1, Ll/itf;

    .line 277
    .line 278
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v1

    .line 282
    const-string v2, "Jitter"

    .line 283
    .line 284
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    .line 286
    .line 287
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 288
    .line 289
    const-class v1, Ll/usf;

    .line 290
    .line 291
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v1

    .line 295
    const-string v2, "Dizzy"

    .line 296
    .line 297
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 301
    .line 302
    const-class v1, Ll/zsf;

    .line 303
    .line 304
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object v1

    .line 308
    const-string v2, "FilmThreeGrids"

    .line 309
    .line 310
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 311
    .line 312
    .line 313
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 314
    .line 315
    const-class v1, Ll/wsf;

    .line 316
    .line 317
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v1

    .line 321
    const-string v2, "DuoColor"

    .line 322
    .line 323
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 324
    .line 325
    .line 326
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 327
    .line 328
    const-class v1, Ll/dtf;

    .line 329
    .line 330
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object v1

    .line 334
    const-string v2, "HueTV"

    .line 335
    .line 336
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    .line 338
    .line 339
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 340
    .line 341
    const-class v1, Ll/utf;

    .line 342
    .line 343
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object v1

    .line 347
    const-string v2, "TransFilm"

    .line 348
    .line 349
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 350
    .line 351
    .line 352
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 353
    .line 354
    const-class v1, Ll/wtf;

    .line 355
    .line 356
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 357
    .line 358
    .line 359
    move-result-object v1

    .line 360
    const-string v2, "VHSStreak"

    .line 361
    .line 362
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 363
    .line 364
    .line 365
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 366
    .line 367
    const-class v1, Ll/gtf;

    .line 368
    .line 369
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 370
    .line 371
    .line 372
    move-result-object v1

    .line 373
    const-string v2, "HyperZoom"

    .line 374
    .line 375
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 376
    .line 377
    .line 378
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 379
    .line 380
    const-class v1, Ll/f4k;

    .line 381
    .line 382
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object v1

    .line 386
    const-string v2, "Glitter"

    .line 387
    .line 388
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 389
    .line 390
    .line 391
    iget-object v0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 392
    .line 393
    const-class v1, Lcom/momo/mcamera/mask/motioncamera/MotionCameraFilter;

    .line 394
    .line 395
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object v1

    .line 399
    const-string v2, "MotionCamera"

    .line 400
    .line 401
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 402
    .line 403
    .line 404
    iget-object p0, p0, Lcom/momo/mcamera/filtermanager/EffectFilterKey;->effectFilterMap:Ljava/util/HashMap;

    .line 405
    .line 406
    const-class v0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;

    .line 407
    .line 408
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 409
    .line 410
    .line 411
    move-result-object v0

    .line 412
    const-string v1, "HotDance"

    .line 413
    .line 414
    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 415
    .line 416
    .line 417
    return-void
.end method
