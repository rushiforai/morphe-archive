.class public Lcom/cmic/sso/sdk/c/a/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cmic/sso/sdk/c/a/b;


# static fields
.field private static a:Lcom/cmic/sso/sdk/c/c;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private a()Ljava/lang/String;
    .locals 3

    .line 760
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 761
    sget-object v0, Lcom/cmic/sso/sdk/b;->a:[Ljava/lang/String;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "."

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/cmic/sso/sdk/b;->a:[Ljava/lang/String;

    const/4 v2, 0x2

    aget-object v1, v1, v2

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 762
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/cmic/sso/sdk/b;->a:[Ljava/lang/String;

    const/4 v2, 0x4

    aget-object v1, v1, v2

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Lcom/cmic/sso/sdk/b;->a:[Ljava/lang/String;

    const/4 v1, 0x6

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private a(Ljava/io/Closeable;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 758
    :try_start_0
    invoke-interface {p1}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 759
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized a(Lcom/cmic/sso/sdk/c/b/g;Lcom/cmic/sso/sdk/a;)Ljavax/net/ssl/SSLSocketFactory;
    .locals 1

    monitor-enter p0

    .line 763
    :try_start_0
    instance-of p1, p1, Lcom/cmic/sso/sdk/c/b/e;

    if-eqz p1, :cond_1

    .line 764
    new-instance p1, Lcom/cmic/sso/sdk/c/c;

    invoke-static {}, Ljavax/net/ssl/HttpsURLConnection;->getDefaultSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    invoke-direct {p1, v0, p2}, Lcom/cmic/sso/sdk/c/c;-><init>(Ljavax/net/ssl/SSLSocketFactory;Lcom/cmic/sso/sdk/a;)V

    .line 765
    sget-object p2, Lcom/cmic/sso/sdk/c/a/a;->a:Lcom/cmic/sso/sdk/c/c;

    if-nez p2, :cond_0

    .line 766
    sput-object p1, Lcom/cmic/sso/sdk/c/a/a;->a:Lcom/cmic/sso/sdk/c/c;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 767
    :cond_0
    :goto_0
    monitor-exit p0

    return-object p1

    .line 768
    :cond_1
    :try_start_1
    sget-object p1, Lcom/cmic/sso/sdk/c/a/a;->a:Lcom/cmic/sso/sdk/c/c;

    if-nez p1, :cond_2

    .line 769
    new-instance p1, Lcom/cmic/sso/sdk/c/c;

    invoke-static {}, Ljavax/net/ssl/HttpsURLConnection;->getDefaultSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v0

    invoke-direct {p1, v0, p2}, Lcom/cmic/sso/sdk/c/c;-><init>(Ljavax/net/ssl/SSLSocketFactory;Lcom/cmic/sso/sdk/a;)V

    sput-object p1, Lcom/cmic/sso/sdk/c/a/a;->a:Lcom/cmic/sso/sdk/c/c;

    .line 770
    :cond_2
    sget-object p1, Lcom/cmic/sso/sdk/c/a/a;->a:Lcom/cmic/sso/sdk/c/c;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public a(Lcom/cmic/sso/sdk/c/c/c;Lcom/cmic/sso/sdk/c/d/c;Lcom/cmic/sso/sdk/a;)V
    .locals 20
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    move-object/from16 v3, p2

    .line 6
    .line 7
    move-object/from16 v4, p3

    .line 8
    .line 9
    const-string v5, "remote_ip"

    .line 10
    .line 11
    const-string v6, "responseResult: "

    .line 12
    .line 13
    const-string v7, ""

    .line 14
    .line 15
    const-string v8, "responseCode: "

    .line 16
    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v9, "\u8bf7\u6c42\u5730\u5740: "

    .line 20
    .line 21
    invoke-direct {v0, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/cmic/sso/sdk/c/c/c;->a()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v9

    .line 28
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v9, "ConnectionInterceptor"

    .line 36
    .line 37
    invoke-static {v9, v0}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    new-instance v10, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    :try_start_0
    invoke-virtual {v2}, Lcom/cmic/sso/sdk/c/c/c;->a()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v15, Ljava/net/URL;

    .line 50
    .line 51
    invoke-direct {v15, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v15}, Ljava/net/URL;->getHost()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v14

    .line 58
    invoke-virtual {v2}, Lcom/cmic/sso/sdk/c/c/c;->j()Lcom/cmic/sso/sdk/c/b/g;

    .line 59
    .line 60
    .line 61
    move-result-object v11

    .line 62
    instance-of v12, v11, Lcom/cmic/sso/sdk/c/b/h;

    .line 63
    .line 64
    if-nez v12, :cond_0

    .line 65
    .line 66
    instance-of v12, v11, Lcom/cmic/sso/sdk/c/b/e;

    .line 67
    .line 68
    if-eqz v12, :cond_1

    .line 69
    .line 70
    goto :goto_4

    .line 71
    :catchall_0
    move-exception v0

    .line 72
    move-object/from16 v16, v7

    .line 73
    .line 74
    const/4 v12, 0x0

    .line 75
    :goto_0
    const/4 v13, 0x0

    .line 76
    :goto_1
    const/4 v14, 0x0

    .line 77
    const/4 v15, -0x1

    .line 78
    goto/16 :goto_16

    .line 79
    .line 80
    :catch_0
    move-exception v0

    .line 81
    move-object/from16 v16, v7

    .line 82
    .line 83
    const/4 v12, 0x0

    .line 84
    :goto_2
    const/4 v13, 0x0

    .line 85
    :goto_3
    const/4 v14, 0x0

    .line 86
    const/4 v15, -0x1

    .line 87
    goto/16 :goto_11

    .line 88
    .line 89
    :cond_0
    :goto_4
    invoke-virtual {v4, v5}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v12

    .line 93
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 94
    .line 95
    .line 96
    move-result v17

    .line 97
    if-nez v17, :cond_1

    .line 98
    .line 99
    new-instance v15, Ljava/net/URL;

    .line 100
    .line 101
    invoke-virtual {v0, v14, v12}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-direct {v15, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    const/4 v0, 0x1

    .line 109
    goto :goto_5

    .line 110
    :cond_1
    const/4 v0, 0x0

    .line 111
    :goto_5
    invoke-virtual {v2}, Lcom/cmic/sso/sdk/c/c/c;->g()Landroid/net/Network;

    .line 112
    .line 113
    .line 114
    move-result-object v12

    .line 115
    if-eqz v12, :cond_2

    .line 116
    .line 117
    const-string v12, "\u5f00\u59cbwifi\u4e0b\u53d6\u53f7"

    .line 118
    .line 119
    invoke-static {v9, v12}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v2}, Lcom/cmic/sso/sdk/c/c/c;->g()Landroid/net/Network;

    .line 123
    .line 124
    .line 125
    move-result-object v12

    .line 126
    invoke-virtual {v12, v15}, Landroid/net/Network;->openConnection(Ljava/net/URL;)Ljava/net/URLConnection;

    .line 127
    .line 128
    .line 129
    move-result-object v12

    .line 130
    check-cast v12, Ljava/net/HttpURLConnection;

    .line 131
    .line 132
    goto :goto_6

    .line 133
    :cond_2
    const-string v12, "\u4f7f\u7528\u5f53\u524d\u7f51\u7edc\u73af\u5883\u53d1\u9001\u8bf7\u6c42"

    .line 134
    .line 135
    invoke-static {v9, v12}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v15}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 139
    .line 140
    .line 141
    move-result-object v12

    .line 142
    check-cast v12, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 143
    .line 144
    :goto_6
    :try_start_1
    invoke-virtual {v2}, Lcom/cmic/sso/sdk/c/c/c;->c()Ljava/util/Map;

    .line 145
    .line 146
    .line 147
    move-result-object v15
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_8
    .catchall {:try_start_1 .. :try_end_1} :catchall_8

    .line 148
    if-eqz v15, :cond_3

    .line 149
    .line 150
    :try_start_2
    invoke-interface {v15}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 151
    .line 152
    .line 153
    move-result-object v17

    .line 154
    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 155
    .line 156
    .line 157
    move-result-object v17

    .line 158
    :goto_7
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    .line 159
    .line 160
    .line 161
    move-result v18

    .line 162
    if-eqz v18, :cond_3

    .line 163
    .line 164
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v18

    .line 168
    move-object/from16 v13, v18

    .line 169
    .line 170
    check-cast v13, Ljava/lang/String;

    .line 171
    .line 172
    invoke-interface {v15, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v18

    .line 176
    move/from16 v19, v0

    .line 177
    .line 178
    move-object/from16 v0, v18

    .line 179
    .line 180
    check-cast v0, Ljava/lang/String;

    .line 181
    .line 182
    invoke-virtual {v12, v13, v0}, Ljava/net/URLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 183
    .line 184
    .line 185
    move/from16 v0, v19

    .line 186
    .line 187
    goto :goto_7

    .line 188
    :catchall_1
    move-exception v0

    .line 189
    move-object/from16 v16, v7

    .line 190
    .line 191
    goto :goto_0

    .line 192
    :catch_1
    move-exception v0

    .line 193
    move-object/from16 v16, v7

    .line 194
    .line 195
    goto :goto_2

    .line 196
    :cond_3
    move/from16 v19, v0

    .line 197
    .line 198
    :try_start_3
    instance-of v0, v12, Ljavax/net/ssl/HttpsURLConnection;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_8
    .catchall {:try_start_3 .. :try_end_3} :catchall_8

    .line 199
    .line 200
    if-eqz v0, :cond_4

    .line 201
    .line 202
    :try_start_4
    instance-of v0, v11, Lcom/cmic/sso/sdk/c/b/h;

    .line 203
    .line 204
    if-nez v0, :cond_5

    .line 205
    .line 206
    instance-of v0, v11, Lcom/cmic/sso/sdk/c/b/e;

    .line 207
    .line 208
    if-eqz v0, :cond_4

    .line 209
    .line 210
    goto :goto_9

    .line 211
    :cond_4
    :goto_8
    const/4 v0, 0x1

    .line 212
    goto :goto_a

    .line 213
    :cond_5
    :goto_9
    if-eqz v19, :cond_6

    .line 214
    .line 215
    new-instance v0, Ljava/lang/StringBuilder;

    .line 216
    .line 217
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 218
    .line 219
    .line 220
    const-string v11, "host = "

    .line 221
    .line 222
    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-static {v9, v0}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    const-string v0, "Host"

    .line 236
    .line 237
    invoke-virtual {v12, v0, v14}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    const-string v0, "need sni handle"

    .line 241
    .line 242
    invoke-static {v9, v0}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    .line 244
    .line 245
    move-object v0, v12

    .line 246
    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    .line 247
    .line 248
    new-instance v11, Lcom/cmic/sso/sdk/c/d;

    .line 249
    .line 250
    move-object v13, v12

    .line 251
    check-cast v13, Ljavax/net/ssl/HttpsURLConnection;

    .line 252
    .line 253
    invoke-virtual {v2}, Lcom/cmic/sso/sdk/c/c/c;->g()Landroid/net/Network;

    .line 254
    .line 255
    .line 256
    move-result-object v15

    .line 257
    invoke-direct {v11, v13, v15, v4}, Lcom/cmic/sso/sdk/c/d;-><init>(Ljavax/net/ssl/HttpsURLConnection;Landroid/net/Network;Lcom/cmic/sso/sdk/a;)V

    .line 258
    .line 259
    .line 260
    invoke-virtual {v0, v11}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 261
    .line 262
    .line 263
    move-object v0, v12

    .line 264
    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    .line 265
    .line 266
    new-instance v11, Lcom/cmic/sso/sdk/c/a/a$1;

    .line 267
    .line 268
    invoke-direct {v11, v1, v14}, Lcom/cmic/sso/sdk/c/a/a$1;-><init>(Lcom/cmic/sso/sdk/c/a/a;Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {v0, v11}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 272
    .line 273
    .line 274
    goto :goto_8

    .line 275
    :cond_6
    move-object v0, v12

    .line 276
    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    .line 277
    .line 278
    invoke-virtual {v1, v11, v4}, Lcom/cmic/sso/sdk/c/a/a;->a(Lcom/cmic/sso/sdk/c/b/g;Lcom/cmic/sso/sdk/a;)Ljavax/net/ssl/SSLSocketFactory;

    .line 279
    .line 280
    .line 281
    move-result-object v11

    .line 282
    invoke-virtual {v0, v11}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 283
    .line 284
    .line 285
    goto :goto_8

    .line 286
    :goto_a
    :try_start_5
    invoke-virtual {v12, v0}, Ljava/net/URLConnection;->setDoInput(Z)V

    .line 287
    .line 288
    .line 289
    const/4 v0, 0x0

    .line 290
    invoke-virtual {v12, v0}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 291
    .line 292
    .line 293
    const/16 v11, 0x1388

    .line 294
    .line 295
    invoke-virtual {v12, v11}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 296
    .line 297
    .line 298
    invoke-virtual {v12, v11}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 299
    .line 300
    .line 301
    invoke-virtual {v12, v0}, Ljava/net/URLConnection;->setDefaultUseCaches(Z)V

    .line 302
    .line 303
    .line 304
    invoke-virtual {v2}, Lcom/cmic/sso/sdk/c/c/c;->e()Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    invoke-virtual {v12, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 309
    .line 310
    .line 311
    const/4 v11, 0x1

    .line 312
    invoke-virtual {v12, v11}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 313
    .line 314
    .line 315
    instance-of v11, v2, Lcom/cmic/sso/sdk/c/c/b;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_8
    .catchall {:try_start_5 .. :try_end_5} :catchall_8

    .line 316
    .line 317
    if-eqz v11, :cond_7

    .line 318
    .line 319
    :try_start_6
    invoke-virtual {v12}, Ljava/net/URLConnection;->connect()V

    .line 320
    .line 321
    .line 322
    move-object v11, v2

    .line 323
    check-cast v11, Lcom/cmic/sso/sdk/c/c/b;

    .line 324
    .line 325
    invoke-virtual {v11, v4}, Lcom/cmic/sso/sdk/c/c/b;->a(Lcom/cmic/sso/sdk/a;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 326
    .line 327
    .line 328
    :cond_7
    :try_start_7
    const-string v11, "POST"

    .line 329
    .line 330
    invoke-virtual {v0, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 331
    .line 332
    .line 333
    move-result v0
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_8
    .catchall {:try_start_7 .. :try_end_7} :catchall_8

    .line 334
    const-string v11, "utf-8"

    .line 335
    .line 336
    if-eqz v0, :cond_8

    .line 337
    .line 338
    :try_start_8
    invoke-virtual {v12}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    .line 339
    .line 340
    .line 341
    move-result-object v13
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 342
    :try_start_9
    invoke-virtual {v2}, Lcom/cmic/sso/sdk/c/c/c;->d()Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v0

    .line 346
    invoke-virtual {v0, v11}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 347
    .line 348
    .line 349
    move-result-object v0

    .line 350
    invoke-virtual {v13, v0}, Ljava/io/OutputStream;->write([B)V

    .line 351
    .line 352
    .line 353
    invoke-virtual {v13}, Ljava/io/OutputStream;->flush()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_2
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 354
    .line 355
    .line 356
    goto :goto_b

    .line 357
    :catchall_2
    move-exception v0

    .line 358
    move-object/from16 v16, v7

    .line 359
    .line 360
    goto/16 :goto_1

    .line 361
    .line 362
    :catch_2
    move-exception v0

    .line 363
    move-object/from16 v16, v7

    .line 364
    .line 365
    goto/16 :goto_3

    .line 366
    .line 367
    :cond_8
    const/4 v13, 0x0

    .line 368
    :goto_b
    :try_start_a
    invoke-virtual {v12}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 369
    .line 370
    .line 371
    move-result v15
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_7
    .catchall {:try_start_a .. :try_end_a} :catchall_7

    .line 372
    :try_start_b
    invoke-virtual {v12}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 373
    .line 374
    .line 375
    move-result-object v14
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_6
    .catchall {:try_start_b .. :try_end_b} :catchall_6

    .line 376
    const/16 v0, 0x800

    .line 377
    .line 378
    :try_start_c
    new-array v0, v0, [B

    .line 379
    .line 380
    :goto_c
    invoke-virtual {v14, v0}, Ljava/io/InputStream;->read([B)I

    .line 381
    .line 382
    .line 383
    move-result v2
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_5
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    .line 384
    if-lez v2, :cond_9

    .line 385
    .line 386
    move-object/from16 v16, v7

    .line 387
    .line 388
    :try_start_d
    new-instance v7, Ljava/lang/String;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_4
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    .line 389
    .line 390
    move-object/from16 v17, v12

    .line 391
    .line 392
    const/4 v12, 0x0

    .line 393
    :try_start_e
    invoke-direct {v7, v0, v12, v2, v11}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 394
    .line 395
    .line 396
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 397
    .line 398
    .line 399
    move-object/from16 v7, v16

    .line 400
    .line 401
    move-object/from16 v12, v17

    .line 402
    .line 403
    goto :goto_c

    .line 404
    :catchall_3
    move-exception v0

    .line 405
    move-object/from16 v12, v17

    .line 406
    .line 407
    goto/16 :goto_16

    .line 408
    .line 409
    :catch_3
    move-exception v0

    .line 410
    move-object/from16 v12, v17

    .line 411
    .line 412
    goto/16 :goto_11

    .line 413
    .line 414
    :catchall_4
    move-exception v0

    .line 415
    :goto_d
    move-object/from16 v17, v12

    .line 416
    .line 417
    goto/16 :goto_16

    .line 418
    .line 419
    :catch_4
    move-exception v0

    .line 420
    :goto_e
    move-object/from16 v17, v12

    .line 421
    .line 422
    goto/16 :goto_11

    .line 423
    .line 424
    :cond_9
    move-object/from16 v16, v7

    .line 425
    .line 426
    move-object/from16 v17, v12

    .line 427
    .line 428
    new-instance v0, Lcom/cmic/sso/sdk/c/d/b;

    .line 429
    .line 430
    invoke-virtual/range {v17 .. v17}, Ljava/net/URLConnection;->getHeaderFields()Ljava/util/Map;

    .line 431
    .line 432
    .line 433
    move-result-object v2

    .line 434
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 435
    .line 436
    .line 437
    move-result-object v7

    .line 438
    invoke-direct {v0, v15, v2, v7}, Lcom/cmic/sso/sdk/c/d/b;-><init>(ILjava/util/Map;Ljava/lang/String;)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_3
    .catchall {:try_start_e .. :try_end_e} :catchall_3

    .line 439
    .line 440
    .line 441
    invoke-direct {v1, v13}, Lcom/cmic/sso/sdk/c/a/a;->a(Ljava/io/Closeable;)V

    .line 442
    .line 443
    .line 444
    invoke-direct {v1, v14}, Lcom/cmic/sso/sdk/c/a/a;->a(Ljava/io/Closeable;)V

    .line 445
    .line 446
    .line 447
    invoke-virtual/range {v17 .. v17}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 448
    .line 449
    .line 450
    new-instance v1, Ljava/lang/StringBuilder;

    .line 451
    .line 452
    invoke-direct {v1, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 453
    .line 454
    .line 455
    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 456
    .line 457
    .line 458
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 459
    .line 460
    .line 461
    move-result-object v1

    .line 462
    invoke-static {v9, v1}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 463
    .line 464
    .line 465
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 466
    .line 467
    .line 468
    move-result v1

    .line 469
    if-eqz v1, :cond_a

    .line 470
    .line 471
    move-object/from16 v7, v16

    .line 472
    .line 473
    goto :goto_f

    .line 474
    :cond_a
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 475
    .line 476
    .line 477
    move-result-object v7

    .line 478
    :goto_f
    invoke-virtual {v6, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 479
    .line 480
    .line 481
    move-result-object v1

    .line 482
    invoke-static {v9, v1}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 483
    .line 484
    .line 485
    const/16 v1, 0xc8

    .line 486
    .line 487
    if-eq v15, v1, :cond_b

    .line 488
    .line 489
    const/16 v1, 0x12d

    .line 490
    .line 491
    if-eq v15, v1, :cond_b

    .line 492
    .line 493
    const/16 v1, 0x12e

    .line 494
    .line 495
    if-eq v15, v1, :cond_b

    .line 496
    .line 497
    :goto_10
    invoke-static {v15}, Lcom/cmic/sso/sdk/c/d/a;->a(I)Lcom/cmic/sso/sdk/c/d/a;

    .line 498
    .line 499
    .line 500
    move-result-object v0

    .line 501
    invoke-interface {v3, v0}, Lcom/cmic/sso/sdk/c/d/c;->a(Lcom/cmic/sso/sdk/c/d/a;)V

    .line 502
    .line 503
    .line 504
    return-void

    .line 505
    :cond_b
    invoke-interface {v3, v0}, Lcom/cmic/sso/sdk/c/d/c;->a(Lcom/cmic/sso/sdk/c/d/b;)V

    .line 506
    .line 507
    .line 508
    return-void

    .line 509
    :catchall_5
    move-exception v0

    .line 510
    move-object/from16 v16, v7

    .line 511
    .line 512
    goto :goto_d

    .line 513
    :catch_5
    move-exception v0

    .line 514
    move-object/from16 v16, v7

    .line 515
    .line 516
    goto :goto_e

    .line 517
    :catchall_6
    move-exception v0

    .line 518
    move-object/from16 v16, v7

    .line 519
    .line 520
    move-object/from16 v17, v12

    .line 521
    .line 522
    const/4 v14, 0x0

    .line 523
    goto/16 :goto_16

    .line 524
    .line 525
    :catch_6
    move-exception v0

    .line 526
    move-object/from16 v16, v7

    .line 527
    .line 528
    move-object/from16 v17, v12

    .line 529
    .line 530
    const/4 v14, 0x0

    .line 531
    goto :goto_11

    .line 532
    :catchall_7
    move-exception v0

    .line 533
    move-object/from16 v16, v7

    .line 534
    .line 535
    move-object/from16 v17, v12

    .line 536
    .line 537
    goto/16 :goto_1

    .line 538
    .line 539
    :catch_7
    move-exception v0

    .line 540
    move-object/from16 v16, v7

    .line 541
    .line 542
    move-object/from16 v17, v12

    .line 543
    .line 544
    goto/16 :goto_3

    .line 545
    .line 546
    :catchall_8
    move-exception v0

    .line 547
    move-object/from16 v16, v7

    .line 548
    .line 549
    move-object/from16 v17, v12

    .line 550
    .line 551
    goto/16 :goto_0

    .line 552
    .line 553
    :catch_8
    move-exception v0

    .line 554
    move-object/from16 v16, v7

    .line 555
    .line 556
    move-object/from16 v17, v12

    .line 557
    .line 558
    goto/16 :goto_2

    .line 559
    .line 560
    :goto_11
    :try_start_f
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 561
    .line 562
    .line 563
    new-instance v2, Ljava/lang/StringBuilder;

    .line 564
    .line 565
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 566
    .line 567
    .line 568
    const-string v7, "\u8bf7\u6c42\u5931\u8d25: "

    .line 569
    .line 570
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 571
    .line 572
    .line 573
    invoke-virtual/range {p1 .. p1}, Lcom/cmic/sso/sdk/c/c/c;->a()Ljava/lang/String;

    .line 574
    .line 575
    .line 576
    move-result-object v7

    .line 577
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 578
    .line 579
    .line 580
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 581
    .line 582
    .line 583
    move-result-object v2

    .line 584
    invoke-static {v9, v2}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 585
    .line 586
    .line 587
    invoke-virtual {v4}, Lcom/cmic/sso/sdk/a;->a()Lcom/cmic/sso/sdk/d/a;

    .line 588
    .line 589
    .line 590
    move-result-object v2

    .line 591
    iget-object v2, v2, Lcom/cmic/sso/sdk/d/a;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 592
    .line 593
    invoke-virtual {v2, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 594
    .line 595
    .line 596
    instance-of v2, v0, Ljava/io/EOFException;

    .line 597
    .line 598
    if-eqz v2, :cond_c

    .line 599
    .line 600
    const v2, 0x30d72

    .line 601
    .line 602
    .line 603
    :goto_12
    move v15, v2

    .line 604
    goto :goto_13

    .line 605
    :cond_c
    const v2, 0x18ed6

    .line 606
    .line 607
    .line 608
    goto :goto_12

    .line 609
    :goto_13
    instance-of v0, v0, Ljava/net/UnknownHostException;

    .line 610
    .line 611
    if-eqz v0, :cond_e

    .line 612
    .line 613
    invoke-virtual/range {p1 .. p1}, Lcom/cmic/sso/sdk/c/c/c;->j()Lcom/cmic/sso/sdk/c/b/g;

    .line 614
    .line 615
    .line 616
    move-result-object v0

    .line 617
    instance-of v0, v0, Lcom/cmic/sso/sdk/c/b/h;

    .line 618
    .line 619
    if-nez v0, :cond_d

    .line 620
    .line 621
    invoke-virtual/range {p1 .. p1}, Lcom/cmic/sso/sdk/c/c/c;->j()Lcom/cmic/sso/sdk/c/b/g;

    .line 622
    .line 623
    .line 624
    move-result-object v0

    .line 625
    instance-of v0, v0, Lcom/cmic/sso/sdk/c/b/e;

    .line 626
    .line 627
    if-eqz v0, :cond_e

    .line 628
    .line 629
    goto :goto_14

    .line 630
    :catchall_9
    move-exception v0

    .line 631
    goto :goto_16

    .line 632
    :cond_d
    :goto_14
    invoke-direct {v1}, Lcom/cmic/sso/sdk/c/a/a;->a()Ljava/lang/String;

    .line 633
    .line 634
    .line 635
    move-result-object v0

    .line 636
    invoke-virtual {v4, v5, v0}, Lcom/cmic/sso/sdk/a;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_9

    .line 637
    .line 638
    .line 639
    :cond_e
    invoke-direct {v1, v13}, Lcom/cmic/sso/sdk/c/a/a;->a(Ljava/io/Closeable;)V

    .line 640
    .line 641
    .line 642
    invoke-direct {v1, v14}, Lcom/cmic/sso/sdk/c/a/a;->a(Ljava/io/Closeable;)V

    .line 643
    .line 644
    .line 645
    if-eqz v12, :cond_f

    .line 646
    .line 647
    invoke-virtual {v12}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 648
    .line 649
    .line 650
    :cond_f
    new-instance v0, Ljava/lang/StringBuilder;

    .line 651
    .line 652
    invoke-direct {v0, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 653
    .line 654
    .line 655
    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 656
    .line 657
    .line 658
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 659
    .line 660
    .line 661
    move-result-object v0

    .line 662
    invoke-static {v9, v0}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 663
    .line 664
    .line 665
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 666
    .line 667
    .line 668
    move-result v0

    .line 669
    if-eqz v0, :cond_10

    .line 670
    .line 671
    move-object/from16 v7, v16

    .line 672
    .line 673
    goto :goto_15

    .line 674
    :cond_10
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 675
    .line 676
    .line 677
    move-result-object v7

    .line 678
    :goto_15
    invoke-virtual {v6, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 679
    .line 680
    .line 681
    move-result-object v0

    .line 682
    invoke-static {v9, v0}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 683
    .line 684
    .line 685
    goto/16 :goto_10

    .line 686
    .line 687
    :goto_16
    invoke-direct {v1, v13}, Lcom/cmic/sso/sdk/c/a/a;->a(Ljava/io/Closeable;)V

    .line 688
    .line 689
    .line 690
    invoke-direct {v1, v14}, Lcom/cmic/sso/sdk/c/a/a;->a(Ljava/io/Closeable;)V

    .line 691
    .line 692
    .line 693
    if-eqz v12, :cond_11

    .line 694
    .line 695
    invoke-virtual {v12}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 696
    .line 697
    .line 698
    :cond_11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 699
    .line 700
    invoke-direct {v1, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 701
    .line 702
    .line 703
    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 704
    .line 705
    .line 706
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 707
    .line 708
    .line 709
    move-result-object v1

    .line 710
    invoke-static {v9, v1}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 711
    .line 712
    .line 713
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 714
    .line 715
    .line 716
    move-result v1

    .line 717
    if-eqz v1, :cond_12

    .line 718
    .line 719
    move-object/from16 v7, v16

    .line 720
    .line 721
    goto :goto_17

    .line 722
    :cond_12
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 723
    .line 724
    .line 725
    move-result-object v7

    .line 726
    :goto_17
    invoke-virtual {v6, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 727
    .line 728
    .line 729
    move-result-object v1

    .line 730
    invoke-static {v9, v1}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 731
    .line 732
    .line 733
    const/16 v1, 0xc8

    .line 734
    .line 735
    if-eq v15, v1, :cond_13

    .line 736
    .line 737
    const/16 v1, 0x12d

    .line 738
    .line 739
    if-eq v15, v1, :cond_13

    .line 740
    .line 741
    const/16 v1, 0x12e

    .line 742
    .line 743
    if-eq v15, v1, :cond_13

    .line 744
    .line 745
    invoke-static {v15}, Lcom/cmic/sso/sdk/c/d/a;->a(I)Lcom/cmic/sso/sdk/c/d/a;

    .line 746
    .line 747
    .line 748
    move-result-object v1

    .line 749
    invoke-interface {v3, v1}, Lcom/cmic/sso/sdk/c/d/c;->a(Lcom/cmic/sso/sdk/c/d/a;)V

    .line 750
    .line 751
    .line 752
    goto :goto_18

    .line 753
    :cond_13
    const/4 v1, 0x0

    .line 754
    invoke-interface {v3, v1}, Lcom/cmic/sso/sdk/c/d/c;->a(Lcom/cmic/sso/sdk/c/d/b;)V

    .line 755
    .line 756
    .line 757
    :goto_18
    throw v0
.end method
