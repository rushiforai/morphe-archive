.class public final enum Lcom/ss/bytertc/engine/data/ReturnStatus;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ss/bytertc/engine/data/ReturnStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_AEC_SCENE_WARNING:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_AEC_TYPE_WARNING:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_AUDIO_DEVICE_CAN_NOT_USE:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_AUDIO_DEVICE_FORMAT_NOT_SUPPORT:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_AUDIO_DEVICE_INIT_FAILED:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_AUDIO_DEVICE_NOT_EXISTS:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_AUDIO_DEVICE_NO_DEVICE:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_AUDIO_DEVICE_PROCESS_NOT_EXIST:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_AUDIO_DEVICE_START_FAILED:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_AUDIO_NOT_IMPLEMENTED:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_AUDIO_NO_FRAME:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_AUDIO_NO_PERMISSION:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_FAILURE:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_HAS_IN_ECHO_TEST:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_HAS_IN_LOGIN:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_HAS_IN_ROOM:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_NEITHER_VIDEO_NOR_AUDIO:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_NOT_SUPPORT:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_RESOURCE_OVERFLOW:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_ROOMID_IN_USE:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_ROOM_IS_DESTROY:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_SCREEN_NOT_SUPPORT:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_SUCCESS:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_VIDEO_NOT_SUPPORT:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_VIDEO_TIMESTAMP_WARNING:Lcom/ss/bytertc/engine/data/ReturnStatus;

