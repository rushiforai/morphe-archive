.class public final Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mxl;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J+\u0010\u000b\u001a\u00020\n2\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0008\u0010\t\u001a\u0004\u0018\u00010\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0019\u0010\u000f\u001a\u00020\u00062\u0008\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u0010R \u0010\u0013\u001a\u000e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u00040\u00118\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000f\u0010\u0012R\u001c\u0010\u0017\u001a\n \u0015*\u0004\u0018\u00010\u00140\u00148\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000b\u0010\u0016R#\u0010\u001d\u001a\n \u0015*\u0004\u0018\u00010\u00180\u00188BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0019\u0010\u001a\u001a\u0004\u0008\u001b\u0010\u001c\u00a8\u0006\u001e"
    }
    d2 = {
        "Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;",
        "Ll/mxl;",
        "<init>",
        "()V",
        "Ll/yjw;",
        "task",
        "",
        "autoStart",
        "Ll/mxl$a;",
        "listener",
        "",
        "b",
        "(Ll/yjw;ZLl/mxl$a;)V",
        "",
        "taskId",
        "a",
        "(Ljava/lang/String;)Z",
        "Ljava/util/concurrent/ConcurrentHashMap;",
        "Ljava/util/concurrent/ConcurrentHashMap;",
        "runningTasks",
        "Ljava/util/concurrent/ExecutorService;",
        "kotlin.jvm.PlatformType",
        "Ljava/util/concurrent/ExecutorService;",
        "executor",
        "Ll/ivl;",
        "c",
        "Lkotlin/Lazy;",
        "e",
        "()Ll/ivl;",
        "okHttpClient",
        "MKCore_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field private final a:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/yjw;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Ljava/util/concurrent/ExecutorService;

.field private final c:Lkotlin/Lazy;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 10
    .line 11
    const/4 v0, 0x3

    .line 12
    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;->b:Ljava/util/concurrent/ExecutorService;

    .line 17
    .line 18
    sget-object v0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$okHttpClient$2;->INSTANCE:Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$okHttpClient$2;

    .line 19
    .line 20
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;->c:Lkotlin/Lazy;

    .line 25
    .line 26
    return-void
.end method

.method public static final synthetic c(Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;)Ll/ivl;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;->e()Ll/ivl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic d(Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method private final e()Ll/ivl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;->c:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/ivl;

    .line 8
    .line 9
    return-object p0
.end method


# virtual methods
.method public a(Ljava/lang/String;)Z
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;->a:Ljava/util/concurrent/ConcurrentHashMap;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public b(Ll/yjw;ZLl/mxl$a;)V
    .locals 7
    .param p1    # Ll/yjw;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Ll/mxl$a;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/yjw;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v4

    .line 7
    if-eqz v4, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/yjw;->b()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v5

    .line 13
    if-eqz v5, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/yjw;->a()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v6

    .line 19
    if-eqz v6, :cond_0

    .line 20
    .line 21
    iget-object p2, p0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;->b:Ljava/util/concurrent/ExecutorService;

    .line 22
    .line 23
    new-instance v0, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;

    .line 24
    .line 25
    move-object v1, p0

    .line 26
    move-object v3, p1

    .line 27
    move-object v2, p3

    .line 28
    invoke-direct/range {v0 .. v6}, Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl$a;-><init>(Lcom/hellogroup/mk/core/impl/DefaultMKDownLoaderImpl;Ll/mxl$a;Ll/yjw;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method
