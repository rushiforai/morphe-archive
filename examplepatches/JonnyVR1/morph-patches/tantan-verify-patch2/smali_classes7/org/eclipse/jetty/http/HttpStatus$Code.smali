.class public final enum Lorg/eclipse/jetty/http/HttpStatus$Code;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/http/HttpStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Code"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/eclipse/jetty/http/HttpStatus$Code;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum ACCEPTED:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum BAD_GATEWAY:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum BAD_REQUEST:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum CONFLICT:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum CONTINUE:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum CREATED:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum EXPECTATION_FAILED:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum FAILED_DEPENDENCY:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum FORBIDDEN:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum FOUND:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum GATEWAY_TIMEOUT:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum GONE:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum HTTP_VERSION_NOT_SUPPORTED:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum INSUFFICIENT_STORAGE:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum INTERNAL_SERVER_ERROR:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum LENGTH_REQUIRED:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum LOCKED:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum METHOD_NOT_ALLOWED:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum MOVED_PERMANENTLY:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum MOVED_TEMPORARILY:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum MULTIPLE_CHOICES:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum MULTI_STATUS:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum NON_AUTHORITATIVE_INFORMATION:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum NOT_ACCEPTABLE:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum NOT_FOUND:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum NOT_IMPLEMENTED:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum NOT_MODIFIED:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum NO_CONTENT:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum OK:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum PARTIAL_CONTENT:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum PAYMENT_REQUIRED:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum PRECONDITION_FAILED:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum PROCESSING:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum PROXY_AUTHENTICATION_REQUIRED:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum REQUESTED_RANGE_NOT_SATISFIABLE:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum REQUEST_ENTITY_TOO_LARGE:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum REQUEST_TIMEOUT:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum REQUEST_URI_TOO_LONG:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum RESET_CONTENT:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum SEE_OTHER:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum SERVICE_UNAVAILABLE:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum SWITCHING_PROTOCOLS:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum TEMPORARY_REDIRECT:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum UNAUTHORIZED:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum UNPROCESSABLE_ENTITY:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum UNSUPPORTED_MEDIA_TYPE:Lorg/eclipse/jetty/http/HttpStatus$Code;

.field public static final enum USE_PROXY:Lorg/eclipse/jetty/http/HttpStatus$Code;


# instance fields
.field private final _code:I

