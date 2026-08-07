.class final Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Ll/drb;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0010\u0004\u001a\u00020\u0001*\u00020\u0000H\u008a@\u00a2\u0006\u0004\u0008\u0002\u0010\u0003"
    }
    d2 = {
        "Ll/drb;",
        "",
        "invoke",
        "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
        "<anonymous>"
    }
    k = 0x3
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.hellogroup.mk.business.bridge.BusinessMediaBridge$uploadAudio$1"
    f = "BusinessMediaBridge.kt"
    l = {}
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $audioFile:Ljava/io/File;

.field final synthetic $callback:Ljava/lang/String;

.field final synthetic $params:Lorg/json/JSONObject;

.field label:I

.field private p$:Ll/drb;

.field final synthetic this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ljava/io/File;Lorg/json/JSONObject;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    iput-object p2, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->$audioFile:Ljava/io/File;

    iput-object p3, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->$params:Lorg/json/JSONObject;

    iput-object p4, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->$callback:Ljava/lang/String;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p5}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 6
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lkotlin/coroutines/Continuation;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;

    iget-object v1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    iget-object v2, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->$audioFile:Ljava/io/File;

    iget-object v3, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->$params:Lorg/json/JSONObject;

    iget-object v4, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->$callback:Ljava/lang/String;

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;-><init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ljava/io/File;Lorg/json/JSONObject;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Ll/drb;

    iput-object p1, v0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->p$:Ll/drb;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const-string v1, "message"

    .line 2
    .line 3
    const-string v2, ""

    .line 4
    .line 5
    const-string v3, "status"

    .line 6
    .line 7
    const-string v0, "data"

    .line 8
    .line 9
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    iget v4, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->label:I

    .line 13
    .line 14
    if-nez v4, :cond_8

    .line 15
    .line 16
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 20
    .line 21
    invoke-static {p1}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->r(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    if-eqz p1, :cond_7

    .line 26
    .line 27
    iget-object p1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->$audioFile:Ljava/io/File;

    .line 28
    .line 29
    if-eqz p1, :cond_6

    .line 30
    .line 31
    invoke-static {}, Ll/gkw;->b()Ll/gkw;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Ll/gkw;->a()Ll/ivl;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    iget-object p1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->$audioFile:Ljava/io/File;

    .line 43
    .line 44
    filled-new-array {p1}, [Ljava/io/File;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->mutableListOf([Ljava/lang/Object;)Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    const-string v5, "audio/m3a"

    .line 53
    .line 54
    filled-new-array {v5}, [Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    invoke-static {v5}, Lkotlin/collections/CollectionsKt;->mutableListOf([Ljava/lang/Object;)Ljava/util/List;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    :try_start_0
    iget-object v6, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->$params:Lorg/json/JSONObject;

    .line 63
    .line 64
    const-string v7, "url"

    .line 65
    .line 66
    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    iget-object v7, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 71
    .line 72
    iget-object v8, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->$params:Lorg/json/JSONObject;

    .line 73
    .line 74
    const-string v9, "headers"

    .line 75
    .line 76
    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 77
    .line 78
    .line 79
    move-result-object v8

    .line 80
    invoke-static {v7, v8}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->w(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;)Ljava/util/HashMap;

    .line 81
    .line 82
    .line 83
    move-result-object v9

    .line 84
    iget-object v7, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 85
    .line 86
    iget-object v8, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->$params:Lorg/json/JSONObject;

    .line 87
    .line 88
    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 89
    .line 90
    .line 91
    move-result-object v8

    .line 92
    invoke-static {v7, v8}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->w(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;)Ljava/util/HashMap;

    .line 93
    .line 94
    .line 95
    move-result-object v7

    .line 96
    invoke-static {v6}, Ll/i8g0;->b(Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v8

    .line 100
    if-eqz v8, :cond_0

    .line 101
    .line 102
    iget-object v6, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 103
    .line 104
    invoke-virtual {v6}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->L()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v6

    .line 108
    goto :goto_0

    .line 109
    :catch_0
    move-exception v0

    .line 110
    move-object p1, v0

    .line 111
    goto/16 :goto_3

    .line 112
    .line 113
    :cond_0
    :goto_0
    sget-object v8, Lcom/hellogroup/mk/business/MKConfigSetter;->Companion:Lcom/hellogroup/mk/business/MKConfigSetter$Companion;

    .line 114
    .line 115
    invoke-virtual {v8}, Lcom/hellogroup/mk/business/MKConfigSetter$Companion;->b()Ll/ojw;

    .line 116
    .line 117
    .line 118
    move-result-object v8

    .line 119
    if-eqz v8, :cond_1

    .line 120
    .line 121
    iget-object v10, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 122
    .line 123
    invoke-static {v10}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->x(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Ll/hul;

    .line 124
    .line 125
    .line 126
    move-result-object v10

    .line 127
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 128
    .line 129
    .line 130
    invoke-interface {v10}, Ll/hul;->getOriginURL()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v10

    .line 134
    invoke-virtual {v8, v6, v10}, Ll/ojw;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v8

    .line 138
    if-eqz v8, :cond_1

    .line 139
    .line 140
    move-object v6, v8

    .line 141
    :cond_1
    check-cast p1, Ljava/util/Collection;

    .line 142
    .line 143
    const/4 v8, 0x0

    .line 144
    new-array v10, v8, [Ljava/io/File;

    .line 145
    .line 146
    invoke-interface {p1, v10}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    const-string v10, "null cannot be cast to non-null type kotlin.Array<T>"

    .line 151
    .line 152
    if-eqz p1, :cond_5

    .line 153
    .line 154
    :try_start_1
    check-cast p1, [Ljava/io/File;

    .line 155
    .line 156
    check-cast v5, Ljava/util/Collection;

    .line 157
    .line 158
    new-array v8, v8, [Ljava/lang/String;

    .line 159
    .line 160
    invoke-interface {v5, v8}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v5

    .line 164
    if-eqz v5, :cond_4

    .line 165
    .line 166
    move-object v8, v5

    .line 167
    check-cast v8, [Ljava/lang/String;

    .line 168
    .line 169
    const-string v5, "X-Putong-Cloud-Module"

    .line 170
    .line 171
    invoke-static {}, Ll/sjw;->d()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v10

    .line 175
    invoke-interface {v9, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-object v5, v6

    .line 179
    move-object v6, v7

    .line 180
    move-object v7, p1

    .line 181
    invoke-interface/range {v4 .. v9}, Ll/ivl;->b(Ljava/lang/String;Ljava/util/Map;[Ljava/io/File;[Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    new-instance v4, Lorg/json/JSONObject;

    .line 186
    .line 187
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 188
    .line 189
    .line 190
    const-string v5, "ec"

    .line 191
    .line 192
    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 193
    .line 194
    .line 195
    move-result v5

    .line 196
    if-eqz v5, :cond_3

    .line 197
    .line 198
    const/16 v6, 0xc8

    .line 199
    .line 200
    if-ne v5, v6, :cond_2

    .line 201
    .line 202
    goto :goto_1

    .line 203
    :cond_2
    const/4 v5, 0x1

    .line 204
    goto :goto_2

    .line 205
    :cond_3
    :goto_1
    const/4 v5, 0x3

    .line 206
    :goto_2
    const-string v6, "em"

    .line 207
    .line 208
    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v4

    .line 212
    new-instance v6, Lorg/json/JSONObject;

    .line 213
    .line 214
    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 215
    .line 216
    .line 217
    new-instance v7, Ljava/lang/StringBuilder;

    .line 218
    .line 219
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 220
    .line 221
    .line 222
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v5

    .line 226
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v5

    .line 236
    invoke-virtual {v6, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 237
    .line 238
    .line 239
    move-result-object v5

    .line 240
    invoke-virtual {v5, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 241
    .line 242
    .line 243
    move-result-object v4

    .line 244
    new-instance v5, Lorg/json/JSONObject;

    .line 245
    .line 246
    invoke-direct {v5, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    invoke-virtual {v4, v0, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 250
    .line 251
    .line 252
    iget-object p1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 253
    .line 254
    iget-object v0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->$callback:Ljava/lang/String;

    .line 255
    .line 256
    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v4

    .line 260
    invoke-static {p1, v0, v4}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->y(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    .line 262
    .line 263
    goto :goto_4

    .line 264
    :cond_4
    new-instance p1, Lkotlin/TypeCastException;

    .line 265
    .line 266
    invoke-direct {p1, v10}, Lkotlin/TypeCastException;-><init>(Ljava/lang/String;)V

    .line 267
    .line 268
    .line 269
    throw p1

    .line 270
    :cond_5
    new-instance p1, Lkotlin/TypeCastException;

    .line 271
    .line 272
    invoke-direct {p1, v10}, Lkotlin/TypeCastException;-><init>(Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    throw p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 276
    :goto_3
    const-string v0, "MediaExtraBridge"

    .line 277
    .line 278
    invoke-static {v0, v2, p1}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 279
    .line 280
    .line 281
    filled-new-array {v3, v1}, [Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    const-string v1, "1"

    .line 286
    .line 287
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object p1

    .line 291
    filled-new-array {v1, p1}, [Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object p1

    .line 295
    invoke-static {v0, p1}, Ll/glw;->b([Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 296
    .line 297
    .line 298
    move-result-object p1

    .line 299
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 304
    .line 305
    .line 306
    iget-object v0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->this$0:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 307
    .line 308
    iget-object p0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$uploadAudio$1;->$callback:Ljava/lang/String;

    .line 309
    .line 310
    invoke-static {v0, p0, p1}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->y(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ljava/lang/String;Ljava/lang/String;)V

    .line 311
    .line 312
    .line 313
    :goto_4
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 314
    .line 315
    return-object p0

    .line 316
    :cond_6
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 317
    .line 318
    return-object p0

    .line 319
    :cond_7
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 320
    .line 321
    return-object p0

    .line 322
    :cond_8
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 323
    .line 324
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    const/4 p0, 0x0

    .line 328
    return-object p0
.end method
