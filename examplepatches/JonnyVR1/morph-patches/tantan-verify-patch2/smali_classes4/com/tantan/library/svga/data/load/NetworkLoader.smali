.class public final Lcom/tantan/library/svga/data/load/NetworkLoader;
.super Lcom/tantan/library/svga/data/load/DataLoader;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantan/library/svga/data/load/NetworkLoader$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantan/library/svga/data/load/DataLoader<",
        "Ljava/io/InputStream;",
        "Ljava/nio/ByteBuffer;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\u0018\u0000 \u00112\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u0011B\u0013\u0012\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u0012\u0010\u0007\u001a\u0004\u0018\u00010\u00022\u0006\u0010\u0008\u001a\u00020\tH\u0016J\u0008\u0010\n\u001a\u00020\u000bH\u0016J\u001a\u0010\u000c\u001a\u00020\r2\u0006\u0010\u0008\u001a\u00020\t2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u0003H\u0016J\u001c\u0010\u000f\u001a\u0004\u0018\u00010\u00032\u0006\u0010\u0008\u001a\u00020\t2\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u0002H\u0016R\u0014\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0012"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/load/NetworkLoader;",
        "Lcom/tantan/library/svga/data/load/DataLoader;",
        "Ljava/io/InputStream;",
        "Ljava/nio/ByteBuffer;",
        "fetcher",
        "Lcom/tantan/library/svga/data/fetcher/DataFetcher;",
        "(Lcom/tantan/library/svga/data/fetcher/DataFetcher;)V",
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final Companion:Lcom/tantan/library/svga/data/load/NetworkLoader$Companion;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field private final fetcher:Lcom/tantan/library/svga/data/fetcher/DataFetcher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantan/library/svga/data/fetcher/DataFetcher<",
            "Ljava/io/InputStream;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/tantan/library/svga/data/load/NetworkLoader$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/tantan/library/svga/data/load/NetworkLoader$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/tantan/library/svga/data/load/NetworkLoader;->Companion:Lcom/tantan/library/svga/data/load/NetworkLoader$Companion;

    return-void
.end method

.method public constructor <init>(Lcom/tantan/library/svga/data/fetcher/DataFetcher;)V
    .locals 2
    .param p1    # Lcom/tantan/library/svga/data/fetcher/DataFetcher;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/data/fetcher/DataFetcher<",
            "Ljava/io/InputStream;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-direct {p0, v0, v1, v0}, Lcom/tantan/library/svga/data/load/DataLoader;-><init>(Lcom/tantan/library/svga/data/load/DataLoader;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/tantan/library/svga/data/load/NetworkLoader;->fetcher:Lcom/tantan/library/svga/data/fetcher/DataFetcher;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public findData(Lcom/tantan/library/svga/ResourceKey;)Ljava/io/InputStream;
    .locals 0
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantan/library/svga/data/load/NetworkLoader;->fetcher:Lcom/tantan/library/svga/data/fetcher/DataFetcher;

    .line 5
    .line 6
    invoke-interface {p0}, Lcom/tantan/library/svga/data/fetcher/DataFetcher;->loadData()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ljava/io/InputStream;

    .line 11
    .line 12
    return-object p0
.end method

.method public bridge synthetic findData(Lcom/tantan/library/svga/ResourceKey;)Ljava/lang/Object;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/data/load/NetworkLoader;->findData(Lcom/tantan/library/svga/ResourceKey;)Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method

.method public getCacheType()Lcom/tantan/library/svga/tracker/CacheType;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/tantan/library/svga/tracker/CacheType;->NETWORK:Lcom/tantan/library/svga/tracker/CacheType;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic processData(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Object;)V
    .locals 0

    .line 56
    check-cast p2, Ljava/nio/ByteBuffer;

    invoke-virtual {p0, p1, p2}, Lcom/tantan/library/svga/data/load/NetworkLoader;->processData(Lcom/tantan/library/svga/ResourceKey;Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method public processData(Lcom/tantan/library/svga/ResourceKey;Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/nio/ByteBuffer;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/tantan/library/svga/data/cache/CacheProvider;->INSTANCE:Lcom/tantan/library/svga/data/cache/CacheProvider;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/tantan/library/svga/data/cache/CacheProvider;->getDiskCache()Lcom/tantan/library/svga/data/cache/disk/DiskCache;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    :goto_0
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/tantan/library/svga/ResourceKey;->cacheKey()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    new-instance v2, Lcom/tantan/library/svga/data/transfrom/DiskCacheWriter;

    .line 23
    .line 24
    new-instance v3, Lcom/tantan/library/svga/data/transfrom/ByteBufferEncoder;

    .line 25
    .line 26
    invoke-direct {v3}, Lcom/tantan/library/svga/data/transfrom/ByteBufferEncoder;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-direct {v2, v3, p2}, Lcom/tantan/library/svga/data/transfrom/DiskCacheWriter;-><init>(Lcom/tantan/library/svga/data/transfrom/Encoder;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {v0, v1, v2}, Lcom/tantan/library/svga/data/cache/disk/DiskCache;->put(Ljava/lang/String;Lcom/tantan/library/svga/data/cache/disk/DiskCache$Writer;)Ljava/io/File;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    if-eqz p2, :cond_1

    .line 37
    .line 38
    sget-object v0, Lcom/tantan/library/svga/tracker/CacheTrackerManager;->INSTANCE:Lcom/tantan/library/svga/tracker/CacheTrackerManager;

    .line 39
    .line 40
    sget-object v1, Lcom/tantan/library/svga/tracker/CacheType;->DISK:Lcom/tantan/library/svga/tracker/CacheType;

    .line 41
    .line 42
    new-instance v2, Lcom/tantan/library/svga/data/load/NetworkLoader$processData$3$1;

    .line 43
    .line 44
    invoke-direct {v2, p2}, Lcom/tantan/library/svga/data/load/NetworkLoader$processData$3$1;-><init>(Ljava/io/File;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1, p1, v2}, Lcom/tantan/library/svga/tracker/CacheTrackerManager;->onCachePut(Lcom/tantan/library/svga/tracker/CacheType;Lcom/tantan/library/svga/data/cache/Key;Lkotlin/jvm/functions/Function0;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object p0, p0, Lcom/tantan/library/svga/data/load/NetworkLoader;->fetcher:Lcom/tantan/library/svga/data/fetcher/DataFetcher;

    .line 51
    .line 52
    invoke-interface {p0}, Lcom/tantan/library/svga/data/fetcher/DataFetcher;->recycle()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public bridge synthetic transform(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 11
    check-cast p2, Ljava/io/InputStream;

    invoke-virtual {p0, p1, p2}, Lcom/tantan/library/svga/data/load/NetworkLoader;->transform(Lcom/tantan/library/svga/ResourceKey;Ljava/io/InputStream;)Ljava/nio/ByteBuffer;

    move-result-object p0

    return-object p0
.end method

.method public transform(Lcom/tantan/library/svga/ResourceKey;Ljava/io/InputStream;)Ljava/nio/ByteBuffer;
    .locals 0
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/io/InputStream;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/tantan/library/svga/utils/ByteBufferUtil;->INSTANCE:Lcom/tantan/library/svga/utils/ByteBufferUtil;

    .line 5
    .line 6
    invoke-virtual {p0, p2}, Lcom/tantan/library/svga/utils/ByteBufferUtil;->fromStream(Ljava/io/InputStream;)Ljava/nio/ByteBuffer;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method
