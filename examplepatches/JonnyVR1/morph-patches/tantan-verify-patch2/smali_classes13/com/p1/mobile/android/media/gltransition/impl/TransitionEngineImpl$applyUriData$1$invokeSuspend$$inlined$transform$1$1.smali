.class public final Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bui;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/bui;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0006\u0010\u0000\u001a\u00020\u0001\"\u0004\u0008\u0000\u0010\u0002\"\u0004\u0008\u0001\u0010\u00032\u0006\u0010\u0004\u001a\u0002H\u0002H\u008a@\u00a2\u0006\u0004\u0008\u0005\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "<anonymous>",
        "",
        "T",
        "R",
        "value",
        "emit",
        "(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "kotlinx/coroutines/flow/FlowKt__EmittersKt$transform$1$1"
    }
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final synthetic a:Ll/bui;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bui<",
            "Ll/u1e0;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic b:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;


# direct methods
.method public constructor <init>(Ll/bui;Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1;->b:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1;->a:Ll/bui;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final emit(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 4
    .param p2    # Lkotlin/coroutines/Continuation;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
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
    instance-of v0, p2, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;

    .line 7
    .line 8
    iget v1, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;->label:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;->label:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;-><init>(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1;Lkotlin/coroutines/Continuation;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;->result:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget v2, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;->label:I

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    if-ne v2, v3, :cond_1

    .line 37
    .line 38
    iget-object p0, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;->L$3:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast p0, Ll/bui;

    .line 41
    .line 42
    iget-object p0, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;->L$2:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast p0, Landroid/net/Uri;

    .line 45
    .line 46
    iget-object p0, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;->L$1:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast p0, Lkotlin/coroutines/Continuation;

    .line 49
    .line 50
    invoke-static {p2}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 55
    .line 56
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const/4 p0, 0x0

    .line 60
    return-object p0

    .line 61
    :cond_2
    invoke-static {p2}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    iget-object p2, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1;->a:Ll/bui;

    .line 65
    .line 66
    move-object v2, p1

    .line 67
    check-cast v2, Landroid/net/Uri;

    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1;->b:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 70
    .line 71
    invoke-static {p0, v2}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->access$createScene(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Landroid/net/Uri;)Ll/u1e0;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {p1}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iput-object p1, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;->L$0:Ljava/lang/Object;

    .line 80
    .line 81
    invoke-static {v0}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iput-object p1, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;->L$1:Ljava/lang/Object;

    .line 86
    .line 87
    invoke-static {v2}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iput-object p1, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;->L$2:Ljava/lang/Object;

    .line 92
    .line 93
    invoke-static {p2}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iput-object p1, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;->L$3:Ljava/lang/Object;

    .line 98
    .line 99
    const/4 p1, 0x0

    .line 100
    iput p1, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;->I$0:I

    .line 101
    .line 102
    iput v3, v0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;->label:I

    .line 103
    .line 104
    invoke-interface {p2, p0, v0}, Ll/bui;->emit(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    if-ne p0, v1, :cond_3

    .line 109
    .line 110
    return-object v1

    .line 111
    :cond_3
    :goto_1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 112
    .line 113
    return-object p0
.end method
