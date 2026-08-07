.class public final Lcom/tantan/library/svga/data/cache/CacheProvider;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002R\u0011\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006R\u001c\u0010\u0007\u001a\u0004\u0018\u00010\u0008X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\t\u0010\n\"\u0004\u0008\u000b\u0010\u000cR\u001c\u0010\r\u001a\u0004\u0018\u00010\u000eX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010\"\u0004\u0008\u0011\u0010\u0012R\u001c\u0010\u0013\u001a\u0004\u0018\u00010\u0014X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0015\u0010\u0016\"\u0004\u0008\u0017\u0010\u0018\u00a8\u0006\u0019"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/cache/CacheProvider;",
        "",
        "()V",
        "activeResource",
        "Lcom/tantan/library/svga/data/cache/active/ActiveResource;",
        "getActiveResource",
        "()Lcom/tantan/library/svga/data/cache/active/ActiveResource;",
        "assetsProvider",
        "Landroid/content/res/AssetManager;",
        "getAssetsProvider",
        "()Landroid/content/res/AssetManager;",
        "setAssetsProvider",
        "(Landroid/content/res/AssetManager;)V",
        "diskCache",
        "Lcom/tantan/library/svga/data/cache/disk/DiskCache;",
        "getDiskCache",
        "()Lcom/tantan/library/svga/data/cache/disk/DiskCache;",
        "setDiskCache",
        "(Lcom/tantan/library/svga/data/cache/disk/DiskCache;)V",
        "memoryLruCache",
        "Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;",
        "getMemoryLruCache",
        "()Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;",
        "setMemoryLruCache",
        "(Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;)V",
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
.field public static final INSTANCE:Lcom/tantan/library/svga/data/cache/CacheProvider;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final activeResource:Lcom/tantan/library/svga/data/cache/active/ActiveResource;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static assetsProvider:Landroid/content/res/AssetManager;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private static diskCache:Lcom/tantan/library/svga/data/cache/disk/DiskCache;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private static memoryLruCache:Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tantan/library/svga/data/cache/CacheProvider;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantan/library/svga/data/cache/CacheProvider;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tantan/library/svga/data/cache/CacheProvider;->INSTANCE:Lcom/tantan/library/svga/data/cache/CacheProvider;

    .line 7
    .line 8
    new-instance v0, Lcom/tantan/library/svga/data/cache/active/ActiveResource;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/tantan/library/svga/data/cache/active/ActiveResource;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/tantan/library/svga/data/cache/CacheProvider;->activeResource:Lcom/tantan/library/svga/data/cache/active/ActiveResource;

    .line 14
    .line 15
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final getActiveResource()Lcom/tantan/library/svga/data/cache/active/ActiveResource;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/tantan/library/svga/data/cache/CacheProvider;->activeResource:Lcom/tantan/library/svga/data/cache/active/ActiveResource;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getAssetsProvider()Landroid/content/res/AssetManager;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object p0, Lcom/tantan/library/svga/data/cache/CacheProvider;->assetsProvider:Landroid/content/res/AssetManager;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getDiskCache()Lcom/tantan/library/svga/data/cache/disk/DiskCache;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object p0, Lcom/tantan/library/svga/data/cache/CacheProvider;->diskCache:Lcom/tantan/library/svga/data/cache/disk/DiskCache;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMemoryLruCache()Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object p0, Lcom/tantan/library/svga/data/cache/CacheProvider;->memoryLruCache:Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;

    .line 2
    .line 3
    return-object p0
.end method

.method public final setAssetsProvider(Landroid/content/res/AssetManager;)V
    .locals 0
    .param p1    # Landroid/content/res/AssetManager;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sput-object p1, Lcom/tantan/library/svga/data/cache/CacheProvider;->assetsProvider:Landroid/content/res/AssetManager;

    .line 2
    .line 3
    return-void
.end method

.method public final setDiskCache(Lcom/tantan/library/svga/data/cache/disk/DiskCache;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/data/cache/disk/DiskCache;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sput-object p1, Lcom/tantan/library/svga/data/cache/CacheProvider;->diskCache:Lcom/tantan/library/svga/data/cache/disk/DiskCache;

    .line 2
    .line 3
    return-void
.end method

.method public final setMemoryLruCache(Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sput-object p1, Lcom/tantan/library/svga/data/cache/CacheProvider;->memoryLruCache:Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;

    .line 2
    .line 3
    return-void
.end method
