.class public Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;
.super Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;
.source "SourceFile"


# instance fields
.field private enableWarp:Z

.field private eulerAngles:[[F

.field private landmarks:[[F

.field private final originWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;

.field private warpLevel1:F

.field private warpLevel1Array:[F

.field private warpLevel2:F

.field private warpLevel2Array:[F

.field private warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

.field private xCameraWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/momocv/beauty/XCameraWarpLevelParams;-><init>()V

    .line 7
    .line 8
    .line 9
    filled-new-array {v0}, [Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->originWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 14
    .line 15
    new-instance v0, Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/momocv/beauty/XCameraWarpLevelParams;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->enableWarp:Z

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    new-array v1, v0, [Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 27
    .line 28
    iput-object v1, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->xCameraWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 29
    .line 30
    new-array v1, v0, [F

    .line 31
    .line 32
    iput-object v1, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevel1Array:[F

    .line 33
    .line 34
    new-array v0, v0, [F

    .line 35
    .line 36
    iput-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevel2Array:[F

    .line 37
    .line 38
    return-void
.end method

.method private changeBeautyValue(Ljava/lang/String;F)V
    .locals 1

    .line 1
    const-string v0, "thin_face"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iput p2, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevel1:F

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const-string v0, "big_eye"

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iput p2, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevel2:F

    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method private changeCameraXValue(Ljava/lang/String;F)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, -0x1

    .line 9
    sparse-switch v0, :sswitch_data_0

    .line 10
    .line 11
    .line 12
    goto/16 :goto_0

    .line 13
    .line 14
    :sswitch_0
    const-string v0, "mouth_size"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    goto/16 :goto_0

    .line 23
    .line 24
    :cond_0
    const/16 v1, 0xf

    .line 25
    .line 26
    goto/16 :goto_0

    .line 27
    .line 28
    :sswitch_1
    const-string v0, "nose_width"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    goto/16 :goto_0

    .line 37
    .line 38
    :cond_1
    const/16 v1, 0xe

    .line 39
    .line 40
    goto/16 :goto_0

    .line 41
    .line 42
    :sswitch_2
    const-string v0, "lip_thickness"

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-nez p1, :cond_2

    .line 49
    .line 50
    goto/16 :goto_0

    .line 51
    .line 52
    :cond_2
    const/16 v1, 0xd

    .line 53
    .line 54
    goto/16 :goto_0

    .line 55
    .line 56
    :sswitch_3
    const-string v0, "face_width"

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-nez p1, :cond_3

    .line 63
    .line 64
    goto/16 :goto_0

    .line 65
    .line 66
    :cond_3
    const/16 v1, 0xc

    .line 67
    .line 68
    goto/16 :goto_0

    .line 69
    .line 70
    :sswitch_4
    const-string v0, "nose_size"

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-nez p1, :cond_4

    .line 77
    .line 78
    goto/16 :goto_0

    .line 79
    .line 80
    :cond_4
    const/16 v1, 0xb

    .line 81
    .line 82
    goto/16 :goto_0

    .line 83
    .line 84
    :sswitch_5
    const-string v0, "nose_lift"

    .line 85
    .line 86
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-nez p1, :cond_5

    .line 91
    .line 92
    goto/16 :goto_0

    .line 93
    .line 94
    :cond_5
    const/16 v1, 0xa

    .line 95
    .line 96
    goto/16 :goto_0

    .line 97
    .line 98
    :sswitch_6
    const-string v0, "forehead"

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-nez p1, :cond_6

    .line 105
    .line 106
    goto/16 :goto_0

    .line 107
    .line 108
    :cond_6
    const/16 v1, 0x9

    .line 109
    .line 110
    goto/16 :goto_0

    .line 111
    .line 112
    :sswitch_7
    const-string v0, "nose_ridge_width"

    .line 113
    .line 114
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-nez p1, :cond_7

    .line 119
    .line 120
    goto/16 :goto_0

    .line 121
    .line 122
    :cond_7
    const/16 v1, 0x8

    .line 123
    .line 124
    goto/16 :goto_0

    .line 125
    .line 126
    :sswitch_8
    const-string v0, "jaw_shape"

    .line 127
    .line 128
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    if-nez p1, :cond_8

    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_8
    const/4 v1, 0x7

    .line 136
    goto :goto_0

    .line 137
    :sswitch_9
    const-string v0, "big_eye"

    .line 138
    .line 139
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-nez p1, :cond_9

    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_9
    const/4 v1, 0x6

    .line 147
    goto :goto_0

    .line 148
    :sswitch_a
    const-string v0, "eye_distance"

    .line 149
    .line 150
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    if-nez p1, :cond_a

    .line 155
    .line 156
    goto :goto_0

    .line 157
    :cond_a
    const/4 v1, 0x5

    .line 158
    goto :goto_0

    .line 159
    :sswitch_b
    const-string v0, "thin_face"

    .line 160
    .line 161
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-nez p1, :cond_b

    .line 166
    .line 167
    goto :goto_0

    .line 168
    :cond_b
    const/4 v1, 0x4

    .line 169
    goto :goto_0

    .line 170
    :sswitch_c
    const-string v0, "eye_tilt"

    .line 171
    .line 172
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-nez p1, :cond_c

    .line 177
    .line 178
    goto :goto_0

    .line 179
    :cond_c
    const/4 v1, 0x3

    .line 180
    goto :goto_0

    .line 181
    :sswitch_d
    const-string v0, "chin_length"

    .line 182
    .line 183
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result p1

    .line 187
    if-nez p1, :cond_d

    .line 188
    .line 189
    goto :goto_0

    .line 190
    :cond_d
    const/4 v1, 0x2

    .line 191
    goto :goto_0

    .line 192
    :sswitch_e
    const-string v0, "nose_tip_size"

    .line 193
    .line 194
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result p1

    .line 198
    if-nez p1, :cond_e

    .line 199
    .line 200
    goto :goto_0

    .line 201
    :cond_e
    const/4 v1, 0x1

    .line 202
    goto :goto_0

    .line 203
    :sswitch_f
    const-string v0, "shorten_face"

    .line 204
    .line 205
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result p1

    .line 209
    if-nez p1, :cond_f

    .line 210
    .line 211
    goto :goto_0

    .line 212
    :cond_f
    const/4 v1, 0x0

    .line 213
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 214
    .line 215
    .line 216
    return-void

    .line 217
    :pswitch_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 218
    .line 219
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->lip_size_:F

    .line 220
    .line 221
    return-void

    .line 222
    :pswitch_1
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 223
    .line 224
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->nose_width_:F

    .line 225
    .line 226
    return-void

    .line 227
    :pswitch_2
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 228
    .line 229
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->lip_thickness_:F

    .line 230
    .line 231
    return-void

    .line 232
    :pswitch_3
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 233
    .line 234
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->face_width_:F

    .line 235
    .line 236
    return-void

    .line 237
    :pswitch_4
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 238
    .line 239
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->nose_size_:F

    .line 240
    .line 241
    return-void

    .line 242
    :pswitch_5
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 243
    .line 244
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->nose_lift_:F

    .line 245
    .line 246
    return-void

    .line 247
    :pswitch_6
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 248
    .line 249
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->forehead_ud_:F

    .line 250
    .line 251
    return-void

    .line 252
    :pswitch_7
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 253
    .line 254
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->nose_ridge_width_:F

    .line 255
    .line 256
    return-void

    .line 257
    :pswitch_8
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 258
    .line 259
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->chin_width_:F

    .line 260
    .line 261
    return-void

    .line 262
    :pswitch_9
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 263
    .line 264
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->eye_size_:F

    .line 265
    .line 266
    return-void

    .line 267
    :pswitch_a
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 268
    .line 269
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->eye_distance_:F

    .line 270
    .line 271
    return-void

    .line 272
    :pswitch_b
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 273
    .line 274
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->mm_thin_face_:F

    .line 275
    .line 276
    return-void

    .line 277
    :pswitch_c
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 278
    .line 279
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->eye_tilt_ratio_:F

    .line 280
    .line 281
    return-void

    .line 282
    :pswitch_d
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 283
    .line 284
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->chin_length_:F

    .line 285
    .line 286
    return-void

    .line 287
    :pswitch_e
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 288
    .line 289
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->nose_tip_size_:F

    .line 290
    .line 291
    return-void

    .line 292
    :pswitch_f
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 293
    .line 294
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->short_face_:F

    .line 295
    .line 296
    return-void

    .line 297
    :sswitch_data_0
    .sparse-switch
        -0x69fb43c9 -> :sswitch_f
        -0x5b8b5fef -> :sswitch_e
        -0x5b67e385 -> :sswitch_d
        -0x518cc7f5 -> :sswitch_c
        -0x29f587bd -> :sswitch_b
        -0x1f40e5bd -> :sswitch_a
        -0x6d8498e -> :sswitch_9
        0x4f34c2 -> :sswitch_8
        0xc0b44c6 -> :sswitch_7
        0x1bd41c9c -> :sswitch_6
        0x353da3f7 -> :sswitch_5
        0x3540d4ed -> :sswitch_4
        0x36f56d64 -> :sswitch_3
        0x5664b8c8 -> :sswitch_2
        0x7311d65a -> :sswitch_1
        0x76164079 -> :sswitch_0
    .end sparse-switch

    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    .line 304
    .line 305
    .line 306
    .line 307
    .line 308
    .line 309
    .line 310
    .line 311
    .line 312
    .line 313
    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    .line 327
    .line 328
    .line 329
    .line 330
    .line 331
    .line 332
    .line 333
    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    .line 339
    .line 340
    .line 341
    .line 342
    .line 343
    .line 344
    .line 345
    .line 346
    .line 347
    .line 348
    .line 349
    .line 350
    .line 351
    .line 352
    .line 353
    .line 354
    .line 355
    .line 356
    .line 357
    .line 358
    .line 359
    .line 360
    .line 361
    .line 362
    .line 363
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private chooseWarpParams(Lcom/momocv/beauty/BeautyWarpParams;Lcom/momocv/SingleFaceInfo;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpType:I

    .line 2
    .line 3
    const/16 v1, 0xa

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->xCameraWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 11
    .line 12
    aput-object v1, v0, v2

    .line 13
    .line 14
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->landmarks:[[F

    .line 15
    .line 16
    aget-object v0, v0, v2

    .line 17
    .line 18
    iget-object p2, p2, Lcom/momocv/SingleFaceInfo;->orig_landmarks_104_:[F

    .line 19
    .line 20
    invoke-static {v0, p2}, Lcom/momo/mcamera/util/ImageProcessUtil;->transformLandMark104Points([F[F)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->xCameraWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 24
    .line 25
    iput-object p0, p1, Lcom/momocv/beauty/BeautyWarpParams;->warp_level_group_:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->landmarks:[[F

    .line 29
    .line 30
    iget-object p2, p2, Lcom/momocv/SingleFaceInfo;->orig_landmarks_104_:[F

    .line 31
    .line 32
    aput-object p2, v0, v2

    .line 33
    .line 34
    iget-object p2, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevel1Array:[F

    .line 35
    .line 36
    iget v0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevel1:F

    .line 37
    .line 38
    aput v0, p2, v2

    .line 39
    .line 40
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevel2Array:[F

    .line 41
    .line 42
    iget v1, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->warpLevel2:F

    .line 43
    .line 44
    aput v1, v0, v2

    .line 45
    .line 46
    iput-object p2, p1, Lcom/momocv/beauty/BeautyWarpParams;->warp_level1_:[F

    .line 47
    .line 48
    iput-object v0, p1, Lcom/momocv/beauty/BeautyWarpParams;->warp_level2_:[F

    .line 49
    .line 50
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->originWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 51
    .line 52
    iput-object p0, p1, Lcom/momocv/beauty/BeautyWarpParams;->warp_level_group_:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 53
    .line 54
    return-void
.end method


# virtual methods
.method public buildParams(Ll/omw;Lcom/momocv/SingleFaceInfo;)Lcom/momocv/beauty/BeautyWarpParams;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpParams:Lcom/momocv/beauty/BeautyWarpParams;

    .line 2
    .line 3
    iget v1, p1, Ll/omw;->e:I

    .line 4
    .line 5
    iput v1, v0, Lcom/momocv/beauty/BeautyWarpParams;->image_width_:I

    .line 6
    .line 7
    iget v2, p1, Ll/omw;->f:I

    .line 8
    .line 9
    iput v2, v0, Lcom/momocv/beauty/BeautyWarpParams;->image_height_:I

    .line 10
    .line 11
    iget v3, v0, Lcom/momocv/BaseParams;->scale_factor_:F

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    cmpl-float v4, v3, v4

    .line 15
    .line 16
    if-lez v4, :cond_0

    .line 17
    .line 18
    int-to-float v1, v1

    .line 19
    mul-float/2addr v1, v3

    .line 20
    float-to-int v1, v1

    .line 21
    iput v1, v0, Lcom/momocv/beauty/BeautyWarpParams;->image_width_:I

    .line 22
    .line 23
    int-to-float v1, v2

    .line 24
    mul-float/2addr v1, v3

    .line 25
    float-to-int v1, v1

    .line 26
    iput v1, v0, Lcom/momocv/beauty/BeautyWarpParams;->image_height_:I

    .line 27
    .line 28
    :cond_0
    const/4 v1, 0x1

    .line 29
    iput-boolean v1, v0, Lcom/momocv/beauty/BeautyWarpParams;->is_stable_:Z

    .line 30
    .line 31
    iput-boolean v1, v0, Lcom/momocv/beauty/BeautyWarpParams;->multifaces_switch_:Z

    .line 32
    .line 33
    iget-boolean v2, p1, Ll/omw;->a:Z

    .line 34
    .line 35
    iput-boolean v2, v0, Lcom/momocv/BaseParams;->fliped_show_:Z

    .line 36
    .line 37
    iget v2, p1, Ll/omw;->c:I

    .line 38
    .line 39
    iput v2, v0, Lcom/momocv/BaseParams;->restore_degree_:I

    .line 40
    .line 41
    iget p1, p1, Ll/omw;->b:I

    .line 42
    .line 43
    iput p1, v0, Lcom/momocv/BaseParams;->rotate_degree_:I

    .line 44
    .line 45
    iput-boolean v1, v0, Lcom/momocv/beauty/BeautyWarpParams;->face_warp_gradual_switch_:Z

    .line 46
    .line 47
    iget p1, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpType:I

    .line 48
    .line 49
    iput p1, v0, Lcom/momocv/beauty/BeautyWarpParams;->warp_type_:I

    .line 50
    .line 51
    iget-object p1, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->landmarks:[[F

    .line 52
    .line 53
    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 54
    .line 55
    const/4 v3, 0x2

    .line 56
    const/4 v4, 0x0

    .line 57
    if-nez p1, :cond_1

    .line 58
    .line 59
    iget-object p1, p2, Lcom/momocv/SingleFaceInfo;->orig_landmarks_104_:[F

    .line 60
    .line 61
    array-length p1, p1

    .line 62
    new-array v5, v3, [I

    .line 63
    .line 64
    aput p1, v5, v1

    .line 65
    .line 66
    aput v1, v5, v4

    .line 67
    .line 68
    invoke-static {v2, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, [[F

    .line 73
    .line 74
    iput-object p1, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->landmarks:[[F

    .line 75
    .line 76
    :cond_1
    iget-object p1, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->eulerAngles:[[F

    .line 77
    .line 78
    if-nez p1, :cond_2

    .line 79
    .line 80
    iget-object p1, p2, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 81
    .line 82
    array-length p1, p1

    .line 83
    new-array v3, v3, [I

    .line 84
    .line 85
    aput p1, v3, v1

    .line 86
    .line 87
    aput v1, v3, v4

    .line 88
    .line 89
    invoke-static {v2, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    check-cast p1, [[F

    .line 94
    .line 95
    iput-object p1, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->eulerAngles:[[F

    .line 96
    .line 97
    :cond_2
    invoke-direct {p0, v0, p2}, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->chooseWarpParams(Lcom/momocv/beauty/BeautyWarpParams;Lcom/momocv/SingleFaceInfo;)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->eulerAngles:[[F

    .line 101
    .line 102
    iget-object p2, p2, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 103
    .line 104
    aput-object p2, p1, v4

    .line 105
    .line 106
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->landmarks:[[F

    .line 107
    .line 108
    iput-object p0, v0, Lcom/momocv/beauty/BeautyWarpParams;->landmarks104_:[[F

    .line 109
    .line 110
    iput-object p1, v0, Lcom/momocv/beauty/BeautyWarpParams;->euler_angle_:[[F

    .line 111
    .line 112
    return-object v0
.end method

.method public changeFaceBeautyValue(Ljava/lang/String;F)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpType:I

    .line 9
    .line 10
    const/16 v1, 0xa

    .line 11
    .line 12
    if-ne v0, v1, :cond_1

    .line 13
    .line 14
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->changeCameraXValue(Ljava/lang/String;F)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->changeBeautyValue(Ljava/lang/String;F)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public getDefaultWarpType()I
    .locals 0

    const/16 p0, 0x9

    return p0
.end method

.method public isWarpFailed()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->enableWarp:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->isWarpFailed:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

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

.method public notWarp()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->enableWarp:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->mmcvInfo:Ll/omw;

    .line 6
    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/omw;->n()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public setEnableWarp(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;->enableWarp:Z

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->isWarpFailed:Z

    .line 5
    .line 6
    return-void
.end method
