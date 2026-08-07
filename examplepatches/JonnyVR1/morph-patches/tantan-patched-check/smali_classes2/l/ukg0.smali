.class public final Ll/ukg0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:I

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public final h:J

.field public final i:J

.field public final j:Ljava/util/HashMap;

.field public k:Ljava/lang/Boolean;

.field public l:Ljava/lang/Boolean;

.field public m:Ljava/lang/Integer;

.field public n:Ll/bxg0;

.field public o:Ljava/lang/Long;

.field public p:Ljava/lang/Integer;

.field public q:Ljava/lang/Long;

.field public r:Ljava/lang/Integer;

.field public s:Ljava/lang/Long;

.field public t:Ljava/lang/Long;

.field public u:Ljava/lang/Long;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/ukg0;->d:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput v1, p0, Ll/ukg0;->e:I

    .line 10
    .line 11
    const-string v1, "success"

    .line 12
    .line 13
    iput-object v1, p0, Ll/ukg0;->f:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v0, p0, Ll/ukg0;->g:Ljava/lang/String;

    .line 16
    .line 17
    new-instance v0, Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/ukg0;->j:Ljava/util/HashMap;

    .line 23
    .line 24
    iput-object p1, p0, Ll/ukg0;->a:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p1}, Ll/fug0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Ll/ukg0;->b:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    iput-wide v0, p0, Ll/ukg0;->h:J

    .line 37
    .line 38
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 39
    .line 40
    .line 41
    move-result-wide v0

    .line 42
    const-wide/32 v2, 0xf4240

    .line 43
    .line 44
    .line 45
    div-long/2addr v0, v2

    .line 46
    iput-wide v0, p0, Ll/ukg0;->i:J

    .line 47
    .line 48
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {p1}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iput-object p1, p0, Ll/ukg0;->c:Ljava/lang/String;

    .line 61
    .line 62
    return-void
.end method

