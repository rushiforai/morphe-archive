.class public final enum Lcom/ss/bytertc/engine/type/AudioProblemFeedback;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/type/AudioProblemFeedback;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum DISCONNECTED:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum EAR_BACK_DELAY:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum LOCAL_AUDIO_LAGGING:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum LOCAL_AUDIO_STRENGTH:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum LOCAL_ECHO:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum LOCAL_NOISE:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum LOCAL_NOT_SYNC:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum LOCAL_NO_AUDIO:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum LOCAL_NO_VIDEO:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum LOCAL_VIDEO_FUZZY:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum LOCAL_VIDEO_LAGGING:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum NONE:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum OTHER_MESSAGE:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum REMOTE_AUDIO_LAGGING:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum REMOTE_AUDIO_STRENGTH:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum REMOTE_ECHO:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum REMOTE_NOISE:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum REMOTE_NOT_SYNC:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum REMOTE_NO_AUDIO:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum REMOTE_NO_VIDEO:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum REMOTE_VIDEO_FUZZY:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

.field public static final enum REMOTE_VIDEO_LAGGING:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;


# instance fields
.field public final value:J


# direct methods
.method static constructor <clinit>()V
    .locals 26

    .line 1
    new-instance v1, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    const-string v4, "NONE"

    .line 7
    .line 8
    invoke-direct {v1, v4, v0, v2, v3}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 9
    .line 10
    .line 11
    sput-object v1, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->NONE:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 12
    .line 13
    new-instance v2, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    const-wide/16 v3, 0x1

    .line 17
    .line 18
    const-string v5, "OTHER_MESSAGE"

    .line 19
    .line 20
    invoke-direct {v2, v5, v0, v3, v4}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 21
    .line 22
    .line 23
    sput-object v2, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->OTHER_MESSAGE:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 24
    .line 25
    new-instance v3, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 26
    .line 27
    const/4 v0, 0x2

    .line 28
    const-wide/16 v4, 0x2

    .line 29
    .line 30
    const-string v6, "DISCONNECTED"

    .line 31
    .line 32
    invoke-direct {v3, v6, v0, v4, v5}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 33
    .line 34
    .line 35
    sput-object v3, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->DISCONNECTED:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 36
    .line 37
    new-instance v4, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 38
    .line 39
    const/4 v0, 0x3

    .line 40
    const-wide/16 v5, 0x4

    .line 41
    .line 42
    const-string v7, "EAR_BACK_DELAY"

    .line 43
    .line 44
    invoke-direct {v4, v7, v0, v5, v6}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 45
    .line 46
    .line 47
    sput-object v4, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->EAR_BACK_DELAY:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 48
    .line 49
    new-instance v5, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 50
    .line 51
    const/4 v0, 0x4

    .line 52
    const-wide/16 v6, 0x400

    .line 53
    .line 54
    const-string v8, "LOCAL_NOISE"

    .line 55
    .line 56
    invoke-direct {v5, v8, v0, v6, v7}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 57
    .line 58
    .line 59
    sput-object v5, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->LOCAL_NOISE:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 60
    .line 61
    new-instance v6, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 62
    .line 63
    const/4 v0, 0x5

    .line 64
    const-wide/16 v7, 0x800

    .line 65
    .line 66
    const-string v9, "LOCAL_AUDIO_LAGGING"

    .line 67
    .line 68
    invoke-direct {v6, v9, v0, v7, v8}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 69
    .line 70
    .line 71
    sput-object v6, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->LOCAL_AUDIO_LAGGING:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 72
    .line 73
    new-instance v7, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 74
    .line 75
    const/4 v0, 0x6

    .line 76
    const-wide/16 v8, 0x1000

    .line 77
    .line 78
    const-string v10, "LOCAL_NO_AUDIO"

    .line 79
    .line 80
    invoke-direct {v7, v10, v0, v8, v9}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 81
    .line 82
    .line 83
    sput-object v7, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->LOCAL_NO_AUDIO:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 84
    .line 85
    new-instance v8, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 86
    .line 87
    const/4 v0, 0x7

    .line 88
    const-wide/16 v9, 0x2000

    .line 89
    .line 90
    const-string v11, "LOCAL_AUDIO_STRENGTH"

    .line 91
    .line 92
    invoke-direct {v8, v11, v0, v9, v10}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 93
    .line 94
    .line 95
    sput-object v8, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->LOCAL_AUDIO_STRENGTH:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 96
    .line 97
    new-instance v9, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 98
    .line 99
    const/16 v0, 0x8

    .line 100
    .line 101
    const-wide/16 v10, 0x4000

    .line 102
    .line 103
    const-string v12, "LOCAL_ECHO"

    .line 104
    .line 105
    invoke-direct {v9, v12, v0, v10, v11}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 106
    .line 107
    .line 108
    sput-object v9, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->LOCAL_ECHO:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 109
    .line 110
    new-instance v10, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 111
    .line 112
    const/16 v0, 0x9

    .line 113
    .line 114
    const-wide/32 v11, 0x1000000

    .line 115
    .line 116
    .line 117
    const-string v13, "LOCAL_VIDEO_FUZZY"

    .line 118
    .line 119
    invoke-direct {v10, v13, v0, v11, v12}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 120
    .line 121
    .line 122
    sput-object v10, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->LOCAL_VIDEO_FUZZY:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 123
    .line 124
    new-instance v11, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 125
    .line 126
    const/16 v0, 0xa

    .line 127
    .line 128
    const-wide/32 v12, 0x2000000

    .line 129
    .line 130
    .line 131
    const-string v14, "LOCAL_NOT_SYNC"

    .line 132
    .line 133
    invoke-direct {v11, v14, v0, v12, v13}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 134
    .line 135
    .line 136
    sput-object v11, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->LOCAL_NOT_SYNC:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 137
    .line 138
    new-instance v12, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 139
    .line 140
    const/16 v0, 0xb

    .line 141
    .line 142
    const-wide/32 v13, 0x4000000

    .line 143
    .line 144
    .line 145
    const-string v15, "LOCAL_VIDEO_LAGGING"

    .line 146
    .line 147
    invoke-direct {v12, v15, v0, v13, v14}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 148
    .line 149
    .line 150
    sput-object v12, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->LOCAL_VIDEO_LAGGING:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 151
    .line 152
    new-instance v13, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 153
    .line 154
    const/16 v0, 0xc

    .line 155
    .line 156
    const-wide/32 v14, 0x8000000

    .line 157
    .line 158
    .line 159
    move-object/from16 v16, v1

    .line 160
    .line 161
    const-string v1, "LOCAL_NO_VIDEO"

    .line 162
    .line 163
    invoke-direct {v13, v1, v0, v14, v15}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 164
    .line 165
    .line 166
    sput-object v13, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->LOCAL_NO_VIDEO:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 167
    .line 168
    new-instance v14, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 169
    .line 170
    const/16 v0, 0xd

    .line 171
    .line 172
    move-object v15, v2

    .line 173
    const-wide v1, 0x2000000000L

    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    move-object/from16 v17, v3

    .line 179
    .line 180
    const-string v3, "REMOTE_NOISE"

    .line 181
    .line 182
    invoke-direct {v14, v3, v0, v1, v2}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 183
    .line 184
    .line 185
    sput-object v14, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->REMOTE_NOISE:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 186
    .line 187
    move-object v2, v15

    .line 188
    new-instance v15, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 189
    .line 190
    const/16 v0, 0xe

    .line 191
    .line 192
    move-object v3, v2

    .line 193
    const-wide v1, 0x4000000000L

    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    move-object/from16 v18, v3

    .line 199
    .line 200
    const-string v3, "REMOTE_AUDIO_LAGGING"

    .line 201
    .line 202
    invoke-direct {v15, v3, v0, v1, v2}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 203
    .line 204
    .line 205
    sput-object v15, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->REMOTE_AUDIO_LAGGING:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 206
    .line 207
    new-instance v0, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 208
    .line 209
    const/16 v1, 0xf

    .line 210
    .line 211
    const-wide v2, 0x8000000000L

    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    move-object/from16 v19, v4

    .line 217
    .line 218
    const-string v4, "REMOTE_NO_AUDIO"

    .line 219
    .line 220
    invoke-direct {v0, v4, v1, v2, v3}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 221
    .line 222
    .line 223
    sput-object v0, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->REMOTE_NO_AUDIO:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 224
    .line 225
    new-instance v1, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 226
    .line 227
    const/16 v2, 0x10

    .line 228
    .line 229
    const-wide v3, 0x10000000000L

    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    move-object/from16 v20, v0

    .line 235
    .line 236
    const-string v0, "REMOTE_AUDIO_STRENGTH"

    .line 237
    .line 238
    invoke-direct {v1, v0, v2, v3, v4}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 239
    .line 240
    .line 241
    sput-object v1, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->REMOTE_AUDIO_STRENGTH:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 242
    .line 243
    new-instance v0, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 244
    .line 245
    const/16 v2, 0x11

    .line 246
    .line 247
    const-wide v3, 0x20000000000L

    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    move-object/from16 v21, v1

    .line 253
    .line 254
    const-string v1, "REMOTE_ECHO"

    .line 255
    .line 256
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 257
    .line 258
    .line 259
    sput-object v0, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->REMOTE_ECHO:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 260
    .line 261
    new-instance v1, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 262
    .line 263
    const/16 v2, 0x12

    .line 264
    .line 265
    const-wide/high16 v3, 0x8000000000000L

    .line 266
    .line 267
    move-object/from16 v22, v0

    .line 268
    .line 269
    const-string v0, "REMOTE_VIDEO_FUZZY"

    .line 270
    .line 271
    invoke-direct {v1, v0, v2, v3, v4}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 272
    .line 273
    .line 274
    sput-object v1, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->REMOTE_VIDEO_FUZZY:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 275
    .line 276
    new-instance v0, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 277
    .line 278
    const/16 v2, 0x13

    .line 279
    .line 280
    const-wide/high16 v3, 0x10000000000000L

    .line 281
    .line 282
    move-object/from16 v23, v1

    .line 283
    .line 284
    const-string v1, "REMOTE_NOT_SYNC"

    .line 285
    .line 286
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 287
    .line 288
    .line 289
    sput-object v0, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->REMOTE_NOT_SYNC:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 290
    .line 291
    new-instance v1, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 292
    .line 293
    const/16 v2, 0x14

    .line 294
    .line 295
    const-wide/high16 v3, 0x20000000000000L

    .line 296
    .line 297
    move-object/from16 v24, v0

    .line 298
    .line 299
    const-string v0, "REMOTE_VIDEO_LAGGING"

    .line 300
    .line 301
    invoke-direct {v1, v0, v2, v3, v4}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 302
    .line 303
    .line 304
    sput-object v1, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->REMOTE_VIDEO_LAGGING:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 305
    .line 306
    new-instance v0, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 307
    .line 308
    const/16 v2, 0x15

    .line 309
    .line 310
    const-wide/high16 v3, 0x40000000000000L

    .line 311
    .line 312
    move-object/from16 v25, v1

    .line 313
    .line 314
    const-string v1, "REMOTE_NO_VIDEO"

    .line 315
    .line 316
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;-><init>(Ljava/lang/String;IJ)V

    .line 317
    .line 318
    .line 319
    sput-object v0, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->REMOTE_NO_VIDEO:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 320
    .line 321
    move-object/from16 v1, v16

    .line 322
    .line 323
    move-object/from16 v3, v17

    .line 324
    .line 325
    move-object/from16 v2, v18

    .line 326
    .line 327
    move-object/from16 v4, v19

    .line 328
    .line 329
    move-object/from16 v16, v20

    .line 330
    .line 331
    move-object/from16 v17, v21

    .line 332
    .line 333
    move-object/from16 v18, v22

    .line 334
    .line 335
    move-object/from16 v19, v23

    .line 336
    .line 337
    move-object/from16 v20, v24

    .line 338
    .line 339
    move-object/from16 v21, v25

    .line 340
    .line 341
    move-object/from16 v22, v0

    .line 342
    .line 343
    filled-new-array/range {v1 .. v22}, [Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 344
    .line 345
    .line 346
    move-result-object v0

    .line 347
    sput-object v0, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->$VALUES:[Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 348
    .line 349
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-wide p3, p0, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->value:J

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/engine/type/AudioProblemFeedback;
    .locals 8

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->values()[Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, v0, v2

    .line 10
    .line 11
    iget-wide v4, v3, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->value:J

    .line 12
    .line 13
    int-to-long v6, p0

    .line 14
    cmp-long v4, v4, v6

    .line 15
    .line 16
    if-nez v4, :cond_0

    .line 17
    .line 18
    return-object v3

    .line 19
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    sget-object p0, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->NONE:Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 23
    .line 24
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/type/AudioProblemFeedback;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/type/AudioProblemFeedback;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->$VALUES:[Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/type/AudioProblemFeedback;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/type/AudioProblemFeedback;

    .line 8
    .line 9
    return-object v0
.end method
