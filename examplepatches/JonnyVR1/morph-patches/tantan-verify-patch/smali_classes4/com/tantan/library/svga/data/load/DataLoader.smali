.class public abstract Lcom/tantan/library/svga/data/load/DataLoader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<FromSource:",
        "Ljava/lang/Object;",
        "ToData:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0003\n\u0002\u0008\u0008\u0008&\u0018\u0000*\u0004\u0008\u0000\u0010\u0001*\u0004\u0008\u0001\u0010\u00022\u00020\u0003B\u001b\u0012\u0014\u0008\u0002\u0010\u0004\u001a\u000e\u0012\u0002\u0008\u0003\u0012\u0004\u0012\u00028\u0000\u0018\u00010\u0000\u00a2\u0006\u0002\u0010\u0005J\u0017\u0010\u0006\u001a\u0004\u0018\u00018\u00002\u0006\u0010\u0007\u001a\u00020\u0008H&\u00a2\u0006\u0002\u0010\tJ\u0008\u0010\n\u001a\u00020\u000bH&J\u001a\u0010\u000c\u001a\u00020\r2\u0006\u0010\u0007\u001a\u00020\u00082\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u000fH\u0016J\u0017\u0010\u0010\u001a\u0004\u0018\u00018\u00012\u0006\u0010\u0007\u001a\u00020\u0008H\u0016\u00a2\u0006\u0002\u0010\tJ\u001f\u0010\u0011\u001a\u00020\r2\u0006\u0010\u0007\u001a\u00020\u00082\u0008\u0010\u0012\u001a\u0004\u0018\u00018\u0001H&\u00a2\u0006\u0002\u0010\u0013J!\u0010\u0014\u001a\u0004\u0018\u00018\u00012\u0006\u0010\u0007\u001a\u00020\u00082\u0008\u0010\u0015\u001a\u0004\u0018\u00018\u0000H&\u00a2\u0006\u0002\u0010\u0016R\u001a\u0010\u0004\u001a\u000e\u0012\u0002\u0008\u0003\u0012\u0004\u0012\u00028\u0000\u0018\u00010\u0000X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0017"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/load/DataLoader;",
        "FromSource",
        "ToData",
        "",
        "parent",
        "(Lcom/tantan/library/svga/data/load/DataLoader;)V",
        "findData",
        "key",
        "Lcom/tantan/library/svga/ResourceKey;",
        "(Lcom/tantan/library/svga/ResourceKey;)Ljava/lang/Object;",
        "getCacheType",
        "Lcom/tantan/library/svga/tracker/CacheType;",
        "interceptException",
        "",
        "ex",
        "",
        "loadData",
        "processData",
        "data",
        "(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Object;)V",
        "transform",
        "source",
        "(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Object;)Ljava/lang/Object;",
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


