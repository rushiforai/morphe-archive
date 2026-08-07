.class public final Lcom/tencent/cloud/ai/network/okhttp3/g;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final c:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/tencent/cloud/ai/network/okhttp3/g;",
            ">;"
        }
    .end annotation
.end field

.field public static final d:Lcom/tencent/cloud/ai/network/okhttp3/g;

.field public static final e:Lcom/tencent/cloud/ai/network/okhttp3/g;

.field public static final f:Lcom/tencent/cloud/ai/network/okhttp3/g;

.field public static final g:Lcom/tencent/cloud/ai/network/okhttp3/g;

.field public static final h:Lcom/tencent/cloud/ai/network/okhttp3/g;

.field public static final i:Lcom/tencent/cloud/ai/network/okhttp3/g;

.field public static final j:Lcom/tencent/cloud/ai/network/okhttp3/g;

.field public static final k:Lcom/tencent/cloud/ai/network/okhttp3/g;

.field public static final l:Lcom/tencent/cloud/ai/network/okhttp3/g;

.field public static final m:Lcom/tencent/cloud/ai/network/okhttp3/g;

.field public static final n:Lcom/tencent/cloud/ai/network/okhttp3/g;

.field public static final o:Lcom/tencent/cloud/ai/network/okhttp3/g;

.field public static final p:Lcom/tencent/cloud/ai/network/okhttp3/g;

.field public static final q:Lcom/tencent/cloud/ai/network/okhttp3/g;

.field public static final r:Lcom/tencent/cloud/ai/network/okhttp3/g;

