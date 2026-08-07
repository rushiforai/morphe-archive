.class public final Lcom/tencent/could/huiyansdk/utils/d$a;
.super Ljava/util/HashMap;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/could/huiyansdk/utils/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
        "Ljava/lang/String;",
        "Lcom/tencent/could/huiyansdk/entity/HostEntity;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "liveness-hk.faceid.qq.com"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->mainHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->secondHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, ""

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->backupIp(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->build()Lcom/tencent/could/huiyansdk/entity/HostEntity;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v2, "00"

    .line 30
    .line 31
    invoke-virtual {p0, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    new-instance v0, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 35
    .line 36
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;-><init>()V

    .line 37
    .line 38
    .line 39
    const-string v2, "liveness-sg.faceid.qq.com"

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->mainHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v2, "ekyc-sg.faceid.qcloud.com"

    .line 46
    .line 47
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->secondHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->backupIp(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->build()Lcom/tencent/could/huiyansdk/entity/HostEntity;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v2, "01"

    .line 60
    .line 61
    invoke-virtual {p0, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    new-instance v0, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 65
    .line 66
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;-><init>()V

    .line 67
    .line 68
    .line 69
    const-string v2, "liveness-id.faceid.qq.com"

    .line 70
    .line 71
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->mainHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->secondHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->backupIp(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->build()Lcom/tencent/could/huiyansdk/entity/HostEntity;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    const-string v2, "02"

    .line 88
    .line 89
    invoke-virtual {p0, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    new-instance v0, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 93
    .line 94
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;-><init>()V

    .line 95
    .line 96
    .line 97
    const-string v2, "liveness-tha.faceid.qq.com"

    .line 98
    .line 99
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->mainHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->secondHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->backupIp(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->build()Lcom/tencent/could/huiyansdk/entity/HostEntity;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    const-string v2, "03"

    .line 116
    .line 117
    invoke-virtual {p0, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    new-instance v0, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 121
    .line 122
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;-><init>()V

    .line 123
    .line 124
    .line 125
    const-string v2, "liveness-bom.faceid.qq.com"

    .line 126
    .line 127
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->mainHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->secondHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->backupIp(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->build()Lcom/tencent/could/huiyansdk/entity/HostEntity;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    const-string v2, "04"

    .line 144
    .line 145
    invoke-virtual {p0, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    new-instance v0, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 149
    .line 150
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;-><init>()V

    .line 151
    .line 152
    .line 153
    const-string v2, "liveness-sel.faceid.qq.com"

    .line 154
    .line 155
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->mainHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->secondHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->backupIp(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->build()Lcom/tencent/could/huiyansdk/entity/HostEntity;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    const-string v2, "05"

    .line 172
    .line 173
    invoke-virtual {p0, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    new-instance v0, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 177
    .line 178
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;-><init>()V

    .line 179
    .line 180
    .line 181
    const-string v2, "liveness-tyo.faceid.qq.com"

    .line 182
    .line 183
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->mainHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->secondHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->backupIp(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->build()Lcom/tencent/could/huiyansdk/entity/HostEntity;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    const-string v2, "06"

    .line 200
    .line 201
    invoke-virtual {p0, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    new-instance v0, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 205
    .line 206
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;-><init>()V

    .line 207
    .line 208
    .line 209
    const-string v2, "liveness-fra.faceid.qq.com"

    .line 210
    .line 211
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->mainHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->secondHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->backupIp(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->build()Lcom/tencent/could/huiyansdk/entity/HostEntity;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    const-string v2, "07"

    .line 228
    .line 229
    invoke-virtual {p0, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    new-instance v0, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 233
    .line 234
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;-><init>()V

    .line 235
    .line 236
    .line 237
    const-string v2, "liveness-mow.faceid.qq.com"

    .line 238
    .line 239
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->mainHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->secondHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->backupIp(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->build()Lcom/tencent/could/huiyansdk/entity/HostEntity;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    const-string v2, "08"

    .line 256
    .line 257
    invoke-virtual {p0, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    new-instance v0, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 261
    .line 262
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;-><init>()V

    .line 263
    .line 264
    .line 265
    const-string v2, "liveness-asb.faceid.qq.com"

    .line 266
    .line 267
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->mainHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->secondHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->backupIp(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->build()Lcom/tencent/could/huiyansdk/entity/HostEntity;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    const-string v2, "09"

    .line 284
    .line 285
    invoke-virtual {p0, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    .line 287
    .line 288
    new-instance v0, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 289
    .line 290
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;-><init>()V

    .line 291
    .line 292
    .line 293
    const-string v2, "liveness-sv.faceid.qq.com"

    .line 294
    .line 295
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->mainHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->secondHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->backupIp(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->build()Lcom/tencent/could/huiyansdk/entity/HostEntity;

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    const-string v2, "10"

    .line 312
    .line 313
    invoke-virtual {p0, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 314
    .line 315
    .line 316
    new-instance v0, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 317
    .line 318
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;-><init>()V

    .line 319
    .line 320
    .line 321
    const-string v2, "liveness-yyz.faceid.qq.com"

    .line 322
    .line 323
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->mainHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 324
    .line 325
    .line 326
    move-result-object v0

    .line 327
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->secondHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->backupIp(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->build()Lcom/tencent/could/huiyansdk/entity/HostEntity;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    const-string v2, "11"

    .line 340
    .line 341
    invoke-virtual {p0, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 342
    .line 343
    .line 344
    new-instance v0, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 345
    .line 346
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;-><init>()V

    .line 347
    .line 348
    .line 349
    const-string v2, "liveness-br.faceid.qq.com"

    .line 350
    .line 351
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->mainHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 352
    .line 353
    .line 354
    move-result-object v0

    .line 355
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->secondHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 356
    .line 357
    .line 358
    move-result-object v0

    .line 359
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->backupIp(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 360
    .line 361
    .line 362
    move-result-object v0

    .line 363
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->build()Lcom/tencent/could/huiyansdk/entity/HostEntity;

    .line 364
    .line 365
    .line 366
    move-result-object v0

    .line 367
    const-string v2, "12"

    .line 368
    .line 369
    invoke-virtual {p0, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 370
    .line 371
    .line 372
    new-instance v0, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 373
    .line 374
    invoke-direct {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;-><init>()V

    .line 375
    .line 376
    .line 377
    const-string v2, "liveness-mys.faceid.qq.com"

    .line 378
    .line 379
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->mainHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 380
    .line 381
    .line 382
    move-result-object v0

    .line 383
    invoke-virtual {v0, v2}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->secondHost(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 384
    .line 385
    .line 386
    move-result-object v0

    .line 387
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->backupIp(Ljava/lang/String;)Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;

    .line 388
    .line 389
    .line 390
    move-result-object v0

    .line 391
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HostEntity$Builder;->build()Lcom/tencent/could/huiyansdk/entity/HostEntity;

    .line 392
    .line 393
    .line 394
    move-result-object v0

    .line 395
    const-string v1, "13"

    .line 396
    .line 397
    invoke-virtual {p0, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 398
    .line 399
    .line 400
    return-void
.end method