# instance fields
.field private final parent:Lcom/tantan/library/svga/data/load/DataLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantan/library/svga/data/load/DataLoader<",
            "*TFromSource;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 11
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1, v0}, Lcom/tantan/library/svga/data/load/DataLoader;-><init>(Lcom/tantan/library/svga/data/load/DataLoader;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Lcom/tantan/library/svga/data/load/DataLoader;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/data/load/DataLoader;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/data/load/DataLoader<",
            "*TFromSource;>;)V"
        }
    .end annotation

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/tantan/library/svga/data/load/DataLoader;->parent:Lcom/tantan/library/svga/data/load/DataLoader;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/tantan/library/svga/data/load/DataLoader;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    invoke-direct {p0, p1}, Lcom/tantan/library/svga/data/load/DataLoader;-><init>(Lcom/tantan/library/svga/data/load/DataLoader;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public abstract findData(Lcom/tantan/library/svga/ResourceKey;)Ljava/lang/Object;
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/ResourceKey;",
            ")TFromSource;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end method

.method public abstract getCacheType()Lcom/tantan/library/svga/tracker/CacheType;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end method

.method public interceptException(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Throwable;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/tantan/library/svga/exception/SVGAException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_1

    .line 5
    .line 6
    instance-of p0, p2, Lcom/tantan/library/svga/exception/SVGAException;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    new-instance p0, Lcom/tantan/library/svga/exception/SVGAException;

    .line 12
    .line 13
    invoke-direct {p0, p2}, Lcom/tantan/library/svga/exception/SVGAException;-><init>(Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    move-object p2, p0

    .line 17
    :goto_0
    throw p2

    .line 18
    :cond_1
    return-void
.end method

.method public loadData(Lcom/tantan/library/svga/ResourceKey;)Ljava/lang/Object;
    .locals 4
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/ResourceKey;",
            ")TToData;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/tantan/library/svga/exception/SVGAException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/data/load/DataLoader;->findData(Lcom/tantan/library/svga/ResourceKey;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    :try_start_1
    sget-object v2, Lcom/tantan/library/svga/tracker/CacheTrackerManager;->INSTANCE:Lcom/tantan/library/svga/tracker/CacheTrackerManager;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tantan/library/svga/data/load/DataLoader;->getCacheType()Lcom/tantan/library/svga/tracker/CacheType;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v2, v3, p1}, Lcom/tantan/library/svga/tracker/CacheTrackerManager;->onCacheMiss(Lcom/tantan/library/svga/tracker/CacheType;Lcom/tantan/library/svga/data/cache/Key;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception v2

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    sget-object v2, Lcom/tantan/library/svga/tracker/CacheTrackerManager;->INSTANCE:Lcom/tantan/library/svga/tracker/CacheTrackerManager;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/tantan/library/svga/data/load/DataLoader;->getCacheType()Lcom/tantan/library/svga/tracker/CacheType;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v2, v3, p1}, Lcom/tantan/library/svga/tracker/CacheTrackerManager;->onCacheHit(Lcom/tantan/library/svga/tracker/CacheType;Lcom/tantan/library/svga/data/cache/Key;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    .line 31
    .line 32
    :goto_0
    move-object v2, v0

    .line 33
    goto :goto_1

    .line 34
    :catchall_1
    move-exception v2

    .line 35
    move-object v1, v0

    .line 36
    :goto_1
    if-nez v1, :cond_2

    .line 37
    .line 38
    :try_start_2
    iget-object v1, p0, Lcom/tantan/library/svga/data/load/DataLoader;->parent:Lcom/tantan/library/svga/data/load/DataLoader;

    .line 39
    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    invoke-virtual {v1, p1}, Lcom/tantan/library/svga/data/load/DataLoader;->loadData(Lcom/tantan/library/svga/ResourceKey;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    goto :goto_2

    .line 47
    :catchall_2
    move-exception v1

    .line 48
    move-object v2, v1

    .line 49
    goto :goto_3

    .line 50
    :cond_1
    move-object v1, v0

    .line 51
    :cond_2
    :goto_2
    invoke-virtual {p0, p1, v1}, Lcom/tantan/library/svga/data/load/DataLoader;->transform(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 55
    goto :goto_4

    .line 56
    :goto_3
    move-object v1, v0

    .line 57
    :goto_4
    if-eqz v1, :cond_3

    .line 58
    .line 59
    invoke-virtual {p0, p1, v1}, Lcom/tantan/library/svga/data/load/DataLoader;->processData(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 63
    .line 64
    :cond_3
    if-nez v0, :cond_4

    .line 65
    .line 66
    invoke-virtual {p0, p1, v2}, Lcom/tantan/library/svga/data/load/DataLoader;->interceptException(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Throwable;)V

    .line 67
    .line 68
    .line 69
    :cond_4
    return-object v1
.end method

.method public abstract processData(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Object;)V
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/ResourceKey;",
            "TToData;)V"
        }
    .end annotation
.end method

.method public abstract transform(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Object;)Ljava/lang/Object;
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/ResourceKey;",
            "TFromSource;)TToData;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end method
