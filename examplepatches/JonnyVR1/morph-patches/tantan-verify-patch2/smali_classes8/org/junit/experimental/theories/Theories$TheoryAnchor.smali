.class public Lorg/junit/experimental/theories/Theories$TheoryAnchor;
.super Lorg/junit/runners/model/Statement;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/experimental/theories/Theories;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TheoryAnchor"
.end annotation


# instance fields
.field private fInvalidParameters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/junit/internal/AssumptionViolatedException;",
            ">;"
        }
    .end annotation
.end field

.field private successes:I

.field private final testClass:Lorg/junit/runners/model/TestClass;

.field private final testMethod:Lorg/junit/runners/model/FrameworkMethod;


# direct methods
.method public constructor <init>(Lorg/junit/runners/model/FrameworkMethod;Lorg/junit/runners/model/TestClass;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/junit/runners/model/Statement;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->successes:I

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->fInvalidParameters:Ljava/util/List;

    .line 13
    .line 14
    iput-object p1, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->testMethod:Lorg/junit/runners/model/FrameworkMethod;

    .line 15
    .line 16
    iput-object p2, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->testClass:Lorg/junit/runners/model/TestClass;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic access$000(Lorg/junit/experimental/theories/Theories$TheoryAnchor;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->nullsOk()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$100(Lorg/junit/experimental/theories/Theories$TheoryAnchor;Lorg/junit/runners/model/FrameworkMethod;Lorg/junit/experimental/theories/internal/Assignments;Ljava/lang/Object;)Lorg/junit/runners/model/Statement;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->methodCompletesWithParameters(Lorg/junit/runners/model/FrameworkMethod;Lorg/junit/experimental/theories/internal/Assignments;Ljava/lang/Object;)Lorg/junit/runners/model/Statement;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private getTestClass()Lorg/junit/runners/model/TestClass;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->testClass:Lorg/junit/runners/model/TestClass;

    .line 2
    .line 3
    return-object p0
.end method

.method private methodCompletesWithParameters(Lorg/junit/runners/model/FrameworkMethod;Lorg/junit/experimental/theories/internal/Assignments;Ljava/lang/Object;)Lorg/junit/runners/model/Statement;
    .locals 1

    .line 1
    new-instance v0, Lorg/junit/experimental/theories/Theories$TheoryAnchor$2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1, p3}, Lorg/junit/experimental/theories/Theories$TheoryAnchor$2;-><init>(Lorg/junit/experimental/theories/Theories$TheoryAnchor;Lorg/junit/experimental/theories/internal/Assignments;Lorg/junit/runners/model/FrameworkMethod;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private nullsOk()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->testMethod:Lorg/junit/runners/model/FrameworkMethod;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/junit/runners/model/FrameworkMethod;->getMethod()Ljava/lang/reflect/Method;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-class v0, Lorg/junit/experimental/theories/Theory;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lorg/junit/experimental/theories/Theory;

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return p0

    .line 19
    :cond_0
    invoke-interface {p0}, Lorg/junit/experimental/theories/Theory;->nullsAccepted()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method


# virtual methods
.method public evaluate()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->testMethod:Lorg/junit/runners/model/FrameworkMethod;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/junit/runners/model/FrameworkMethod;->getMethod()Ljava/lang/reflect/Method;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p0}, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->getTestClass()Lorg/junit/runners/model/TestClass;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0, v1}, Lorg/junit/experimental/theories/internal/Assignments;->allUnassigned(Ljava/lang/reflect/Method;Lorg/junit/runners/model/TestClass;)Lorg/junit/experimental/theories/internal/Assignments;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->runWithAssignment(Lorg/junit/experimental/theories/internal/Assignments;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->testMethod:Lorg/junit/runners/model/FrameworkMethod;

    .line 19
    .line 20
    const-class v1, Lorg/junit/experimental/theories/Theory;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lorg/junit/runners/model/FrameworkMethod;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 v0, 0x0

    .line 31
    :goto_0
    iget v1, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->successes:I

    .line 32
    .line 33
    if-nez v1, :cond_1

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string v1, "Never found parameters that satisfied method assumptions.  Violated assumptions: "

    .line 40
    .line 41
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->fInvalidParameters:Ljava/util/List;

    .line 45
    .line 46
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {p0}, Lorg/junit/Assert;->fail(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public handleAssumptionViolation(Lorg/junit/internal/AssumptionViolatedException;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->fInvalidParameters:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public handleDataPointSuccess()V
    .locals 1

    .line 1
    iget v0, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->successes:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->successes:I

    .line 6
    .line 7
    return-void
.end method

.method public varargs reportParameterizedError(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    array-length v0, p2

    .line 2
    if-nez v0, :cond_0

    .line 3
    .line 4
    throw p1

    .line 5
    :cond_0
    new-instance v0, Lorg/junit/experimental/theories/internal/ParameterizedAssertionError;

    .line 6
    .line 7
    iget-object p0, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->testMethod:Lorg/junit/runners/model/FrameworkMethod;

    .line 8
    .line 9
    invoke-virtual {p0}, Lorg/junit/runners/model/FrameworkMethod;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {v0, p1, p0, p2}, Lorg/junit/experimental/theories/internal/ParameterizedAssertionError;-><init>(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    throw v0
.end method

.method public runWithAssignment(Lorg/junit/experimental/theories/internal/Assignments;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lorg/junit/experimental/theories/internal/Assignments;->isComplete()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->runWithIncompleteAssignment(Lorg/junit/experimental/theories/internal/Assignments;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0, p1}, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->runWithCompleteAssignment(Lorg/junit/experimental/theories/internal/Assignments;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public runWithCompleteAssignment(Lorg/junit/experimental/theories/internal/Assignments;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/junit/experimental/theories/Theories$TheoryAnchor$1;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->getTestClass()Lorg/junit/runners/model/TestClass;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Lorg/junit/runners/model/TestClass;->getJavaClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, p0, v1, p1}, Lorg/junit/experimental/theories/Theories$TheoryAnchor$1;-><init>(Lorg/junit/experimental/theories/Theories$TheoryAnchor;Ljava/lang/Class;Lorg/junit/experimental/theories/internal/Assignments;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->testMethod:Lorg/junit/runners/model/FrameworkMethod;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Lorg/junit/experimental/theories/Theories$TheoryAnchor$1;->methodBlock(Lorg/junit/runners/model/FrameworkMethod;)Lorg/junit/runners/model/Statement;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Lorg/junit/runners/model/Statement;->evaluate()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public runWithIncompleteAssignment(Lorg/junit/experimental/theories/internal/Assignments;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lorg/junit/experimental/theories/internal/Assignments;->potentialsForNextUnassigned()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lorg/junit/experimental/theories/PotentialAssignment;

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Lorg/junit/experimental/theories/internal/Assignments;->assignNext(Lorg/junit/experimental/theories/PotentialAssignment;)Lorg/junit/experimental/theories/internal/Assignments;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {p0, v1}, Lorg/junit/experimental/theories/Theories$TheoryAnchor;->runWithAssignment(Lorg/junit/experimental/theories/internal/Assignments;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method
