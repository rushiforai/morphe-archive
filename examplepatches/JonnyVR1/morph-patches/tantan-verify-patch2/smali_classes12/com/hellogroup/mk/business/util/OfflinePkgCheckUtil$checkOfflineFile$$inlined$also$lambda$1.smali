.class final Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil;->a(Ll/y35;Ll/x4d0;)V
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
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u0010\u0005\u001a\u00020\u0001*\u00020\u0000H\u008a@\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Ll/drb;",
        "",
        "invoke",
        "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
        "com/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$2$1",
        "<anonymous>"
    }
    k = 0x3
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field final synthetic $checkInfo$inlined:Ll/y35;

.field final synthetic $it:Ljava/util/List;

.field final synthetic $resourceResponse$inlined:Ll/x4d0;

.field J$0:J

.field L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field label:I

.field private p$:Ll/drb;


# direct methods
.method public constructor <init>(Ljava/util/List;Lkotlin/coroutines/Continuation;Ll/y35;Ll/x4d0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->$it:Ljava/util/List;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->$checkInfo$inlined:Ll/y35;

    .line 4
    .line 5
    iput-object p4, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->$resourceResponse$inlined:Ll/x4d0;

    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    invoke-direct {p0, p1, p2}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 3
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

    new-instance v0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;

    iget-object v1, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->$it:Ljava/util/List;

    iget-object v2, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->$checkInfo$inlined:Ll/y35;

    iget-object p0, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->$resourceResponse$inlined:Ll/x4d0;

    invoke-direct {v0, v1, p2, v2, p0}, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;-><init>(Ljava/util/List;Lkotlin/coroutines/Continuation;Ll/y35;Ll/x4d0;)V

    check-cast p1, Ll/drb;

    iput-object p1, v0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->p$:Ll/drb;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 13
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
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->label:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x2

    .line 9
    const/4 v4, 0x1

    .line 10
    const-string v5, "OfflinePkgCheckUtil"

    .line 11
    .line 12
    if-eqz v1, :cond_2

    .line 13
    .line 14
    if-eq v1, v4, :cond_1

    .line 15
    .line 16
    if-ne v1, v3, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->L$2:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v0, Ljava/util/List;

    .line 21
    .line 22
    iget-object v0, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->L$1:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v0, Lkotlin/jvm/internal/Ref$BooleanRef;

    .line 25
    .line 26
    iget-wide v0, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->J$0:J

    .line 27
    .line 28
    iget-object p0, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->L$0:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p0, Ll/drb;

    .line 31
    .line 32
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    goto/16 :goto_4

    .line 36
    .line 37
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 38
    .line 39
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-object v2

    .line 43
    :cond_1
    iget-object v1, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->L$2:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v1, Ljava/util/List;

    .line 46
    .line 47
    iget-object v4, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->L$1:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast v4, Lkotlin/jvm/internal/Ref$BooleanRef;

    .line 50
    .line 51
    iget-wide v6, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->J$0:J

    .line 52
    .line 53
    iget-object v8, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->L$0:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast v8, Ll/drb;

    .line 56
    .line 57
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    goto/16 :goto_2

    .line 61
    .line 62
    :cond_2
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    iget-object v8, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->p$:Ll/drb;

    .line 66
    .line 67
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 68
    .line 69
    .line 70
    move-result-wide v6

    .line 71
    new-instance p1, Lkotlin/jvm/internal/Ref$BooleanRef;

    .line 72
    .line 73
    invoke-direct {p1}, Lkotlin/jvm/internal/Ref$BooleanRef;-><init>()V

    .line 74
    .line 75
    .line 76
    iput-boolean v4, p1, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    .line 77
    .line 78
    new-instance v1, Ljava/util/ArrayList;

    .line 79
    .line 80
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 81
    .line 82
    .line 83
    iget-object v9, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->$it:Ljava/util/List;

    .line 84
    .line 85
    check-cast v9, Ljava/lang/Iterable;

    .line 86
    .line 87
    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 88
    .line 89
    .line 90
    move-result-object v9

    .line 91
    :cond_3
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 92
    .line 93
    .line 94
    move-result v10

    .line 95
    if-eqz v10, :cond_5

    .line 96
    .line 97
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v10

    .line 101
    check-cast v10, Ll/zgi;

    .line 102
    .line 103
    :try_start_0
    invoke-virtual {v10}, Ll/zgi;->o()Z

    .line 104
    .line 105
    .line 106
    move-result v11

    .line 107
    if-eqz v11, :cond_3

    .line 108
    .line 109
    sget-object v11, Lcom/hellogroup/fep/base/core/FepManager;->Companion:Lcom/hellogroup/fep/base/core/FepManager$a;

    .line 110
    .line 111
    invoke-virtual {v11}, Lcom/hellogroup/fep/base/core/FepManager$a;->a()Lcom/hellogroup/fep/base/core/FepManager;

    .line 112
    .line 113
    .line 114
    move-result-object v11

    .line 115
    invoke-virtual {v11, v10}, Lcom/hellogroup/fep/base/core/FepManager;->d(Ll/zgi;)Z

    .line 116
    .line 117
    .line 118
    move-result v11

    .line 119
    if-nez v11, :cond_4

    .line 120
    .line 121
    const/4 v11, 0x0

    .line 122
    iput-boolean v11, p1, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    .line 123
    .line 124
    new-instance v11, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 127
    .line 128
    .line 129
    const-string v12, "\u6821\u9a8c\u672c\u5730\u6587\u4ef6\u5931\u8d25, name: "

    .line 130
    .line 131
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v10}, Ll/zgi;->i()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v12

    .line 138
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const-string v12, ", \u5c06\u5220\u9664\u5305"

    .line 142
    .line 143
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v11

    .line 150
    invoke-static {v5, v11}, Ll/jzv;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    invoke-interface {v1, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    goto :goto_0

    .line 157
    :catch_0
    move-exception v10

    .line 158
    goto :goto_1

    .line 159
    :cond_4
    new-instance v11, Ljava/lang/StringBuilder;

    .line 160
    .line 161
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 162
    .line 163
    .line 164
    const-string v12, "\u6821\u9a8c\u672c\u5730\u6587\u4ef6\u901a\u8fc7, name: "

    .line 165
    .line 166
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v10}, Ll/zgi;->i()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v10

    .line 173
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v10

    .line 180
    invoke-static {v5, v10}, Ll/jzv;->g(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 181
    .line 182
    .line 183
    goto :goto_0

    .line 184
    :goto_1
    invoke-virtual {v10}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v10

    .line 188
    invoke-static {v5, v10}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    goto :goto_0

    .line 192
    :cond_5
    iget-boolean v9, p1, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    .line 193
    .line 194
    if-nez v9, :cond_a

    .line 195
    .line 196
    iget-object v9, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->$checkInfo$inlined:Ll/y35;

    .line 197
    .line 198
    if-eqz v9, :cond_a

    .line 199
    .line 200
    iget-object v9, v9, Ll/y35;->a:Ljava/lang/ref/WeakReference;

    .line 201
    .line 202
    invoke-virtual {v9}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v9

    .line 206
    check-cast v9, Ll/hul;

    .line 207
    .line 208
    if-eqz v9, :cond_9

    .line 209
    .line 210
    iget-object v9, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->$checkInfo$inlined:Ll/y35;

    .line 211
    .line 212
    iget-boolean v9, v9, Ll/y35;->b:Z

    .line 213
    .line 214
    if-nez v9, :cond_8

    .line 215
    .line 216
    iput-object v8, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->L$0:Ljava/lang/Object;

    .line 217
    .line 218
    iput-wide v6, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->J$0:J

    .line 219
    .line 220
    iput-object p1, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->L$1:Ljava/lang/Object;

    .line 221
    .line 222
    iput-object v1, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->L$2:Ljava/lang/Object;

    .line 223
    .line 224
    iput v4, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->label:I

    .line 225
    .line 226
    const-wide/16 v9, 0x64

    .line 227
    .line 228
    invoke-static {v9, v10, p0}, Lkotlinx/coroutines/DelayKt;->b(JLkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object v4

    .line 232
    if-ne v4, v0, :cond_6

    .line 233
    .line 234
    goto :goto_3

    .line 235
    :cond_6
    move-object v4, p1

    .line 236
    :goto_2
    invoke-static {}, Ll/r5e;->c()Ll/gsw;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    new-instance v9, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1$1;

    .line 241
    .line 242
    invoke-direct {v9, p0, v1, v2}, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1$1;-><init>(Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;Ljava/util/List;Lkotlin/coroutines/Continuation;)V

    .line 243
    .line 244
    .line 245
    iput-object v8, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->L$0:Ljava/lang/Object;

    .line 246
    .line 247
    iput-wide v6, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->J$0:J

    .line 248
    .line 249
    iput-object v4, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->L$1:Ljava/lang/Object;

    .line 250
    .line 251
    iput-object v1, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->L$2:Ljava/lang/Object;

    .line 252
    .line 253
    iput v3, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->label:I

    .line 254
    .line 255
    invoke-static {p1, v9, p0}, Ll/vh3;->g(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object p0

    .line 259
    if-ne p0, v0, :cond_7

    .line 260
    .line 261
    :goto_3
    return-object v0

    .line 262
    :cond_7
    move-wide v0, v6

    .line 263
    :goto_4
    move-wide v6, v0

    .line 264
    :cond_8
    new-instance p0, Ljava/lang/StringBuilder;

    .line 265
    .line 266
    const-string p1, "\u6821\u9a8c\u672c\u5730\u6587\u4ef6\u5b8c\u6210, current cost: "

    .line 267
    .line 268
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 272
    .line 273
    .line 274
    move-result-wide v0

    .line 275
    sub-long/2addr v0, v6

    .line 276
    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    const-string p1, " ms "

    .line 280
    .line 281
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 282
    .line 283
    .line 284
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object p0

    .line 288
    invoke-static {v5, p0}, Ll/jzv;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    goto :goto_5

    .line 292
    :cond_9
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 293
    .line 294
    return-object p0

    .line 295
    :cond_a
    :goto_5
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 296
    .line 297
    return-object p0
.end method
