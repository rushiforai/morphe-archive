.class public final Lcom/immomo/mmutil/task/Executors$ExecutorInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0000\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\r\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007R\u001b\u0010\u000c\u001a\u00020\u00018FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0008\u0010\t\u001a\u0004\u0008\n\u0010\u000bR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\r\u0010\u000eR\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000f\u0010\u0010\u00a8\u0006\u0011"
    }
    d2 = {
        "com/immomo/mmutil/task/Executors$ExecutorInfo",
        "",
        "",
        "executorName",
        "",
        "executorType",
        "<init>",
        "(Ljava/lang/String;I)V",
        "a",
        "Lkotlin/Lazy;",
        "getThreadExecutor",
        "()Ljava/lang/Object;",
        "threadExecutor",
        "b",
        "Ljava/lang/String;",
        "c",
        "I",
        "mm-util_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field private final a:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final b:Ljava/lang/String;

.field private final c:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .param p1    # Ljava/lang/String;
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
    iput-object p1, p0, Lcom/immomo/mmutil/task/Executors$ExecutorInfo;->b:Ljava/lang/String;

    .line 8
    .line 9
    iput p2, p0, Lcom/immomo/mmutil/task/Executors$ExecutorInfo;->c:I

    .line 10
    .line 11
    new-instance p1, Lcom/immomo/mmutil/task/Executors$ExecutorInfo$threadExecutor$2;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Lcom/immomo/mmutil/task/Executors$ExecutorInfo$threadExecutor$2;-><init>(Lcom/immomo/mmutil/task/Executors$ExecutorInfo;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lcom/immomo/mmutil/task/Executors$ExecutorInfo;->a:Lkotlin/Lazy;

    .line 21
    .line 22
    return-void
.end method

.method public static final synthetic a(Lcom/immomo/mmutil/task/Executors$ExecutorInfo;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/mmutil/task/Executors$ExecutorInfo;->c:I

    .line 2
    .line 3
    return p0
.end method
