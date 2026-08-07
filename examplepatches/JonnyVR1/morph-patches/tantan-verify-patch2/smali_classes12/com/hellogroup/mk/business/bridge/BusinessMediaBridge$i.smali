.class final Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->X(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "run"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

.field final synthetic b:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$i;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    iput-object p2, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$i;->b:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$i;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->x(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Ll/hul;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_d

    .line 8
    .line 9
    iget-object v0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$i;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->r(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_9

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$i;->b:Lorg/json/JSONObject;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const-string v2, "url"

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    move-object v0, v1

    .line 32
    :goto_0
    iget-object v2, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$i;->b:Lorg/json/JSONObject;

    .line 33
    .line 34
    const-string v3, ""

    .line 35
    .line 36
    if-eqz v2, :cond_2

    .line 37
    .line 38
    const-string v4, "callback"

    .line 39
    .line 40
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    if-eqz v2, :cond_2

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    move-object v2, v3

    .line 48
    :goto_1
    iget-object v4, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$i;->b:Lorg/json/JSONObject;

    .line 49
    .line 50
    if-eqz v4, :cond_3

    .line 51
    .line 52
    const-string v5, "files"

    .line 53
    .line 54
    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    goto :goto_2

    .line 59
    :cond_3
    move-object v4, v1

    .line 60
    :goto_2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    const-string v6, "1"

    .line 65
    .line 66
    if-nez v5, :cond_c

    .line 67
    .line 68
    if-eqz v4, :cond_c

    .line 69
    .line 70
    invoke-virtual {v4}, Lorg/json/JSONObject;->length()I

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    if-gtz v5, :cond_4

    .line 75
    .line 76
    goto/16 :goto_8

    .line 77
    .line 78
    :cond_4
    invoke-virtual {v4}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    invoke-virtual {v4}, Lorg/json/JSONObject;->length()I

    .line 83
    .line 84
    .line 85
    move-result v7

    .line 86
    new-array v11, v7, [Ljava/io/File;

    .line 87
    .line 88
    invoke-virtual {v4}, Lorg/json/JSONObject;->length()I

    .line 89
    .line 90
    .line 91
    move-result v7

    .line 92
    new-array v12, v7, [Ljava/lang/String;

    .line 93
    .line 94
    const/4 v7, 0x0

    .line 95
    move v8, v7

    .line 96
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 97
    .line 98
    .line 99
    move-result v9

    .line 100
    if-eqz v9, :cond_7

    .line 101
    .line 102
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v9

    .line 106
    check-cast v9, Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v4, v9, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v10

    .line 112
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 113
    .line 114
    .line 115
    invoke-static {v10}, Ll/wkw;->k(Ljava/lang/String;)Z

    .line 116
    .line 117
    .line 118
    move-result v13

    .line 119
    if-eqz v13, :cond_5

    .line 120
    .line 121
    invoke-static {v10}, Ll/wkw;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v10

    .line 125
    :cond_5
    new-instance v13, Ljava/io/File;

    .line 126
    .line 127
    invoke-direct {v13, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v13}, Ljava/io/File;->exists()Z

    .line 131
    .line 132
    .line 133
    move-result v10

    .line 134
    if-nez v10, :cond_6

    .line 135
    .line 136
    iget-object p0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$i;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 137
    .line 138
    const-string v0, "\u6587\u4ef6\u4e0d\u5b58\u5728"

    .line 139
    .line 140
    invoke-virtual {p0, v2, v1, v0, v6}, Ll/qpl;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_6
    add-int/lit8 v10, v8, 0x1

    .line 145
    .line 146
    aput-object v9, v12, v8

    .line 147
    .line 148
    aput-object v13, v11, v8

    .line 149
    .line 150
    move v8, v10

    .line 151
    goto :goto_3

    .line 152
    :cond_7
    iget-object v4, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$i;->b:Lorg/json/JSONObject;

    .line 153
    .line 154
    const-string v5, "params"

    .line 155
    .line 156
    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    new-instance v10, Ljava/util/HashMap;

    .line 161
    .line 162
    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 163
    .line 164
    .line 165
    if-eqz v4, :cond_8

    .line 166
    .line 167
    invoke-virtual {v4}, Lorg/json/JSONObject;->length()I

    .line 168
    .line 169
    .line 170
    move-result v5

    .line 171
    if-lez v5, :cond_8

    .line 172
    .line 173
    invoke-virtual {v4}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 174
    .line 175
    .line 176
    move-result-object v5

    .line 177
    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 178
    .line 179
    .line 180
    move-result v6

    .line 181
    if-eqz v6, :cond_8

    .line 182
    .line 183
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object v6

    .line 187
    check-cast v6, Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v8

    .line 193
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 197
    .line 198
    .line 199
    invoke-interface {v10, v6, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    goto :goto_4

    .line 203
    :cond_8
    const-string v4, "uuid"

    .line 204
    .line 205
    invoke-virtual {v10, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v5

    .line 209
    if-eqz v5, :cond_9

    .line 210
    .line 211
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 212
    .line 213
    .line 214
    move-result-object v5

    .line 215
    invoke-virtual {v5}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v5

    .line 219
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 220
    .line 221
    .line 222
    invoke-interface {v10, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    :cond_9
    invoke-static {}, Ll/gkw;->b()Ll/gkw;

    .line 226
    .line 227
    .line 228
    move-result-object v4

    .line 229
    invoke-virtual {v4}, Ll/gkw;->a()Ll/ivl;

    .line 230
    .line 231
    .line 232
    move-result-object v8

    .line 233
    :try_start_0
    sget-object v4, Lcom/hellogroup/mk/business/MKConfigSetter;->Companion:Lcom/hellogroup/mk/business/MKConfigSetter$Companion;

    .line 234
    .line 235
    invoke-virtual {v4}, Lcom/hellogroup/mk/business/MKConfigSetter$Companion;->b()Ll/ojw;

    .line 236
    .line 237
    .line 238
    move-result-object v4

    .line 239
    if-eqz v4, :cond_b

    .line 240
    .line 241
    iget-object v5, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$i;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 242
    .line 243
    invoke-static {v5}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->x(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Ll/hul;

    .line 244
    .line 245
    .line 246
    move-result-object v5

    .line 247
    if-eqz v5, :cond_a

    .line 248
    .line 249
    invoke-interface {v5}, Ll/hul;->getOriginURL()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v5

    .line 253
    goto :goto_5

    .line 254
    :catch_0
    move-exception v0

    .line 255
    goto :goto_7

    .line 256
    :cond_a
    move-object v5, v1

    .line 257
    :goto_5
    invoke-virtual {v4, v0, v5}, Ll/ojw;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v4

    .line 261
    if-eqz v4, :cond_b

    .line 262
    .line 263
    move-object v9, v4

    .line 264
    goto :goto_6

    .line 265
    :cond_b
    move-object v9, v0

    .line 266
    :goto_6
    const/4 v13, 0x0

    .line 267
    invoke-interface/range {v8 .. v13}, Ll/ivl;->b(Ljava/lang/String;Ljava/util/Map;[Ljava/io/File;[Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    new-instance v4, Lorg/json/JSONObject;

    .line 272
    .line 273
    invoke-direct {v4, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    iget-object v0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$i;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 277
    .line 278
    const-string v5, "\u6210\u529f"

    .line 279
    .line 280
    invoke-virtual {v0, v2, v4, v5, v7}, Ll/qpl;->j(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 281
    .line 282
    .line 283
    return-void

    .line 284
    :goto_7
    const-string v4, "MediaExtraBridge"

    .line 285
    .line 286
    invoke-static {v4, v3, v0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 287
    .line 288
    .line 289
    iget-object p0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$i;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 290
    .line 291
    const-string v0, "\u5931\u8d25"

    .line 292
    .line 293
    const/4 v3, 0x1

    .line 294
    invoke-virtual {p0, v2, v1, v0, v3}, Ll/qpl;->j(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;I)V

    .line 295
    .line 296
    .line 297
    return-void

    .line 298
    :cond_c
    :goto_8
    iget-object p0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$i;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 299
    .line 300
    const-string v0, "\u53c2\u6570\u9519\u8bef"

    .line 301
    .line 302
    invoke-virtual {p0, v2, v1, v0, v6}, Ll/qpl;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 303
    .line 304
    .line 305
    :cond_d
    :goto_9
    return-void
.end method
