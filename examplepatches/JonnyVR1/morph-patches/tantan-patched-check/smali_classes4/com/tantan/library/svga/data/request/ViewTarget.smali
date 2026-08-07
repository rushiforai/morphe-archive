.class public final Lcom/tantan/library/svga/data/request/ViewTarget;
.super Lcom/tantan/library/svga/data/request/AbsTarget;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantan/library/svga/data/request/AbsTarget<",
        "Lcom/tantan/library/svga/data/cache/Resource<",
        "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
        ">;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00030\u00020\u0001B\u001d\u0012\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0002\u0010\u0008J\u0008\u0010\t\u001a\u00020\nH\u0014J\u0018\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0010H\u0014J\u001e\u0010\u0011\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000e2\u000c\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00020\u00030\u0002H\u0014R\u0010\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0013"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/request/ViewTarget;",
        "Lcom/tantan/library/svga/data/request/AbsTarget;",
        "Lcom/tantan/library/svga/data/cache/Resource;",
        "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
        "callback",
        "Lcom/tantan/library/svga/data/request/RequestCallback;",
        "dynamic",
        "Lcom/tantan/library/svga/compose/SVGADynamicEntity;",
        "(Lcom/tantan/library/svga/data/request/RequestCallback;Lcom/tantan/library/svga/compose/SVGADynamicEntity;)V",
        "executor",
        "Lcom/tantan/library/svga/utils/SVGAExecutors;",
        "onResourceLoadError",
        "",
        "key",
        "Lcom/tantan/library/svga/ResourceKey;",
        "e",
        "Lcom/tantan/library/svga/exception/SVGAException;",
        "setResource",
        "resource",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final callback:Lcom/tantan/library/svga/data/request/RequestCallback;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final dynamic:Lcom/tantan/library/svga/compose/SVGADynamicEntity;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 16
    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-direct {p0, v0, v0, v1, v0}, Lcom/tantan/library/svga/data/request/ViewTarget;-><init>(Lcom/tantan/library/svga/data/request/RequestCallback;Lcom/tantan/library/svga/compose/SVGADynamicEntity;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Lcom/tantan/library/svga/data/request/RequestCallback;Lcom/tantan/library/svga/compose/SVGADynamicEntity;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/data/request/RequestCallback;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/compose/SVGADynamicEntity;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 17
    invoke-direct {p0}, Lcom/tantan/library/svga/data/request/AbsTarget;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/tantan/library/svga/data/request/ViewTarget;->callback:Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 19
    iput-object p2, p0, Lcom/tantan/library/svga/data/request/ViewTarget;->dynamic:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/tantan/library/svga/data/request/RequestCallback;Lcom/tantan/library/svga/compose/SVGADynamicEntity;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 1

    .line 1
    and-int/lit8 p4, p3, 0x1

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p4, :cond_0

    .line 5
    .line 6
    move-object p1, v0

    .line 7
    :cond_0
    and-int/lit8 p3, p3, 0x2

    .line 8
    .line 9
    if-eqz p3, :cond_1

    .line 10
    .line 11
    move-object p2, v0

    .line 12
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/tantan/library/svga/data/request/ViewTarget;-><init>(Lcom/tantan/library/svga/data/request/RequestCallback;Lcom/tantan/library/svga/compose/SVGADynamicEntity;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public executor()Lcom/tantan/library/svga/utils/SVGAExecutors;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/tantan/library/svga/utils/SVGAExecutors;->Companion:Lcom/tantan/library/svga/utils/SVGAExecutors$Companion;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantan/library/svga/utils/SVGAExecutors$Companion;->getFastIo$svga_lib_release()Lcom/tantan/library/svga/utils/SVGAExecutors;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public onResourceLoadError(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;)V
    .locals 4
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/exception/SVGAException;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/tantan/library/svga/SVGALoader;->INSTANCE:Lcom/tantan/library/svga/SVGALoader;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGALoader;->getTargetViews$svga_lib_release()Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ljava/util/Map$Entry;

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Ljava/lang/CharSequence;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/tantan/library/svga/ResourceKey;->cacheKey()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_0

    .line 48
    .line 49
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Lcom/tantan/library/svga/SVGAnimationView;

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/tantan/library/svga/SVGAnimationView;->getRequestCallback()Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    if-eqz v1, :cond_1

    .line 60
    .line 61
    invoke-interface {v1, p1, p2}, Lcom/tantan/library/svga/data/request/RequestCallback;->onLoadFailed(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    iget-object p0, p0, Lcom/tantan/library/svga/data/request/ViewTarget;->callback:Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 69
    .line 70
    if-eqz p0, :cond_3

    .line 71
    .line 72
    invoke-interface {p0, p1, p2}, Lcom/tantan/library/svga/data/request/RequestCallback;->onLoadFailed(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;)V

    .line 73
    .line 74
    .line 75
    :cond_3
    return-void
.end method

.method public setResource(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V
    .locals 5
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Resource;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/ResourceKey;",
            "Lcom/tantan/library/svga/data/cache/Resource<",
            "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/tantan/library/svga/SVGALoader;->INSTANCE:Lcom/tantan/library/svga/SVGALoader;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGALoader;->getTargetViews$svga_lib_release()Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v1, 0x0

    .line 22
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-eqz v2, :cond_3

    .line 27
    .line 28
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Ljava/util/Map$Entry;

    .line 33
    .line 34
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Ljava/lang/CharSequence;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/tantan/library/svga/ResourceKey;->cacheKey()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-eqz v3, :cond_0

    .line 49
    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    invoke-interface {p2}, Lcom/tantan/library/svga/data/cache/Resource;->acquire()V

    .line 53
    .line 54
    .line 55
    :cond_1
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Lcom/tantan/library/svga/SVGAnimationView;

    .line 60
    .line 61
    iget-object v3, p0, Lcom/tantan/library/svga/data/request/ViewTarget;->dynamic:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 62
    .line 63
    invoke-virtual {v1, p2, v3}, Lcom/tantan/library/svga/SVGAnimationView;->setResource$svga_lib_release(Lcom/tantan/library/svga/data/cache/Resource;Lcom/tantan/library/svga/compose/SVGADynamicEntity;)V

    .line 64
    .line 65
    .line 66
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    check-cast v1, Lcom/tantan/library/svga/SVGAnimationView;

    .line 71
    .line 72
    invoke-virtual {v1}, Lcom/tantan/library/svga/SVGAnimationView;->getRequestCallback()Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    if-eqz v1, :cond_2

    .line 77
    .line 78
    invoke-interface {v1, p1, p2}, Lcom/tantan/library/svga/data/request/RequestCallback;->onResourceReady(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V

    .line 79
    .line 80
    .line 81
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 82
    .line 83
    .line 84
    const/4 v1, 0x1

    .line 85
    goto :goto_0

    .line 86
    :cond_3
    if-nez v1, :cond_4

    .line 87
    .line 88
    invoke-interface {p2}, Lcom/tantan/library/svga/data/cache/Resource;->release()V

    .line 89
    .line 90
    .line 91
    :cond_4
    iget-object p0, p0, Lcom/tantan/library/svga/data/request/ViewTarget;->callback:Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 92
    .line 93
    if-eqz p0, :cond_5

    .line 94
    .line 95
    invoke-interface {p0, p1, p2}, Lcom/tantan/library/svga/data/request/RequestCallback;->onResourceReady(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V

    .line 96
    .line 97
    .line 98
    :cond_5
    return-void
.end method

.method public bridge synthetic setResource(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Object;)V
    .locals 0

    .line 99
    check-cast p2, Lcom/tantan/library/svga/data/cache/Resource;

    invoke-virtual {p0, p1, p2}, Lcom/tantan/library/svga/data/request/ViewTarget;->setResource(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V

    return-void
.end method
