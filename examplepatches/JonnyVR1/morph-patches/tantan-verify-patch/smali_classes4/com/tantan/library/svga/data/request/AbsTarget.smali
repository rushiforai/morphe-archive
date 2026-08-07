.class public abstract Lcom/tantan/library/svga/data/request/AbsTarget;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008&\u0018\u0000*\u0004\u0008\u0000\u0010\u00012\u00020\u0002B\u0005\u00a2\u0006\u0002\u0010\u0003J\u0006\u0010\n\u001a\u00020\u000bJ\u0008\u0010\u000c\u001a\u00020\rH$J\u0016\u0010\u000e\u001a\u00020\u000b2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0012J\u001b\u0010\u0013\u001a\u00020\u000b2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0014\u001a\u00028\u0000\u00a2\u0006\u0002\u0010\u0015J\u0018\u0010\u0016\u001a\u00020\u000b2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0012H$J\u001d\u0010\u0017\u001a\u00020\u000b2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0014\u001a\u00028\u0000H$\u00a2\u0006\u0002\u0010\u0015R\u001c\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\"\u0004\u0008\u0008\u0010\t\u00a8\u0006\u0018"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/request/AbsTarget;",
        "R",
        "",
        "()V",
        "request",
        "Lcom/tantan/library/svga/data/request/ResourceRequest;",
        "getRequest",
        "()Lcom/tantan/library/svga/data/request/ResourceRequest;",
        "setRequest",
        "(Lcom/tantan/library/svga/data/request/ResourceRequest;)V",
        "begin",
        "",
        "executor",
        "Lcom/tantan/library/svga/utils/SVGAExecutors;",
        "onLoadFailed",
        "key",
        "Lcom/tantan/library/svga/ResourceKey;",
        "e",
        "Lcom/tantan/library/svga/exception/SVGAException;",
        "onLoadSuccess",
        "resource",
        "(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Object;)V",
        "onResourceLoadError",
        "setResource",
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
.field private request:Lcom/tantan/library/svga/data/request/ResourceRequest;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


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

.method public static a(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;Lcom/tantan/library/svga/data/request/AbsTarget;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    sget-object v0, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->Companion:Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;->get$svga_lib_release()Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/tantan/library/svga/ResourceKey;->getPath()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1, p1}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->onFailed(Ljava/lang/String;Lcom/tantan/library/svga/exception/SVGAException;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p2, p0, p1}, Lcom/tantan/library/svga/data/request/AbsTarget;->onResourceLoadError(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static b(Lcom/tantan/library/svga/data/request/AbsTarget;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantan/library/svga/data/request/AbsTarget;->request:Lcom/tantan/library/svga/data/request/ResourceRequest;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/tantan/library/svga/data/request/ResourceRequest;->begin()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static c(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/request/AbsTarget;Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->Companion:Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;->get$svga_lib_release()Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/tantan/library/svga/ResourceKey;->getPath()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->onSuccess(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p1, p0, p2}, Lcom/tantan/library/svga/data/request/AbsTarget;->setResource(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final begin()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/data/request/AbsTarget;->request:Lcom/tantan/library/svga/data/request/ResourceRequest;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/tantan/library/svga/data/request/ResourceRequest;->getKey()Lcom/tantan/library/svga/ResourceKey;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tantan/library/svga/ResourceKey;->get()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/tantan/library/svga/data/request/AbsTarget;->executor()Lcom/tantan/library/svga/utils/SVGAExecutors;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    new-instance v2, Lcom/tantan/library/svga/utils/ProxyRunnable;

    .line 22
    .line 23
    new-instance v3, Ll/g6;

    .line 24
    .line 25
    invoke-direct {v3, p0}, Ll/g6;-><init>(Lcom/tantan/library/svga/data/request/AbsTarget;)V

    .line 26
    .line 27
    .line 28
    invoke-direct {v2, v0, v3}, Lcom/tantan/library/svga/utils/ProxyRunnable;-><init>(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/utils/SVGAExecutors;->execute(Lcom/tantan/library/svga/utils/ProxyRunnable;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public abstract executor()Lcom/tantan/library/svga/utils/SVGAExecutors;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end method

.method public final getRequest()Lcom/tantan/library/svga/data/request/ResourceRequest;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/data/request/AbsTarget;->request:Lcom/tantan/library/svga/data/request/ResourceRequest;

    .line 2
    .line 3
    return-object p0
.end method

.method public final onLoadFailed(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;)V
    .locals 2
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
    sget-object v0, Lcom/tantan/library/svga/utils/SVGAExecutors;->Companion:Lcom/tantan/library/svga/utils/SVGAExecutors$Companion;

    .line 8
    .line 9
    new-instance v1, Ll/h6;

    .line 10
    .line 11
    invoke-direct {v1, p1, p2, p0}, Ll/h6;-><init>(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;Lcom/tantan/library/svga/data/request/AbsTarget;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/utils/SVGAExecutors$Companion;->postOnUiThread$svga_lib_release(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final onLoadSuccess(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Object;)V
    .locals 2
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/ResourceKey;",
            "TR;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/tantan/library/svga/utils/SVGAExecutors;->Companion:Lcom/tantan/library/svga/utils/SVGAExecutors$Companion;

    .line 5
    .line 6
    new-instance v1, Ll/f6;

    .line 7
    .line 8
    invoke-direct {v1, p1, p0, p2}, Ll/f6;-><init>(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/request/AbsTarget;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/utils/SVGAExecutors$Companion;->postOnUiThread$svga_lib_release(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public abstract onResourceLoadError(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;)V
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/exception/SVGAException;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public final setRequest(Lcom/tantan/library/svga/data/request/ResourceRequest;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/data/request/ResourceRequest;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/data/request/AbsTarget;->request:Lcom/tantan/library/svga/data/request/ResourceRequest;

    .line 2
    .line 3
    return-void
.end method

.method public abstract setResource(Lcom/tantan/library/svga/ResourceKey;Ljava/lang/Object;)V
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/ResourceKey;",
            "TR;)V"
        }
    .end annotation
.end method
