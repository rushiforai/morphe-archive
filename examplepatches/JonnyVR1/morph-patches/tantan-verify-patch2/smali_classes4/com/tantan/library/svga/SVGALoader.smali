.class public final Lcom/tantan/library/svga/SVGALoader;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantan/library/svga/SVGALoader$SvgaGlobalCall;,
        Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000J\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001:\u0002 !B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0008\u0010\u0015\u001a\u00020\u0016H\u0007J\u0010\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0018\u001a\u00020\u0012H\u0007J\u0018\u0010\u0017\u001a\u00020\u00162\u000e\u0010\u0018\u001a\n\u0012\u0004\u0012\u00020\u0012\u0018\u00010\u0019H\u0007J\u000e\u0010\u001a\u001a\u00020\u00162\u0006\u0010\u001b\u001a\u00020\u0011J\u0010\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u001fH\u0007R\u001a\u0010\u0003\u001a\u00020\u0004X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\"\u0004\u0008\u0007\u0010\u0008R\u001c\u0010\t\u001a\u0004\u0018\u00010\nX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000b\u0010\u000c\"\u0004\u0008\r\u0010\u000eR \u0010\u000f\u001a\u000e\u0012\u0004\u0012\u00020\u0011\u0012\u0004\u0012\u00020\u00120\u0010X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0014\u00a8\u0006\""
    }
    d2 = {
        "Lcom/tantan/library/svga/SVGALoader;",
        "",
        "()V",
        "inSampleSize",
        "",
        "getInSampleSize",
        "()I",
        "setInSampleSize",
        "(I)V",
        "svgaGlobalCall",
        "Lcom/tantan/library/svga/SVGALoader$SvgaGlobalCall;",
        "getSvgaGlobalCall",
        "()Lcom/tantan/library/svga/SVGALoader$SvgaGlobalCall;",
        "setSvgaGlobalCall",
        "(Lcom/tantan/library/svga/SVGALoader$SvgaGlobalCall;)V",
        "targetViews",
        "Ljava/util/concurrent/ConcurrentHashMap;",
        "Lcom/tantan/library/svga/SVGAnimationView;",
        "",
        "getTargetViews$svga_lib_release",
        "()Ljava/util/concurrent/ConcurrentHashMap;",
        "clear",
        "",
        "releaseCache",
        "source",
        "",
        "removeView",
        "view",
        "with",
        "Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;",
        "context",
        "Landroid/content/Context;",
        "SVGARequestBuilder",
        "SvgaGlobalCall",
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
.field public static final INSTANCE:Lcom/tantan/library/svga/SVGALoader;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static inSampleSize:I

.field private static svgaGlobalCall:Lcom/tantan/library/svga/SVGALoader$SvgaGlobalCall;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private static final targetViews:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Lcom/tantan/library/svga/SVGAnimationView;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tantan/library/svga/SVGALoader;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tantan/library/svga/SVGALoader;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tantan/library/svga/SVGALoader;->INSTANCE:Lcom/tantan/library/svga/SVGALoader;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    sput v0, Lcom/tantan/library/svga/SVGALoader;->inSampleSize:I

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    sput-object v0, Lcom/tantan/library/svga/SVGALoader;->targetViews:Ljava/util/concurrent/ConcurrentHashMap;

    .line 17
    .line 18
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

.method public static final clear()V
    .locals 2
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    sget-object v0, Lcom/tantan/library/svga/data/cache/CacheProvider;->INSTANCE:Lcom/tantan/library/svga/data/cache/CacheProvider;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantan/library/svga/data/cache/CacheProvider;->getMemoryLruCache()Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/tantan/library/svga/data/cache/memory/LruCache;->clearMemory()V

    .line 10
    .line 11
    .line 12
    :cond_0
    sget-object v1, Lcom/tantan/library/svga/drawer/bitmap/BitmapPool;->Companion:Lcom/tantan/library/svga/drawer/bitmap/BitmapPool$Companion;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/tantan/library/svga/drawer/bitmap/BitmapPool$Companion;->get()Lcom/tantan/library/svga/drawer/bitmap/BitmapPool;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Lcom/tantan/library/svga/drawer/bitmap/BitmapPool;->clear()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/tantan/library/svga/data/cache/CacheProvider;->getActiveResource()Lcom/tantan/library/svga/data/cache/active/ActiveResource;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/tantan/library/svga/data/cache/active/ActiveResource;->clearUnusedResources()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static final releaseCache(Ljava/lang/String;)V
    .locals 2
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    sget-object v0, Lcom/tantan/library/svga/data/cache/CacheProvider;->INSTANCE:Lcom/tantan/library/svga/data/cache/CacheProvider;

    invoke-virtual {v0}, Lcom/tantan/library/svga/data/cache/CacheProvider;->getMemoryLruCache()Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v1, Lcom/tantan/library/svga/ResourceKey;->Companion:Lcom/tantan/library/svga/ResourceKey$Companion;

    invoke-virtual {v1, p0}, Lcom/tantan/library/svga/ResourceKey$Companion;->cacheKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/data/cache/memory/LruCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/tantan/library/svga/data/cache/Resource;

    :cond_0
    return-void
.end method

.method public static final releaseCache(Ljava/util/List;)V
    .locals 3
    .param p0    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    check-cast p0, Ljava/lang/Iterable;

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/String;

    .line 20
    .line 21
    sget-object v1, Lcom/tantan/library/svga/data/cache/CacheProvider;->INSTANCE:Lcom/tantan/library/svga/data/cache/CacheProvider;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/tantan/library/svga/data/cache/CacheProvider;->getMemoryLruCache()Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    sget-object v2, Lcom/tantan/library/svga/ResourceKey;->Companion:Lcom/tantan/library/svga/ResourceKey$Companion;

    .line 30
    .line 31
    invoke-virtual {v2, v0}, Lcom/tantan/library/svga/ResourceKey$Companion;->cacheKey(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v1, v0}, Lcom/tantan/library/svga/data/cache/memory/LruCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lcom/tantan/library/svga/data/cache/Resource;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    return-void
.end method

.method public static final with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final getInSampleSize()I
    .locals 0

    .line 1
    sget p0, Lcom/tantan/library/svga/SVGALoader;->inSampleSize:I

    .line 2
    .line 3
    return p0
.end method

.method public final getSvgaGlobalCall()Lcom/tantan/library/svga/SVGALoader$SvgaGlobalCall;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object p0, Lcom/tantan/library/svga/SVGALoader;->svgaGlobalCall:Lcom/tantan/library/svga/SVGALoader$SvgaGlobalCall;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getTargetViews$svga_lib_release()Ljava/util/concurrent/ConcurrentHashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Lcom/tantan/library/svga/SVGAnimationView;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/tantan/library/svga/SVGALoader;->targetViews:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public final removeView(Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/SVGAnimationView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/tantan/library/svga/SVGALoader;->targetViews:Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final setInSampleSize(I)V
    .locals 0

    .line 1
    sput p1, Lcom/tantan/library/svga/SVGALoader;->inSampleSize:I

    .line 2
    .line 3
    return-void
.end method

.method public final setSvgaGlobalCall(Lcom/tantan/library/svga/SVGALoader$SvgaGlobalCall;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/SVGALoader$SvgaGlobalCall;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sput-object p1, Lcom/tantan/library/svga/SVGALoader;->svgaGlobalCall:Lcom/tantan/library/svga/SVGALoader$SvgaGlobalCall;

    .line 2
    .line 3
    return-void
.end method
