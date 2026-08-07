.class public final enum Lcom/ss/bytertc/engine/type/RoomStateChangeReason;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/type/RoomStateChangeReason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum DUPLICATE_LOGIN:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum EXCEEDS_THE_UPPER_LIMIT:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum INVALID_TOKEN:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum JOIN_ROOM:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum JOIN_ROOM_FAILED:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum KICKED_OUT:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum LEAVE_ROOM:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum LICENSE_EXPIRED:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum LICENSE_FILE_PATH_ERROR:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum LICENSE_FUNCTION_NOT_FOUND:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum LICENSE_ILLEGAL:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum LICENSE_INFORMATION_NOT_MATCH:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum LICENSE_NOT_MATCH_WITH_CACHE:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum LICENSE_PARAMETER_ERROR:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum RECONNECT:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum ROOM_DISMISS:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum ROOM_FORBIDDEN:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum SERVER_LICENSE_EXPIRED:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum STATE_ABNORMAL_SERVER_STATUS:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum TOKEN_EXPIRED:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum UNKNOWN:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum UPDATE_TOKEN_WITH_INVALID_TOKEN:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum USER_FORBIDDEN:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

.field public static final enum WITHOUT_LICENSE_AUTHENTICATE_SDK:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 27

    .line 1
    new-instance v1, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 2
    .line 3
    const-string v0, "JOIN_ROOM"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v1, v0, v2, v2}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v1, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->JOIN_ROOM:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 10
    .line 11
    new-instance v2, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 12
    .line 13
    const-string v0, "RECONNECT"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v2, v0, v3, v3}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v2, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->RECONNECT:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 20
    .line 21
    new-instance v3, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 22
    .line 23
    const-string v0, "LEAVE_ROOM"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v3, v0, v4, v4}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v3, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->LEAVE_ROOM:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 30
    .line 31
    new-instance v4, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 32
    .line 33
    const/4 v0, 0x3

    .line 34
    const/16 v5, -0x7d1

    .line 35
    .line 36
    const-string v6, "JOIN_ROOM_FAILED"

    .line 37
    .line 38
    invoke-direct {v4, v6, v0, v5}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 39
    .line 40
    .line 41
    sput-object v4, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->JOIN_ROOM_FAILED:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 42
    .line 43
    new-instance v5, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 44
    .line 45
    const/4 v0, 0x4

    .line 46
    const/16 v6, -0x3e8

    .line 47
    .line 48
    const-string v7, "INVALID_TOKEN"

    .line 49
    .line 50
    invoke-direct {v5, v7, v0, v6}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 51
    .line 52
    .line 53
    sput-object v5, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->INVALID_TOKEN:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 54
    .line 55
    new-instance v6, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 56
    .line 57
    const/4 v0, 0x5

    .line 58
    const/16 v7, -0x3f1

    .line 59
    .line 60
    const-string v8, "TOKEN_EXPIRED"

    .line 61
    .line 62
    invoke-direct {v6, v8, v0, v7}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 63
    .line 64
    .line 65
    sput-object v6, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->TOKEN_EXPIRED:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 66
    .line 67
    new-instance v7, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 68
    .line 69
    const/4 v0, 0x6

    .line 70
    const/16 v8, -0x3f2

    .line 71
    .line 72
    const-string v9, "UPDATE_TOKEN_WITH_INVALID_TOKEN"

    .line 73
    .line 74
    invoke-direct {v7, v9, v0, v8}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 75
    .line 76
    .line 77
    sput-object v7, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->UPDATE_TOKEN_WITH_INVALID_TOKEN:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 78
    .line 79
    new-instance v8, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 80
    .line 81
    const/4 v0, 0x7

    .line 82
    const/16 v9, -0x401

    .line 83
    .line 84
    const-string v10, "ROOM_FORBIDDEN"

    .line 85
    .line 86
    invoke-direct {v8, v10, v0, v9}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 87
    .line 88
    .line 89
    sput-object v8, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->ROOM_FORBIDDEN:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 90
    .line 91
    new-instance v9, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 92
    .line 93
    const/16 v0, 0x8

    .line 94
    .line 95
    const/16 v10, -0x402

    .line 96
    .line 97
    const-string v11, "USER_FORBIDDEN"

    .line 98
    .line 99
    invoke-direct {v9, v11, v0, v10}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 100
    .line 101
    .line 102
    sput-object v9, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->USER_FORBIDDEN:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 103
    .line 104
    new-instance v10, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 105
    .line 106
    const/16 v0, 0x9

    .line 107
    .line 108
    const/16 v11, -0x3ee

    .line 109
    .line 110
    const-string v12, "KICKED_OUT"

    .line 111
    .line 112
    invoke-direct {v10, v12, v0, v11}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 113
    .line 114
    .line 115
    sput-object v10, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->KICKED_OUT:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 116
    .line 117
    new-instance v11, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 118
    .line 119
    const/16 v0, 0xa

    .line 120
    .line 121
    const/16 v12, -0x3f3

    .line 122
    .line 123
    const-string v13, "ROOM_DISMISS"

    .line 124
    .line 125
    invoke-direct {v11, v13, v0, v12}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 126
    .line 127
    .line 128
    sput-object v11, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->ROOM_DISMISS:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 129
    .line 130
    new-instance v12, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 131
    .line 132
    const/16 v0, 0xb

    .line 133
    .line 134
    const/16 v13, -0x3ec

    .line 135
    .line 136
    const-string v14, "DUPLICATE_LOGIN"

    .line 137
    .line 138
    invoke-direct {v12, v14, v0, v13}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 139
    .line 140
    .line 141
    sput-object v12, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->DUPLICATE_LOGIN:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 142
    .line 143
    new-instance v13, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 144
    .line 145
    const/16 v0, 0xc

    .line 146
    .line 147
    const/16 v14, -0x3f4

    .line 148
    .line 149
    const-string v15, "WITHOUT_LICENSE_AUTHENTICATE_SDK"

    .line 150
    .line 151
    invoke-direct {v13, v15, v0, v14}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 152
    .line 153
    .line 154
    sput-object v13, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->WITHOUT_LICENSE_AUTHENTICATE_SDK:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 155
    .line 156
    new-instance v14, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 157
    .line 158
    const/16 v0, 0xd

    .line 159
    .line 160
    const/16 v15, -0x3f9

    .line 161
    .line 162
    move-object/from16 v16, v1

    .line 163
    .line 164
    const-string v1, "SERVER_LICENSE_EXPIRED"

    .line 165
    .line 166
    invoke-direct {v14, v1, v0, v15}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 167
    .line 168
    .line 169
    sput-object v14, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->SERVER_LICENSE_EXPIRED:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 170
    .line 171
    new-instance v15, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 172
    .line 173
    const/16 v0, 0xe

    .line 174
    .line 175
    const/16 v1, -0x3fa

    .line 176
    .line 177
    move-object/from16 v17, v2

    .line 178
    .line 179
    const-string v2, "EXCEEDS_THE_UPPER_LIMIT"

    .line 180
    .line 181
    invoke-direct {v15, v2, v0, v1}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 182
    .line 183
    .line 184
    sput-object v15, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->EXCEEDS_THE_UPPER_LIMIT:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 185
    .line 186
    new-instance v0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 187
    .line 188
    const/16 v1, 0xf

    .line 189
    .line 190
    const/16 v2, -0x3fb

    .line 191
    .line 192
    move-object/from16 v18, v3

    .line 193
    .line 194
    const-string v3, "LICENSE_PARAMETER_ERROR"

    .line 195
    .line 196
    invoke-direct {v0, v3, v1, v2}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 197
    .line 198
    .line 199
    sput-object v0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->LICENSE_PARAMETER_ERROR:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 200
    .line 201
    new-instance v1, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 202
    .line 203
    const/16 v2, 0x10

    .line 204
    .line 205
    const/16 v3, -0x3fc

    .line 206
    .line 207
    move-object/from16 v19, v0

    .line 208
    .line 209
    const-string v0, "LICENSE_FILE_PATH_ERROR"

    .line 210
    .line 211
    invoke-direct {v1, v0, v2, v3}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 212
    .line 213
    .line 214
    sput-object v1, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->LICENSE_FILE_PATH_ERROR:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 215
    .line 216
    new-instance v0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 217
    .line 218
    const/16 v2, 0x11

    .line 219
    .line 220
    const/16 v3, -0x3fd

    .line 221
    .line 222
    move-object/from16 v20, v1

    .line 223
    .line 224
    const-string v1, "LICENSE_ILLEGAL"

    .line 225
    .line 226
    invoke-direct {v0, v1, v2, v3}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 227
    .line 228
    .line 229
    sput-object v0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->LICENSE_ILLEGAL:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 230
    .line 231
    new-instance v1, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 232
    .line 233
    const/16 v2, 0x12

    .line 234
    .line 235
    const/16 v3, -0x3fe

    .line 236
    .line 237
    move-object/from16 v21, v0

    .line 238
    .line 239
    const-string v0, "LICENSE_EXPIRED"

    .line 240
    .line 241
    invoke-direct {v1, v0, v2, v3}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 242
    .line 243
    .line 244
    sput-object v1, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->LICENSE_EXPIRED:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 245
    .line 246
    new-instance v0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 247
    .line 248
    const/16 v2, 0x13

    .line 249
    .line 250
    const/16 v3, -0x3ff

    .line 251
    .line 252
    move-object/from16 v22, v1

    .line 253
    .line 254
    const-string v1, "LICENSE_INFORMATION_NOT_MATCH"

    .line 255
    .line 256
    invoke-direct {v0, v1, v2, v3}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 257
    .line 258
    .line 259
    sput-object v0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->LICENSE_INFORMATION_NOT_MATCH:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 260
    .line 261
    new-instance v1, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 262
    .line 263
    const/16 v2, 0x14

    .line 264
    .line 265
    const/16 v3, -0x400

    .line 266
    .line 267
    move-object/from16 v23, v0

    .line 268
    .line 269
    const-string v0, "LICENSE_NOT_MATCH_WITH_CACHE"

    .line 270
    .line 271
    invoke-direct {v1, v0, v2, v3}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 272
    .line 273
    .line 274
    sput-object v1, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->LICENSE_NOT_MATCH_WITH_CACHE:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 275
    .line 276
    new-instance v0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 277
    .line 278
    const/16 v2, 0x15

    .line 279
    .line 280
    const/16 v3, -0x403

    .line 281
    .line 282
    move-object/from16 v24, v1

    .line 283
    .line 284
    const-string v1, "LICENSE_FUNCTION_NOT_FOUND"

    .line 285
    .line 286
    invoke-direct {v0, v1, v2, v3}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 287
    .line 288
    .line 289
    sput-object v0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->LICENSE_FUNCTION_NOT_FOUND:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 290
    .line 291
    new-instance v1, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 292
    .line 293
    const/16 v2, 0x16

    .line 294
    .line 295
    const/16 v3, -0x43c

    .line 296
    .line 297
    move-object/from16 v25, v0

    .line 298
    .line 299
    const-string v0, "STATE_ABNORMAL_SERVER_STATUS"

    .line 300
    .line 301
    invoke-direct {v1, v0, v2, v3}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 302
    .line 303
    .line 304
    sput-object v1, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->STATE_ABNORMAL_SERVER_STATUS:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 305
    .line 306
    new-instance v0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 307
    .line 308
    const/16 v2, 0x17

    .line 309
    .line 310
    const/16 v3, -0x3e9

    .line 311
    .line 312
    move-object/from16 v26, v1

    .line 313
    .line 314
    const-string v1, "UNKNOWN"

    .line 315
    .line 316
    invoke-direct {v0, v1, v2, v3}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;-><init>(Ljava/lang/String;II)V

    .line 317
    .line 318
    .line 319
    sput-object v0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->UNKNOWN:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 320
    .line 321
    move-object/from16 v1, v16

    .line 322
    .line 323
    move-object/from16 v2, v17

    .line 324
    .line 325
    move-object/from16 v3, v18

    .line 326
    .line 327
    move-object/from16 v16, v19

    .line 328
    .line 329
    move-object/from16 v17, v20

    .line 330
    .line 331
    move-object/from16 v18, v21

    .line 332
    .line 333
    move-object/from16 v19, v22

    .line 334
    .line 335
    move-object/from16 v20, v23

    .line 336
    .line 337
    move-object/from16 v21, v24

    .line 338
    .line 339
    move-object/from16 v22, v25

    .line 340
    .line 341
    move-object/from16 v23, v26

    .line 342
    .line 343
    move-object/from16 v24, v0

    .line 344
    .line 345
    filled-new-array/range {v1 .. v24}, [Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 346
    .line 347
    .line 348
    move-result-object v0

    .line 349
    sput-object v0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->$VALUES:[Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 350
    .line 351
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
    iput p3, p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(I)Lcom/ss/bytertc/engine/type/RoomStateChangeReason;
    .locals 1

    .line 1
    const/16 v0, -0x7d1

    .line 2
    .line 3
    if-eq p0, v0, :cond_8

    .line 4
    .line 5
    const/16 v0, -0x43c

    .line 6
    .line 7
    if-eq p0, v0, :cond_7

    .line 8
    .line 9
    const/16 v0, -0x3ee

    .line 10
    .line 11
    if-eq p0, v0, :cond_6

    .line 12
    .line 13
    const/16 v0, -0x3ec

    .line 14
    .line 15
    if-eq p0, v0, :cond_5

    .line 16
    .line 17
    const/16 v0, -0x3e9

    .line 18
    .line 19
    if-eq p0, v0, :cond_4

    .line 20
    .line 21
    const/16 v0, -0x3e8

    .line 22
    .line 23
    if-eq p0, v0, :cond_3

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    if-eq p0, v0, :cond_1

    .line 29
    .line 30
    const/4 v0, 0x2

    .line 31
    if-eq p0, v0, :cond_0

    .line 32
    .line 33
    packed-switch p0, :pswitch_data_0

    .line 34
    .line 35
    .line 36
    packed-switch p0, :pswitch_data_1

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x0

    .line 40
    return-object p0

    .line 41
    :pswitch_0
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->TOKEN_EXPIRED:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 42
    .line 43
    return-object p0

    .line 44
    :pswitch_1
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->UPDATE_TOKEN_WITH_INVALID_TOKEN:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 45
    .line 46
    return-object p0

    .line 47
    :pswitch_2
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->ROOM_DISMISS:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 48
    .line 49
    return-object p0

    .line 50
    :pswitch_3
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->WITHOUT_LICENSE_AUTHENTICATE_SDK:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 51
    .line 52
    return-object p0

    .line 53
    :pswitch_4
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->SERVER_LICENSE_EXPIRED:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 54
    .line 55
    return-object p0

    .line 56
    :pswitch_5
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->EXCEEDS_THE_UPPER_LIMIT:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 57
    .line 58
    return-object p0

    .line 59
    :pswitch_6
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->LICENSE_PARAMETER_ERROR:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 60
    .line 61
    return-object p0

    .line 62
    :pswitch_7
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->LICENSE_FILE_PATH_ERROR:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 63
    .line 64
    return-object p0

    .line 65
    :pswitch_8
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->LICENSE_ILLEGAL:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 66
    .line 67
    return-object p0

    .line 68
    :pswitch_9
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->LICENSE_EXPIRED:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 69
    .line 70
    return-object p0

    .line 71
    :pswitch_a
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->LICENSE_INFORMATION_NOT_MATCH:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 72
    .line 73
    return-object p0

    .line 74
    :pswitch_b
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->LICENSE_NOT_MATCH_WITH_CACHE:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 75
    .line 76
    return-object p0

    .line 77
    :pswitch_c
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->ROOM_FORBIDDEN:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 78
    .line 79
    return-object p0

    .line 80
    :pswitch_d
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->USER_FORBIDDEN:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 81
    .line 82
    return-object p0

    .line 83
    :pswitch_e
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->LICENSE_FUNCTION_NOT_FOUND:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 84
    .line 85
    return-object p0

    .line 86
    :cond_0
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->LEAVE_ROOM:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 87
    .line 88
    return-object p0

    .line 89
    :cond_1
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->RECONNECT:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 90
    .line 91
    return-object p0

    .line 92
    :cond_2
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->JOIN_ROOM:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 93
    .line 94
    return-object p0

    .line 95
    :cond_3
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->INVALID_TOKEN:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 96
    .line 97
    return-object p0

    .line 98
    :cond_4
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->UNKNOWN:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 99
    .line 100
    return-object p0

    .line 101
    :cond_5
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->DUPLICATE_LOGIN:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 102
    .line 103
    return-object p0

    .line 104
    :cond_6
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->KICKED_OUT:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 105
    .line 106
    return-object p0

    .line 107
    :cond_7
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->STATE_ABNORMAL_SERVER_STATUS:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 108
    .line 109
    return-object p0

    .line 110
    :cond_8
    sget-object p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->JOIN_ROOM_FAILED:Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 111
    .line 112
    return-object p0

    .line 113
    :pswitch_data_0
    .packed-switch -0x403
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
    .end packed-switch

    .line 114
    .line 115
    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    :pswitch_data_1
    .packed-switch -0x3f4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/type/RoomStateChangeReason;
    .locals 1

    .line 113
    const-class v0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/type/RoomStateChangeReason;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->$VALUES:[Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->value:I

    .line 2
    .line 3
    return p0
.end method
