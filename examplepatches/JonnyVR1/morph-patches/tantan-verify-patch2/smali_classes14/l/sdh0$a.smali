.class public Ll/sdh0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/tracker/CacheTrackerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sdh0;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onCacheHit(Lcom/tantan/library/svga/tracker/CacheType;Lcom/tantan/library/svga/data/cache/Key;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/tracker/CacheType;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Key;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public onCacheMiss(Lcom/tantan/library/svga/tracker/CacheType;Lcom/tantan/library/svga/data/cache/Key;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/tracker/CacheType;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Key;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public onCachePut(Lcom/tantan/library/svga/tracker/CacheType;Lcom/tantan/library/svga/data/cache/Key;Lkotlin/Pair;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/tracker/CacheType;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Key;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lkotlin/Pair;
        .annotation build Landroidx/annotation/NonNull;
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

    .line 1
    return-void
.end method

.method public onCacheRemoved(Lcom/tantan/library/svga/tracker/CacheType;Lcom/tantan/library/svga/data/cache/Key;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/tracker/CacheType;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Key;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method
