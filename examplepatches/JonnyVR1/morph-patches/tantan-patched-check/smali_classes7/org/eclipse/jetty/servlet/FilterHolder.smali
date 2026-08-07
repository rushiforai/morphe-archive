.class public Lorg/eclipse/jetty/servlet/FilterHolder;
.super Lorg/eclipse/jetty/servlet/Holder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/servlet/FilterHolder$Config;,
        Lorg/eclipse/jetty/servlet/FilterHolder$Registration;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jetty/servlet/Holder<",
        "Ll/gli;",
        ">;"
    }
.end annotation


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;


# instance fields
.field private transient _config:Lorg/eclipse/jetty/servlet/FilterHolder$Config;

.field private transient _filter:Ll/gli;

.field private transient _registration:Ll/umi$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/servlet/FilterHolder;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/servlet/FilterHolder;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 11
    sget-object v0, Lorg/eclipse/jetty/servlet/Holder$Source;->EMBEDDED:Lorg/eclipse/jetty/servlet/Holder$Source;

    invoke-direct {p0, v0}, Lorg/eclipse/jetty/servlet/Holder;-><init>(Lorg/eclipse/jetty/servlet/Holder$Source;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Ll/gli;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lorg/eclipse/jetty/servlet/Holder$Source;->EMBEDDED:Lorg/eclipse/jetty/servlet/Holder$Source;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lorg/eclipse/jetty/servlet/Holder;-><init>(Lorg/eclipse/jetty/servlet/Holder$Source;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/servlet/Holder;->setHeldClass(Ljava/lang/Class;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ll/gli;)V
    .locals 1

    .line 12
    sget-object v0, Lorg/eclipse/jetty/servlet/Holder$Source;->EMBEDDED:Lorg/eclipse/jetty/servlet/Holder$Source;

    invoke-direct {p0, v0}, Lorg/eclipse/jetty/servlet/Holder;-><init>(Lorg/eclipse/jetty/servlet/Holder$Source;)V

    .line 13
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/servlet/FilterHolder;->setFilter(Ll/gli;)V

    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jetty/servlet/Holder$Source;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/servlet/Holder;-><init>(Lorg/eclipse/jetty/servlet/Holder$Source;)V

    return-void
.end method


# virtual methods
.method public destroyInstance(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    check-cast p1, Ll/gli;

    .line 5
    .line 6
    invoke-interface {p1}, Ll/gli;->destroy()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lorg/eclipse/jetty/servlet/Holder;->getServletHandler()Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/servlet/ServletHandler;->destroyFilter(Ll/gli;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public doStart()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Lorg/eclipse/jetty/servlet/Holder;->doStart()V

    .line 2
    .line 3
    .line 4
    const-class v0, Ll/gli;

    .line 5
    .line 6
    iget-object v1, p0, Lorg/eclipse/jetty/servlet/Holder;->_class:Ljava/lang/Class;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_3

    .line 13
    .line 14
    iget-object v0, p0, Lorg/eclipse/jetty/servlet/FilterHolder;->_filter:Ll/gli;

    .line 15
    .line 16
    if-nez v0, :cond_2

    .line 17
    .line 18
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/servlet/Holder;->_servletHandler:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 19
    .line 20
    invoke-virtual {v0}, Lorg/eclipse/jetty/servlet/ServletHandler;->getServletContext()Ll/ase0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lorg/eclipse/jetty/servlet/ServletContextHandler$Context;

    .line 25
    .line 26
    invoke-virtual {p0}, Lorg/eclipse/jetty/servlet/Holder;->getHeldClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/servlet/ServletContextHandler$Context;->createFilter(Ljava/lang/Class;)Ll/gli;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Lorg/eclipse/jetty/servlet/FilterHolder;->_filter:Ll/gli;
    :try_end_0
    .catch Ljavax/servlet/ServletException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move-exception p0

    .line 38
    invoke-virtual {p0}, Ljavax/servlet/ServletException;->getRootCause()Ljava/lang/Throwable;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    instance-of v1, v0, Ljava/lang/InstantiationException;

    .line 43
    .line 44
    if-nez v1, :cond_1

    .line 45
    .line 46
    instance-of v1, v0, Ljava/lang/IllegalAccessException;

    .line 47
    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    check-cast v0, Ljava/lang/IllegalAccessException;

    .line 51
    .line 52
    throw v0

    .line 53
    :cond_0
    throw p0

    .line 54
    :cond_1
    check-cast v0, Ljava/lang/InstantiationException;

    .line 55
    .line 56
    throw v0

    .line 57
    :cond_2
    :goto_0
    new-instance v0, Lorg/eclipse/jetty/servlet/FilterHolder$Config;

    .line 58
    .line 59
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/servlet/FilterHolder$Config;-><init>(Lorg/eclipse/jetty/servlet/FilterHolder;)V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Lorg/eclipse/jetty/servlet/FilterHolder;->_config:Lorg/eclipse/jetty/servlet/FilterHolder$Config;

    .line 63
    .line 64
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/FilterHolder;->_filter:Ll/gli;

    .line 65
    .line 66
    invoke-interface {p0, v0}, Ll/gli;->init(Ll/sli;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .line 74
    .line 75
    iget-object v1, p0, Lorg/eclipse/jetty/servlet/Holder;->_class:Ljava/lang/Class;

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string v1, " is not a javax.servlet.Filter"

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-super {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->stop()V

    .line 90
    .line 91
    .line 92
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public doStop()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/servlet/FilterHolder;->_filter:Ll/gli;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/servlet/FilterHolder;->destroyInstance(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catch_0
    move-exception v0

    .line 10
    sget-object v1, Lorg/eclipse/jetty/servlet/FilterHolder;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 11
    .line 12
    invoke-interface {v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    :goto_0
    iget-boolean v0, p0, Lorg/eclipse/jetty/servlet/Holder;->_extInstance:Z

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iput-object v1, p0, Lorg/eclipse/jetty/servlet/FilterHolder;->_filter:Ll/gli;

    .line 21
    .line 22
    :cond_1
    iput-object v1, p0, Lorg/eclipse/jetty/servlet/FilterHolder;->_config:Lorg/eclipse/jetty/servlet/FilterHolder$Config;

    .line 23
    .line 24
    invoke-super {p0}, Lorg/eclipse/jetty/servlet/Holder;->doStop()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public getFilter()Ll/gli;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/FilterHolder;->_filter:Ll/gli;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRegistration()Ll/umi$a;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/servlet/FilterHolder;->_registration:Ll/umi$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lorg/eclipse/jetty/servlet/FilterHolder$Registration;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lorg/eclipse/jetty/servlet/FilterHolder$Registration;-><init>(Lorg/eclipse/jetty/servlet/FilterHolder;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lorg/eclipse/jetty/servlet/FilterHolder;->_registration:Ll/umi$a;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/FilterHolder;->_registration:Ll/umi$a;

    .line 13
    .line 14
    return-object p0
.end method

.method public declared-synchronized setFilter(Ll/gli;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Lorg/eclipse/jetty/servlet/FilterHolder;->_filter:Ll/gli;

    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lorg/eclipse/jetty/servlet/Holder;->_extInstance:Z

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/servlet/Holder;->setHeldClass(Ljava/lang/Class;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lorg/eclipse/jetty/servlet/Holder;->getName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/servlet/Holder;->setName(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p1

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :goto_0
    monitor-exit p0

    .line 35
    return-void

    .line 36
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    throw p1
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/servlet/Holder;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
