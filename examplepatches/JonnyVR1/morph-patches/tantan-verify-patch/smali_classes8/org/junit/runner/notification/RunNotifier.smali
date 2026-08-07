.class public Lorg/junit/runner/notification/RunNotifier;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/junit/runner/notification/RunNotifier$SafeNotifier;
    }
.end annotation


# instance fields
.field private final listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/junit/runner/notification/RunListener;",
            ">;"
        }
    .end annotation
.end field

.field private volatile pleaseStop:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/junit/runner/notification/RunNotifier;->listeners:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lorg/junit/runner/notification/RunNotifier;->pleaseStop:Z

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic access$000(Lorg/junit/runner/notification/RunNotifier;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/junit/runner/notification/RunNotifier;->listeners:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lorg/junit/runner/notification/RunNotifier;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lorg/junit/runner/notification/RunNotifier;->fireTestFailures(Ljava/util/List;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private fireTestFailures(Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/junit/runner/notification/RunListener;",
            ">;",
            "Ljava/util/List<",
            "Lorg/junit/runner/notification/Failure;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lorg/junit/runner/notification/RunNotifier$4;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p2}, Lorg/junit/runner/notification/RunNotifier$4;-><init>(Lorg/junit/runner/notification/RunNotifier;Ljava/util/List;Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Lorg/junit/runner/notification/RunNotifier$SafeNotifier;->run()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method


# virtual methods
.method public addFirstListener(Lorg/junit/runner/notification/RunListener;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lorg/junit/runner/notification/RunNotifier;->listeners:Ljava/util/List;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Lorg/junit/runner/notification/RunNotifier;->wrapIfNotThreadSafe(Lorg/junit/runner/notification/RunListener;)Lorg/junit/runner/notification/RunListener;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {v0, v1, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string p0, "Cannot add a null listener"

    .line 15
    .line 16
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public addListener(Lorg/junit/runner/notification/RunListener;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lorg/junit/runner/notification/RunNotifier;->listeners:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lorg/junit/runner/notification/RunNotifier;->wrapIfNotThreadSafe(Lorg/junit/runner/notification/RunListener;)Lorg/junit/runner/notification/RunListener;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string p0, "Cannot add a null listener"

    .line 14
    .line 15
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public fireTestAssumptionFailed(Lorg/junit/runner/notification/Failure;)V
    .locals 1

    .line 1
    new-instance v0, Lorg/junit/runner/notification/RunNotifier$5;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lorg/junit/runner/notification/RunNotifier$5;-><init>(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/runner/notification/Failure;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lorg/junit/runner/notification/RunNotifier$SafeNotifier;->run()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public fireTestFailure(Lorg/junit/runner/notification/Failure;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/junit/runner/notification/RunNotifier;->listeners:Ljava/util/List;

    .line 2
    .line 3
    filled-new-array {p1}, [Lorg/junit/runner/notification/Failure;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-direct {p0, v0, p1}, Lorg/junit/runner/notification/RunNotifier;->fireTestFailures(Ljava/util/List;Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public fireTestFinished(Lorg/junit/runner/Description;)V
    .locals 1

    .line 1
    new-instance v0, Lorg/junit/runner/notification/RunNotifier$7;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lorg/junit/runner/notification/RunNotifier$7;-><init>(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/runner/Description;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lorg/junit/runner/notification/RunNotifier$SafeNotifier;->run()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public fireTestIgnored(Lorg/junit/runner/Description;)V
    .locals 1

    .line 1
    new-instance v0, Lorg/junit/runner/notification/RunNotifier$6;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lorg/junit/runner/notification/RunNotifier$6;-><init>(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/runner/Description;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lorg/junit/runner/notification/RunNotifier$SafeNotifier;->run()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public fireTestRunFinished(Lorg/junit/runner/Result;)V
    .locals 1

    .line 1
    new-instance v0, Lorg/junit/runner/notification/RunNotifier$2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lorg/junit/runner/notification/RunNotifier$2;-><init>(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/runner/Result;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lorg/junit/runner/notification/RunNotifier$SafeNotifier;->run()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public fireTestRunStarted(Lorg/junit/runner/Description;)V
    .locals 1

    .line 1
    new-instance v0, Lorg/junit/runner/notification/RunNotifier$1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lorg/junit/runner/notification/RunNotifier$1;-><init>(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/runner/Description;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lorg/junit/runner/notification/RunNotifier$SafeNotifier;->run()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public fireTestStarted(Lorg/junit/runner/Description;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runner/notification/StoppedByUserException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/junit/runner/notification/RunNotifier;->pleaseStop:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lorg/junit/runner/notification/RunNotifier$3;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Lorg/junit/runner/notification/RunNotifier$3;-><init>(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/runner/Description;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Lorg/junit/runner/notification/RunNotifier$SafeNotifier;->run()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance p0, Lorg/junit/runner/notification/StoppedByUserException;

    .line 15
    .line 16
    invoke-direct {p0}, Lorg/junit/runner/notification/StoppedByUserException;-><init>()V

    .line 17
    .line 18
    .line 19
    throw p0
.end method

.method public pleaseStop()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lorg/junit/runner/notification/RunNotifier;->pleaseStop:Z

    .line 3
    .line 4
    return-void
.end method

.method public removeListener(Lorg/junit/runner/notification/RunListener;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lorg/junit/runner/notification/RunNotifier;->listeners:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lorg/junit/runner/notification/RunNotifier;->wrapIfNotThreadSafe(Lorg/junit/runner/notification/RunListener;)Lorg/junit/runner/notification/RunListener;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string p0, "Cannot remove a null listener"

    .line 14
    .line 15
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public wrapIfNotThreadSafe(Lorg/junit/runner/notification/RunListener;)Lorg/junit/runner/notification/RunListener;
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Lorg/junit/runner/notification/RunListener$ThreadSafe;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAnnotationPresent(Ljava/lang/Class;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-object p1

    .line 14
    :cond_0
    new-instance v0, Lorg/junit/runner/notification/SynchronizedRunListener;

    .line 15
    .line 16
    invoke-direct {v0, p1, p0}, Lorg/junit/runner/notification/SynchronizedRunListener;-><init>(Lorg/junit/runner/notification/RunListener;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method
