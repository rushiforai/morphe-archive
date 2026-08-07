.class public interface abstract Lcom/tantan/library/svga/tracker/CacheTrackerListener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\u0008\u0002\u0008f\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H&J\u0018\u0010\u0008\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H&J,\u0010\t\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0012\u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u000c\u0012\u0004\u0012\u00020\u000c0\u000bH&J\u0018\u0010\r\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H&\u00a8\u0006\u000e"
    }
    d2 = {
        "Lcom/tantan/library/svga/tracker/CacheTrackerListener;",
        "",
        "onCacheHit",
        "",
        "type",
        "Lcom/tantan/library/svga/tracker/CacheType;",
        "key",
        "Lcom/tantan/library/svga/data/cache/Key;",
        "onCacheMiss",
        "onCachePut",
        "size",
        "Lkotlin/Pair;",
        "",
        "onCacheRemoved",
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


# virtual methods
.method public abstract onCacheHit(Lcom/tantan/library/svga/tracker/CacheType;Lcom/tantan/library/svga/data/cache/Key;)V
    .param p1    # Lcom/tantan/library/svga/tracker/CacheType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Key;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract onCacheMiss(Lcom/tantan/library/svga/tracker/CacheType;Lcom/tantan/library/svga/data/cache/Key;)V
    .param p1    # Lcom/tantan/library/svga/tracker/CacheType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Key;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract onCachePut(Lcom/tantan/library/svga/tracker/CacheType;Lcom/tantan/library/svga/data/cache/Key;Lkotlin/Pair;)V
    .param p1    # Lcom/tantan/library/svga/tracker/CacheType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Key;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/Pair;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/tracker/CacheType;",
            "Lcom/tantan/library/svga/data/cache/Key;",
            "Lkotlin/Pair<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onCacheRemoved(Lcom/tantan/library/svga/tracker/CacheType;Lcom/tantan/library/svga/data/cache/Key;)V
    .param p1    # Lcom/tantan/library/svga/tracker/CacheType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Key;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method
