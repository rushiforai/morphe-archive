.class final Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/core/log/global/MKGlobalLog;->p(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V
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
    c = "com.hellogroup.mk.core.log.global.MKGlobalLog$logLoadRealUrl$1"
    f = "MKGlobalLog.kt"
    l = {}
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $firstEnterUrl:Ljava/lang/String;

.field final synthetic $isFromWebCache:Ljava/lang/Boolean;

.field final synthetic $url:Ljava/lang/String;

.field final synthetic $useDnsUrl:Ljava/lang/String;

.field label:I

.field private p$:Ll/drb;

.field final synthetic this$0:Lcom/hellogroup/mk/core/log/global/MKGlobalLog;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/core/log/global/MKGlobalLog;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lkotlin/coroutines/Continuation;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->this$0:Lcom/hellogroup/mk/core/log/global/MKGlobalLog;

    iput-object p2, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->$useDnsUrl:Ljava/lang/String;

    iput-object p3, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->$url:Ljava/lang/String;

    iput-object p4, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->$firstEnterUrl:Ljava/lang/String;

    iput-object p5, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->$isFromWebCache:Ljava/lang/Boolean;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p6}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 7
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

    new-instance v0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;

    iget-object v1, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->this$0:Lcom/hellogroup/mk/core/log/global/MKGlobalLog;

    iget-object v2, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->$useDnsUrl:Ljava/lang/String;

    iget-object v3, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->$url:Ljava/lang/String;

    iget-object v4, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->$firstEnterUrl:Ljava/lang/String;

    iget-object v5, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->$isFromWebCache:Ljava/lang/Boolean;

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;-><init>(Lcom/hellogroup/mk/core/log/global/MKGlobalLog;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Ll/drb;

    iput-object p1, v0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->p$:Ll/drb;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

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
    iget v0, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->label:I

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-nez v0, :cond_4

    .line 8
    .line 9
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :try_start_0
    sget-object p1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 13
    .line 14
    :try_start_1
    iget-object p1, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->$useDnsUrl:Ljava/lang/String;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    move-object p1, v0

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    move-object p1, v1

    .line 36
    :goto_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {p1}, Ljava/net/InetAddress;->getAllByName(Ljava/lang/String;)[Ljava/net/InetAddress;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    .line 46
    .line 47
    array-length v0, p1

    .line 48
    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, [Ljava/net/InetAddress;

    .line 53
    .line 54
    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Ljava/util/Collection;

    .line 59
    .line 60
    const-string v0, "."

    .line 61
    .line 62
    invoke-static {p1, v0}, Ll/i8g0;->f(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-static {p1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 70
    goto :goto_2

    .line 71
    :goto_1
    :try_start_2
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 72
    .line 73
    invoke-static {p1}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-static {p1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    :goto_2
    invoke-static {p1}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_1

    .line 86
    .line 87
    move-object p1, v1

    .line 88
    :cond_1
    check-cast p1, Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {p1}, Ll/d8g0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iget-object v0, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->$url:Ljava/lang/String;

    .line 95
    .line 96
    if-eqz v0, :cond_3

    .line 97
    .line 98
    invoke-static {v0}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    xor-int/lit8 v2, v2, 0x1

    .line 103
    .line 104
    invoke-static {v2}, Lkotlin/coroutines/jvm/internal/Boxing;->a(Z)Ljava/lang/Boolean;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    if-eqz v2, :cond_2

    .line 113
    .line 114
    goto :goto_3

    .line 115
    :cond_2
    move-object v0, v1

    .line 116
    :goto_3
    if-eqz v0, :cond_3

    .line 117
    .line 118
    invoke-static {}, Ll/xjw;->a()Ll/xjw;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    new-instance v2, Ljava/net/URI;

    .line 123
    .line 124
    invoke-direct {v2, v0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v2}, Ljava/net/URI;->getHost()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v1, v0}, Ll/xjw;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    :cond_3
    invoke-static {v1}, Ll/d8g0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    const-string v1, "action"

    .line 144
    .line 145
    const-string v2, "loadRealUrl"

    .line 146
    .line 147
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    const-string v1, "category"

    .line 152
    .line 153
    iget-object v2, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->$firstEnterUrl:Ljava/lang/String;

    .line 154
    .line 155
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 156
    .line 157
    .line 158
    move-result-object v4

    .line 159
    const-string v1, "content"

    .line 160
    .line 161
    iget-object v2, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->$useDnsUrl:Ljava/lang/String;

    .line 162
    .line 163
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 164
    .line 165
    .line 166
    move-result-object v5

    .line 167
    const-string v1, "id"

    .line 168
    .line 169
    iget-object v2, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->$isFromWebCache:Ljava/lang/Boolean;

    .line 170
    .line 171
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 176
    .line 177
    .line 178
    move-result-object v6

    .line 179
    const-string v1, "errorMsg"

    .line 180
    .line 181
    new-instance v2, Ljava/lang/Exception;

    .line 182
    .line 183
    invoke-direct {v2}, Ljava/lang/Exception;-><init>()V

    .line 184
    .line 185
    .line 186
    invoke-static {v2}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v2

    .line 190
    invoke-static {v1, v2}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 191
    .line 192
    .line 193
    move-result-object v7

    .line 194
    const-string v1, "info"

    .line 195
    .line 196
    invoke-static {v1, v0}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 197
    .line 198
    .line 199
    move-result-object v8

    .line 200
    const-string v0, "msg"

    .line 201
    .line 202
    invoke-static {v0, p1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 203
    .line 204
    .line 205
    move-result-object v9

    .line 206
    const-string p1, "url"

    .line 207
    .line 208
    iget-object v0, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->$url:Ljava/lang/String;

    .line 209
    .line 210
    invoke-static {p1, v0}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 211
    .line 212
    .line 213
    move-result-object v10

    .line 214
    filled-new-array/range {v3 .. v10}, [Lkotlin/Pair;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    invoke-static {p1}, Lkotlin/collections/MapsKt;->hashMapOf([Lkotlin/Pair;)Ljava/util/HashMap;

    .line 219
    .line 220
    .line 221
    move-result-object v5

    .line 222
    iget-object v0, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->this$0:Lcom/hellogroup/mk/core/log/global/MKGlobalLog;

    .line 223
    .line 224
    sget-object v1, Lcom/hellogroup/mk/core/log/global/MKGlobalErrorType;->LOAD_REAL_URL:Lcom/hellogroup/mk/core/log/global/MKGlobalErrorType;

    .line 225
    .line 226
    sget-object v2, Lcom/hellogroup/mk/core/log/core/MKLogSource;->NATIVE:Lcom/hellogroup/mk/core/log/core/MKLogSource;

    .line 227
    .line 228
    iget-object v4, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logLoadRealUrl$1;->$url:Ljava/lang/String;

    .line 229
    .line 230
    const-string v6, "dns_log_fep"

    .line 231
    .line 232
    const/16 v10, 0x1c0

    .line 233
    .line 234
    const/4 v11, 0x0

    .line 235
    const/4 v3, 0x0

    .line 236
    const/4 v7, 0x0

    .line 237
    const/4 v8, 0x0

    .line 238
    const/4 v9, 0x0

    .line 239
    invoke-static/range {v0 .. v11}, Ll/wo2;->c(Ll/wo2;Lcom/hellogroup/mk/core/log/global/MKGlobalErrorType;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;ILjava/lang/Object;)V

    .line 240
    .line 241
    .line 242
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 243
    .line 244
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 245
    .line 246
    .line 247
    goto :goto_4

    .line 248
    :catchall_1
    move-exception v0

    .line 249
    move-object p0, v0

    .line 250
    sget-object p1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 251
    .line 252
    invoke-static {p0}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object p0

    .line 256
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    .line 258
    .line 259
    :goto_4
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 260
    .line 261
    return-object p0

    .line 262
    :cond_4
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 263
    .line 264
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    return-object v1
.end method
