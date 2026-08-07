.class public final Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;
.super Lcom/tantan/library/svga/data/cache/memory/LruCache;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantan/library/svga/data/cache/memory/LruCache<",
        "Ljava/lang/String;",
        "Lcom/tantan/library/svga/data/cache/Resource<",
        "*>;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\u0018\u00002\u0012\u0012\u0004\u0012\u00020\u0002\u0012\u0008\u0012\u0006\u0012\u0002\u0008\u00030\u00030\u0001B\r\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u0006\u0010\u0007\u001a\u00020\u0005J\u0016\u0010\u0008\u001a\u00020\u00052\u000c\u0010\t\u001a\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u0003H\u0016J\u001c\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\u00022\n\u0010\t\u001a\u0006\u0012\u0002\u0008\u00030\u0003H\u0016J\u001c\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000c\u001a\u00020\u00022\n\u0010\t\u001a\u0006\u0012\u0002\u0008\u00030\u0003H\u0016\u00a8\u0006\u000f"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;",
        "Lcom/tantan/library/svga/data/cache/memory/LruCache;",
        "",
        "Lcom/tantan/library/svga/data/cache/Resource;",
        "size",
        "",
        "(J)V",
        "getCurrentMemory",
        "getSize",
        "item",
        "itemCacheable",
        "",
        "key",
        "onItemEvicted",
        "",
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
.method public constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tantan/library/svga/data/cache/memory/LruCache;-><init>(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final getCurrentMemory()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tantan/library/svga/data/cache/memory/LruCache;->getCurrentSize()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public getSize(Lcom/tantan/library/svga/data/cache/Resource;)J
    .locals 0
    .param p1    # Lcom/tantan/library/svga/data/cache/Resource;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/data/cache/Resource<",
            "*>;)J"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Lcom/tantan/library/svga/data/cache/Resource;->getSize()J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0

    .line 8
    :cond_0
    const-wide/16 p0, 0x0

    .line 9
    .line 10
    return-wide p0
.end method

.method public bridge synthetic getSize(Ljava/lang/Object;)J
    .locals 0

    .line 11
    check-cast p1, Lcom/tantan/library/svga/data/cache/Resource;

    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;->getSize(Lcom/tantan/library/svga/data/cache/Resource;)J

    move-result-wide p0

    return-wide p0
.end method

.method public bridge synthetic itemCacheable(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0

    .line 12
    check-cast p1, Ljava/lang/String;

    check-cast p2, Lcom/tantan/library/svga/data/cache/Resource;

    invoke-virtual {p0, p1, p2}, Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;->itemCacheable(Ljava/lang/String;Lcom/tantan/library/svga/data/cache/Resource;)Z

    move-result p0

    return p0
.end method

.method public itemCacheable(Ljava/lang/String;Lcom/tantan/library/svga/data/cache/Resource;)Z
    .locals 0
    .param p1    # Ljava/lang/String;
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
            "Ljava/lang/String;",
            "Lcom/tantan/library/svga/data/cache/Resource<",
            "*>;)Z"
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
    invoke-interface {p2}, Lcom/tantan/library/svga/data/cache/Resource;->cacheable()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public bridge synthetic onItemEvicted(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 11
    check-cast p1, Ljava/lang/String;

    check-cast p2, Lcom/tantan/library/svga/data/cache/Resource;

    invoke-virtual {p0, p1, p2}, Lcom/tantan/library/svga/data/cache/memory/ResourceLruCache;->onItemEvicted(Ljava/lang/String;Lcom/tantan/library/svga/data/cache/Resource;)V

    return-void
.end method

.method public onItemEvicted(Ljava/lang/String;Lcom/tantan/library/svga/data/cache/Resource;)V
    .locals 0
    .param p1    # Ljava/lang/String;
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
            "Ljava/lang/String;",
            "Lcom/tantan/library/svga/data/cache/Resource<",
            "*>;)V"
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
    invoke-interface {p2}, Lcom/tantan/library/svga/data/cache/Resource;->tryRecycle()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
