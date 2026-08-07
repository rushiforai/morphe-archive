.class public final Lcom/tantan/library/svga/utils/SVGAExecutors;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantan/library/svga/utils/SVGAExecutors$Companion;,
        Lcom/tantan/library/svga/utils/SVGAExecutors$DefaultThreadFactory;,
        Lcom/tantan/library/svga/utils/SVGAExecutors$Builder;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u0000 \r2\u00020\u0001:\u0003\u000c\r\u000eB\u000f\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u000e\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0008J\u0014\u0010\t\u001a\u00020\u00062\u000c\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\nR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000f"
    }
    d2 = {
        "Lcom/tantan/library/svga/utils/SVGAExecutors;",
        "",
        "delegate",
        "Ljava/util/concurrent/ExecutorService;",
        "(Ljava/util/concurrent/ExecutorService;)V",
        "execute",
        "",
        "command",
        "Lcom/tantan/library/svga/utils/ProxyRunnable;",
        "submit",
        "Ljava/util/concurrent/Callable;",
        "Ljava/lang/Void;",
        "Builder",
        "Companion",
        "DefaultThreadFactory",
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
.field public static final Companion:Lcom/tantan/library/svga/utils/SVGAExecutors$Companion;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final KEEP_ALIVE_TIME_MS:J

.field private static final MAXIMUM_THREAD_COUNT:I = 0x4

.field public static fastIo:Lcom/tantan/library/svga/utils/SVGAExecutors;

.field public static io:Lcom/tantan/library/svga/utils/SVGAExecutors;

.field private static final mainThreadHandler:Landroid/os/Handler;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field private final delegate:Ljava/util/concurrent/ExecutorService;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/tantan/library/svga/utils/SVGAExecutors$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/tantan/library/svga/utils/SVGAExecutors$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/tantan/library/svga/utils/SVGAExecutors;->Companion:Lcom/tantan/library/svga/utils/SVGAExecutors$Companion;

    .line 8
    .line 9
    const-wide/16 v0, 0x2710

    .line 10
    .line 11
    sput-wide v0, Lcom/tantan/library/svga/utils/SVGAExecutors;->KEEP_ALIVE_TIME_MS:J

    .line 12
    .line 13
    new-instance v0, Landroid/os/Handler;

    .line 14
    .line 15
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lcom/tantan/library/svga/utils/SVGAExecutors;->mainThreadHandler:Landroid/os/Handler;

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ExecutorService;)V
    .locals 0
    .param p1    # Ljava/util/concurrent/ExecutorService;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/tantan/library/svga/utils/SVGAExecutors;->delegate:Ljava/util/concurrent/ExecutorService;

    .line 8
    .line 9
    return-void
.end method

.method public static final synthetic access$getKEEP_ALIVE_TIME_MS$cp()J
    .locals 2

    .line 1
    sget-wide v0, Lcom/tantan/library/svga/utils/SVGAExecutors;->KEEP_ALIVE_TIME_MS:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static final synthetic access$getMainThreadHandler$cp()Landroid/os/Handler;
    .locals 1

    .line 1
    sget-object v0, Lcom/tantan/library/svga/utils/SVGAExecutors;->mainThreadHandler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public final execute(Lcom/tantan/library/svga/utils/ProxyRunnable;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/utils/ProxyRunnable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantan/library/svga/utils/SVGAExecutors;->delegate:Ljava/util/concurrent/ExecutorService;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final submit(Ljava/util/concurrent/Callable;)V
    .locals 0
    .param p1    # Ljava/util/concurrent/Callable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantan/library/svga/utils/SVGAExecutors;->delegate:Ljava/util/concurrent/ExecutorService;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    .line 7
    .line 8
    .line 9
    return-void
.end method
