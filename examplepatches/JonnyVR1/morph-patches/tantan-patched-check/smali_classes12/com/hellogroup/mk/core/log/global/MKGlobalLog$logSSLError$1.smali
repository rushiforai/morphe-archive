.class final Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/core/log/global/MKGlobalLog;->s(Ljava/lang/Exception;Ljava/lang/String;Ljava/net/URI;Ljava/lang/String;Ljava/lang/String;)V
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
    c = "com.hellogroup.mk.core.log.global.MKGlobalLog$logSSLError$1"
    f = "MKGlobalLog.kt"
    l = {}
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $e:Ljava/lang/Exception;

.field final synthetic $errorUrl:Ljava/lang/String;

.field final synthetic $originUrl:Ljava/lang/String;

.field final synthetic $uri:Ljava/net/URI;

.field final synthetic $url:Ljava/lang/String;

.field label:I

.field private p$:Ll/drb;

.field final synthetic this$0:Lcom/hellogroup/mk/core/log/global/MKGlobalLog;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/core/log/global/MKGlobalLog;Ljava/net/URI;Ljava/lang/String;Ljava/lang/Exception;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->this$0:Lcom/hellogroup/mk/core/log/global/MKGlobalLog;

    iput-object p2, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->$uri:Ljava/net/URI;

    iput-object p3, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->$errorUrl:Ljava/lang/String;

    iput-object p4, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->$e:Ljava/lang/Exception;

    iput-object p5, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->$originUrl:Ljava/lang/String;

    iput-object p6, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->$url:Ljava/lang/String;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p7}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 8
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

    new-instance v0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;

    iget-object v1, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->this$0:Lcom/hellogroup/mk/core/log/global/MKGlobalLog;

    iget-object v2, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->$uri:Ljava/net/URI;

    iget-object v3, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->$errorUrl:Ljava/lang/String;

    iget-object v4, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->$e:Ljava/lang/Exception;

    iget-object v5, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->$originUrl:Ljava/lang/String;

    iget-object v6, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->$url:Ljava/lang/String;

    move-object v7, p2

    invoke-direct/range {v0 .. v7}, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;-><init>(Lcom/hellogroup/mk/core/log/global/MKGlobalLog;Ljava/net/URI;Ljava/lang/String;Ljava/lang/Exception;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Ll/drb;

    iput-object p1, v0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->p$:Ll/drb;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

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
    iget v0, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->label:I

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

    .line 13
    .line 14
    iget-object p1, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->$uri:Ljava/net/URI;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception v0

    .line 24
    move-object p1, v0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    move-object p1, v1

    .line 27
    :goto_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p1}, Ljava/net/InetAddress;->getAllByName(Ljava/lang/String;)[Ljava/net/InetAddress;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    array-length v0, p1

    .line 39
    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, [Ljava/net/InetAddress;

    .line 44
    .line 45
    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Ljava/util/Collection;

    .line 50
    .line 51
    const-string v0, "."

    .line 52
    .line 53
    invoke-static {p1, v0}, Ll/i8g0;->f(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-static {p1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    goto :goto_2

    .line 62
    :goto_1
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 63
    .line 64
    invoke-static {p1}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-static {p1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    :goto_2
    invoke-static {p1}, Lkotlin/Result;->isFailure-impl(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_1

    .line 77
    .line 78
    move-object p1, v1

    .line 79
    :cond_1
    check-cast p1, Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {p1}, Ll/d8g0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    const-string v0, "action"

    .line 86
    .line 87
    const-string v2, "showSSLDialog"

    .line 88
    .line 89
    invoke-static {v0, v2}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    const-string v0, "category"

    .line 94
    .line 95
    iget-object v2, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->$errorUrl:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {v0, v2}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    invoke-static {}, Ll/xjw;->a()Ll/xjw;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iget-object v2, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->$uri:Ljava/net/URI;

    .line 106
    .line 107
    if-eqz v2, :cond_2

    .line 108
    .line 109
    invoke-virtual {v2}, Ljava/net/URI;->getHost()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    goto :goto_3

    .line 114
    :cond_2
    move-object v2, v1

    .line 115
    :goto_3
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-virtual {v0, v2}, Ll/xjw;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    const-string v2, "info"

    .line 124
    .line 125
    invoke-static {v2, v0}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    iget-object v0, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->$e:Ljava/lang/Exception;

    .line 130
    .line 131
    if-eqz v0, :cond_3

    .line 132
    .line 133
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    :cond_3
    const-string v0, "errorMsg"

    .line 138
    .line 139
    invoke-static {v0, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 140
    .line 141
    .line 142
    move-result-object v6

    .line 143
    const-string v0, "msg"

    .line 144
    .line 145
    invoke-static {v0, p1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 146
    .line 147
    .line 148
    move-result-object v7

    .line 149
    const-string p1, "url"

    .line 150
    .line 151
    iget-object v0, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->$originUrl:Ljava/lang/String;

    .line 152
    .line 153
    invoke-static {p1, v0}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 154
    .line 155
    .line 156
    move-result-object v8

    .line 157
    filled-new-array/range {v3 .. v8}, [Lkotlin/Pair;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    invoke-static {p1}, Lkotlin/collections/MapsKt;->hashMapOf([Lkotlin/Pair;)Ljava/util/HashMap;

    .line 162
    .line 163
    .line 164
    move-result-object v5

    .line 165
    iget-object v0, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->this$0:Lcom/hellogroup/mk/core/log/global/MKGlobalLog;

    .line 166
    .line 167
    sget-object v1, Lcom/hellogroup/mk/core/log/global/MKGlobalErrorType;->SSL_ERROR:Lcom/hellogroup/mk/core/log/global/MKGlobalErrorType;

    .line 168
    .line 169
    sget-object v2, Lcom/hellogroup/mk/core/log/core/MKLogSource;->NATIVE:Lcom/hellogroup/mk/core/log/core/MKLogSource;

    .line 170
    .line 171
    iget-object v4, p0, Lcom/hellogroup/mk/core/log/global/MKGlobalLog$logSSLError$1;->$url:Ljava/lang/String;

    .line 172
    .line 173
    const/16 v10, 0x180

    .line 174
    .line 175
    const/4 v11, 0x0

    .line 176
    const/4 v3, 0x0

    .line 177
    const-string v6, "dns_log_fep"

    .line 178
    .line 179
    const/4 v8, 0x0

    .line 180
    const/4 v9, 0x0

    .line 181
    move-object v7, v4

    .line 182
    invoke-static/range {v0 .. v11}, Ll/wo2;->c(Ll/wo2;Lcom/hellogroup/mk/core/log/global/MKGlobalErrorType;Lcom/hellogroup/mk/core/log/core/MKLogSource;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;ILjava/lang/Object;)V

    .line 183
    .line 184
    .line 185
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 186
    .line 187
    return-object p0

    .line 188
    :cond_4
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 189
    .line 190
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    return-object v1
.end method
