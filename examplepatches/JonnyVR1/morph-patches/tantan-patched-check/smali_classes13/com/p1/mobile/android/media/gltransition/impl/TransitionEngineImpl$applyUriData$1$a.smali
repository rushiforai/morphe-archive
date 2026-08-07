.class public final Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bui;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
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
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)V
    .locals 0

    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$a;->a:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ll/u1e0;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/u1e0;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$a;->a:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->access$processScene(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Ll/u1e0;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 7
    .line 8
    return-object p0
.end method

.method public bridge synthetic emit(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/u1e0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$a;->a(Ll/u1e0;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
