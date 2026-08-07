.class public final Lcom/tantan/library/svga/data/load/DiskLoader$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/data/load/DiskLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u000e\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/load/DiskLoader$Companion;",
        "",
        "()V",
        "builder",
        "Lcom/tantan/library/svga/data/load/DiskLoader;",
        "key",
        "Lcom/tantan/library/svga/ResourceKey;",
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


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantan/library/svga/data/load/DiskLoader$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final builder(Lcom/tantan/library/svga/ResourceKey;)Lcom/tantan/library/svga/data/load/DiskLoader;
    .locals 2
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
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
    sget-object p0, Lcom/tantan/library/svga/data/load/NetworkLoader;->Companion:Lcom/tantan/library/svga/data/load/NetworkLoader$Companion;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/data/load/NetworkLoader$Companion;->builder(Lcom/tantan/library/svga/ResourceKey;)Lcom/tantan/library/svga/data/load/NetworkLoader;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sget-object v0, Lcom/tantan/library/svga/data/cache/CacheProvider;->INSTANCE:Lcom/tantan/library/svga/data/cache/CacheProvider;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tantan/library/svga/data/cache/CacheProvider;->getDiskCache()Lcom/tantan/library/svga/data/cache/disk/DiskCache;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/tantan/library/svga/ResourceKey;->cacheKey()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-interface {v0, p1}, Lcom/tantan/library/svga/data/cache/disk/DiskCache;->get(Ljava/lang/String;)Ljava/io/File;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p1, 0x0

    .line 34
    :goto_0
    new-instance v0, Lcom/tantan/library/svga/data/load/DiskLoader;

    .line 35
    .line 36
    new-instance v1, Lcom/tantan/library/svga/data/fetcher/ByteBufferFileResourceFetcher;

    .line 37
    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    const-string p1, ""

    .line 41
    .line 42
    :cond_1
    invoke-direct {v1, p1}, Lcom/tantan/library/svga/data/fetcher/ByteBufferFileResourceFetcher;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-direct {v0, v1, p0}, Lcom/tantan/library/svga/data/load/DiskLoader;-><init>(Lcom/tantan/library/svga/data/fetcher/DataFetcher;Lcom/tantan/library/svga/data/load/DataLoader;)V

    .line 46
    .line 47
    .line 48
    return-object v0
.end method
