.class final Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
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
    c = "com.immomo.motracing.LogCleaner$cleanBeforeAsync$2"
    f = "LogCleaner.kt"
    l = {
        0x6a,
        0x73
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $effectiveTime:J

.field final synthetic $logPath:Ljava/lang/String;

.field final synthetic $maxCount:I

.field final synthetic $storePrefix:Ljava/lang/String;

.field I$0:I

.field J$0:J

.field L$0:Ljava/lang/Object;

.field label:I

.field private p$:Ll/drb;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JILkotlin/coroutines/Continuation;)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->$storePrefix:Ljava/lang/String;

    iput-object p2, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->$logPath:Ljava/lang/String;

    iput-wide p3, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->$effectiveTime:J

    iput p5, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->$maxCount:I

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

    new-instance v0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;

    iget-object v1, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->$storePrefix:Ljava/lang/String;

    iget-object v2, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->$logPath:Ljava/lang/String;

    iget-wide v3, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->$effectiveTime:J

    iget v5, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->$maxCount:I

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;-><init>(Ljava/lang/String;Ljava/lang/String;JILkotlin/coroutines/Continuation;)V

    check-cast p1, Ll/drb;

    iput-object p1, v0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->p$:Ll/drb;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 14
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
    iget v1, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->label:I

    .line 6
    .line 7
    const-wide v2, 0x7fffffffffffffffL

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    const/4 v4, 0x2

    .line 13
    const/4 v5, 0x1

    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    if-eq v1, v5, :cond_1

    .line 17
    .line 18
    if-ne v1, v4, :cond_0

    .line 19
    .line 20
    iget-wide v0, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->J$0:J

    .line 21
    .line 22
    iget-object v2, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->L$0:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v2, Ll/drb;

    .line 25
    .line 26
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    move-object v13, p0

    .line 30
    goto :goto_3

    .line 31
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 32
    .line 33
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x0

    .line 37
    return-object p0

    .line 38
    :cond_1
    iget v1, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->I$0:I

    .line 39
    .line 40
    iget-object v6, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->L$0:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast v6, Ll/drb;

    .line 43
    .line 44
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    move-object p1, v6

    .line 48
    goto :goto_1

    .line 49
    :cond_2
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->p$:Ll/drb;

    .line 53
    .line 54
    const/4 v1, 0x0

    .line 55
    move-wide v6, v2

    .line 56
    :goto_0
    const/4 v8, 0x5

    .line 57
    if-ge v1, v8, :cond_4

    .line 58
    .line 59
    cmp-long v8, v6, v2

    .line 60
    .line 61
    if-nez v8, :cond_4

    .line 62
    .line 63
    iput-object p1, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->L$0:Ljava/lang/Object;

    .line 64
    .line 65
    iput-wide v6, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->J$0:J

    .line 66
    .line 67
    iput v1, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->I$0:I

    .line 68
    .line 69
    iput v5, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->label:I

    .line 70
    .line 71
    const-wide/16 v6, 0x7d0

    .line 72
    .line 73
    invoke-static {v6, v7, p0}, Lkotlinx/coroutines/DelayKt;->b(JLkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v6

    .line 77
    if-ne v6, v0, :cond_3

    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_3
    :goto_1
    sget-object v6, Lcom/immomo/motracing/GlobalTracer;->INSTANCE:Lcom/immomo/motracing/GlobalTracer;

    .line 81
    .line 82
    invoke-virtual {v6}, Lcom/immomo/motracing/GlobalTracer;->d()J

    .line 83
    .line 84
    .line 85
    move-result-wide v6

    .line 86
    add-int/2addr v1, v5

    .line 87
    goto :goto_0

    .line 88
    :cond_4
    iget-object v10, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->$storePrefix:Ljava/lang/String;

    .line 89
    .line 90
    sget-object v8, Lcom/immomo/motracing/LogCleaner;->INSTANCE:Lcom/immomo/motracing/LogCleaner;

    .line 91
    .line 92
    iget-object v9, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->$logPath:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 95
    .line 96
    .line 97
    move-result-wide v2

    .line 98
    const-wide/32 v11, 0x36ee80

    .line 99
    .line 100
    .line 101
    sub-long/2addr v2, v11

    .line 102
    invoke-static {v2, v3, v6, v7}, Lkotlin/ranges/a;->f(JJ)J

    .line 103
    .line 104
    .line 105
    move-result-wide v11

    .line 106
    iput-object p1, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->L$0:Ljava/lang/Object;

    .line 107
    .line 108
    iput-wide v6, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->J$0:J

    .line 109
    .line 110
    iput v1, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->I$0:I

    .line 111
    .line 112
    iput v4, p0, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->label:I

    .line 113
    .line 114
    move-object v13, p0

    .line 115
    invoke-virtual/range {v8 .. v13}, Lcom/immomo/motracing/LogCleaner;->d(Ljava/lang/String;Ljava/lang/String;JLkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    if-ne p0, v0, :cond_5

    .line 120
    .line 121
    :goto_2
    return-object v0

    .line 122
    :cond_5
    move-wide v0, v6

    .line 123
    :goto_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 124
    .line 125
    .line 126
    move-result-wide p0

    .line 127
    iget-wide v2, v13, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->$effectiveTime:J

    .line 128
    .line 129
    sub-long/2addr p0, v2

    .line 130
    sget-object v2, Lcom/immomo/motracing/LogCleaner;->INSTANCE:Lcom/immomo/motracing/LogCleaner;

    .line 131
    .line 132
    iget-object v3, v13, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->$logPath:Ljava/lang/String;

    .line 133
    .line 134
    iget-object v4, v13, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->$storePrefix:Ljava/lang/String;

    .line 135
    .line 136
    invoke-static {p0, p1, v0, v1}, Lkotlin/ranges/a;->f(JJ)J

    .line 137
    .line 138
    .line 139
    move-result-wide v5

    .line 140
    iget v7, v13, Lcom/immomo/motracing/LogCleaner$cleanBeforeAsync$2;->$maxCount:I

    .line 141
    .line 142
    invoke-static/range {v2 .. v7}, Lcom/immomo/motracing/LogCleaner;->a(Lcom/immomo/motracing/LogCleaner;Ljava/lang/String;Ljava/lang/String;JI)V

    .line 143
    .line 144
    .line 145
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 146
    .line 147
    return-object p0
.end method
