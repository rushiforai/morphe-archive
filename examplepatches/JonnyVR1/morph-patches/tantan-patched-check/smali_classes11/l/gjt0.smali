.class public Ll/gjt0;
.super Landroid/webkit/WebViewClient;
.source "SourceFile"

# interfaces
.implements Ll/nkt0;


# annotations
.annotation build Landroidx/annotation/VisibleForTesting;
    otherwise = 0x3
.end annotation


# static fields
.field public static final synthetic zzb:I


# instance fields
.field private zzA:Z

.field private zzB:I

.field private zzC:Z

.field private final zzD:Ljava/util/HashSet;

.field private final zzE:Ll/qbv0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private zzF:Landroid/view/View$OnAttachStateChangeListener;

.field protected zza:Ll/w8t0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final zzc:Ll/wit0;

.field private final zzd:Ll/fcs0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private final zze:Ljava/util/HashMap;

.field private final zzf:Ljava/lang/Object;

.field private zzg:Ll/har0;

.field private zzh:Ll/joy0;

.field private zzi:Ll/lkt0;

.field private zzj:Ll/mkt0;

.field private zzk:Ll/yns0;

.field private zzl:Ll/aos0;

.field private zzm:Ll/ggu0;

.field private zzn:Z

.field private zzo:Z

.field private zzp:I

.field private zzq:Ljava/lang/String;

.field private zzr:Ljava/lang/String;

.field private zzs:Z

.field private zzt:Z

.field private zzu:Z

.field private zzv:Ll/rar0;

.field private zzw:Ll/r0t0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private zzx:Ll/w9s0;

.field private zzy:Ll/m0t0;

.field private zzz:Z


