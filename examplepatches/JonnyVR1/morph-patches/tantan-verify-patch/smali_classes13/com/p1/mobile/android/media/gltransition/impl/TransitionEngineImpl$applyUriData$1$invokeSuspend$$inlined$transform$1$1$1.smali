.class public final Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;
.super Lkotlin/coroutines/jvm/internal/ContinuationImpl;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1;->emit(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
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

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.p1.mobile.android.media.gltransition.impl.TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1"
    f = "TransitionEngineImpl.kt"
    l = {
        0xdf
    }
    m = "emit"
    v = 0x1
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field I$0:I

.field L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field L$3:Ljava/lang/Object;

.field label:I

.field synthetic result:Ljava/lang/Object;

.field final synthetic this$0:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1;Lkotlin/coroutines/Continuation;)V
    .locals 0

    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;->this$0:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1;

    invoke-direct {p0, p2}, Lkotlin/coroutines/jvm/internal/ContinuationImpl;-><init>(Lkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;->result:Ljava/lang/Object;

    iget p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;->label:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;->label:I

    iget-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1$1;->this$0:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$applyUriData$1$invokeSuspend$$inlined$transform$1$1;->emit(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