.field public static final s:Lcom/tencent/cloud/ai/network/okhttp3/g;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/r2r0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/r2r0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/g;->b:Ljava/util/Comparator;

    .line 7
    .line 8
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/g;->c:Ljava/util/Map;

    .line 14
    .line 15
    const-string v0, "SSL_RSA_WITH_NULL_MD5"

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 18
    .line 19
    .line 20
    const-string v0, "SSL_RSA_WITH_NULL_SHA"

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 23
    .line 24
    .line 25
    const-string v0, "SSL_RSA_EXPORT_WITH_RC4_40_MD5"

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 28
    .line 29
    .line 30
    const-string v0, "SSL_RSA_WITH_RC4_128_MD5"

    .line 31
    .line 32
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 33
    .line 34
    .line 35
    const-string v0, "SSL_RSA_WITH_RC4_128_SHA"

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 38
    .line 39
    .line 40
    const-string v0, "SSL_RSA_EXPORT_WITH_DES40_CBC_SHA"

    .line 41
    .line 42
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 43
    .line 44
    .line 45
    const-string v0, "SSL_RSA_WITH_DES_CBC_SHA"

    .line 46
    .line 47
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 48
    .line 49
    .line 50
    const-string v0, "SSL_RSA_WITH_3DES_EDE_CBC_SHA"

    .line 51
    .line 52
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/g;->d:Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 57
    .line 58
    const-string v0, "SSL_DHE_DSS_EXPORT_WITH_DES40_CBC_SHA"

    .line 59
    .line 60
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 61
    .line 62
    .line 63
    const-string v0, "SSL_DHE_DSS_WITH_DES_CBC_SHA"

    .line 64
    .line 65
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 66
    .line 67
    .line 68
    const-string v0, "SSL_DHE_DSS_WITH_3DES_EDE_CBC_SHA"

    .line 69
    .line 70
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 71
    .line 72
    .line 73
    const-string v0, "SSL_DHE_RSA_EXPORT_WITH_DES40_CBC_SHA"

    .line 74
    .line 75
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 76
    .line 77
    .line 78
    const-string v0, "SSL_DHE_RSA_WITH_DES_CBC_SHA"

    .line 79
    .line 80
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 81
    .line 82
    .line 83
    const-string v0, "SSL_DHE_RSA_WITH_3DES_EDE_CBC_SHA"

    .line 84
    .line 85
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 86
    .line 87
    .line 88
    const-string v0, "SSL_DH_anon_EXPORT_WITH_RC4_40_MD5"

    .line 89
    .line 90
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 91
    .line 92
    .line 93
    const-string v0, "SSL_DH_anon_WITH_RC4_128_MD5"

    .line 94
    .line 95
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 96
    .line 97
    .line 98
    const-string v0, "SSL_DH_anon_EXPORT_WITH_DES40_CBC_SHA"

    .line 99
    .line 100
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 101
    .line 102
    .line 103
    const-string v0, "SSL_DH_anon_WITH_DES_CBC_SHA"

    .line 104
    .line 105
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 106
    .line 107
    .line 108
    const-string v0, "SSL_DH_anon_WITH_3DES_EDE_CBC_SHA"

    .line 109
    .line 110
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 111
    .line 112
    .line 113
    const-string v0, "TLS_KRB5_WITH_DES_CBC_SHA"

    .line 114
    .line 115
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 116
    .line 117
    .line 118
    const-string v0, "TLS_KRB5_WITH_3DES_EDE_CBC_SHA"

    .line 119
    .line 120
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 121
    .line 122
    .line 123
    const-string v0, "TLS_KRB5_WITH_RC4_128_SHA"

    .line 124
    .line 125
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 126
    .line 127
    .line 128
    const-string v0, "TLS_KRB5_WITH_DES_CBC_MD5"

    .line 129
    .line 130
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 131
    .line 132
    .line 133
    const-string v0, "TLS_KRB5_WITH_3DES_EDE_CBC_MD5"

    .line 134
    .line 135
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 136
    .line 137
    .line 138
    const-string v0, "TLS_KRB5_WITH_RC4_128_MD5"

    .line 139
    .line 140
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 141
    .line 142
    .line 143
    const-string v0, "TLS_KRB5_EXPORT_WITH_DES_CBC_40_SHA"

    .line 144
    .line 145
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 146
    .line 147
    .line 148
    const-string v0, "TLS_KRB5_EXPORT_WITH_RC4_40_SHA"

    .line 149
    .line 150
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 151
    .line 152
    .line 153
    const-string v0, "TLS_KRB5_EXPORT_WITH_DES_CBC_40_MD5"

    .line 154
    .line 155
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 156
    .line 157
    .line 158
    const-string v0, "TLS_KRB5_EXPORT_WITH_RC4_40_MD5"

    .line 159
    .line 160
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 161
    .line 162
    .line 163
    const-string v0, "TLS_RSA_WITH_AES_128_CBC_SHA"

    .line 164
    .line 165
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/g;->e:Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 170
    .line 171
    const-string v0, "TLS_DHE_DSS_WITH_AES_128_CBC_SHA"

    .line 172
    .line 173
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 174
    .line 175
    .line 176
    const-string v0, "TLS_DHE_RSA_WITH_AES_128_CBC_SHA"

    .line 177
    .line 178
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 179
    .line 180
    .line 181
    const-string v0, "TLS_DH_anon_WITH_AES_128_CBC_SHA"

    .line 182
    .line 183
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 184
    .line 185
    .line 186
    const-string v0, "TLS_RSA_WITH_AES_256_CBC_SHA"

    .line 187
    .line 188
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/g;->f:Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 193
    .line 194
    const-string v0, "TLS_DHE_DSS_WITH_AES_256_CBC_SHA"

    .line 195
    .line 196
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 197
    .line 198
    .line 199
    const-string v0, "TLS_DHE_RSA_WITH_AES_256_CBC_SHA"

    .line 200
    .line 201
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 202
    .line 203
    .line 204
    const-string v0, "TLS_DH_anon_WITH_AES_256_CBC_SHA"

    .line 205
    .line 206
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 207
    .line 208
    .line 209
    const-string v0, "TLS_RSA_WITH_NULL_SHA256"

    .line 210
    .line 211
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 212
    .line 213
    .line 214
    const-string v0, "TLS_RSA_WITH_AES_128_CBC_SHA256"

    .line 215
    .line 216
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 217
    .line 218
    .line 219
    const-string v0, "TLS_RSA_WITH_AES_256_CBC_SHA256"

    .line 220
    .line 221
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 222
    .line 223
    .line 224
    const-string v0, "TLS_DHE_DSS_WITH_AES_128_CBC_SHA256"

    .line 225
    .line 226
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 227
    .line 228
    .line 229
    const-string v0, "TLS_RSA_WITH_CAMELLIA_128_CBC_SHA"

    .line 230
    .line 231
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 232
    .line 233
    .line 234
    const-string v0, "TLS_DHE_DSS_WITH_CAMELLIA_128_CBC_SHA"

    .line 235
    .line 236
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 237
    .line 238
    .line 239
    const-string v0, "TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA"

    .line 240
    .line 241
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 242
    .line 243
    .line 244
    const-string v0, "TLS_DHE_RSA_WITH_AES_128_CBC_SHA256"

    .line 245
    .line 246
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 247
    .line 248
    .line 249
    const-string v0, "TLS_DHE_DSS_WITH_AES_256_CBC_SHA256"

    .line 250
    .line 251
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 252
    .line 253
    .line 254
    const-string v0, "TLS_DHE_RSA_WITH_AES_256_CBC_SHA256"

    .line 255
    .line 256
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 257
    .line 258
    .line 259
    const-string v0, "TLS_DH_anon_WITH_AES_128_CBC_SHA256"

    .line 260
    .line 261
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 262
    .line 263
    .line 264
    const-string v0, "TLS_DH_anon_WITH_AES_256_CBC_SHA256"

    .line 265
    .line 266
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 267
    .line 268
    .line 269
    const-string v0, "TLS_RSA_WITH_CAMELLIA_256_CBC_SHA"

    .line 270
    .line 271
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 272
    .line 273
    .line 274
    const-string v0, "TLS_DHE_DSS_WITH_CAMELLIA_256_CBC_SHA"

    .line 275
    .line 276
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 277
    .line 278
    .line 279
    const-string v0, "TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA"

    .line 280
    .line 281
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 282
    .line 283
    .line 284
    const-string v0, "TLS_PSK_WITH_RC4_128_SHA"

    .line 285
    .line 286
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 287
    .line 288
    .line 289
    const-string v0, "TLS_PSK_WITH_3DES_EDE_CBC_SHA"

    .line 290
    .line 291
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 292
    .line 293
    .line 294
    const-string v0, "TLS_PSK_WITH_AES_128_CBC_SHA"

    .line 295
    .line 296
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 297
    .line 298
    .line 299
    const-string v0, "TLS_PSK_WITH_AES_256_CBC_SHA"

    .line 300
    .line 301
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 302
    .line 303
    .line 304
    const-string v0, "TLS_RSA_WITH_SEED_CBC_SHA"

    .line 305
    .line 306
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 307
    .line 308
    .line 309
    const-string v0, "TLS_RSA_WITH_AES_128_GCM_SHA256"

    .line 310
    .line 311
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/g;->g:Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 316
    .line 317
    const-string v0, "TLS_RSA_WITH_AES_256_GCM_SHA384"

    .line 318
    .line 319
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/g;->h:Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 324
    .line 325
    const-string v0, "TLS_DHE_RSA_WITH_AES_128_GCM_SHA256"

    .line 326
    .line 327
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 328
    .line 329
    .line 330
    const-string v0, "TLS_DHE_RSA_WITH_AES_256_GCM_SHA384"

    .line 331
    .line 332
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 333
    .line 334
    .line 335
    const-string v0, "TLS_DHE_DSS_WITH_AES_128_GCM_SHA256"

    .line 336
    .line 337
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 338
    .line 339
    .line 340
    const-string v0, "TLS_DHE_DSS_WITH_AES_256_GCM_SHA384"

    .line 341
    .line 342
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 343
    .line 344
    .line 345
    const-string v0, "TLS_DH_anon_WITH_AES_128_GCM_SHA256"

    .line 346
    .line 347
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 348
    .line 349
    .line 350
    const-string v0, "TLS_DH_anon_WITH_AES_256_GCM_SHA384"

    .line 351
    .line 352
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 353
    .line 354
    .line 355
    const-string v0, "TLS_EMPTY_RENEGOTIATION_INFO_SCSV"

    .line 356
    .line 357
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 358
    .line 359
    .line 360
    const-string v0, "TLS_FALLBACK_SCSV"

    .line 361
    .line 362
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 363
    .line 364
    .line 365
    const-string v0, "TLS_ECDH_ECDSA_WITH_NULL_SHA"

    .line 366
    .line 367
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 368
    .line 369
    .line 370
    const-string v0, "TLS_ECDH_ECDSA_WITH_RC4_128_SHA"

    .line 371
    .line 372
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 373
    .line 374
    .line 375
    const-string v0, "TLS_ECDH_ECDSA_WITH_3DES_EDE_CBC_SHA"

    .line 376
    .line 377
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 378
    .line 379
    .line 380
    const-string v0, "TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA"

    .line 381
    .line 382
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 383
    .line 384
    .line 385
    const-string v0, "TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA"

    .line 386
    .line 387
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 388
    .line 389
    .line 390
    const-string v0, "TLS_ECDHE_ECDSA_WITH_NULL_SHA"

    .line 391
    .line 392
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 393
    .line 394
    .line 395
    const-string v0, "TLS_ECDHE_ECDSA_WITH_RC4_128_SHA"

    .line 396
    .line 397
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 398
    .line 399
    .line 400
    const-string v0, "TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA"

    .line 401
    .line 402
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 403
    .line 404
    .line 405
    const-string v0, "TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA"

    .line 406
    .line 407
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 408
    .line 409
    .line 410
    const-string v0, "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA"

    .line 411
    .line 412
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 413
    .line 414
    .line 415
    const-string v0, "TLS_ECDH_RSA_WITH_NULL_SHA"

    .line 416
    .line 417
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 418
    .line 419
    .line 420
    const-string v0, "TLS_ECDH_RSA_WITH_RC4_128_SHA"

    .line 421
    .line 422
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 423
    .line 424
    .line 425
    const-string v0, "TLS_ECDH_RSA_WITH_3DES_EDE_CBC_SHA"

    .line 426
    .line 427
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 428
    .line 429
    .line 430
    const-string v0, "TLS_ECDH_RSA_WITH_AES_128_CBC_SHA"

    .line 431
    .line 432
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 433
    .line 434
    .line 435
    const-string v0, "TLS_ECDH_RSA_WITH_AES_256_CBC_SHA"

    .line 436
    .line 437
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 438
    .line 439
    .line 440
    const-string v0, "TLS_ECDHE_RSA_WITH_NULL_SHA"

    .line 441
    .line 442
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 443
    .line 444
    .line 445
    const-string v0, "TLS_ECDHE_RSA_WITH_RC4_128_SHA"

    .line 446
    .line 447
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 448
    .line 449
    .line 450
    const-string v0, "TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA"

    .line 451
    .line 452
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 453
    .line 454
    .line 455
    const-string v0, "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA"

    .line 456
    .line 457
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 458
    .line 459
    .line 460
    move-result-object v0

    .line 461
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/g;->i:Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 462
    .line 463
    const-string v0, "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA"

    .line 464
    .line 465
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 466
    .line 467
    .line 468
    move-result-object v0

    .line 469
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/g;->j:Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 470
    .line 471
    const-string v0, "TLS_ECDH_anon_WITH_NULL_SHA"

    .line 472
    .line 473
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 474
    .line 475
    .line 476
    const-string v0, "TLS_ECDH_anon_WITH_RC4_128_SHA"

    .line 477
    .line 478
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 479
    .line 480
    .line 481
    const-string v0, "TLS_ECDH_anon_WITH_3DES_EDE_CBC_SHA"

    .line 482
    .line 483
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 484
    .line 485
    .line 486
    const-string v0, "TLS_ECDH_anon_WITH_AES_128_CBC_SHA"

    .line 487
    .line 488
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 489
    .line 490
    .line 491
    const-string v0, "TLS_ECDH_anon_WITH_AES_256_CBC_SHA"

    .line 492
    .line 493
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 494
    .line 495
    .line 496
    const-string v0, "TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256"

    .line 497
    .line 498
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 499
    .line 500
    .line 501
    const-string v0, "TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384"

    .line 502
    .line 503
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 504
    .line 505
    .line 506
    const-string v0, "TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256"

    .line 507
    .line 508
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 509
    .line 510
    .line 511
    const-string v0, "TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384"

    .line 512
    .line 513
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 514
    .line 515
    .line 516
    const-string v0, "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256"

    .line 517
    .line 518
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 519
    .line 520
    .line 521
    const-string v0, "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384"

    .line 522
    .line 523
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 524
    .line 525
    .line 526
    const-string v0, "TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256"

    .line 527
    .line 528
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 529
    .line 530
    .line 531
    const-string v0, "TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384"

    .line 532
    .line 533
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 534
    .line 535
    .line 536
    const-string v0, "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256"

    .line 537
    .line 538
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 539
    .line 540
    .line 541
    move-result-object v0

    .line 542
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/g;->k:Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 543
    .line 544
    const-string v0, "TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384"

    .line 545
    .line 546
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 547
    .line 548
    .line 549
    move-result-object v0

    .line 550
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/g;->l:Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 551
    .line 552
    const-string v0, "TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256"

    .line 553
    .line 554
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 555
    .line 556
    .line 557
    const-string v0, "TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384"

    .line 558
    .line 559
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 560
    .line 561
    .line 562
    const-string v0, "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"

    .line 563
    .line 564
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 565
    .line 566
    .line 567
    move-result-object v0

    .line 568
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/g;->m:Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 569
    .line 570
    const-string v0, "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384"

    .line 571
    .line 572
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 573
    .line 574
    .line 575
    move-result-object v0

    .line 576
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/g;->n:Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 577
    .line 578
    const-string v0, "TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256"

    .line 579
    .line 580
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 581
    .line 582
    .line 583
    const-string v0, "TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384"

    .line 584
    .line 585
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 586
    .line 587
    .line 588
    const-string v0, "TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA"

    .line 589
    .line 590
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 591
    .line 592
    .line 593
    const-string v0, "TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA"

    .line 594
    .line 595
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 596
    .line 597
    .line 598
    const-string v0, "TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256"

    .line 599
    .line 600
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 601
    .line 602
    .line 603
    move-result-object v0

    .line 604
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/g;->o:Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 605
    .line 606
    const-string v0, "TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256"

    .line 607
    .line 608
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 609
    .line 610
    .line 611
    move-result-object v0

    .line 612
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/g;->p:Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 613
    .line 614
    const-string v0, "TLS_DHE_RSA_WITH_CHACHA20_POLY1305_SHA256"

    .line 615
    .line 616
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 617
    .line 618
    .line 619
    const-string v0, "TLS_ECDHE_PSK_WITH_CHACHA20_POLY1305_SHA256"

    .line 620
    .line 621
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 622
    .line 623
    .line 624
    const-string v0, "TLS_AES_128_GCM_SHA256"

    .line 625
    .line 626
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 627
    .line 628
    .line 629
    move-result-object v0

    .line 630
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/g;->q:Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 631
    .line 632
    const-string v0, "TLS_AES_256_GCM_SHA384"

    .line 633
    .line 634
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 635
    .line 636
    .line 637
    move-result-object v0

    .line 638
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/g;->r:Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 639
    .line 640
    const-string v0, "TLS_CHACHA20_POLY1305_SHA256"

    .line 641
    .line 642
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 643
    .line 644
    .line 645
    move-result-object v0

    .line 646
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/g;->s:Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 647
    .line 648
    const-string v0, "TLS_AES_128_CCM_SHA256"

    .line 649
    .line 650
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 651
    .line 652
    .line 653
    const-string v0, "TLS_AES_128_CCM_8_SHA256"

    .line 654
    .line 655
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/g;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 656
    .line 657
    .line 658
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/g;->a:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Ljava/lang/String;)I
    .locals 6

    .line 77
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x4

    :goto_0
    const/4 v2, -0x1

    const/4 v3, 0x1

    if-ge v1, v0, :cond_2

    .line 78
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 79
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-eq v4, v5, :cond_1

    if-ge v4, v5, :cond_0

    return v2

    :cond_0
    return v3

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 80
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    .line 81
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-eq p0, p1, :cond_4

    if-ge p0, p1, :cond_3

    return v2

    :cond_3
    return v3

    :cond_4
    const/4 p0, 0x0

    return p0
