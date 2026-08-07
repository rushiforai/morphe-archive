.class public final Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->processScene(Ll/u1e0;)V
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
.field public final synthetic a:Ll/u1e0;

.field public final synthetic b:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;


# direct methods
.method public constructor <init>(Ll/u1e0;Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$d;->a:Ll/u1e0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$d;->b:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

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
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$d;->a:Ll/u1e0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/u1e0;->g()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$d;->b:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->access$getTransitionRenders$p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)Ljava/util/Map;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$d;->a:Ll/u1e0;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/u1e0;->d()Ll/ahj0;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ll/ahj0;->b()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ll/dij0;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/dij0;->E()V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$d;->b:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->access$getTransitionRenders$p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;)Ljava/util/Map;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object p0, p0, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl$d;->a:Ll/u1e0;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/u1e0;->d()Ll/ahj0;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Ll/ahj0;->b()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    check-cast p0, Ll/dij0;

    .line 56
    .line 57
    if-eqz p0, :cond_1

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/dij0;->D()V

    .line 60
    .line 61
    .line 62
    :cond_1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 63
    .line 64
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    goto :goto_0

    .line 69
    :catchall_0
    move-exception p0

    .line 70
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 71
    .line 72
    invoke-static {p0}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    :goto_0
    invoke-static {p0}, Lkotlin/Result;->exceptionOrNull-impl(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 81
    .line 82
    .line 83
    return-void
.end method
