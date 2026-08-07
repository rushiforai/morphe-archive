.class final Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/core/log/page/BasePageLog;->m(Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogLevel;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;Ljava/lang/String;)V
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
    c = "com.hellogroup.mk.core.log.page.BasePageLog$performPageLogUpload$1"
    f = "BasePageLog.kt"
    l = {}
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $firstErr:Z

.field final synthetic $logLevel:Lcom/hellogroup/mk/core/log/core/MKLogLevel;

.field final synthetic $logStr:Ljava/lang/String;

.field final synthetic $logsToUpload:Ljava/util/List;

.field final synthetic $source:Lcom/hellogroup/mk/core/log/core/MKLogSource;

.field final synthetic $thirdBiz:Ljava/lang/String;

.field final synthetic $triggerLevel:Ljava/lang/String;

.field label:I

.field private p$:Ll/drb;

.field final synthetic this$0:Lcom/hellogroup/mk/core/log/page/BasePageLog;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/core/log/page/BasePageLog;Ljava/util/List;ZLcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->this$0:Lcom/hellogroup/mk/core/log/page/BasePageLog;

    iput-object p2, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$logsToUpload:Ljava/util/List;

    iput-boolean p3, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$firstErr:Z

    iput-object p4, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$logLevel:Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    iput-object p5, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$logStr:Ljava/lang/String;

    iput-object p6, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$triggerLevel:Ljava/lang/String;

    iput-object p7, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$source:Lcom/hellogroup/mk/core/log/core/MKLogSource;

    iput-object p8, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$thirdBiz:Ljava/lang/String;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p9}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 10
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

    new-instance v0, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;

    iget-object v1, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->this$0:Lcom/hellogroup/mk/core/log/page/BasePageLog;

    iget-object v2, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$logsToUpload:Ljava/util/List;

    iget-boolean v3, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$firstErr:Z

    iget-object v4, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$logLevel:Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    iget-object v5, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$logStr:Ljava/lang/String;

    iget-object v6, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$triggerLevel:Ljava/lang/String;

    iget-object v7, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$source:Lcom/hellogroup/mk/core/log/core/MKLogSource;

    iget-object v8, p0, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$thirdBiz:Ljava/lang/String;

    move-object v9, p2

    invoke-direct/range {v0 .. v9}, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;-><init>(Lcom/hellogroup/mk/core/log/page/BasePageLog;Ljava/util/List;ZLcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Ll/drb;

    iput-object p1, v0, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->p$:Ll/drb;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 19
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
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget v0, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->label:I

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-nez v0, :cond_9

    .line 10
    .line 11
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Lorg/json/JSONArray;

    .line 15
    .line 16
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object v3, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$logsToUpload:Ljava/util/List;

    .line 20
    .line 21
    check-cast v3, Ljava/lang/Iterable;

    .line 22
    .line 23
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-eqz v4, :cond_0

    .line 32
    .line 33
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    check-cast v4, Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget-object v3, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->this$0:Lcom/hellogroup/mk/core/log/page/BasePageLog;

    .line 44
    .line 45
    invoke-static {v3}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->c(Lcom/hellogroup/mk/core/log/page/BasePageLog;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    const-string v4, "logID"

    .line 50
    .line 51
    invoke-static {v4, v3}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    iget-object v3, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->this$0:Lcom/hellogroup/mk/core/log/page/BasePageLog;

    .line 56
    .line 57
    invoke-virtual {v3}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->j()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    const-string v4, "url"

    .line 62
    .line 63
    invoke-static {v4, v3}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    iget-object v3, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->this$0:Lcom/hellogroup/mk/core/log/page/BasePageLog;

    .line 68
    .line 69
    invoke-static {v3}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->a(Lcom/hellogroup/mk/core/log/page/BasePageLog;)J

    .line 70
    .line 71
    .line 72
    move-result-wide v3

    .line 73
    invoke-static {v3, v4}, Lkotlin/coroutines/jvm/internal/Boxing;->c(J)Ljava/lang/Long;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    const-string v4, "createTime"

    .line 78
    .line 79
    invoke-static {v4, v3}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 80
    .line 81
    .line 82
    move-result-object v7

    .line 83
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 84
    .line 85
    .line 86
    move-result-wide v3

    .line 87
    invoke-static {v3, v4}, Lkotlin/coroutines/jvm/internal/Boxing;->c(J)Ljava/lang/Long;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    const-string v4, "uploadTime"

    .line 92
    .line 93
    invoke-static {v4, v3}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 94
    .line 95
    .line 96
    move-result-object v8

    .line 97
    iget-boolean v3, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$firstErr:Z

    .line 98
    .line 99
    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/Boxing;->b(I)Ljava/lang/Integer;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    const-string v4, "isFirst"

    .line 104
    .line 105
    invoke-static {v4, v3}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 106
    .line 107
    .line 108
    move-result-object v9

    .line 109
    iget-object v3, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->this$0:Lcom/hellogroup/mk/core/log/page/BasePageLog;

    .line 110
    .line 111
    invoke-static {v3}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->b(Lcom/hellogroup/mk/core/log/page/BasePageLog;)Ljava/util/Map;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    const-string v4, "isResourceOfflined"

    .line 116
    .line 117
    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    if-eqz v3, :cond_1

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_1
    const/4 v3, 0x0

    .line 125
    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/Boxing;->b(I)Ljava/lang/Integer;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    :goto_1
    const-string v4, "isOfflined"

    .line 130
    .line 131
    invoke-static {v4, v3}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 132
    .line 133
    .line 134
    move-result-object v10

    .line 135
    const-string v3, "listArray"

    .line 136
    .line 137
    invoke-static {v3, v0}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 138
    .line 139
    .line 140
    move-result-object v11

    .line 141
    const-string v0, "category"

    .line 142
    .line 143
    invoke-static {}, Ll/sjw;->d()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    invoke-static {v0, v3}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 148
    .line 149
    .line 150
    move-result-object v12

    .line 151
    filled-new-array/range {v5 .. v12}, [Lkotlin/Pair;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    invoke-static {v0}, Lkotlin/collections/MapsKt;->mutableMapOf([Lkotlin/Pair;)Ljava/util/Map;

    .line 156
    .line 157
    .line 158
    move-result-object v12

    .line 159
    new-instance v13, Ljava/util/LinkedHashMap;

    .line 160
    .line 161
    invoke-direct {v13}, Ljava/util/LinkedHashMap;-><init>()V

    .line 162
    .line 163
    .line 164
    iget-object v0, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->this$0:Lcom/hellogroup/mk/core/log/page/BasePageLog;

    .line 165
    .line 166
    invoke-static {v0}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->b(Lcom/hellogroup/mk/core/log/page/BasePageLog;)Ljava/util/Map;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    const-string v3, "offlineVersion"

    .line 171
    .line 172
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    if-eqz v0, :cond_2

    .line 177
    .line 178
    invoke-interface {v13, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    :cond_2
    iget-object v0, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->this$0:Lcom/hellogroup/mk/core/log/page/BasePageLog;

    .line 182
    .line 183
    invoke-static {v0}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->b(Lcom/hellogroup/mk/core/log/page/BasePageLog;)Ljava/util/Map;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    const-string v3, "ua"

    .line 188
    .line 189
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    if-eqz v0, :cond_3

    .line 194
    .line 195
    invoke-interface {v13, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    :cond_3
    iget-object v0, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->this$0:Lcom/hellogroup/mk/core/log/page/BasePageLog;

    .line 199
    .line 200
    invoke-static {v0}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->b(Lcom/hellogroup/mk/core/log/page/BasePageLog;)Ljava/util/Map;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    const-string v3, "useDns"

    .line 205
    .line 206
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    if-eqz v0, :cond_4

    .line 211
    .line 212
    invoke-interface {v13, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    :cond_4
    iget-object v0, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->this$0:Lcom/hellogroup/mk/core/log/page/BasePageLog;

    .line 216
    .line 217
    invoke-static {v0}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->b(Lcom/hellogroup/mk/core/log/page/BasePageLog;)Ljava/util/Map;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    const-string v3, "fep"

    .line 222
    .line 223
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    if-eqz v0, :cond_5

    .line 228
    .line 229
    invoke-interface {v13, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    :cond_5
    :try_start_0
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 233
    .line 234
    invoke-static {}, Ll/gkw;->b()Ll/gkw;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-virtual {v0}, Ll/gkw;->a()Ll/ivl;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    const/4 v3, 0x1

    .line 243
    invoke-interface {v0, v3}, Ll/ivl;->d(I)Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    if-eqz v0, :cond_6

    .line 248
    .line 249
    const-string v2, "deviceid"

    .line 250
    .line 251
    invoke-interface {v13, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 255
    .line 256
    goto :goto_2

    .line 257
    :catchall_0
    move-exception v0

    .line 258
    goto :goto_3

    .line 259
    :cond_6
    :goto_2
    invoke-static {v2}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 260
    .line 261
    .line 262
    goto :goto_4

    .line 263
    :goto_3
    sget-object v2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 264
    .line 265
    invoke-static {v0}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    :goto_4
    iget-object v0, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$logLevel:Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    .line 273
    .line 274
    sget-object v2, Lcom/hellogroup/mk/core/log/core/MKLogLevel;->ERROR:Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    .line 275
    .line 276
    if-ne v0, v2, :cond_7

    .line 277
    .line 278
    const-string v0, "msg"

    .line 279
    .line 280
    iget-object v2, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$logStr:Ljava/lang/String;

    .line 281
    .line 282
    invoke-interface {v13, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    const-string v0, "ERR_1.1"

    .line 286
    .line 287
    iget-object v2, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$triggerLevel:Ljava/lang/String;

    .line 288
    .line 289
    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 290
    .line 291
    .line 292
    move-result v0

    .line 293
    if-eqz v0, :cond_7

    .line 294
    .line 295
    invoke-static {}, Ll/sjw;->n()Z

    .line 296
    .line 297
    .line 298
    move-result v0

    .line 299
    invoke-static {v0}, Lkotlin/coroutines/jvm/internal/Boxing;->a(Z)Ljava/lang/Boolean;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    const-string v2, "foreground"

    .line 304
    .line 305
    invoke-interface {v12, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    invoke-static {}, Ll/glw;->e()J

    .line 309
    .line 310
    .line 311
    move-result-wide v2

    .line 312
    const-wide/16 v4, 0x0

    .line 313
    .line 314
    cmp-long v0, v2, v4

    .line 315
    .line 316
    if-lez v0, :cond_7

    .line 317
    .line 318
    const-string v0, "availMemory"

    .line 319
    .line 320
    invoke-static {v2, v3}, Lkotlin/coroutines/jvm/internal/Boxing;->c(J)Ljava/lang/Long;

    .line 321
    .line 322
    .line 323
    move-result-object v2

    .line 324
    invoke-interface {v13, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    .line 326
    .line 327
    :cond_7
    new-instance v3, Ll/kkw;

    .line 328
    .line 329
    iget-object v4, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$logLevel:Lcom/hellogroup/mk/core/log/core/MKLogLevel;

    .line 330
    .line 331
    iget-object v5, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$triggerLevel:Ljava/lang/String;

    .line 332
    .line 333
    iget-object v6, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$source:Lcom/hellogroup/mk/core/log/core/MKLogSource;

    .line 334
    .line 335
    iget-object v0, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->this$0:Lcom/hellogroup/mk/core/log/page/BasePageLog;

    .line 336
    .line 337
    invoke-virtual {v0}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->i()Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v10

    .line 341
    iget-object v11, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->$thirdBiz:Ljava/lang/String;

    .line 342
    .line 343
    iget-object v0, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->this$0:Lcom/hellogroup/mk/core/log/page/BasePageLog;

    .line 344
    .line 345
    invoke-virtual {v0}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->i()Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object v8

    .line 349
    iget-object v0, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->this$0:Lcom/hellogroup/mk/core/log/page/BasePageLog;

    .line 350
    .line 351
    invoke-virtual {v0}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->j()Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object v9

    .line 355
    const/16 v17, 0xc00

    .line 356
    .line 357
    const/16 v18, 0x0

    .line 358
    .line 359
    const-string v7, "MKPageQualityLog"

    .line 360
    .line 361
    const/4 v14, 0x0

    .line 362
    const-wide/16 v15, 0x0

    .line 363
    .line 364
    invoke-direct/range {v3 .. v18}, Ll/kkw;-><init>(Lcom/hellogroup/mk/core/log/core/MKLogLevel;Ljava/lang/String;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;ZJILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 365
    .line 366
    .line 367
    iget-object v0, v1, Lcom/hellogroup/mk/core/log/page/BasePageLog$performPageLogUpload$1;->this$0:Lcom/hellogroup/mk/core/log/page/BasePageLog;

    .line 368
    .line 369
    invoke-static {v0}, Lcom/hellogroup/mk/core/log/page/BasePageLog;->d(Lcom/hellogroup/mk/core/log/page/BasePageLog;)Lcom/hellogroup/mk/core/log/core/MKLogReporter;

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    if-eqz v0, :cond_8

    .line 374
    .line 375
    invoke-virtual {v0, v3}, Lcom/hellogroup/mk/core/log/core/MKLogReporter;->e(Ll/kkw;)V

    .line 376
    .line 377
    .line 378
    :cond_8
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 379
    .line 380
    return-object v0

    .line 381
    :cond_9
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 382
    .line 383
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 384
    .line 385
    .line 386
    return-object v2
.end method
