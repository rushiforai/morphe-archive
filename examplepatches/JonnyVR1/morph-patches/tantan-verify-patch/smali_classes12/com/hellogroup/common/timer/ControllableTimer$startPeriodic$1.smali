.class final Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/common/timer/ControllableTimer;->b(JJLkotlin/jvm/functions/Function1;)V
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
    c = "com.hellogroup.common.timer.ControllableTimer$startPeriodic$1"
    f = "ControllableTimer.kt"
    l = {
        0x2b,
        0x2e,
        0x2f
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $action:Lkotlin/jvm/functions/Function1;

.field final synthetic $initialDelayMillis:J

.field final synthetic $periodMillis:J

.field L$0:Ljava/lang/Object;

.field label:I

.field private p$:Ll/drb;


# direct methods
.method public constructor <init>(JLkotlin/jvm/functions/Function1;JLkotlin/coroutines/Continuation;)V
    .locals 0

    iput-wide p1, p0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->$initialDelayMillis:J

    iput-object p3, p0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->$action:Lkotlin/jvm/functions/Function1;

    iput-wide p4, p0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->$periodMillis:J

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

    new-instance v0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;

    iget-wide v1, p0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->$initialDelayMillis:J

    iget-object v3, p0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->$action:Lkotlin/jvm/functions/Function1;

    iget-wide v4, p0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->$periodMillis:J

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;-><init>(JLkotlin/jvm/functions/Function1;JLkotlin/coroutines/Continuation;)V

    check-cast p1, Ll/drb;

    iput-object p1, v0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->p$:Ll/drb;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9
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
    iget v1, p0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->label:I

    .line 6
    .line 7
    const/4 v2, 0x3

    .line 8
    const/4 v3, 0x2

    .line 9
    const/4 v4, 0x1

    .line 10
    if-eqz v1, :cond_3

    .line 11
    .line 12
    if-eq v1, v4, :cond_2

    .line 13
    .line 14
    if-eq v1, v3, :cond_1

    .line 15
    .line 16
    if-ne v1, v2, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 20
    .line 21
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0

    .line 26
    :cond_1
    iget-object v1, p0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->L$0:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v1, Ll/drb;

    .line 29
    .line 30
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    goto :goto_2

    .line 34
    :cond_2
    :goto_0
    iget-object v1, p0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->L$0:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v1, Ll/drb;

    .line 37
    .line 38
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_3
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->p$:Ll/drb;

    .line 46
    .line 47
    iget-wide v5, p0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->$initialDelayMillis:J

    .line 48
    .line 49
    const-wide/16 v7, 0x0

    .line 50
    .line 51
    cmp-long p1, v5, v7

    .line 52
    .line 53
    if-lez p1, :cond_4

    .line 54
    .line 55
    iput-object v1, p0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->L$0:Ljava/lang/Object;

    .line 56
    .line 57
    iput v4, p0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->label:I

    .line 58
    .line 59
    invoke-static {v5, v6, p0}, Lkotlinx/coroutines/DelayKt;->b(JLkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    if-ne p1, v0, :cond_4

    .line 64
    .line 65
    goto :goto_3

    .line 66
    :cond_4
    :goto_1
    invoke-static {v1}, Lkotlinx/coroutines/f;->g(Ll/drb;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_6

    .line 71
    .line 72
    iget-object p1, p0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->$action:Lkotlin/jvm/functions/Function1;

    .line 73
    .line 74
    iput-object v1, p0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->L$0:Ljava/lang/Object;

    .line 75
    .line 76
    iput v3, p0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->label:I

    .line 77
    .line 78
    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    if-ne p1, v0, :cond_5

    .line 83
    .line 84
    goto :goto_3

    .line 85
    :cond_5
    :goto_2
    iget-wide v4, p0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->$periodMillis:J

    .line 86
    .line 87
    iput-object v1, p0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->L$0:Ljava/lang/Object;

    .line 88
    .line 89
    iput v2, p0, Lcom/hellogroup/common/timer/ControllableTimer$startPeriodic$1;->label:I

    .line 90
    .line 91
    invoke-static {v4, v5, p0}, Lkotlinx/coroutines/DelayKt;->b(JLkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    if-ne p1, v0, :cond_4

    .line 96
    .line 97
    :goto_3
    return-object v0

    .line 98
    :cond_6
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 99
    .line 100
    return-object p0
.end method
