.class Lio/agora/base/internal/video/BitrateAdjusterHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final EXYNOS_CONSTANT_UNIT_BITRATE_CHIPS:[Ljava/lang/String;

.field private static final H264_HW_QCOM_EXCEPTION_MODELS:[Ljava/lang/String;

.field private static final HISI_CONSTANT_UNIT_BITRATE_CHIPS:[Ljava/lang/String;

.field private static final MTK_CONSTANT_UNIT_BITRATE_CHIPS:[Ljava/lang/String;

.field private static final MTK_NO_ADJUSTMENT_MODELS:[Ljava/lang/String;

.field private static final TAG:Ljava/lang/String; = "BitrateAdjusterHelper"

.field private static final UNISOC_CONSTANT_UNIT_BITRATE_CHIPS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 1
    const-string v4, "lm-x210"

    .line 2
    .line 3
    const-string v5, "oppo r9s"

    .line 4
    .line 5
    const-string v0, "mi note lte"

    .line 6
    .line 7
    const-string v1, "redmi note 4x"

    .line 8
    .line 9
    const-string v2, "1605-a01"

    .line 10
    .line 11
    const-string v3, "aosp on hammerhead"

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Lio/agora/base/internal/video/BitrateAdjusterHelper;->H264_HW_QCOM_EXCEPTION_MODELS:[Ljava/lang/String;

    .line 18
    .line 19
    const-string v0, "vivo x21i"

    .line 20
    .line 21
    const-string v1, "vivo X21i A"

    .line 22
    .line 23
    const-string v2, "vivo y83a"

    .line 24
    .line 25
    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Lio/agora/base/internal/video/BitrateAdjusterHelper;->MTK_NO_ADJUSTMENT_MODELS:[Ljava/lang/String;

    .line 30
    .line 31
    const-string v0, "exynos 5 hexa"

    .line 32
    .line 33
    const-string v1, "exynos 7 octa"

    .line 34
    .line 35
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sput-object v0, Lio/agora/base/internal/video/BitrateAdjusterHelper;->EXYNOS_CONSTANT_UNIT_BITRATE_CHIPS:[Ljava/lang/String;

    .line 40
    .line 41
    const-string v0, "helio x25"

    .line 42
    .line 43
    const-string v1, "helio p20"

    .line 44
    .line 45
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sput-object v0, Lio/agora/base/internal/video/BitrateAdjusterHelper;->MTK_CONSTANT_UNIT_BITRATE_CHIPS:[Ljava/lang/String;

    .line 50
    .line 51
    const-string v14, "vendor kirin985 kirin985"

    .line 52
    .line 53
    const-string v15, "vendor kirin990 kirin990"

    .line 54
    .line 55
    const-string v1, "hi3650"

    .line 56
    .line 57
    const-string v2, "hi3660"

    .line 58
    .line 59
    const-string v3, "hi6250"

    .line 60
    .line 61
    const-string v4, "kirin 710"

    .line 62
    .line 63
    const-string v5, "kirin 810"

    .line 64
    .line 65
    const-string v6, "kirin8000"

    .line 66
    .line 67
    const-string v7, "kirin 980"

    .line 68
    .line 69
    const-string v8, "kirin 9000e"

    .line 70
    .line 71
    const-string v9, "kirin985"

    .line 72
    .line 73
    const-string v10, "kirin990"

    .line 74
    .line 75
    const-string v11, "kirin990e"

    .line 76
    .line 77
    const-string v12, "vendor kirin820 kirin820"

    .line 78
    .line 79
    const-string v13, "vendor kirin970 kirin970"

    .line 80
    .line 81
    filled-new-array/range {v1 .. v15}, [Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    sput-object v0, Lio/agora/base/internal/video/BitrateAdjusterHelper;->HISI_CONSTANT_UNIT_BITRATE_CHIPS:[Ljava/lang/String;

    .line 86
    .line 87
    const-string v0, "unisoc t610"

    .line 88
    .line 89
    const-string v1, "unisoc sc9832e"

    .line 90
    .line 91
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    sput-object v0, Lio/agora/base/internal/video/BitrateAdjusterHelper;->UNISOC_CONSTANT_UNIT_BITRATE_CHIPS:[Ljava/lang/String;

    .line 96
    .line 97
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getEncoderStyle(Ljava/lang/String;Ljava/lang/String;Z)Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;
    .locals 5

    .line 1
    new-instance v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;

    .line 2
    .line 3
    invoke-direct {v0}, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "getEncoderStyle codecName: "

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v2, ", cpuName: "

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v2, ", rebootScheme: "

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const-string v2, "BitrateAdjusterHelper"

    .line 37
    .line 38
    invoke-static {v2, v1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    if-nez p2, :cond_4

    .line 43
    .line 44
    sget-object p0, Lio/agora/base/internal/video/BitrateAdjusterHelper;->EXYNOS_CONSTANT_UNIT_BITRATE_CHIPS:[Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    const/4 p2, 0x4

    .line 55
    if-eqz p0, :cond_0

    .line 56
    .line 57
    new-instance p0, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v1, "constant unit bitrate for exynos, cpuName: "

    .line 60
    .line 61
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {v2, p0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iput p2, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->bitrateAdjustment:I

    .line 75
    .line 76
    return-object v0

    .line 77
    :cond_0
    sget-object p0, Lio/agora/base/internal/video/BitrateAdjusterHelper;->MTK_CONSTANT_UNIT_BITRATE_CHIPS:[Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-eqz p0, :cond_1

    .line 88
    .line 89
    new-instance p0, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    const-string v1, "constant unit bitrate for mtk, cpuName: "

    .line 92
    .line 93
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-static {v2, p0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iput p2, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->bitrateAdjustment:I

    .line 107
    .line 108
    return-object v0

    .line 109
    :cond_1
    sget-object p0, Lio/agora/base/internal/video/BitrateAdjusterHelper;->HISI_CONSTANT_UNIT_BITRATE_CHIPS:[Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    if-eqz p0, :cond_2

    .line 120
    .line 121
    new-instance p0, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    const-string v1, "constant unit bitrate for hisi, cpuName: "

    .line 124
    .line 125
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-static {v2, p0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    iput p2, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->bitrateAdjustment:I

    .line 139
    .line 140
    return-object v0

    .line 141
    :cond_2
    sget-object p0, Lio/agora/base/internal/video/BitrateAdjusterHelper;->UNISOC_CONSTANT_UNIT_BITRATE_CHIPS:[Ljava/lang/String;

    .line 142
    .line 143
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result p0

    .line 151
    if-eqz p0, :cond_3

    .line 152
    .line 153
    new-instance p0, Ljava/lang/StringBuilder;

    .line 154
    .line 155
    const-string v1, "constant unit bitrate for unisoc, cpuName: "

    .line 156
    .line 157
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-static {v2, p0}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    iput p2, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->bitrateAdjustment:I

    .line 171
    .line 172
    return-object v0

    .line 173
    :cond_3
    iput v1, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->bitrateAdjustment:I

    .line 174
    .line 175
    return-object v0

    .line 176
    :cond_4
    const-string p1, "OMX.qcom."

    .line 177
    .line 178
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 179
    .line 180
    .line 181
    move-result p1

    .line 182
    const/4 p2, 0x1

    .line 183
    if-nez p1, :cond_1c

    .line 184
    .line 185
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    const-string v3, "c2.qti."

    .line 190
    .line 191
    invoke-virtual {p1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    if-eqz p1, :cond_5

    .line 196
    .line 197
    goto/16 :goto_8

    .line 198
    .line 199
    :cond_5
    const-string p1, "OMX.MTK."

    .line 200
    .line 201
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 202
    .line 203
    .line 204
    move-result p1

    .line 205
    const/4 v3, 0x2

    .line 206
    if-nez p1, :cond_17

    .line 207
    .line 208
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    const-string v4, "c2.mtk."

    .line 213
    .line 214
    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 215
    .line 216
    .line 217
    move-result p1

    .line 218
    if-eqz p1, :cond_6

    .line 219
    .line 220
    goto/16 :goto_6

    .line 221
    .line 222
    :cond_6
    const-string p1, "OMX.Exynos."

    .line 223
    .line 224
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 225
    .line 226
    .line 227
    move-result p1

    .line 228
    if-nez p1, :cond_13

    .line 229
    .line 230
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    const-string v4, "c2.exynos."

    .line 235
    .line 236
    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 237
    .line 238
    .line 239
    move-result p1

    .line 240
    if-eqz p1, :cond_7

    .line 241
    .line 242
    goto/16 :goto_5

    .line 243
    .line 244
    :cond_7
    const-string p1, "OMX.IMG.TOPAZ."

    .line 245
    .line 246
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 247
    .line 248
    .line 249
    move-result p1

    .line 250
    if-nez p1, :cond_11

    .line 251
    .line 252
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    const-string v4, "c2.img."

    .line 257
    .line 258
    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 259
    .line 260
    .line 261
    move-result p1

    .line 262
    if-eqz p1, :cond_8

    .line 263
    .line 264
    goto/16 :goto_4

    .line 265
    .line 266
    :cond_8
    const-string p1, "OMX.hisi."

    .line 267
    .line 268
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 269
    .line 270
    .line 271
    move-result p1

    .line 272
    if-nez p1, :cond_10

    .line 273
    .line 274
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object p1

    .line 278
    const-string v4, "c2.hisi."

    .line 279
    .line 280
    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 281
    .line 282
    .line 283
    move-result p1

    .line 284
    if-eqz p1, :cond_9

    .line 285
    .line 286
    goto :goto_3

    .line 287
    :cond_9
    const-string p1, "OMX.k3."

    .line 288
    .line 289
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 290
    .line 291
    .line 292
    move-result p1

    .line 293
    if-nez p1, :cond_f

    .line 294
    .line 295
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object p1

    .line 299
    const-string v3, "c2.k3."

    .line 300
    .line 301
    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 302
    .line 303
    .line 304
    move-result p1

    .line 305
    if-eqz p1, :cond_a

    .line 306
    .line 307
    goto :goto_2

    .line 308
    :cond_a
    const-string p1, "OMX.amlogic."

    .line 309
    .line 310
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 311
    .line 312
    .line 313
    move-result p1

    .line 314
    if-nez p1, :cond_e

    .line 315
    .line 316
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object p1

    .line 320
    const-string v3, "c2.amlogic."

    .line 321
    .line 322
    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 323
    .line 324
    .line 325
    move-result p1

    .line 326
    if-eqz p1, :cond_b

    .line 327
    .line 328
    goto :goto_1

    .line 329
    :cond_b
    const-string p1, "OMX.rk."

    .line 330
    .line 331
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 332
    .line 333
    .line 334
    move-result p1

    .line 335
    if-nez p1, :cond_d

    .line 336
    .line 337
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object p0

    .line 341
    const-string p1, "c2.rk."

    .line 342
    .line 343
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 344
    .line 345
    .line 346
    move-result p0

    .line 347
    if-eqz p0, :cond_c

    .line 348
    .line 349
    goto :goto_0

    .line 350
    :cond_c
    const-string p0, "getChipProperties from unsupported chip list"

    .line 351
    .line 352
    invoke-static {v2, p0}, Lio/agora/base/internal/Logging;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 353
    .line 354
    .line 355
    iput-boolean p2, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->highProfileSupported:Z

    .line 356
    .line 357
    return-object v0

    .line 358
    :cond_d
    :goto_0
    iput p2, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->bitrateAdjustment:I

    .line 359
    .line 360
    iput-boolean v1, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->highProfileSupported:Z

    .line 361
    .line 362
    return-object v0

    .line 363
    :cond_e
    :goto_1
    const-string p0, "getChipProperties for amlogic"

    .line 364
    .line 365
    invoke-static {v2, p0}, Lio/agora/base/internal/Logging;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 366
    .line 367
    .line 368
    iput p2, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->bitrateAdjustment:I

    .line 369
    .line 370
    iput-boolean v1, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->highProfileSupported:Z

    .line 371
    .line 372
    return-object v0

    .line 373
    :cond_f
    :goto_2
    iput p2, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->bitrateAdjustment:I

    .line 374
    .line 375
    iput-boolean p2, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->highProfileSupported:Z

    .line 376
    .line 377
    return-object v0

    .line 378
    :cond_10
    :goto_3
    iput-boolean v1, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->highProfileSupported:Z

    .line 379
    .line 380
    iput v3, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->bitrateAdjustment:I

    .line 381
    .line 382
    return-object v0

    .line 383
    :cond_11
    :goto_4
    sget-object p0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 384
    .line 385
    const-string p1, "hi6250"

    .line 386
    .line 387
    invoke-virtual {p0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 388
    .line 389
    .line 390
    move-result p0

    .line 391
    if-eqz p0, :cond_12

    .line 392
    .line 393
    iput v3, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->bitrateAdjustment:I

    .line 394
    .line 395
    return-object v0

    .line 396
    :cond_12
    iput-boolean v1, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->highProfileSupported:Z

    .line 397
    .line 398
    iput p2, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->bitrateAdjustment:I

    .line 399
    .line 400
    return-object v0

    .line 401
    :cond_13
    :goto_5
    sget-object p0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 402
    .line 403
    const-string p1, "MX4 Pro"

    .line 404
    .line 405
    invoke-virtual {p0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 406
    .line 407
    .line 408
    move-result p1

    .line 409
    if-eqz p1, :cond_14

    .line 410
    .line 411
    iput v3, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->bitrateAdjustment:I

    .line 412
    .line 413
    iput-boolean v1, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->highProfileSupported:Z

    .line 414
    .line 415
    return-object v0

    .line 416
    :cond_14
    sget-object p1, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 417
    .line 418
    const-string v1, "vivo"

    .line 419
    .line 420
    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 421
    .line 422
    .line 423
    move-result p1

    .line 424
    if-eqz p1, :cond_15

    .line 425
    .line 426
    const-string p1, "V1938CT"

    .line 427
    .line 428
    invoke-virtual {p0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 429
    .line 430
    .line 431
    move-result p0

    .line 432
    if-eqz p0, :cond_15

    .line 433
    .line 434
    iput v3, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->bitrateAdjustment:I

    .line 435
    .line 436
    iput-boolean p2, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->highProfileSupported:Z

    .line 437
    .line 438
    return-object v0

    .line 439
    :cond_15
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 440
    .line 441
    const/16 p1, 0x1c

    .line 442
    .line 443
    if-le p0, p1, :cond_16

    .line 444
    .line 445
    iput v3, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->bitrateAdjustment:I

    .line 446
    .line 447
    iput-boolean p2, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->highProfileSupported:Z

    .line 448
    .line 449
    return-object v0

    .line 450
    :cond_16
    iput p2, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->bitrateAdjustment:I

    .line 451
    .line 452
    iput-boolean p2, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->highProfileSupported:Z

    .line 453
    .line 454
    return-object v0

    .line 455
    :cond_17
    :goto_6
    new-instance p0, Ljava/lang/StringBuilder;

    .line 456
    .line 457
    const-string p1, "MTK hardware: "

    .line 458
    .line 459
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 460
    .line 461
    .line 462
    sget-object p1, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 463
    .line 464
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 465
    .line 466
    .line 467
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 468
    .line 469
    .line 470
    move-result-object p0

    .line 471
    invoke-static {v2, p0}, Lio/agora/base/internal/Logging;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 472
    .line 473
    .line 474
    const-string p0, "mt6763"

    .line 475
    .line 476
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 477
    .line 478
    .line 479
    move-result p0

    .line 480
    if-nez p0, :cond_1b

    .line 481
    .line 482
    const-string p0, "mt6763t"

    .line 483
    .line 484
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 485
    .line 486
    .line 487
    move-result p0

    .line 488
    if-eqz p0, :cond_18

    .line 489
    .line 490
    goto :goto_7

    .line 491
    :cond_18
    sget-object p0, Lio/agora/base/internal/video/BitrateAdjusterHelper;->MTK_NO_ADJUSTMENT_MODELS:[Ljava/lang/String;

    .line 492
    .line 493
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 494
    .line 495
    .line 496
    move-result-object p0

    .line 497
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 498
    .line 499
    invoke-interface {p0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 500
    .line 501
    .line 502
    move-result p0

    .line 503
    if-eqz p0, :cond_19

    .line 504
    .line 505
    iput-boolean p2, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->highProfileSupported:Z

    .line 506
    .line 507
    return-object v0

    .line 508
    :cond_19
    const-string p0, "mt6735"

    .line 509
    .line 510
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 511
    .line 512
    .line 513
    move-result p0

    .line 514
    if-eqz p0, :cond_1a

    .line 515
    .line 516
    iput v3, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->bitrateAdjustment:I

    .line 517
    .line 518
    iput-boolean v1, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->highProfileSupported:Z

    .line 519
    .line 520
    return-object v0

    .line 521
    :cond_1a
    iput v3, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->bitrateAdjustment:I

    .line 522
    .line 523
    iput-boolean p2, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->highProfileSupported:Z

    .line 524
    .line 525
    return-object v0

    .line 526
    :cond_1b
    :goto_7
    iput-boolean p2, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->highProfileSupported:Z

    .line 527
    .line 528
    return-object v0

    .line 529
    :cond_1c
    :goto_8
    sget-object p0, Lio/agora/base/internal/video/BitrateAdjusterHelper;->H264_HW_QCOM_EXCEPTION_MODELS:[Ljava/lang/String;

    .line 530
    .line 531
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 532
    .line 533
    .line 534
    move-result-object p0

    .line 535
    sget-object p1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 536
    .line 537
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 538
    .line 539
    .line 540
    move-result-object v1

    .line 541
    invoke-interface {p0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 542
    .line 543
    .line 544
    move-result p0

    .line 545
    if-eqz p0, :cond_1d

    .line 546
    .line 547
    new-instance p0, Ljava/lang/StringBuilder;

    .line 548
    .line 549
    const-string v1, "Qcom Exception Model: "

    .line 550
    .line 551
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 552
    .line 553
    .line 554
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 555
    .line 556
    .line 557
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 558
    .line 559
    .line 560
    move-result-object p0

    .line 561
    invoke-static {v2, p0}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 562
    .line 563
    .line 564
    iput-boolean p2, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->isNeedResetWhenDownBps:Z

    .line 565
    .line 566
    :cond_1d
    iput-boolean p2, v0, Lio/agora/base/internal/video/VideoEncoder$EncoderStyle;->highProfileSupported:Z

    .line 567
    .line 568
    return-object v0
.end method
