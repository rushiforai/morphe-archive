.class final Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/mmdns/DNSSlaLogger;->startLogging()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

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
    c = "com.immomo.mmdns.DNSSlaLogger$startLogging$1"
    f = "DNSSlaLogger.kt"
    l = {
        0x99
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field label:I

.field private p$:Ll/drb;


# direct methods
.method public constructor <init>(Lkotlin/coroutines/Continuation;)V
    .locals 1

    const/4 v0, 0x2

    invoke-direct {p0, v0, p1}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 0
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

    new-instance p0, Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1;

    invoke-direct {p0, p2}, Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1;-><init>(Lkotlin/coroutines/Continuation;)V

    check-cast p1, Ll/drb;

    iput-object p1, p0, Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1;->p$:Ll/drb;

    return-object p0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    iget v0, p0, Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1;->label:I

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    if-ne v0, v2, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1;->L$2:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Lkotlinx/coroutines/channels/ChannelIterator;

    .line 16
    .line 17
    iget-object v4, p0, Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1;->L$1:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v4, Ljava/util/Map;

    .line 20
    .line 21
    iget-object v5, p0, Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1;->L$0:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v5, Ll/drb;

    .line 24
    .line 25
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    move-object v6, v5

    .line 29
    move-object v5, v4

    .line 30
    move-object v4, v0

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 33
    .line 34
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-object v3

    .line 38
    :cond_2
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1;->p$:Ll/drb;

    .line 42
    .line 43
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 44
    .line 45
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 46
    .line 47
    .line 48
    sget-object v4, Lcom/immomo/mmdns/DNSSlaLogger;->INSTANCE:Lcom/immomo/mmdns/DNSSlaLogger;

    .line 49
    .line 50
    invoke-static {v4}, Lcom/immomo/mmdns/DNSSlaLogger;->access$getDnsLogChannel$p(Lcom/immomo/mmdns/DNSSlaLogger;)Ll/fs4;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-interface {v4}, Lkotlinx/coroutines/channels/ReceiveChannel;->iterator()Lkotlinx/coroutines/channels/ChannelIterator;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    move-object v5, v4

    .line 59
    move-object v4, v0

    .line 60
    move-object v0, v5

    .line 61
    move-object v5, p1

    .line 62
    :goto_0
    iput-object v5, p0, Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1;->L$0:Ljava/lang/Object;

    .line 63
    .line 64
    iput-object v4, p0, Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1;->L$1:Ljava/lang/Object;

    .line 65
    .line 66
    iput-object v0, p0, Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1;->L$2:Ljava/lang/Object;

    .line 67
    .line 68
    iput v2, p0, Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1;->label:I

    .line 69
    .line 70
    invoke-interface {v0, p0}, Lkotlinx/coroutines/channels/ChannelIterator;->a(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    if-ne p1, v1, :cond_0

    .line 75
    .line 76
    return-object v1

    .line 77
    :goto_1
    check-cast p1, Ljava/lang/Boolean;

    .line 78
    .line 79
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    if-eqz p1, :cond_b

    .line 84
    .line 85
    invoke-interface {v4}, Lkotlinx/coroutines/channels/ChannelIterator;->next()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    check-cast p1, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent;

    .line 90
    .line 91
    :try_start_0
    instance-of v0, p1, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Flush;

    .line 92
    .line 93
    if-eqz v0, :cond_4

    .line 94
    .line 95
    sget-object p1, Lcom/immomo/mmdns/DNSSlaLogger;->INSTANCE:Lcom/immomo/mmdns/DNSSlaLogger;

    .line 96
    .line 97
    invoke-static {p1}, Lcom/immomo/mmdns/DNSSlaLogger;->access$getFlushJob$p(Lcom/immomo/mmdns/DNSSlaLogger;)Lkotlinx/coroutines/o;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    if-eqz v0, :cond_3

    .line 102
    .line 103
    invoke-static {v0, v3, v2, v3}, Lkotlinx/coroutines/o$a;->a(Lkotlinx/coroutines/o;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    goto :goto_2

    .line 107
    :catch_0
    move-exception v0

    .line 108
    move-object p1, v0

    .line 109
    goto/16 :goto_4

    .line 110
    .line 111
    :cond_3
    :goto_2
    new-instance v9, Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1$1;

    .line 112
    .line 113
    invoke-direct {v9, v5, v3}, Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1$1;-><init>(Ljava/util/Map;Lkotlin/coroutines/Continuation;)V

    .line 114
    .line 115
    .line 116
    const/4 v10, 0x3

    .line 117
    const/4 v11, 0x0

    .line 118
    const/4 v7, 0x0

    .line 119
    const/4 v8, 0x0

    .line 120
    invoke-static/range {v6 .. v11}, Ll/vh3;->b(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Ll/utd;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-static {p1, v0}, Lcom/immomo/mmdns/DNSSlaLogger;->access$setFlushJob$p(Lcom/immomo/mmdns/DNSSlaLogger;Lkotlinx/coroutines/o;)V

    .line 125
    .line 126
    .line 127
    goto/16 :goto_5

    .line 128
    .line 129
    :cond_4
    instance-of v0, p1, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;

    .line 130
    .line 131
    if-eqz v0, :cond_a

    .line 132
    .line 133
    sget-object v0, Lcom/immomo/mmdns/DNSSlaLogger;->INSTANCE:Lcom/immomo/mmdns/DNSSlaLogger;

    .line 134
    .line 135
    invoke-static {v0}, Lcom/immomo/mmdns/DNSSlaLogger;->access$getDomainMatcher$p(Lcom/immomo/mmdns/DNSSlaLogger;)Lcom/immomo/mmdns/DomainMatcher;

    .line 136
    .line 137
    .line 138
    move-result-object v7

    .line 139
    if-eqz v7, :cond_a

    .line 140
    .line 141
    move-object v8, p1

    .line 142
    check-cast v8, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;

    .line 143
    .line 144
    invoke-virtual {v8}, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->getHost()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v8

    .line 148
    invoke-virtual {v7, v8}, Lcom/immomo/mmdns/DomainMatcher;->matches(Ljava/lang/String;)Z

    .line 149
    .line 150
    .line 151
    move-result v7

    .line 152
    if-eq v7, v2, :cond_5

    .line 153
    .line 154
    goto/16 :goto_5

    .line 155
    .line 156
    :cond_5
    invoke-static {v0}, Lcom/immomo/mmdns/DNSSlaLogger;->access$getExcludeCodes$p(Lcom/immomo/mmdns/DNSSlaLogger;)Ljava/util/Set;

    .line 157
    .line 158
    .line 159
    move-result-object v7

    .line 160
    move-object v8, p1

    .line 161
    check-cast v8, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;

    .line 162
    .line 163
    invoke-virtual {v8}, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->getCode()I

    .line 164
    .line 165
    .line 166
    move-result v8

    .line 167
    invoke-static {v8}, Lkotlin/coroutines/jvm/internal/Boxing;->b(I)Ljava/lang/Integer;

    .line 168
    .line 169
    .line 170
    move-result-object v8

    .line 171
    invoke-interface {v7, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v7

    .line 175
    if-eqz v7, :cond_6

    .line 176
    .line 177
    goto/16 :goto_5

    .line 178
    .line 179
    :cond_6
    new-instance v7, Lcom/immomo/mmdns/DnsSlaHeader;

    .line 180
    .line 181
    move-object v8, p1

    .line 182
    check-cast v8, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;

    .line 183
    .line 184
    invoke-virtual {v8}, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->getHost()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v8

    .line 188
    move-object v9, p1

    .line 189
    check-cast v9, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;

    .line 190
    .line 191
    invoke-virtual {v9}, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->getIp()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v9

    .line 195
    move-object v10, p1

    .line 196
    check-cast v10, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;

    .line 197
    .line 198
    invoke-virtual {v10}, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->isHttpDns()Z

    .line 199
    .line 200
    .line 201
    move-result v10

    .line 202
    invoke-direct {v7, v8, v9, v10}, Lcom/immomo/mmdns/DnsSlaHeader;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 203
    .line 204
    .line 205
    invoke-interface {v5, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object v8

    .line 209
    if-nez v8, :cond_7

    .line 210
    .line 211
    new-instance v8, Lcom/immomo/mmdns/DnsSlaData;

    .line 212
    .line 213
    invoke-direct {v8, v3, v2, v3}, Lcom/immomo/mmdns/DnsSlaData;-><init>(Ljava/util/Map;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 214
    .line 215
    .line 216
    invoke-interface {v5, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    :cond_7
    check-cast v8, Lcom/immomo/mmdns/DnsSlaData;

    .line 220
    .line 221
    invoke-virtual {v8}, Lcom/immomo/mmdns/DnsSlaData;->getStatus()Ljava/util/Map;

    .line 222
    .line 223
    .line 224
    move-result-object v7

    .line 225
    move-object v9, p1

    .line 226
    check-cast v9, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;

    .line 227
    .line 228
    invoke-virtual {v9}, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->getCode()I

    .line 229
    .line 230
    .line 231
    move-result v9

    .line 232
    invoke-static {v9}, Lkotlin/coroutines/jvm/internal/Boxing;->b(I)Ljava/lang/Integer;

    .line 233
    .line 234
    .line 235
    move-result-object v9

    .line 236
    invoke-virtual {v8}, Lcom/immomo/mmdns/DnsSlaData;->getStatus()Ljava/util/Map;

    .line 237
    .line 238
    .line 239
    move-result-object v8

    .line 240
    check-cast p1, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;

    .line 241
    .line 242
    invoke-virtual {p1}, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;->getCode()I

    .line 243
    .line 244
    .line 245
    move-result p1

    .line 246
    invoke-static {p1}, Lkotlin/coroutines/jvm/internal/Boxing;->b(I)Ljava/lang/Integer;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    invoke-interface {v8, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    check-cast p1, Ljava/lang/Integer;

    .line 255
    .line 256
    if-eqz p1, :cond_8

    .line 257
    .line 258
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 259
    .line 260
    .line 261
    move-result p1

    .line 262
    goto :goto_3

    .line 263
    :cond_8
    const/4 p1, 0x0

    .line 264
    :goto_3
    add-int/2addr p1, v2

    .line 265
    invoke-static {p1}, Lkotlin/coroutines/jvm/internal/Boxing;->b(I)Ljava/lang/Integer;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    invoke-interface {v7, v9, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    invoke-static {v0}, Lcom/immomo/mmdns/DNSSlaLogger;->access$getFlushJob$p(Lcom/immomo/mmdns/DNSSlaLogger;)Lkotlinx/coroutines/o;

    .line 273
    .line 274
    .line 275
    move-result-object p1

    .line 276
    if-eqz p1, :cond_9

    .line 277
    .line 278
    invoke-static {p1, v3, v2, v3}, Lkotlinx/coroutines/o$a;->a(Lkotlinx/coroutines/o;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    .line 279
    .line 280
    .line 281
    :cond_9
    new-instance v9, Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1$2;

    .line 282
    .line 283
    invoke-direct {v9, v5, v3}, Lcom/immomo/mmdns/DNSSlaLogger$startLogging$1$2;-><init>(Ljava/util/Map;Lkotlin/coroutines/Continuation;)V

    .line 284
    .line 285
    .line 286
    const/4 v10, 0x3

    .line 287
    const/4 v11, 0x0

    .line 288
    const/4 v7, 0x0

    .line 289
    const/4 v8, 0x0

    .line 290
    invoke-static/range {v6 .. v11}, Ll/vh3;->b(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Ll/utd;

    .line 291
    .line 292
    .line 293
    move-result-object p1

    .line 294
    invoke-static {v0, p1}, Lcom/immomo/mmdns/DNSSlaLogger;->access$setFlushJob$p(Lcom/immomo/mmdns/DNSSlaLogger;Lkotlinx/coroutines/o;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 295
    .line 296
    .line 297
    goto :goto_5

    .line 298
    :goto_4
    const-string v0, "MMDNS"

    .line 299
    .line 300
    const-string v7, "Error in DNS_SLA"

    .line 301
    .line 302
    invoke-static {v0, v7, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 303
    .line 304
    .line 305
    :cond_a
    :goto_5
    move-object v0, v4

    .line 306
    move-object v4, v5

    .line 307
    move-object v5, v6

    .line 308
    goto/16 :goto_0

    .line 309
    .line 310
    :cond_b
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 311
    .line 312
    return-object p0
.end method
