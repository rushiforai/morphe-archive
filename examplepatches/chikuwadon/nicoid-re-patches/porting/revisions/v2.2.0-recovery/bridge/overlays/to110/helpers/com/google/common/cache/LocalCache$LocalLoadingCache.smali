.class final Lcom/google/common/cache/LocalCache$LocalLoadingCache;
.super Lcom/google/common/cache/LocalCache$LocalManualCache;
.source "LocalCache.java"

# interfaces
.implements Lcom/google/common/cache/LoadingCache;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/cache/LocalCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "LocalLoadingCache"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/cache/LocalCache$LocalManualCache<",
        "TK;TV;>;",
        "Lcom/google/common/cache/LoadingCache<",
        "TK;TV;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method constructor <init>(Lcom/google/common/cache/CacheBuilder;Lcom/google/common/cache/CacheLoader;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "builder",
            "loader"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/cache/CacheBuilder<",
            "-TK;-TV;>;",
            "Lcom/google/common/cache/CacheLoader<",
            "-TK;TV;>;)V"
        }
    .end annotation

    .line 4762
    new-instance v0, Lcom/google/common/cache/LocalCache;

    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/google/common/cache/CacheLoader;

    invoke-direct {v0, p1, p2}, Lcom/google/common/cache/LocalCache;-><init>(Lcom/google/common/cache/CacheBuilder;Lcom/google/common/cache/CacheLoader;)V

    const/4 p1, 0x0

    invoke-direct {p0, v0, p1}, Lcom/google/common/cache/LocalCache$LocalManualCache;-><init>(Lcom/google/common/cache/LocalCache;Lcom/google/common/cache/LocalCache$1;)V

    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "in"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/InvalidObjectException;
        }
    .end annotation

    .line 4807
    new-instance p0, Ljava/io/InvalidObjectException;

    const-string p1, "Use LoadingSerializationProxy"

    invoke-direct {p0, p1}, Ljava/io/InvalidObjectException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .line 4794
    invoke-virtual {p0, p1}, Lcom/google/common/cache/LocalCache$LocalLoadingCache;->getUnchecked(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .line 4769
    iget-object p0, p0, Lcom/google/common/cache/LocalCache$LocalLoadingCache;->localCache:Lcom/google/common/cache/LocalCache;

    invoke-virtual {p0, p1}, Lcom/google/common/cache/LocalCache;->getOrLoad(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public getAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableMap;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "keys"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+TK;>;)",
            "Lcom/google/common/collect/ImmutableMap<",
            "TK;TV;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .line 4784
    iget-object p0, p0, Lcom/google/common/cache/LocalCache$LocalLoadingCache;->localCache:Lcom/google/common/cache/LocalCache;

    invoke-virtual {p0, p1}, Lcom/google/common/cache/LocalCache;->getAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableMap;

    move-result-object p0

    return-object p0
.end method

.method public getUnchecked(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .line 4776
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/google/common/cache/LocalCache$LocalLoadingCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 4778
    new-instance p1, Lcom/google/common/util/concurrent/UncheckedExecutionException;

    invoke-virtual {p0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    invoke-direct {p1, p0}, Lcom/google/common/util/concurrent/UncheckedExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method

.method public refresh(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    .line 4789
    iget-object p0, p0, Lcom/google/common/cache/LocalCache$LocalLoadingCache;->localCache:Lcom/google/common/cache/LocalCache;

    invoke-virtual {p0, p1}, Lcom/google/common/cache/LocalCache;->refresh(Ljava/lang/Object;)V

    return-void
.end method

.method writeReplace()Ljava/lang/Object;
    .registers 2

    .line 4803
    new-instance v0, Lcom/google/common/cache/LocalCache$LoadingSerializationProxy;

    iget-object p0, p0, Lcom/google/common/cache/LocalCache$LocalLoadingCache;->localCache:Lcom/google/common/cache/LocalCache;

    invoke-direct {v0, p0}, Lcom/google/common/cache/LocalCache$LoadingSerializationProxy;-><init>(Lcom/google/common/cache/LocalCache;)V

    return-object v0
.end method
