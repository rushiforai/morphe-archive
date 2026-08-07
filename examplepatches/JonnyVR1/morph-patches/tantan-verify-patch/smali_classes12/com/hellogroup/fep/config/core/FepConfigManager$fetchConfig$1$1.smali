.class final Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Ll/zfi;",
        "Lcom/hellogroup/fep/config/internal/fetch/FepConfigError;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0010\u0007\u001a\u00020\u00042\u0008\u0010\u0001\u001a\u0004\u0018\u00010\u00002\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0002H\n\u00a2\u0006\u0004\u0008\u0005\u0010\u0006"
    }
    d2 = {
        "Ll/zfi;",
        "configData",
        "Lcom/hellogroup/fep/config/internal/fetch/FepConfigError;",
        "error",
        "",
        "invoke",
        "(Ll/zfi;Lcom/hellogroup/fep/config/internal/fetch/FepConfigError;)V",
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
.field final synthetic this$0:Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;


# direct methods
.method public constructor <init>(Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1$1;->this$0:Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 138
    check-cast p1, Ll/zfi;

    check-cast p2, Lcom/hellogroup/fep/config/internal/fetch/FepConfigError;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1$1;->invoke(Ll/zfi;Lcom/hellogroup/fep/config/internal/fetch/FepConfigError;)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke(Ll/zfi;Lcom/hellogroup/fep/config/internal/fetch/FepConfigError;)V
    .locals 11
    .param p1    # Ll/zfi;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/hellogroup/fep/config/internal/fetch/FepConfigError;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1$1;->this$0:Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;->this$0:Lcom/hellogroup/fep/config/core/FepConfigManager;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/hellogroup/fep/config/core/FepConfigManager;->d(Lcom/hellogroup/fep/config/core/FepConfigManager;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 11
    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    sget-object p1, Lcom/hellogroup/fep/config/internal/FepConfigContext;->INSTANCE:Lcom/hellogroup/fep/config/internal/FepConfigContext;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/hellogroup/fep/config/internal/FepConfigContext;->e()Ll/pgi;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p2}, Lcom/hellogroup/fep/config/internal/fetch/FepConfigError;->getCode()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p2}, Lcom/hellogroup/fep/config/internal/fetch/FepConfigError;->getMessage()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {p2}, Lcom/hellogroup/fep/config/internal/fetch/FepConfigError;->getThrowable()Ljava/lang/Throwable;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {p2}, Lcom/hellogroup/fep/config/internal/fetch/FepConfigError;->getParams()Ljava/util/Map;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p1, v0, v1, v2, p2}, Ll/pgi;->c(ILjava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1$1;->this$0:Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;->this$0:Lcom/hellogroup/fep/config/core/FepConfigManager;

    .line 43
    .line 44
    invoke-static {p0}, Lcom/hellogroup/fep/config/core/FepConfigManager;->f(Lcom/hellogroup/fep/config/core/FepConfigManager;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    if-eqz p1, :cond_2

    .line 49
    .line 50
    iget-object p2, p0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1$1;->this$0:Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;

    .line 51
    .line 52
    iget-object p2, p2, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;->$type:Lcom/hellogroup/fep/config/model/FepConfigFetchType;

    .line 53
    .line 54
    sget-object v0, Lcom/hellogroup/fep/config/model/FepConfigFetchType;->LAUNCH:Lcom/hellogroup/fep/config/model/FepConfigFetchType;

    .line 55
    .line 56
    if-eq p2, v0, :cond_1

    .line 57
    .line 58
    invoke-virtual {p1}, Ll/zfi;->c()Z

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    if-eqz p2, :cond_2

    .line 63
    .line 64
    :cond_1
    sget-object p2, Lcom/hellogroup/fep/config/internal/FepConfigContext;->INSTANCE:Lcom/hellogroup/fep/config/internal/FepConfigContext;

    .line 65
    .line 66
    invoke-virtual {p2}, Lcom/hellogroup/fep/config/internal/FepConfigContext;->b()Ljava/util/concurrent/atomic/AtomicReference;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    sget-object v0, Lcom/hellogroup/fep/base/FepContext;->INSTANCE:Lcom/hellogroup/fep/base/FepContext;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/hellogroup/fep/base/FepContext;->a()Ll/drb;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    new-instance v5, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1$1$1;

    .line 80
    .line 81
    const/4 v0, 0x0

    .line 82
    invoke-direct {v5, p1, v0}, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1$1$1;-><init>(Ll/zfi;Lkotlin/coroutines/Continuation;)V

    .line 83
    .line 84
    .line 85
    const/4 v6, 0x3

    .line 86
    const/4 v7, 0x0

    .line 87
    const/4 v3, 0x0

    .line 88
    const/4 v4, 0x0

    .line 89
    invoke-static/range {v2 .. v7}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 90
    .line 91
    .line 92
    iget-object v2, p0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1$1;->this$0:Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;

    .line 93
    .line 94
    iget-object v3, v2, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;->this$0:Lcom/hellogroup/fep/config/core/FepConfigManager;

    .line 95
    .line 96
    iget-object v2, v2, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;->$type:Lcom/hellogroup/fep/config/model/FepConfigFetchType;

    .line 97
    .line 98
    const/4 v4, 0x1

    .line 99
    invoke-static {v3, v1, v2, v4, v0}, Lcom/hellogroup/fep/config/core/FepConfigManager;->n(Lcom/hellogroup/fep/config/core/FepConfigManager;ZLcom/hellogroup/fep/config/model/FepConfigFetchType;ILjava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p2}, Lcom/hellogroup/fep/config/internal/FepConfigContext;->e()Ll/pgi;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    new-instance p2, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    const-string v0, "Config fetched and updated successfully, hash: "

    .line 109
    .line 110
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1}, Ll/zfi;->a()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v6

    .line 124
    const/4 v9, 0x6

    .line 125
    const/4 v10, 0x0

    .line 126
    const/4 v8, 0x0

    .line 127
    invoke-static/range {v5 .. v10}, Ll/pgi;->f(Ll/pgi;Ljava/lang/String;Ljava/util/Map;IILjava/lang/Object;)V

    .line 128
    .line 129
    .line 130
    :cond_2
    iget-object p0, p0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1$1;->this$0:Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;

    .line 131
    .line 132
    iget-object p0, p0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;->this$0:Lcom/hellogroup/fep/config/core/FepConfigManager;

    .line 133
    .line 134
    invoke-static {p0}, Lcom/hellogroup/fep/config/core/FepConfigManager;->f(Lcom/hellogroup/fep/config/core/FepConfigManager;)V

    .line 135
    .line 136
    .line 137
    return-void
.end method
