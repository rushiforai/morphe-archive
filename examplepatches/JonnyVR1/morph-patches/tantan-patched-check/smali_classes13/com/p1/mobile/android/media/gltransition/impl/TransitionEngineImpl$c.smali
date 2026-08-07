.class public final Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->prepareDrawer()V
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)V
    .locals 0

    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$c;->a:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    .line 1
    :try_start_0
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$c;->a:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->access$getOutputTexId$p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, -0x1

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$c;->a:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->access$getVideoFormat$p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)Ll/del0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/del0;->g()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$c;->a:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->access$getVideoFormat$p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)Ll/del0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Ll/del0;->f()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    iget-object v2, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$c;->a:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 33
    .line 34
    sget-object v3, Ll/ifj;->INSTANCE:Ll/ifj;

    .line 35
    .line 36
    invoke-virtual {v3}, Ll/ifj;->f()I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    invoke-static {v2, v4}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->access$setOutputTexId$p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;I)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$c;->a:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 44
    .line 45
    invoke-static {p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->access$getOutputTexId$p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    invoke-virtual {v3, v0, v1, v2}, Ll/ifj;->e(III)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-static {p0, v0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->access$setFramebuffer$p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;I)V

    .line 54
    .line 55
    .line 56
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 57
    .line 58
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    goto :goto_0

    .line 63
    :catchall_0
    move-exception p0

    .line 64
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 65
    .line 66
    invoke-static {p0}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    :goto_0
    invoke-static {p0}, Lkotlin/Result;->exceptionOrNull-impl(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 75
    .line 76
    .line 77
    return-void
.end method
