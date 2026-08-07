.class public Lorg/junit/experimental/ParallelComputer;
.super Lorg/junit/runner/Computer;
.source "SourceFile"


# instance fields
.field private final classes:Z

.field private final methods:Z


# direct methods
.method public constructor <init>(ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/junit/runner/Computer;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lorg/junit/experimental/ParallelComputer;->classes:Z

    .line 5
    .line 6
    iput-boolean p2, p0, Lorg/junit/experimental/ParallelComputer;->methods:Z

    .line 7
    .line 8
    return-void
.end method

.method public static classes()Lorg/junit/runner/Computer;
    .locals 3

    .line 1
    new-instance v0, Lorg/junit/experimental/ParallelComputer;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-direct {v0, v1, v2}, Lorg/junit/experimental/ParallelComputer;-><init>(ZZ)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static methods()Lorg/junit/runner/Computer;
    .locals 3

    .line 1
    new-instance v0, Lorg/junit/experimental/ParallelComputer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-direct {v0, v1, v2}, Lorg/junit/experimental/ParallelComputer;-><init>(ZZ)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method private static parallelize(Lorg/junit/runner/Runner;)Lorg/junit/runner/Runner;
    .locals 2

    .line 1
    instance-of v0, p0, Lorg/junit/runners/ParentRunner;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    check-cast v0, Lorg/junit/runners/ParentRunner;

    .line 7
    .line 8
    new-instance v1, Lorg/junit/experimental/ParallelComputer$1;

    .line 9
    .line 10
    invoke-direct {v1}, Lorg/junit/experimental/ParallelComputer$1;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lorg/junit/runners/ParentRunner;->setScheduler(Lorg/junit/runners/model/RunnerScheduler;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-object p0
.end method


# virtual methods
.method public getRunner(Lorg/junit/runners/model/RunnerBuilder;Ljava/lang/Class;)Lorg/junit/runner/Runner;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runners/model/RunnerBuilder;",
            "Ljava/lang/Class<",
            "*>;)",
            "Lorg/junit/runner/Runner;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Lorg/junit/runner/Computer;->getRunner(Lorg/junit/runners/model/RunnerBuilder;Ljava/lang/Class;)Lorg/junit/runner/Runner;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-boolean p0, p0, Lorg/junit/experimental/ParallelComputer;->methods:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Lorg/junit/experimental/ParallelComputer;->parallelize(Lorg/junit/runner/Runner;)Lorg/junit/runner/Runner;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    return-object p1
.end method

.method public getSuite(Lorg/junit/runners/model/RunnerBuilder;[Ljava/lang/Class;)Lorg/junit/runner/Runner;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runners/model/RunnerBuilder;",
            "[",
            "Ljava/lang/Class<",
            "*>;)",
            "Lorg/junit/runner/Runner;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runners/model/InitializationError;
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Lorg/junit/runner/Computer;->getSuite(Lorg/junit/runners/model/RunnerBuilder;[Ljava/lang/Class;)Lorg/junit/runner/Runner;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-boolean p0, p0, Lorg/junit/experimental/ParallelComputer;->classes:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Lorg/junit/experimental/ParallelComputer;->parallelize(Lorg/junit/runner/Runner;)Lorg/junit/runner/Runner;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    return-object p1
.end method
