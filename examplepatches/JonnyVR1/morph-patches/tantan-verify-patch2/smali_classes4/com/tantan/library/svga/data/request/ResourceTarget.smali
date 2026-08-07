.class public final Lcom/tantan/library/svga/data/request/ResourceTarget;
.super Lcom/tantan/library/svga/data/request/AbsTarget;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantan/library/svga/data/request/AbsTarget<",
        "Lcom/tantan/library/svga/data/cache/Resource<",
        "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
        ">;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00030\u00020\u0001B\u0011\u0012\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0002\u0010\u0006J\u0008\u0010\u0007\u001a\u00020\u0008H\u0014J\u0018\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000eH\u0014J\u001e\u0010\u000f\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u000c\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u00030\u0002H\u0014R\u0010\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0011"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/request/ResourceTarget;",
        "Lcom/tantan/library/svga/data/request/AbsTarget;",
        "Lcom/tantan/library/svga/data/cache/Resource;",
        "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
        "callback",
        "Lcom/tantan/library/svga/data/request/RequestCallback;",
        "(Lcom/tantan/library/svga/data/request/RequestCallback;)V",
        "executor",
        "Lcom/tantan/library/svga/utils/SVGAExecutors;",
        "onResourceLoadError",
        "",
        "key",
        "Lcom/tantan/library/svga/ResourceKey;",
        "e",
        "Lcom/tantan/library/svga/exception/SVGAException;",
        "setResource",
        "resource",
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


# instance fields
.field private final callback:Lcom/tantan/library/svga/data/request/RequestCallback;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 10
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1, v0}, Lcom/tantan/library/svga/data/request/ResourceTarget;-><init>(Lcom/tantan/library/svga/data/request/RequestCallback;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Lcom/tantan/library/svga/data/request/RequestCallback;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/data/request/RequestCallback;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 11
    invoke-direct {p0}, Lcom/tantan/library/svga/data/request/AbsTarget;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/tantan/library/svga/data/request/ResourceTarget;->callback:Lcom/tantan/library/svga/data/request/RequestCallback;

    return-void
.end method

.method public synthetic constructor <init>(Lcom/tantan/library/svga/data/request/RequestCallback;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    :cond_0
    invoke-direct {p0, p1}, Lcom/tantan/library/svga/data/request/ResourceTarget;-><init>(Lcom/tantan/library/svga/data/request/RequestCallback;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public executor()Lcom/tantan/library/svga/utils/SVGAExecutors;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/tantan/library/svga/utils/SVGAExecutors;->Companion:Lcom/tantan/library/svga/utils/SVGAExecutors$Companion;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantan/library/svga/utils/SVGAExecutors$Companion;->getIo$svga_lib_release()Lcom/tantan/library/svga/utils/SVGAExecutors;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public onResourceLoadError(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/exception/SVGAException;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantan/library/svga/data/request/ResourceTarget;->callback:Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, p1, p2}, Lcom/tantan/library/svga/data/request/RequestCallback;->onLoadFailed(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setResource(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V
    .locals 0
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
            "Lcom/tantan/library/svga/compose/SVGAVideoEntity;",
            ">;)V"
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
    iget-object p0, p0, Lcom/tantan/library/svga/data/request/ResourceTarget;->callback:Lcom/tantan/library/svga/data/request/RequestCallback;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, p1, p2}, Lcom/tantan/library/svga/data/request/RequestCallback;->onResourceReady(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public bridge synthetic setResource(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Object;)V
    .locals 0

    .line 15
    check-cast p2, Lcom/tantan/library/svga/data/cache/Resource;

    invoke-virtual {p0, p1, p2}, Lcom/tantan/library/svga/data/request/ResourceTarget;->setResource(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V

    return-void
.end method