.field public static final enum RETURN_STATUS_WRONG_STATE:Lcom/ss/bytertc/engine/data/ReturnStatus;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .locals 31

    .line 1
    new-instance v1, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 2
    .line 3
    const-string v0, "RETURN_STATUS_SUCCESS"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v1, v0, v2, v2}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_SUCCESS:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 10
    .line 11
    new-instance v2, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    const/4 v3, -0x1

    .line 15
    const-string v4, "RETURN_STATUS_FAILURE"

    .line 16
    .line 17
    invoke-direct {v2, v4, v0, v3}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v2, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_FAILURE:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 21
    .line 22
    new-instance v3, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 23
    .line 24
    const/4 v0, 0x2

    .line 25
    const/4 v4, -0x2

    .line 26
    const-string v5, "RETURN_STATUS_PARAMETER_ERR"

    .line 27
    .line 28
    invoke-direct {v3, v5, v0, v4}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 29
    .line 30
    .line 31
    sput-object v3, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 32
    .line 33
    new-instance v4, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 34
    .line 35
    const/4 v0, 0x3

    .line 36
    const/4 v5, -0x3

    .line 37
    const-string v6, "RETURN_STATUS_WRONG_STATE"

    .line 38
    .line 39
    invoke-direct {v4, v6, v0, v5}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 40
    .line 41
    .line 42
    sput-object v4, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_WRONG_STATE:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 43
    .line 44
    new-instance v5, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 45
    .line 46
    const/4 v0, 0x4

    .line 47
    const/4 v6, -0x4

    .line 48
    const-string v7, "RETURN_STATUS_HAS_IN_ROOM"

    .line 49
    .line 50
    invoke-direct {v5, v7, v0, v6}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 51
    .line 52
    .line 53
    sput-object v5, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_HAS_IN_ROOM:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 54
    .line 55
    new-instance v6, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 56
    .line 57
    const/4 v0, 0x5

    .line 58
    const/4 v7, -0x5

    .line 59
    const-string v8, "RETURN_STATUS_HAS_IN_LOGIN"

    .line 60
    .line 61
    invoke-direct {v6, v8, v0, v7}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 62
    .line 63
    .line 64
    sput-object v6, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_HAS_IN_LOGIN:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 65
    .line 66
    new-instance v7, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 67
    .line 68
    const/4 v0, 0x6

    .line 69
    const/4 v8, -0x6

    .line 70
    const-string v9, "RETURN_STATUS_HAS_IN_ECHO_TEST"

    .line 71
    .line 72
    invoke-direct {v7, v9, v0, v8}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 73
    .line 74
    .line 75
    sput-object v7, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_HAS_IN_ECHO_TEST:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 76
    .line 77
    new-instance v8, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 78
    .line 79
    const/4 v0, 0x7

    .line 80
    const/4 v9, -0x7

    .line 81
    const-string v10, "RETURN_STATUS_NEITHER_VIDEO_NOR_AUDIO"

    .line 82
    .line 83
    invoke-direct {v8, v10, v0, v9}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 84
    .line 85
    .line 86
    sput-object v8, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NEITHER_VIDEO_NOR_AUDIO:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 87
    .line 88
    new-instance v9, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 89
    .line 90
    const/16 v0, 0x8

    .line 91
    .line 92
    const/4 v10, -0x8

    .line 93
    const-string v11, "RETURN_STATUS_ROOMID_IN_USE"

    .line 94
    .line 95
    invoke-direct {v9, v11, v0, v10}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 96
    .line 97
    .line 98
    sput-object v9, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_ROOMID_IN_USE:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 99
    .line 100
    new-instance v10, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 101
    .line 102
    const/16 v0, 0x9

    .line 103
    .line 104
    const/16 v11, -0x9

    .line 105
    .line 106
    const-string v12, "RETURN_STATUS_SCREEN_NOT_SUPPORT"

    .line 107
    .line 108
    invoke-direct {v10, v12, v0, v11}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 109
    .line 110
    .line 111
    sput-object v10, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_SCREEN_NOT_SUPPORT:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 112
    .line 113
    new-instance v11, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 114
    .line 115
    const/16 v0, 0xa

    .line 116
    .line 117
    const/16 v12, -0xa

    .line 118
    .line 119
    const-string v13, "RETURN_STATUS_NOT_SUPPORT"

    .line 120
    .line 121
    invoke-direct {v11, v13, v0, v12}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 122
    .line 123
    .line 124
    sput-object v11, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NOT_SUPPORT:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 125
    .line 126
    new-instance v12, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 127
    .line 128
    const/16 v0, 0xb

    .line 129
    .line 130
    const/16 v13, -0xb

    .line 131
    .line 132
    const-string v14, "RETURN_STATUS_RESOURCE_OVERFLOW"

    .line 133
    .line 134
    invoke-direct {v12, v14, v0, v13}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 135
    .line 136
    .line 137
    sput-object v12, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_RESOURCE_OVERFLOW:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 138
    .line 139
    new-instance v13, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 140
    .line 141
    const/16 v0, 0xc

    .line 142
    .line 143
    const/16 v14, -0xc

    .line 144
    .line 145
    const-string v15, "RETURN_STATUS_VIDEO_NOT_SUPPORT"

    .line 146
    .line 147
    invoke-direct {v13, v15, v0, v14}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 148
    .line 149
    .line 150
    sput-object v13, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_VIDEO_NOT_SUPPORT:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 151
    .line 152
    new-instance v14, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 153
    .line 154
    const/16 v0, 0xd

    .line 155
    .line 156
    const/16 v15, -0x65

    .line 157
    .line 158
    move-object/from16 v16, v1

    .line 159
    .line 160
    const-string v1, "RETURN_STATUS_AUDIO_NO_FRAME"

    .line 161
    .line 162
    invoke-direct {v14, v1, v0, v15}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 163
    .line 164
    .line 165
    sput-object v14, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_AUDIO_NO_FRAME:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 166
    .line 167
    new-instance v15, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 168
    .line 169
    const/16 v0, 0xe

    .line 170
    .line 171
    const/16 v1, -0x66

    .line 172
    .line 173
    move-object/from16 v17, v2

    .line 174
    .line 175
    const-string v2, "RETURN_STATUS_AUDIO_NOT_IMPLEMENTED"

    .line 176
    .line 177
    invoke-direct {v15, v2, v0, v1}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 178
    .line 179
    .line 180
    sput-object v15, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_AUDIO_NOT_IMPLEMENTED:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 181
    .line 182
    new-instance v0, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 183
    .line 184
    const/16 v1, 0xf

    .line 185
    .line 186
    const/16 v2, -0x67

    .line 187
    .line 188
    move-object/from16 v18, v3

    .line 189
    .line 190
    const-string v3, "RETURN_STATUS_AUDIO_NO_PERMISSION"

    .line 191
    .line 192
    invoke-direct {v0, v3, v1, v2}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 193
    .line 194
    .line 195
    sput-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_AUDIO_NO_PERMISSION:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 196
    .line 197
    new-instance v1, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 198
    .line 199
    const/16 v2, 0x10

    .line 200
    .line 201
    const/16 v3, -0x68

    .line 202
    .line 203
    move-object/from16 v19, v0

    .line 204
    .line 205
    const-string v0, "RETURN_STATUS_AUDIO_DEVICE_NOT_EXISTS"

    .line 206
    .line 207
    invoke-direct {v1, v0, v2, v3}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 208
    .line 209
    .line 210
    sput-object v1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_AUDIO_DEVICE_NOT_EXISTS:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 211
    .line 212
    new-instance v0, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 213
    .line 214
    const/16 v2, 0x11

    .line 215
    .line 216
    const/16 v3, -0x69

    .line 217
    .line 218
    move-object/from16 v20, v1

    .line 219
    .line 220
    const-string v1, "RETURN_STATUS_AUDIO_DEVICE_FORMAT_NOT_SUPPORT"

    .line 221
    .line 222
    invoke-direct {v0, v1, v2, v3}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 223
    .line 224
    .line 225
    sput-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_AUDIO_DEVICE_FORMAT_NOT_SUPPORT:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 226
    .line 227
    new-instance v1, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 228
    .line 229
    const/16 v2, 0x12

    .line 230
    .line 231
    const/16 v3, -0x6a

    .line 232
    .line 233
    move-object/from16 v21, v0

    .line 234
    .line 235
    const-string v0, "RETURN_STATUS_AUDIO_DEVICE_NO_DEVICE"

    .line 236
    .line 237
    invoke-direct {v1, v0, v2, v3}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 238
    .line 239
    .line 240
    sput-object v1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_AUDIO_DEVICE_NO_DEVICE:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 241
    .line 242
    new-instance v0, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 243
    .line 244
    const/16 v2, 0x13

    .line 245
    .line 246
    const/16 v3, -0x6b

    .line 247
    .line 248
    move-object/from16 v22, v1

    .line 249
    .line 250
    const-string v1, "RETURN_STATUS_AUDIO_DEVICE_CAN_NOT_USE"

    .line 251
    .line 252
    invoke-direct {v0, v1, v2, v3}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 253
    .line 254
    .line 255
    sput-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_AUDIO_DEVICE_CAN_NOT_USE:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 256
    .line 257
    new-instance v1, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 258
    .line 259
    const/16 v2, 0x14

    .line 260
    .line 261
    const/16 v3, -0x6c

    .line 262
    .line 263
    move-object/from16 v23, v0

    .line 264
    .line 265
    const-string v0, "RETURN_STATUS_AUDIO_DEVICE_INIT_FAILED"

    .line 266
    .line 267
    invoke-direct {v1, v0, v2, v3}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 268
    .line 269
    .line 270
    sput-object v1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_AUDIO_DEVICE_INIT_FAILED:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 271
    .line 272
    new-instance v0, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 273
    .line 274
    const/16 v2, 0x15

    .line 275
    .line 276
    const/16 v3, -0x6d

    .line 277
    .line 278
    move-object/from16 v24, v1

    .line 279
    .line 280
    const-string v1, "RETURN_STATUS_AUDIO_DEVICE_START_FAILED"

    .line 281
    .line 282
    invoke-direct {v0, v1, v2, v3}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 283
    .line 284
    .line 285
    sput-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_AUDIO_DEVICE_START_FAILED:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 286
    .line 287
    new-instance v1, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 288
    .line 289
    const/16 v2, 0x16

    .line 290
    .line 291
    const/16 v3, -0x6e

    .line 292
    .line 293
    move-object/from16 v25, v0

    .line 294
    .line 295
    const-string v0, "RETURN_STATUS_AUDIO_DEVICE_PROCESS_NOT_EXIST"

    .line 296
    .line 297
    invoke-direct {v1, v0, v2, v3}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 298
    .line 299
    .line 300
    sput-object v1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_AUDIO_DEVICE_PROCESS_NOT_EXIST:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 301
    .line 302
    new-instance v0, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 303
    .line 304
    const/16 v2, 0x17

    .line 305
    .line 306
    const/16 v3, -0xc9

    .line 307
    .line 308
    move-object/from16 v26, v1

    .line 309
    .line 310
    const-string v1, "RETURN_STATUS_NATIVE_IN_VALID"

    .line 311
    .line 312
    invoke-direct {v0, v1, v2, v3}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 313
    .line 314
    .line 315
    sput-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 316
    .line 317
    new-instance v1, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 318
    .line 319
    const/16 v2, 0x18

    .line 320
    .line 321
    const/16 v3, -0xca

    .line 322
    .line 323
    move-object/from16 v27, v0

    .line 324
    .line 325
    const-string v0, "RETURN_STATUS_VIDEO_TIMESTAMP_WARNING"

    .line 326
    .line 327
    invoke-direct {v1, v0, v2, v3}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 328
    .line 329
    .line 330
    sput-object v1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_VIDEO_TIMESTAMP_WARNING:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 331
    .line 332
    new-instance v0, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 333
    .line 334
    const/16 v2, 0x19

    .line 335
    .line 336
    const/16 v3, -0x12e

    .line 337
    .line 338
    move-object/from16 v28, v1

    .line 339
    .line 340
    const-string v1, "RETURN_STATUS_AEC_SCENE_WARNING"

    .line 341
    .line 342
    invoke-direct {v0, v1, v2, v3}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 343
    .line 344
    .line 345
    sput-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_AEC_SCENE_WARNING:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 346
    .line 347
    new-instance v1, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 348
    .line 349
    const/16 v2, 0x1a

    .line 350
    .line 351
    const/16 v3, -0x12f

    .line 352
    .line 353
    move-object/from16 v29, v0

    .line 354
    .line 355
    const-string v0, "RETURN_STATUS_AEC_TYPE_WARNING"

    .line 356
    .line 357
    invoke-direct {v1, v0, v2, v3}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 358
    .line 359
    .line 360
    sput-object v1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_AEC_TYPE_WARNING:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 361
    .line 362
    new-instance v0, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 363
    .line 364
    const/16 v2, 0x1b

    .line 365
    .line 366
    const/16 v3, -0x190

    .line 367
    .line 368
    move-object/from16 v30, v1

    .line 369
    .line 370
    const-string v1, "RETURN_STATUS_ROOM_IS_DESTROY"

    .line 371
    .line 372
    invoke-direct {v0, v1, v2, v3}, Lcom/ss/bytertc/engine/data/ReturnStatus;-><init>(Ljava/lang/String;II)V

    .line 373
    .line 374
    .line 375
    sput-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_ROOM_IS_DESTROY:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 376
    .line 377
    move-object/from16 v1, v16

    .line 378
    .line 379
    move-object/from16 v2, v17

    .line 380
    .line 381
    move-object/from16 v3, v18

    .line 382
    .line 383
    move-object/from16 v16, v19

    .line 384
    .line 385
    move-object/from16 v17, v20

    .line 386
    .line 387
    move-object/from16 v18, v21

    .line 388
    .line 389
    move-object/from16 v19, v22

    .line 390
    .line 391
    move-object/from16 v20, v23

    .line 392
    .line 393
    move-object/from16 v21, v24

    .line 394
    .line 395
    move-object/from16 v22, v25

    .line 396
    .line 397
    move-object/from16 v23, v26

    .line 398
    .line 399
    move-object/from16 v24, v27

    .line 400
    .line 401
    move-object/from16 v25, v28

    .line 402
    .line 403
    move-object/from16 v26, v29

    .line 404
    .line 405
    move-object/from16 v27, v30

    .line 406
    .line 407
    move-object/from16 v28, v0

    .line 408
    .line 409
    filled-new-array/range {v1 .. v28}, [Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 410
    .line 411
    .line 412
    move-result-object v0

    .line 413
    sput-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->$VALUES:[Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 414
    .line 415
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
    iput p3, p0, Lcom/ss/bytertc/engine/data/ReturnStatus;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static fromId(I)Lcom/ss/bytertc/engine/data/ReturnStatus;
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {}, Lcom/ss/bytertc/engine/data/ReturnStatus;->values()[Lcom/ss/bytertc/engine/data/ReturnStatus;

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
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    if-ne v4, p0, :cond_0

    .line 16
    .line 17
    return-object v3

    .line 18
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ss/bytertc/engine/data/ReturnStatus;
    .locals 1

    .line 1
    const-class v0, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/ss/bytertc/engine/data/ReturnStatus;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->$VALUES:[Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/ss/bytertc/engine/data/ReturnStatus;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/data/ReturnStatus;->value:I

    .line 2
    .line 3
    return p0
.end method
