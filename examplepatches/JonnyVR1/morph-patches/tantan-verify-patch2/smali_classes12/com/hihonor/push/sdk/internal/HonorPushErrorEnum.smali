.class public final enum Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;",
        ">;"
    }
.end annotation


# static fields
.field public static final ENUM_MAPPER:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;",
            ">;"
        }
    .end annotation
.end field

.field public static final enum ERROR_ARGUMENTS_INVALID:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_BIND_SERVICE:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_CERT_FINGERPRINT_EMPTY:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_HTTP_OPERATION_FREQUENTLY:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_INTERNAL_ERROR:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_MAIN_THREAD:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_NETWORK_NONE:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_NOT_INITIALIZED:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_NOT_SUPPORT_PUSH:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_NO_APPID:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_NO_TOKEN:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_OPERATION_FREQUENTLY:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_PUSH_SERVER:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_SERVICE_ARGUMENTS_INVALID:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_SERVICE_DISABLED:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_SERVICE_DISCONNECTED:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_SERVICE_INVALID:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_SERVICE_MISSING:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_SERVICE_NULL_BINDING:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_SERVICE_REQUEST_TIME_OUT:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_SERVICE_TIME_OUT:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_STATEMENT_AGREEMENT:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum ERROR_UNKNOWN:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final enum SUCCESS:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

