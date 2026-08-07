.class final Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->R(Lorg/json/JSONObject;)V
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

    iput-object p1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$e;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    iput-object p2, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$e;->b:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 13

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$e;->b:Lorg/json/JSONObject;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const-string v2, "callback"

    .line 7
    .line 8
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    move-object v2, v0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move-object v2, v1

    .line 15
    :goto_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$e;->b:Lorg/json/JSONObject;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    const-string v3, "data"

    .line 20
    .line 21
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    move-object v3, v0

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    move-object v3, v1

    .line 28
    :goto_1
    iget-object v0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$e;->b:Lorg/json/JSONObject;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const-string v4, "suffix"

    .line 33
    .line 34
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    goto :goto_2

    .line 39
    :cond_2
    move-object v0, v1

    .line 40
    :goto_2
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    iget-object v5, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$e;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 45
    .line 46
    const-string v9, "1"

    .line 47
    .line 48
    const-string v10, ""

    .line 49
    .line 50
    if-eqz v4, :cond_3

    .line 51
    .line 52
    const-string p0, "\u6587\u4ef6\u6570\u636e\u4e3a\u7a7a"

    .line 53
    .line 54
    invoke-virtual {v5, v2, v10, p0, v9}, Ll/qpl;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_3
    invoke-static {v5}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->r(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    if-eqz v4, :cond_4

    .line 63
    .line 64
    invoke-virtual {v4}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    if-eqz v4, :cond_4

    .line 69
    .line 70
    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    goto :goto_3

    .line 75
    :cond_4
    move-object v4, v1

    .line 76
    :goto_3
    iget-object v5, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$e;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 77
    .line 78
    const-string v11, "\u4fdd\u5b58\u6587\u4ef6\u5931\u8d25"

    .line 79
    .line 80
    if-nez v4, :cond_5

    .line 81
    .line 82
    invoke-virtual {v5, v2, v10, v11, v9}, Ll/qpl;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_5
    if-eqz v0, :cond_6

    .line 87
    .line 88
    move-object v6, v0

    .line 89
    goto :goto_4

    .line 90
    :cond_6
    move-object v6, v10

    .line 91
    :goto_4
    invoke-static {v5, v6}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->z(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ljava/lang/String;)Z

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    if-eqz v5, :cond_7

    .line 96
    .line 97
    const-string v5, "_"

    .line 98
    .line 99
    invoke-static {v0, v5}, Lkotlin/jvm/internal/Intrinsics;->l(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    :cond_7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 104
    .line 105
    .line 106
    move-result v5

    .line 107
    const/4 v12, 0x0

    .line 108
    if-nez v5, :cond_8

    .line 109
    .line 110
    if-eqz v0, :cond_8

    .line 111
    .line 112
    const/4 v5, 0x2

    .line 113
    const-string v6, "."

    .line 114
    .line 115
    invoke-static {v0, v6, v12, v5, v1}, Lkotlin/text/d;->J(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-nez v1, :cond_8

    .line 120
    .line 121
    invoke-virtual {v6, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    :cond_8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .line 129
    .line 130
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 131
    .line 132
    .line 133
    move-result-wide v5

    .line 134
    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v5

    .line 138
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    new-instance v1, Ljava/io/File;

    .line 149
    .line 150
    const-string v5, "/mkimg"

    .line 151
    .line 152
    invoke-virtual {v4, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v6

    .line 156
    invoke-direct {v1, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 160
    .line 161
    .line 162
    move-result v6

    .line 163
    if-nez v6, :cond_9

    .line 164
    .line 165
    invoke-virtual {v1}, Ljava/io/File;->mkdir()Z

    .line 166
    .line 167
    .line 168
    :cond_9
    new-instance v1, Ljava/io/File;

    .line 169
    .line 170
    invoke-virtual {v4, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    invoke-direct {v1, v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    if-eqz v3, :cond_a

    .line 178
    .line 179
    :try_start_0
    const-string v0, ","

    .line 180
    .line 181
    filled-new-array {v0}, [Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v4

    .line 185
    const/4 v7, 0x6

    .line 186
    const/4 v8, 0x0

    .line 187
    const/4 v5, 0x0

    .line 188
    const/4 v6, 0x0

    .line 189
    invoke-static/range {v3 .. v8}, Lkotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[Ljava/lang/String;ZIILjava/lang/Object;)Ljava/util/List;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    if-eqz v0, :cond_a

    .line 194
    .line 195
    goto :goto_5

    .line 196
    :catch_0
    move-exception v0

    .line 197
    goto :goto_8

    .line 198
    :cond_a
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    :goto_5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 203
    .line 204
    .line 205
    move-result v3

    .line 206
    const/4 v4, 0x1

    .line 207
    if-le v3, v4, :cond_b

    .line 208
    .line 209
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    :goto_6
    check-cast v0, Ljava/lang/String;

    .line 214
    .line 215
    goto :goto_7

    .line 216
    :cond_b
    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    goto :goto_6

    .line 221
    :goto_7
    invoke-static {v0, v12}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    invoke-static {v0, v1}, Lcom/hellogroup/common/file/FileUtil;->y([BLjava/io/File;)Z

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    if-eqz v0, :cond_c

    .line 230
    .line 231
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    const-string v1, "path"

    .line 236
    .line 237
    filled-new-array {v1}, [Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    filled-new-array {v0}, [Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    invoke-static {v1, v0}, Ll/glw;->b([Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 254
    .line 255
    .line 256
    iget-object v1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$e;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 257
    .line 258
    const-string v3, "\u6210\u529f"

    .line 259
    .line 260
    const-string v4, "0"

    .line 261
    .line 262
    invoke-virtual {v1, v2, v0, v3, v4}, Ll/qpl;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 263
    .line 264
    .line 265
    return-void

    .line 266
    :goto_8
    sget-object v1, Ll/qpl;->b:Ljava/lang/String;

    .line 267
    .line 268
    invoke-static {v1, v10, v0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 269
    .line 270
    .line 271
    :cond_c
    iget-object p0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$e;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 272
    .line 273
    invoke-virtual {p0, v2, v10, v11, v9}, Ll/qpl;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    return-void
.end method
