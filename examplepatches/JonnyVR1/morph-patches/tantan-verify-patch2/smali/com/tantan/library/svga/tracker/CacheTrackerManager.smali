.class public final Lcom/tantan/library/svga/tracker/CacheTrackerManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\u0008\u0005\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0016\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nJ\u0016\u0010\u000b\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nJ0\u0010\u000c\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\n2\u0018\u0010\r\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0010\u0012\u0004\u0012\u00020\u00100\u000f0\u000eJ\u0016\u0010\u0011\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nJ\u000e\u0010\u0012\u001a\u00020\u00062\u0006\u0010\u0013\u001a\u00020\u0004J\u0006\u0010\u0014\u001a\u00020\u0006R\u0010\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0015"
    }
    d2 = {
        "Lcom/tantan/library/svga/tracker/CacheTrackerManager;",
        "",
        "()V",
        "trackerListener",
        "Lcom/tantan/library/svga/tracker/CacheTrackerListener;",
        "onCacheHit",
        "",
        "type",
        "Lcom/tantan/library/svga/tracker/CacheType;",
        "key",
        "Lcom/tantan/library/svga/data/cache/Key;",
        "onCacheMiss",
        "onCachePut",
        "calSizeAction",
        "Lkotlin/Function0;",
        "Lkotlin/Pair;",
        "",
        "onCacheRemoved",
        "register",
        "listener",
        "removeAll",
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
.field public static final INSTANCE:Lcom/tantan/library/svga/tracker/CacheTrackerManager;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static trackerListener:Lcom/tantan/library/svga/tracker/CacheTrackerListener;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/tantan/library/svga/tracker/CacheTrackerManager;

    invoke-direct {v0}, Lcom/tantan/library/svga/tracker/CacheTrackerManager;-><init>()V

    sput-object v0, Lcom/tantan/library/svga/tracker/CacheTrackerManager;->INSTANCE:Lcom/tantan/library/svga/tracker/CacheTrackerManager;

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
.method public final onCacheHit(Lcom/tantan/library/svga/tracker/CacheType;Lcom/tantan/library/svga/data/cache/Key;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/tracker/CacheType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Key;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    return-void

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget-object p0, Lcom/tantan/library/svga/tracker/CacheTrackerManager;->trackerListener:Lcom/tantan/library/svga/tracker/CacheTrackerListener;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, p1, p2}, Lcom/tantan/library/svga/tracker/CacheTrackerListener;->onCacheHit(Lcom/tantan/library/svga/tracker/CacheType;Lcom/tantan/library/svga/data/cache/Key;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final onCacheMiss(Lcom/tantan/library/svga/tracker/CacheType;Lcom/tantan/library/svga/data/cache/Key;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/tracker/CacheType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Key;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    return-void

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget-object p0, Lcom/tantan/library/svga/tracker/CacheTrackerManager;->trackerListener:Lcom/tantan/library/svga/tracker/CacheTrackerListener;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, p1, p2}, Lcom/tantan/library/svga/tracker/CacheTrackerListener;->onCacheMiss(Lcom/tantan/library/svga/tracker/CacheType;Lcom/tantan/library/svga/data/cache/Key;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final onCachePut(Lcom/tantan/library/svga/tracker/CacheType;Lcom/tantan/library/svga/data/cache/Key;Lkotlin/jvm/functions/Function0;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/tracker/CacheType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Key;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/tracker/CacheType;",
            "Lcom/tantan/library/svga/data/cache/Key;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Pair<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;>;)V"
        }
    .end annotation

    return-void

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    sget-object p0, Lcom/tantan/library/svga/tracker/CacheTrackerManager;->trackerListener:Lcom/tantan/library/svga/tracker/CacheTrackerListener;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-interface {p3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    check-cast p3, Lkotlin/Pair;

    .line 19
    .line 20
    invoke-interface {p0, p1, p2, p3}, Lcom/tantan/library/svga/tracker/CacheTrackerListener;->onCachePut(Lcom/tantan/library/svga/tracker/CacheType;Lcom/tantan/library/svga/data/cache/Key;Lkotlin/Pair;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final onCacheRemoved(Lcom/tantan/library/svga/tracker/CacheType;Lcom/tantan/library/svga/data/cache/Key;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/tracker/CacheType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Key;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    return-void

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget-object p0, Lcom/tantan/library/svga/tracker/CacheTrackerManager;->trackerListener:Lcom/tantan/library/svga/tracker/CacheTrackerListener;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, p1, p2}, Lcom/tantan/library/svga/tracker/CacheTrackerListener;->onCacheRemoved(Lcom/tantan/library/svga/tracker/CacheType;Lcom/tantan/library/svga/data/cache/Key;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final register(Lcom/tantan/library/svga/tracker/CacheTrackerListener;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/tracker/CacheTrackerListener;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    return-void

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sput-object p1, Lcom/tantan/library/svga/tracker/CacheTrackerManager;->trackerListener:Lcom/tantan/library/svga/tracker/CacheTrackerListener;

    .line 5
    .line 6
    return-void
.end method

.method public final removeAll()V
    .locals 0

    return-void

    .line 1
    const/4 p0, 0x0

    .line 2
    sput-object p0, Lcom/tantan/library/svga/tracker/CacheTrackerManager;->trackerListener:Lcom/tantan/library/svga/tracker/CacheTrackerListener;

    .line 3
    .line 4
    return-void
.end method
