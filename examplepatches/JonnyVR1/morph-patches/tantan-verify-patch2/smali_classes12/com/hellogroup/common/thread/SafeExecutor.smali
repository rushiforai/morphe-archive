.class public final Lcom/hellogroup/common/thread/SafeExecutor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/ScheduledExecutorService;
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hellogroup/common/thread/SafeExecutor$b;,
        Lcom/hellogroup/common/thread/SafeExecutor$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000^\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010!\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u001f\n\u0002\u0018\u0002\n\u0002\u0010\u001e\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0013\u0008\u0000\u0018\u0000 92\u00020\u0001:\u00025:B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\u0019\u0010\u0008\u001a\u00020\u00072\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0005H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0015\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u000cH\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ(\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0010\u001a\u00020\u000f2\u000e\u0010\u0013\u001a\n \u0012*\u0004\u0018\u00010\u00110\u0011H\u0096\u0001\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u00e4\u0001\u0010\u001e\u001a^\u0012(\u0012&\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000 \u0012*\u0012\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000\u0018\u00010\u001c0\u001c \u0012*.\u0012(\u0012&\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000 \u0012*\u0012\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000\u0018\u00010\u001c0\u001c\u0018\u00010\u001d0\u000c\"\u0010\u0008\u0000\u0010\u0018*\n \u0012*\u0004\u0018\u00010\u00170\u00172d\u0010\u0010\u001a`\u0012*\u0008\u0001\u0012&\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000 \u0012*\u0012\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000\u0018\u00010\u001a0\u001a \u0012*.\u0012(\u0012&\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000 \u0012*\u0012\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000\u0018\u00010\u001a0\u001a\u0018\u00010\u001b0\u0019H\u0096\u0001\u00a2\u0006\u0004\u0008\u001e\u0010\u001fJ\u00fc\u0001\u0010\u001e\u001a^\u0012(\u0012&\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000 \u0012*\u0012\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000\u0018\u00010\u001c0\u001c \u0012*.\u0012(\u0012&\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000 \u0012*\u0012\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000\u0018\u00010\u001c0\u001c\u0018\u00010\u001d0\u000c\"\u0010\u0008\u0000\u0010\u0018*\n \u0012*\u0004\u0018\u00010\u00170\u00172d\u0010\u0010\u001a`\u0012*\u0008\u0001\u0012&\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000 \u0012*\u0012\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000\u0018\u00010\u001a0\u001a \u0012*.\u0012(\u0012&\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000 \u0012*\u0012\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000\u0018\u00010\u001a0\u001a\u0018\u00010\u001b0\u00192\u0006\u0010\u0013\u001a\u00020\u000f2\u000e\u0010 \u001a\n \u0012*\u0004\u0018\u00010\u00110\u0011H\u0096\u0001\u00a2\u0006\u0004\u0008\u001e\u0010!J\u0090\u0001\u0010\"\u001a\n \u0012*\u0004\u0018\u00018\u00008\u0000\"\u0010\u0008\u0000\u0010\u0018*\n \u0012*\u0004\u0018\u00010\u00170\u00172d\u0010\u0010\u001a`\u0012*\u0008\u0001\u0012&\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000 \u0012*\u0012\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000\u0018\u00010\u001a0\u001a \u0012*.\u0012(\u0012&\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000 \u0012*\u0012\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000\u0018\u00010\u001a0\u001a\u0018\u00010\u001b0\u0019H\u0096\u0001\u00a2\u0006\u0004\u0008\"\u0010#J\u00a8\u0001\u0010\"\u001a\n \u0012*\u0004\u0018\u00018\u00008\u0000\"\u0010\u0008\u0000\u0010\u0018*\n \u0012*\u0004\u0018\u00010\u00170\u00172d\u0010\u0010\u001a`\u0012*\u0008\u0001\u0012&\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000 \u0012*\u0012\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000\u0018\u00010\u001a0\u001a \u0012*.\u0012(\u0012&\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000 \u0012*\u0012\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000\u0018\u00010\u001a0\u001a\u0018\u00010\u001b0\u00192\u0006\u0010\u0013\u001a\u00020\u000f2\u000e\u0010 \u001a\n \u0012*\u0004\u0018\u00010\u00110\u0011H\u0096\u0001\u00a2\u0006\u0004\u0008\"\u0010$J\u0010\u0010%\u001a\u00020\u0014H\u0096\u0001\u00a2\u0006\u0004\u0008%\u0010&J\u0010\u0010\'\u001a\u00020\u0014H\u0096\u0001\u00a2\u0006\u0004\u0008\'\u0010&JH\u0010)\u001a\u0012\u0012\u0002\u0008\u0003 \u0012*\u0008\u0012\u0002\u0008\u0003\u0018\u00010(0(2\u000e\u0010\u0010\u001a\n \u0012*\u0004\u0018\u00010\u00050\u00052\u0006\u0010\u0013\u001a\u00020\u000f2\u000e\u0010 \u001a\n \u0012*\u0004\u0018\u00010\u00110\u0011H\u0096\u0001\u00a2\u0006\u0004\u0008)\u0010*J\u008a\u0001\u0010)\u001a&\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000 \u0012*\u0012\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000\u0018\u00010(0(\"\u0010\u0008\u0000\u0010+*\n \u0012*\u0004\u0018\u00010\u00170\u00172*\u0010\u0010\u001a&\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000 \u0012*\u0012\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000\u0018\u00010\u001a0\u001a2\u0006\u0010\u0013\u001a\u00020\u000f2\u000e\u0010 \u001a\n \u0012*\u0004\u0018\u00010\u00110\u0011H\u0096\u0001\u00a2\u0006\u0004\u0008)\u0010,JP\u0010.\u001a\u0012\u0012\u0002\u0008\u0003 \u0012*\u0008\u0012\u0002\u0008\u0003\u0018\u00010(0(2\u000e\u0010\u0010\u001a\n \u0012*\u0004\u0018\u00010\u00050\u00052\u0006\u0010\u0013\u001a\u00020\u000f2\u0006\u0010 \u001a\u00020\u000f2\u000e\u0010-\u001a\n \u0012*\u0004\u0018\u00010\u00110\u0011H\u0096\u0001\u00a2\u0006\u0004\u0008.\u0010/JP\u00100\u001a\u0012\u0012\u0002\u0008\u0003 \u0012*\u0008\u0012\u0002\u0008\u0003\u0018\u00010(0(2\u000e\u0010\u0010\u001a\n \u0012*\u0004\u0018\u00010\u00050\u00052\u0006\u0010\u0013\u001a\u00020\u000f2\u0006\u0010 \u001a\u00020\u000f2\u000e\u0010-\u001a\n \u0012*\u0004\u0018\u00010\u00110\u0011H\u0096\u0001\u00a2\u0006\u0004\u00080\u0010/J0\u00101\u001a\u0012\u0012\u0002\u0008\u0003 \u0012*\u0008\u0012\u0002\u0008\u0003\u0018\u00010\u001c0\u001c2\u000e\u0010\u0010\u001a\n \u0012*\u0004\u0018\u00010\u00050\u0005H\u0096\u0001\u00a2\u0006\u0004\u00081\u00102Jf\u00101\u001a&\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000 \u0012*\u0012\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000\u0018\u00010\u001c0\u001c\"\u0010\u0008\u0000\u0010\u0018*\n \u0012*\u0004\u0018\u00010\u00170\u00172\u000e\u0010\u0010\u001a\n \u0012*\u0004\u0018\u00010\u00050\u00052\u000e\u0010\u0013\u001a\n \u0012*\u0004\u0018\u00018\u00008\u0000H\u0096\u0001\u00a2\u0006\u0004\u00081\u00103Jr\u00101\u001a&\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000 \u0012*\u0012\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000\u0018\u00010\u001c0\u001c\"\u0010\u0008\u0000\u0010\u0018*\n \u0012*\u0004\u0018\u00010\u00170\u00172*\u0010\u0010\u001a&\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000 \u0012*\u0012\u0012\u000c\u0012\n \u0012*\u0004\u0018\u00018\u00008\u0000\u0018\u00010\u001a0\u001aH\u0096\u0001\u00a2\u0006\u0004\u00081\u00104R\u0017\u0010\u0002\u001a\u00020\u00018\u0006\u00a2\u0006\u000c\n\u0004\u00085\u00106\u001a\u0004\u00087\u00108\u00a8\u0006;"
    }
    d2 = {
        "Lcom/hellogroup/common/thread/SafeExecutor;",
        "Ljava/util/concurrent/ScheduledExecutorService;",
        "delegate",
        "<init>",
        "(Ljava/util/concurrent/ScheduledExecutorService;)V",
        "Ljava/lang/Runnable;",
        "command",
        "",
        "execute",
        "(Ljava/lang/Runnable;)V",
        "shutdown",
        "()V",
        "",
        "shutdownNow",
        "()Ljava/util/List;",
        "",
        "p0",
        "Ljava/util/concurrent/TimeUnit;",
        "kotlin.jvm.PlatformType",
        "p1",
        "",
        "awaitTermination",
        "(JLjava/util/concurrent/TimeUnit;)Z",
        "",
        "T",
        "",
        "Ljava/util/concurrent/Callable;",
        "",
        "Ljava/util/concurrent/Future;",
        "",
        "invokeAll",
        "(Ljava/util/Collection;)Ljava/util/List;",
        "p2",
        "(Ljava/util/Collection;JLjava/util/concurrent/TimeUnit;)Ljava/util/List;",
        "invokeAny",
        "(Ljava/util/Collection;)Ljava/lang/Object;",
        "(Ljava/util/Collection;JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;",
        "isShutdown",
        "()Z",
        "isTerminated",
        "Ljava/util/concurrent/ScheduledFuture;",
        "schedule",
        "(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;",
        "V",
        "(Ljava/util/concurrent/Callable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;",
        "p3",
        "scheduleAtFixedRate",
        "(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;",
        "scheduleWithFixedDelay",
        "submit",
        "(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;",
        "(Ljava/lang/Runnable;Ljava/lang/Object;)Ljava/util/concurrent/Future;",
        "(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;",
        "a",
        "Ljava/util/concurrent/ScheduledExecutorService;",
        "getDelegate",
        "()Ljava/util/concurrent/ScheduledExecutorService;",
        "Companion",
        "b",
        "HelloFoundation_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field public static final Companion:Lcom/hellogroup/common/thread/SafeExecutor$a;

.field private static final b:Lkotlin/Lazy;

.field private static final c:Lkotlin/Lazy;

.field private static final d:Lkotlin/Lazy;


# instance fields
.field private final a:Ljava/util/concurrent/ScheduledExecutorService;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/hellogroup/common/thread/SafeExecutor$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/hellogroup/common/thread/SafeExecutor$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/hellogroup/common/thread/SafeExecutor;->Companion:Lcom/hellogroup/common/thread/SafeExecutor$a;

    .line 8
    .line 9
    sget-object v0, Lcom/hellogroup/common/thread/SafeExecutor$Companion$callableField$2;->INSTANCE:Lcom/hellogroup/common/thread/SafeExecutor$Companion$callableField$2;

    .line 10
    .line 11
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lcom/hellogroup/common/thread/SafeExecutor;->b:Lkotlin/Lazy;

    .line 16
    .line 17
    sget-object v0, Lcom/hellogroup/common/thread/SafeExecutor$Companion$runnableAdapterClass$2;->INSTANCE:Lcom/hellogroup/common/thread/SafeExecutor$Companion$runnableAdapterClass$2;

    .line 18
    .line 19
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Lcom/hellogroup/common/thread/SafeExecutor;->c:Lkotlin/Lazy;

    .line 24
    .line 25
    sget-object v0, Lcom/hellogroup/common/thread/SafeExecutor$Companion$taskField$2;->INSTANCE:Lcom/hellogroup/common/thread/SafeExecutor$Companion$taskField$2;

    .line 26
    .line 27
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Lcom/hellogroup/common/thread/SafeExecutor;->d:Lkotlin/Lazy;

    .line 32
    .line 33
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 0
    .param p1    # Ljava/util/concurrent/ScheduledExecutorService;
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
    iput-object p1, p0, Lcom/hellogroup/common/thread/SafeExecutor;->a:Ljava/util/concurrent/ScheduledExecutorService;

    .line 8
    .line 9
    return-void
.end method

.method public static final synthetic k()Lkotlin/Lazy;
    .locals 1

    .line 1
    sget-object v0, Lcom/hellogroup/common/thread/SafeExecutor;->b:Lkotlin/Lazy;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic m()Lkotlin/Lazy;
    .locals 1

    .line 1
    sget-object v0, Lcom/hellogroup/common/thread/SafeExecutor;->c:Lkotlin/Lazy;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic n()Lkotlin/Lazy;
    .locals 1

    .line 1
    sget-object v0, Lcom/hellogroup/common/thread/SafeExecutor;->d:Lkotlin/Lazy;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public awaitTermination(JLjava/util/concurrent/TimeUnit;)Z
    .locals 0

    iget-object p0, p0, Lcom/hellogroup/common/thread/SafeExecutor;->a:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {p0, p1, p2, p3}, Ljava/util/concurrent/ExecutorService;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z

    move-result p0

    return p0
.end method

.method public synthetic close()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/zmg0;->a(Ljava/util/concurrent/ExecutorService;)V

    return-void
.end method

.method public execute(Ljava/lang/Runnable;)V
    .locals 1
    .param p1    # Ljava/lang/Runnable;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/hellogroup/common/thread/SafeExecutor;->a:Ljava/util/concurrent/ScheduledExecutorService;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance v0, Lcom/hellogroup/common/thread/SafeExecutor$b;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Lcom/hellogroup/common/thread/SafeExecutor$b;-><init>(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public invokeAll(Ljava/util/Collection;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "+",
            "Ljava/util/concurrent/Callable<",
            "TT;>;>;)",
            "Ljava/util/List<",
            "Ljava/util/concurrent/Future<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/common/thread/SafeExecutor;->a:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {p0, p1}, Ljava/util/concurrent/ExecutorService;->invokeAll(Ljava/util/Collection;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public invokeAll(Ljava/util/Collection;JLjava/util/concurrent/TimeUnit;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "+",
            "Ljava/util/concurrent/Callable<",
            "TT;>;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Ljava/util/List<",
            "Ljava/util/concurrent/Future<",
            "TT;>;>;"
        }
    .end annotation

    .line 2
    iget-object p0, p0, Lcom/hellogroup/common/thread/SafeExecutor;->a:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {p0, p1, p2, p3, p4}, Ljava/util/concurrent/ExecutorService;->invokeAll(Ljava/util/Collection;JLjava/util/concurrent/TimeUnit;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public invokeAny(Ljava/util/Collection;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "+",
            "Ljava/util/concurrent/Callable<",
            "TT;>;>;)TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/common/thread/SafeExecutor;->a:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {p0, p1}, Ljava/util/concurrent/ExecutorService;->invokeAny(Ljava/util/Collection;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public invokeAny(Ljava/util/Collection;JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "+",
            "Ljava/util/concurrent/Callable<",
            "TT;>;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .line 2
    iget-object p0, p0, Lcom/hellogroup/common/thread/SafeExecutor;->a:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {p0, p1, p2, p3, p4}, Ljava/util/concurrent/ExecutorService;->invokeAny(Ljava/util/Collection;JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public isShutdown()Z
    .locals 0

    iget-object p0, p0, Lcom/hellogroup/common/thread/SafeExecutor;->a:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->isShutdown()Z

    move-result p0

    return p0
.end method

.method public isTerminated()Z
    .locals 0

    iget-object p0, p0, Lcom/hellogroup/common/thread/SafeExecutor;->a:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->isTerminated()Z

    move-result p0

    return p0
.end method

.method public schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            "J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/common/thread/SafeExecutor;->a:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {p0, p1, p2, p3, p4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p0

    return-object p0
.end method

.method public schedule(Ljava/util/concurrent/Callable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TV;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Ljava/util/concurrent/ScheduledFuture<",
            "TV;>;"
        }
    .end annotation

    .line 2
    iget-object p0, p0, Lcom/hellogroup/common/thread/SafeExecutor;->a:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {p0, p1, p2, p3, p4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/util/concurrent/Callable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p0

    return-object p0
.end method

.method public scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            "JJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation

    iget-object p0, p0, Lcom/hellogroup/common/thread/SafeExecutor;->a:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface/range {p0 .. p6}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p0

    return-object p0
.end method

.method public scheduleWithFixedDelay(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            "JJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation

    iget-object p0, p0, Lcom/hellogroup/common/thread/SafeExecutor;->a:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface/range {p0 .. p6}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleWithFixedDelay(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object p0

    return-object p0
.end method

.method public shutdown()V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/IllegalAccessException;

    .line 2
    .line 3
    const-string v0, "shutdown is not allowed outside ThreadUtils"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/IllegalAccessException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public shutdownNow()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/IllegalAccessException;

    .line 2
    .line 3
    const-string v0, "shutdownNow is not allowed outside ThreadUtils"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/IllegalAccessException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Runnable;",
            ")",
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/common/thread/SafeExecutor;->a:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {p0, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object p0

    return-object p0
.end method

.method public submit(Ljava/lang/Runnable;Ljava/lang/Object;)Ljava/util/concurrent/Future;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Runnable;",
            "TT;)",
            "Ljava/util/concurrent/Future<",
            "TT;>;"
        }
    .end annotation

    .line 2
    iget-object p0, p0, Lcom/hellogroup/common/thread/SafeExecutor;->a:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {p0, p1, p2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;Ljava/lang/Object;)Ljava/util/concurrent/Future;

    move-result-object p0

    return-object p0
.end method

.method public submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TT;>;)",
            "Ljava/util/concurrent/Future<",
            "TT;>;"
        }
    .end annotation

    .line 3
    iget-object p0, p0, Lcom/hellogroup/common/thread/SafeExecutor;->a:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {p0, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object p0

    return-object p0
.end method
