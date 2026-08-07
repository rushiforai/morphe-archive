.class public final Lcom/tantan/library/svga/data/load/MemoryLoader;
.super Lcom/tantan/library/svga/data/load/DataLoader;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantan/library/svga/data/load/MemoryLoader$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantan/library/svga/data/load/DataLoader<",
        "Lcom/tantan/library/svga/data/cache/Resource<",
        "*>;",
        "Lcom/tantan/library/svga/data/cache/Resource<",
        "*>;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\u0018\u0000 \u000f2\u0016\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u0002\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00020\u0001:\u0001\u000fB\u001b\u0012\u0014\u0010\u0003\u001a\u0010\u0012\u0002\u0008\u0003\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00020\u0001\u00a2\u0006\u0002\u0010\u0004J\u0016\u0010\u0005\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u00022\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0008\u0010\u0008\u001a\u00020\tH\u0016J\u001e\u0010\n\u001a\u00020\u000b2\u0006\u0010\u0006\u001a\u00020\u00072\u000c\u0010\u000c\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u0002H\u0016J$\u0010\r\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u00022\u0006\u0010\u0006\u001a\u00020\u00072\u000c\u0010\u000e\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u0002H\u0016\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/load/MemoryLoader;",
        "Lcom/tantan/library/svga/data/load/DataLoader;",
        "Lcom/tantan/library/svga/data/cache/Resource;",
        "parent",
        "(Lcom/tantan/library/svga/data/load/DataLoader;)V",
        "findData",
        "key",
        "Lcom/tantan/library/svga/ResourceKey;",
        "getCacheType",
        "Lcom/tantan/library/svga/tracker/CacheType;",
        "processData",
        "",
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


# static fields
.field public static final Companion:Lcom/tantan/library/svga/data/load/MemoryLoader$Companion;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/tantan/library/svga/data/load/MemoryLoader$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/tantan/library/svga/data/load/MemoryLoader$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/tantan/library/svga/data/load/MemoryLoader;->Companion:Lcom/tantan/library/svga/data/load/MemoryLoader$Companion;

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
    invoke-virtual {p0}, Lcom/tantan/library/svga/data/cache/CacheProvider;->getMemoryLruCache()Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/tantan/library/svga/ResourceKey;->cacheKey()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/data/cache/memory/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/tantan/library/svga/data/cache/Resource;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method public bridge synthetic findData(Lcom/tantan/library/svga/ResourceKey;)Ljava/lang/Object;
    .locals 0

    .line 25
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/data/load/MemoryLoader;->findData(Lcom/tantan/library/svga/ResourceKey;)Lcom/tantan/library/svga/data/cache/Resource;

    move-result-object p0

    return-object p0
.end method

.method public getCacheType()Lcom/tantan/library/svga/tracker/CacheType;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/tantan/library/svga/tracker/CacheType;->MEMORY:Lcom/tantan/library/svga/tracker/CacheType;

    .line 2
    .line 3
    return-object p0
.end method

.method public processData(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V
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
            "*>;)V"
        }
    .end annotation

    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public bridge synthetic processData(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p2, Lcom/tantan/library/svga/data/cache/Resource;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/tantan/library/svga/data/load/MemoryLoader;->processData(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public transform(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)Lcom/tantan/library/svga/data/cache/Resource;
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
            "Lcom/tantan/library/svga/data/cache/Resource<",
            "*>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p2
.end method

.method public bridge synthetic transform(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p2, Lcom/tantan/library/svga/data/cache/Resource;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/tantan/library/svga/data/load/MemoryLoader;->transform(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)Lcom/tantan/library/svga/data/cache/Resource;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
