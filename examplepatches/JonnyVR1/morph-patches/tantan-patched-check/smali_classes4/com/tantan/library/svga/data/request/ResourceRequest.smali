.class public final Lcom/tantan/library/svga/data/request/ResourceRequest;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/data/request/RequestCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantan/library/svga/data/request/ResourceRequest$Status;,
        Lcom/tantan/library/svga/data/request/ResourceRequest$WhenMappings;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001:\u0001\u0015B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0012\u0010\u0004\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00070\u00060\u0005\u00a2\u0006\u0002\u0010\u0008J\u0006\u0010\u000e\u001a\u00020\u000fJ\u001a\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u0012H\u0016J\u0008\u0010\u0013\u001a\u00020\u000fH\u0002J\u001c\u0010\u0014\u001a\u00020\u000f2\u0006\u0010\u0002\u001a\u00020\u00032\n\u0010\u000b\u001a\u0006\u0012\u0002\u0008\u00030\u0006H\u0016R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u0016\u0010\u000b\u001a\n\u0012\u0004\u0012\u00020\u0007\u0018\u00010\u0006X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000c\u001a\u0004\u0018\u00010\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0004\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00070\u00060\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/request/ResourceRequest;",
        "Lcom/tantan/library/svga/data/request/RequestCallback;",
        "key",
        "Lcom/tantan/library/svga/ResourceKey;",
        "target",
        "Lcom/tantan/library/svga/data/request/AbsTarget;",
        "Lcom/tantan/library/svga/data/cache/Resource;",
        "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
        "(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/request/AbsTarget;)V",
        "getKey",
        "()Lcom/tantan/library/svga/ResourceKey;",
        "resource",
        "status",
        "Lcom/tantan/library/svga/data/request/ResourceRequest$Status;",
        "begin",
        "",
        "onLoadFailed",
        "e",
        "Lcom/tantan/library/svga/exception/SVGAException;",
        "onReady",
        "onResourceReady",
        "Status",
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
.field private final key:Lcom/tantan/library/svga/ResourceKey;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private resource:Lcom/tantan/library/svga/data/cache/Resource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantan/library/svga/data/cache/Resource<",
            "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private status:Lcom/tantan/library/svga/data/request/ResourceRequest$Status;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final target:Lcom/tantan/library/svga/data/request/AbsTarget;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantan/library/svga/data/request/AbsTarget<",
            "Lcom/tantan/library/svga/data/cache/Resource<",
            "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
            ">;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/request/AbsTarget;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/request/AbsTarget;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/ResourceKey;",
            "Lcom/tantan/library/svga/data/request/AbsTarget<",
            "Lcom/tantan/library/svga/data/cache/Resource<",
            "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
            ">;>;)V"
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
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/tantan/library/svga/data/request/ResourceRequest;->key:Lcom/tantan/library/svga/ResourceKey;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/tantan/library/svga/data/request/ResourceRequest;->target:Lcom/tantan/library/svga/data/request/AbsTarget;

    .line 13
    .line 14
    return-void
.end method

