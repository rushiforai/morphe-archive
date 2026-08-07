.class public final Ll/e9x0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/v6x0;

.field public static final b:Ll/v6x0;

.field public static final c:Ll/yww0;

.field public static final d:Ll/x5x0;

.field public static final e:Ll/v5x0;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    sget-object v0, Ll/a9x0;->a:Ll/a9x0;

    .line 2
    .line 3
    const-class v1, Ll/s8x0;

    .line 4
    .line 5
    const-class v2, Ll/z8x0;

    .line 6
    .line 7
    invoke-static {v0, v2, v1}, Ll/v6x0;->b(Ll/t6x0;Ljava/lang/Class;Ljava/lang/Class;)Ll/v6x0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Ll/e9x0;->a:Ll/v6x0;

    .line 12
    .line 13
    sget-object v0, Ll/b9x0;->a:Ll/b9x0;

    .line 14
    .line 15
    const-class v1, Ll/kxw0;

    .line 16
    .line 17
    invoke-static {v0, v2, v1}, Ll/v6x0;->b(Ll/t6x0;Ljava/lang/Class;Ljava/lang/Class;)Ll/v6x0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sput-object v0, Ll/e9x0;->b:Ll/v6x0;

    .line 22
    .line 23
    sget-object v0, Lcom/google/android/gms/internal/ads/zzgus;->zzb:Lcom/google/android/gms/internal/ads/zzgus;

    .line 24
    .line 25
    invoke-static {}, Lcom/google/android/gms/internal/ads/q4;->S()Ll/lkx0;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-string v3, "type.googleapis.com/google.crypto.tink.HmacKey"

    .line 30
    .line 31
    invoke-static {v3, v1, v0, v2}, Ll/o5x0;->c(Ljava/lang/String;Ljava/lang/Class;Lcom/google/android/gms/internal/ads/zzgus;Ll/lkx0;)Ll/yww0;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Ll/e9x0;->c:Ll/yww0;

    .line 36
    .line 37
    sget-object v0, Ll/c9x0;->a:Ll/c9x0;

    .line 38
    .line 39
    sput-object v0, Ll/e9x0;->d:Ll/x5x0;

    .line 40
    .line 41
    sget-object v0, Ll/d9x0;->a:Ll/d9x0;

    .line 42
    .line 43
    sput-object v0, Ll/e9x0;->e:Ll/v5x0;

    .line 44
    .line 45
    return-void
.end method

