.class public Ll/lmq;
.super Ll/ef00;
.source "SourceFile"


# static fields
.field private static c:Ll/b6g0;

.field private static d:Ll/yse0;

.field private static e:Ll/klw;

.field private static f:Ljava/lang/String;


# instance fields
.field private b:Lcom/quickjs/JSObject;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ef00;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/lmq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lcom/quickjs/JSFunction;Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;Ljava/lang/String;Ljava/lang/String;)V
    .locals 14

    .line 1
    move-object/from16 v5, p2

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    new-instance v3, Ljava/util/concurrent/atomic/AtomicReference;

    .line 7
    .line 8
    invoke-direct {v3}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Lcom/immomo/mwc/sdk/MWCEngine;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v7

    .line 15
    const/4 v8, 0x0

    .line 16
    :try_start_0
    invoke-static/range {p2 .. p4}, Lcom/immomo/mwc/sdk/WebResourcePool;->f(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {p1, v0}, Lcom/immomo/mwc/sdk/WebResourcePool;->d(Ljava/lang/String;Ljava/lang/String;)Lcom/immomo/mwc/sdk/WebResourcePool$b;

    .line 21
    .line 22
    .line 23
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_6

    .line 24
    const/4 v9, 0x1

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    :try_start_1
    invoke-virtual {v0}, Lcom/immomo/mwc/sdk/WebResourcePool$b;->h()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-ne v1, v9, :cond_0

    .line 32
    .line 33
    const-string v1, "JavaScriptAPIModule"

    .line 34
    .line 35
    const-string v2, "[Web\u5bb9\u5668\u53d1\u8d77\u91cd\u590d\u8bf7\u6c42\u5e76\u547d\u4e2d\u5bb9\u5668\u5df2\u6709\u7f13\u5b58]web:request:start:reuse @url=%s, @ts=%d, @version=[%s] %s"

    .line 36
    .line 37
    invoke-static {}, Ll/hrw;->a()J

    .line 38
    .line 39
    .line 40
    move-result-wide v9

    .line 41
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    const-string v6, "[STYLE:6d117d,f6e6ff,f4b3ff]"

    .line 46
    .line 47
    filled-new-array {v5, v4, v7, v6}, [Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-static {v1, p1, v2, v4}, Lcom/immomo/mwc/sdk/MWCEngine;->D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/immomo/mwc/sdk/WebResourcePool$b;->g()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    move-object v1, p0

    .line 63
    move-object v6, p1

    .line 64
    move-object/from16 v2, p5

    .line 65
    .line 66
    invoke-direct/range {v1 .. v6}, Ll/lmq;->c(Lcom/quickjs/JSFunction;Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :catch_0
    move-exception v0

    .line 71
    move-object v10, v3

    .line 72
    move-object/from16 v5, p2

    .line 73
    .line 74
    :goto_0
    move-object v1, v8

    .line 75
    goto/16 :goto_6

    .line 76
    .line 77
    :cond_0
    move-object v10, v3

    .line 78
    :try_start_2
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->p()Ll/iml;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    if-eqz v0, :cond_2

    .line 83
    .line 84
    new-instance v1, Ll/kmq;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5

    .line 85
    .line 86
    move-object v2, p0

    .line 87
    move-object v3, p1

    .line 88
    move-object/from16 v4, p2

    .line 89
    .line 90
    move-object/from16 v5, p3

    .line 91
    .line 92
    move-object/from16 v6, p4

    .line 93
    .line 94
    :try_start_3
    invoke-direct/range {v1 .. v6}, Ll/kmq;-><init>(Ll/lmq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    .line 95
    .line 96
    .line 97
    move-object v11, v1

    .line 98
    move-object v5, v4

    .line 99
    move-object/from16 v1, p6

    .line 100
    .line 101
    :try_start_4
    invoke-virtual {v11, v1}, Lcom/immomo/mwc/sdk/WebResourcePool$b;->j(Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;)V

    .line 102
    .line 103
    .line 104
    invoke-static {v11}, Lcom/immomo/mwc/sdk/WebResourcePool;->i(Lcom/immomo/mwc/sdk/WebResourcePool$b;)Z

    .line 105
    .line 106
    .line 107
    const-string v1, "__mwc__"

    .line 108
    .line 109
    move-object/from16 v4, p4

    .line 110
    .line 111
    invoke-virtual {v4, v1, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 112
    .line 113
    .line 114
    const-string v1, "JavaScriptAPIModule"

    .line 115
    .line 116
    const-string v2, "[Web\u5bb9\u5668\u53d1\u8d77\u8bf7\u6c42]web:request:start @url=%s, @ts=%d, @version=[%s] %s"

    .line 117
    .line 118
    invoke-static {}, Ll/hrw;->a()J

    .line 119
    .line 120
    .line 121
    move-result-wide v12

    .line 122
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    const-string v12, "[STYLE:9c27b0,f6e6ff,f4b3ff]"

    .line 127
    .line 128
    filled-new-array {v5, v3, v7, v12}, [Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    invoke-static {v1, p1, v2, v3}, Lcom/immomo/mwc/sdk/MWCEngine;->D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 133
    .line 134
    .line 135
    move-object/from16 v3, p3

    .line 136
    .line 137
    move-object/from16 v1, p7

    .line 138
    .line 139
    move-object v2, v5

    .line 140
    move-object/from16 v5, p8

    .line 141
    .line 142
    :try_start_5
    invoke-interface/range {v0 .. v5}, Ll/iml;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v4
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 146
    move-object v5, v2

    .line 147
    :try_start_6
    const-string v0, "JavaScriptAPIModule"

    .line 148
    .line 149
    const-string v1, "[Web\u5bb9\u5668\u8bf7\u6c42\u6210\u529f]web:request:success @url=%s, @response=%s, @ts=%d, @version=[%s] %s"

    .line 150
    .line 151
    if-nez v4, :cond_1

    .line 152
    .line 153
    const/4 v2, -0x1

    .line 154
    goto :goto_1

    .line 155
    :cond_1
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    :goto_1
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    invoke-static {}, Ll/hrw;->a()J

    .line 164
    .line 165
    .line 166
    move-result-wide v12

    .line 167
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    const-string v12, "[STYLE:9c27b0,f6e6ff,f4b3ff]"

    .line 172
    .line 173
    filled-new-array {v5, v2, v3, v7, v12}, [Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v2

    .line 177
    invoke-static {v0, p1, v1, v2}, Lcom/immomo/mwc/sdk/MWCEngine;->D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 178
    .line 179
    .line 180
    monitor-enter v11
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    .line 181
    :try_start_7
    invoke-virtual {v11, v4}, Lcom/immomo/mwc/sdk/WebResourcePool$b;->k(Ljava/lang/Object;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v11, v9}, Lcom/immomo/mwc/sdk/WebResourcePool$b;->l(I)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {v11}, Ljava/lang/Object;->notifyAll()V

    .line 188
    .line 189
    .line 190
    monitor-exit v11
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 191
    move-object v1, p0

    .line 192
    move-object v6, p1

    .line 193
    move-object/from16 v2, p5

    .line 194
    .line 195
    move-object v3, v10

    .line 196
    :try_start_8
    invoke-direct/range {v1 .. v6}, Ll/lmq;->c(Lcom/quickjs/JSFunction;Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1

    .line 197
    .line 198
    .line 199
    return-void

    .line 200
    :catch_1
    move-exception v0

    .line 201
    :goto_2
    move-object v1, v11

    .line 202
    goto :goto_6

    .line 203
    :catchall_0
    move-exception v0

    .line 204
    move-object v3, v10

    .line 205
    :goto_3
    :try_start_9
    monitor-exit v11
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 206
    :try_start_a
    throw v0
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1

    .line 207
    :catchall_1
    move-exception v0

    .line 208
    goto :goto_3

    .line 209
    :catch_2
    move-exception v0

    .line 210
    :goto_4
    move-object v3, v10

    .line 211
    goto :goto_2

    .line 212
    :catch_3
    move-exception v0

    .line 213
    move-object v5, v2

    .line 214
    goto :goto_4

    .line 215
    :catch_4
    move-exception v0

    .line 216
    move-object v5, v4

    .line 217
    :goto_5
    move-object v3, v10

    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :catch_5
    move-exception v0

    .line 221
    move-object/from16 v5, p2

    .line 222
    .line 223
    goto :goto_5

    .line 224
    :cond_2
    return-void

    .line 225
    :catch_6
    move-exception v0

    .line 226
    goto/16 :goto_0

    .line 227
    .line 228
    :goto_6
    const-string v2, "JavaScriptAPIModule"

    .line 229
    .line 230
    const-string v4, "[Web\u5bb9\u5668\u8bf7\u6c42\u5931\u8d25]web:request:error @url=%s, @version=[%s], @error=%s"

    .line 231
    .line 232
    filled-new-array {v5, v7, v0}, [Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object v7

    .line 236
    invoke-static {v2, p1, v4, v7}, Lcom/immomo/mwc/sdk/MWCEngine;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v3, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 240
    .line 241
    .line 242
    if-eqz v1, :cond_3

    .line 243
    .line 244
    monitor-enter v1

    .line 245
    :try_start_b
    invoke-virtual {v1, v8}, Lcom/immomo/mwc/sdk/WebResourcePool$b;->k(Ljava/lang/Object;)V

    .line 246
    .line 247
    .line 248
    const/4 v0, 0x2

    .line 249
    invoke-virtual {v1, v0}, Lcom/immomo/mwc/sdk/WebResourcePool$b;->l(I)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v1}, Lcom/immomo/mwc/sdk/WebResourcePool$b;->f()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    invoke-static {v0, p1}, Lcom/immomo/mwc/sdk/WebResourcePool;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 260
    .line 261
    .line 262
    monitor-exit v1

    .line 263
    goto :goto_7

    .line 264
    :catchall_2
    move-exception v0

    .line 265
    move-object p0, v0

    .line 266
    monitor-exit v1
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 267
    throw p0

    .line 268
    :cond_3
    :goto_7
    const/4 v4, 0x0

    .line 269
    move-object v1, p0

    .line 270
    move-object v6, p1

    .line 271
    move-object/from16 v2, p5

    .line 272
    .line 273
    invoke-direct/range {v1 .. v6}, Ll/lmq;->c(Lcom/quickjs/JSFunction;Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    return-void
.end method

.method private b(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lcom/quickjs/JSFunction;)V
    .locals 11

    .line 1
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {p2}, Ll/rre0;->f(Ljava/lang/String;)Lcom/immomo/mwc/sdk/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/immomo/mwc/sdk/c;->g()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v10

    .line 22
    new-instance v1, Ll/jmq;

    .line 23
    .line 24
    move-object v2, p0

    .line 25
    move-object v9, p1

    .line 26
    move-object v3, p2

    .line 27
    move-object v8, p3

    .line 28
    move-object v4, p4

    .line 29
    move-object/from16 v5, p5

    .line 30
    .line 31
    move-object/from16 v6, p6

    .line 32
    .line 33
    move-object/from16 v7, p7

    .line 34
    .line 35
    invoke-direct/range {v1 .. v10}, Ll/jmq;-><init>(Ll/lmq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lcom/quickjs/JSFunction;Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x2

    .line 39
    invoke-static {p0, v1}, Lcom/immomo/mwc/sdk/utils/thread/b;->d(ILjava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    :goto_0
    return-void
.end method

.method private c(Lcom/quickjs/JSFunction;Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/quickjs/JSFunction;",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ljava/lang/Throwable;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const-string p0, "JavaScriptAPIModule"

    .line 2
    .line 3
    if-eqz p1, :cond_4

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p1}, Lcom/quickjs/JSValue;->getContext()Lcom/quickjs/JSContext;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_4

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/quickjs/JSContext;->isReleased()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    goto :goto_2

    .line 18
    :cond_0
    invoke-static {p5}, Ll/rre0;->h(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-nez v1, :cond_1

    .line 23
    .line 24
    const-string p1, "[\u4e0d\u4f1a\u6267\u884cself.fetch\u7684\u56de\u8c03\u65b9\u6cd5(Worker\u4e0d\u5b58\u5728)]web:request:skipped:js:callback:cause:no:worker @url=%s"

    .line 25
    .line 26
    filled-new-array {p4}, [Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-static {p0, p5, p1, p2}, Lcom/immomo/mwc/sdk/MWCEngine;->D(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catch_0
    move-exception p1

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    new-instance v1, Lcom/quickjs/JSArray;

    .line 37
    .line 38
    invoke-direct {v1, v0}, Lcom/quickjs/JSArray;-><init>(Lcom/quickjs/JSContext;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    if-nez v2, :cond_3

    .line 46
    .line 47
    invoke-static {}, Lcom/quickjs/JSValue;->NULL()Lcom/quickjs/JSValue;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-virtual {v1, p2}, Lcom/quickjs/JSArray;->push(Lcom/quickjs/JSValue;)Lcom/quickjs/JSArray;

    .line 52
    .line 53
    .line 54
    new-instance p2, Lcom/quickjs/JSObject;

    .line 55
    .line 56
    invoke-direct {p2, v0}, Lcom/quickjs/JSObject;-><init>(Lcom/quickjs/JSContext;)V

    .line 57
    .line 58
    .line 59
    const-string v0, "data"

    .line 60
    .line 61
    if-nez p3, :cond_2

    .line 62
    .line 63
    const-string p3, "null"

    .line 64
    .line 65
    :cond_2
    invoke-virtual {p2, v0, p3}, Lcom/quickjs/JSObject;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/quickjs/JSObject;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-virtual {v1, p2}, Lcom/quickjs/JSArray;->push(Lcom/quickjs/JSValue;)Lcom/quickjs/JSArray;

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    check-cast p2, Ljava/lang/Throwable;

    .line 78
    .line 79
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-virtual {v1, p2}, Lcom/quickjs/JSArray;->push(Ljava/lang/String;)Lcom/quickjs/JSArray;

    .line 84
    .line 85
    .line 86
    invoke-static {}, Lcom/quickjs/JSValue;->NULL()Lcom/quickjs/JSValue;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-virtual {v1, p2}, Lcom/quickjs/JSArray;->push(Lcom/quickjs/JSValue;)Lcom/quickjs/JSArray;

    .line 91
    .line 92
    .line 93
    :goto_0
    const/4 p2, 0x0

    .line 94
    invoke-virtual {p1, p2, v1}, Lcom/quickjs/JSFunction;->call(Lcom/quickjs/JSObject;Lcom/quickjs/JSArray;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :goto_1
    const-string p2, "web:request:js:callback:exception @url=%s, @error=%s"

    .line 99
    .line 100
    filled-new-array {p4, p1}, [Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-static {p0, p5, p2, p1}, Lcom/immomo/mwc/sdk/MWCEngine;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    :cond_4
    :goto_2
    return-void
.end method

.method private d(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/HashMap;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    const-string p0, "get"

    .line 2
    .line 3
    sget-object v0, Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;->ONCE:Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;

    .line 4
    .line 5
    new-instance v1, Lorg/json/JSONObject;

    .line 6
    .line 7
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 8
    .line 9
    .line 10
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-static {v2}, Ll/nnj0;->a([Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const/4 v3, 0x0

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    check-cast p2, Lcom/quickjs/JSFunction;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move-object p2, v3

    .line 25
    :goto_0
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-static {v2}, Ll/nnj0;->b([Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    const-string v4, "data"

    .line 34
    .line 35
    const-string v5, "url"

    .line 36
    .line 37
    const-string v6, "method"

    .line 38
    .line 39
    const-string v7, "post"

    .line 40
    .line 41
    if-eqz v2, :cond_3

    .line 42
    .line 43
    check-cast p1, Lcom/quickjs/JSObject;

    .line 44
    .line 45
    :try_start_0
    const-string v2, "worker"

    .line 46
    .line 47
    const-string v8, "cacheType"

    .line 48
    .line 49
    invoke-virtual {p1, v8}, Lcom/quickjs/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v8

    .line 53
    invoke-virtual {v2, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_1

    .line 58
    .line 59
    sget-object v0, Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;->WORKER:Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .line 61
    :catch_0
    :cond_1
    :try_start_1
    invoke-virtual {p1, v6}, Lcom/quickjs/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {p0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 69
    if-eqz v2, :cond_2

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_2
    move-object p0, v7

    .line 73
    :goto_1
    move-object v7, p0

    .line 74
    :catch_1
    :try_start_2
    invoke-virtual {p1, v5}, Lcom/quickjs/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 78
    goto :goto_2

    .line 79
    :catch_2
    move-exception p0

    .line 80
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 81
    .line 82
    .line 83
    :goto_2
    :try_start_3
    invoke-virtual {p1, v4}, Lcom/quickjs/JSObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-static {p1}, Ll/nnj0;->c([Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_3

    .line 96
    .line 97
    check-cast p0, Lcom/quickjs/JSObject;

    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/quickjs/JSObject;->toJSONObject()Lorg/json/JSONObject;

    .line 100
    .line 101
    .line 102
    move-result-object v1
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 103
    goto :goto_3

    .line 104
    :catch_3
    move-exception p0

    .line 105
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 106
    .line 107
    .line 108
    :cond_3
    :goto_3
    new-instance p0, Ljava/util/HashMap;

    .line 109
    .line 110
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 111
    .line 112
    .line 113
    const-string p1, "cacheLifecycle"

    .line 114
    .line 115
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    invoke-virtual {p0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    const-string p1, "callback"

    .line 128
    .line 129
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    return-object p0
.end method


# virtual methods
.method public _trigger(Lcom/quickjs/JSObject;Ljava/lang/String;Lcom/quickjs/JSObject;)V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    const-string p0, "workerId"

    .line 2
    .line 3
    invoke-virtual {p3, p0}, Lcom/quickjs/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p2}, Lcom/immomo/mwc/sdk/EventType;->fromTypeName(Ljava/lang/String;)Lcom/immomo/mwc/sdk/EventType;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string p3, "trigger:native @eventName=%s, @workerId=%s"

    .line 12
    .line 13
    filled-new-array {p2, p0}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "JavaScriptAPIModule"

    .line 18
    .line 19
    invoke-static {v1, p0, p3, v0}, Lcom/immomo/mwc/sdk/MWCEngine;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p3

    .line 28
    if-nez p3, :cond_2

    .line 29
    .line 30
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    if-eqz p3, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    sget-object p3, Lcom/immomo/mwc/sdk/EventType;->MK_DESTROY:Lcom/immomo/mwc/sdk/EventType;

    .line 38
    .line 39
    if-ne p1, p3, :cond_1

    .line 40
    .line 41
    invoke-static {p0}, Lcom/immomo/mwc/sdk/WebResourcePool;->g(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p0}, Ll/rre0;->j(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    const-string p1, "trigger:native:unimplemented:event @eventName=%s, @workerId=%s"

    .line 49
    .line 50
    filled-new-array {p2, p0}, [Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-static {v1, p0, p1, p2}, Lcom/immomo/mwc/sdk/MWCEngine;->Q(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    :goto_0
    const-string p1, "trigger:native:invalid:arguments @eventName=%s, @workerId=%s"

    .line 59
    .line 60
    filled-new-array {p2, p0}, [Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-static {v1, p0, p1, p2}, Lcom/immomo/mwc/sdk/MWCEngine;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public clear(Lcom/quickjs/JSObject;)V
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    return-void
.end method

.method public close(Lcom/quickjs/JSContext;)V
    .locals 0

    .line 1
    return-void
.end method

.method public fetch(Lcom/quickjs/JSObject;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 9
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    const-string v0, "serviceId"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/quickjs/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    const-string v0, "workerId"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lcom/quickjs/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-direct {p0, p2, p3}, Ll/lmq;->d(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/HashMap;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string p2, "url"

    .line 18
    .line 19
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    move-object v5, p2

    .line 24
    check-cast v5, Ljava/lang/String;

    .line 25
    .line 26
    const-string p2, "cacheLifecycle"

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    move-object v4, p2

    .line 33
    check-cast v4, Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;

    .line 34
    .line 35
    const-string p2, "method"

    .line 36
    .line 37
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    move-object v6, p2

    .line 42
    check-cast v6, Ljava/lang/String;

    .line 43
    .line 44
    const-string p2, "data"

    .line 45
    .line 46
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    move-object v7, p2

    .line 51
    check-cast v7, Lorg/json/JSONObject;

    .line 52
    .line 53
    const-string p2, "callback"

    .line 54
    .line 55
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    move-object v8, p1

    .line 60
    check-cast v8, Lcom/quickjs/JSFunction;

    .line 61
    .line 62
    move-object v1, p0

    .line 63
    invoke-direct/range {v1 .. v8}, Ll/lmq;->b(Ljava/lang/String;Ljava/lang/String;Lcom/immomo/mwc/sdk/WebResourcePool$WebResourceLifecycle;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Lcom/quickjs/JSFunction;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public getCookie(Lcom/quickjs/JSObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    const-string p0, "serviceId"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/quickjs/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "workerId"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lcom/quickjs/JSObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const-string v1, ""

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    return-object v1

    .line 22
    :cond_0
    invoke-static {p1}, Ll/rre0;->f(Ljava/lang/String;)Lcom/immomo/mwc/sdk/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_5

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/immomo/mwc/sdk/c;->d()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_5

    .line 37
    .line 38
    sget-object v2, Ll/lmq;->d:Ll/yse0;

    .line 39
    .line 40
    if-nez v2, :cond_1

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    invoke-virtual {v0}, Lcom/immomo/mwc/sdk/c;->e()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-static {p0, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_4

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/immomo/mwc/sdk/c;->i()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p1, p0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-nez p0, :cond_2

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    sget-object p0, Ll/lmq;->d:Ll/yse0;

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/immomo/mwc/sdk/c;->d()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-interface {p0, p1}, Ll/yse0;->a(Ljava/lang/String;)Ljava/util/HashMap;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    check-cast p0, Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_3

    .line 85
    .line 86
    return-object v1

    .line 87
    :cond_3
    return-object p0

    .line 88
    :cond_4
    :goto_0
    const-string p0, "JavaScriptAPIModule"

    .line 89
    .line 90
    const-string p2, "not match js serviceId or workerId in java worker"

    .line 91
    .line 92
    invoke-static {p0, p1, p2}, Lcom/immomo/mwc/sdk/MWCEngine;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    :cond_5
    :goto_1
    return-object v1
.end method

.method public getItem(Lcom/quickjs/JSObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public getUa()Ljava/lang/String;
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    sget-object p0, Ll/lmq;->f:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Ll/lmq;->e:Ll/klw;

    .line 13
    .line 14
    invoke-interface {v0}, Ll/klw;->getUa()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sput-object p0, Ll/lmq;->f:Ljava/lang/String;

    .line 26
    .line 27
    :cond_0
    sget-object p0, Ll/lmq;->f:Ljava/lang/String;

    .line 28
    .line 29
    return-object p0
.end method

.method public setItem(Lcom/quickjs/JSObject;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public setup(Lcom/quickjs/JSContext;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->x()Ll/yse0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/lmq;->d:Ll/yse0;

    .line 6
    .line 7
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->y()Ll/b6g0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Ll/lmq;->c:Ll/b6g0;

    .line 12
    .line 13
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->v()Ll/klw;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Ll/lmq;->e:Ll/klw;

    .line 18
    .line 19
    const-string v0, "g_mwc_api"

    .line 20
    .line 21
    invoke-virtual {p1, p0, v0}, Lcom/quickjs/JSObject;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)Lcom/quickjs/JSObject;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/lmq;->b:Lcom/quickjs/JSObject;

    .line 26
    .line 27
    return-void
.end method