.method private final declared-synchronized onReady()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantan/library/svga/data/request/ResourceRequest;->status:Lcom/tantan/library/svga/data/request/ResourceRequest$Status;

    .line 3
    .line 4
    sget-object v1, Lcom/tantan/library/svga/data/request/ResourceRequest$Status;->READY:Lcom/tantan/library/svga/data/request/ResourceRequest$Status;

    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    sget-object v0, Lcom/tantan/library/svga/data/request/ResourceRequest$Status;->RUNNING:Lcom/tantan/library/svga/data/request/ResourceRequest$Status;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/tantan/library/svga/data/request/ResourceRequest;->status:Lcom/tantan/library/svga/data/request/ResourceRequest$Status;

    .line 11
    .line 12
    sget-object v0, Lcom/tantan/library/svga/data/load/ActiveLoader;->Companion:Lcom/tantan/library/svga/data/load/ActiveLoader$Companion;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/tantan/library/svga/data/request/ResourceRequest;->key:Lcom/tantan/library/svga/ResourceKey;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/data/load/ActiveLoader$Companion;->builder(Lcom/tantan/library/svga/ResourceKey;)Lcom/tantan/library/svga/data/load/ActiveLoader;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1, p0}, Lcom/tantan/library/svga/data/load/ActiveLoader;->callback$svga_lib_release(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/data/load/ActiveLoader;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v2, p0, Lcom/tantan/library/svga/data/request/ResourceRequest;->key:Lcom/tantan/library/svga/ResourceKey;

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/data/load/DataLoader;->loadData(Lcom/tantan/library/svga/ResourceKey;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/tantan/library/svga/data/cache/CachedResource;

    .line 31
    .line 32
    if-nez v1, :cond_0

    .line 33
    .line 34
    iget-object v1, p0, Lcom/tantan/library/svga/data/request/ResourceRequest;->key:Lcom/tantan/library/svga/ResourceKey;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/tantan/library/svga/ResourceKey;->transToErrorKey()Lcom/tantan/library/svga/ResourceKey;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    iget-object v2, p0, Lcom/tantan/library/svga/data/request/ResourceRequest;->key:Lcom/tantan/library/svga/ResourceKey;

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/data/load/ActiveLoader$Companion;->builder(Lcom/tantan/library/svga/ResourceKey;)Lcom/tantan/library/svga/data/load/ActiveLoader;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/data/load/ActiveLoader;->callback$svga_lib_release(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/data/load/ActiveLoader;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/data/load/DataLoader;->loadData(Lcom/tantan/library/svga/ResourceKey;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lcom/tantan/library/svga/data/cache/CachedResource;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :catchall_0
    move-exception v0

    .line 60
    goto :goto_1

    .line 61
    :cond_0
    :goto_0
    monitor-exit p0

    .line 62
    return-void

    .line 63
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    throw v0
.end method


# virtual methods
.method public final declared-synchronized begin()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tantan/library/svga/data/request/ResourceRequest;->status:Lcom/tantan/library/svga/data/request/ResourceRequest$Status;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/4 v0, -0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget-object v1, Lcom/tantan/library/svga/data/request/ResourceRequest$WhenMappings;->$EnumSwitchMapping$0:[I

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    aget v0, v1, v0

    .line 15
    .line 16
    :goto_0
    const/4 v1, 0x1

    .line 17
    if-eq v0, v1, :cond_2

    .line 18
    .line 19
    const/4 v1, 0x2

    .line 20
    if-eq v0, v1, :cond_1

    .line 21
    .line 22
    sget-object v0, Lcom/tantan/library/svga/data/request/ResourceRequest$Status;->READY:Lcom/tantan/library/svga/data/request/ResourceRequest$Status;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/tantan/library/svga/data/request/ResourceRequest;->status:Lcom/tantan/library/svga/data/request/ResourceRequest$Status;

    .line 25
    .line 26
    invoke-direct {p0}, Lcom/tantan/library/svga/data/request/ResourceRequest;->onReady()V

    .line 27
    .line 28
    .line 29
    goto :goto_1

    .line 30
    :catchall_0
    move-exception v0

    .line 31
    goto :goto_2

    .line 32
    :cond_1
    iget-object v0, p0, Lcom/tantan/library/svga/data/request/ResourceRequest;->key:Lcom/tantan/library/svga/ResourceKey;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/tantan/library/svga/data/request/ResourceRequest;->resource:Lcom/tantan/library/svga/data/cache/Resource;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0, v1}, Lcom/tantan/library/svga/data/request/ResourceRequest;->onResourceReady(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    .line 41
    .line 42
    :goto_1
    monitor-exit p0

    .line 43
    return-void

    .line 44
    :cond_2
    monitor-exit p0

    .line 45
    return-void

    .line 46
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 47
    throw v0
.end method

.method public final getKey()Lcom/tantan/library/svga/ResourceKey;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/data/request/ResourceRequest;->key:Lcom/tantan/library/svga/ResourceKey;

    .line 2
    .line 3
    return-object p0
.end method

.method public onLoadFailed(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;)V
    .locals 1
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/exception/SVGAException;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/tantan/library/svga/data/request/ResourceRequest$Status;->FAILED:Lcom/tantan/library/svga/data/request/ResourceRequest$Status;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tantan/library/svga/data/request/ResourceRequest;->status:Lcom/tantan/library/svga/data/request/ResourceRequest$Status;

    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/tantan/library/svga/data/request/ResourceRequest;->target:Lcom/tantan/library/svga/data/request/AbsTarget;

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Lcom/tantan/library/svga/data/request/AbsTarget;->onLoadFailed(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public onResourceReady(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V
    .locals 3
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
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
            "Lcom/tantan/library/svga/ResourceKey;",
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
    invoke-interface {p2}, Lcom/tantan/library/svga/data/cache/Resource;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    instance-of v1, v0, Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move-object v0, v2

    .line 18
    :goto_0
    if-eqz v0, :cond_1

    .line 19
    .line 20
    sget-object v0, Lcom/tantan/library/svga/data/request/ResourceRequest$Status;->COMPLETE:Lcom/tantan/library/svga/data/request/ResourceRequest$Status;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/tantan/library/svga/data/request/ResourceRequest;->status:Lcom/tantan/library/svga/data/request/ResourceRequest$Status;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/tantan/library/svga/data/request/ResourceRequest;->target:Lcom/tantan/library/svga/data/request/AbsTarget;

    .line 25
    .line 26
    invoke-virtual {v0, p1, p2}, Lcom/tantan/library/svga/data/request/AbsTarget;->onLoadSuccess(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    sget-object p2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    move-object p2, v2

    .line 33
    :goto_1
    if-nez p2, :cond_2

    .line 34
    .line 35
    new-instance p2, Lcom/tantan/library/svga/exception/SVGAException;

    .line 36
    .line 37
    const-string v0, "\u6570\u636e\u52a0\u8f7d\u9519\u8bef\uff0c\u7c7b\u578b\u4e0d\u5339\u914d\uff01"

    .line 38
    .line 39
    const/4 v1, 0x2

    .line 40
    invoke-direct {p2, v0, v2, v1, v2}, Lcom/tantan/library/svga/exception/SVGAException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p1, p2}, Lcom/tantan/library/svga/data/request/ResourceRequest;->onLoadFailed(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;)V

    .line 44
    .line 45
    .line 46
    :cond_2
    return-void
.end method