# direct methods
.method public constructor <init>(Ll/wit0;Ll/fcs0;ZLl/r0t0;Ll/m0t0;Ll/qbv0;)V
    .locals 0
    .param p2    # Ll/fcs0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ll/m0t0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ll/qbv0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p5, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p5}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p5, p0, Ll/gjt0;->zze:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance p5, Ljava/lang/Object;

    .line 12
    .line 13
    invoke-direct {p5}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p5, p0, Ll/gjt0;->zzf:Ljava/lang/Object;

    .line 17
    .line 18
    const/4 p5, 0x0

    .line 19
    iput p5, p0, Ll/gjt0;->zzp:I

    .line 20
    .line 21
    const-string p5, ""

    .line 22
    .line 23
    iput-object p5, p0, Ll/gjt0;->zzq:Ljava/lang/String;

    .line 24
    .line 25
    iput-object p5, p0, Ll/gjt0;->zzr:Ljava/lang/String;

    .line 26
    .line 27
    iput-object p2, p0, Ll/gjt0;->zzd:Ll/fcs0;

    .line 28
    .line 29
    iput-object p1, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 30
    .line 31
    iput-boolean p3, p0, Ll/gjt0;->zzs:Z

    .line 32
    .line 33
    iput-object p4, p0, Ll/gjt0;->zzw:Ll/r0t0;

    .line 34
    .line 35
    const/4 p1, 0x0

    .line 36
    iput-object p1, p0, Ll/gjt0;->zzy:Ll/m0t0;

    .line 37
    .line 38
    new-instance p1, Ljava/util/HashSet;

    .line 39
    .line 40
    sget-object p2, Ll/sgs0;->E5:Ll/dgs0;

    .line 41
    .line 42
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 43
    .line 44
    .line 45
    move-result-object p3

    .line 46
    invoke-virtual {p3, p2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    check-cast p2, Ljava/lang/String;

    .line 51
    .line 52
    const-string p3, ","

    .line 53
    .line 54
    invoke-virtual {p2, p3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-direct {p1, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 63
    .line 64
    .line 65
    iput-object p1, p0, Ll/gjt0;->zzD:Ljava/util/HashSet;

    .line 66
    .line 67
    iput-object p6, p0, Ll/gjt0;->zzE:Ll/qbv0;

    .line 68
    .line 69
    return-void
.end method

.method private static zzO()Landroid/webkit/WebResourceResponse;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-object v0, Ll/sgs0;->J0:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    new-instance v0, Landroid/webkit/WebResourceResponse;

    .line 20
    .line 21
    new-instance v1, Ljava/io/ByteArrayInputStream;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    new-array v2, v2, [B

    .line 25
    .line 26
    invoke-direct {v1, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 27
    .line 28
    .line 29
    const-string v2, ""

    .line 30
    .line 31
    invoke-direct {v0, v2, v2, v1}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)V

    .line 32
    .line 33
    .line 34
    return-object v0

    .line 35
    :cond_0
    const/4 v0, 0x0

    .line 36
    return-object v0
.end method

.method private final zzP(Ljava/lang/String;Ljava/util/Map;)Landroid/webkit/WebResourceResponse;
    .locals 13
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/net/URL;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/16 p1, 0x108

    .line 7
    .line 8
    :try_start_0
    invoke-static {p1}, Landroid/net/TrafficStats;->setThreadStatsTag(I)V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    move v1, p1

    .line 13
    :goto_0
    const/4 v2, 0x1

    .line 14
    add-int/2addr v1, v2

    .line 15
    const/16 v3, 0x14

    .line 16
    .line 17
    const/4 v4, 0x0

    .line 18
    if-gt v1, v3, :cond_e

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    const/16 v5, 0x2710

    .line 25
    .line 26
    invoke-virtual {v3, v5}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v3, v5}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v6

    .line 44
    if-eqz v6, :cond_0

    .line 45
    .line 46
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v6

    .line 50
    check-cast v6, Ljava/util/Map$Entry;

    .line 51
    .line 52
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v7

    .line 56
    check-cast v7, Ljava/lang/String;

    .line 57
    .line 58
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    check-cast v6, Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v3, v7, v6}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_0
    instance-of v5, v3, Ljava/net/HttpURLConnection;

    .line 69
    .line 70
    if-eqz v5, :cond_d

    .line 71
    .line 72
    move-object v10, v3

    .line 73
    check-cast v10, Ljava/net/HttpURLConnection;

    .line 74
    .line 75
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 76
    .line 77
    .line 78
    move-result-object v6

    .line 79
    iget-object v3, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 80
    .line 81
    invoke-interface {v3}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 82
    .line 83
    .line 84
    move-result-object v7

    .line 85
    iget-object v3, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 86
    .line 87
    invoke-interface {v3}, Ll/wit0;->zzn()Lcom/google/android/gms/internal/ads/zzcei;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    iget-object v8, v3, Lcom/google/android/gms/internal/ads/zzcei;->zza:Ljava/lang/String;

    .line 92
    .line 93
    const/4 v11, 0x0

    .line 94
    const v12, 0xea60

    .line 95
    .line 96
    .line 97
    const/4 v9, 0x0

    .line 98
    invoke-virtual/range {v6 .. v12}, Lcom/google/android/gms/ads/internal/util/b;->H(Landroid/content/Context;Ljava/lang/String;ZLjava/net/HttpURLConnection;ZI)V

    .line 99
    .line 100
    .line 101
    new-instance v3, Ll/cct0;

    .line 102
    .line 103
    invoke-direct {v3, v4}, Ll/cct0;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v3, v10, v4}, Ll/cct0;->c(Ljava/net/HttpURLConnection;[B)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 110
    .line 111
    .line 112
    move-result v5

    .line 113
    invoke-virtual {v3, v10, v5}, Ll/cct0;->e(Ljava/net/HttpURLConnection;I)V

    .line 114
    .line 115
    .line 116
    const/16 v3, 0x12c

    .line 117
    .line 118
    if-lt v5, v3, :cond_5

    .line 119
    .line 120
    const/16 v3, 0x190

    .line 121
    .line 122
    if-ge v5, v3, :cond_5

    .line 123
    .line 124
    const-string v2, "Location"

    .line 125
    .line 126
    invoke-virtual {v10, v2}, Ljava/net/URLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    if-eqz v2, :cond_4

    .line 131
    .line 132
    const-string v3, "tel:"

    .line 133
    .line 134
    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    if-eqz v3, :cond_1

    .line 139
    .line 140
    goto/16 :goto_7

    .line 141
    .line 142
    :cond_1
    new-instance v3, Ljava/net/URL;

    .line 143
    .line 144
    invoke-direct {v3, v0, v2}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v3}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    if-nez v0, :cond_2

    .line 152
    .line 153
    const-string p0, "Protocol is null"

    .line 154
    .line 155
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    invoke-static {}, Ll/gjt0;->zzO()Landroid/webkit/WebResourceResponse;

    .line 159
    .line 160
    .line 161
    move-result-object v4

    .line 162
    goto/16 :goto_7

    .line 163
    .line 164
    :cond_2
    const-string v4, "http"

    .line 165
    .line 166
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-result v4

    .line 170
    if-nez v4, :cond_3

    .line 171
    .line 172
    const-string v4, "https"

    .line 173
    .line 174
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result v4

    .line 178
    if-nez v4, :cond_3

    .line 179
    .line 180
    new-instance p0, Ljava/lang/StringBuilder;

    .line 181
    .line 182
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 183
    .line 184
    .line 185
    const-string p1, "Unsupported scheme: "

    .line 186
    .line 187
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    invoke-static {}, Ll/gjt0;->zzO()Landroid/webkit/WebResourceResponse;

    .line 201
    .line 202
    .line 203
    move-result-object v4

    .line 204
    goto/16 :goto_7

    .line 205
    .line 206
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 207
    .line 208
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 209
    .line 210
    .line 211
    const-string v4, "Redirecting to "

    .line 212
    .line 213
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    invoke-static {v0}, Ll/dct0;->b(Ljava/lang/String;)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 227
    .line 228
    .line 229
    move-object v0, v3

    .line 230
    goto/16 :goto_0

    .line 231
    .line 232
    :cond_4
    new-instance p0, Ljava/io/IOException;

    .line 233
    .line 234
    const-string p1, "Missing Location header in redirect"

    .line 235
    .line 236
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    throw p0

    .line 240
    :cond_5
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 241
    .line 242
    .line 243
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v10}, Ljava/net/URLConnection;->getContentType()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object p0

    .line 250
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 251
    .line 252
    .line 253
    move-result p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 254
    const-string v0, ";"

    .line 255
    .line 256
    const-string v1, ""

    .line 257
    .line 258
    if-eqz p2, :cond_6

    .line 259
    .line 260
    move-object v4, v1

    .line 261
    goto :goto_2

    .line 262
    :cond_6
    :try_start_1
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object p0

    .line 266
    aget-object p0, p0, p1

    .line 267
    .line 268
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object p0

    .line 272
    move-object v4, p0

    .line 273
    :goto_2
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 274
    .line 275
    .line 276
    invoke-virtual {v10}, Ljava/net/URLConnection;->getContentType()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object p0

    .line 280
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 281
    .line 282
    .line 283
    move-result p2

    .line 284
    if-eqz p2, :cond_8

    .line 285
    .line 286
    :cond_7
    :goto_3
    move-object v5, v1

    .line 287
    goto :goto_5

    .line 288
    :cond_8
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object p0

    .line 292
    array-length p2, p0

    .line 293
    if-ne p2, v2, :cond_9

    .line 294
    .line 295
    goto :goto_3

    .line 296
    :cond_9
    move p2, v2

    .line 297
    :goto_4
    array-length v0, p0

    .line 298
    if-ge p2, v0, :cond_7

    .line 299
    .line 300
    aget-object v0, p0, p2

    .line 301
    .line 302
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    const-string v3, "charset"

    .line 307
    .line 308
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 309
    .line 310
    .line 311
    move-result v0

    .line 312
    if-eqz v0, :cond_a

    .line 313
    .line 314
    aget-object v0, p0, p2

    .line 315
    .line 316
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    const-string v3, "="

    .line 321
    .line 322
    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object v0

    .line 326
    array-length v3, v0

    .line 327
    if-le v3, v2, :cond_a

    .line 328
    .line 329
    aget-object p0, v0, v2

    .line 330
    .line 331
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object v1

    .line 335
    goto :goto_3

    .line 336
    :cond_a
    add-int/lit8 p2, p2, 0x1

    .line 337
    .line 338
    goto :goto_4

    .line 339
    :goto_5
    invoke-virtual {v10}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;

    .line 340
    .line 341
    .line 342
    move-result-object p0

    .line 343
    new-instance v8, Ljava/util/HashMap;

    .line 344
    .line 345
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 346
    .line 347
    .line 348
    move-result p2

    .line 349
    invoke-direct {v8, p2}, Ljava/util/HashMap;-><init>(I)V

    .line 350
    .line 351
    .line 352
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 353
    .line 354
    .line 355
    move-result-object p0

    .line 356
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 357
    .line 358
    .line 359
    move-result-object p0

    .line 360
    :cond_b
    :goto_6
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 361
    .line 362
    .line 363
    move-result p2

    .line 364
    if-eqz p2, :cond_c

    .line 365
    .line 366
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 367
    .line 368
    .line 369
    move-result-object p2

    .line 370
    check-cast p2, Ljava/util/Map$Entry;

    .line 371
    .line 372
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 373
    .line 374
    .line 375
    move-result-object v0

    .line 376
    if-eqz v0, :cond_b

    .line 377
    .line 378
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 379
    .line 380
    .line 381
    move-result-object v0

    .line 382
    if-eqz v0, :cond_b

    .line 383
    .line 384
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 385
    .line 386
    .line 387
    move-result-object v0

    .line 388
    check-cast v0, Ljava/util/List;

    .line 389
    .line 390
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 391
    .line 392
    .line 393
    move-result v0

    .line 394
    if-nez v0, :cond_b

    .line 395
    .line 396
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 397
    .line 398
    .line 399
    move-result-object v0

    .line 400
    check-cast v0, Ljava/lang/String;

    .line 401
    .line 402
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 403
    .line 404
    .line 405
    move-result-object p2

    .line 406
    check-cast p2, Ljava/util/List;

    .line 407
    .line 408
    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 409
    .line 410
    .line 411
    move-result-object p2

    .line 412
    check-cast p2, Ljava/lang/String;

    .line 413
    .line 414
    invoke-interface {v8, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 415
    .line 416
    .line 417
    goto :goto_6

    .line 418
    :cond_c
    invoke-static {}, Ll/bxy0;->s()Ll/ccr0;

    .line 419
    .line 420
    .line 421
    move-result-object v3

    .line 422
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 423
    .line 424
    .line 425
    move-result v6

    .line 426
    invoke-virtual {v10}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    .line 427
    .line 428
    .line 429
    move-result-object v7

    .line 430
    invoke-virtual {v10}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 431
    .line 432
    .line 433
    move-result-object v9

    .line 434
    invoke-virtual/range {v3 .. v9}, Ll/ccr0;->b(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/io/InputStream;)Landroid/webkit/WebResourceResponse;

    .line 435
    .line 436
    .line 437
    move-result-object v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 438
    :goto_7
    invoke-static {}, Landroid/net/TrafficStats;->clearThreadStatsTag()V

    .line 439
    .line 440
    .line 441
    return-object v4

    .line 442
    :cond_d
    :try_start_2
    new-instance p0, Ljava/io/IOException;

    .line 443
    .line 444
    const-string p1, "Invalid protocol."

    .line 445
    .line 446
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 447
    .line 448
    .line 449
    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 450
    :cond_e
    invoke-static {}, Landroid/net/TrafficStats;->clearThreadStatsTag()V

    .line 451
    .line 452
    .line 453
    const-string p0, "Too many redirects (20)"

    .line 454
    .line 455
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 456
    .line 457
    .line 458
    return-object v4

    .line 459
    :catchall_0
    move-exception v0

    .line 460
    move-object p0, v0

    .line 461
    invoke-static {}, Landroid/net/TrafficStats;->clearThreadStatsTag()V

    .line 462
    .line 463
    .line 464
    throw p0
.end method

.method private final zzQ(Ljava/util/Map;Ljava/util/List;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/d2v0;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "Received GMSG: "

    .line 8
    .line 9
    invoke-virtual {v0, p3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-static {p3}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    invoke-interface {p3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ljava/lang/String;

    .line 35
    .line 36
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Ljava/lang/String;

    .line 41
    .line 42
    new-instance v2, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v3, "  "

    .line 45
    .line 46
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v0, ": "

    .line 53
    .line 54
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 73
    .line 74
    .line 75
    move-result p3

    .line 76
    if-eqz p3, :cond_1

    .line 77
    .line 78
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    check-cast p3, Ll/bqs0;

    .line 83
    .line 84
    iget-object v0, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 85
    .line 86
    invoke-interface {p3, v0, p1}, Ll/bqs0;->a(Ljava/lang/Object;Ljava/util/Map;)V

    .line 87
    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_1
    return-void
.end method

.method private final zzR()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gjt0;->zzF:Landroid/view/View$OnAttachStateChangeListener;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p0, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 7
    .line 8
    check-cast p0, Landroid/view/View;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private final zzS(Landroid/view/View;Ll/w8t0;I)V
    .locals 2

    .line 1
    invoke-interface {p2}, Ll/w8t0;->zzi()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-lez p3, :cond_0

    .line 8
    .line 9
    invoke-interface {p2, p1}, Ll/w8t0;->a(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p2}, Ll/w8t0;->zzi()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    sget-object v0, Lcom/google/android/gms/ads/internal/util/b;->l:Ll/ukw0;

    .line 19
    .line 20
    new-instance v1, Ll/xit0;

    .line 21
    .line 22
    invoke-direct {v1, p0, p1, p2, p3}, Ll/xit0;-><init>(Ll/gjt0;Landroid/view/View;Ll/w8t0;I)V

    .line 23
    .line 24
    .line 25
    const-wide/16 p0, 0x64

    .line 26
    .line 27
    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method private static final zzT(Ll/wit0;)Z
    .locals 1

    .line 1
    invoke-interface {p0}, Ll/wit0;->c()Ll/q6w0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/wit0;->c()Ll/q6w0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-boolean p0, p0, Ll/q6w0;->j0:Z

    .line 12
    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method private static final zzU(ZLl/wit0;)Z
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ll/wit0;->zzO()Ll/xkt0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/xkt0;->i()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    invoke-interface {p1}, Ll/wit0;->e()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "interstitial_mb"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public static bridge synthetic zze(Ll/gjt0;Ljava/util/Map;Ljava/util/List;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/gjt0;->zzQ(Ljava/util/Map;Ljava/util/List;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic zzf(Ll/gjt0;Landroid/view/View;Ll/w8t0;I)V
    .locals 0

    .line 1
    const/16 p3, 0xa

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, p3}, Ll/gjt0;->zzS(Landroid/view/View;Ll/w8t0;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onAdClicked()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gjt0;->zzg:Ll/har0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/har0;->onAdClicked()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string p1, "Loading resource: "

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    const-string v0, "gmsg"

    .line 23
    .line 24
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_0

    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    const-string v0, "mobileads.google.com"

    .line 35
    .line 36
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    if-eqz p2, :cond_0

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/gjt0;->zzj(Landroid/net/Uri;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public final onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/gjt0;->zzf:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p1

    .line 4
    :try_start_0
    iget-object v0, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 5
    .line 6
    invoke-interface {v0}, Ll/wit0;->V()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p2, "Blank page loaded, 1..."

    .line 13
    .line 14
    invoke-static {p2}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/wit0;->zzV()V

    .line 20
    .line 21
    .line 22
    monitor-exit p1

    .line 23
    return-void

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    const/4 p1, 0x1

    .line 28
    iput-boolean p1, p0, Ll/gjt0;->zzz:Z

    .line 29
    .line 30
    iget-object p1, p0, Ll/gjt0;->zzj:Ll/mkt0;

    .line 31
    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    invoke-interface {p1}, Ll/mkt0;->zza()V

    .line 35
    .line 36
    .line 37
    const/4 p1, 0x0

    .line 38
    iput-object p1, p0, Ll/gjt0;->zzj:Ll/mkt0;

    .line 39
    .line 40
    :cond_1
    invoke-virtual {p0}, Ll/gjt0;->zzg()V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 44
    .line 45
    invoke-interface {p1}, Ll/wit0;->zzL()Lcom/google/android/gms/ads/internal/overlay/b;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    if-eqz p1, :cond_2

    .line 50
    .line 51
    sget-object p1, Ll/sgs0;->mb:Ll/dgs0;

    .line 52
    .line 53
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_2

    .line 68
    .line 69
    iget-object p0, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 70
    .line 71
    invoke-interface {p0}, Ll/wit0;->zzL()Lcom/google/android/gms/ads/internal/overlay/b;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0, p2}, Lcom/google/android/gms/ads/internal/overlay/b;->t8(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_2
    return-void

    .line 79
    :goto_0
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 80
    throw p0
.end method

.method public final onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/gjt0;->zzo:Z

    .line 3
    .line 4
    iput p2, p0, Ll/gjt0;->zzp:I

    .line 5
    .line 6
    iput-object p3, p0, Ll/gjt0;->zzq:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p4, p0, Ll/gjt0;->zzr:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public final onRenderProcessGone(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)Z
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0x1a
    .end annotation

    .line 1
    iget-object p0, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 2
    .line 3
    invoke-static {p2}, Ll/ejt0;->a(Landroid/webkit/RenderProcessGoneDetail;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-static {p2}, Ll/fjt0;->a(Landroid/webkit/RenderProcessGoneDetail;)I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    invoke-interface {p0, p1, p2}, Ll/wit0;->J(ZI)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public final shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-object p1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 2
    .line 3
    invoke-virtual {p0, p2, p1}, Ll/gjt0;->zzc(Ljava/lang/String;Ljava/util/Map;)Landroid/webkit/WebResourceResponse;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final shouldOverrideKeyEvent(Landroid/webkit/WebView;Landroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/16 p1, 0x4f

    .line 6
    .line 7
    if-eq p0, p1, :cond_0

    .line 8
    .line 9
    const/16 p1, 0xde

    .line 10
    .line 11
    if-eq p0, p1, :cond_0

    .line 12
    .line 13
    packed-switch p0, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    packed-switch p0, :pswitch_data_1

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :cond_0
    :pswitch_0
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :pswitch_data_0
    .packed-switch 0x55
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch

    .line 24
    .line 25
    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    .line 41
    :pswitch_data_1
    .packed-switch 0x7e
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 12

    .line 1
    const-string v0, "AdWebView shouldOverrideUrlLoading: "

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "gmsg"

    .line 23
    .line 24
    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    const/4 v2, 0x1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v3, "mobileads.google.com"

    .line 36
    .line 37
    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ll/gjt0;->zzj(Landroid/net/Uri;)V

    .line 44
    .line 45
    .line 46
    goto/16 :goto_2

    .line 47
    .line 48
    :cond_0
    iget-boolean v1, p0, Ll/gjt0;->zzn:Z

    .line 49
    .line 50
    if-eqz v1, :cond_5

    .line 51
    .line 52
    iget-object v1, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 53
    .line 54
    invoke-interface {v1}, Ll/wit0;->L()Landroid/webkit/WebView;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    if-ne p1, v1, :cond_5

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    const-string v3, "http"

    .line 65
    .line 66
    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-nez v3, :cond_1

    .line 71
    .line 72
    const-string v3, "https"

    .line 73
    .line 74
    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_5

    .line 79
    .line 80
    :cond_1
    iget-object v0, p0, Ll/gjt0;->zzg:Ll/har0;

    .line 81
    .line 82
    const/4 v1, 0x0

    .line 83
    if-eqz v0, :cond_3

    .line 84
    .line 85
    invoke-interface {v0}, Ll/har0;->onAdClicked()V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/gjt0;->zza:Ll/w8t0;

    .line 89
    .line 90
    if-eqz v0, :cond_2

    .line 91
    .line 92
    invoke-interface {v0, p2}, Ll/w8t0;->A(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    :cond_2
    iput-object v1, p0, Ll/gjt0;->zzg:Ll/har0;

    .line 96
    .line 97
    :cond_3
    iget-object v0, p0, Ll/gjt0;->zzm:Ll/ggu0;

    .line 98
    .line 99
    if-eqz v0, :cond_4

    .line 100
    .line 101
    invoke-interface {v0}, Ll/ggu0;->zzs()V

    .line 102
    .line 103
    .line 104
    iput-object v1, p0, Ll/gjt0;->zzm:Ll/ggu0;

    .line 105
    .line 106
    :cond_4
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    return p0

    .line 111
    :cond_5
    iget-object p1, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 112
    .line 113
    invoke-interface {p1}, Ll/wit0;->L()Landroid/webkit/WebView;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p1}, Landroid/view/View;->willNotDraw()Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-nez p1, :cond_a

    .line 122
    .line 123
    :try_start_0
    iget-object p1, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 124
    .line 125
    invoke-interface {p1}, Ll/wit0;->p()Ll/v2s0;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    iget-object v1, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 130
    .line 131
    invoke-interface {v1}, Ll/wit0;->f()Ll/s7w0;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    sget-object v3, Ll/sgs0;->rb:Ll/dgs0;

    .line 136
    .line 137
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    check-cast v3, Ljava/lang/Boolean;

    .line 146
    .line 147
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 148
    .line 149
    .line 150
    move-result v3

    .line 151
    if-eqz v3, :cond_6

    .line 152
    .line 153
    if-eqz v1, :cond_6

    .line 154
    .line 155
    if-eqz p1, :cond_7

    .line 156
    .line 157
    invoke-virtual {p1, v0}, Ll/v2s0;->f(Landroid/net/Uri;)Z

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    if-eqz p1, :cond_7

    .line 162
    .line 163
    iget-object p1, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 164
    .line 165
    invoke-interface {p1}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    iget-object v3, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 170
    .line 171
    invoke-interface {v3}, Ll/wit0;->zzi()Landroid/app/Activity;

    .line 172
    .line 173
    .line 174
    move-result-object v4

    .line 175
    check-cast v3, Landroid/view/View;

    .line 176
    .line 177
    invoke-virtual {v1, v0, p1, v3, v4}, Ll/s7w0;->a(Landroid/net/Uri;Landroid/content/Context;Landroid/view/View;Landroid/app/Activity;)Landroid/net/Uri;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    goto :goto_0

    .line 182
    :cond_6
    if-eqz p1, :cond_7

    .line 183
    .line 184
    invoke-virtual {p1, v0}, Ll/v2s0;->f(Landroid/net/Uri;)Z

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    if-eqz v1, :cond_7

    .line 189
    .line 190
    iget-object v1, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 191
    .line 192
    invoke-interface {v1}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    iget-object v3, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 197
    .line 198
    invoke-interface {v3}, Ll/wit0;->zzi()Landroid/app/Activity;

    .line 199
    .line 200
    .line 201
    move-result-object v4

    .line 202
    check-cast v3, Landroid/view/View;

    .line 203
    .line 204
    invoke-virtual {p1, v0, v1, v3, v4}, Ll/v2s0;->a(Landroid/net/Uri;Landroid/content/Context;Landroid/view/View;Landroid/app/Activity;)Landroid/net/Uri;

    .line 205
    .line 206
    .line 207
    move-result-object v0
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzavj; {:try_start_0 .. :try_end_0} :catch_0

    .line 208
    goto :goto_0

    .line 209
    :catch_0
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    const-string v1, "Unable to append parameter to URL: "

    .line 214
    .line 215
    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    invoke-static {p1}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    :cond_7
    :goto_0
    iget-object p1, p0, Ll/gjt0;->zzx:Ll/w9s0;

    .line 223
    .line 224
    if-eqz p1, :cond_9

    .line 225
    .line 226
    invoke-virtual {p1}, Ll/w9s0;->c()Z

    .line 227
    .line 228
    .line 229
    move-result v1

    .line 230
    if-eqz v1, :cond_8

    .line 231
    .line 232
    goto :goto_1

    .line 233
    :cond_8
    invoke-virtual {p1, p2}, Ll/w9s0;->b(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    goto :goto_2

    .line 237
    :cond_9
    :goto_1
    new-instance v3, Lcom/google/android/gms/ads/internal/overlay/zzc;

    .line 238
    .line 239
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v5

    .line 243
    const/4 v10, 0x0

    .line 244
    const/4 v11, 0x0

    .line 245
    const-string v4, "android.intent.action.VIEW"

    .line 246
    .line 247
    const/4 v6, 0x0

    .line 248
    const/4 v7, 0x0

    .line 249
    const/4 v8, 0x0

    .line 250
    const/4 v9, 0x0

    .line 251
    invoke-direct/range {v3 .. v11}, Lcom/google/android/gms/ads/internal/overlay/zzc;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/v4z0;)V

    .line 252
    .line 253
    .line 254
    invoke-virtual {p0, v3, v2}, Ll/gjt0;->zzu(Lcom/google/android/gms/ads/internal/overlay/zzc;Z)V

    .line 255
    .line 256
    .line 257
    goto :goto_2

    .line 258
    :cond_a
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    const-string p1, "AdWebView unable to handle URL: "

    .line 263
    .line 264
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object p0

    .line 268
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    :goto_2
    return v2
.end method

.method public final zzA(Ljava/lang/String;Ll/bqs0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gjt0;->zzf:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/gjt0;->zze:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Ljava/util/List;

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/gjt0;->zze:Ljava/util/HashMap;

    .line 20
    .line 21
    invoke-virtual {p0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    :goto_0
    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    monitor-exit v0

    .line 31
    return-void

    .line 32
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    throw p0
.end method

.method public final zzB(Ll/lkt0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gjt0;->zzi:Ll/lkt0;

    .line 2
    .line 3
    return-void
.end method

.method public final zzC(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gjt0;->zzy:Ll/m0t0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/m0t0;->l(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final zzD(Z)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/gjt0;->zzn:Z

    .line 3
    .line 4
    return-void
.end method

.method public final zzE(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gjt0;->zzf:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iput-boolean p1, p0, Ll/gjt0;->zzu:Z

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public final zzF()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gjt0;->zzf:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iput-boolean v1, p0, Ll/gjt0;->zzn:Z

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput-boolean v1, p0, Ll/gjt0;->zzs:Z

    .line 9
    .line 10
    sget-object v1, Ll/oct0;->e:Ll/xvw0;

    .line 11
    .line 12
    new-instance v2, Ll/yit0;

    .line 13
    .line 14
    invoke-direct {v2, p0}, Ll/yit0;-><init>(Ll/gjt0;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public final zzG(Z)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/gjt0;->zzf:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p1

    .line 4
    const/4 v0, 0x1

    .line 5
    :try_start_0
    iput-boolean v0, p0, Ll/gjt0;->zzt:Z

    .line 6
    .line 7
    monitor-exit p1

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p0

    .line 10
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    throw p0
.end method

.method public final zzH(Ll/mkt0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gjt0;->zzj:Ll/mkt0;

    .line 2
    .line 3
    return-void
.end method

.method public final zzI(Ljava/lang/String;Ll/bqs0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gjt0;->zzf:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/gjt0;->zze:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ljava/util/List;

    .line 11
    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-interface {p0, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    monitor-exit v0

    .line 22
    return-void

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public final zzJ(Ljava/lang/String;Lcom/google/android/gms/common/util/Predicate;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/gjt0;->zzf:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/gjt0;->zze:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ljava/util/List;

    .line 11
    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Ll/bqs0;

    .line 38
    .line 39
    invoke-interface {p2, v2}, Lcom/google/android/gms/common/util/Predicate;->apply(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-eqz v3, :cond_1

    .line 44
    .line 45
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    invoke-interface {p0, p1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 50
    .line 51
    .line 52
    monitor-exit v0

    .line 53
    return-void

    .line 54
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    throw p0
.end method

.method public final zzK()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gjt0;->zzf:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean p0, p0, Ll/gjt0;->zzu:Z

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public final zzL()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gjt0;->zzf:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean p0, p0, Ll/gjt0;->zzs:Z

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public final zzM()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gjt0;->zzf:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean p0, p0, Ll/gjt0;->zzt:Z

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public final zzN(Ll/har0;Ll/yns0;Ll/joy0;Ll/aos0;Ll/rar0;ZLl/dqs0;Ll/w9s0;Ll/t0t0;Ll/w8t0;Ll/fbv0;Ll/yew0;Ll/xwu0;Ll/vcw0;Ll/uqs0;Ll/ggu0;Ll/tqs0;Ll/nqs0;Ll/dut0;)V
    .locals 16
    .param p1    # Ll/har0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/yns0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ll/joy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ll/aos0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Ll/rar0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p7    # Ll/dqs0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # Ll/w9s0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p9    # Ll/t0t0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p10    # Ll/w8t0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p11    # Ll/fbv0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p12    # Ll/yew0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p13    # Ll/xwu0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p14    # Ll/vcw0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p15    # Ll/uqs0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p16    # Ll/ggu0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p17    # Ll/tqs0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p18    # Ll/nqs0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p19    # Ll/dut0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    move-object/from16 v3, p7

    move-object/from16 v4, p9

    move-object/from16 v5, p10

    move-object/from16 v11, p12

    move-object/from16 v12, p15

    move-object/from16 v13, p16

    move-object/from16 v14, p17

    move-object/from16 v15, p18

    if-nez p8, :cond_0

    .line 1
    iget-object v6, v0, Ll/gjt0;->zzc:Ll/wit0;

    new-instance v7, Ll/w9s0;

    invoke-interface {v6}, Ll/wit0;->getContext()Landroid/content/Context;

    move-result-object v6

    const/4 v8, 0x0

    invoke-direct {v7, v6, v5, v8}, Ll/w9s0;-><init>(Landroid/content/Context;Ll/w8t0;Lcom/google/android/gms/internal/ads/zzbyk;)V

    goto :goto_0

    :cond_0
    move-object/from16 v7, p8

    :goto_0
    iget-object v6, v0, Ll/gjt0;->zzc:Ll/wit0;

    .line 2
    new-instance v8, Ll/m0t0;

    invoke-direct {v8, v6, v4}, Ll/m0t0;-><init>(Ll/wit0;Ll/t0t0;)V

    iput-object v8, v0, Ll/gjt0;->zzy:Ll/m0t0;

    iput-object v5, v0, Ll/gjt0;->zza:Ll/w8t0;

    .line 3
    sget-object v5, Ll/sgs0;->R0:Ll/dgs0;

    .line 4
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    move-result-object v6

    invoke-virtual {v6, v5}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    move-result-object v5

    .line 5
    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_1

    new-instance v5, Ll/xns0;

    invoke-direct {v5, v1}, Ll/xns0;-><init>(Ll/yns0;)V

    const-string v6, "/adMetadata"

    .line 6
    invoke-virtual {v0, v6, v5}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    :cond_1
    if-eqz v2, :cond_2

    new-instance v5, Ll/zns0;

    invoke-direct {v5, v2}, Ll/zns0;-><init>(Ll/aos0;)V

    const-string v6, "/appEvent"

    .line 7
    invoke-virtual {v0, v6, v5}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    :cond_2
    const-string v5, "/backButton"

    .line 8
    sget-object v6, Ll/aqs0;->j:Ll/bqs0;

    invoke-virtual {v0, v5, v6}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    const-string v5, "/refresh"

    sget-object v6, Ll/aqs0;->k:Ll/bqs0;

    .line 9
    invoke-virtual {v0, v5, v6}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    const-string v5, "/canOpenApp"

    sget-object v6, Ll/aqs0;->b:Ll/bqs0;

    .line 10
    invoke-virtual {v0, v5, v6}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    const-string v5, "/canOpenURLs"

    sget-object v6, Ll/aqs0;->a:Ll/bqs0;

    .line 11
    invoke-virtual {v0, v5, v6}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    const-string v5, "/canOpenIntents"

    sget-object v6, Ll/aqs0;->c:Ll/bqs0;

    .line 12
    invoke-virtual {v0, v5, v6}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    const-string v5, "/close"

    sget-object v6, Ll/aqs0;->d:Ll/bqs0;

    .line 13
    invoke-virtual {v0, v5, v6}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    const-string v5, "/customClose"

    sget-object v6, Ll/aqs0;->e:Ll/bqs0;

    .line 14
    invoke-virtual {v0, v5, v6}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    const-string v5, "/instrument"

    sget-object v6, Ll/aqs0;->n:Ll/bqs0;

    .line 15
    invoke-virtual {v0, v5, v6}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    const-string v5, "/delayPageLoaded"

    sget-object v6, Ll/aqs0;->p:Ll/bqs0;

    .line 16
    invoke-virtual {v0, v5, v6}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    const-string v5, "/delayPageClosed"

    sget-object v6, Ll/aqs0;->q:Ll/bqs0;

    .line 17
    invoke-virtual {v0, v5, v6}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    const-string v5, "/getLocationInfo"

    sget-object v6, Ll/aqs0;->r:Ll/bqs0;

    .line 18
    invoke-virtual {v0, v5, v6}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    const-string v5, "/log"

    sget-object v6, Ll/aqs0;->g:Ll/bqs0;

    .line 19
    invoke-virtual {v0, v5, v6}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    .line 20
    new-instance v5, Ll/hqs0;

    iget-object v6, v0, Ll/gjt0;->zzy:Ll/m0t0;

    invoke-direct {v5, v7, v6, v4}, Ll/hqs0;-><init>(Ll/w9s0;Ll/m0t0;Ll/t0t0;)V

    const-string v4, "/mraid"

    invoke-virtual {v0, v4, v5}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    iget-object v4, v0, Ll/gjt0;->zzw:Ll/r0t0;

    if-eqz v4, :cond_3

    const-string v5, "/mraidLoaded"

    .line 21
    invoke-virtual {v0, v5, v4}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    :cond_3
    new-instance v4, Ll/mqs0;

    iget-object v6, v0, Ll/gjt0;->zzy:Ll/m0t0;

    move-object/from16 v8, p13

    move-object/from16 v9, p14

    move-object/from16 v10, p19

    move-object v5, v7

    move-object/from16 v7, p11

    .line 22
    invoke-direct/range {v4 .. v10}, Ll/mqs0;-><init>(Ll/w9s0;Ll/m0t0;Ll/fbv0;Ll/xwu0;Ll/vcw0;Ll/dut0;)V

    const-string v6, "/open"

    invoke-virtual {v0, v6, v4}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    new-instance v4, Ll/vgt0;

    invoke-direct {v4}, Ll/vgt0;-><init>()V

    const-string v6, "/precache"

    .line 23
    invoke-virtual {v0, v6, v4}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    const-string v4, "/touch"

    sget-object v6, Ll/aqs0;->i:Ll/bqs0;

    .line 24
    invoke-virtual {v0, v4, v6}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    const-string v4, "/video"

    sget-object v6, Ll/aqs0;->l:Ll/bqs0;

    .line 25
    invoke-virtual {v0, v4, v6}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    const-string v4, "/videoMeta"

    sget-object v6, Ll/aqs0;->m:Ll/bqs0;

    .line 26
    invoke-virtual {v0, v4, v6}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    const-string v4, "/httpTrack"

    const-string v6, "/click"

    if-eqz v7, :cond_4

    if-eqz v11, :cond_4

    new-instance v8, Ll/v7w0;

    invoke-direct {v8, v13, v10, v11, v7}, Ll/v7w0;-><init>(Ll/ggu0;Ll/dut0;Ll/yew0;Ll/fbv0;)V

    .line 27
    invoke-virtual {v0, v6, v8}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    new-instance v6, Ll/w7w0;

    invoke-direct {v6, v11, v7}, Ll/w7w0;-><init>(Ll/yew0;Ll/fbv0;)V

    .line 28
    invoke-virtual {v0, v4, v6}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    goto :goto_1

    .line 29
    :cond_4
    new-instance v7, Ll/pos0;

    invoke-direct {v7, v13, v10}, Ll/pos0;-><init>(Ll/ggu0;Ll/dut0;)V

    .line 30
    invoke-virtual {v0, v6, v7}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    sget-object v6, Ll/aqs0;->f:Ll/bqs0;

    .line 31
    invoke-virtual {v0, v4, v6}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    .line 32
    :goto_1
    iget-object v4, v0, Ll/gjt0;->zzc:Ll/wit0;

    .line 33
    invoke-static {}, Ll/bxy0;->p()Ll/s9t0;

    move-result-object v6

    invoke-interface {v4}, Ll/wit0;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v6, v4}, Ll/s9t0;->p(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_5

    iget-object v4, v0, Ll/gjt0;->zzc:Ll/wit0;

    new-instance v6, Ll/gqs0;

    .line 34
    invoke-interface {v4}, Ll/wit0;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v6, v4}, Ll/gqs0;-><init>(Landroid/content/Context;)V

    const-string v4, "/logScionEvent"

    .line 35
    invoke-virtual {v0, v4, v6}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    :cond_5
    if-eqz v3, :cond_6

    new-instance v4, Ll/cqs0;

    invoke-direct {v4, v3}, Ll/cqs0;-><init>(Ll/dqs0;)V

    const-string v3, "/setInterstitialProperties"

    .line 36
    invoke-virtual {v0, v3, v4}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    :cond_6
    if-eqz v12, :cond_7

    sget-object v3, Ll/sgs0;->N8:Ll/dgs0;

    .line 37
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    move-result-object v4

    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    move-result-object v3

    .line 38
    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_7

    const-string v3, "/inspectorNetworkExtras"

    .line 39
    invoke-virtual {v0, v3, v12}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    :cond_7
    sget-object v3, Ll/sgs0;->g9:Ll/dgs0;

    .line 40
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    move-result-object v4

    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    move-result-object v3

    .line 41
    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_8

    if-eqz v14, :cond_8

    const-string v3, "/shareSheet"

    .line 42
    invoke-virtual {v0, v3, v14}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    :cond_8
    sget-object v3, Ll/sgs0;->l9:Ll/dgs0;

    .line 43
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    move-result-object v4

    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    move-result-object v3

    .line 44
    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_9

    if-eqz v15, :cond_9

    const-string v3, "/inspectorOutOfContextTest"

    .line 45
    invoke-virtual {v0, v3, v15}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    :cond_9
    sget-object v3, Ll/sgs0;->Ta:Ll/dgs0;

    .line 46
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    move-result-object v4

    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    move-result-object v3

    .line 47
    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_a

    const-string v3, "/bindPlayStoreOverlay"

    sget-object v4, Ll/aqs0;->u:Ll/bqs0;

    .line 48
    invoke-virtual {v0, v3, v4}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    const-string v3, "/presentPlayStoreOverlay"

    sget-object v4, Ll/aqs0;->v:Ll/bqs0;

    .line 49
    invoke-virtual {v0, v3, v4}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    const-string v3, "/expandPlayStoreOverlay"

    sget-object v4, Ll/aqs0;->w:Ll/bqs0;

    .line 50
    invoke-virtual {v0, v3, v4}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    const-string v3, "/collapsePlayStoreOverlay"

    sget-object v4, Ll/aqs0;->x:Ll/bqs0;

    .line 51
    invoke-virtual {v0, v3, v4}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    const-string v3, "/closePlayStoreOverlay"

    sget-object v4, Ll/aqs0;->y:Ll/bqs0;

    .line 52
    invoke-virtual {v0, v3, v4}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    :cond_a
    sget-object v3, Ll/sgs0;->a3:Ll/dgs0;

    .line 53
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    move-result-object v4

    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    move-result-object v3

    .line 54
    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_b

    const-string v3, "/setPAIDPersonalizationEnabled"

    sget-object v4, Ll/aqs0;->A:Ll/bqs0;

    .line 55
    invoke-virtual {v0, v3, v4}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    const-string v3, "/resetPAID"

    sget-object v4, Ll/aqs0;->z:Ll/bqs0;

    .line 56
    invoke-virtual {v0, v3, v4}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    :cond_b
    sget-object v3, Ll/sgs0;->lb:Ll/dgs0;

    .line 57
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    move-result-object v4

    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    move-result-object v3

    .line 58
    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_c

    iget-object v3, v0, Ll/gjt0;->zzc:Ll/wit0;

    .line 59
    invoke-interface {v3}, Ll/wit0;->c()Ll/q6w0;

    move-result-object v4

    if-eqz v4, :cond_c

    .line 60
    invoke-interface {v3}, Ll/wit0;->c()Ll/q6w0;

    move-result-object v3

    iget-boolean v3, v3, Ll/q6w0;->r0:Z

    if-eqz v3, :cond_c

    const-string v3, "/writeToLocalStorage"

    sget-object v4, Ll/aqs0;->B:Ll/bqs0;

    .line 61
    invoke-virtual {v0, v3, v4}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    const-string v3, "/clearLocalStorageKeys"

    sget-object v4, Ll/aqs0;->C:Ll/bqs0;

    .line 62
    invoke-virtual {v0, v3, v4}, Ll/gjt0;->zzA(Ljava/lang/String;Ll/bqs0;)V

    :cond_c
    move-object/from16 v3, p1

    iput-object v3, v0, Ll/gjt0;->zzg:Ll/har0;

    move-object/from16 v3, p3

    iput-object v3, v0, Ll/gjt0;->zzh:Ll/joy0;

    iput-object v1, v0, Ll/gjt0;->zzk:Ll/yns0;

    iput-object v2, v0, Ll/gjt0;->zzl:Ll/aos0;

    move-object/from16 v1, p5

    iput-object v1, v0, Ll/gjt0;->zzv:Ll/rar0;

    iput-object v5, v0, Ll/gjt0;->zzx:Ll/w9s0;

    iput-object v13, v0, Ll/gjt0;->zzm:Ll/ggu0;

    move/from16 v1, p6

    iput-boolean v1, v0, Ll/gjt0;->zzn:Z

    return-void
.end method

.method public final zza()Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/gjt0;->zzf:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    monitor-exit p0

    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :catchall_0
    move-exception v0

    .line 8
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    throw v0
.end method

.method public final zzb()Landroid/view/ViewTreeObserver$OnScrollChangedListener;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/gjt0;->zzf:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    monitor-exit p0

    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :catchall_0
    move-exception v0

    .line 8
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    throw v0
.end method

.method public final zzbo()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gjt0;->zzm:Ll/ggu0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/ggu0;->zzbo()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final zzc(Ljava/lang/String;Ljava/util/Map;)Landroid/webkit/WebResourceResponse;
    .locals 19
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    const-string v2, "range"

    .line 6
    .line 7
    const-string v3, "ms"

    .line 8
    .line 9
    const-string v4, "Cache connection took "

    .line 10
    .line 11
    :try_start_0
    iget-object v5, v1, Ll/gjt0;->zzc:Ll/wit0;

    .line 12
    .line 13
    invoke-interface {v5}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    iget-boolean v6, v1, Ll/gjt0;->zzC:Z

    .line 18
    .line 19
    invoke-static {v0, v5, v6}, Ll/u9t0;->c(Ljava/lang/String;Landroid/content/Context;Z)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v6

    .line 27
    if-nez v6, :cond_0

    .line 28
    .line 29
    move-object/from16 v6, p2

    .line 30
    .line 31
    invoke-direct {v1, v5, v6}, Ll/gjt0;->zzP(Ljava/lang/String;Ljava/util/Map;)Landroid/webkit/WebResourceResponse;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    return-object v0

    .line 36
    :cond_0
    move-object/from16 v6, p2

    .line 37
    .line 38
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    invoke-static {v5}, Lcom/google/android/gms/internal/ads/zzbbb;->g(Landroid/net/Uri;)Lcom/google/android/gms/internal/ads/zzbbb;

    .line 43
    .line 44
    .line 45
    move-result-object v5

    .line 46
    if-eqz v5, :cond_8

    .line 47
    .line 48
    new-instance v13, Ljava/util/HashMap;

    .line 49
    .line 50
    invoke-direct {v13}, Ljava/util/HashMap;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v8, "Access-Control-Allow-Origin"

    .line 54
    .line 55
    const-string v9, "*"

    .line 56
    .line 57
    invoke-interface {v13, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    invoke-virtual {v8}, Landroid/net/Uri;->getQueryParameterNames()Ljava/util/Set;

    .line 65
    .line 66
    .line 67
    move-result-object v9

    .line 68
    invoke-interface {v9, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v9

    .line 72
    const/4 v11, 0x0

    .line 73
    const/4 v12, 0x1

    .line 74
    if-eqz v9, :cond_2

    .line 75
    .line 76
    const/16 v9, 0x2d

    .line 77
    .line 78
    invoke-static {v9}, Ll/bow0;->b(C)Ll/bow0;

    .line 79
    .line 80
    .line 81
    move-result-object v9

    .line 82
    invoke-static {v9}, Ll/dpw0;->c(Ll/bow0;)Ll/dpw0;

    .line 83
    .line 84
    .line 85
    move-result-object v9

    .line 86
    invoke-virtual {v8, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v9, v2}, Ll/dpw0;->f(Ljava/lang/CharSequence;)Ljava/util/List;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 95
    .line 96
    .line 97
    move-result v8

    .line 98
    const/4 v9, 0x2

    .line 99
    if-ne v8, v9, :cond_2

    .line 100
    .line 101
    invoke-interface {v2, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v8

    .line 105
    check-cast v8, Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result v8

    .line 111
    invoke-interface {v2, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    check-cast v2, Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    add-int/2addr v2, v12

    .line 122
    if-lez v8, :cond_1

    .line 123
    .line 124
    int-to-long v14, v8

    .line 125
    iput-wide v14, v5, Lcom/google/android/gms/internal/ads/zzbbb;->zzh:J

    .line 126
    .line 127
    :cond_1
    sub-int/2addr v2, v8

    .line 128
    goto :goto_0

    .line 129
    :cond_2
    const/4 v2, -0x1

    .line 130
    :goto_0
    sget-object v8, Ll/sgs0;->j4:Ll/dgs0;

    .line 131
    .line 132
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 133
    .line 134
    .line 135
    move-result-object v9

    .line 136
    invoke-virtual {v9, v8}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v8

    .line 140
    check-cast v8, Ljava/lang/Boolean;

    .line 141
    .line 142
    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    .line 143
    .line 144
    .line 145
    move-result v8
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_6

    .line 146
    const-string v9, "X-Afma-Gcache-CachedBytes"

    .line 147
    .line 148
    const-string v14, "X-Afma-Gcache-IsDownloaded"

    .line 149
    .line 150
    const-string v15, "X-Afma-Gcache-IsGcacheHit"

    .line 151
    .line 152
    const/16 v16, 0x0

    .line 153
    .line 154
    const-string v7, "X-Afma-Gcache-HasAdditionalMetadataFromReadV2"

    .line 155
    .line 156
    if-eqz v8, :cond_6

    .line 157
    .line 158
    :try_start_1
    iget-object v8, v1, Ll/gjt0;->zzc:Ll/wit0;

    .line 159
    .line 160
    invoke-interface {v8}, Ll/bft0;->zzr()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v8

    .line 164
    invoke-static {v8}, Ll/epw0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v8

    .line 168
    iput-object v8, v5, Lcom/google/android/gms/internal/ads/zzbbb;->zzi:Ljava/lang/String;

    .line 169
    .line 170
    iget-object v8, v1, Ll/gjt0;->zzc:Ll/wit0;

    .line 171
    .line 172
    invoke-interface {v8}, Ll/bft0;->zzf()I

    .line 173
    .line 174
    .line 175
    move-result v8

    .line 176
    iput v8, v5, Lcom/google/android/gms/internal/ads/zzbbb;->zzj:I

    .line 177
    .line 178
    iget-boolean v8, v5, Lcom/google/android/gms/internal/ads/zzbbb;->zzg:Z

    .line 179
    .line 180
    if-eqz v8, :cond_3

    .line 181
    .line 182
    sget-object v8, Ll/sgs0;->l4:Ll/dgs0;

    .line 183
    .line 184
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 185
    .line 186
    .line 187
    move-result-object v11

    .line 188
    invoke-virtual {v11, v8}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object v8

    .line 192
    check-cast v8, Ljava/lang/Long;

    .line 193
    .line 194
    goto :goto_1

    .line 195
    :cond_3
    sget-object v8, Ll/sgs0;->k4:Ll/dgs0;

    .line 196
    .line 197
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 198
    .line 199
    .line 200
    move-result-object v11

    .line 201
    invoke-virtual {v11, v8}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    move-result-object v8

    .line 205
    check-cast v8, Ljava/lang/Long;

    .line 206
    .line 207
    :goto_1
    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    .line 208
    .line 209
    .line 210
    move-result-wide v10

    .line 211
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 212
    .line 213
    .line 214
    move-result-object v8

    .line 215
    invoke-interface {v8}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 216
    .line 217
    .line 218
    move-result-wide v17

    .line 219
    invoke-static {}, Ll/bxy0;->f()Ll/ccs0;

    .line 220
    .line 221
    .line 222
    iget-object v8, v1, Ll/gjt0;->zzc:Ll/wit0;

    .line 223
    .line 224
    invoke-interface {v8}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 225
    .line 226
    .line 227
    move-result-object v8

    .line 228
    invoke-static {v8, v5}, Ll/ccs0;->a(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzbbb;)Ljava/util/concurrent/Future;

    .line 229
    .line 230
    .line 231
    move-result-object v5
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_6
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1 .. :try_end_1} :catch_6

    .line 232
    :try_start_2
    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 233
    .line 234
    invoke-interface {v5, v10, v11, v8}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v8

    .line 238
    check-cast v8, Ll/dcs0;
    :try_end_2
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 239
    .line 240
    :try_start_3
    invoke-virtual {v8}, Ll/dcs0;->d()Z

    .line 241
    .line 242
    .line 243
    move-result v10

    .line 244
    invoke-static {v10}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object v10

    .line 248
    invoke-interface {v13, v7, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    invoke-virtual {v8}, Ll/dcs0;->f()Z

    .line 252
    .line 253
    .line 254
    move-result v7

    .line 255
    invoke-static {v7}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v7

    .line 259
    invoke-interface {v13, v15, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    invoke-virtual {v8}, Ll/dcs0;->e()Z

    .line 263
    .line 264
    .line 265
    move-result v7

    .line 266
    invoke-static {v7}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v7

    .line 270
    invoke-interface {v13, v14, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    invoke-virtual {v8}, Ll/dcs0;->a()J

    .line 274
    .line 275
    .line 276
    move-result-wide v10

    .line 277
    invoke-static {v10, v11}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object v7

    .line 281
    invoke-interface {v13, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
    .line 283
    .line 284
    invoke-virtual {v8}, Ll/dcs0;->c()Ljava/io/InputStream;

    .line 285
    .line 286
    .line 287
    move-result-object v7
    :try_end_3
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 288
    const/4 v8, -0x1

    .line 289
    if-eq v2, v8, :cond_4

    .line 290
    .line 291
    int-to-long v8, v2

    .line 292
    :try_start_4
    invoke-static {v7, v8, v9}, Ll/itw0;->a(Ljava/io/InputStream;J)Ljava/io/InputStream;

    .line 293
    .line 294
    .line 295
    move-result-object v7
    :try_end_4
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 296
    goto :goto_2

    .line 297
    :catchall_0
    move-exception v0

    .line 298
    goto :goto_4

    .line 299
    :catch_0
    move v11, v12

    .line 300
    goto :goto_5

    .line 301
    :catch_1
    move v11, v12

    .line 302
    goto/16 :goto_6

    .line 303
    .line 304
    :cond_4
    :goto_2
    :try_start_5
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 305
    .line 306
    .line 307
    move-result-object v2

    .line 308
    invoke-interface {v2}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 309
    .line 310
    .line 311
    move-result-wide v8

    .line 312
    sub-long v8, v8, v17

    .line 313
    .line 314
    sget-object v2, Lcom/google/android/gms/ads/internal/util/b;->l:Ll/ukw0;

    .line 315
    .line 316
    new-instance v5, Ll/ajt0;

    .line 317
    .line 318
    invoke-direct {v5, v1, v12, v8, v9}, Ll/ajt0;-><init>(Ll/gjt0;ZJ)V

    .line 319
    .line 320
    .line 321
    invoke-virtual {v2, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 322
    .line 323
    .line 324
    new-instance v2, Ljava/lang/StringBuilder;

    .line 325
    .line 326
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 327
    .line 328
    .line 329
    invoke-virtual {v2, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object v2
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_6
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_5 .. :try_end_5} :catch_6

    .line 339
    goto/16 :goto_7

    .line 340
    .line 341
    :cond_5
    :goto_3
    move-object v14, v7

    .line 342
    goto/16 :goto_9

    .line 343
    .line 344
    :goto_4
    move v11, v12

    .line 345
    goto :goto_8

    .line 346
    :catch_2
    move v11, v12

    .line 347
    move-object/from16 v7, v16

    .line 348
    .line 349
    goto :goto_5

    .line 350
    :catch_3
    move v11, v12

    .line 351
    move-object/from16 v7, v16

    .line 352
    .line 353
    goto :goto_6

    .line 354
    :catchall_1
    move-exception v0

    .line 355
    const/4 v11, 0x0

    .line 356
    goto :goto_8

    .line 357
    :catch_4
    move-object/from16 v7, v16

    .line 358
    .line 359
    const/4 v11, 0x0

    .line 360
    :goto_5
    :try_start_6
    invoke-interface {v5, v12}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 361
    .line 362
    .line 363
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 364
    .line 365
    .line 366
    move-result-object v2

    .line 367
    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 368
    .line 369
    .line 370
    :try_start_7
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 371
    .line 372
    .line 373
    move-result-object v2

    .line 374
    invoke-interface {v2}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 375
    .line 376
    .line 377
    move-result-wide v8

    .line 378
    sub-long v8, v8, v17

    .line 379
    .line 380
    sget-object v2, Lcom/google/android/gms/ads/internal/util/b;->l:Ll/ukw0;

    .line 381
    .line 382
    new-instance v5, Ll/ajt0;

    .line 383
    .line 384
    invoke-direct {v5, v1, v11, v8, v9}, Ll/ajt0;-><init>(Ll/gjt0;ZJ)V

    .line 385
    .line 386
    .line 387
    invoke-virtual {v2, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 388
    .line 389
    .line 390
    new-instance v2, Ljava/lang/StringBuilder;

    .line 391
    .line 392
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 393
    .line 394
    .line 395
    invoke-virtual {v2, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 396
    .line 397
    .line 398
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 399
    .line 400
    .line 401
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object v2
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_6
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_7 .. :try_end_7} :catch_6

    .line 405
    goto :goto_7

    .line 406
    :catch_5
    move-object/from16 v7, v16

    .line 407
    .line 408
    const/4 v11, 0x0

    .line 409
    :goto_6
    :try_start_8
    invoke-interface {v5, v12}, Ljava/util/concurrent/Future;->cancel(Z)Z
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 410
    .line 411
    .line 412
    :try_start_9
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 413
    .line 414
    .line 415
    move-result-object v2

    .line 416
    invoke-interface {v2}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 417
    .line 418
    .line 419
    move-result-wide v8

    .line 420
    sub-long v8, v8, v17

    .line 421
    .line 422
    sget-object v2, Lcom/google/android/gms/ads/internal/util/b;->l:Ll/ukw0;

    .line 423
    .line 424
    new-instance v5, Ll/ajt0;

    .line 425
    .line 426
    invoke-direct {v5, v1, v11, v8, v9}, Ll/ajt0;-><init>(Ll/gjt0;ZJ)V

    .line 427
    .line 428
    .line 429
    invoke-virtual {v2, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 430
    .line 431
    .line 432
    new-instance v2, Ljava/lang/StringBuilder;

    .line 433
    .line 434
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 435
    .line 436
    .line 437
    invoke-virtual {v2, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 438
    .line 439
    .line 440
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 441
    .line 442
    .line 443
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 444
    .line 445
    .line 446
    move-result-object v2

    .line 447
    :goto_7
    invoke-static {v2}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 448
    .line 449
    .line 450
    goto :goto_3

    .line 451
    :catchall_2
    move-exception v0

    .line 452
    :goto_8
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 453
    .line 454
    .line 455
    move-result-object v2

    .line 456
    invoke-interface {v2}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 457
    .line 458
    .line 459
    move-result-wide v5

    .line 460
    sub-long v5, v5, v17

    .line 461
    .line 462
    sget-object v2, Lcom/google/android/gms/ads/internal/util/b;->l:Ll/ukw0;

    .line 463
    .line 464
    new-instance v7, Ll/ajt0;

    .line 465
    .line 466
    invoke-direct {v7, v1, v11, v5, v6}, Ll/ajt0;-><init>(Ll/gjt0;ZJ)V

    .line 467
    .line 468
    .line 469
    invoke-virtual {v2, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 470
    .line 471
    .line 472
    new-instance v1, Ljava/lang/StringBuilder;

    .line 473
    .line 474
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 475
    .line 476
    .line 477
    invoke-virtual {v1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 478
    .line 479
    .line 480
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 481
    .line 482
    .line 483
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 484
    .line 485
    .line 486
    move-result-object v1

    .line 487
    invoke-static {v1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 488
    .line 489
    .line 490
    throw v0

    .line 491
    :cond_6
    invoke-static {}, Ll/bxy0;->e()Ll/hbs0;

    .line 492
    .line 493
    .line 494
    move-result-object v3

    .line 495
    invoke-virtual {v3, v5}, Ll/hbs0;->b(Lcom/google/android/gms/internal/ads/zzbbb;)Lcom/google/android/gms/internal/ads/zzbay;

    .line 496
    .line 497
    .line 498
    move-result-object v3

    .line 499
    if-eqz v3, :cond_7

    .line 500
    .line 501
    invoke-virtual {v3}, Lcom/google/android/gms/internal/ads/zzbay;->zze()Z

    .line 502
    .line 503
    .line 504
    move-result v4

    .line 505
    if-eqz v4, :cond_7

    .line 506
    .line 507
    invoke-virtual {v3}, Lcom/google/android/gms/internal/ads/zzbay;->zzd()Z

    .line 508
    .line 509
    .line 510
    move-result v4

    .line 511
    invoke-static {v4}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    .line 512
    .line 513
    .line 514
    move-result-object v4

    .line 515
    invoke-interface {v13, v7, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 516
    .line 517
    .line 518
    invoke-virtual {v3}, Lcom/google/android/gms/internal/ads/zzbay;->h0()Z

    .line 519
    .line 520
    .line 521
    move-result v4

    .line 522
    invoke-static {v4}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    .line 523
    .line 524
    .line 525
    move-result-object v4

    .line 526
    invoke-interface {v13, v15, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 527
    .line 528
    .line 529
    invoke-virtual {v3}, Lcom/google/android/gms/internal/ads/zzbay;->J()Z

    .line 530
    .line 531
    .line 532
    move-result v4

    .line 533
    invoke-static {v4}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    .line 534
    .line 535
    .line 536
    move-result-object v4

    .line 537
    invoke-interface {v13, v14, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 538
    .line 539
    .line 540
    invoke-virtual {v3}, Lcom/google/android/gms/internal/ads/zzbay;->F()J

    .line 541
    .line 542
    .line 543
    move-result-wide v4

    .line 544
    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 545
    .line 546
    .line 547
    move-result-object v4

    .line 548
    invoke-interface {v13, v9, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 549
    .line 550
    .line 551
    invoke-virtual {v3}, Lcom/google/android/gms/internal/ads/zzbay;->I()Ljava/io/InputStream;

    .line 552
    .line 553
    .line 554
    move-result-object v7

    .line 555
    const/4 v8, -0x1

    .line 556
    if-eq v2, v8, :cond_5

    .line 557
    .line 558
    int-to-long v2, v2

    .line 559
    invoke-static {v7, v2, v3}, Ll/itw0;->a(Ljava/io/InputStream;J)Ljava/io/InputStream;

    .line 560
    .line 561
    .line 562
    move-result-object v7

    .line 563
    goto/16 :goto_3

    .line 564
    .line 565
    :cond_7
    move-object/from16 v14, v16

    .line 566
    .line 567
    :goto_9
    if-eqz v14, :cond_9

    .line 568
    .line 569
    new-instance v8, Landroid/webkit/WebResourceResponse;

    .line 570
    .line 571
    const-string v9, ""

    .line 572
    .line 573
    const-string v10, ""

    .line 574
    .line 575
    const-string v12, "OK"

    .line 576
    .line 577
    const/16 v11, 0xc8

    .line 578
    .line 579
    invoke-direct/range {v8 .. v14}, Landroid/webkit/WebResourceResponse;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/util/Map;Ljava/io/InputStream;)V

    .line 580
    .line 581
    .line 582
    return-object v8

    .line 583
    :cond_8
    const/16 v16, 0x0

    .line 584
    .line 585
    :cond_9
    invoke-static {}, Ll/cct0;->k()Z

    .line 586
    .line 587
    .line 588
    move-result v2

    .line 589
    if-eqz v2, :cond_a

    .line 590
    .line 591
    sget-object v2, Ll/uis0;->b:Ll/kis0;

    .line 592
    .line 593
    invoke-virtual {v2}, Ll/kis0;->e()Ljava/lang/Object;

    .line 594
    .line 595
    .line 596
    move-result-object v2

    .line 597
    check-cast v2, Ljava/lang/Boolean;

    .line 598
    .line 599
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 600
    .line 601
    .line 602
    move-result v2

    .line 603
    if-eqz v2, :cond_a

    .line 604
    .line 605
    invoke-direct/range {p0 .. p2}, Ll/gjt0;->zzP(Ljava/lang/String;Ljava/util/Map;)Landroid/webkit/WebResourceResponse;

    .line 606
    .line 607
    .line 608
    move-result-object v0
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_6
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_9 .. :try_end_9} :catch_6

    .line 609
    return-object v0

    .line 610
    :cond_a
    return-object v16

    .line 611
    :catch_6
    move-exception v0

    .line 612
    const-string v1, "AdWebViewClient.interceptRequest"

    .line 613
    .line 614
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 615
    .line 616
    .line 617
    move-result-object v2

    .line 618
    invoke-virtual {v2, v0, v1}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 619
    .line 620
    .line 621
    invoke-static {}, Ll/gjt0;->zzO()Landroid/webkit/WebResourceResponse;

    .line 622
    .line 623
    .line 624
    move-result-object v0

    .line 625
    return-object v0
.end method

.method public final zzd()Ll/w9s0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gjt0;->zzx:Ll/w9s0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzg()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/gjt0;->zzi:Ll/lkt0;

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/gjt0;->zzz:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Ll/gjt0;->zzB:I

    .line 10
    .line 11
    if-lez v0, :cond_1

    .line 12
    .line 13
    :cond_0
    iget-boolean v0, p0, Ll/gjt0;->zzA:Z

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-boolean v0, p0, Ll/gjt0;->zzo:Z

    .line 18
    .line 19
    if-eqz v0, :cond_4

    .line 20
    .line 21
    :cond_1
    sget-object v0, Ll/sgs0;->Q1:Ll/dgs0;

    .line 22
    .line 23
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iget-object v0, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 40
    .line 41
    invoke-interface {v0}, Ll/wit0;->zzm()Ll/ihs0;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    iget-object v0, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 48
    .line 49
    invoke-interface {v0}, Ll/wit0;->zzm()Ll/ihs0;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/ihs0;->a()Ll/khs0;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object v1, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 58
    .line 59
    invoke-interface {v1}, Ll/bft0;->zzk()Ll/hhs0;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const-string v2, "awfllc"

    .line 64
    .line 65
    filled-new-array {v2}, [Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-static {v0, v1, v2}, Ll/chs0;->a(Ll/khs0;Ll/hhs0;[Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    :cond_2
    iget-object v0, p0, Ll/gjt0;->zzi:Ll/lkt0;

    .line 73
    .line 74
    iget-boolean v1, p0, Ll/gjt0;->zzA:Z

    .line 75
    .line 76
    const/4 v2, 0x0

    .line 77
    if-nez v1, :cond_3

    .line 78
    .line 79
    iget-boolean v1, p0, Ll/gjt0;->zzo:Z

    .line 80
    .line 81
    if-nez v1, :cond_3

    .line 82
    .line 83
    const/4 v2, 0x1

    .line 84
    :cond_3
    iget v1, p0, Ll/gjt0;->zzp:I

    .line 85
    .line 86
    iget-object v3, p0, Ll/gjt0;->zzq:Ljava/lang/String;

    .line 87
    .line 88
    iget-object v4, p0, Ll/gjt0;->zzr:Ljava/lang/String;

    .line 89
    .line 90
    invoke-interface {v0, v2, v1, v3, v4}, Ll/lkt0;->a(ZILjava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    const/4 v0, 0x0

    .line 94
    iput-object v0, p0, Ll/gjt0;->zzi:Ll/lkt0;

    .line 95
    .line 96
    :cond_4
    iget-object p0, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 97
    .line 98
    invoke-interface {p0}, Ll/wit0;->l()V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final zzh()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/gjt0;->zza:Ll/w8t0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0}, Ll/w8t0;->zze()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Ll/gjt0;->zza:Ll/w8t0;

    .line 10
    .line 11
    :cond_0
    invoke-direct {p0}, Ll/gjt0;->zzR()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/gjt0;->zzf:Ljava/lang/Object;

    .line 15
    .line 16
    monitor-enter v0

    .line 17
    :try_start_0
    iget-object v2, p0, Ll/gjt0;->zze:Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Ll/gjt0;->zzg:Ll/har0;

    .line 23
    .line 24
    iput-object v1, p0, Ll/gjt0;->zzh:Ll/joy0;

    .line 25
    .line 26
    iput-object v1, p0, Ll/gjt0;->zzi:Ll/lkt0;

    .line 27
    .line 28
    iput-object v1, p0, Ll/gjt0;->zzj:Ll/mkt0;

    .line 29
    .line 30
    iput-object v1, p0, Ll/gjt0;->zzk:Ll/yns0;

    .line 31
    .line 32
    iput-object v1, p0, Ll/gjt0;->zzl:Ll/aos0;

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    iput-boolean v2, p0, Ll/gjt0;->zzn:Z

    .line 36
    .line 37
    iput-boolean v2, p0, Ll/gjt0;->zzs:Z

    .line 38
    .line 39
    iput-boolean v2, p0, Ll/gjt0;->zzt:Z

    .line 40
    .line 41
    iput-object v1, p0, Ll/gjt0;->zzv:Ll/rar0;

    .line 42
    .line 43
    iput-object v1, p0, Ll/gjt0;->zzx:Ll/w9s0;

    .line 44
    .line 45
    iput-object v1, p0, Ll/gjt0;->zzw:Ll/r0t0;

    .line 46
    .line 47
    iget-object v2, p0, Ll/gjt0;->zzy:Ll/m0t0;

    .line 48
    .line 49
    if-eqz v2, :cond_1

    .line 50
    .line 51
    const/4 v3, 0x1

    .line 52
    invoke-virtual {v2, v3}, Ll/m0t0;->h(Z)V

    .line 53
    .line 54
    .line 55
    iput-object v1, p0, Ll/gjt0;->zzy:Ll/m0t0;

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catchall_0
    move-exception p0

    .line 59
    goto :goto_1

    .line 60
    :cond_1
    :goto_0
    monitor-exit v0

    .line 61
    return-void

    .line 62
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    throw p0
.end method

.method public final zzi(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/gjt0;->zzC:Z

    .line 2
    .line 3
    return-void
.end method

.method public final zzj(Landroid/net/Uri;)V
    .locals 5

    .line 1
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Received GMSG: "

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/gjt0;->zze:Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ljava/util/List;

    .line 25
    .line 26
    if-eqz v1, :cond_2

    .line 27
    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    sget-object v3, Ll/sgs0;->D5:Ll/dgs0;

    .line 36
    .line 37
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Ljava/lang/Boolean;

    .line 46
    .line 47
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-eqz v3, :cond_1

    .line 52
    .line 53
    iget-object v3, p0, Ll/gjt0;->zzD:Ljava/util/HashSet;

    .line 54
    .line 55
    invoke-virtual {v3, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_1

    .line 60
    .line 61
    if-eqz v2, :cond_1

    .line 62
    .line 63
    sget-object v3, Ll/sgs0;->F5:Ll/dgs0;

    .line 64
    .line 65
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    check-cast v3, Ljava/lang/Integer;

    .line 74
    .line 75
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-lt v2, v3, :cond_1

    .line 84
    .line 85
    const-string v2, "Parsing gmsg query params on BG thread: "

    .line 86
    .line 87
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    invoke-static {v2}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v2, p1}, Lcom/google/android/gms/ads/internal/util/b;->D(Landroid/net/Uri;)Ll/hpr;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    new-instance v3, Ll/cjt0;

    .line 103
    .line 104
    invoke-direct {v3, p0, v0, v1, p1}, Ll/cjt0;-><init>(Ll/gjt0;Ljava/util/List;Ljava/lang/String;Landroid/net/Uri;)V

    .line 105
    .line 106
    .line 107
    sget-object p0, Ll/oct0;->e:Ll/xvw0;

    .line 108
    .line 109
    invoke-static {v2, v3, p0}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_1
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 114
    .line 115
    .line 116
    invoke-static {p1}, Lcom/google/android/gms/ads/internal/util/b;->o(Landroid/net/Uri;)Ljava/util/Map;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-direct {p0, p1, v0, v1}, Ll/gjt0;->zzQ(Ljava/util/Map;Ljava/util/List;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    return-void

    .line 124
    :cond_2
    :goto_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    const-string p1, "No GMSG handler found for GMSG: "

    .line 129
    .line 130
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    sget-object p0, Ll/sgs0;->M6:Ll/dgs0;

    .line 138
    .line 139
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-virtual {p1, p0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    check-cast p0, Ljava/lang/Boolean;

    .line 148
    .line 149
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    if-eqz p0, :cond_6

    .line 154
    .line 155
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-virtual {p0}, Ll/ebt0;->g()Ll/ahs0;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    if-nez p0, :cond_3

    .line 164
    .line 165
    goto :goto_3

    .line 166
    :cond_3
    if-eqz v1, :cond_5

    .line 167
    .line 168
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 169
    .line 170
    .line 171
    move-result p0

    .line 172
    const/4 p1, 0x2

    .line 173
    if-ge p0, p1, :cond_4

    .line 174
    .line 175
    goto :goto_1

    .line 176
    :cond_4
    const/4 p0, 0x1

    .line 177
    invoke-virtual {v1, p0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    goto :goto_2

    .line 182
    :cond_5
    :goto_1
    const-string p0, "null"

    .line 183
    .line 184
    :goto_2
    sget-object p1, Ll/oct0;->a:Ll/xvw0;

    .line 185
    .line 186
    new-instance v0, Ll/zit0;

    .line 187
    .line 188
    invoke-direct {v0, p0}, Ll/zit0;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 192
    .line 193
    .line 194
    :cond_6
    :goto_3
    return-void
.end method

.method public final zzk()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gjt0;->zzd:Ll/fcs0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/16 v1, 0x2715

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/fcs0;->c(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Ll/gjt0;->zzA:Z

    .line 12
    .line 13
    const/16 v0, 0x2714

    .line 14
    .line 15
    iput v0, p0, Ll/gjt0;->zzp:I

    .line 16
    .line 17
    const-string v0, "Page loaded delay cancel."

    .line 18
    .line 19
    iput-object v0, p0, Ll/gjt0;->zzq:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/gjt0;->zzg()V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 25
    .line 26
    invoke-interface {p0}, Ll/wit0;->destroy()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final zzl()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gjt0;->zzf:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    iget v0, p0, Ll/gjt0;->zzB:I

    .line 6
    .line 7
    add-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    iput v0, p0, Ll/gjt0;->zzB:I

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/gjt0;->zzg()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    throw p0
.end method

.method public final zzm()V
    .locals 1

    .line 1
    iget v0, p0, Ll/gjt0;->zzB:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, -0x1

    .line 4
    .line 5
    iput v0, p0, Ll/gjt0;->zzB:I

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/gjt0;->zzg()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic zzn()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/wit0;->m()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 7
    .line 8
    invoke-interface {p0}, Ll/wit0;->zzL()Lcom/google/android/gms/ads/internal/overlay/b;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/google/android/gms/ads/internal/overlay/b;->G()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic zzo(ZJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Ll/bft0;->K(ZJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic zzp(Landroid/view/View;Ll/w8t0;I)V
    .locals 0

    .line 1
    add-int/lit8 p3, p3, -0x1

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, p3}, Ll/gjt0;->zzS(Landroid/view/View;Ll/w8t0;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final zzq(IIZ)V
    .locals 0

    .line 1
    iget-object p3, p0, Ll/gjt0;->zzw:Ll/r0t0;

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    invoke-virtual {p3, p1, p2}, Ll/r0t0;->h(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/gjt0;->zzy:Ll/m0t0;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    const/4 p3, 0x0

    .line 13
    invoke-virtual {p0, p1, p2, p3}, Ll/m0t0;->k(IIZ)V

    .line 14
    .line 15
    .line 16
    :cond_1
    return-void
.end method

.method public final zzr()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gjt0;->zza:Ll/w8t0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 6
    .line 7
    invoke-interface {v1}, Ll/wit0;->L()Landroid/webkit/WebView;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v1}, Ll/kkl0;->O(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    const/16 v2, 0xa

    .line 18
    .line 19
    invoke-direct {p0, v1, v0, v2}, Ll/gjt0;->zzS(Landroid/view/View;Ll/w8t0;I)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-direct {p0}, Ll/gjt0;->zzR()V

    .line 24
    .line 25
    .line 26
    new-instance v1, Ll/bjt0;

    .line 27
    .line 28
    invoke-direct {v1, p0, v0}, Ll/bjt0;-><init>(Ll/gjt0;Ll/w8t0;)V

    .line 29
    .line 30
    .line 31
    iput-object v1, p0, Ll/gjt0;->zzF:Landroid/view/View$OnAttachStateChangeListener;

    .line 32
    .line 33
    iget-object p0, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 34
    .line 35
    check-cast p0, Landroid/view/View;

    .line 36
    .line 37
    invoke-virtual {p0, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public final zzs()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gjt0;->zzm:Ll/ggu0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/ggu0;->zzs()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final zzu(Lcom/google/android/gms/ads/internal/overlay/zzc;Z)V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/wit0;->a0()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v1, v0}, Ll/gjt0;->zzU(ZLl/wit0;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v2, 0x1

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    if-nez p2, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v2, 0x0

    .line 18
    :cond_1
    :goto_0
    new-instance v3, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 19
    .line 20
    const/4 p2, 0x0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    move-object v5, p2

    .line 24
    goto :goto_1

    .line 25
    :cond_2
    iget-object v0, p0, Ll/gjt0;->zzg:Ll/har0;

    .line 26
    .line 27
    move-object v5, v0

    .line 28
    :goto_1
    if-eqz v1, :cond_3

    .line 29
    .line 30
    move-object v6, p2

    .line 31
    goto :goto_2

    .line 32
    :cond_3
    iget-object v0, p0, Ll/gjt0;->zzh:Ll/joy0;

    .line 33
    .line 34
    move-object v6, v0

    .line 35
    :goto_2
    iget-object v7, p0, Ll/gjt0;->zzv:Ll/rar0;

    .line 36
    .line 37
    iget-object v9, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 38
    .line 39
    invoke-interface {v9}, Ll/wit0;->zzn()Lcom/google/android/gms/internal/ads/zzcei;

    .line 40
    .line 41
    .line 42
    move-result-object v8

    .line 43
    if-eqz v2, :cond_4

    .line 44
    .line 45
    :goto_3
    move-object v4, p1

    .line 46
    move-object v10, p2

    .line 47
    goto :goto_4

    .line 48
    :cond_4
    iget-object p2, p0, Ll/gjt0;->zzm:Ll/ggu0;

    .line 49
    .line 50
    goto :goto_3

    .line 51
    :goto_4
    invoke-direct/range {v3 .. v10}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;-><init>(Lcom/google/android/gms/ads/internal/overlay/zzc;Ll/har0;Ll/joy0;Ll/rar0;Lcom/google/android/gms/internal/ads/zzcei;Ll/wit0;Ll/ggu0;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v3}, Ll/gjt0;->zzx(Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final zzv(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 7

    .line 1
    iget-object v6, p0, Ll/gjt0;->zzE:Ll/qbv0;

    .line 2
    .line 3
    new-instance v0, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 4
    .line 5
    iget-object v1, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 6
    .line 7
    invoke-interface {v1}, Ll/wit0;->zzn()Lcom/google/android/gms/internal/ads/zzcei;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const/16 v5, 0xe

    .line 12
    .line 13
    move-object v3, p1

    .line 14
    move-object v4, p2

    .line 15
    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;-><init>(Ll/wit0;Lcom/google/android/gms/internal/ads/zzcei;Ljava/lang/String;Ljava/lang/String;ILl/k1t0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/gjt0;->zzx(Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final zzw(ZIZ)V
    .locals 12

    .line 1
    iget-object v0, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/wit0;->a0()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v1, v0}, Ll/gjt0;->zzU(ZLl/wit0;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    if-nez p3, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v1, 0x0

    .line 18
    :cond_1
    :goto_0
    new-instance v2, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 19
    .line 20
    const/4 p3, 0x0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    move-object v3, p3

    .line 24
    goto :goto_1

    .line 25
    :cond_2
    iget-object v0, p0, Ll/gjt0;->zzg:Ll/har0;

    .line 26
    .line 27
    move-object v3, v0

    .line 28
    :goto_1
    iget-object v4, p0, Ll/gjt0;->zzh:Ll/joy0;

    .line 29
    .line 30
    iget-object v5, p0, Ll/gjt0;->zzv:Ll/rar0;

    .line 31
    .line 32
    iget-object v6, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 33
    .line 34
    invoke-interface {v6}, Ll/wit0;->zzn()Lcom/google/android/gms/internal/ads/zzcei;

    .line 35
    .line 36
    .line 37
    move-result-object v9

    .line 38
    if-eqz v1, :cond_3

    .line 39
    .line 40
    move-object v10, p3

    .line 41
    goto :goto_2

    .line 42
    :cond_3
    iget-object v0, p0, Ll/gjt0;->zzm:Ll/ggu0;

    .line 43
    .line 44
    move-object v10, v0

    .line 45
    :goto_2
    iget-object v0, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 46
    .line 47
    invoke-static {v0}, Ll/gjt0;->zzT(Ll/wit0;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_4

    .line 52
    .line 53
    iget-object p3, p0, Ll/gjt0;->zzE:Ll/qbv0;

    .line 54
    .line 55
    :cond_4
    move v7, p1

    .line 56
    move v8, p2

    .line 57
    move-object v11, p3

    .line 58
    invoke-direct/range {v2 .. v11}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;-><init>(Ll/har0;Ll/joy0;Ll/rar0;Ll/wit0;ZILcom/google/android/gms/internal/ads/zzcei;Ll/ggu0;Ll/k1t0;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v2}, Ll/gjt0;->zzx(Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final zzx(Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gjt0;->zzy:Ll/m0t0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/m0t0;->m()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    invoke-static {}, Ll/bxy0;->k()Ll/ghy0;

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Ll/gjt0;->zzc:Ll/wit0;

    .line 15
    .line 16
    invoke-interface {v1}, Ll/wit0;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    xor-int/lit8 v0, v0, 0x1

    .line 21
    .line 22
    invoke-static {v1, p1, v0}, Ll/ghy0;->a(Landroid/content/Context;Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;Z)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/gjt0;->zza:Ll/w8t0;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    iget-object v0, p1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zzl:Ljava/lang/String;

    .line 30
    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    iget-object p1, p1, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;->zza:Lcom/google/android/gms/ads/internal/overlay/zzc;

    .line 34
    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iget-object v0, p1, Lcom/google/android/gms/ads/internal/overlay/zzc;->zzb:Ljava/lang/String;

    .line 38
    .line 39
    :cond_1
    invoke-interface {p0, v0}, Ll/w8t0;->A(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_2
    return-void
.end method

.method public final zzy(ZILjava/lang/String;Ljava/lang/String;Z)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/gjt0;->zzc:Ll/wit0;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/wit0;->a0()Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-static {v2, v1}, Ll/gjt0;->zzU(ZLl/wit0;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v3, 0x1

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    if-nez p5, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v3, 0x0

    .line 20
    :cond_1
    :goto_0
    new-instance v4, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 21
    .line 22
    const/4 v5, 0x0

    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    move-object v1, v5

    .line 26
    goto :goto_1

    .line 27
    :cond_2
    iget-object v1, v0, Ll/gjt0;->zzg:Ll/har0;

    .line 28
    .line 29
    :goto_1
    if-eqz v2, :cond_3

    .line 30
    .line 31
    move-object v6, v5

    .line 32
    goto :goto_2

    .line 33
    :cond_3
    iget-object v2, v0, Ll/gjt0;->zzc:Ll/wit0;

    .line 34
    .line 35
    new-instance v6, Ll/djt0;

    .line 36
    .line 37
    iget-object v7, v0, Ll/gjt0;->zzh:Ll/joy0;

    .line 38
    .line 39
    invoke-direct {v6, v2, v7}, Ll/djt0;-><init>(Ll/wit0;Ll/joy0;)V

    .line 40
    .line 41
    .line 42
    :goto_2
    iget-object v7, v0, Ll/gjt0;->zzk:Ll/yns0;

    .line 43
    .line 44
    iget-object v8, v0, Ll/gjt0;->zzl:Ll/aos0;

    .line 45
    .line 46
    iget-object v9, v0, Ll/gjt0;->zzv:Ll/rar0;

    .line 47
    .line 48
    iget-object v10, v0, Ll/gjt0;->zzc:Ll/wit0;

    .line 49
    .line 50
    invoke-interface {v10}, Ll/wit0;->zzn()Lcom/google/android/gms/internal/ads/zzcei;

    .line 51
    .line 52
    .line 53
    move-result-object v15

    .line 54
    if-eqz v3, :cond_4

    .line 55
    .line 56
    move-object/from16 v16, v5

    .line 57
    .line 58
    goto :goto_3

    .line 59
    :cond_4
    iget-object v2, v0, Ll/gjt0;->zzm:Ll/ggu0;

    .line 60
    .line 61
    move-object/from16 v16, v2

    .line 62
    .line 63
    :goto_3
    iget-object v2, v0, Ll/gjt0;->zzc:Ll/wit0;

    .line 64
    .line 65
    invoke-static {v2}, Ll/gjt0;->zzT(Ll/wit0;)Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_5

    .line 70
    .line 71
    iget-object v5, v0, Ll/gjt0;->zzE:Ll/qbv0;

    .line 72
    .line 73
    :cond_5
    move/from16 v11, p1

    .line 74
    .line 75
    move/from16 v12, p2

    .line 76
    .line 77
    move-object/from16 v13, p3

    .line 78
    .line 79
    move-object/from16 v14, p4

    .line 80
    .line 81
    move-object/from16 v17, v5

    .line 82
    .line 83
    move-object v5, v1

    .line 84
    invoke-direct/range {v4 .. v17}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;-><init>(Ll/har0;Ll/joy0;Ll/yns0;Ll/aos0;Ll/rar0;Ll/wit0;ZILjava/lang/String;Ljava/lang/String;Lcom/google/android/gms/internal/ads/zzcei;Ll/ggu0;Ll/k1t0;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v4}, Ll/gjt0;->zzx(Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final zzz(ZILjava/lang/String;ZZ)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/gjt0;->zzc:Ll/wit0;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/wit0;->a0()Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-static {v2, v1}, Ll/gjt0;->zzU(ZLl/wit0;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v3, 0x1

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    if-nez p4, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v3, 0x0

    .line 20
    :cond_1
    :goto_0
    new-instance v4, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;

    .line 21
    .line 22
    const/4 v5, 0x0

    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    move-object v1, v5

    .line 26
    goto :goto_1

    .line 27
    :cond_2
    iget-object v1, v0, Ll/gjt0;->zzg:Ll/har0;

    .line 28
    .line 29
    :goto_1
    if-eqz v2, :cond_3

    .line 30
    .line 31
    move-object v6, v5

    .line 32
    goto :goto_2

    .line 33
    :cond_3
    iget-object v2, v0, Ll/gjt0;->zzc:Ll/wit0;

    .line 34
    .line 35
    new-instance v6, Ll/djt0;

    .line 36
    .line 37
    iget-object v7, v0, Ll/gjt0;->zzh:Ll/joy0;

    .line 38
    .line 39
    invoke-direct {v6, v2, v7}, Ll/djt0;-><init>(Ll/wit0;Ll/joy0;)V

    .line 40
    .line 41
    .line 42
    :goto_2
    iget-object v7, v0, Ll/gjt0;->zzk:Ll/yns0;

    .line 43
    .line 44
    iget-object v8, v0, Ll/gjt0;->zzl:Ll/aos0;

    .line 45
    .line 46
    iget-object v9, v0, Ll/gjt0;->zzv:Ll/rar0;

    .line 47
    .line 48
    iget-object v10, v0, Ll/gjt0;->zzc:Ll/wit0;

    .line 49
    .line 50
    invoke-interface {v10}, Ll/wit0;->zzn()Lcom/google/android/gms/internal/ads/zzcei;

    .line 51
    .line 52
    .line 53
    move-result-object v14

    .line 54
    if-eqz v3, :cond_4

    .line 55
    .line 56
    move-object v15, v5

    .line 57
    goto :goto_3

    .line 58
    :cond_4
    iget-object v2, v0, Ll/gjt0;->zzm:Ll/ggu0;

    .line 59
    .line 60
    move-object v15, v2

    .line 61
    :goto_3
    iget-object v2, v0, Ll/gjt0;->zzc:Ll/wit0;

    .line 62
    .line 63
    invoke-static {v2}, Ll/gjt0;->zzT(Ll/wit0;)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-eqz v2, :cond_5

    .line 68
    .line 69
    iget-object v5, v0, Ll/gjt0;->zzE:Ll/qbv0;

    .line 70
    .line 71
    :cond_5
    move/from16 v11, p1

    .line 72
    .line 73
    move/from16 v12, p2

    .line 74
    .line 75
    move-object/from16 v13, p3

    .line 76
    .line 77
    move/from16 v17, p5

    .line 78
    .line 79
    move-object/from16 v16, v5

    .line 80
    .line 81
    move-object v5, v1

    .line 82
    invoke-direct/range {v4 .. v17}, Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;-><init>(Ll/har0;Ll/joy0;Ll/yns0;Ll/aos0;Ll/rar0;Ll/wit0;ZILjava/lang/String;Lcom/google/android/gms/internal/ads/zzcei;Ll/ggu0;Ll/k1t0;Z)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v4}, Ll/gjt0;->zzx(Lcom/google/android/gms/ads/internal/overlay/AdOverlayInfoParcel;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method
