.class final Lcom/hellogroup/common/thread/Executors;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hellogroup/common/thread/Executors$ExecutorInfo;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0015\u0008\u00c2\u0002\u0018\u00002\u00020\u0001:\u0001\u0018B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u001b\u0010\u0008\u001a\u00020\u00048FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0005\u0010\u0006\u001a\u0004\u0008\u0005\u0010\u0007R\u001b\u0010\u000b\u001a\u00020\u00048FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\t\u0010\u0006\u001a\u0004\u0008\n\u0010\u0007R\u001b\u0010\u000e\u001a\u00020\u00048FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u000c\u0010\u0006\u001a\u0004\u0008\r\u0010\u0007R\u001b\u0010\u0011\u001a\u00020\u00048FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u000f\u0010\u0006\u001a\u0004\u0008\u0010\u0010\u0007R\u001b\u0010\u0014\u001a\u00020\u00048FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0012\u0010\u0006\u001a\u0004\u0008\u0013\u0010\u0007R\u001b\u0010\u0017\u001a\u00020\u00048FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0015\u0010\u0006\u001a\u0004\u0008\u0016\u0010\u0007\u00a8\u0006\u0019"
    }
    d2 = {
        "Lcom/hellogroup/common/thread/Executors;",
        "",
        "<init>",
        "()V",
        "Lcom/hellogroup/common/thread/Executors$ExecutorInfo;",
        "a",
        "Lkotlin/Lazy;",
        "()Lcom/hellogroup/common/thread/Executors$ExecutorInfo;",
        "userExecutorInfo",
        "b",
        "getInnerExecutorInfo",
        "innerExecutorInfo",
        "c",
        "getLocalExecutorInfo",
        "localExecutorInfo",
        "d",
        "getMessageExecutorInfo",
        "messageExecutorInfo",
        "e",
        "getStatisticsExecutorInfo",
        "statisticsExecutorInfo",
        "f",
        "getIsolatedExecutorInfo",
        "isolatedExecutorInfo",
        "ExecutorInfo",
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
.field public static final INSTANCE:Lcom/hellogroup/common/thread/Executors;

.field private static final a:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final b:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final c:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final d:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final e:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final f:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/hellogroup/common/thread/Executors;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/hellogroup/common/thread/Executors;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/hellogroup/common/thread/Executors;->INSTANCE:Lcom/hellogroup/common/thread/Executors;

    .line 7
    .line 8
    sget-object v0, Lcom/hellogroup/common/thread/Executors$userExecutorInfo$2;->INSTANCE:Lcom/hellogroup/common/thread/Executors$userExecutorInfo$2;

    .line 9
    .line 10
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lcom/hellogroup/common/thread/Executors;->a:Lkotlin/Lazy;

    .line 15
    .line 16
    sget-object v0, Lcom/hellogroup/common/thread/Executors$innerExecutorInfo$2;->INSTANCE:Lcom/hellogroup/common/thread/Executors$innerExecutorInfo$2;

    .line 17
    .line 18
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Lcom/hellogroup/common/thread/Executors;->b:Lkotlin/Lazy;

    .line 23
    .line 24
    sget-object v0, Lcom/hellogroup/common/thread/Executors$localExecutorInfo$2;->INSTANCE:Lcom/hellogroup/common/thread/Executors$localExecutorInfo$2;

    .line 25
    .line 26
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Lcom/hellogroup/common/thread/Executors;->c:Lkotlin/Lazy;

    .line 31
    .line 32
    sget-object v0, Lcom/hellogroup/common/thread/Executors$messageExecutorInfo$2;->INSTANCE:Lcom/hellogroup/common/thread/Executors$messageExecutorInfo$2;

    .line 33
    .line 34
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sput-object v0, Lcom/hellogroup/common/thread/Executors;->d:Lkotlin/Lazy;

    .line 39
    .line 40
    sget-object v0, Lcom/hellogroup/common/thread/Executors$statisticsExecutorInfo$2;->INSTANCE:Lcom/hellogroup/common/thread/Executors$statisticsExecutorInfo$2;

    .line 41
    .line 42
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Lcom/hellogroup/common/thread/Executors;->e:Lkotlin/Lazy;

    .line 47
    .line 48
    sget-object v0, Lcom/hellogroup/common/thread/Executors$isolatedExecutorInfo$2;->INSTANCE:Lcom/hellogroup/common/thread/Executors$isolatedExecutorInfo$2;

    .line 49
    .line 50
    invoke-static {v0}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sput-object v0, Lcom/hellogroup/common/thread/Executors;->f:Lkotlin/Lazy;

    .line 55
    .line 56
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()Lcom/hellogroup/common/thread/Executors$ExecutorInfo;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object p0, Lcom/hellogroup/common/thread/Executors;->a:Lkotlin/Lazy;

    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/common/thread/Executors$ExecutorInfo;

    return-object p0
.end method
