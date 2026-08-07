.class public final Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->setTransitionAt(ILl/ahj0;)V
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

.field public final synthetic b:Ll/ahj0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Ll/ahj0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$e;->a:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$e;->b:Ll/ahj0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$e;->a:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->access$getTransitionRenders$p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$e;->b:Ll/ahj0;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/ahj0;->b()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/dij0;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/dij0;->E()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$e;->a:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->access$getTransitionRenders$p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)Ljava/util/Map;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$e;->b:Ll/ahj0;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/ahj0;->b()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Ll/dij0;

    .line 43
    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/dij0;->D()V

    .line 47
    .line 48
    .line 49
    :cond_1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 50
    .line 51
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    goto :goto_0

    .line 56
    :catchall_0
    move-exception p0

    .line 57
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 58
    .line 59
    invoke-static {p0}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    :goto_0
    invoke-static {p0}, Lkotlin/Result;->exceptionOrNull-impl(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 68
    .line 69
    .line 70
    return-void
.end method
