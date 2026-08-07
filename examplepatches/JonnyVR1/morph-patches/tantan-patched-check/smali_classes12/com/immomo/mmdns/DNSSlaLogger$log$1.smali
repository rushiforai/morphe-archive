.class final Lcom/immomo/mmdns/DNSSlaLogger$log$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/mmdns/DNSSlaLogger;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
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
    c = "com.immomo.mmdns.DNSSlaLogger$log$1"
    f = "DNSSlaLogger.kt"
    l = {
        0xd0
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $code:Ljava/lang/String;

.field final synthetic $host:Ljava/lang/String;

.field final synthetic $ip:Ljava/lang/String;

.field final synthetic $isHttpDns:Z

.field L$0:Ljava/lang/Object;

.field label:I

.field private p$:Ll/drb;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLkotlin/coroutines/Continuation;)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/mmdns/DNSSlaLogger$log$1;->$host:Ljava/lang/String;

    iput-object p2, p0, Lcom/immomo/mmdns/DNSSlaLogger$log$1;->$ip:Ljava/lang/String;

    iput-object p3, p0, Lcom/immomo/mmdns/DNSSlaLogger$log$1;->$code:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/immomo/mmdns/DNSSlaLogger$log$1;->$isHttpDns:Z

    const/4 p1, 0x2

    invoke-direct {p0, p1, p5}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 6
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

    new-instance v0, Lcom/immomo/mmdns/DNSSlaLogger$log$1;

    iget-object v1, p0, Lcom/immomo/mmdns/DNSSlaLogger$log$1;->$host:Ljava/lang/String;

    iget-object v2, p0, Lcom/immomo/mmdns/DNSSlaLogger$log$1;->$ip:Ljava/lang/String;

    iget-object v3, p0, Lcom/immomo/mmdns/DNSSlaLogger$log$1;->$code:Ljava/lang/String;

    iget-boolean v4, p0, Lcom/immomo/mmdns/DNSSlaLogger$log$1;->$isHttpDns:Z

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/immomo/mmdns/DNSSlaLogger$log$1;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLkotlin/coroutines/Continuation;)V

    check-cast p1, Ll/drb;

    iput-object p1, v0, Lcom/immomo/mmdns/DNSSlaLogger$log$1;->p$:Ll/drb;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/immomo/mmdns/DNSSlaLogger$log$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/immomo/mmdns/DNSSlaLogger$log$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/immomo/mmdns/DNSSlaLogger$log$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8
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
    iget v1, p0, Lcom/immomo/mmdns/DNSSlaLogger$log$1;->label:I

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
    iget-object p0, p0, Lcom/immomo/mmdns/DNSSlaLogger$log$1;->L$0:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p0, Ll/drb;

    .line 15
    .line 16
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    goto :goto_1

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
    iget-object p1, p0, Lcom/immomo/mmdns/DNSSlaLogger$log$1;->p$:Ll/drb;

    .line 31
    .line 32
    sget-object v1, Lcom/immomo/mmdns/DNSSlaLogger;->INSTANCE:Lcom/immomo/mmdns/DNSSlaLogger;

    .line 33
    .line 34
    invoke-static {v1}, Lcom/immomo/mmdns/DNSSlaLogger;->access$getDnsLogChannel$p(Lcom/immomo/mmdns/DNSSlaLogger;)Ll/fs4;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    new-instance v3, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;

    .line 39
    .line 40
    iget-object v4, p0, Lcom/immomo/mmdns/DNSSlaLogger$log$1;->$host:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v5, p0, Lcom/immomo/mmdns/DNSSlaLogger$log$1;->$ip:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v6, p0, Lcom/immomo/mmdns/DNSSlaLogger$log$1;->$code:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v6}, Lkotlin/text/StringsKt;->toIntOrNull(Ljava/lang/String;)Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object v6

    .line 50
    if-eqz v6, :cond_2

    .line 51
    .line 52
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    goto :goto_0

    .line 57
    :cond_2
    const/4 v6, -0x1

    .line 58
    :goto_0
    iget-boolean v7, p0, Lcom/immomo/mmdns/DNSSlaLogger$log$1;->$isHttpDns:Z

    .line 59
    .line 60
    invoke-direct {v3, v4, v5, v6, v7}, Lcom/immomo/mmdns/DNSSlaLogger$LogEvent$Log;-><init>(Ljava/lang/String;Ljava/lang/String;IZ)V

    .line 61
    .line 62
    .line 63
    iput-object p1, p0, Lcom/immomo/mmdns/DNSSlaLogger$log$1;->L$0:Ljava/lang/Object;

    .line 64
    .line 65
    iput v2, p0, Lcom/immomo/mmdns/DNSSlaLogger$log$1;->label:I

    .line 66
    .line 67
    invoke-interface {v1, v3, p0}, Ll/sme0;->E(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    if-ne p0, v0, :cond_3

    .line 72
    .line 73
    return-object v0

    .line 74
    :cond_3
    :goto_1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 75
    .line 76
    return-object p0
.end method
