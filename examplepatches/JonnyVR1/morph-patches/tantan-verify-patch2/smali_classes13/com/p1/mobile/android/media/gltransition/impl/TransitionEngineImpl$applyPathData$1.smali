.class final Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->applyPathData(Ljava/util/List;Lkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/o;
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
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n\u00a2\u0006\u0004\u0008\u0002\u0010\u0003"
    }
    d2 = {
        "Ll/drb;",
        "",
        "<anonymous>",
        "(Ll/drb;)V"
    }
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.p1.mobile.android.media.gltransition.impl.TransitionEngineImpl$applyPathData$1"
    f = "TransitionEngineImpl.kt"
    l = {
        0x190
    }
    m = "invokeSuspend"
    v = 0x1
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field final synthetic $images:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $onLoaded:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Ljava/lang/Long;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field label:I

.field final synthetic this$0:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Long;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;->$images:Ljava/util/List;

    iput-object p2, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;->this$0:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    iput-object p3, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;->$onLoaded:Lkotlin/jvm/functions/Function1;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 2
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

    new-instance p1, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;

    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;->$images:Ljava/util/List;

    iget-object v1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;->this$0:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;->$onLoaded:Lkotlin/jvm/functions/Function1;

    invoke-direct {p1, v0, v1, p0, p2}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;-><init>(Ljava/util/List;Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)V

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 14
    check-cast p1, Ll/drb;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;->invoke(Ll/drb;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Ll/drb;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/drb;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;

    .line 6
    .line 7
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;->label:I

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x0

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    if-ne v1, v2, :cond_0

    .line 12
    .line 13
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 18
    .line 19
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-object v3

    .line 23
    :cond_1
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;->$images:Ljava/util/List;

    .line 27
    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;->this$0:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 31
    .line 32
    invoke-static {v1, p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->access$setImagePaths$p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    check-cast p1, Ljava/lang/Iterable;

    .line 36
    .line 37
    invoke-static {p1}, Ll/fui;->a(Ljava/lang/Iterable;)Ll/aui;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    if-eqz p1, :cond_2

    .line 42
    .line 43
    new-instance v1, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$filter$1;

    .line 44
    .line 45
    invoke-direct {v1, p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$filter$1;-><init>(Ll/aui;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;->this$0:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 49
    .line 50
    new-instance v4, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1;

    .line 51
    .line 52
    invoke-direct {v4, v1, v3, p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1;-><init>(Ll/aui;Lkotlin/coroutines/Continuation;Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v4}, Ll/fui;->w(Lkotlin/jvm/functions/Function2;)Ll/aui;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    if-eqz p1, :cond_2

    .line 60
    .line 61
    new-instance v1, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$4;

    .line 62
    .line 63
    iget-object v4, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;->this$0:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 64
    .line 65
    iget-object v5, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;->$onLoaded:Lkotlin/jvm/functions/Function1;

    .line 66
    .line 67
    invoke-direct {v1, v4, v5, v3}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$4;-><init>(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p1, v1}, Ll/fui;->D(Ll/aui;Lkotlin/jvm/functions/Function3;)Ll/aui;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    if-eqz p1, :cond_2

    .line 75
    .line 76
    new-instance v1, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$5;

    .line 77
    .line 78
    invoke-direct {v1, v3}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$5;-><init>(Lkotlin/coroutines/Continuation;)V

    .line 79
    .line 80
    .line 81
    invoke-static {p1, v1}, Ll/fui;->f(Ll/aui;Lkotlin/jvm/functions/Function3;)Ll/aui;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    if-eqz p1, :cond_2

    .line 86
    .line 87
    new-instance v1, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$a;

    .line 88
    .line 89
    iget-object v3, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;->this$0:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 90
    .line 91
    invoke-direct {v1, v3}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$a;-><init>(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)V

    .line 92
    .line 93
    .line 94
    iput v2, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;->label:I

    .line 95
    .line 96
    invoke-interface {p1, v1, p0}, Ll/aui;->collect(Ll/bui;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    if-ne p0, v0, :cond_2

    .line 101
    .line 102
    return-object v0

    .line 103
    :cond_2
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 104
    .line 105
    return-object p0
.end method
