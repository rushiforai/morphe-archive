.class public Lcom/tantan/library/svga/data/cache/disk/DiskCacheFactory;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/data/cache/disk/DiskCache$Factory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantan/library/svga/data/cache/disk/DiskCacheFactory$CacheDirectoryGetter;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0016\u0018\u00002\u00020\u0001:\u0001\tB\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\n\u0010\u0007\u001a\u0004\u0018\u00010\u0008H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/cache/disk/DiskCacheFactory;",
        "Lcom/tantan/library/svga/data/cache/disk/DiskCache$Factory;",
        "cacheDirectoryGetter",
        "Lcom/tantan/library/svga/data/cache/disk/DiskCacheFactory$CacheDirectoryGetter;",
        "diskCacheSize",
        "",
        "(Lcom/tantan/library/svga/data/cache/disk/DiskCacheFactory$CacheDirectoryGetter;J)V",
        "build",
        "Lcom/tantan/library/svga/data/cache/disk/DiskCache;",
        "CacheDirectoryGetter",
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
.field private final cacheDirectoryGetter:Lcom/tantan/library/svga/data/cache/disk/DiskCacheFactory$CacheDirectoryGetter;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final diskCacheSize:J


# direct methods
.method public constructor <init>(Lcom/tantan/library/svga/data/cache/disk/DiskCacheFactory$CacheDirectoryGetter;J)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/data/cache/disk/DiskCacheFactory$CacheDirectoryGetter;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/tantan/library/svga/data/cache/disk/DiskCacheFactory;->cacheDirectoryGetter:Lcom/tantan/library/svga/data/cache/disk/DiskCacheFactory$CacheDirectoryGetter;

    .line 8
    .line 9
    iput-wide p2, p0, Lcom/tantan/library/svga/data/cache/disk/DiskCacheFactory;->diskCacheSize:J

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public build()Lcom/tantan/library/svga/data/cache/disk/DiskCache;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/data/cache/disk/DiskCacheFactory;->cacheDirectoryGetter:Lcom/tantan/library/svga/data/cache/disk/DiskCacheFactory$CacheDirectoryGetter;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/tantan/library/svga/data/cache/disk/DiskCacheFactory$CacheDirectoryGetter;->getCacheDirectory()Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-nez v2, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move-object v0, v1

    .line 24
    :cond_1
    :goto_0
    if-eqz v0, :cond_2

    .line 25
    .line 26
    sget-object v1, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper;->Companion:Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper$Companion;

    .line 27
    .line 28
    iget-wide v2, p0, Lcom/tantan/library/svga/data/cache/disk/DiskCacheFactory;->diskCacheSize:J

    .line 29
    .line 30
    invoke-virtual {v1, v0, v2, v3}, Lcom/tantan/library/svga/data/cache/disk/DiskLruCacheWrapper$Companion;->create(Ljava/io/File;J)Lcom/tantan/library/svga/data/cache/disk/DiskCache;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_2
    return-object v1
.end method
