.class public Lorg/eclipse/jetty/continuation/ContinuationSupport;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static final __jetty6:Z

.field static final __newJetty6Continuation:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor<",
            "+",
            "Lorg/eclipse/jetty/continuation/Continuation;",
            ">;"
        }
    .end annotation
.end field

.field static final __newServlet3Continuation:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor<",
            "+",
            "Lorg/eclipse/jetty/continuation/Continuation;",
            ">;"
        }
    .end annotation
.end field

.field static final __servlet3:Z

.field static final __waitingContinuation:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    const-class v0, Lorg/eclipse/jetty/continuation/Continuation;

    .line 2
    .line 3
    const-class v1, Ll/gse0;

    .line 4
    .line 5
    const-class v2, Lorg/eclipse/jetty/continuation/ContinuationSupport;

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    const/4 v4, 0x0

    .line 9
    const/4 v5, 0x0

    .line 10
    :try_start_0
    const-string v6, "startAsync"

    .line 11
    .line 12
    invoke-virtual {v1, v6, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 13
    .line 14
    .line 15
    move-result-object v6

    .line 16
    if-eqz v6, :cond_0

    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 19
    .line 20
    .line 21
    move-result-object v6

    .line 22
    const-string v7, "org.eclipse.jetty.continuation.Servlet3Continuation"

    .line 23
    .line 24
    invoke-virtual {v6, v7}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    move-result-object v6

    .line 28
    invoke-virtual {v6, v0}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    move-result-object v6

    .line 32
    filled-new-array {v1}, [Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    move-result-object v7

    .line 36
    invoke-virtual {v6, v7}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 37
    .line 38
    .line 39
    move-result-object v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    move v7, v3

    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception v0

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    move v7, v4

    .line 45
    move-object v6, v5

    .line 46
    :goto_0
    sput-boolean v7, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__servlet3:Z

    .line 47
    .line 48
    sput-object v6, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__newServlet3Continuation:Ljava/lang/reflect/Constructor;

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :goto_1
    sput-boolean v4, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__servlet3:Z

    .line 52
    .line 53
    sput-object v5, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__newServlet3Continuation:Ljava/lang/reflect/Constructor;

    .line 54
    .line 55
    throw v0

    .line 56
    :catch_0
    sput-boolean v4, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__servlet3:Z

    .line 57
    .line 58
    sput-object v5, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__newServlet3Continuation:Ljava/lang/reflect/Constructor;

    .line 59
    .line 60
    :goto_2
    :try_start_1
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    const-string v7, "org.mortbay.util.ajax.Continuation"

    .line 65
    .line 66
    invoke-virtual {v6, v7}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    if-eqz v6, :cond_1

    .line 71
    .line 72
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 73
    .line 74
    .line 75
    move-result-object v7

    .line 76
    const-string v8, "org.eclipse.jetty.continuation.Jetty6Continuation"

    .line 77
    .line 78
    invoke-virtual {v7, v8}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    invoke-virtual {v7, v0}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    filled-new-array {v1, v6}, [Ljava/lang/Class;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 91
    .line 92
    .line 93
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 94
    goto :goto_3

    .line 95
    :catchall_1
    move-exception v0

    .line 96
    goto :goto_4

    .line 97
    :cond_1
    move v3, v4

    .line 98
    move-object v0, v5

    .line 99
    :goto_3
    sput-boolean v3, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__jetty6:Z

    .line 100
    .line 101
    sput-object v0, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__newJetty6Continuation:Ljava/lang/reflect/Constructor;

    .line 102
    .line 103
    goto :goto_5

    .line 104
    :goto_4
    sput-boolean v4, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__jetty6:Z

    .line 105
    .line 106
    sput-object v5, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__newJetty6Continuation:Ljava/lang/reflect/Constructor;

    .line 107
    .line 108
    throw v0

    .line 109
    :catch_1
    sput-boolean v4, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__jetty6:Z

    .line 110
    .line 111
    sput-object v5, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__newJetty6Continuation:Ljava/lang/reflect/Constructor;

    .line 112
    .line 113
    :goto_5
    :try_start_2
    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    const-string v1, "org.mortbay.util.ajax.WaitingContinuation"

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 120
    .line 121
    .line 122
    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 123
    sput-object v0, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__waitingContinuation:Ljava/lang/Class;

    .line 124
    .line 125
    goto :goto_6

    .line 126
    :catchall_2
    move-exception v0

    .line 127
    sput-object v5, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__waitingContinuation:Ljava/lang/Class;

    .line 128
    .line 129
    throw v0

    .line 130
    :catch_2
    sput-object v5, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__waitingContinuation:Ljava/lang/Class;

    .line 131
    .line 132
    :goto_6
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getContinuation(Ll/gse0;)Lorg/eclipse/jetty/continuation/Continuation;
    .locals 4

    .line 1
    const-string v0, "org.eclipse.jetty.continuation"

    .line 2
    .line 3
    invoke-interface {p0, v0}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Lorg/eclipse/jetty/continuation/Continuation;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    return-object v1

    .line 12
    :cond_0
    :goto_0
    instance-of v1, p0, Ll/kse0;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    check-cast p0, Ll/kse0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/kse0;->getRequest()Ll/gse0;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    sget-boolean v1, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__servlet3:Z

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    if-eqz v1, :cond_2

    .line 27
    .line 28
    :try_start_0
    sget-object v1, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__newServlet3Continuation:Ljava/lang/reflect/Constructor;

    .line 29
    .line 30
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v1, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Lorg/eclipse/jetty/continuation/Continuation;

    .line 39
    .line 40
    invoke-interface {p0, v0, v1}, Ll/gse0;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    .line 43
    return-object v1

    .line 44
    :catch_0
    move-exception p0

    .line 45
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    return-object v2

    .line 49
    :cond_2
    sget-boolean v1, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__jetty6:Z

    .line 50
    .line 51
    if-eqz v1, :cond_5

    .line 52
    .line 53
    const-string v1, "org.mortbay.jetty.ajax.Continuation"

    .line 54
    .line 55
    invoke-interface {p0, v1}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    if-eqz v1, :cond_4

    .line 60
    .line 61
    :try_start_1
    sget-object v3, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__waitingContinuation:Ljava/lang/Class;

    .line 62
    .line 63
    if-eqz v3, :cond_4

    .line 64
    .line 65
    invoke-virtual {v3, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-eqz v3, :cond_3

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_3
    sget-object v3, Lorg/eclipse/jetty/continuation/ContinuationSupport;->__newJetty6Continuation:Ljava/lang/reflect/Constructor;

    .line 73
    .line 74
    filled-new-array {p0, v1}, [Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v3, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    check-cast v1, Lorg/eclipse/jetty/continuation/Continuation;

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :catch_1
    move-exception p0

    .line 86
    goto :goto_3

    .line 87
    :cond_4
    :goto_1
    new-instance v1, Lorg/eclipse/jetty/continuation/FauxContinuation;

    .line 88
    .line 89
    invoke-direct {v1, p0}, Lorg/eclipse/jetty/continuation/FauxContinuation;-><init>(Ll/gse0;)V

    .line 90
    .line 91
    .line 92
    :goto_2
    invoke-interface {p0, v0, v1}, Ll/gse0;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 93
    .line 94
    .line 95
    return-object v1

    .line 96
    :goto_3
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 97
    .line 98
    .line 99
    return-object v2

    .line 100
    :cond_5
    const-string p0, "!(Jetty || Servlet 3.0 || ContinuationFilter)"

    .line 101
    .line 102
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    return-object v2
.end method

.method public static getContinuation(Ll/gse0;Ll/lse0;)Lorg/eclipse/jetty/continuation/Continuation;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 106
    invoke-static {p0}, Lorg/eclipse/jetty/continuation/ContinuationSupport;->getContinuation(Ll/gse0;)Lorg/eclipse/jetty/continuation/Continuation;

    move-result-object p0

    return-object p0
.end method
