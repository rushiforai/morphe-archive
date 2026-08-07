.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;,
        Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$a;
    }
.end annotation


# static fields
.field public static final a:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

.field public static final b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/tencent/cloud/ai/network/okio/ByteString;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .locals 63

    .line 1
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 2
    .line 3
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->i:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    invoke-static {v2}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-direct {v1, v0, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 15
    .line 16
    sget-object v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->f:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 17
    .line 18
    const-string v4, "GET"

    .line 19
    .line 20
    invoke-static {v4}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    invoke-direct {v0, v3, v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 25
    .line 26
    .line 27
    new-instance v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 28
    .line 29
    const-string v5, "POST"

    .line 30
    .line 31
    invoke-static {v5}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    invoke-direct {v4, v3, v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 36
    .line 37
    .line 38
    move-object v3, v4

    .line 39
    new-instance v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 40
    .line 41
    sget-object v5, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->g:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 42
    .line 43
    const-string v6, "/"

    .line 44
    .line 45
    invoke-static {v6}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    invoke-direct {v4, v5, v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 50
    .line 51
    .line 52
    new-instance v6, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 53
    .line 54
    const-string v7, "/index.html"

    .line 55
    .line 56
    invoke-static {v7}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 57
    .line 58
    .line 59
    move-result-object v7

    .line 60
    invoke-direct {v6, v5, v7}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 61
    .line 62
    .line 63
    move-object v5, v6

    .line 64
    new-instance v6, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 65
    .line 66
    sget-object v7, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->h:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 67
    .line 68
    const-string v8, "http"

    .line 69
    .line 70
    invoke-static {v8}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 71
    .line 72
    .line 73
    move-result-object v8

    .line 74
    invoke-direct {v6, v7, v8}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 75
    .line 76
    .line 77
    new-instance v8, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 78
    .line 79
    const-string v9, "https"

    .line 80
    .line 81
    invoke-static {v9}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 82
    .line 83
    .line 84
    move-result-object v9

    .line 85
    invoke-direct {v8, v7, v9}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 86
    .line 87
    .line 88
    move-object v7, v8

    .line 89
    new-instance v8, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 90
    .line 91
    sget-object v9, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->e:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 92
    .line 93
    const-string v10, "200"

    .line 94
    .line 95
    invoke-static {v10}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 96
    .line 97
    .line 98
    move-result-object v10

    .line 99
    invoke-direct {v8, v9, v10}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 100
    .line 101
    .line 102
    new-instance v10, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 103
    .line 104
    const-string v11, "204"

    .line 105
    .line 106
    invoke-static {v11}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 107
    .line 108
    .line 109
    move-result-object v11

    .line 110
    invoke-direct {v10, v9, v11}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 111
    .line 112
    .line 113
    move-object v11, v10

    .line 114
    new-instance v10, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 115
    .line 116
    const-string v12, "206"

    .line 117
    .line 118
    invoke-static {v12}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 119
    .line 120
    .line 121
    move-result-object v12

    .line 122
    invoke-direct {v10, v9, v12}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 123
    .line 124
    .line 125
    move-object v12, v11

    .line 126
    new-instance v11, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 127
    .line 128
    const-string v13, "304"

    .line 129
    .line 130
    invoke-static {v13}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 131
    .line 132
    .line 133
    move-result-object v13

    .line 134
    invoke-direct {v11, v9, v13}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 135
    .line 136
    .line 137
    move-object v13, v12

    .line 138
    new-instance v12, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 139
    .line 140
    const-string v14, "400"

    .line 141
    .line 142
    invoke-static {v14}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 143
    .line 144
    .line 145
    move-result-object v14

    .line 146
    invoke-direct {v12, v9, v14}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 147
    .line 148
    .line 149
    move-object v14, v13

    .line 150
    new-instance v13, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 151
    .line 152
    const-string v15, "404"

    .line 153
    .line 154
    invoke-static {v15}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 155
    .line 156
    .line 157
    move-result-object v15

    .line 158
    invoke-direct {v13, v9, v15}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 159
    .line 160
    .line 161
    move-object v15, v14

    .line 162
    new-instance v14, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 163
    .line 164
    const-string v16, "500"

    .line 165
    .line 166
    move-object/from16 v17, v0

    .line 167
    .line 168
    invoke-static/range {v16 .. v16}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-direct {v14, v9, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Lcom/tencent/cloud/ai/network/okio/ByteString;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 173
    .line 174
    .line 175
    move-object v9, v15

    .line 176
    new-instance v15, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 177
    .line 178
    const-string v0, "accept-charset"

    .line 179
    .line 180
    invoke-direct {v15, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 184
    .line 185
    move-object/from16 v16, v1

    .line 186
    .line 187
    const-string v1, "accept-encoding"

    .line 188
    .line 189
    move-object/from16 v18, v3

    .line 190
    .line 191
    const-string v3, "gzip, deflate"

    .line 192
    .line 193
    invoke-direct {v0, v1, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 197
    .line 198
    const-string v3, "accept-language"

    .line 199
    .line 200
    invoke-direct {v1, v3, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    new-instance v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 204
    .line 205
    move-object/from16 v19, v0

    .line 206
    .line 207
    const-string v0, "accept-ranges"

    .line 208
    .line 209
    invoke-direct {v3, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 213
    .line 214
    move-object/from16 v20, v1

    .line 215
    .line 216
    const-string v1, "accept"

    .line 217
    .line 218
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 222
    .line 223
    move-object/from16 v21, v0

    .line 224
    .line 225
    const-string v0, "access-control-allow-origin"

    .line 226
    .line 227
    invoke-direct {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 231
    .line 232
    move-object/from16 v22, v1

    .line 233
    .line 234
    const-string v1, "age"

    .line 235
    .line 236
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 240
    .line 241
    move-object/from16 v23, v0

    .line 242
    .line 243
    const-string v0, "allow"

    .line 244
    .line 245
    invoke-direct {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 249
    .line 250
    move-object/from16 v24, v1

    .line 251
    .line 252
    const-string v1, "authorization"

    .line 253
    .line 254
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 258
    .line 259
    move-object/from16 v25, v0

    .line 260
    .line 261
    const-string v0, "cache-control"

    .line 262
    .line 263
    invoke-direct {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    .line 265
    .line 266
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 267
    .line 268
    move-object/from16 v26, v1

    .line 269
    .line 270
    const-string v1, "content-disposition"

    .line 271
    .line 272
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 276
    .line 277
    move-object/from16 v27, v0

    .line 278
    .line 279
    const-string v0, "content-encoding"

    .line 280
    .line 281
    invoke-direct {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 285
    .line 286
    move-object/from16 v28, v1

    .line 287
    .line 288
    const-string v1, "content-language"

    .line 289
    .line 290
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    .line 292
    .line 293
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 294
    .line 295
    move-object/from16 v29, v0

    .line 296
    .line 297
    const-string v0, "content-length"

    .line 298
    .line 299
    invoke-direct {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 303
    .line 304
    move-object/from16 v30, v1

    .line 305
    .line 306
    const-string v1, "content-location"

    .line 307
    .line 308
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 309
    .line 310
    .line 311
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 312
    .line 313
    move-object/from16 v31, v0

    .line 314
    .line 315
    const-string v0, "content-range"

    .line 316
    .line 317
    invoke-direct {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 318
    .line 319
    .line 320
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 321
    .line 322
    move-object/from16 v32, v1

    .line 323
    .line 324
    const-string v1, "content-type"

    .line 325
    .line 326
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 330
    .line 331
    move-object/from16 v33, v0

    .line 332
    .line 333
    const-string v0, "cookie"

    .line 334
    .line 335
    invoke-direct {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 336
    .line 337
    .line 338
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 339
    .line 340
    move-object/from16 v34, v1

    .line 341
    .line 342
    const-string v1, "date"

    .line 343
    .line 344
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 345
    .line 346
    .line 347
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 348
    .line 349
    move-object/from16 v35, v0

    .line 350
    .line 351
    const-string v0, "etag"

    .line 352
    .line 353
    invoke-direct {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 357
    .line 358
    move-object/from16 v36, v1

    .line 359
    .line 360
    const-string v1, "expect"

    .line 361
    .line 362
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 363
    .line 364
    .line 365
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 366
    .line 367
    move-object/from16 v37, v0

    .line 368
    .line 369
    const-string v0, "expires"

    .line 370
    .line 371
    invoke-direct {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 372
    .line 373
    .line 374
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 375
    .line 376
    move-object/from16 v38, v1

    .line 377
    .line 378
    const-string v1, "from"

    .line 379
    .line 380
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 381
    .line 382
    .line 383
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 384
    .line 385
    move-object/from16 v39, v0

    .line 386
    .line 387
    const-string v0, "host"

    .line 388
    .line 389
    invoke-direct {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 390
    .line 391
    .line 392
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 393
    .line 394
    move-object/from16 v40, v1

    .line 395
    .line 396
    const-string v1, "if-match"

    .line 397
    .line 398
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 399
    .line 400
    .line 401
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 402
    .line 403
    move-object/from16 v41, v0

    .line 404
    .line 405
    const-string v0, "if-modified-since"

    .line 406
    .line 407
    invoke-direct {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 408
    .line 409
    .line 410
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 411
    .line 412
    move-object/from16 v42, v1

    .line 413
    .line 414
    const-string v1, "if-none-match"

    .line 415
    .line 416
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 417
    .line 418
    .line 419
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 420
    .line 421
    move-object/from16 v43, v0

    .line 422
    .line 423
    const-string v0, "if-range"

    .line 424
    .line 425
    invoke-direct {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 426
    .line 427
    .line 428
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 429
    .line 430
    move-object/from16 v44, v1

    .line 431
    .line 432
    const-string v1, "if-unmodified-since"

    .line 433
    .line 434
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 435
    .line 436
    .line 437
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 438
    .line 439
    move-object/from16 v45, v0

    .line 440
    .line 441
    const-string v0, "last-modified"

    .line 442
    .line 443
    invoke-direct {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 444
    .line 445
    .line 446
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 447
    .line 448
    move-object/from16 v46, v1

    .line 449
    .line 450
    const-string v1, "link"

    .line 451
    .line 452
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 453
    .line 454
    .line 455
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 456
    .line 457
    move-object/from16 v47, v0

    .line 458
    .line 459
    const-string v0, "location"

    .line 460
    .line 461
    invoke-direct {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 462
    .line 463
    .line 464
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 465
    .line 466
    move-object/from16 v48, v1

    .line 467
    .line 468
    const-string v1, "max-forwards"

    .line 469
    .line 470
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 471
    .line 472
    .line 473
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 474
    .line 475
    move-object/from16 v49, v0

    .line 476
    .line 477
    const-string v0, "proxy-authenticate"

    .line 478
    .line 479
    invoke-direct {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 480
    .line 481
    .line 482
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 483
    .line 484
    move-object/from16 v50, v1

    .line 485
    .line 486
    const-string v1, "proxy-authorization"

    .line 487
    .line 488
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 489
    .line 490
    .line 491
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 492
    .line 493
    move-object/from16 v51, v0

    .line 494
    .line 495
    const-string v0, "range"

    .line 496
    .line 497
    invoke-direct {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 498
    .line 499
    .line 500
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 501
    .line 502
    move-object/from16 v52, v1

    .line 503
    .line 504
    const-string v1, "referer"

    .line 505
    .line 506
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 507
    .line 508
    .line 509
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 510
    .line 511
    move-object/from16 v53, v0

    .line 512
    .line 513
    const-string v0, "refresh"

    .line 514
    .line 515
    invoke-direct {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 516
    .line 517
    .line 518
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 519
    .line 520
    move-object/from16 v54, v1

    .line 521
    .line 522
    const-string v1, "retry-after"

    .line 523
    .line 524
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 525
    .line 526
    .line 527
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 528
    .line 529
    move-object/from16 v55, v0

    .line 530
    .line 531
    const-string v0, "server"

    .line 532
    .line 533
    invoke-direct {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 534
    .line 535
    .line 536
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 537
    .line 538
    move-object/from16 v56, v1

    .line 539
    .line 540
    const-string v1, "set-cookie"

    .line 541
    .line 542
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 543
    .line 544
    .line 545
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 546
    .line 547
    move-object/from16 v57, v0

    .line 548
    .line 549
    const-string v0, "strict-transport-security"

    .line 550
    .line 551
    invoke-direct {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 552
    .line 553
    .line 554
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 555
    .line 556
    move-object/from16 v58, v1

    .line 557
    .line 558
    const-string v1, "transfer-encoding"

    .line 559
    .line 560
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 561
    .line 562
    .line 563
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 564
    .line 565
    move-object/from16 v59, v0

    .line 566
    .line 567
    const-string v0, "user-agent"

    .line 568
    .line 569
    invoke-direct {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 570
    .line 571
    .line 572
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 573
    .line 574
    move-object/from16 v60, v1

    .line 575
    .line 576
    const-string v1, "vary"

    .line 577
    .line 578
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 579
    .line 580
    .line 581
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 582
    .line 583
    move-object/from16 v61, v0

    .line 584
    .line 585
    const-string v0, "via"

    .line 586
    .line 587
    invoke-direct {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 588
    .line 589
    .line 590
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 591
    .line 592
    move-object/from16 v62, v1

    .line 593
    .line 594
    const-string v1, "www-authenticate"

    .line 595
    .line 596
    invoke-direct {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 597
    .line 598
    .line 599
    move-object/from16 v1, v18

    .line 600
    .line 601
    move-object/from16 v18, v3

    .line 602
    .line 603
    move-object v3, v1

    .line 604
    move-object/from16 v1, v16

    .line 605
    .line 606
    move-object/from16 v2, v17

    .line 607
    .line 608
    move-object/from16 v16, v19

    .line 609
    .line 610
    move-object/from16 v17, v20

    .line 611
    .line 612
    move-object/from16 v19, v21

    .line 613
    .line 614
    move-object/from16 v20, v22

    .line 615
    .line 616
    move-object/from16 v21, v23

    .line 617
    .line 618
    move-object/from16 v22, v24

    .line 619
    .line 620
    move-object/from16 v23, v25

    .line 621
    .line 622
    move-object/from16 v24, v26

    .line 623
    .line 624
    move-object/from16 v25, v27

    .line 625
    .line 626
    move-object/from16 v26, v28

    .line 627
    .line 628
    move-object/from16 v27, v29

    .line 629
    .line 630
    move-object/from16 v28, v30

    .line 631
    .line 632
    move-object/from16 v29, v31

    .line 633
    .line 634
    move-object/from16 v30, v32

    .line 635
    .line 636
    move-object/from16 v31, v33

    .line 637
    .line 638
    move-object/from16 v32, v34

    .line 639
    .line 640
    move-object/from16 v33, v35

    .line 641
    .line 642
    move-object/from16 v34, v36

    .line 643
    .line 644
    move-object/from16 v35, v37

    .line 645
    .line 646
    move-object/from16 v36, v38

    .line 647
    .line 648
    move-object/from16 v37, v39

    .line 649
    .line 650
    move-object/from16 v38, v40

    .line 651
    .line 652
    move-object/from16 v39, v41

    .line 653
    .line 654
    move-object/from16 v40, v42

    .line 655
    .line 656
    move-object/from16 v41, v43

    .line 657
    .line 658
    move-object/from16 v42, v44

    .line 659
    .line 660
    move-object/from16 v43, v45

    .line 661
    .line 662
    move-object/from16 v44, v46

    .line 663
    .line 664
    move-object/from16 v45, v47

    .line 665
    .line 666
    move-object/from16 v46, v48

    .line 667
    .line 668
    move-object/from16 v47, v49

    .line 669
    .line 670
    move-object/from16 v48, v50

    .line 671
    .line 672
    move-object/from16 v49, v51

    .line 673
    .line 674
    move-object/from16 v50, v52

    .line 675
    .line 676
    move-object/from16 v51, v53

    .line 677
    .line 678
    move-object/from16 v52, v54

    .line 679
    .line 680
    move-object/from16 v53, v55

    .line 681
    .line 682
    move-object/from16 v54, v56

    .line 683
    .line 684
    move-object/from16 v55, v57

    .line 685
    .line 686
    move-object/from16 v56, v58

    .line 687
    .line 688
    move-object/from16 v57, v59

    .line 689
    .line 690
    move-object/from16 v58, v60

    .line 691
    .line 692
    move-object/from16 v59, v61

    .line 693
    .line 694
    move-object/from16 v60, v62

    .line 695
    .line 696
    move-object/from16 v61, v0

    .line 697
    .line 698
    filled-new-array/range {v1 .. v61}, [Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 699
    .line 700
    .line 701
    move-result-object v0

    .line 702
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d;->a:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 703
    .line 704
    new-instance v1, Ljava/util/LinkedHashMap;

    .line 705
    .line 706
    array-length v0, v0

    .line 707
    invoke-direct {v1, v0}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 708
    .line 709
    .line 710
    const/4 v0, 0x0

    .line 711
    :goto_0
    sget-object v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d;->a:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 712
    .line 713
    array-length v3, v2

    .line 714
    if-ge v0, v3, :cond_1

    .line 715
    .line 716
    aget-object v3, v2, v0

    .line 717
    .line 718
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->a:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 719
    .line 720
    invoke-virtual {v1, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 721
    .line 722
    .line 723
    move-result v3

    .line 724
    if-nez v3, :cond_0

    .line 725
    .line 726
    aget-object v2, v2, v0

    .line 727
    .line 728
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->a:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 729
    .line 730
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 731
    .line 732
    .line 733
    move-result-object v3

    .line 734
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 735
    .line 736
    .line 737
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 738
    .line 739
    goto :goto_0

    .line 740
    :cond_1
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 741
    .line 742
    .line 743
    move-result-object v0

    .line 744
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d;->b:Ljava/util/Map;

    .line 745
    .line 746
    return-void
.end method

.method public static a(Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->getByte(I)B

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/16 v3, 0x41

    .line 13
    .line 14
    if-lt v2, v3, :cond_1

    .line 15
    .line 16
    const/16 v3, 0x5a

    .line 17
    .line 18
    if-le v2, v3, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    const-string v0, "PROTOCOL_ERROR response malformed: mixed case name: "

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->utf8()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {v0, p0}, Ll/rr10;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    return-object p0

    .line 32
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    return-object p0
.end method
