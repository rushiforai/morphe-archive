.class public Lorg/junit/runner/JUnitCore;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final notifier:Lorg/junit/runner/notification/RunNotifier;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/junit/runner/notification/RunNotifier;

    .line 5
    .line 6
    invoke-direct {v0}, Lorg/junit/runner/notification/RunNotifier;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/junit/runner/JUnitCore;->notifier:Lorg/junit/runner/notification/RunNotifier;

    .line 10
    .line 11
    return-void
.end method

.method public static defaultComputer()Lorg/junit/runner/Computer;
    .locals 1

    .line 1
    new-instance v0, Lorg/junit/runner/Computer;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/junit/runner/Computer;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static varargs main([Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Lorg/junit/runner/JUnitCore;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/junit/runner/JUnitCore;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lorg/junit/internal/RealSystem;

    .line 7
    .line 8
    invoke-direct {v1}, Lorg/junit/internal/RealSystem;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1, p0}, Lorg/junit/runner/JUnitCore;->runMain(Lorg/junit/internal/JUnitSystem;[Ljava/lang/String;)Lorg/junit/runner/Result;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lorg/junit/runner/Result;->wasSuccessful()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    xor-int/lit8 p0, p0, 0x1

    .line 20
    .line 21
    invoke-static {p0}, Ljava/lang/System;->exit(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static varargs runClasses(Lorg/junit/runner/Computer;[Ljava/lang/Class;)Lorg/junit/runner/Result;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runner/Computer;",
            "[",
            "Ljava/lang/Class<",
            "*>;)",
            "Lorg/junit/runner/Result;"
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/junit/runner/JUnitCore;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/junit/runner/JUnitCore;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0, p1}, Lorg/junit/runner/JUnitCore;->run(Lorg/junit/runner/Computer;[Ljava/lang/Class;)Lorg/junit/runner/Result;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static varargs runClasses([Ljava/lang/Class;)Lorg/junit/runner/Result;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class<",
            "*>;)",
            "Lorg/junit/runner/Result;"
        }
    .end annotation

    .line 11
    invoke-static {}, Lorg/junit/runner/JUnitCore;->defaultComputer()Lorg/junit/runner/Computer;

    move-result-object v0

    invoke-static {v0, p0}, Lorg/junit/runner/JUnitCore;->runClasses(Lorg/junit/runner/Computer;[Ljava/lang/Class;)Lorg/junit/runner/Result;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public addListener(Lorg/junit/runner/notification/RunListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/junit/runner/JUnitCore;->notifier:Lorg/junit/runner/notification/RunNotifier;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/junit/runner/notification/RunNotifier;->addListener(Lorg/junit/runner/notification/RunListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getVersion()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/p9l0;->a()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public removeListener(Lorg/junit/runner/notification/RunListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/junit/runner/JUnitCore;->notifier:Lorg/junit/runner/notification/RunNotifier;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/junit/runner/notification/RunNotifier;->removeListener(Lorg/junit/runner/notification/RunListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public run(Ll/mqi0;)Lorg/junit/runner/Result;
    .locals 1

    .line 45
    new-instance v0, Lorg/junit/internal/runners/JUnit38ClassRunner;

    invoke-direct {v0, p1}, Lorg/junit/internal/runners/JUnit38ClassRunner;-><init>(Ll/mqi0;)V

    invoke-virtual {p0, v0}, Lorg/junit/runner/JUnitCore;->run(Lorg/junit/runner/Runner;)Lorg/junit/runner/Result;

    move-result-object p0

    return-object p0
.end method

.method public varargs run(Lorg/junit/runner/Computer;[Ljava/lang/Class;)Lorg/junit/runner/Result;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runner/Computer;",
            "[",
            "Ljava/lang/Class<",
            "*>;)",
            "Lorg/junit/runner/Result;"
        }
    .end annotation

    .line 43
    invoke-static {p1, p2}, Lorg/junit/runner/Request;->classes(Lorg/junit/runner/Computer;[Ljava/lang/Class;)Lorg/junit/runner/Request;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/junit/runner/JUnitCore;->run(Lorg/junit/runner/Request;)Lorg/junit/runner/Result;

    move-result-object p0

    return-object p0
.end method

.method public run(Lorg/junit/runner/Request;)Lorg/junit/runner/Result;
    .locals 0

    .line 44
    invoke-virtual {p1}, Lorg/junit/runner/Request;->getRunner()Lorg/junit/runner/Runner;

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/junit/runner/JUnitCore;->run(Lorg/junit/runner/Runner;)Lorg/junit/runner/Result;

    move-result-object p0

    return-object p0
.end method

.method public run(Lorg/junit/runner/Runner;)Lorg/junit/runner/Result;
    .locals 4

    .line 1
    new-instance v0, Lorg/junit/runner/Result;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/junit/runner/Result;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lorg/junit/runner/Result;->createListener()Lorg/junit/runner/notification/RunListener;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-object v2, p0, Lorg/junit/runner/JUnitCore;->notifier:Lorg/junit/runner/notification/RunNotifier;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Lorg/junit/runner/notification/RunNotifier;->addFirstListener(Lorg/junit/runner/notification/RunListener;)V

    .line 13
    .line 14
    .line 15
    :try_start_0
    iget-object v2, p0, Lorg/junit/runner/JUnitCore;->notifier:Lorg/junit/runner/notification/RunNotifier;

    .line 16
    .line 17
    invoke-virtual {p1}, Lorg/junit/runner/Runner;->getDescription()Lorg/junit/runner/Description;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v2, v3}, Lorg/junit/runner/notification/RunNotifier;->fireTestRunStarted(Lorg/junit/runner/Description;)V

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Lorg/junit/runner/JUnitCore;->notifier:Lorg/junit/runner/notification/RunNotifier;

    .line 25
    .line 26
    invoke-virtual {p1, v2}, Lorg/junit/runner/Runner;->run(Lorg/junit/runner/notification/RunNotifier;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lorg/junit/runner/JUnitCore;->notifier:Lorg/junit/runner/notification/RunNotifier;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lorg/junit/runner/notification/RunNotifier;->fireTestRunFinished(Lorg/junit/runner/Result;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v1}, Lorg/junit/runner/JUnitCore;->removeListener(Lorg/junit/runner/notification/RunListener;)V

    .line 35
    .line 36
    .line 37
    return-object v0

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    invoke-virtual {p0, v1}, Lorg/junit/runner/JUnitCore;->removeListener(Lorg/junit/runner/notification/RunListener;)V

    .line 40
    .line 41
    .line 42
    throw p1
.end method

.method public varargs run([Ljava/lang/Class;)Lorg/junit/runner/Result;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class<",
            "*>;)",
            "Lorg/junit/runner/Result;"
        }
    .end annotation

    .line 46
    invoke-static {}, Lorg/junit/runner/JUnitCore;->defaultComputer()Lorg/junit/runner/Computer;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/junit/runner/JUnitCore;->run(Lorg/junit/runner/Computer;[Ljava/lang/Class;)Lorg/junit/runner/Result;

    move-result-object p0

    return-object p0
.end method

.method public varargs runMain(Lorg/junit/internal/JUnitSystem;[Ljava/lang/String;)Lorg/junit/runner/Result;
    .locals 3

    .line 1
    invoke-interface {p1}, Lorg/junit/internal/JUnitSystem;->out()Ljava/io/PrintStream;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "JUnit version "

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/p9l0;->a()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p2}, Lorg/junit/runner/JUnitCommandLineParseResult;->parse([Ljava/lang/String;)Lorg/junit/runner/JUnitCommandLineParseResult;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    new-instance v0, Lorg/junit/internal/TextListener;

    .line 31
    .line 32
    invoke-direct {v0, p1}, Lorg/junit/internal/TextListener;-><init>(Lorg/junit/internal/JUnitSystem;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lorg/junit/runner/JUnitCore;->addListener(Lorg/junit/runner/notification/RunListener;)V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Lorg/junit/runner/JUnitCore;->defaultComputer()Lorg/junit/runner/Computer;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p2, p1}, Lorg/junit/runner/JUnitCommandLineParseResult;->createRequest(Lorg/junit/runner/Computer;)Lorg/junit/runner/Request;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0, p1}, Lorg/junit/runner/JUnitCore;->run(Lorg/junit/runner/Request;)Lorg/junit/runner/Result;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method