.method public static a(Z)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    sget-object p0, Ll/jax0;->a:Ll/wfx0;

    .line 2
    .line 3
    invoke-static {}, Ll/j6x0;->d()Ll/j6x0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/jax0;->e(Ll/j6x0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/g6x0;->a()Ll/g6x0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget-object v0, Ll/e9x0;->a:Ll/v6x0;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/g6x0;->e(Ll/v6x0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/g6x0;->a()Ll/g6x0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sget-object v0, Ll/e9x0;->b:Ll/v6x0;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/g6x0;->e(Ll/v6x0;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/f6x0;->b()Ll/f6x0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    new-instance v0, Ljava/util/HashMap;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 35
    .line 36
    .line 37
    const-string v1, "HMAC_SHA256_128BITTAG"

    .line 38
    .line 39
    sget-object v2, Ll/bax0;->a:Ll/k9x0;

    .line 40
    .line 41
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    new-instance v1, Ll/g9x0;

    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    invoke-direct {v1, v2}, Ll/g9x0;-><init>(Ll/f9x0;)V

    .line 48
    .line 49
    .line 50
    const/16 v3, 0x20

    .line 51
    .line 52
    invoke-virtual {v1, v3}, Ll/g9x0;->b(I)Ll/g9x0;

    .line 53
    .line 54
    .line 55
    const/16 v4, 0x10

    .line 56
    .line 57
    invoke-virtual {v1, v4}, Ll/g9x0;->c(I)Ll/g9x0;

    .line 58
    .line 59
    .line 60
    sget-object v5, Ll/i9x0;->e:Ll/i9x0;

    .line 61
    .line 62
    invoke-virtual {v1, v5}, Ll/g9x0;->d(Ll/i9x0;)Ll/g9x0;

    .line 63
    .line 64
    .line 65
    sget-object v6, Ll/h9x0;->d:Ll/h9x0;

    .line 66
    .line 67
    invoke-virtual {v1, v6}, Ll/g9x0;->a(Ll/h9x0;)Ll/g9x0;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1}, Ll/g9x0;->e()Ll/k9x0;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    const-string v7, "HMAC_SHA256_128BITTAG_RAW"

    .line 75
    .line 76
    invoke-interface {v0, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    new-instance v1, Ll/g9x0;

    .line 80
    .line 81
    invoke-direct {v1, v2}, Ll/g9x0;-><init>(Ll/f9x0;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1, v3}, Ll/g9x0;->b(I)Ll/g9x0;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1, v3}, Ll/g9x0;->c(I)Ll/g9x0;

    .line 88
    .line 89
    .line 90
    sget-object v7, Ll/i9x0;->b:Ll/i9x0;

    .line 91
    .line 92
    invoke-virtual {v1, v7}, Ll/g9x0;->d(Ll/i9x0;)Ll/g9x0;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1, v6}, Ll/g9x0;->a(Ll/h9x0;)Ll/g9x0;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1}, Ll/g9x0;->e()Ll/k9x0;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    const-string v8, "HMAC_SHA256_256BITTAG"

    .line 103
    .line 104
    invoke-interface {v0, v8, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    new-instance v1, Ll/g9x0;

    .line 108
    .line 109
    invoke-direct {v1, v2}, Ll/g9x0;-><init>(Ll/f9x0;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v1, v3}, Ll/g9x0;->b(I)Ll/g9x0;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v1, v3}, Ll/g9x0;->c(I)Ll/g9x0;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v1, v5}, Ll/g9x0;->d(Ll/i9x0;)Ll/g9x0;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v1, v6}, Ll/g9x0;->a(Ll/h9x0;)Ll/g9x0;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v1}, Ll/g9x0;->e()Ll/k9x0;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    const-string v6, "HMAC_SHA256_256BITTAG_RAW"

    .line 129
    .line 130
    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    new-instance v1, Ll/g9x0;

    .line 134
    .line 135
    invoke-direct {v1, v2}, Ll/g9x0;-><init>(Ll/f9x0;)V

    .line 136
    .line 137
    .line 138
    const/16 v6, 0x40

    .line 139
    .line 140
    invoke-virtual {v1, v6}, Ll/g9x0;->b(I)Ll/g9x0;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v1, v4}, Ll/g9x0;->c(I)Ll/g9x0;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v1, v7}, Ll/g9x0;->d(Ll/i9x0;)Ll/g9x0;

    .line 147
    .line 148
    .line 149
    sget-object v8, Ll/h9x0;->f:Ll/h9x0;

    .line 150
    .line 151
    invoke-virtual {v1, v8}, Ll/g9x0;->a(Ll/h9x0;)Ll/g9x0;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v1}, Ll/g9x0;->e()Ll/k9x0;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    const-string v9, "HMAC_SHA512_128BITTAG"

    .line 159
    .line 160
    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    new-instance v1, Ll/g9x0;

    .line 164
    .line 165
    invoke-direct {v1, v2}, Ll/g9x0;-><init>(Ll/f9x0;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v1, v6}, Ll/g9x0;->b(I)Ll/g9x0;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v1, v4}, Ll/g9x0;->c(I)Ll/g9x0;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v1, v5}, Ll/g9x0;->d(Ll/i9x0;)Ll/g9x0;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v1, v8}, Ll/g9x0;->a(Ll/h9x0;)Ll/g9x0;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v1}, Ll/g9x0;->e()Ll/k9x0;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    const-string v4, "HMAC_SHA512_128BITTAG_RAW"

    .line 185
    .line 186
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    new-instance v1, Ll/g9x0;

    .line 190
    .line 191
    invoke-direct {v1, v2}, Ll/g9x0;-><init>(Ll/f9x0;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v1, v6}, Ll/g9x0;->b(I)Ll/g9x0;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v1, v3}, Ll/g9x0;->c(I)Ll/g9x0;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v1, v7}, Ll/g9x0;->d(Ll/i9x0;)Ll/g9x0;

    .line 201
    .line 202
    .line 203
    invoke-virtual {v1, v8}, Ll/g9x0;->a(Ll/h9x0;)Ll/g9x0;

    .line 204
    .line 205
    .line 206
    invoke-virtual {v1}, Ll/g9x0;->e()Ll/k9x0;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    const-string v4, "HMAC_SHA512_256BITTAG"

    .line 211
    .line 212
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    new-instance v1, Ll/g9x0;

    .line 216
    .line 217
    invoke-direct {v1, v2}, Ll/g9x0;-><init>(Ll/f9x0;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {v1, v6}, Ll/g9x0;->b(I)Ll/g9x0;

    .line 221
    .line 222
    .line 223
    invoke-virtual {v1, v3}, Ll/g9x0;->c(I)Ll/g9x0;

    .line 224
    .line 225
    .line 226
    invoke-virtual {v1, v5}, Ll/g9x0;->d(Ll/i9x0;)Ll/g9x0;

    .line 227
    .line 228
    .line 229
    invoke-virtual {v1, v8}, Ll/g9x0;->a(Ll/h9x0;)Ll/g9x0;

    .line 230
    .line 231
    .line 232
    invoke-virtual {v1}, Ll/g9x0;->e()Ll/k9x0;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    const-string v3, "HMAC_SHA512_256BITTAG_RAW"

    .line 237
    .line 238
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    const-string v1, "HMAC_SHA512_512BITTAG"

    .line 242
    .line 243
    sget-object v3, Ll/bax0;->d:Ll/k9x0;

    .line 244
    .line 245
    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    new-instance v1, Ll/g9x0;

    .line 249
    .line 250
    invoke-direct {v1, v2}, Ll/g9x0;-><init>(Ll/f9x0;)V

    .line 251
    .line 252
    .line 253
    invoke-virtual {v1, v6}, Ll/g9x0;->b(I)Ll/g9x0;

    .line 254
    .line 255
    .line 256
    invoke-virtual {v1, v6}, Ll/g9x0;->c(I)Ll/g9x0;

    .line 257
    .line 258
    .line 259
    invoke-virtual {v1, v5}, Ll/g9x0;->d(Ll/i9x0;)Ll/g9x0;

    .line 260
    .line 261
    .line 262
    invoke-virtual {v1, v8}, Ll/g9x0;->a(Ll/h9x0;)Ll/g9x0;

    .line 263
    .line 264
    .line 265
    invoke-virtual {v1}, Ll/g9x0;->e()Ll/k9x0;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    const-string v2, "HMAC_SHA512_512BITTAG_RAW"

    .line 270
    .line 271
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    invoke-virtual {p0, v0}, Ll/f6x0;->d(Ljava/util/Map;)V

    .line 279
    .line 280
    .line 281
    invoke-static {}, Ll/w5x0;->b()Ll/w5x0;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    sget-object v0, Ll/e9x0;->e:Ll/v5x0;

    .line 286
    .line 287
    const-class v1, Ll/k9x0;

    .line 288
    .line 289
    invoke-virtual {p0, v0, v1}, Ll/w5x0;->c(Ll/v5x0;Ljava/lang/Class;)V

    .line 290
    .line 291
    .line 292
    invoke-static {}, Ll/y5x0;->a()Ll/y5x0;

    .line 293
    .line 294
    .line 295
    move-result-object p0

    .line 296
    sget-object v0, Ll/e9x0;->d:Ll/x5x0;

    .line 297
    .line 298
    invoke-virtual {p0, v0, v1}, Ll/y5x0;->b(Ll/x5x0;Ljava/lang/Class;)V

    .line 299
    .line 300
    .line 301
    invoke-static {}, Ll/f5x0;->c()Ll/f5x0;

    .line 302
    .line 303
    .line 304
    move-result-object p0

    .line 305
    sget-object v0, Ll/e9x0;->c:Ll/yww0;

    .line 306
    .line 307
    const/4 v1, 0x2

    .line 308
    const/4 v2, 0x1

    .line 309
    invoke-virtual {p0, v0, v1, v2}, Ll/f5x0;->f(Ll/yww0;IZ)V

    .line 310
    .line 311
    .line 312
    return-void
.end method
