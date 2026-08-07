.class public final Lcom/tantan/library/svga/data/load/ActiveLoader;
.super Lcom/tantan/library/svga/data/load/DataLoader;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantan/library/svga/data/load/ActiveLoader$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantan/library/svga/data/load/DataLoader<",
        "Lcom/tantan/library/svga/data/cache/Resource<",
        "*>;",
        "Lcom/tantan/library/svga/data/cache/CachedResource;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0003\n\u0002\u0008\u0006\u0018\u0000 \u00172\u0012\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u0017B\u001b\u0012\u0014\u0010\u0004\u001a\u0010\u0012\u0002\u0008\u0003\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00020\u0001\u00a2\u0006\u0002\u0010\u0005J\u0015\u0010\u0008\u001a\u00020\u00002\u0006\u0010\u0008\u001a\u00020\u0007H\u0000\u00a2\u0006\u0002\u0008\tJ\u0016\u0010\n\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u00022\u0006\u0010\u000b\u001a\u00020\u000cH\u0016J\u0008\u0010\r\u001a\u00020\u000eH\u0016J\u001a\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u000b\u001a\u00020\u000c2\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u0012H\u0016J\u001a\u0010\u0013\u001a\u00020\u00102\u0006\u0010\u000b\u001a\u00020\u000c2\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u0003H\u0016J \u0010\u0015\u001a\u0004\u0018\u00010\u00032\u0006\u0010\u000b\u001a\u00020\u000c2\u000c\u0010\u0016\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u0002H\u0016R\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0018"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/load/ActiveLoader;",
        "Lcom/tantan/library/svga/data/load/DataLoader;",
        "Lcom/tantan/library/svga/data/cache/Resource;",
        "Lcom/tantan/library/svga/data/cache/CachedResource;",
        "parent",
        "(Lcom/tantan/library/svga/data/load/DataLoader;)V",
        "mCallback",
        "Lcom/tantan/library/svga/data/request/RequestCallback;",
        "callback",
        "callback$svga_lib_release",
        "findData",
        "key",
        "Lcom/tantan/library/svga/ResourceKey;",
        "getCacheType",
        "Lcom/tantan/library/svga/tracker/CacheType;",
        "interceptException",
        "",
        "ex",
        "",
        "processData",
        "data",
        "transform",
        "source",
        "Companion",
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final Companion:Lcom/tantan/library/svga/data/load/ActiveLoader$Companion;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field private mCallback:Lcom/tantan/library/svga/data/request/RequestCallback;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/tantan/library/svga/data/load/ActiveLoader$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/tantan/library/svga/data/load/ActiveLoader$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/tantan/library/svga/data/load/ActiveLoader;->Companion:Lcom/tantan/library/svga/data/load/ActiveLoader$Companion;

    return-void
.end method

