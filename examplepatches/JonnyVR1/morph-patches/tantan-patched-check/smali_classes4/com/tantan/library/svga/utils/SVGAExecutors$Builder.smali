.class public final Lcom/tantan/library/svga/utils/SVGAExecutors$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/utils/SVGAExecutors;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u0007\u0008\u0000\u00a2\u0006\u0002\u0010\u0002J\u0006\u0010\u0008\u001a\u00020\tJ\u0010\u0010\n\u001a\u00020\u00002\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007J\u000e\u0010\u000b\u001a\u00020\u00002\u0006\u0010\u000c\u001a\u00020\u0004R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\r"
    }
    d2 = {
        "Lcom/tantan/library/svga/utils/SVGAExecutors$Builder;",
        "",
        "()V",
        "corePoolSize",
        "",
        "maximumPoolSize",
        "name",
        "",
        "build",
        "Lcom/tantan/library/svga/utils/SVGAExecutors;",
        "setName",
        "setThreadCount",
        "threadCount",
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
.field private corePoolSize:I

.field private maximumPoolSize:I

.field private name:Ljava/lang/String;
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

.method public static a(Ljava/lang/Runnable;Ljava/util/concurrent/ThreadPoolExecutor;)V
    .locals 4

    .line 1
    instance-of p1, p0, Lcom/tantan/library/svga/utils/ProxyRunnable;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget-object p1, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->Companion:Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor$Companion;->get$svga_lib_release()Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    check-cast p0, Lcom/tantan/library/svga/utils/ProxyRunnable;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/tantan/library/svga/utils/ProxyRunnable;->getKey()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Lcom/tantan/library/svga/exception/SVGAException;

    .line 20
    .line 21
    new-instance v2, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v3, "RejectedExecutionException:"

    .line 24
    .line 25
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/tantan/library/svga/utils/ProxyRunnable;->getKey()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const/4 v2, 0x2

    .line 40
    const/4 v3, 0x0

    .line 41
    invoke-direct {v1, p0, v3, v2, v3}, Lcom/tantan/library/svga/exception/SVGAException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0, v1}, Lcom/tantan/library/svga/exception/GlobalExceptionMonitor;->onFailed(Ljava/lang/String;Lcom/tantan/library/svga/exception/SVGAException;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method


# virtual methods
.method public final build()Lcom/tantan/library/svga/utils/SVGAExecutors;
    .locals 10
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/tantan/library/svga/utils/SVGAExecutors;

    .line 2
    .line 3
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 4
    .line 5
    iget v2, p0, Lcom/tantan/library/svga/utils/SVGAExecutors$Builder;->corePoolSize:I

    .line 6
    .line 7
    iget v3, p0, Lcom/tantan/library/svga/utils/SVGAExecutors$Builder;->maximumPoolSize:I

    .line 8
    .line 9
    invoke-static {}, Lcom/tantan/library/svga/utils/SVGAExecutors;->access$getKEEP_ALIVE_TIME_MS$cp()J

    .line 10
    .line 11
    .line 12
    move-result-wide v4

    .line 13
    new-instance v7, Ljava/util/concurrent/LinkedBlockingDeque;

    .line 14
    .line 15
    const/16 v6, 0xc8

    .line 16
    .line 17
    invoke-direct {v7, v6}, Ljava/util/concurrent/LinkedBlockingDeque;-><init>(I)V

    .line 18
    .line 19
    .line 20
    new-instance v8, Lcom/tantan/library/svga/utils/SVGAExecutors$DefaultThreadFactory;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/tantan/library/svga/utils/SVGAExecutors$Builder;->name:Ljava/lang/String;

    .line 23
    .line 24
    invoke-direct {v8, p0}, Lcom/tantan/library/svga/utils/SVGAExecutors$DefaultThreadFactory;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    new-instance v9, Ll/ltd0;

    .line 28
    .line 29
    invoke-direct {v9}, Ll/ltd0;-><init>()V

    .line 30
    .line 31
    .line 32
    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 33
    .line 34
    invoke-direct/range {v1 .. v9}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {v0, v1}, Lcom/tantan/library/svga/utils/SVGAExecutors;-><init>(Ljava/util/concurrent/ExecutorService;)V

    .line 38
    .line 39
    .line 40
    return-object v0
.end method

.method public final setName(Ljava/lang/String;)Lcom/tantan/library/svga/utils/SVGAExecutors$Builder;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/utils/SVGAExecutors$Builder;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final setThreadCount(I)Lcom/tantan/library/svga/utils/SVGAExecutors$Builder;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput p1, p0, Lcom/tantan/library/svga/utils/SVGAExecutors$Builder;->corePoolSize:I

    .line 2
    .line 3
    iput p1, p0, Lcom/tantan/library/svga/utils/SVGAExecutors$Builder;->maximumPoolSize:I

    .line 4
    .line 5
    return-object p0
.end method
