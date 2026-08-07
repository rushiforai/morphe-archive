.class public final enum Lcom/momo/xengine/media/types/PixelFormat;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/momo/xengine/media/types/PixelFormat;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_AYUV:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_BGR3:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_BGRA:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_BGRX:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_CVPIXELBUFFER_APPLE:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_I210:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_I40A:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_I412:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_I420:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_I420_10BE:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_I420_10LE:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_I422:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_I42A:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_I444:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_NONE:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_NV12:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_NV12_10BE:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_NV12_10LE:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_NV21:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_NV21_10BE:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_NV21_10LE:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_RGBA:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_UYVY:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_Y800:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_YA2L:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_YUVA:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_YUY2:Lcom/momo/xengine/media/types/PixelFormat;

.field public static final enum VIDEO_FORMAT_YVYU:Lcom/momo/xengine/media/types/PixelFormat;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 31

    .line 1
    new-instance v1, Lcom/momo/xengine/media/types/PixelFormat;

    .line 2
    .line 3
    const-string v0, "VIDEO_FORMAT_NONE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v1, v0, v2, v2}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v1, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_NONE:Lcom/momo/xengine/media/types/PixelFormat;

    .line 10
    .line 11
    new-instance v2, Lcom/momo/xengine/media/types/PixelFormat;

    .line 12
    .line 13
    const-string v0, "VIDEO_FORMAT_I420"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v2, v0, v3, v3}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v2, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_I420:Lcom/momo/xengine/media/types/PixelFormat;

    .line 20
    .line 21
    new-instance v3, Lcom/momo/xengine/media/types/PixelFormat;

    .line 22
    .line 23
    const-string v0, "VIDEO_FORMAT_I420_10LE"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v3, v0, v4, v4}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v3, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_I420_10LE:Lcom/momo/xengine/media/types/PixelFormat;

    .line 30
    .line 31
    new-instance v4, Lcom/momo/xengine/media/types/PixelFormat;

    .line 32
    .line 33
    const-string v0, "VIDEO_FORMAT_I420_10BE"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v4, v0, v5, v5}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v4, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_I420_10BE:Lcom/momo/xengine/media/types/PixelFormat;

    .line 40
    .line 41
    new-instance v5, Lcom/momo/xengine/media/types/PixelFormat;

    .line 42
    .line 43
    const-string v0, "VIDEO_FORMAT_NV12"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    invoke-direct {v5, v0, v6, v6}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v5, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_NV12:Lcom/momo/xengine/media/types/PixelFormat;

    .line 50
    .line 51
    new-instance v6, Lcom/momo/xengine/media/types/PixelFormat;

    .line 52
    .line 53
    const-string v0, "VIDEO_FORMAT_NV12_10LE"

    .line 54
    .line 55
    const/4 v7, 0x5

    .line 56
    invoke-direct {v6, v0, v7, v7}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 57
    .line 58
    .line 59
    sput-object v6, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_NV12_10LE:Lcom/momo/xengine/media/types/PixelFormat;

    .line 60
    .line 61
    new-instance v7, Lcom/momo/xengine/media/types/PixelFormat;

    .line 62
    .line 63
    const-string v0, "VIDEO_FORMAT_NV12_10BE"

    .line 64
    .line 65
    const/4 v8, 0x6

    .line 66
    invoke-direct {v7, v0, v8, v8}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 67
    .line 68
    .line 69
    sput-object v7, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_NV12_10BE:Lcom/momo/xengine/media/types/PixelFormat;

    .line 70
    .line 71
    new-instance v8, Lcom/momo/xengine/media/types/PixelFormat;

    .line 72
    .line 73
    const-string v0, "VIDEO_FORMAT_NV21"

    .line 74
    .line 75
    const/4 v9, 0x7

    .line 76
    invoke-direct {v8, v0, v9, v9}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 77
    .line 78
    .line 79
    sput-object v8, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_NV21:Lcom/momo/xengine/media/types/PixelFormat;

    .line 80
    .line 81
    new-instance v9, Lcom/momo/xengine/media/types/PixelFormat;

    .line 82
    .line 83
    const-string v0, "VIDEO_FORMAT_NV21_10LE"

    .line 84
    .line 85
    const/16 v10, 0x8

    .line 86
    .line 87
    invoke-direct {v9, v0, v10, v10}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 88
    .line 89
    .line 90
    sput-object v9, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_NV21_10LE:Lcom/momo/xengine/media/types/PixelFormat;

    .line 91
    .line 92
    new-instance v10, Lcom/momo/xengine/media/types/PixelFormat;

    .line 93
    .line 94
    const-string v0, "VIDEO_FORMAT_NV21_10BE"

    .line 95
    .line 96
    const/16 v11, 0x9

    .line 97
    .line 98
    invoke-direct {v10, v0, v11, v11}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 99
    .line 100
    .line 101
    sput-object v10, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_NV21_10BE:Lcom/momo/xengine/media/types/PixelFormat;

    .line 102
    .line 103
    new-instance v11, Lcom/momo/xengine/media/types/PixelFormat;

    .line 104
    .line 105
    const-string v0, "VIDEO_FORMAT_YVYU"

    .line 106
    .line 107
    const/16 v12, 0xa

    .line 108
    .line 109
    invoke-direct {v11, v0, v12, v12}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 110
    .line 111
    .line 112
    sput-object v11, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_YVYU:Lcom/momo/xengine/media/types/PixelFormat;

    .line 113
    .line 114
    new-instance v12, Lcom/momo/xengine/media/types/PixelFormat;

    .line 115
    .line 116
    const-string v0, "VIDEO_FORMAT_YUY2"

    .line 117
    .line 118
    const/16 v13, 0xb

    .line 119
    .line 120
    invoke-direct {v12, v0, v13, v13}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 121
    .line 122
    .line 123
    sput-object v12, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_YUY2:Lcom/momo/xengine/media/types/PixelFormat;

    .line 124
    .line 125
    new-instance v13, Lcom/momo/xengine/media/types/PixelFormat;

    .line 126
    .line 127
    const-string v0, "VIDEO_FORMAT_UYVY"

    .line 128
    .line 129
    const/16 v14, 0xc

    .line 130
    .line 131
    invoke-direct {v13, v0, v14, v14}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 132
    .line 133
    .line 134
    sput-object v13, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_UYVY:Lcom/momo/xengine/media/types/PixelFormat;

    .line 135
    .line 136
    new-instance v14, Lcom/momo/xengine/media/types/PixelFormat;

    .line 137
    .line 138
    const-string v0, "VIDEO_FORMAT_RGBA"

    .line 139
    .line 140
    const/16 v15, 0xd

    .line 141
    .line 142
    invoke-direct {v14, v0, v15, v15}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 143
    .line 144
    .line 145
    sput-object v14, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_RGBA:Lcom/momo/xengine/media/types/PixelFormat;

    .line 146
    .line 147
    new-instance v15, Lcom/momo/xengine/media/types/PixelFormat;

    .line 148
    .line 149
    const-string v0, "VIDEO_FORMAT_BGRA"

    .line 150
    .line 151
    move-object/from16 v16, v1

    .line 152
    .line 153
    const/16 v1, 0xe

    .line 154
    .line 155
    invoke-direct {v15, v0, v1, v1}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 156
    .line 157
    .line 158
    sput-object v15, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_BGRA:Lcom/momo/xengine/media/types/PixelFormat;

    .line 159
    .line 160
    new-instance v0, Lcom/momo/xengine/media/types/PixelFormat;

    .line 161
    .line 162
    const-string v1, "VIDEO_FORMAT_BGRX"

    .line 163
    .line 164
    move-object/from16 v17, v2

    .line 165
    .line 166
    const/16 v2, 0xf

    .line 167
    .line 168
    invoke-direct {v0, v1, v2, v2}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 169
    .line 170
    .line 171
    sput-object v0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_BGRX:Lcom/momo/xengine/media/types/PixelFormat;

    .line 172
    .line 173
    new-instance v1, Lcom/momo/xengine/media/types/PixelFormat;

    .line 174
    .line 175
    const-string v2, "VIDEO_FORMAT_Y800"

    .line 176
    .line 177
    move-object/from16 v18, v0

    .line 178
    .line 179
    const/16 v0, 0x10

    .line 180
    .line 181
    invoke-direct {v1, v2, v0, v0}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 182
    .line 183
    .line 184
    sput-object v1, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_Y800:Lcom/momo/xengine/media/types/PixelFormat;

    .line 185
    .line 186
    new-instance v0, Lcom/momo/xengine/media/types/PixelFormat;

    .line 187
    .line 188
    const-string v2, "VIDEO_FORMAT_I444"

    .line 189
    .line 190
    move-object/from16 v19, v1

    .line 191
    .line 192
    const/16 v1, 0x11

    .line 193
    .line 194
    invoke-direct {v0, v2, v1, v1}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 195
    .line 196
    .line 197
    sput-object v0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_I444:Lcom/momo/xengine/media/types/PixelFormat;

    .line 198
    .line 199
    new-instance v1, Lcom/momo/xengine/media/types/PixelFormat;

    .line 200
    .line 201
    const-string v2, "VIDEO_FORMAT_BGR3"

    .line 202
    .line 203
    move-object/from16 v20, v0

    .line 204
    .line 205
    const/16 v0, 0x12

    .line 206
    .line 207
    invoke-direct {v1, v2, v0, v0}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 208
    .line 209
    .line 210
    sput-object v1, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_BGR3:Lcom/momo/xengine/media/types/PixelFormat;

    .line 211
    .line 212
    new-instance v0, Lcom/momo/xengine/media/types/PixelFormat;

    .line 213
    .line 214
    const-string v2, "VIDEO_FORMAT_I422"

    .line 215
    .line 216
    move-object/from16 v21, v1

    .line 217
    .line 218
    const/16 v1, 0x13

    .line 219
    .line 220
    invoke-direct {v0, v2, v1, v1}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 221
    .line 222
    .line 223
    sput-object v0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_I422:Lcom/momo/xengine/media/types/PixelFormat;

    .line 224
    .line 225
    new-instance v1, Lcom/momo/xengine/media/types/PixelFormat;

    .line 226
    .line 227
    const-string v2, "VIDEO_FORMAT_I40A"

    .line 228
    .line 229
    move-object/from16 v22, v0

    .line 230
    .line 231
    const/16 v0, 0x14

    .line 232
    .line 233
    invoke-direct {v1, v2, v0, v0}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 234
    .line 235
    .line 236
    sput-object v1, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_I40A:Lcom/momo/xengine/media/types/PixelFormat;

    .line 237
    .line 238
    new-instance v0, Lcom/momo/xengine/media/types/PixelFormat;

    .line 239
    .line 240
    const-string v2, "VIDEO_FORMAT_I42A"

    .line 241
    .line 242
    move-object/from16 v23, v1

    .line 243
    .line 244
    const/16 v1, 0x15

    .line 245
    .line 246
    invoke-direct {v0, v2, v1, v1}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 247
    .line 248
    .line 249
    sput-object v0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_I42A:Lcom/momo/xengine/media/types/PixelFormat;

    .line 250
    .line 251
    new-instance v1, Lcom/momo/xengine/media/types/PixelFormat;

    .line 252
    .line 253
    const/16 v2, 0x16

    .line 254
    .line 255
    move-object/from16 v24, v0

    .line 256
    .line 257
    const/16 v0, 0x16

    .line 258
    .line 259
    move-object/from16 v25, v3

    .line 260
    .line 261
    const-string v3, "VIDEO_FORMAT_YUVA"

    .line 262
    .line 263
    invoke-direct {v1, v3, v2, v0}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 264
    .line 265
    .line 266
    sput-object v1, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_YUVA:Lcom/momo/xengine/media/types/PixelFormat;

    .line 267
    .line 268
    new-instance v0, Lcom/momo/xengine/media/types/PixelFormat;

    .line 269
    .line 270
    const/16 v2, 0x17

    .line 271
    .line 272
    const/16 v3, 0x17

    .line 273
    .line 274
    move-object/from16 v26, v1

    .line 275
    .line 276
    const-string v1, "VIDEO_FORMAT_AYUV"

    .line 277
    .line 278
    invoke-direct {v0, v1, v2, v3}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 279
    .line 280
    .line 281
    sput-object v0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_AYUV:Lcom/momo/xengine/media/types/PixelFormat;

    .line 282
    .line 283
    new-instance v1, Lcom/momo/xengine/media/types/PixelFormat;

    .line 284
    .line 285
    const/16 v2, 0x18

    .line 286
    .line 287
    const/16 v3, 0x18

    .line 288
    .line 289
    move-object/from16 v27, v0

    .line 290
    .line 291
    const-string v0, "VIDEO_FORMAT_I210"

    .line 292
    .line 293
    invoke-direct {v1, v0, v2, v3}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 294
    .line 295
    .line 296
    sput-object v1, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_I210:Lcom/momo/xengine/media/types/PixelFormat;

    .line 297
    .line 298
    new-instance v0, Lcom/momo/xengine/media/types/PixelFormat;

    .line 299
    .line 300
    const/16 v2, 0x19

    .line 301
    .line 302
    const/16 v3, 0x19

    .line 303
    .line 304
    move-object/from16 v28, v1

    .line 305
    .line 306
    const-string v1, "VIDEO_FORMAT_I412"

    .line 307
    .line 308
    invoke-direct {v0, v1, v2, v3}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 309
    .line 310
    .line 311
    sput-object v0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_I412:Lcom/momo/xengine/media/types/PixelFormat;

    .line 312
    .line 313
    new-instance v1, Lcom/momo/xengine/media/types/PixelFormat;

    .line 314
    .line 315
    const/16 v2, 0x1a

    .line 316
    .line 317
    const/16 v3, 0x1a

    .line 318
    .line 319
    move-object/from16 v29, v0

    .line 320
    .line 321
    const-string v0, "VIDEO_FORMAT_YA2L"

    .line 322
    .line 323
    invoke-direct {v1, v0, v2, v3}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 324
    .line 325
    .line 326
    sput-object v1, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_YA2L:Lcom/momo/xengine/media/types/PixelFormat;

    .line 327
    .line 328
    new-instance v0, Lcom/momo/xengine/media/types/PixelFormat;

    .line 329
    .line 330
    const/16 v2, 0x1b

    .line 331
    .line 332
    const/16 v3, 0x1b

    .line 333
    .line 334
    move-object/from16 v30, v1

    .line 335
    .line 336
    const-string v1, "VIDEO_FORMAT_CVPIXELBUFFER_APPLE"

    .line 337
    .line 338
    invoke-direct {v0, v1, v2, v3}, Lcom/momo/xengine/media/types/PixelFormat;-><init>(Ljava/lang/String;II)V

    .line 339
    .line 340
    .line 341
    sput-object v0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_CVPIXELBUFFER_APPLE:Lcom/momo/xengine/media/types/PixelFormat;

    .line 342
    .line 343
    move-object/from16 v1, v16

    .line 344
    .line 345
    move-object/from16 v2, v17

    .line 346
    .line 347
    move-object/from16 v16, v18

    .line 348
    .line 349
    move-object/from16 v17, v19

    .line 350
    .line 351
    move-object/from16 v18, v20

    .line 352
    .line 353
    move-object/from16 v19, v21

    .line 354
    .line 355
    move-object/from16 v20, v22

    .line 356
    .line 357
    move-object/from16 v21, v23

    .line 358
    .line 359
    move-object/from16 v22, v24

    .line 360
    .line 361
    move-object/from16 v3, v25

    .line 362
    .line 363
    move-object/from16 v23, v26

    .line 364
    .line 365
    move-object/from16 v24, v27

    .line 366
    .line 367
    move-object/from16 v25, v28

    .line 368
    .line 369
    move-object/from16 v26, v29

    .line 370
    .line 371
    move-object/from16 v27, v30

    .line 372
    .line 373
    move-object/from16 v28, v0

    .line 374
    .line 375
    filled-new-array/range {v1 .. v28}, [Lcom/momo/xengine/media/types/PixelFormat;

    .line 376
    .line 377
    .line 378
    move-result-object v0

    .line 379
    sput-object v0, Lcom/momo/xengine/media/types/PixelFormat;->$VALUES:[Lcom/momo/xengine/media/types/PixelFormat;

    .line 380
    .line 381
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/momo/xengine/media/types/PixelFormat;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(I)Lcom/momo/xengine/media/types/PixelFormat;
    .locals 0

    .line 1
    packed-switch p0, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_NONE:Lcom/momo/xengine/media/types/PixelFormat;

    .line 5
    .line 6
    return-object p0

    .line 7
    :pswitch_0
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_CVPIXELBUFFER_APPLE:Lcom/momo/xengine/media/types/PixelFormat;

    .line 8
    .line 9
    return-object p0

    .line 10
    :pswitch_1
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_YA2L:Lcom/momo/xengine/media/types/PixelFormat;

    .line 11
    .line 12
    return-object p0

    .line 13
    :pswitch_2
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_I412:Lcom/momo/xengine/media/types/PixelFormat;

    .line 14
    .line 15
    return-object p0

    .line 16
    :pswitch_3
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_I210:Lcom/momo/xengine/media/types/PixelFormat;

    .line 17
    .line 18
    return-object p0

    .line 19
    :pswitch_4
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_AYUV:Lcom/momo/xengine/media/types/PixelFormat;

    .line 20
    .line 21
    return-object p0

    .line 22
    :pswitch_5
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_YUVA:Lcom/momo/xengine/media/types/PixelFormat;

    .line 23
    .line 24
    return-object p0

    .line 25
    :pswitch_6
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_I42A:Lcom/momo/xengine/media/types/PixelFormat;

    .line 26
    .line 27
    return-object p0

    .line 28
    :pswitch_7
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_I40A:Lcom/momo/xengine/media/types/PixelFormat;

    .line 29
    .line 30
    return-object p0

    .line 31
    :pswitch_8
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_I422:Lcom/momo/xengine/media/types/PixelFormat;

    .line 32
    .line 33
    return-object p0

    .line 34
    :pswitch_9
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_BGR3:Lcom/momo/xengine/media/types/PixelFormat;

    .line 35
    .line 36
    return-object p0

    .line 37
    :pswitch_a
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_I444:Lcom/momo/xengine/media/types/PixelFormat;

    .line 38
    .line 39
    return-object p0

    .line 40
    :pswitch_b
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_Y800:Lcom/momo/xengine/media/types/PixelFormat;

    .line 41
    .line 42
    return-object p0

    .line 43
    :pswitch_c
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_BGRX:Lcom/momo/xengine/media/types/PixelFormat;

    .line 44
    .line 45
    return-object p0

    .line 46
    :pswitch_d
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_BGRA:Lcom/momo/xengine/media/types/PixelFormat;

    .line 47
    .line 48
    return-object p0

    .line 49
    :pswitch_e
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_RGBA:Lcom/momo/xengine/media/types/PixelFormat;

    .line 50
    .line 51
    return-object p0

    .line 52
    :pswitch_f
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_UYVY:Lcom/momo/xengine/media/types/PixelFormat;

    .line 53
    .line 54
    return-object p0

    .line 55
    :pswitch_10
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_YUY2:Lcom/momo/xengine/media/types/PixelFormat;

    .line 56
    .line 57
    return-object p0

    .line 58
    :pswitch_11
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_YVYU:Lcom/momo/xengine/media/types/PixelFormat;

    .line 59
    .line 60
    return-object p0

    .line 61
    :pswitch_12
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_NV21_10BE:Lcom/momo/xengine/media/types/PixelFormat;

    .line 62
    .line 63
    return-object p0

    .line 64
    :pswitch_13
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_NV21_10LE:Lcom/momo/xengine/media/types/PixelFormat;

    .line 65
    .line 66
    return-object p0

    .line 67
    :pswitch_14
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_NV21:Lcom/momo/xengine/media/types/PixelFormat;

    .line 68
    .line 69
    return-object p0

    .line 70
    :pswitch_15
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_NV12_10BE:Lcom/momo/xengine/media/types/PixelFormat;

    .line 71
    .line 72
    return-object p0

    .line 73
    :pswitch_16
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_NV12_10LE:Lcom/momo/xengine/media/types/PixelFormat;

    .line 74
    .line 75
    return-object p0

    .line 76
    :pswitch_17
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_NV12:Lcom/momo/xengine/media/types/PixelFormat;

    .line 77
    .line 78
    return-object p0

    .line 79
    :pswitch_18
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_I420_10BE:Lcom/momo/xengine/media/types/PixelFormat;

    .line 80
    .line 81
    return-object p0

    .line 82
    :pswitch_19
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_I420_10LE:Lcom/momo/xengine/media/types/PixelFormat;

    .line 83
    .line 84
    return-object p0

    .line 85
    :pswitch_1a
    sget-object p0, Lcom/momo/xengine/media/types/PixelFormat;->VIDEO_FORMAT_I420:Lcom/momo/xengine/media/types/PixelFormat;

    .line 86
    .line 87
    return-object p0

    .line 88
    nop

    .line 89
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
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

.method public static valueOf(Ljava/lang/String;)Lcom/momo/xengine/media/types/PixelFormat;
    .locals 1

    .line 89
    const-class v0, Lcom/momo/xengine/media/types/PixelFormat;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/momo/xengine/media/types/PixelFormat;

    return-object p0
.end method

.method public static values()[Lcom/momo/xengine/media/types/PixelFormat;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/xengine/media/types/PixelFormat;->$VALUES:[Lcom/momo/xengine/media/types/PixelFormat;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/momo/xengine/media/types/PixelFormat;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/momo/xengine/media/types/PixelFormat;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xengine/media/types/PixelFormat;->value:I

    .line 2
    .line 3
    return p0
.end method