.method public constructor <init>(Lcom/tantan/library/svga/data/load/DataLoader;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/data/load/DataLoader;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/data/load/DataLoader<",
            "*",
            "Lcom/tantan/library/svga/data/cache/Resource<",
            "*>;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/tantan/library/svga/data/load/DataLoader;-><init>(Lcom/tantan/library/svga/data/load/DataLoader;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final callback$svga_lib_release(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/data/load/ActiveLoader;
    .locals 0
    .param p1    # Lcom/tantan/library/svga/data/request/RequestCallback;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantan/library/svga/data/load/ActiveLoader;->mCallback:Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 5
    .line 6
    return-object p0
.end method

.method public findData(Lcom/tantan/library/svga/ResourceKey;)Lcom/tantan/library/svga/data/cache/Resource;
    .locals 0
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/ResourceKey;",
            ")",
            "Lcom/tantan/library/svga/data/cache/Resource<",
            "*>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/tantan/library/svga/data/cache/CacheProvider;->INSTANCE:Lcom/tantan/library/svga/data/cache/CacheProvider;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/tantan/library/svga/data/cache/CacheProvider;->getActiveResource()Lcom/tantan/library/svga/data/cache/active/ActiveResource;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p1}, Lcom/tantan/library/svga/ResourceKey;->cacheKey()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/data/cache/active/ActiveResource;->get(Ljava/lang/String;)Lcom/tantan/library/svga/data/cache/Resource;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public bridge synthetic findData(Lcom/tantan/library/svga/ResourceKey;)Ljava/lang/Object;
    .locals 0

    .line 19
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/data/load/ActiveLoader;->findData(Lcom/tantan/library/svga/ResourceKey;)Lcom/tantan/library/svga/data/cache/Resource;

    move-result-object p0

    return-object p0
.end method

.method public getCacheType()Lcom/tantan/library/svga/tracker/CacheType;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/tantan/library/svga/tracker/CacheType;->ACTIVE:Lcom/tantan/library/svga/tracker/CacheType;

    .line 2
    .line 3
    return-object p0
.end method

.method public interceptException(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Throwable;)V
    .locals 1
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_1

    .line 5
    .line 6
    iget-object p0, p0, Lcom/tantan/library/svga/data/load/ActiveLoader;->mCallback:Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 7
    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    instance-of v0, p2, Lcom/tantan/library/svga/exception/SVGAException;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    check-cast p2, Lcom/tantan/library/svga/exception/SVGAException;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    new-instance v0, Lcom/tantan/library/svga/exception/SVGAException;

    .line 18
    .line 19
    invoke-direct {v0, p2}, Lcom/tantan/library/svga/exception/SVGAException;-><init>(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    move-object p2, v0

    .line 23
    :goto_0
    invoke-interface {p0, p1, p2}, Lcom/tantan/library/svga/data/request/RequestCallback;->onLoadFailed(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public processData(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/CachedResource;)V
    .locals 4
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/CachedResource;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_7

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/tantan/library/svga/data/cache/CachedResource;->get()Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getKey()Lcom/tantan/library/svga/ResourceKey;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p2}, Lcom/tantan/library/svga/data/cache/CachedResource;->get()Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getKey()Lcom/tantan/library/svga/ResourceKey;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Lcom/tantan/library/svga/ResourceKey;->isCacheable$svga_lib_release()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/4 v2, 0x1

    .line 27
    const/4 v3, 0x0

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/tantan/library/svga/ResourceKey;->isCacheable$svga_lib_release()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    move v1, v3

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    :goto_0
    move v1, v2

    .line 40
    :goto_1
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/ResourceKey;->setCacheable$svga_lib_release(Z)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p2}, Lcom/tantan/library/svga/data/cache/CachedResource;->get()Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getKey()Lcom/tantan/library/svga/ResourceKey;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p2}, Lcom/tantan/library/svga/data/cache/CachedResource;->get()Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1}, Lcom/tantan/library/svga/compose/SVGAVideoEntity;->getKey()Lcom/tantan/library/svga/ResourceKey;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Lcom/tantan/library/svga/ResourceKey;->isPreload$svga_lib_release()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-nez v1, :cond_3

    .line 64
    .line 65
    invoke-virtual {p1}, Lcom/tantan/library/svga/ResourceKey;->isPreload$svga_lib_release()Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_2
    move v2, v3

    .line 73
    :cond_3
    :goto_2
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/ResourceKey;->setPreload$svga_lib_release(Z)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/tantan/library/svga/ResourceKey;->isCacheable$svga_lib_release()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_4

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/tantan/library/svga/ResourceKey;->isPreload$svga_lib_release()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_6

    .line 87
    .line 88
    :cond_4
    invoke-virtual {p1}, Lcom/tantan/library/svga/ResourceKey;->isPreload$svga_lib_release()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_5

    .line 93
    .line 94
    invoke-virtual {p2}, Lcom/tantan/library/svga/data/cache/CachedResource;->loadData()V

    .line 95
    .line 96
    .line 97
    goto :goto_3

    .line 98
    :cond_5
    invoke-virtual {p2}, Lcom/tantan/library/svga/data/cache/CachedResource;->acquire()V

    .line 99
    .line 100
    .line 101
    :cond_6
    :goto_3
    iget-object p0, p0, Lcom/tantan/library/svga/data/load/ActiveLoader;->mCallback:Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 102
    .line 103
    if-eqz p0, :cond_7

    .line 104
    .line 105
    invoke-interface {p0, p1, p2}, Lcom/tantan/library/svga/data/request/RequestCallback;->onResourceReady(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V

    .line 106
    .line 107
    .line 108
    :cond_7
    return-void
.end method

.method public bridge synthetic processData(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Object;)V
    .locals 0

    .line 109
    check-cast p2, Lcom/tantan/library/svga/data/cache/CachedResource;

    invoke-virtual {p0, p1, p2}, Lcom/tantan/library/svga/data/load/ActiveLoader;->processData(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/CachedResource;)V

    return-void
.end method

.method public transform(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)Lcom/tantan/library/svga/data/cache/CachedResource;
    .locals 0
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Resource;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/ResourceKey;",
            "Lcom/tantan/library/svga/data/cache/Resource<",
            "*>;)",
            "Lcom/tantan/library/svga/data/cache/CachedResource;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    instance-of p0, p2, Lcom/tantan/library/svga/data/cache/CachedResource;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    check-cast p2, Lcom/tantan/library/svga/data/cache/CachedResource;

    .line 9
    .line 10
    return-object p2

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public bridge synthetic transform(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 13
    check-cast p2, Lcom/tantan/library/svga/data/cache/Resource;

    invoke-virtual {p0, p1, p2}, Lcom/tantan/library/svga/data/load/ActiveLoader;->transform(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)Lcom/tantan/library/svga/data/cache/CachedResource;

    move-result-object p0

    return-object p0
.end method