.field public static final synthetic a:[Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;


# instance fields
.field public message:Ljava/lang/String;

.field public statusCode:I


# direct methods
.method public static constructor <clinit>()V
    .locals 29

    .line 1
    new-instance v1, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 2
    .line 3
    const-string v0, "success"

    .line 4
    .line 5
    const-string v2, "SUCCESS"

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-direct {v1, v2, v3, v3, v0}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v1, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->SUCCESS:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 12
    .line 13
    new-instance v2, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 14
    .line 15
    const v0, 0x7a15e8

    .line 16
    .line 17
    .line 18
    const-string v4, "device is not support push."

    .line 19
    .line 20
    const-string v5, "ERROR_NOT_SUPPORT_PUSH"

    .line 21
    .line 22
    const/4 v6, 0x1

    .line 23
    invoke-direct {v2, v5, v6, v0, v4}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sput-object v2, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_NOT_SUPPORT_PUSH:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 27
    .line 28
    move v0, v3

    .line 29
    new-instance v3, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 30
    .line 31
    const v4, 0x7a15e9

    .line 32
    .line 33
    .line 34
    const-string v5, "operation in MAIN thread prohibited."

    .line 35
    .line 36
    const-string v6, "ERROR_MAIN_THREAD"

    .line 37
    .line 38
    const/4 v7, 0x2

    .line 39
    invoke-direct {v3, v6, v7, v4, v5}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    sput-object v3, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_MAIN_THREAD:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 43
    .line 44
    new-instance v4, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 45
    .line 46
    const v5, 0x7a15ec

    .line 47
    .line 48
    .line 49
    const-string v6, "token missing."

    .line 50
    .line 51
    const-string v7, "ERROR_NO_TOKEN"

    .line 52
    .line 53
    const/4 v8, 0x3

    .line 54
    invoke-direct {v4, v7, v8, v5, v6}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    sput-object v4, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_NO_TOKEN:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 58
    .line 59
    new-instance v5, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 60
    .line 61
    const v6, 0x7a15ea

    .line 62
    .line 63
    .line 64
    const-string v7, "app id missing."

    .line 65
    .line 66
    const-string v8, "ERROR_NO_APPID"

    .line 67
    .line 68
    const/4 v9, 0x4

    .line 69
    invoke-direct {v5, v8, v9, v6, v7}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 70
    .line 71
    .line 72
    sput-object v5, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_NO_APPID:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 73
    .line 74
    new-instance v6, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 75
    .line 76
    const v7, 0x7a15ed

    .line 77
    .line 78
    .line 79
    const-string v8, "SDK not initialized"

    .line 80
    .line 81
    const-string v9, "ERROR_NOT_INITIALIZED"

    .line 82
    .line 83
    const/4 v10, 0x5

    .line 84
    invoke-direct {v6, v9, v10, v7, v8}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 85
    .line 86
    .line 87
    sput-object v6, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_NOT_INITIALIZED:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 88
    .line 89
    new-instance v7, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 90
    .line 91
    const v8, 0x7a15eb

    .line 92
    .line 93
    .line 94
    const-string v9, "certificate fingerprint empty."

    .line 95
    .line 96
    const-string v10, "ERROR_CERT_FINGERPRINT_EMPTY"

    .line 97
    .line 98
    const/4 v11, 0x6

    .line 99
    invoke-direct {v7, v10, v11, v8, v9}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 100
    .line 101
    .line 102
    sput-object v7, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_CERT_FINGERPRINT_EMPTY:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 103
    .line 104
    new-instance v8, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 105
    .line 106
    const v9, 0x7a19d1

    .line 107
    .line 108
    .line 109
    const-string v10, "bind service failed."

    .line 110
    .line 111
    const-string v11, "ERROR_BIND_SERVICE"

    .line 112
    .line 113
    const/4 v12, 0x7

    .line 114
    invoke-direct {v8, v11, v12, v9, v10}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 115
    .line 116
    .line 117
    sput-object v8, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_BIND_SERVICE:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 118
    .line 119
    new-instance v9, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 120
    .line 121
    const v10, 0x7a19d2

    .line 122
    .line 123
    .line 124
    const-string v11, "service disconnected."

    .line 125
    .line 126
    const-string v12, "ERROR_SERVICE_DISCONNECTED"

    .line 127
    .line 128
    const/16 v13, 0x8

    .line 129
    .line 130
    invoke-direct {v9, v12, v13, v10, v11}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 131
    .line 132
    .line 133
    sput-object v9, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_SERVICE_DISCONNECTED:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 134
    .line 135
    new-instance v10, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 136
    .line 137
    const v11, 0x7a19d3

    .line 138
    .line 139
    .line 140
    const-string v12, "service connect time out."

    .line 141
    .line 142
    const-string v13, "ERROR_SERVICE_TIME_OUT"

    .line 143
    .line 144
    const/16 v14, 0x9

    .line 145
    .line 146
    invoke-direct {v10, v13, v14, v11, v12}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 147
    .line 148
    .line 149
    sput-object v10, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_SERVICE_TIME_OUT:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 150
    .line 151
    new-instance v11, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 152
    .line 153
    const v12, 0x7a19d4

    .line 154
    .line 155
    .line 156
    const-string v13, "service arguments invalid."

    .line 157
    .line 158
    const-string v14, "ERROR_SERVICE_ARGUMENTS_INVALID"

    .line 159
    .line 160
    const/16 v15, 0xa

    .line 161
    .line 162
    invoke-direct {v11, v14, v15, v12, v13}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 163
    .line 164
    .line 165
    sput-object v11, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_SERVICE_ARGUMENTS_INVALID:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 166
    .line 167
    new-instance v12, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 168
    .line 169
    const v13, 0x7a19d5

    .line 170
    .line 171
    .line 172
    const-string v14, "service being bound has return null."

    .line 173
    .line 174
    const-string v15, "ERROR_SERVICE_NULL_BINDING"

    .line 175
    .line 176
    const/16 v0, 0xb

    .line 177
    .line 178
    invoke-direct {v12, v15, v0, v13, v14}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 179
    .line 180
    .line 181
    sput-object v12, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_SERVICE_NULL_BINDING:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 182
    .line 183
    new-instance v13, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 184
    .line 185
    const v0, 0x7a19d6

    .line 186
    .line 187
    .line 188
    const-string v14, "service invalid."

    .line 189
    .line 190
    const-string v15, "ERROR_SERVICE_INVALID"

    .line 191
    .line 192
    move-object/from16 v17, v1

    .line 193
    .line 194
    const/16 v1, 0xc

    .line 195
    .line 196
    invoke-direct {v13, v15, v1, v0, v14}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 197
    .line 198
    .line 199
    sput-object v13, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_SERVICE_INVALID:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 200
    .line 201
    new-instance v14, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 202
    .line 203
    const v0, 0x7a19d7

    .line 204
    .line 205
    .line 206
    const-string v1, "service disabled."

    .line 207
    .line 208
    const-string v15, "ERROR_SERVICE_DISABLED"

    .line 209
    .line 210
    move-object/from16 v18, v2

    .line 211
    .line 212
    const/16 v2, 0xd

    .line 213
    .line 214
    invoke-direct {v14, v15, v2, v0, v1}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 215
    .line 216
    .line 217
    sput-object v14, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_SERVICE_DISABLED:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 218
    .line 219
    new-instance v15, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 220
    .line 221
    const v0, 0x7a19d8

    .line 222
    .line 223
    .line 224
    const-string v1, "service missing."

    .line 225
    .line 226
    const-string v2, "ERROR_SERVICE_MISSING"

    .line 227
    .line 228
    move-object/from16 v19, v3

    .line 229
    .line 230
    const/16 v3, 0xe

    .line 231
    .line 232
    invoke-direct {v15, v2, v3, v0, v1}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 233
    .line 234
    .line 235
    sput-object v15, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_SERVICE_MISSING:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 236
    .line 237
    new-instance v0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 238
    .line 239
    const v1, 0x7a1db9

    .line 240
    .line 241
    .line 242
    const-string v2, "push server error."

    .line 243
    .line 244
    const-string v3, "ERROR_PUSH_SERVER"

    .line 245
    .line 246
    move-object/from16 v20, v4

    .line 247
    .line 248
    const/16 v4, 0xf

    .line 249
    .line 250
    invoke-direct {v0, v3, v4, v1, v2}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 251
    .line 252
    .line 253
    sput-object v0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_PUSH_SERVER:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 254
    .line 255
    new-instance v1, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 256
    .line 257
    const v2, 0x7a1dba

    .line 258
    .line 259
    .line 260
    const-string v3, "unknown error."

    .line 261
    .line 262
    const-string v4, "ERROR_UNKNOWN"

    .line 263
    .line 264
    move-object/from16 v21, v0

    .line 265
    .line 266
    const/16 v0, 0x10

    .line 267
    .line 268
    invoke-direct {v1, v4, v0, v2, v3}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 269
    .line 270
    .line 271
    sput-object v1, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_UNKNOWN:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 272
    .line 273
    new-instance v0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 274
    .line 275
    const v2, 0x7a1dbb

    .line 276
    .line 277
    .line 278
    const-string v3, "internal error."

    .line 279
    .line 280
    const-string v4, "ERROR_INTERNAL_ERROR"

    .line 281
    .line 282
    move-object/from16 v22, v1

    .line 283
    .line 284
    const/16 v1, 0x11

    .line 285
    .line 286
    invoke-direct {v0, v4, v1, v2, v3}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 287
    .line 288
    .line 289
    sput-object v0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_INTERNAL_ERROR:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 290
    .line 291
    new-instance v1, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 292
    .line 293
    const v2, 0x7a1dbc

    .line 294
    .line 295
    .line 296
    const-string v3, "arguments invalid."

    .line 297
    .line 298
    const-string v4, "ERROR_ARGUMENTS_INVALID"

    .line 299
    .line 300
    move-object/from16 v23, v0

    .line 301
    .line 302
    const/16 v0, 0x12

    .line 303
    .line 304
    invoke-direct {v1, v4, v0, v2, v3}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 305
    .line 306
    .line 307
    sput-object v1, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_ARGUMENTS_INVALID:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 308
    .line 309
    new-instance v0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 310
    .line 311
    const v2, 0x7a1dbd

    .line 312
    .line 313
    .line 314
    const-string v3, "operation too frequently."

    .line 315
    .line 316
    const-string v4, "ERROR_OPERATION_FREQUENTLY"

    .line 317
    .line 318
    move-object/from16 v24, v1

    .line 319
    .line 320
    const/16 v1, 0x13

    .line 321
    .line 322
    invoke-direct {v0, v4, v1, v2, v3}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 323
    .line 324
    .line 325
    sput-object v0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_OPERATION_FREQUENTLY:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 326
    .line 327
    new-instance v1, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 328
    .line 329
    const v2, 0x7a1dbe

    .line 330
    .line 331
    .line 332
    const-string v3, "no network."

    .line 333
    .line 334
    const-string v4, "ERROR_NETWORK_NONE"

    .line 335
    .line 336
    move-object/from16 v25, v0

    .line 337
    .line 338
    const/16 v0, 0x14

    .line 339
    .line 340
    invoke-direct {v1, v4, v0, v2, v3}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 341
    .line 342
    .line 343
    sput-object v1, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_NETWORK_NONE:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 344
    .line 345
    new-instance v0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 346
    .line 347
    const v2, 0x7a1dbf

    .line 348
    .line 349
    .line 350
    const-string v3, "not statement agreement."

    .line 351
    .line 352
    const-string v4, "ERROR_STATEMENT_AGREEMENT"

    .line 353
    .line 354
    move-object/from16 v26, v1

    .line 355
    .line 356
    const/16 v1, 0x15

    .line 357
    .line 358
    invoke-direct {v0, v4, v1, v2, v3}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 359
    .line 360
    .line 361
    sput-object v0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_STATEMENT_AGREEMENT:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 362
    .line 363
    new-instance v1, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 364
    .line 365
    const v2, 0x7a1dc0

    .line 366
    .line 367
    .line 368
    const-string v3, "service request time out."

    .line 369
    .line 370
    const-string v4, "ERROR_SERVICE_REQUEST_TIME_OUT"

    .line 371
    .line 372
    move-object/from16 v27, v0

    .line 373
    .line 374
    const/16 v0, 0x16

    .line 375
    .line 376
    invoke-direct {v1, v4, v0, v2, v3}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 377
    .line 378
    .line 379
    sput-object v1, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_SERVICE_REQUEST_TIME_OUT:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 380
    .line 381
    new-instance v0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 382
    .line 383
    const/16 v2, 0x27e6

    .line 384
    .line 385
    const-string v3, "http operation too frequently."

    .line 386
    .line 387
    const-string v4, "ERROR_HTTP_OPERATION_FREQUENTLY"

    .line 388
    .line 389
    move-object/from16 v28, v1

    .line 390
    .line 391
    const/16 v1, 0x17

    .line 392
    .line 393
    invoke-direct {v0, v4, v1, v2, v3}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 394
    .line 395
    .line 396
    sput-object v0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_HTTP_OPERATION_FREQUENTLY:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 397
    .line 398
    move-object/from16 v1, v17

    .line 399
    .line 400
    move-object/from16 v2, v18

    .line 401
    .line 402
    move-object/from16 v3, v19

    .line 403
    .line 404
    move-object/from16 v4, v20

    .line 405
    .line 406
    move-object/from16 v16, v21

    .line 407
    .line 408
    move-object/from16 v17, v22

    .line 409
    .line 410
    move-object/from16 v18, v23

    .line 411
    .line 412
    move-object/from16 v19, v24

    .line 413
    .line 414
    move-object/from16 v20, v25

    .line 415
    .line 416
    move-object/from16 v21, v26

    .line 417
    .line 418
    move-object/from16 v22, v27

    .line 419
    .line 420
    move-object/from16 v23, v28

    .line 421
    .line 422
    move-object/from16 v24, v0

    .line 423
    .line 424
    const/4 v0, 0x0

    .line 425
    filled-new-array/range {v1 .. v24}, [Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 426
    .line 427
    .line 428
    move-result-object v1

    .line 429
    sput-object v1, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->a:[Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 430
    .line 431
    new-instance v1, Landroid/util/SparseArray;

    .line 432
    .line 433
    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    .line 434
    .line 435
    .line 436
    sput-object v1, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ENUM_MAPPER:Landroid/util/SparseArray;

    .line 437
    .line 438
    invoke-static {}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->values()[Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 439
    .line 440
    .line 441
    move-result-object v1

    .line 442
    move v3, v0

    .line 443
    :goto_0
    const/16 v0, 0x18

    .line 444
    .line 445
    if-ge v3, v0, :cond_0

    .line 446
    .line 447
    aget-object v0, v1, v3

    .line 448
    .line 449
    sget-object v2, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ENUM_MAPPER:Landroid/util/SparseArray;

    .line 450
    .line 451
    iget v4, v0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->statusCode:I

    .line 452
    .line 453
    invoke-virtual {v2, v4, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 454
    .line 455
    .line 456
    add-int/lit8 v3, v3, 0x1

    .line 457
    .line 458
    goto :goto_0

    .line 459
    :cond_0
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->statusCode:I

    .line 5
    .line 6
    iput-object p4, p0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->message:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static fromCode(I)Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;
    .locals 2

    .line 1
    sget-object v0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ENUM_MAPPER:Landroid/util/SparseArray;

    .line 2
    .line 3
    sget-object v1, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_UNKNOWN:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 4
    .line 5
    invoke-virtual {v0, p0, v1}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 10
    .line 11
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;
    .locals 1

    .line 1
    const-class v0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;
    .locals 1

    .line 1
    sget-object v0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->a:[Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getErrorCode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->statusCode:I

    .line 2
    .line 3
    return p0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->message:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public toApiException()Lcom/hihonor/push/sdk/common/data/ApiException;
    .locals 2

    .line 1
    new-instance v0, Lcom/hihonor/push/sdk/common/data/ApiException;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->getErrorCode()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p0}, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->getMessage()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-direct {v0, v1, p0}, Lcom/hihonor/push/sdk/common/data/ApiException;-><init>(ILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method
