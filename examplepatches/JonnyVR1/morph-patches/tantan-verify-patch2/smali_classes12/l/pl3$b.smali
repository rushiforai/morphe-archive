.class final Ll/pl3$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/pl3;->x(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;ZLjava/lang/String;)V
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
.field final synthetic a:Ll/pl3;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Lorg/json/JSONObject;

.field final synthetic e:Lorg/json/JSONObject;

.field final synthetic f:Ljava/lang/String;

.field final synthetic g:Ljava/lang/String;

.field final synthetic h:Z


# direct methods
.method public constructor <init>(Ll/pl3;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pl3$b;->a:Ll/pl3;

    .line 2
    .line 3
    iput-object p2, p0, Ll/pl3$b;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/pl3$b;->c:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Ll/pl3$b;->d:Lorg/json/JSONObject;

    .line 8
    .line 9
    iput-object p5, p0, Ll/pl3$b;->e:Lorg/json/JSONObject;

    .line 10
    .line 11
    iput-object p6, p0, Ll/pl3$b;->f:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p7, p0, Ll/pl3$b;->g:Ljava/lang/String;

    .line 14
    .line 15
    iput-boolean p8, p0, Ll/pl3$b;->h:Z

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 11

    .line 1
    const-string v1, "tang-------\u6267\u884crequest\u8bf7\u6c42\u5931\u8d25 "

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v2

    .line 7
    iget-object v0, p0, Ll/pl3$b;->a:Ll/pl3;

    .line 8
    .line 9
    iget-object v4, p0, Ll/pl3$b;->b:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v5, p0, Ll/pl3$b;->c:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v6, p0, Ll/pl3$b;->d:Lorg/json/JSONObject;

    .line 14
    .line 15
    invoke-static {v0, v4, v5, v6}, Ll/pl3;->q(Ll/pl3;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget-object v4, Ll/qpl;->b:Ljava/lang/String;

    .line 20
    .line 21
    sget-object v5, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 22
    .line 23
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 24
    .line 25
    .line 26
    move-result-wide v5

    .line 27
    sub-long/2addr v5, v2

    .line 28
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    filled-new-array {v2, v0}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    const/4 v3, 0x2

    .line 37
    invoke-static {v2, v3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const-string v3, "check pre fetch cast: %d, data: %s"

    .line 42
    .line 43
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-static {v4, v2}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    iget-object v3, p0, Ll/pl3$b;->a:Ll/pl3;

    .line 55
    .line 56
    if-eqz v2, :cond_6

    .line 57
    .line 58
    :try_start_0
    invoke-static {v3}, Ll/pl3;->r(Ll/pl3;)Ll/hul;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const/4 v2, 0x0

    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    invoke-interface {v0}, Ll/hul;->getBid()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    move-object v3, v0

    .line 70
    move-object v0, v2

    .line 71
    goto :goto_0

    .line 72
    :catch_0
    move-exception v0

    .line 73
    goto :goto_2

    .line 74
    :cond_0
    move-object v0, v2

    .line 75
    move-object v3, v0

    .line 76
    :goto_0
    sget-object v2, Ll/pl3;->Companion:Ll/pl3$a;

    .line 77
    .line 78
    iget-object v4, p0, Ll/pl3$b;->b:Ljava/lang/String;

    .line 79
    .line 80
    iget-object v5, p0, Ll/pl3$b;->c:Ljava/lang/String;

    .line 81
    .line 82
    iget-object v6, p0, Ll/pl3$b;->d:Lorg/json/JSONObject;

    .line 83
    .line 84
    iget-object v7, p0, Ll/pl3$b;->e:Lorg/json/JSONObject;

    .line 85
    .line 86
    iget-object v8, p0, Ll/pl3$b;->f:Ljava/lang/String;

    .line 87
    .line 88
    iget-object v9, p0, Ll/pl3$b;->a:Ll/pl3;

    .line 89
    .line 90
    invoke-static {v9}, Ll/pl3;->r(Ll/pl3;)Ll/hul;

    .line 91
    .line 92
    .line 93
    move-result-object v9

    .line 94
    if-eqz v9, :cond_1

    .line 95
    .line 96
    invoke-interface {v9}, Ll/hul;->getResourceResponse()Ll/x4d0;

    .line 97
    .line 98
    .line 99
    move-result-object v9

    .line 100
    goto :goto_1

    .line 101
    :cond_1
    move-object v9, v0

    .line 102
    :goto_1
    iget-object v10, p0, Ll/pl3$b;->a:Ll/pl3;

    .line 103
    .line 104
    invoke-static {v10}, Ll/pl3;->r(Ll/pl3;)Ll/hul;

    .line 105
    .line 106
    .line 107
    move-result-object v10

    .line 108
    if-eqz v10, :cond_2

    .line 109
    .line 110
    invoke-interface {v10}, Ll/hul;->getWebViewUrl()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    :cond_2
    move-object v10, v0

    .line 115
    invoke-virtual/range {v2 .. v10}, Ll/pl3$a;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/String;Ll/x4d0;Ljava/lang/String;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iget-object v2, p0, Ll/pl3$b;->a:Ll/pl3;

    .line 120
    .line 121
    invoke-static {v2}, Ll/pl3;->r(Ll/pl3;)Ll/hul;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    if-eqz v2, :cond_3

    .line 126
    .line 127
    iget-object v2, p0, Ll/pl3$b;->a:Ll/pl3;

    .line 128
    .line 129
    invoke-static {v2}, Ll/pl3;->r(Ll/pl3;)Ll/hul;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-interface {v2}, Ll/hul;->e()Z

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    if-nez v2, :cond_3

    .line 138
    .line 139
    iget-object v2, p0, Ll/pl3$b;->a:Ll/pl3;

    .line 140
    .line 141
    invoke-static {v2}, Ll/pl3;->r(Ll/pl3;)Ll/hul;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 146
    .line 147
    .line 148
    invoke-interface {v2}, Ll/hul;->getWebWorkerId()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    const-string v3, "HttpBridge"

    .line 153
    .line 154
    const-string v4, "[MK\u9875\u9762\u63a5\u53e3\u8bf7\u6c42\u6210\u529f]request:mk:post @url=%s, @ts=%d"

    .line 155
    .line 156
    iget-object v5, p0, Ll/pl3$b;->b:Ljava/lang/String;

    .line 157
    .line 158
    invoke-static {}, Ll/hrw;->a()J

    .line 159
    .line 160
    .line 161
    move-result-wide v6

    .line 162
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 163
    .line 164
    .line 165
    move-result-object v6

    .line 166
    filled-new-array {v5, v6}, [Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v5

    .line 170
    invoke-static {v3, v2, v4, v5}, Lcom/immomo/mwc/sdk/MWCEngine;->D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 171
    .line 172
    .line 173
    :cond_3
    iget-object v2, p0, Ll/pl3$b;->a:Ll/pl3;

    .line 174
    .line 175
    iget-object v3, p0, Ll/pl3$b;->g:Ljava/lang/String;

    .line 176
    .line 177
    iget-boolean v4, p0, Ll/pl3$b;->h:Z

    .line 178
    .line 179
    invoke-static {v2, v0, v3, v4}, Ll/pl3;->t(Ll/pl3;Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 180
    .line 181
    .line 182
    return-void

    .line 183
    :goto_2
    sget-object v2, Ll/qpl;->b:Ljava/lang/String;

    .line 184
    .line 185
    const-string v3, ""

    .line 186
    .line 187
    invoke-static {v2, v3, v0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 188
    .line 189
    .line 190
    :try_start_1
    new-instance v4, Lorg/json/JSONObject;

    .line 191
    .line 192
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 193
    .line 194
    .line 195
    const-string v5, "ec"

    .line 196
    .line 197
    const/4 v6, -0x1

    .line 198
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 199
    .line 200
    .line 201
    const-string v5, "em"

    .line 202
    .line 203
    const-string v6, "\u7f51\u7edc\u8bf7\u6c42\u5931\u8d25"

    .line 204
    .line 205
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 206
    .line 207
    .line 208
    const-string v5, "data"

    .line 209
    .line 210
    invoke-virtual {v4, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 211
    .line 212
    .line 213
    const-string v5, "exmsg"

    .line 214
    .line 215
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    invoke-virtual {v4, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 220
    .line 221
    .line 222
    invoke-static {}, Ll/jzv;->f()Z

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    if-eqz v0, :cond_4

    .line 227
    .line 228
    new-instance v0, Ljava/lang/StringBuilder;

    .line 229
    .line 230
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    invoke-static {v2, v0}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    goto :goto_3

    .line 248
    :catch_1
    move-exception v0

    .line 249
    move-object p0, v0

    .line 250
    goto :goto_5

    .line 251
    :cond_4
    :goto_3
    iget-object v0, p0, Ll/pl3$b;->a:Ll/pl3;

    .line 252
    .line 253
    iget-object p0, p0, Ll/pl3$b;->g:Ljava/lang/String;

    .line 254
    .line 255
    if-eqz p0, :cond_5

    .line 256
    .line 257
    goto :goto_4

    .line 258
    :cond_5
    move-object p0, v3

    .line 259
    :goto_4
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v1

    .line 263
    invoke-static {v0, p0, v1}, Ll/pl3;->s(Ll/pl3;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 264
    .line 265
    .line 266
    goto :goto_6

    .line 267
    :goto_5
    sget-object v0, Ll/qpl;->b:Ljava/lang/String;

    .line 268
    .line 269
    invoke-static {v0, v3, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 270
    .line 271
    .line 272
    :goto_6
    return-void

    .line 273
    :cond_6
    iget-object v1, p0, Ll/pl3$b;->g:Ljava/lang/String;

    .line 274
    .line 275
    iget-boolean p0, p0, Ll/pl3$b;->h:Z

    .line 276
    .line 277
    invoke-static {v3, v0, v1, p0}, Ll/pl3;->t(Ll/pl3;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 278
    .line 279
    .line 280
    return-void
.end method
