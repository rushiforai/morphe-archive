.class public abstract Lorg/fourthline/cling/support/shared/Main;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/support/shared/ShutdownHandler;
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# instance fields
.field protected final errorWindow:Ljavax/swing/JFrame;

.field protected isRegularShutdown:Z

.field logPresenter:Lorg/fourthline/cling/support/shared/log/LogView$Presenter;

.field protected final loggingHandler:Lorg/seamless/swing/logging/LoggingHandler;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljavax/swing/JFrame;

    .line 5
    .line 6
    invoke-direct {v0}, Ljavax/swing/JFrame;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/fourthline/cling/support/shared/Main;->errorWindow:Ljavax/swing/JFrame;

    .line 10
    .line 11
    new-instance v0, Lorg/fourthline/cling/support/shared/Main$1;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lorg/fourthline/cling/support/shared/Main$1;-><init>(Lorg/fourthline/cling/support/shared/Main;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lorg/fourthline/cling/support/shared/Main;->loggingHandler:Lorg/seamless/swing/logging/LoggingHandler;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public abstract getAppName()Ljava/lang/String;
.end method

.method public init()V
    .locals 4

    .line 1
    :try_start_0
    invoke-static {}, Lorg/seamless/util/OS;->checkForMac()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/fourthline/cling/support/shared/Main;->getAppName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p0, v0}, Lorg/fourthline/cling/support/shared/NewPlatformApple;->setup(Lorg/fourthline/cling/support/shared/ShutdownHandler;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {}, Ljavax/swing/UIManager;->getSystemLookAndFeelClassName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Ljavax/swing/UIManager;->setLookAndFeel(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    :catch_0
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/Main;->errorWindow:Ljavax/swing/JFrame;

    .line 22
    .line 23
    new-instance v1, Ljava/awt/Dimension;

    .line 24
    .line 25
    const/16 v2, 0x384

    .line 26
    .line 27
    const/16 v3, 0x190

    .line 28
    .line 29
    invoke-direct {v1, v2, v3}, Ljava/awt/Dimension;-><init>(II)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljavax/swing/JFrame;->setPreferredSize(Ljava/awt/Dimension;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lorg/fourthline/cling/support/shared/Main;->errorWindow:Ljavax/swing/JFrame;

    .line 36
    .line 37
    new-instance v1, Lorg/fourthline/cling/support/shared/Main$2;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Lorg/fourthline/cling/support/shared/Main$2;-><init>(Lorg/fourthline/cling/support/shared/Main;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljavax/swing/JFrame;->addWindowListener(Ljava/awt/event/WindowListener;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Lorg/fourthline/cling/support/shared/Main$3;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Lorg/fourthline/cling/support/shared/Main$3;-><init>(Lorg/fourthline/cling/support/shared/Main;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/Runtime;->addShutdownHook(Ljava/lang/Thread;)V

    .line 58
    .line 59
    .line 60
    const-string v0, "java.util.logging.config.file"

    .line 61
    .line 62
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    if-nez v0, :cond_1

    .line 67
    .line 68
    const/4 v0, 0x1

    .line 69
    new-array v0, v0, [Ljava/util/logging/Handler;

    .line 70
    .line 71
    const/4 v1, 0x0

    .line 72
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/Main;->loggingHandler:Lorg/seamless/swing/logging/LoggingHandler;

    .line 73
    .line 74
    aput-object p0, v0, v1

    .line 75
    .line 76
    invoke-static {v0}, Lorg/seamless/util/logging/LoggingUtil;->resetRootHandler([Ljava/util/logging/Handler;)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    invoke-static {}, Ljava/util/logging/LogManager;->getLogManager()Ljava/util/logging/LogManager;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    const-string v1, ""

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/util/logging/LogManager;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/Main;->loggingHandler:Lorg/seamless/swing/logging/LoggingHandler;

    .line 91
    .line 92
    invoke-virtual {v0, p0}, Ljava/util/logging/Logger;->addHandler(Ljava/util/logging/Handler;)V

    .line 93
    .line 94
    .line 95
    :goto_0
    return-void
.end method

.method public removeLoggingHandler()V
    .locals 2

    .line 1
    invoke-static {}, Ljava/util/logging/LogManager;->getLogManager()Ljava/util/logging/LogManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/util/logging/LogManager;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Lorg/fourthline/cling/support/shared/Main;->loggingHandler:Lorg/seamless/swing/logging/LoggingHandler;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/util/logging/Logger;->removeHandler(Ljava/util/logging/Handler;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public shutdown()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lorg/fourthline/cling/support/shared/Main;->isRegularShutdown:Z

    .line 3
    .line 4
    new-instance v0, Lorg/fourthline/cling/support/shared/Main$4;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lorg/fourthline/cling/support/shared/Main$4;-><init>(Lorg/fourthline/cling/support/shared/Main;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "In thread \'"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p1, "\' uncaught exception: "

    .line 14
    .line 15
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    sget-object p1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 29
    .line 30
    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    .line 31
    .line 32
    .line 33
    new-instance p1, Lorg/fourthline/cling/support/shared/Main$5;

    .line 34
    .line 35
    invoke-direct {p1, p0, p2}, Lorg/fourthline/cling/support/shared/Main$5;-><init>(Lorg/fourthline/cling/support/shared/Main;Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p1}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
