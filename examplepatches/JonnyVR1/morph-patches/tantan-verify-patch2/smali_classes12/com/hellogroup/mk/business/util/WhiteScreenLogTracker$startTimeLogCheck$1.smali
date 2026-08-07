.class final Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;->q(Ljava/lang/String;)V
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
    c = "com.hellogroup.mk.business.util.WhiteScreenLogTracker$startTimeLogCheck$1"
    f = "WhiteScreenLogTracker.kt"
    l = {
        0xb3
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $logSessionKey:Ljava/lang/String;

.field L$0:Ljava/lang/Object;

.field label:I

.field private p$:Ll/drb;

.field final synthetic this$0:Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;->this$0:Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    iput-object p2, p0, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;->$logSessionKey:Ljava/lang/String;

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

    new-instance v0, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;

    iget-object v1, p0, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;->this$0:Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    iget-object p0, p0, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;->$logSessionKey:Ljava/lang/String;

    invoke-direct {v0, v1, p0, p2}, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;-><init>(Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Ll/drb;

    iput-object p1, v0, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;->p$:Ll/drb;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
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
    iget v1, p0, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;->label:I

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
    iget-object v0, p0, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;->L$0:Ljava/lang/Object;

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
    iget-object p1, p0, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;->p$:Ll/drb;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;->this$0:Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 33
    .line 34
    invoke-static {v1}, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;->a(Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    int-to-long v3, v1

    .line 39
    const-wide/16 v5, 0x3e8

    .line 40
    .line 41
    mul-long/2addr v3, v5

    .line 42
    iput-object p1, p0, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;->L$0:Ljava/lang/Object;

    .line 43
    .line 44
    iput v2, p0, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;->label:I

    .line 45
    .line 46
    invoke-static {v3, v4, p0}, Lkotlinx/coroutines/DelayKt;->b(JLkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    if-ne p1, v0, :cond_2

    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;->this$0:Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 54
    .line 55
    invoke-static {p1}, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;->c(Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-nez p1, :cond_3

    .line 64
    .line 65
    iget-object p1, p0, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;->this$0:Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 66
    .line 67
    iget-object v0, p0, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;->$logSessionKey:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {p1, v0}, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;->d(Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;->this$0:Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;

    .line 73
    .line 74
    invoke-static {p1}, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;->b(Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    new-instance v0, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    const-string v1, "startTimeLogCheck="

    .line 81
    .line 82
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/hellogroup/mk/business/util/WhiteScreenLogTracker$startTimeLogCheck$1;->$logSessionKey:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const/16 p0, 0x3d

    .line 91
    .line 92
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-static {p1, p0}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    :cond_3
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 110
    .line 111
    return-object p0
.end method
