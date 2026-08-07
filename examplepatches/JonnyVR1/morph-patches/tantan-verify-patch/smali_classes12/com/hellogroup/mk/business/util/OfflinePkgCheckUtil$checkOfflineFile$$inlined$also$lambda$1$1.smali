.class final Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
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
        "Lkotlin/Result<",
        "+",
        "Lkotlin/Unit;",
        ">;>;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0000H\u008a@\u00a2\u0006\u0004\u0008\u0003\u0010\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "Ll/drb;",
        "Lkotlin/Result;",
        "",
        "invoke",
        "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
        "com/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$2$1$2",
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
.field final synthetic $deletePkgs:Ljava/util/List;

.field label:I

.field private p$:Ll/drb;

.field final synthetic this$0:Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;Ljava/util/List;Lkotlin/coroutines/Continuation;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1$1;->this$0:Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;

    iput-object p2, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1$1;->$deletePkgs:Ljava/util/List;

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

    new-instance v0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1$1;

    iget-object v1, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1$1;->this$0:Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;

    iget-object p0, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1$1;->$deletePkgs:Ljava/util/List;

    invoke-direct {v0, v1, p0, p2}, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1$1;-><init>(Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;Ljava/util/List;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Ll/drb;

    iput-object p1, v0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1$1;->p$:Ll/drb;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
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
    iget v0, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1$1;->label:I

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    :try_start_0
    sget-object p1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 12
    .line 13
    iget-object p1, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1$1;->this$0:Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->$checkInfo$inlined:Ll/y35;

    .line 16
    .line 17
    iget-object p1, p1, Ll/y35;->a:Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Ll/hul;

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    const-string v0, "OfflinePkgCheckUtil"

    .line 28
    .line 29
    const-string v1, "already remove and reload"

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1$1;->this$0:Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->$resourceResponse$inlined:Ll/x4d0;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1$1;->$deletePkgs:Ljava/util/List;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ll/x4d0;->a(Ljava/util/List;)V

    .line 41
    .line 42
    .line 43
    invoke-interface {p1}, Ll/hul;->a()V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1$1;->this$0:Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/hellogroup/mk/business/util/OfflinePkgCheckUtil$checkOfflineFile$$inlined$also$lambda$1;->$checkInfo$inlined:Ll/y35;

    .line 49
    .line 50
    const/4 p1, 0x1

    .line 51
    iput-boolean p1, p0, Ll/y35;->b:Z

    .line 52
    .line 53
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 54
    .line 55
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    goto :goto_0

    .line 60
    :catchall_0
    move-exception p0

    .line 61
    sget-object p1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 62
    .line 63
    invoke-static {p0}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    :goto_0
    invoke-static {p0}, Lkotlin/Result;->box-impl(Ljava/lang/Object;)Lkotlin/Result;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 77
    .line 78
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    const/4 p0, 0x0

    .line 82
    return-object p0
.end method