.end method

.method public static declared-synchronized a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;
    .locals 6

    .line 1
    const-string v0, "TLS_"

    .line 2
    .line 3
    const-string v1, "SSL_"

    .line 4
    .line 5
    const-class v2, Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 6
    .line 7
    monitor-enter v2

    .line 8
    :try_start_0
    sget-object v3, Lcom/tencent/cloud/ai/network/okhttp3/g;->c:Ljava/util/Map;

    .line 9
    .line 10
    invoke-interface {v3, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v4

    .line 14
    check-cast v4, Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 15
    .line 16
    if-nez v4, :cond_3

    .line 17
    .line 18
    const-string v4, "TLS_"

    .line 19
    .line 20
    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    const/4 v5, 0x4

    .line 25
    if-eqz v4, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception p0

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    const-string v1, "SSL_"

    .line 39
    .line 40
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    goto :goto_0

    .line 55
    :cond_1
    move-object v0, p0

    .line 56
    :goto_0
    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 61
    .line 62
    if-nez v0, :cond_2

    .line 63
    .line 64
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 65
    .line 66
    invoke-direct {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/g;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_2
    move-object v4, v0

    .line 70
    invoke-interface {v3, p0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    .line 72
    .line 73
    :cond_3
    monitor-exit v2

    .line 74
    return-object v4

    .line 75
    :goto_1
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 76
    throw p0
.end method

.method public static b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/g;
    .locals 2

    .line 1
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/g;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/g;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/g;->c:Ljava/util/Map;

    .line 7
    .line 8
    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/g;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
