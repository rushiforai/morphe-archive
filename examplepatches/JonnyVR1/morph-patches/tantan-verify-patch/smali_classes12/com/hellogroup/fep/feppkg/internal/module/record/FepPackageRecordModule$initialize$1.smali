.class final Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->w()V
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
    c = "com.hellogroup.fep.feppkg.internal.module.record.FepPackageRecordModule$initialize$1"
    f = "FepPackageRecordModule.kt"
    l = {}
    m = "invokeSuspend"
.end annotation


# instance fields
.field label:I

.field private p$:Ll/drb;

.field final synthetic this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;


# direct methods
.method public constructor <init>(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;Lkotlin/coroutines/Continuation;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 1
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

    new-instance v0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1;

    iget-object p0, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    invoke-direct {v0, p0, p2}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1;-><init>(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Ll/drb;

    iput-object p1, v0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1;->p$:Ll/drb;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 20
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v0, "pkg_record_first_install_scanned"

    .line 4
    .line 5
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    iget v2, v1, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1;->label:I

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    if-nez v2, :cond_9

    .line 12
    .line 13
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    :try_start_0
    sget-object v4, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 18
    .line 19
    invoke-virtual {v4}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    const-string v6, "Start loading all package records..."

    .line 24
    .line 25
    const/4 v9, 0x6

    .line 26
    const/4 v10, 0x0

    .line 27
    const/4 v7, 0x0

    .line 28
    const/4 v8, 0x0

    .line 29
    invoke-static/range {v5 .. v10}, Ll/pgi;->f(Ll/pgi;Ljava/lang/String;Ljava/util/Map;IILjava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 33
    .line 34
    .line 35
    move-result-wide v5

    .line 36
    sget-object v7, Lcom/hellogroup/fep/base/FepContext;->INSTANCE:Lcom/hellogroup/fep/base/FepContext;

    .line 37
    .line 38
    invoke-virtual {v7}, Lcom/hellogroup/fep/base/FepContext;->d()Landroid/content/SharedPreferences;

    .line 39
    .line 40
    .line 41
    move-result-object v8

    .line 42
    if-eqz v8, :cond_8

    .line 43
    .line 44
    invoke-interface {v8}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 45
    .line 46
    .line 47
    move-result-object v7

    .line 48
    invoke-interface {v8, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 49
    .line 50
    .line 51
    move-result v9

    .line 52
    const/4 v10, 0x0

    .line 53
    if-eqz v9, :cond_0

    .line 54
    .line 55
    invoke-virtual {v4}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 56
    .line 57
    .line 58
    move-result-object v11

    .line 59
    const-string v12, "First install detected, scanning resource directory..."

    .line 60
    .line 61
    const/4 v15, 0x6

    .line 62
    const/16 v16, 0x0

    .line 63
    .line 64
    const/4 v13, 0x0

    .line 65
    const/4 v14, 0x0

    .line 66
    invoke-static/range {v11 .. v16}, Ll/pgi;->f(Ll/pgi;Ljava/lang/String;Ljava/util/Map;IILjava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    iget-object v4, v1, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 70
    .line 71
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 72
    .line 73
    .line 74
    invoke-static {v4, v7}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->j(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;Landroid/content/SharedPreferences$Editor;)V

    .line 75
    .line 76
    .line 77
    invoke-interface {v7, v0, v10}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :catchall_0
    move-exception v0

    .line 82
    goto/16 :goto_8

    .line 83
    .line 84
    :catch_0
    move-exception v0

    .line 85
    move-object v6, v0

    .line 86
    goto/16 :goto_6

    .line 87
    .line 88
    :cond_0
    :goto_0
    invoke-interface {v8}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    check-cast v0, Ljava/lang/Iterable;

    .line 97
    .line 98
    new-instance v4, Ljava/util/ArrayList;

    .line 99
    .line 100
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 108
    .line 109
    .line 110
    move-result v9
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 111
    const-string v11, "pkg_record_"

    .line 112
    .line 113
    if-eqz v9, :cond_2

    .line 114
    .line 115
    :try_start_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v9

    .line 119
    move-object v12, v9

    .line 120
    check-cast v12, Ljava/lang/String;

    .line 121
    .line 122
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 123
    .line 124
    .line 125
    const/4 v13, 0x2

    .line 126
    invoke-static {v12, v11, v10, v13, v3}, Lkotlin/text/d;->J(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v11

    .line 130
    invoke-static {v11}, Lkotlin/coroutines/jvm/internal/Boxing;->a(Z)Ljava/lang/Boolean;

    .line 131
    .line 132
    .line 133
    move-result-object v11

    .line 134
    invoke-virtual {v11}, Ljava/lang/Boolean;->booleanValue()Z

    .line 135
    .line 136
    .line 137
    move-result v11

    .line 138
    if-eqz v11, :cond_1

    .line 139
    .line 140
    invoke-interface {v4, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_2
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-eqz v0, :cond_3

    .line 149
    .line 150
    sget-object v0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 151
    .line 152
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 153
    .line 154
    .line 155
    move-result-object v8

    .line 156
    const-string v9, "No package records found in SP"

    .line 157
    .line 158
    const/4 v12, 0x6

    .line 159
    const/4 v13, 0x0

    .line 160
    const/4 v10, 0x0

    .line 161
    const/4 v11, 0x0

    .line 162
    invoke-static/range {v8 .. v13}, Ll/pgi;->f(Ll/pgi;Ljava/lang/String;Ljava/util/Map;IILjava/lang/Object;)V

    .line 163
    .line 164
    .line 165
    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 166
    .line 167
    .line 168
    iget-object v0, v1, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 169
    .line 170
    invoke-static {v0}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->f(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 175
    .line 176
    .line 177
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 178
    .line 179
    iget-object v1, v1, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 180
    .line 181
    invoke-static {v1}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->f(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 186
    .line 187
    .line 188
    sget-object v1, Lcom/hellogroup/fep/base/FepContext;->INSTANCE:Lcom/hellogroup/fep/base/FepContext;

    .line 189
    .line 190
    invoke-virtual {v1}, Lcom/hellogroup/fep/base/FepContext;->a()Ll/drb;

    .line 191
    .line 192
    .line 193
    move-result-object v4

    .line 194
    new-instance v7, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1$2;

    .line 195
    .line 196
    invoke-direct {v7, v3}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1$2;-><init>(Lkotlin/coroutines/Continuation;)V

    .line 197
    .line 198
    .line 199
    const/4 v8, 0x3

    .line 200
    const/4 v9, 0x0

    .line 201
    const/4 v5, 0x0

    .line 202
    const/4 v6, 0x0

    .line 203
    invoke-static/range {v4 .. v9}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 204
    .line 205
    .line 206
    return-object v0

    .line 207
    :cond_3
    :try_start_2
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 208
    .line 209
    .line 210
    move-result-object v4

    .line 211
    move v9, v10

    .line 212
    :cond_4
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-eqz v0, :cond_7

    .line 217
    .line 218
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    move-object v12, v0

    .line 223
    check-cast v12, Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 224
    .line 225
    :try_start_3
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 226
    .line 227
    .line 228
    invoke-static {v12, v11}, Lkotlin/text/StringsKt;->w0(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    iget-object v13, v1, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 233
    .line 234
    invoke-static {v13}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->e(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 235
    .line 236
    .line 237
    move-result-object v13

    .line 238
    invoke-virtual {v13, v0}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    move-result v13

    .line 242
    if-eqz v13, :cond_5

    .line 243
    .line 244
    iget-object v13, v1, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 245
    .line 246
    invoke-static {v13}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->c(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;)Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

    .line 247
    .line 248
    .line 249
    move-result-object v13

    .line 250
    invoke-virtual {v13, v0}, Ljava/util/concurrent/ConcurrentHashMap$KeySetView;->add(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    :goto_3
    add-int/lit8 v10, v10, 0x1

    .line 254
    .line 255
    goto :goto_2

    .line 256
    :catch_1
    move-exception v0

    .line 257
    move-object v15, v0

    .line 258
    goto :goto_4

    .line 259
    :cond_5
    invoke-interface {v8, v12, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v13

    .line 263
    if-eqz v13, :cond_4

    .line 264
    .line 265
    iget-object v14, v1, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 266
    .line 267
    invoke-static {v14, v0, v13}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->a(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;Ljava/lang/String;Ljava/lang/String;)Ll/lhi;

    .line 268
    .line 269
    .line 270
    move-result-object v13

    .line 271
    if-nez v13, :cond_6

    .line 272
    .line 273
    invoke-interface {v7, v12}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 274
    .line 275
    .line 276
    add-int/lit8 v9, v9, 0x1

    .line 277
    .line 278
    goto :goto_2

    .line 279
    :cond_6
    iget-object v14, v1, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 280
    .line 281
    invoke-static {v14}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->e(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 282
    .line 283
    .line 284
    move-result-object v14

    .line 285
    invoke-interface {v14, v0, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 286
    .line 287
    .line 288
    goto :goto_3

    .line 289
    :goto_4
    :try_start_4
    sget-object v0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 290
    .line 291
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 292
    .line 293
    .line 294
    move-result-object v13

    .line 295
    new-instance v0, Ljava/lang/StringBuilder;

    .line 296
    .line 297
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 298
    .line 299
    .line 300
    const-string v14, "Load record for key="

    .line 301
    .line 302
    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    const-string v12, " failed: "

    .line 309
    .line 310
    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    invoke-virtual {v15}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v12

    .line 317
    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 318
    .line 319
    .line 320
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v14

    .line 324
    const/16 v18, 0xc

    .line 325
    .line 326
    const/16 v19, 0x0

    .line 327
    .line 328
    const/16 v16, 0x0

    .line 329
    .line 330
    const/16 v17, 0x0

    .line 331
    .line 332
    invoke-static/range {v13 .. v19}, Ll/pgi;->k(Ll/pgi;Ljava/lang/String;Ljava/lang/Throwable;ILjava/util/Map;ILjava/lang/Object;)V

    .line 333
    .line 334
    .line 335
    goto :goto_2

    .line 336
    :cond_7
    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 337
    .line 338
    .line 339
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 340
    .line 341
    .line 342
    move-result-wide v7

    .line 343
    sub-long/2addr v7, v5

    .line 344
    sget-object v0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 345
    .line 346
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 347
    .line 348
    .line 349
    move-result-object v11

    .line 350
    new-instance v0, Ljava/lang/StringBuilder;

    .line 351
    .line 352
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 353
    .line 354
    .line 355
    const-string v4, "FepPackageRecordModule Loaded "

    .line 356
    .line 357
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 361
    .line 362
    .line 363
    const-string v4, " package records, cleaned "

    .line 364
    .line 365
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 366
    .line 367
    .line 368
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 369
    .line 370
    .line 371
    const-string v4, " cold records, cost "

    .line 372
    .line 373
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 374
    .line 375
    .line 376
    invoke-virtual {v0, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 377
    .line 378
    .line 379
    const-string v4, "ms"

    .line 380
    .line 381
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 382
    .line 383
    .line 384
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object v12

    .line 388
    const/4 v15, 0x6

    .line 389
    const/16 v16, 0x0

    .line 390
    .line 391
    const/4 v13, 0x0

    .line 392
    const/4 v14, 0x0

    .line 393
    invoke-static/range {v11 .. v16}, Ll/pgi;->f(Ll/pgi;Ljava/lang/String;Ljava/util/Map;IILjava/lang/Object;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 394
    .line 395
    .line 396
    iget-object v0, v1, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 397
    .line 398
    invoke-static {v0}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->f(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 403
    .line 404
    .line 405
    sget-object v0, Lcom/hellogroup/fep/base/FepContext;->INSTANCE:Lcom/hellogroup/fep/base/FepContext;

    .line 406
    .line 407
    invoke-virtual {v0}, Lcom/hellogroup/fep/base/FepContext;->a()Ll/drb;

    .line 408
    .line 409
    .line 410
    move-result-object v4

    .line 411
    new-instance v7, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1$2;

    .line 412
    .line 413
    invoke-direct {v7, v3}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1$2;-><init>(Lkotlin/coroutines/Continuation;)V

    .line 414
    .line 415
    .line 416
    :goto_5
    const/4 v8, 0x3

    .line 417
    const/4 v9, 0x0

    .line 418
    const/4 v5, 0x0

    .line 419
    const/4 v6, 0x0

    .line 420
    invoke-static/range {v4 .. v9}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 421
    .line 422
    .line 423
    goto :goto_7

    .line 424
    :cond_8
    :try_start_5
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 425
    .line 426
    iget-object v1, v1, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 427
    .line 428
    invoke-static {v1}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->f(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 429
    .line 430
    .line 431
    move-result-object v1

    .line 432
    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 433
    .line 434
    .line 435
    invoke-virtual {v7}, Lcom/hellogroup/fep/base/FepContext;->a()Ll/drb;

    .line 436
    .line 437
    .line 438
    move-result-object v8

    .line 439
    new-instance v11, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1$2;

    .line 440
    .line 441
    invoke-direct {v11, v3}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1$2;-><init>(Lkotlin/coroutines/Continuation;)V

    .line 442
    .line 443
    .line 444
    const/4 v12, 0x3

    .line 445
    const/4 v13, 0x0

    .line 446
    const/4 v9, 0x0

    .line 447
    const/4 v10, 0x0

    .line 448
    invoke-static/range {v8 .. v13}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 449
    .line 450
    .line 451
    return-object v0

    .line 452
    :goto_6
    :try_start_6
    sget-object v0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 453
    .line 454
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 455
    .line 456
    .line 457
    move-result-object v4

    .line 458
    new-instance v0, Ljava/lang/StringBuilder;

    .line 459
    .line 460
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 461
    .line 462
    .line 463
    const-string v5, "Initialize failed: "

    .line 464
    .line 465
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 466
    .line 467
    .line 468
    invoke-virtual {v6}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 469
    .line 470
    .line 471
    move-result-object v5

    .line 472
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 473
    .line 474
    .line 475
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 476
    .line 477
    .line 478
    move-result-object v5

    .line 479
    const/16 v9, 0xc

    .line 480
    .line 481
    const/4 v10, 0x0

    .line 482
    const/4 v7, 0x0

    .line 483
    const/4 v8, 0x0

    .line 484
    invoke-static/range {v4 .. v10}, Ll/pgi;->k(Ll/pgi;Ljava/lang/String;Ljava/lang/Throwable;ILjava/util/Map;ILjava/lang/Object;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 485
    .line 486
    .line 487
    iget-object v0, v1, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 488
    .line 489
    invoke-static {v0}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->f(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 490
    .line 491
    .line 492
    move-result-object v0

    .line 493
    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 494
    .line 495
    .line 496
    sget-object v0, Lcom/hellogroup/fep/base/FepContext;->INSTANCE:Lcom/hellogroup/fep/base/FepContext;

    .line 497
    .line 498
    invoke-virtual {v0}, Lcom/hellogroup/fep/base/FepContext;->a()Ll/drb;

    .line 499
    .line 500
    .line 501
    move-result-object v4

    .line 502
    new-instance v7, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1$2;

    .line 503
    .line 504
    invoke-direct {v7, v3}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1$2;-><init>(Lkotlin/coroutines/Continuation;)V

    .line 505
    .line 506
    .line 507
    goto :goto_5

    .line 508
    :goto_7
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 509
    .line 510
    return-object v0

    .line 511
    :goto_8
    iget-object v1, v1, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 512
    .line 513
    invoke-static {v1}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->f(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 514
    .line 515
    .line 516
    move-result-object v1

    .line 517
    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 518
    .line 519
    .line 520
    sget-object v1, Lcom/hellogroup/fep/base/FepContext;->INSTANCE:Lcom/hellogroup/fep/base/FepContext;

    .line 521
    .line 522
    invoke-virtual {v1}, Lcom/hellogroup/fep/base/FepContext;->a()Ll/drb;

    .line 523
    .line 524
    .line 525
    move-result-object v4

    .line 526
    new-instance v7, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1$2;

    .line 527
    .line 528
    invoke-direct {v7, v3}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$initialize$1$2;-><init>(Lkotlin/coroutines/Continuation;)V

    .line 529
    .line 530
    .line 531
    const/4 v8, 0x3

    .line 532
    const/4 v9, 0x0

    .line 533
    const/4 v5, 0x0

    .line 534
    const/4 v6, 0x0

    .line 535
    invoke-static/range {v4 .. v9}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 536
    .line 537
    .line 538
    throw v0

    .line 539
    :cond_9
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 540
    .line 541
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 542
    .line 543
    .line 544
    return-object v3
.end method