.field private final _message:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 51

    .line 1
    new-instance v1, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 2
    .line 3
    const/16 v0, 0x64

    .line 4
    .line 5
    const-string v2, "Continue"

    .line 6
    .line 7
    const-string v3, "CONTINUE"

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    invoke-direct {v1, v3, v4, v0, v2}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lorg/eclipse/jetty/http/HttpStatus$Code;->CONTINUE:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 14
    .line 15
    new-instance v2, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 16
    .line 17
    const/16 v0, 0x65

    .line 18
    .line 19
    const-string v3, "Switching Protocols"

    .line 20
    .line 21
    const-string v4, "SWITCHING_PROTOCOLS"

    .line 22
    .line 23
    const/4 v5, 0x1

    .line 24
    invoke-direct {v2, v4, v5, v0, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sput-object v2, Lorg/eclipse/jetty/http/HttpStatus$Code;->SWITCHING_PROTOCOLS:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 28
    .line 29
    new-instance v3, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 30
    .line 31
    const/16 v0, 0x66

    .line 32
    .line 33
    const-string v4, "Processing"

    .line 34
    .line 35
    const-string v5, "PROCESSING"

    .line 36
    .line 37
    const/4 v6, 0x2

    .line 38
    invoke-direct {v3, v5, v6, v0, v4}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    sput-object v3, Lorg/eclipse/jetty/http/HttpStatus$Code;->PROCESSING:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 42
    .line 43
    new-instance v4, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 44
    .line 45
    const/4 v0, 0x3

    .line 46
    const/16 v5, 0xc8

    .line 47
    .line 48
    const-string v6, "OK"

    .line 49
    .line 50
    invoke-direct {v4, v6, v0, v5, v6}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    sput-object v4, Lorg/eclipse/jetty/http/HttpStatus$Code;->OK:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 54
    .line 55
    new-instance v5, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 56
    .line 57
    const/16 v0, 0xc9

    .line 58
    .line 59
    const-string v6, "Created"

    .line 60
    .line 61
    const-string v7, "CREATED"

    .line 62
    .line 63
    const/4 v8, 0x4

    .line 64
    invoke-direct {v5, v7, v8, v0, v6}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 65
    .line 66
    .line 67
    sput-object v5, Lorg/eclipse/jetty/http/HttpStatus$Code;->CREATED:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 68
    .line 69
    new-instance v6, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 70
    .line 71
    const/16 v0, 0xca

    .line 72
    .line 73
    const-string v7, "Accepted"

    .line 74
    .line 75
    const-string v8, "ACCEPTED"

    .line 76
    .line 77
    const/4 v9, 0x5

    .line 78
    invoke-direct {v6, v8, v9, v0, v7}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    sput-object v6, Lorg/eclipse/jetty/http/HttpStatus$Code;->ACCEPTED:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 82
    .line 83
    new-instance v7, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 84
    .line 85
    const/16 v0, 0xcb

    .line 86
    .line 87
    const-string v8, "Non Authoritative Information"

    .line 88
    .line 89
    const-string v9, "NON_AUTHORITATIVE_INFORMATION"

    .line 90
    .line 91
    const/4 v10, 0x6

    .line 92
    invoke-direct {v7, v9, v10, v0, v8}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 93
    .line 94
    .line 95
    sput-object v7, Lorg/eclipse/jetty/http/HttpStatus$Code;->NON_AUTHORITATIVE_INFORMATION:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 96
    .line 97
    new-instance v8, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 98
    .line 99
    const/16 v0, 0xcc

    .line 100
    .line 101
    const-string v9, "No Content"

    .line 102
    .line 103
    const-string v10, "NO_CONTENT"

    .line 104
    .line 105
    const/4 v11, 0x7

    .line 106
    invoke-direct {v8, v10, v11, v0, v9}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 107
    .line 108
    .line 109
    sput-object v8, Lorg/eclipse/jetty/http/HttpStatus$Code;->NO_CONTENT:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 110
    .line 111
    new-instance v9, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 112
    .line 113
    const/16 v0, 0xcd

    .line 114
    .line 115
    const-string v10, "Reset Content"

    .line 116
    .line 117
    const-string v11, "RESET_CONTENT"

    .line 118
    .line 119
    const/16 v12, 0x8

    .line 120
    .line 121
    invoke-direct {v9, v11, v12, v0, v10}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 122
    .line 123
    .line 124
    sput-object v9, Lorg/eclipse/jetty/http/HttpStatus$Code;->RESET_CONTENT:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 125
    .line 126
    new-instance v10, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 127
    .line 128
    const/16 v0, 0xce

    .line 129
    .line 130
    const-string v11, "Partial Content"

    .line 131
    .line 132
    const-string v12, "PARTIAL_CONTENT"

    .line 133
    .line 134
    const/16 v13, 0x9

    .line 135
    .line 136
    invoke-direct {v10, v12, v13, v0, v11}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 137
    .line 138
    .line 139
    sput-object v10, Lorg/eclipse/jetty/http/HttpStatus$Code;->PARTIAL_CONTENT:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 140
    .line 141
    new-instance v11, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 142
    .line 143
    const/16 v0, 0xcf

    .line 144
    .line 145
    const-string v12, "Multi-Status"

    .line 146
    .line 147
    const-string v13, "MULTI_STATUS"

    .line 148
    .line 149
    const/16 v14, 0xa

    .line 150
    .line 151
    invoke-direct {v11, v13, v14, v0, v12}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 152
    .line 153
    .line 154
    sput-object v11, Lorg/eclipse/jetty/http/HttpStatus$Code;->MULTI_STATUS:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 155
    .line 156
    new-instance v12, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 157
    .line 158
    const/16 v0, 0x12c

    .line 159
    .line 160
    const-string v13, "Multiple Choices"

    .line 161
    .line 162
    const-string v14, "MULTIPLE_CHOICES"

    .line 163
    .line 164
    const/16 v15, 0xb

    .line 165
    .line 166
    invoke-direct {v12, v14, v15, v0, v13}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 167
    .line 168
    .line 169
    sput-object v12, Lorg/eclipse/jetty/http/HttpStatus$Code;->MULTIPLE_CHOICES:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 170
    .line 171
    new-instance v13, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 172
    .line 173
    const/16 v0, 0x12d

    .line 174
    .line 175
    const-string v14, "Moved Permanently"

    .line 176
    .line 177
    const-string v15, "MOVED_PERMANENTLY"

    .line 178
    .line 179
    move-object/from16 v16, v1

    .line 180
    .line 181
    const/16 v1, 0xc

    .line 182
    .line 183
    invoke-direct {v13, v15, v1, v0, v14}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 184
    .line 185
    .line 186
    sput-object v13, Lorg/eclipse/jetty/http/HttpStatus$Code;->MOVED_PERMANENTLY:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 187
    .line 188
    new-instance v14, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 189
    .line 190
    const-string v0, "Moved Temporarily"

    .line 191
    .line 192
    const-string v1, "MOVED_TEMPORARILY"

    .line 193
    .line 194
    const/16 v15, 0xd

    .line 195
    .line 196
    move-object/from16 v17, v2

    .line 197
    .line 198
    const/16 v2, 0x12e

    .line 199
    .line 200
    invoke-direct {v14, v1, v15, v2, v0}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 201
    .line 202
    .line 203
    sput-object v14, Lorg/eclipse/jetty/http/HttpStatus$Code;->MOVED_TEMPORARILY:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 204
    .line 205
    new-instance v15, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 206
    .line 207
    const/16 v0, 0xe

    .line 208
    .line 209
    const-string v1, "Found"

    .line 210
    .line 211
    move-object/from16 v18, v3

    .line 212
    .line 213
    const-string v3, "FOUND"

    .line 214
    .line 215
    invoke-direct {v15, v3, v0, v2, v1}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 216
    .line 217
    .line 218
    sput-object v15, Lorg/eclipse/jetty/http/HttpStatus$Code;->FOUND:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 219
    .line 220
    new-instance v0, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 221
    .line 222
    const/16 v1, 0x12f

    .line 223
    .line 224
    const-string v2, "See Other"

    .line 225
    .line 226
    const-string v3, "SEE_OTHER"

    .line 227
    .line 228
    move-object/from16 v19, v4

    .line 229
    .line 230
    const/16 v4, 0xf

    .line 231
    .line 232
    invoke-direct {v0, v3, v4, v1, v2}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 233
    .line 234
    .line 235
    sput-object v0, Lorg/eclipse/jetty/http/HttpStatus$Code;->SEE_OTHER:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 236
    .line 237
    new-instance v1, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 238
    .line 239
    const/16 v2, 0x130

    .line 240
    .line 241
    const-string v3, "Not Modified"

    .line 242
    .line 243
    const-string v4, "NOT_MODIFIED"

    .line 244
    .line 245
    move-object/from16 v20, v0

    .line 246
    .line 247
    const/16 v0, 0x10

    .line 248
    .line 249
    invoke-direct {v1, v4, v0, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 250
    .line 251
    .line 252
    sput-object v1, Lorg/eclipse/jetty/http/HttpStatus$Code;->NOT_MODIFIED:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 253
    .line 254
    new-instance v0, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 255
    .line 256
    const/16 v2, 0x131

    .line 257
    .line 258
    const-string v3, "Use Proxy"

    .line 259
    .line 260
    const-string v4, "USE_PROXY"

    .line 261
    .line 262
    move-object/from16 v21, v1

    .line 263
    .line 264
    const/16 v1, 0x11

    .line 265
    .line 266
    invoke-direct {v0, v4, v1, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 267
    .line 268
    .line 269
    sput-object v0, Lorg/eclipse/jetty/http/HttpStatus$Code;->USE_PROXY:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 270
    .line 271
    new-instance v1, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 272
    .line 273
    const/16 v2, 0x133

    .line 274
    .line 275
    const-string v3, "Temporary Redirect"

    .line 276
    .line 277
    const-string v4, "TEMPORARY_REDIRECT"

    .line 278
    .line 279
    move-object/from16 v22, v0

    .line 280
    .line 281
    const/16 v0, 0x12

    .line 282
    .line 283
    invoke-direct {v1, v4, v0, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 284
    .line 285
    .line 286
    sput-object v1, Lorg/eclipse/jetty/http/HttpStatus$Code;->TEMPORARY_REDIRECT:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 287
    .line 288
    new-instance v0, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 289
    .line 290
    const/16 v2, 0x190

    .line 291
    .line 292
    const-string v3, "Bad Request"

    .line 293
    .line 294
    const-string v4, "BAD_REQUEST"

    .line 295
    .line 296
    move-object/from16 v23, v1

    .line 297
    .line 298
    const/16 v1, 0x13

    .line 299
    .line 300
    invoke-direct {v0, v4, v1, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 301
    .line 302
    .line 303
    sput-object v0, Lorg/eclipse/jetty/http/HttpStatus$Code;->BAD_REQUEST:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 304
    .line 305
    new-instance v1, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 306
    .line 307
    const/16 v2, 0x191

    .line 308
    .line 309
    const-string v3, "Unauthorized"

    .line 310
    .line 311
    const-string v4, "UNAUTHORIZED"

    .line 312
    .line 313
    move-object/from16 v24, v0

    .line 314
    .line 315
    const/16 v0, 0x14

    .line 316
    .line 317
    invoke-direct {v1, v4, v0, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 318
    .line 319
    .line 320
    sput-object v1, Lorg/eclipse/jetty/http/HttpStatus$Code;->UNAUTHORIZED:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 321
    .line 322
    new-instance v0, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 323
    .line 324
    const/16 v2, 0x192

    .line 325
    .line 326
    const-string v3, "Payment Required"

    .line 327
    .line 328
    const-string v4, "PAYMENT_REQUIRED"

    .line 329
    .line 330
    move-object/from16 v25, v1

    .line 331
    .line 332
    const/16 v1, 0x15

    .line 333
    .line 334
    invoke-direct {v0, v4, v1, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 335
    .line 336
    .line 337
    sput-object v0, Lorg/eclipse/jetty/http/HttpStatus$Code;->PAYMENT_REQUIRED:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 338
    .line 339
    new-instance v1, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 340
    .line 341
    const/16 v2, 0x193

    .line 342
    .line 343
    const-string v3, "Forbidden"

    .line 344
    .line 345
    const-string v4, "FORBIDDEN"

    .line 346
    .line 347
    move-object/from16 v26, v0

    .line 348
    .line 349
    const/16 v0, 0x16

    .line 350
    .line 351
    invoke-direct {v1, v4, v0, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 352
    .line 353
    .line 354
    sput-object v1, Lorg/eclipse/jetty/http/HttpStatus$Code;->FORBIDDEN:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 355
    .line 356
    new-instance v0, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 357
    .line 358
    const/16 v2, 0x194

    .line 359
    .line 360
    const-string v3, "Not Found"

    .line 361
    .line 362
    const-string v4, "NOT_FOUND"

    .line 363
    .line 364
    move-object/from16 v27, v1

    .line 365
    .line 366
    const/16 v1, 0x17

    .line 367
    .line 368
    invoke-direct {v0, v4, v1, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 369
    .line 370
    .line 371
    sput-object v0, Lorg/eclipse/jetty/http/HttpStatus$Code;->NOT_FOUND:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 372
    .line 373
    new-instance v1, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 374
    .line 375
    const/16 v2, 0x195

    .line 376
    .line 377
    const-string v3, "Method Not Allowed"

    .line 378
    .line 379
    const-string v4, "METHOD_NOT_ALLOWED"

    .line 380
    .line 381
    move-object/from16 v28, v0

    .line 382
    .line 383
    const/16 v0, 0x18

    .line 384
    .line 385
    invoke-direct {v1, v4, v0, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 386
    .line 387
    .line 388
    sput-object v1, Lorg/eclipse/jetty/http/HttpStatus$Code;->METHOD_NOT_ALLOWED:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 389
    .line 390
    new-instance v0, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 391
    .line 392
    const/16 v2, 0x196

    .line 393
    .line 394
    const-string v3, "Not Acceptable"

    .line 395
    .line 396
    const-string v4, "NOT_ACCEPTABLE"

    .line 397
    .line 398
    move-object/from16 v29, v1

    .line 399
    .line 400
    const/16 v1, 0x19

    .line 401
    .line 402
    invoke-direct {v0, v4, v1, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 403
    .line 404
    .line 405
    sput-object v0, Lorg/eclipse/jetty/http/HttpStatus$Code;->NOT_ACCEPTABLE:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 406
    .line 407
    new-instance v1, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 408
    .line 409
    const/16 v2, 0x197

    .line 410
    .line 411
    const-string v3, "Proxy Authentication Required"

    .line 412
    .line 413
    const-string v4, "PROXY_AUTHENTICATION_REQUIRED"

    .line 414
    .line 415
    move-object/from16 v30, v0

    .line 416
    .line 417
    const/16 v0, 0x1a

    .line 418
    .line 419
    invoke-direct {v1, v4, v0, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 420
    .line 421
    .line 422
    sput-object v1, Lorg/eclipse/jetty/http/HttpStatus$Code;->PROXY_AUTHENTICATION_REQUIRED:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 423
    .line 424
    new-instance v0, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 425
    .line 426
    const/16 v2, 0x198

    .line 427
    .line 428
    const-string v3, "Request Timeout"

    .line 429
    .line 430
    const-string v4, "REQUEST_TIMEOUT"

    .line 431
    .line 432
    move-object/from16 v31, v1

    .line 433
    .line 434
    const/16 v1, 0x1b

    .line 435
    .line 436
    invoke-direct {v0, v4, v1, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 437
    .line 438
    .line 439
    sput-object v0, Lorg/eclipse/jetty/http/HttpStatus$Code;->REQUEST_TIMEOUT:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 440
    .line 441
    new-instance v1, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 442
    .line 443
    const/16 v2, 0x199

    .line 444
    .line 445
    const-string v3, "Conflict"

    .line 446
    .line 447
    const-string v4, "CONFLICT"

    .line 448
    .line 449
    move-object/from16 v32, v0

    .line 450
    .line 451
    const/16 v0, 0x1c

    .line 452
    .line 453
    invoke-direct {v1, v4, v0, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 454
    .line 455
    .line 456
    sput-object v1, Lorg/eclipse/jetty/http/HttpStatus$Code;->CONFLICT:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 457
    .line 458
    new-instance v0, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 459
    .line 460
    const/16 v2, 0x19a

    .line 461
    .line 462
    const-string v3, "Gone"

    .line 463
    .line 464
    const-string v4, "GONE"

    .line 465
    .line 466
    move-object/from16 v33, v1

    .line 467
    .line 468
    const/16 v1, 0x1d

    .line 469
    .line 470
    invoke-direct {v0, v4, v1, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 471
    .line 472
    .line 473
    sput-object v0, Lorg/eclipse/jetty/http/HttpStatus$Code;->GONE:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 474
    .line 475
    new-instance v1, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 476
    .line 477
    const/16 v2, 0x19b

    .line 478
    .line 479
    const-string v3, "Length Required"

    .line 480
    .line 481
    const-string v4, "LENGTH_REQUIRED"

    .line 482
    .line 483
    move-object/from16 v34, v0

    .line 484
    .line 485
    const/16 v0, 0x1e

    .line 486
    .line 487
    invoke-direct {v1, v4, v0, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 488
    .line 489
    .line 490
    sput-object v1, Lorg/eclipse/jetty/http/HttpStatus$Code;->LENGTH_REQUIRED:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 491
    .line 492
    new-instance v0, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 493
    .line 494
    const/16 v2, 0x19c

    .line 495
    .line 496
    const-string v3, "Precondition Failed"

    .line 497
    .line 498
    const-string v4, "PRECONDITION_FAILED"

    .line 499
    .line 500
    move-object/from16 v35, v1

    .line 501
    .line 502
    const/16 v1, 0x1f

    .line 503
    .line 504
    invoke-direct {v0, v4, v1, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 505
    .line 506
    .line 507
    sput-object v0, Lorg/eclipse/jetty/http/HttpStatus$Code;->PRECONDITION_FAILED:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 508
    .line 509
    new-instance v1, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 510
    .line 511
    const/16 v2, 0x19d

    .line 512
    .line 513
    const-string v3, "Request Entity Too Large"

    .line 514
    .line 515
    const-string v4, "REQUEST_ENTITY_TOO_LARGE"

    .line 516
    .line 517
    move-object/from16 v36, v0

    .line 518
    .line 519
    const/16 v0, 0x20

    .line 520
    .line 521
    invoke-direct {v1, v4, v0, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 522
    .line 523
    .line 524
    sput-object v1, Lorg/eclipse/jetty/http/HttpStatus$Code;->REQUEST_ENTITY_TOO_LARGE:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 525
    .line 526
    new-instance v0, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 527
    .line 528
    const/16 v2, 0x19e

    .line 529
    .line 530
    const-string v3, "Request-URI Too Long"

    .line 531
    .line 532
    const-string v4, "REQUEST_URI_TOO_LONG"

    .line 533
    .line 534
    move-object/from16 v37, v1

    .line 535
    .line 536
    const/16 v1, 0x21

    .line 537
    .line 538
    invoke-direct {v0, v4, v1, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 539
    .line 540
    .line 541
    sput-object v0, Lorg/eclipse/jetty/http/HttpStatus$Code;->REQUEST_URI_TOO_LONG:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 542
    .line 543
    new-instance v1, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 544
    .line 545
    const/16 v2, 0x19f

    .line 546
    .line 547
    const-string v3, "Unsupported Media Type"

    .line 548
    .line 549
    const-string v4, "UNSUPPORTED_MEDIA_TYPE"

    .line 550
    .line 551
    move-object/from16 v38, v0

    .line 552
    .line 553
    const/16 v0, 0x22

    .line 554
    .line 555
    invoke-direct {v1, v4, v0, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 556
    .line 557
    .line 558
    sput-object v1, Lorg/eclipse/jetty/http/HttpStatus$Code;->UNSUPPORTED_MEDIA_TYPE:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 559
    .line 560
    new-instance v0, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 561
    .line 562
    const/16 v2, 0x1a0

    .line 563
    .line 564
    const-string v3, "Requested Range Not Satisfiable"

    .line 565
    .line 566
    const-string v4, "REQUESTED_RANGE_NOT_SATISFIABLE"

    .line 567
    .line 568
    move-object/from16 v39, v1

    .line 569
    .line 570
    const/16 v1, 0x23

    .line 571
    .line 572
    invoke-direct {v0, v4, v1, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 573
    .line 574
    .line 575
    sput-object v0, Lorg/eclipse/jetty/http/HttpStatus$Code;->REQUESTED_RANGE_NOT_SATISFIABLE:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 576
    .line 577
    new-instance v1, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 578
    .line 579
    const/16 v2, 0x1a1

    .line 580
    .line 581
    const-string v3, "Expectation Failed"

    .line 582
    .line 583
    const-string v4, "EXPECTATION_FAILED"

    .line 584
    .line 585
    move-object/from16 v40, v0

    .line 586
    .line 587
    const/16 v0, 0x24

    .line 588
    .line 589
    invoke-direct {v1, v4, v0, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 590
    .line 591
    .line 592
    sput-object v1, Lorg/eclipse/jetty/http/HttpStatus$Code;->EXPECTATION_FAILED:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 593
    .line 594
    new-instance v0, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 595
    .line 596
    const/16 v2, 0x1a6

    .line 597
    .line 598
    const-string v3, "Unprocessable Entity"

    .line 599
    .line 600
    const-string v4, "UNPROCESSABLE_ENTITY"

    .line 601
    .line 602
    move-object/from16 v41, v1

    .line 603
    .line 604
    const/16 v1, 0x25

    .line 605
    .line 606
    invoke-direct {v0, v4, v1, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 607
    .line 608
    .line 609
    sput-object v0, Lorg/eclipse/jetty/http/HttpStatus$Code;->UNPROCESSABLE_ENTITY:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 610
    .line 611
    new-instance v1, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 612
    .line 613
    const/16 v2, 0x1a7

    .line 614
    .line 615
    const-string v3, "Locked"

    .line 616
    .line 617
    const-string v4, "LOCKED"

    .line 618
    .line 619
    move-object/from16 v42, v0

    .line 620
    .line 621
    const/16 v0, 0x26

    .line 622
    .line 623
    invoke-direct {v1, v4, v0, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 624
    .line 625
    .line 626
    sput-object v1, Lorg/eclipse/jetty/http/HttpStatus$Code;->LOCKED:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 627
    .line 628
    new-instance v0, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 629
    .line 630
    const/16 v2, 0x1a8

    .line 631
    .line 632
    const-string v3, "Failed Dependency"

    .line 633
    .line 634
    const-string v4, "FAILED_DEPENDENCY"

    .line 635
    .line 636
    move-object/from16 v43, v1

    .line 637
    .line 638
    const/16 v1, 0x27

    .line 639
    .line 640
    invoke-direct {v0, v4, v1, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 641
    .line 642
    .line 643
    sput-object v0, Lorg/eclipse/jetty/http/HttpStatus$Code;->FAILED_DEPENDENCY:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 644
    .line 645
    new-instance v1, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 646
    .line 647
    const/16 v2, 0x1f4

    .line 648
    .line 649
    const-string v3, "Server Error"

    .line 650
    .line 651
    const-string v4, "INTERNAL_SERVER_ERROR"

    .line 652
    .line 653
    move-object/from16 v44, v0

    .line 654
    .line 655
    const/16 v0, 0x28

    .line 656
    .line 657
    invoke-direct {v1, v4, v0, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 658
    .line 659
    .line 660
    sput-object v1, Lorg/eclipse/jetty/http/HttpStatus$Code;->INTERNAL_SERVER_ERROR:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 661
    .line 662
    new-instance v0, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 663
    .line 664
    const/16 v2, 0x1f5

    .line 665
    .line 666
    const-string v3, "Not Implemented"

    .line 667
    .line 668
    const-string v4, "NOT_IMPLEMENTED"

    .line 669
    .line 670
    move-object/from16 v45, v1

    .line 671
    .line 672
    const/16 v1, 0x29

    .line 673
    .line 674
    invoke-direct {v0, v4, v1, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 675
    .line 676
    .line 677
    sput-object v0, Lorg/eclipse/jetty/http/HttpStatus$Code;->NOT_IMPLEMENTED:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 678
    .line 679
    new-instance v1, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 680
    .line 681
    const/16 v2, 0x1f6

    .line 682
    .line 683
    const-string v3, "Bad Gateway"

    .line 684
    .line 685
    const-string v4, "BAD_GATEWAY"

    .line 686
    .line 687
    move-object/from16 v46, v0

    .line 688
    .line 689
    const/16 v0, 0x2a

    .line 690
    .line 691
    invoke-direct {v1, v4, v0, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 692
    .line 693
    .line 694
    sput-object v1, Lorg/eclipse/jetty/http/HttpStatus$Code;->BAD_GATEWAY:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 695
    .line 696
    new-instance v0, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 697
    .line 698
    const/16 v2, 0x1f7

    .line 699
    .line 700
    const-string v3, "Service Unavailable"

    .line 701
    .line 702
    const-string v4, "SERVICE_UNAVAILABLE"

    .line 703
    .line 704
    move-object/from16 v47, v1

    .line 705
    .line 706
    const/16 v1, 0x2b

    .line 707
    .line 708
    invoke-direct {v0, v4, v1, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 709
    .line 710
    .line 711
    sput-object v0, Lorg/eclipse/jetty/http/HttpStatus$Code;->SERVICE_UNAVAILABLE:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 712
    .line 713
    new-instance v1, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 714
    .line 715
    const/16 v2, 0x1f8

    .line 716
    .line 717
    const-string v3, "Gateway Timeout"

    .line 718
    .line 719
    const-string v4, "GATEWAY_TIMEOUT"

    .line 720
    .line 721
    move-object/from16 v48, v0

    .line 722
    .line 723
    const/16 v0, 0x2c

    .line 724
    .line 725
    invoke-direct {v1, v4, v0, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 726
    .line 727
    .line 728
    sput-object v1, Lorg/eclipse/jetty/http/HttpStatus$Code;->GATEWAY_TIMEOUT:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 729
    .line 730
    new-instance v0, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 731
    .line 732
    const/16 v2, 0x1f9

    .line 733
    .line 734
    const-string v3, "HTTP Version Not Supported"

    .line 735
    .line 736
    const-string v4, "HTTP_VERSION_NOT_SUPPORTED"

    .line 737
    .line 738
    move-object/from16 v49, v1

    .line 739
    .line 740
    const/16 v1, 0x2d

    .line 741
    .line 742
    invoke-direct {v0, v4, v1, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 743
    .line 744
    .line 745
    sput-object v0, Lorg/eclipse/jetty/http/HttpStatus$Code;->HTTP_VERSION_NOT_SUPPORTED:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 746
    .line 747
    new-instance v1, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 748
    .line 749
    const/16 v2, 0x1fb

    .line 750
    .line 751
    const-string v3, "Insufficient Storage"

    .line 752
    .line 753
    const-string v4, "INSUFFICIENT_STORAGE"

    .line 754
    .line 755
    move-object/from16 v50, v0

    .line 756
    .line 757
    const/16 v0, 0x2e

    .line 758
    .line 759
    invoke-direct {v1, v4, v0, v2, v3}, Lorg/eclipse/jetty/http/HttpStatus$Code;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 760
    .line 761
    .line 762
    sput-object v1, Lorg/eclipse/jetty/http/HttpStatus$Code;->INSUFFICIENT_STORAGE:Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 763
    .line 764
    move-object/from16 v2, v17

    .line 765
    .line 766
    move-object/from16 v3, v18

    .line 767
    .line 768
    move-object/from16 v4, v19

    .line 769
    .line 770
    move-object/from16 v17, v21

    .line 771
    .line 772
    move-object/from16 v18, v22

    .line 773
    .line 774
    move-object/from16 v19, v23

    .line 775
    .line 776
    move-object/from16 v21, v25

    .line 777
    .line 778
    move-object/from16 v22, v26

    .line 779
    .line 780
    move-object/from16 v23, v27

    .line 781
    .line 782
    move-object/from16 v25, v29

    .line 783
    .line 784
    move-object/from16 v26, v30

    .line 785
    .line 786
    move-object/from16 v27, v31

    .line 787
    .line 788
    move-object/from16 v29, v33

    .line 789
    .line 790
    move-object/from16 v30, v34

    .line 791
    .line 792
    move-object/from16 v31, v35

    .line 793
    .line 794
    move-object/from16 v33, v37

    .line 795
    .line 796
    move-object/from16 v34, v38

    .line 797
    .line 798
    move-object/from16 v35, v39

    .line 799
    .line 800
    move-object/from16 v37, v41

    .line 801
    .line 802
    move-object/from16 v38, v42

    .line 803
    .line 804
    move-object/from16 v39, v43

    .line 805
    .line 806
    move-object/from16 v41, v45

    .line 807
    .line 808
    move-object/from16 v42, v46

    .line 809
    .line 810
    move-object/from16 v43, v47

    .line 811
    .line 812
    move-object/from16 v45, v49

    .line 813
    .line 814
    move-object/from16 v46, v50

    .line 815
    .line 816
    move-object/from16 v47, v1

    .line 817
    .line 818
    move-object/from16 v1, v16

    .line 819
    .line 820
    move-object/from16 v16, v20

    .line 821
    .line 822
    move-object/from16 v20, v24

    .line 823
    .line 824
    move-object/from16 v24, v28

    .line 825
    .line 826
    move-object/from16 v28, v32

    .line 827
    .line 828
    move-object/from16 v32, v36

    .line 829
    .line 830
    move-object/from16 v36, v40

    .line 831
    .line 832
    move-object/from16 v40, v44

    .line 833
    .line 834
    move-object/from16 v44, v48

    .line 835
    .line 836
    filled-new-array/range {v1 .. v47}, [Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 837
    .line 838
    .line 839
    move-result-object v0

    .line 840
    sput-object v0, Lorg/eclipse/jetty/http/HttpStatus$Code;->$VALUES:[Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 841
    .line 842
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;)V
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
    iput p3, p0, Lorg/eclipse/jetty/http/HttpStatus$Code;->_code:I

    .line 5
    .line 6
    iput-object p4, p0, Lorg/eclipse/jetty/http/HttpStatus$Code;->_message:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic access$000(Lorg/eclipse/jetty/http/HttpStatus$Code;)I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/http/HttpStatus$Code;->_code:I

    .line 2
    .line 3
    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jetty/http/HttpStatus$Code;
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lorg/eclipse/jetty/http/HttpStatus$Code;
    .locals 1

    .line 1
    sget-object v0, Lorg/eclipse/jetty/http/HttpStatus$Code;->$VALUES:[Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/eclipse/jetty/http/HttpStatus$Code;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/eclipse/jetty/http/HttpStatus$Code;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public equals(I)Z
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/http/HttpStatus$Code;->_code:I

    .line 2
    .line 3
    if-ne p0, p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public getCode()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/http/HttpStatus$Code;->_code:I

    .line 2
    .line 3
    return p0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/http/HttpStatus$Code;->_message:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isClientError()Z
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/http/HttpStatus$Code;->_code:I

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/http/HttpStatus;->isClientError(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isInformational()Z
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/http/HttpStatus$Code;->_code:I

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/http/HttpStatus;->isInformational(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isRedirection()Z
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/http/HttpStatus$Code;->_code:I

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/http/HttpStatus;->isRedirection(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isServerError()Z
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/http/HttpStatus$Code;->_code:I

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/http/HttpStatus;->isServerError(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isSuccess()Z
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/http/HttpStatus$Code;->_code:I

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/http/HttpStatus;->isSuccess(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    iget v0, p0, Lorg/eclipse/jetty/http/HttpStatus$Code;->_code:I

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpStatus$Code;->getMessage()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "[%03d %s]"

    .line 16
    .line 17
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method
