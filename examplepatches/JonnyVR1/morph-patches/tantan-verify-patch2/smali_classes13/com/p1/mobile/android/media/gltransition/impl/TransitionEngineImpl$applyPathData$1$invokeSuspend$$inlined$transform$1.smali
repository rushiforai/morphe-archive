.class public final Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


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
        "Lkotlin/jvm/functions/Function2<",
        "Ll/bui<",
        "-",
        "Ll/u1e0;",
        ">;",
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
        "\u0000\u0010\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0010\u0004\u001a\u00020\u0003\"\u0004\u0008\u0000\u0010\u0000\"\u0004\u0008\u0001\u0010\u0001*\u0008\u0012\u0004\u0012\u00028\u00010\u0002H\u008a@\u00a2\u0006\u0004\u0008\u0004\u0010\u0005\u00a8\u0006\u0006"
    }
    d2 = {
        "T",
        "R",
        "Ll/bui;",
        "",
        "<anonymous>",
        "(Ll/bui;)V",
        "kotlinx/coroutines/flow/FlowKt__EmittersKt$transform$1"
    }
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.p1.mobile.android.media.gltransition.impl.TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1"
    f = "TransitionEngineImpl.kt"
    l = {
        0x28
    }
    m = "invokeSuspend"
    v = 0x1
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field final synthetic $this_transform:Ll/aui;

.field private synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;


# direct methods
.method public constructor <init>(Ll/aui;Lkotlin/coroutines/Continuation;Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1;->$this_transform:Ll/aui;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1;->this$0:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 4
    .line 5
    const/4 p1, 0x2

    .line 6
    invoke-direct {p0, p1, p2}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    .line 7
    .line 8
    .line 9
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

    new-instance v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1;

    iget-object v1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1;->$this_transform:Ll/aui;

    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1;->this$0:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    invoke-direct {v0, v1, p2, p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1;-><init>(Ll/aui;Lkotlin/coroutines/Continuation;Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)V

    iput-object p1, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1;->L$0:Ljava/lang/Object;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 14
    check-cast p1, Ll/bui;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1;->invoke(Ll/bui;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Ll/bui;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0
    .param p1    # Ll/bui;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lkotlin/coroutines/Continuation;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bui<",
            "-",
            "Ll/u1e0;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1;

    .line 6
    .line 7
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
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
    iget v1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1;->label:I

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
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1;->L$0:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p0, Ll/bui;

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
    iget-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1;->L$0:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast p1, Ll/bui;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1;->$this_transform:Ll/aui;

    .line 35
    .line 36
    new-instance v3, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1$1;

    .line 37
    .line 38
    iget-object v4, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1;->this$0:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 39
    .line 40
    invoke-direct {v3, p1, v4}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1$1;-><init>(Ll/bui;Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p1}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1;->L$0:Ljava/lang/Object;

    .line 48
    .line 49
    iput v2, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyPathData$1$invokeSuspend$$inlined$transform$1;->label:I

    .line 50
    .line 51
    invoke-interface {v1, v3, p0}, Ll/aui;->collect(Ll/bui;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    if-ne p0, v0, :cond_2

    .line 56
    .line 57
    return-object v0

    .line 58
    :cond_2
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 59
    .line 60
    return-object p0
.end method
