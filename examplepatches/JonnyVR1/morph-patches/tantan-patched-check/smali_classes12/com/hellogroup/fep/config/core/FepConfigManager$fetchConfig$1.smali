.class final Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/fep/config/core/FepConfigManager;->h(Lcom/hellogroup/fep/config/model/FepConfigFetchType;)V
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
    c = "com.hellogroup.fep.config.core.FepConfigManager$fetchConfig$1"
    f = "FepConfigManager.kt"
    l = {
        0x8b
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $type:Lcom/hellogroup/fep/config/model/FepConfigFetchType;

.field L$0:Ljava/lang/Object;

.field label:I

.field private p$:Ll/drb;

.field final synthetic this$0:Lcom/hellogroup/fep/config/core/FepConfigManager;


# direct methods
.method public constructor <init>(Lcom/hellogroup/fep/config/core/FepConfigManager;Lcom/hellogroup/fep/config/model/FepConfigFetchType;Lkotlin/coroutines/Continuation;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;->this$0:Lcom/hellogroup/fep/config/core/FepConfigManager;

    iput-object p2, p0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;->$type:Lcom/hellogroup/fep/config/model/FepConfigFetchType;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 2
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

    new-instance v0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;

    iget-object v1, p0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;->this$0:Lcom/hellogroup/fep/config/core/FepConfigManager;

    iget-object p0, p0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;->$type:Lcom/hellogroup/fep/config/model/FepConfigFetchType;

    invoke-direct {v0, v1, p0, p2}, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;-><init>(Lcom/hellogroup/fep/config/core/FepConfigManager;Lcom/hellogroup/fep/config/model/FepConfigFetchType;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Ll/drb;

    iput-object p1, v0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;->p$:Ll/drb;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
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
    iget v1, p0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;->label:I

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    if-ne v1, v2, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;->L$0:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Ll/drb;

    .line 15
    .line 16
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 21
    .line 22
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return-object p0

    .line 27
    :cond_1
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;->p$:Ll/drb;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;->this$0:Lcom/hellogroup/fep/config/core/FepConfigManager;

    .line 33
    .line 34
    iput-object p1, p0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;->L$0:Ljava/lang/Object;

    .line 35
    .line 36
    iput v2, p0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;->label:I

    .line 37
    .line 38
    invoke-virtual {v1, p0}, Lcom/hellogroup/fep/config/core/FepConfigManager;->t(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    if-ne p1, v0, :cond_2

    .line 43
    .line 44
    return-object v0

    .line 45
    :cond_2
    :goto_0
    sget-object p1, Lcom/hellogroup/fep/config/internal/FepConfigContext;->INSTANCE:Lcom/hellogroup/fep/config/internal/FepConfigContext;

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/hellogroup/fep/config/internal/FepConfigContext;->b()Ljava/util/concurrent/atomic/AtomicReference;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Ll/zfi;

    .line 56
    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/zfi;->a()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    if-eqz v0, :cond_3

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_3
    const-string v0, ""

    .line 67
    .line 68
    :goto_1
    invoke-virtual {p1}, Lcom/hellogroup/fep/config/internal/FepConfigContext;->d()Lcom/hellogroup/fep/config/internal/fetch/FepConfigFetchModule;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iget-object v1, p0, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;->$type:Lcom/hellogroup/fep/config/model/FepConfigFetchType;

    .line 73
    .line 74
    new-instance v2, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1$1;

    .line 75
    .line 76
    invoke-direct {v2, p0}, Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1$1;-><init>(Lcom/hellogroup/fep/config/core/FepConfigManager$fetchConfig$1;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, v1, v0, v2}, Lcom/hellogroup/fep/config/internal/fetch/FepConfigFetchModule;->a(Lcom/hellogroup/fep/config/model/FepConfigFetchType;Ljava/lang/String;Lkotlin/jvm/functions/Function2;)V

    .line 80
    .line 81
    .line 82
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 83
    .line 84
    return-object p0
.end method