.method public static a(Lorg/json/JSONObject;)V
    .locals 4

    .line 1
    invoke-static {}, Ltech/sud/base/utils/Utils;->getApp()Landroid/app/Application;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "proxy"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, ""

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-static {v0}, Ll/vzg0;->a(Landroid/app/Application;)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const-string v3, "net_type"

    .line 20
    .line 21
    invoke-virtual {p0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 22
    .line 23
    .line 24
    new-instance v2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Ll/vzg0;->c(Landroid/app/Application;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-static {v0}, Ll/vzg0;->b(Landroid/app/Application;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v3, :cond_1

    .line 38
    .line 39
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    :cond_1
    if-eqz v0, :cond_3

    .line 43
    .line 44
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-lez v0, :cond_2

    .line 49
    .line 50
    const-string v0, ","

    .line 51
    .line 52
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    :cond_2
    const-string v0, "vpn"

    .line 56
    .line 57
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    :cond_3
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 65
    .line 66
    .line 67
    return-void
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 12

    .line 1
    const-string v0, "ret_code"

    .line 2
    .line 3
    const-string v1, "ret_msg"

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    .line 8
    .line 9
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v4, "tag"

    .line 13
    .line 14
    const-string v5, "SudMGP"

    .line 15
    .line 16
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 17
    .line 18
    .line 19
    const-string v4, "app_id"

    .line 20
    .line 21
    sget-object v5, Ll/utg0;->g:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 24
    .line 25
    .line 26
    const-string v4, "mg_id"

    .line 27
    .line 28
    iget-object v5, p0, Ll/ukg0;->g:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 31
    .line 32
    .line 33
    const-string v4, "is_test_env"

    .line 34
    .line 35
    sget-boolean v5, Ll/utg0;->c:Z

    .line 36
    .line 37
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 38
    .line 39
    .line 40
    const-string v4, "env_type"

    .line 41
    .line 42
    sget v5, Ll/utg0;->f:I

    .line 43
    .line 44
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 45
    .line 46
    .line 47
    const-string v4, "sdk_version"

    .line 48
    .line 49
    const-string v5, "1.6.7.1286"

    .line 50
    .line 51
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 52
    .line 53
    .line 54
    const-string v4, "sdk_version_alias"

    .line 55
    .line 56
    const-string v5, "v1.6.7.1286-static"

    .line 57
    .line 58
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 59
    .line 60
    .line 61
    const-string v4, "et_is_dynamic"

    .line 62
    .line 63
    const/4 v5, 0x0

    .line 64
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 65
    .line 66
    .line 67
    const-string v4, "sud_is_dynamic"

    .line 68
    .line 69
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 70
    .line 71
    .line 72
    const-string v4, "event"

    .line 73
    .line 74
    iget-object v5, p0, Ll/ukg0;->a:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 77
    .line 78
    .line 79
    const-string v4, "event_id"

    .line 80
    .line 81
    iget-object v5, p0, Ll/ukg0;->b:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 84
    .line 85
    .line 86
    const-string v4, "trace_id"

    .line 87
    .line 88
    sget-object v5, Ll/utg0;->j:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 91
    .line 92
    .line 93
    const-string v4, "span_id"

    .line 94
    .line 95
    iget-object v5, p0, Ll/ukg0;->g:Ljava/lang/String;

    .line 96
    .line 97
    sget-object v6, Ll/fug0;->a:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v6

    .line 103
    if-eqz v6, :cond_0

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_0
    sget-object v6, Ll/fug0;->d:Ljava/util/HashMap;

    .line 107
    .line 108
    invoke-virtual {v6, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v5

    .line 112
    check-cast v5, Ljava/lang/String;

    .line 113
    .line 114
    if-nez v5, :cond_1

    .line 115
    .line 116
    :goto_0
    move-object v5, v2

    .line 117
    :cond_1
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 118
    .line 119
    .line 120
    const-string v4, "request_id"

    .line 121
    .line 122
    iget-object v5, p0, Ll/ukg0;->c:Ljava/lang/String;

    .line 123
    .line 124
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 125
    .line 126
    .line 127
    const-string v4, "user_id"

    .line 128
    .line 129
    sget-object v5, Ll/fug0;->a:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 132
    .line 133
    .line 134
    const-string v4, "platform"

    .line 135
    .line 136
    const/4 v5, 0x2

    .line 137
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 138
    .line 139
    .line 140
    const-string v4, "bundle_id"

    .line 141
    .line 142
    invoke-static {}, Ll/utg0;->d()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v5

    .line 146
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 147
    .line 148
    .line 149
    const-string v4, "start_timestamp"

    .line 150
    .line 151
    iget-wide v5, p0, Ll/ukg0;->h:J

    .line 152
    .line 153
    invoke-virtual {v3, v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 154
    .line 155
    .line 156
    const-string v4, "end_timestamp"

    .line 157
    .line 158
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 159
    .line 160
    .line 161
    move-result-wide v5

    .line 162
    invoke-virtual {v3, v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 163
    .line 164
    .line 165
    const-string v4, "cost_time"

    .line 166
    .line 167
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 168
    .line 169
    .line 170
    move-result-wide v5

    .line 171
    const-wide/32 v7, 0xf4240

    .line 172
    .line 173
    .line 174
    div-long/2addr v5, v7

    .line 175
    iget-wide v7, p0, Ll/ukg0;->i:J

    .line 176
    .line 177
    sub-long/2addr v5, v7

    .line 178
    iget-object v7, p0, Ll/ukg0;->o:Ljava/lang/Long;

    .line 179
    .line 180
    const-wide/16 v8, 0x0

    .line 181
    .line 182
    if-nez v7, :cond_2

    .line 183
    .line 184
    move-wide v10, v8

    .line 185
    goto :goto_1

    .line 186
    :cond_2
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    .line 187
    .line 188
    .line 189
    move-result-wide v10

    .line 190
    :goto_1
    sub-long/2addr v5, v10

    .line 191
    iget-object v7, p0, Ll/ukg0;->u:Ljava/lang/Long;

    .line 192
    .line 193
    if-nez v7, :cond_3

    .line 194
    .line 195
    goto :goto_2

    .line 196
    :cond_3
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    .line 197
    .line 198
    .line 199
    move-result-wide v8

    .line 200
    :goto_2
    sub-long/2addr v5, v8

    .line 201
    invoke-virtual {v3, v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 202
    .line 203
    .line 204
    new-instance v4, Lorg/json/JSONObject;

    .line 205
    .line 206
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 207
    .line 208
    .line 209
    iget-object v5, p0, Ll/ukg0;->j:Ljava/util/HashMap;

    .line 210
    .line 211
    invoke-virtual {v5}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 212
    .line 213
    .line 214
    move-result-object v5

    .line 215
    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 216
    .line 217
    .line 218
    move-result-object v5

    .line 219
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 220
    .line 221
    .line 222
    move-result v6

    .line 223
    if-eqz v6, :cond_4

    .line 224
    .line 225
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object v6

    .line 229
    check-cast v6, Ljava/util/Map$Entry;

    .line 230
    .line 231
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object v7

    .line 235
    check-cast v7, Ljava/lang/String;

    .line 236
    .line 237
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object v6

    .line 241
    invoke-virtual {v4, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 242
    .line 243
    .line 244
    goto :goto_3

    .line 245
    :cond_4
    iget-object v5, p0, Ll/ukg0;->f:Ljava/lang/String;

    .line 246
    .line 247
    invoke-virtual {v4, v1, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 248
    .line 249
    .line 250
    iget v5, p0, Ll/ukg0;->e:I

    .line 251
    .line 252
    invoke-virtual {v4, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 253
    .line 254
    .line 255
    const-string v5, "resp"

    .line 256
    .line 257
    iget-object v6, p0, Ll/ukg0;->d:Ljava/lang/String;

    .line 258
    .line 259
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 260
    .line 261
    .line 262
    const-string v5, "extras"

    .line 263
    .line 264
    invoke-virtual {v3, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 265
    .line 266
    .line 267
    iget v5, p0, Ll/ukg0;->e:I

    .line 268
    .line 269
    invoke-virtual {v3, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 270
    .line 271
    .line 272
    iget-object v0, p0, Ll/ukg0;->f:Ljava/lang/String;

    .line 273
    .line 274
    invoke-virtual {v3, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 275
    .line 276
    .line 277
    invoke-static {v3}, Ll/ukg0;->a(Lorg/json/JSONObject;)V

    .line 278
    .line 279
    .line 280
    const-string v0, "device_brand"

    .line 281
    .line 282
    invoke-static {}, Ll/pqg0;->a()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v1

    .line 286
    invoke-virtual {v3, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 287
    .line 288
    .line 289
    const-string v0, "os_version"

    .line 290
    .line 291
    invoke-static {}, Ll/pqg0;->d()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v1

    .line 295
    invoke-virtual {v3, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 296
    .line 297
    .line 298
    const-string v0, "device_id"

    .line 299
    .line 300
    invoke-static {}, Ll/pqg0;->c()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v1

    .line 304
    invoke-virtual {v3, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 305
    .line 306
    .line 307
    iget-object v0, p0, Ll/ukg0;->k:Ljava/lang/Boolean;

    .line 308
    .line 309
    if-eqz v0, :cond_5

    .line 310
    .line 311
    const-string v1, "local_pkg"

    .line 312
    .line 313
    invoke-virtual {v3, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 314
    .line 315
    .line 316
    :cond_5
    iget-object v0, p0, Ll/ukg0;->l:Ljava/lang/Boolean;

    .line 317
    .line 318
    if-eqz v0, :cond_6

    .line 319
    .line 320
    const-string v1, "local_core"

    .line 321
    .line 322
    invoke-virtual {v3, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 323
    .line 324
    .line 325
    :cond_6
    iget-object v0, p0, Ll/ukg0;->n:Ll/bxg0;

    .line 326
    .line 327
    if-eqz v0, :cond_7

    .line 328
    .line 329
    new-instance v0, Lorg/json/JSONObject;

    .line 330
    .line 331
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 332
    .line 333
    .line 334
    const-string v1, "dns"

    .line 335
    .line 336
    iget-object v5, p0, Ll/ukg0;->n:Ll/bxg0;

    .line 337
    .line 338
    iget-wide v5, v5, Ll/bxg0;->a:J

    .line 339
    .line 340
    invoke-virtual {v0, v1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 341
    .line 342
    .line 343
    const-string v1, "secure_connect"

    .line 344
    .line 345
    iget-object v5, p0, Ll/ukg0;->n:Ll/bxg0;

    .line 346
    .line 347
    iget-wide v5, v5, Ll/bxg0;->c:J

    .line 348
    .line 349
    invoke-virtual {v0, v1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 350
    .line 351
    .line 352
    const-string v1, "connect"

    .line 353
    .line 354
    iget-object v5, p0, Ll/ukg0;->n:Ll/bxg0;

    .line 355
    .line 356
    iget-wide v5, v5, Ll/bxg0;->b:J

    .line 357
    .line 358
    invoke-virtual {v0, v1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 359
    .line 360
    .line 361
    const-string v1, "request"

    .line 362
    .line 363
    iget-object v5, p0, Ll/ukg0;->n:Ll/bxg0;

    .line 364
    .line 365
    iget-wide v5, v5, Ll/bxg0;->d:J

    .line 366
    .line 367
    invoke-virtual {v0, v1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 368
    .line 369
    .line 370
    const-string v1, "response"

    .line 371
    .line 372
    iget-object v5, p0, Ll/ukg0;->n:Ll/bxg0;

    .line 373
    .line 374
    iget-wide v5, v5, Ll/bxg0;->e:J

    .line 375
    .line 376
    invoke-virtual {v0, v1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 377
    .line 378
    .line 379
    const-string v1, "chain_reuse"

    .line 380
    .line 381
    iget-object v5, p0, Ll/ukg0;->n:Ll/bxg0;

    .line 382
    .line 383
    iget-boolean v5, v5, Ll/bxg0;->g:Z

    .line 384
    .line 385
    invoke-virtual {v0, v1, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 386
    .line 387
    .line 388
    const-string v1, "server_response"

    .line 389
    .line 390
    iget-object v5, p0, Ll/ukg0;->n:Ll/bxg0;

    .line 391
    .line 392
    iget-wide v5, v5, Ll/bxg0;->f:J

    .line 393
    .line 394
    invoke-virtual {v0, v1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 395
    .line 396
    .line 397
    const-string v1, "cost_time_detail"

    .line 398
    .line 399
    invoke-virtual {v4, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 400
    .line 401
    .line 402
    :cond_7
    iget-object v0, p0, Ll/ukg0;->m:Ljava/lang/Integer;

    .line 403
    .line 404
    if-eqz v0, :cond_8

    .line 405
    .line 406
    const-string v1, "timeout_code"

    .line 407
    .line 408
    invoke-virtual {v3, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 409
    .line 410
    .line 411
    :cond_8
    iget-object v0, p0, Ll/ukg0;->o:Ljava/lang/Long;

    .line 412
    .line 413
    if-eqz v0, :cond_9

    .line 414
    .line 415
    const-string v1, "pause_cost_time"

    .line 416
    .line 417
    invoke-virtual {v3, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 418
    .line 419
    .line 420
    :cond_9
    iget-object v0, p0, Ll/ukg0;->p:Ljava/lang/Integer;

    .line 421
    .line 422
    if-eqz v0, :cond_a

    .line 423
    .line 424
    const-string v1, "last_percent"

    .line 425
    .line 426
    invoke-virtual {v3, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 427
    .line 428
    .line 429
    :cond_a
    iget-object v0, p0, Ll/ukg0;->q:Ljava/lang/Long;

    .line 430
    .line 431
    if-eqz v0, :cond_b

    .line 432
    .line 433
    const-string v1, "last_wait_timestamp"

    .line 434
    .line 435
    invoke-virtual {v3, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 436
    .line 437
    .line 438
    :cond_b
    iget-object v0, p0, Ll/ukg0;->r:Ljava/lang/Integer;

    .line 439
    .line 440
    if-eqz v0, :cond_c

    .line 441
    .line 442
    const-string v1, "is_background"

    .line 443
    .line 444
    invoke-virtual {v3, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 445
    .line 446
    .line 447
    :cond_c
    iget-object v0, p0, Ll/ukg0;->s:Ljava/lang/Long;

    .line 448
    .line 449
    if-eqz v0, :cond_d

    .line 450
    .line 451
    const-string v1, "total_space"

    .line 452
    .line 453
    invoke-virtual {v3, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 454
    .line 455
    .line 456
    :cond_d
    iget-object p0, p0, Ll/ukg0;->t:Ljava/lang/Long;

    .line 457
    .line 458
    if-eqz p0, :cond_e

    .line 459
    .line 460
    const-string v0, "free_space"

    .line 461
    .line 462
    invoke-virtual {v3, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 463
    .line 464
    .line 465
    :cond_e
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 466
    .line 467
    .line 468
    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 469
    return-object p0

    .line 470
    :catch_0
    return-object v2
.end method
