.class final Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$4;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function3<",
        "Ll/bui<",
        "-",
        "Ll/u1e0;",
        ">;",
        "Ljava/lang/Throwable;",
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
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0003\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0010\u0005\u001a\u00020\u0004*\u0008\u0012\u0004\u0012\u00020\u00010\u00002\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0002H\n\u00a2\u0006\u0004\u0008\u0005\u0010\u0006"
    }
    d2 = {
        "Ll/bui;",
        "Ll/u1e0;",
        "",
        "it",
        "",
        "<anonymous>",
        "(Ll/bui;Ljava/lang/Throwable;)V"
    }
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.p1.mobile.android.media.gltransition.impl.TransitionEngineImpl$applyPathData$1$4"
    f = "TransitionEngineImpl.kt"
    l = {}
    m = "invokeSuspend"
    v = 0x1
.end annotation


# instance fields
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
.method public constructor <init>(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/Long;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$4;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$4;->this$0:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    iput-object p2, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$4;->$onLoaded:Lkotlin/jvm/functions/Function1;

    const/4 p1, 0x3

    invoke-direct {p0, p1, p3}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 17
    check-cast p1, Ll/bui;

    check-cast p2, Ljava/lang/Throwable;

    check-cast p3, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$4;->invoke(Ll/bui;Ljava/lang/Throwable;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Ll/bui;Ljava/lang/Throwable;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bui<",
            "-",
            "Ll/u1e0;",
            ">;",
            "Ljava/lang/Throwable;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    new-instance p1, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$4;

    .line 2
    .line 3
    iget-object p2, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$4;->this$0:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$4;->$onLoaded:Lkotlin/jvm/functions/Function1;

    .line 6
    .line 7
    invoke-direct {p1, p2, p0, p3}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$4;-><init>(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$4;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$4;->label:I

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$4;->this$0:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->access$evaluateDuration(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$4;->this$0:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->access$setDefaultEndTransition(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$4;->this$0:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->access$prepareDrawer(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$4;->$onLoaded:Lkotlin/jvm/functions/Function1;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$4;->this$0:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 29
    .line 30
    invoke-static {p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->access$getTotalDuration$p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    invoke-static {v0, v1}, Lkotlin/coroutines/jvm/internal/Boxing;->c(J)Ljava/lang/Long;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 45
    .line 46
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method
