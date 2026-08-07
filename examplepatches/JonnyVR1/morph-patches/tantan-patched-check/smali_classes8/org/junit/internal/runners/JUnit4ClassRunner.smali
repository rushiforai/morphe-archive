.class public Lorg/junit/internal/runners/JUnit4ClassRunner;
.super Lorg/junit/runner/Runner;
.source "SourceFile"

# interfaces
.implements Lorg/junit/runner/manipulation/Filterable;
.implements Lorg/junit/runner/manipulation/Sortable;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private testClass:Lorg/junit/internal/runners/TestClass;

.field private final testMethods:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/internal/runners/InitializationError;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lorg/junit/runner/Runner;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/junit/internal/runners/TestClass;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Lorg/junit/internal/runners/TestClass;-><init>(Ljava/lang/Class;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testClass:Lorg/junit/internal/runners/TestClass;

    .line 10
    .line 11
    invoke-virtual {p0}, Lorg/junit/internal/runners/JUnit4ClassRunner;->getTestMethods()Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testMethods:Ljava/util/List;

    .line 16
    .line 17
    invoke-virtual {p0}, Lorg/junit/internal/runners/JUnit4ClassRunner;->validate()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private testAborted(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/runner/Description;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Lorg/junit/runner/notification/RunNotifier;->fireTestStarted(Lorg/junit/runner/Description;)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Lorg/junit/runner/notification/Failure;

    .line 5
    .line 6
    invoke-direct {p0, p2, p3}, Lorg/junit/runner/notification/Failure;-><init>(Lorg/junit/runner/Description;Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lorg/junit/runner/notification/RunNotifier;->fireTestFailure(Lorg/junit/runner/notification/Failure;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, p2}, Lorg/junit/runner/notification/RunNotifier;->fireTestFinished(Lorg/junit/runner/Description;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public classAnnotations()[Ljava/lang/annotation/Annotation;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testClass:Lorg/junit/internal/runners/TestClass;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/junit/internal/runners/TestClass;->getJavaClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Class;->getAnnotations()[Ljava/lang/annotation/Annotation;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public createTest()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/junit/internal/runners/JUnit4ClassRunner;->getTestClass()Lorg/junit/internal/runners/TestClass;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lorg/junit/internal/runners/TestClass;->getConstructor()Ljava/lang/reflect/Constructor;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public filter(Lorg/junit/runner/manipulation/Filter;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runner/manipulation/NoTestsRemainException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testMethods:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ljava/lang/reflect/Method;

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Lorg/junit/internal/runners/JUnit4ClassRunner;->methodDescription(Ljava/lang/reflect/Method;)Lorg/junit/runner/Description;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {p1, v1}, Lorg/junit/runner/manipulation/Filter;->shouldRun(Lorg/junit/runner/Description;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object p0, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testMethods:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-nez p0, :cond_2

    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    new-instance p0, Lorg/junit/runner/manipulation/NoTestsRemainException;

    .line 43
    .line 44
    invoke-direct {p0}, Lorg/junit/runner/manipulation/NoTestsRemainException;-><init>()V

    .line 45
    .line 46
    .line 47
    throw p0
.end method

.method public getDescription()Lorg/junit/runner/Description;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lorg/junit/internal/runners/JUnit4ClassRunner;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lorg/junit/internal/runners/JUnit4ClassRunner;->classAnnotations()[Ljava/lang/annotation/Annotation;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Lorg/junit/runner/Description;->createSuiteDescription(Ljava/lang/String;[Ljava/lang/annotation/Annotation;)Lorg/junit/runner/Description;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testMethods:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ljava/lang/reflect/Method;

    .line 30
    .line 31
    invoke-virtual {p0, v2}, Lorg/junit/internal/runners/JUnit4ClassRunner;->methodDescription(Ljava/lang/reflect/Method;)Lorg/junit/runner/Description;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v0, v2}, Lorg/junit/runner/Description;->addChild(Lorg/junit/runner/Description;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/junit/internal/runners/JUnit4ClassRunner;->getTestClass()Lorg/junit/internal/runners/TestClass;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lorg/junit/internal/runners/TestClass;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTestClass()Lorg/junit/internal/runners/TestClass;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testClass:Lorg/junit/internal/runners/TestClass;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTestMethods()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testClass:Lorg/junit/internal/runners/TestClass;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/junit/internal/runners/TestClass;->getTestMethods()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public invokeTestMethod(Ljava/lang/reflect/Method;Lorg/junit/runner/notification/RunNotifier;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lorg/junit/internal/runners/JUnit4ClassRunner;->methodDescription(Ljava/lang/reflect/Method;)Lorg/junit/runner/Description;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :try_start_0
    invoke-virtual {p0}, Lorg/junit/internal/runners/JUnit4ClassRunner;->createTest()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    invoke-virtual {p0, p1}, Lorg/junit/internal/runners/JUnit4ClassRunner;->wrapMethod(Ljava/lang/reflect/Method;)Lorg/junit/internal/runners/TestMethod;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance p1, Lorg/junit/internal/runners/MethodRoadie;

    .line 14
    .line 15
    invoke-direct {p1, v1, p0, p2, v0}, Lorg/junit/internal/runners/MethodRoadie;-><init>(Ljava/lang/Object;Lorg/junit/internal/runners/TestMethod;Lorg/junit/runner/notification/RunNotifier;Lorg/junit/runner/Description;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lorg/junit/internal/runners/MethodRoadie;->run()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :catch_0
    move-exception p1

    .line 23
    invoke-direct {p0, p2, v0, p1}, Lorg/junit/internal/runners/JUnit4ClassRunner;->testAborted(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/runner/Description;Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catch_1
    move-exception p1

    .line 28
    invoke-virtual {p1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-direct {p0, p2, v0, p1}, Lorg/junit/internal/runners/JUnit4ClassRunner;->testAborted(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/runner/Description;Ljava/lang/Throwable;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public methodDescription(Ljava/lang/reflect/Method;)Lorg/junit/runner/Description;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/junit/internal/runners/JUnit4ClassRunner;->getTestClass()Lorg/junit/internal/runners/TestClass;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lorg/junit/internal/runners/TestClass;->getJavaClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, p1}, Lorg/junit/internal/runners/JUnit4ClassRunner;->testName(Ljava/lang/reflect/Method;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0, p1}, Lorg/junit/internal/runners/JUnit4ClassRunner;->testAnnotations(Ljava/lang/reflect/Method;)[Ljava/lang/annotation/Annotation;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {v0, v1, p0}, Lorg/junit/runner/Description;->createTestDescription(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/annotation/Annotation;)Lorg/junit/runner/Description;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public run(Lorg/junit/runner/notification/RunNotifier;)V
    .locals 4

    .line 1
    new-instance v0, Lorg/junit/internal/runners/ClassRoadie;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testClass:Lorg/junit/internal/runners/TestClass;

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/junit/internal/runners/JUnit4ClassRunner;->getDescription()Lorg/junit/runner/Description;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    new-instance v3, Lorg/junit/internal/runners/JUnit4ClassRunner$1;

    .line 10
    .line 11
    invoke-direct {v3, p0, p1}, Lorg/junit/internal/runners/JUnit4ClassRunner$1;-><init>(Lorg/junit/internal/runners/JUnit4ClassRunner;Lorg/junit/runner/notification/RunNotifier;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {v0, p1, v1, v2, v3}, Lorg/junit/internal/runners/ClassRoadie;-><init>(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/internal/runners/TestClass;Lorg/junit/runner/Description;Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Lorg/junit/internal/runners/ClassRoadie;->runProtected()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public runMethods(Lorg/junit/runner/notification/RunNotifier;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testMethods:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ljava/lang/reflect/Method;

    .line 18
    .line 19
    invoke-virtual {p0, v1, p1}, Lorg/junit/internal/runners/JUnit4ClassRunner;->invokeTestMethod(Ljava/lang/reflect/Method;Lorg/junit/runner/notification/RunNotifier;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public sort(Lorg/junit/runner/manipulation/Sorter;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testMethods:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Lorg/junit/internal/runners/JUnit4ClassRunner$2;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lorg/junit/internal/runners/JUnit4ClassRunner$2;-><init>(Lorg/junit/internal/runners/JUnit4ClassRunner;Lorg/junit/runner/manipulation/Sorter;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public testAnnotations(Ljava/lang/reflect/Method;)[Ljava/lang/annotation/Annotation;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/reflect/AccessibleObject;->getAnnotations()[Ljava/lang/annotation/Annotation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public testName(Ljava/lang/reflect/Method;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public validate()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/internal/runners/InitializationError;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/junit/internal/runners/MethodValidator;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testClass:Lorg/junit/internal/runners/TestClass;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lorg/junit/internal/runners/MethodValidator;-><init>(Lorg/junit/internal/runners/TestClass;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Lorg/junit/internal/runners/MethodValidator;->validateMethodsForDefaultRunner()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Lorg/junit/internal/runners/MethodValidator;->assertValid()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public wrapMethod(Ljava/lang/reflect/Method;)Lorg/junit/internal/runners/TestMethod;
    .locals 1

    .line 1
    new-instance v0, Lorg/junit/internal/runners/TestMethod;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/junit/internal/runners/JUnit4ClassRunner;->testClass:Lorg/junit/internal/runners/TestClass;

    .line 4
    .line 5
    invoke-direct {v0, p1, p0}, Lorg/junit/internal/runners/TestMethod;-><init>(Ljava/lang/reflect/Method;Lorg/junit/internal/runners/TestClass;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method
