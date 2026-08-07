.class public Lorg/junit/internal/runners/model/EachTestNotifier;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final description:Lorg/junit/runner/Description;

.field private final notifier:Lorg/junit/runner/notification/RunNotifier;


# direct methods
.method public constructor <init>(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/runner/Description;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->notifier:Lorg/junit/runner/notification/RunNotifier;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->description:Lorg/junit/runner/Description;

    .line 7
    .line 8
    return-void
.end method

.method private addMultipleFailureException(Lorg/junit/runners/model/MultipleFailureException;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lorg/junit/runners/model/MultipleFailureException;->getFailures()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/lang/Throwable;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lorg/junit/internal/runners/model/EachTestNotifier;->addFailure(Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method


# virtual methods
.method public addFailedAssumption(Lorg/junit/internal/AssumptionViolatedException;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->notifier:Lorg/junit/runner/notification/RunNotifier;

    .line 2
    .line 3
    new-instance v1, Lorg/junit/runner/notification/Failure;

    .line 4
    .line 5
    iget-object p0, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->description:Lorg/junit/runner/Description;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Lorg/junit/runner/notification/Failure;-><init>(Lorg/junit/runner/Description;Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lorg/junit/runner/notification/RunNotifier;->fireTestAssumptionFailed(Lorg/junit/runner/notification/Failure;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public addFailure(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p1, Lorg/junit/runners/model/MultipleFailureException;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lorg/junit/runners/model/MultipleFailureException;

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lorg/junit/internal/runners/model/EachTestNotifier;->addMultipleFailureException(Lorg/junit/runners/model/MultipleFailureException;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->notifier:Lorg/junit/runner/notification/RunNotifier;

    .line 12
    .line 13
    new-instance v1, Lorg/junit/runner/notification/Failure;

    .line 14
    .line 15
    iget-object p0, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->description:Lorg/junit/runner/Description;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1}, Lorg/junit/runner/notification/Failure;-><init>(Lorg/junit/runner/Description;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lorg/junit/runner/notification/RunNotifier;->fireTestFailure(Lorg/junit/runner/notification/Failure;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public fireTestFinished()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->notifier:Lorg/junit/runner/notification/RunNotifier;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->description:Lorg/junit/runner/Description;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lorg/junit/runner/notification/RunNotifier;->fireTestFinished(Lorg/junit/runner/Description;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public fireTestIgnored()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->notifier:Lorg/junit/runner/notification/RunNotifier;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->description:Lorg/junit/runner/Description;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lorg/junit/runner/notification/RunNotifier;->fireTestIgnored(Lorg/junit/runner/Description;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public fireTestStarted()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->notifier:Lorg/junit/runner/notification/RunNotifier;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/junit/internal/runners/model/EachTestNotifier;->description:Lorg/junit/runner/Description;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lorg/junit/runner/notification/RunNotifier;->fireTestStarted(Lorg/junit/runner/Description;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
