.class public Lorg/eclipse/jetty/server/handler/ContextHandler$Context;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ase0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/server/handler/ContextHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Context"
.end annotation


# static fields
.field private static final __unimplmented:Ljava/lang/String; = "Unimplemented - use org.eclipse.jetty.servlet.ServletContextHandler"


# instance fields
.field protected _enabled:Z

.field protected _majorVersion:I

.field protected _minorVersion:I

.field final synthetic this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/handler/ContextHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x3

    .line 7
    iput p1, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->_majorVersion:I

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput p1, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->_minorVersion:I

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    iput-boolean p1, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->_enabled:Z

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public addFilter(Ljava/lang/String;Ljava/lang/Class;)Ll/umi$a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "+",
            "Ll/gli;",
            ">;)",
            "Ll/umi$a;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    new-array p1, p1, [Ljava/lang/Object;

    .line 7
    .line 8
    const-string p2, "Unimplemented - use org.eclipse.jetty.servlet.ServletContextHandler"

    .line 9
    .line 10
    invoke-interface {p0, p2, p1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public addFilter(Ljava/lang/String;Ljava/lang/String;)Ll/umi$a;
    .locals 0

    .line 16
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    move-result-object p0

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    const-string p2, "Unimplemented - use org.eclipse.jetty.servlet.ServletContextHandler"

    invoke-interface {p0, p2, p1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public addFilter(Ljava/lang/String;Ll/gli;)Ll/umi$a;
    .locals 0

    .line 15
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    move-result-object p0

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    const-string p2, "Unimplemented - use org.eclipse.jetty.servlet.ServletContextHandler"

    invoke-interface {p0, p2, p1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public addListener(Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Ljava/util/EventListener;",
            ">;)V"
        }
    .end annotation

    .line 46
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->_enabled:Z

    if-eqz v0, :cond_0

    .line 47
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->createListener(Ljava/lang/Class;)Ljava/util/EventListener;

    move-result-object p1

    .line 48
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->addEventListener(Ljava/util/EventListener;)V

    .line 49
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->restrictEventListener(Ljava/util/EventListener;)V
    :try_end_0
    .catch Ljavax/servlet/ServletException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 50
    invoke-static {p0}, Ll/tg3;->a(Ljava/lang/Throwable;)V

    return-void

    .line 51
    :cond_0
    invoke-static {}, Ll/l710;->a()V

    return-void
.end method

.method public addListener(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->_enabled:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 6
    .line 7
    invoke-static {v0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$700(Lorg/eclipse/jetty/server/handler/ContextHandler;)Ljava/lang/ClassLoader;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const-class v0, Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 14
    .line 15
    invoke-static {v0, p1}, Lorg/eclipse/jetty/util/Loader;->loadClass(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 21
    .line 22
    invoke-static {v0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$700(Lorg/eclipse/jetty/server/handler/ContextHandler;)Ljava/lang/ClassLoader;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    :goto_0
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->addListener(Ljava/lang/Class;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catch_0
    move-exception p0

    .line 35
    invoke-static {p0}, Ll/tg3;->a(Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    invoke-static {}, Ll/l710;->a()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public addListener(Ljava/util/EventListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/util/EventListener;",
            ">(TT;)V"
        }
    .end annotation

    .line 43
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->_enabled:Z

    if-eqz v0, :cond_0

    .line 44
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->addEventListener(Ljava/util/EventListener;)V

    return-void

    .line 45
    :cond_0
    invoke-static {}, Ll/l710;->a()V

    return-void
.end method

.method public addServlet(Ljava/lang/String;Ljava/lang/Class;)Ll/fse0$a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "+",
            "Ll/yre0;",
            ">;)",
            "Ll/fse0$a;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    new-array p1, p1, [Ljava/lang/Object;

    .line 7
    .line 8
    const-string p2, "Unimplemented - use org.eclipse.jetty.servlet.ServletContextHandler"

    .line 9
    .line 10
    invoke-interface {p0, p2, p1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public addServlet(Ljava/lang/String;Ljava/lang/String;)Ll/fse0$a;
    .locals 0

    .line 16
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    move-result-object p0

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    const-string p2, "Unimplemented - use org.eclipse.jetty.servlet.ServletContextHandler"

    invoke-interface {p0, p2, p1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public addServlet(Ljava/lang/String;Ll/yre0;)Ll/fse0$a;
    .locals 0

    .line 15
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    move-result-object p0

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    const-string p2, "Unimplemented - use org.eclipse.jetty.servlet.ServletContextHandler"

    invoke-interface {p0, p2, p1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public createFilter(Ljava/lang/Class;)Ll/gli;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ll/gli;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .line 1
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    new-array p1, p1, [Ljava/lang/Object;

    .line 7
    .line 8
    const-string v0, "Unimplemented - use org.eclipse.jetty.servlet.ServletContextHandler"

    .line 9
    .line 10
    invoke-interface {p0, v0, p1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public createListener(Ljava/lang/Class;)Ljava/util/EventListener;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/util/EventListener;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/util/EventListener;
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    new-instance p1, Ljavax/servlet/ServletException;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    throw p1

    .line 15
    :catch_1
    move-exception p0

    .line 16
    new-instance p1, Ljavax/servlet/ServletException;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    throw p1
.end method

.method public createServlet(Ljava/lang/Class;)Ll/yre0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ll/yre0;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .line 1
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    new-array p1, p1, [Ljava/lang/Object;

    .line 7
    .line 8
    const-string v0, "Unimplemented - use org.eclipse.jetty.servlet.ServletContextHandler"

    .line 9
    .line 10
    invoke-interface {p0, v0, p1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public varargs declareRoles([Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 2
    .line 3
    invoke-virtual {p1}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isStarting()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->_enabled:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {}, Ll/l710;->a()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    invoke-static {}, Ll/wpg0;->a()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public declared-synchronized getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 11
    .line 12
    invoke-static {v1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$300(Lorg/eclipse/jetty/server/handler/ContextHandler;)Lorg/eclipse/jetty/util/AttributesMap;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 19
    .line 20
    invoke-static {v0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$300(Lorg/eclipse/jetty/server/handler/ContextHandler;)Lorg/eclipse/jetty/util/AttributesMap;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/util/AttributesMap;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p1

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    :goto_0
    monitor-exit p0

    .line 32
    return-object v0

    .line 33
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    throw p1
.end method

.method public declared-synchronized getAttributeNames()Ljava/util/Enumeration;
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Ljava/util/HashSet;

    .line 3
    .line 4
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 8
    .line 9
    invoke-static {v1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$300(Lorg/eclipse/jetty/server/handler/ContextHandler;)Lorg/eclipse/jetty/util/AttributesMap;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 16
    .line 17
    invoke-static {v1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$300(Lorg/eclipse/jetty/server/handler/ContextHandler;)Lorg/eclipse/jetty/util/AttributesMap;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Lorg/eclipse/jetty/util/AttributesMap;->getAttributeNames()Ljava/util/Enumeration;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception v0

    .line 40
    goto :goto_2

    .line 41
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 42
    .line 43
    invoke-static {v1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$400(Lorg/eclipse/jetty/server/handler/ContextHandler;)Lorg/eclipse/jetty/util/AttributesMap;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1}, Lorg/eclipse/jetty/util/AttributesMap;->getAttributeNames()Ljava/util/Enumeration;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    :goto_1
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_1

    .line 56
    .line 57
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    .line 66
    .line 67
    .line 68
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    monitor-exit p0

    .line 70
    return-object v0

    .line 71
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 72
    throw v0
.end method

.method public getClassLoader()Ljava/lang/ClassLoader;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/RuntimePermission;

    .line 2
    .line 3
    const-string v1, "getClassLoader"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/RuntimePermission;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ljava/security/AccessController;->checkPermission(Ljava/security/Permission;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 12
    .line 13
    invoke-static {p0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$700(Lorg/eclipse/jetty/server/handler/ContextHandler;)Ljava/lang/ClassLoader;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public getContext(Ljava/lang/String;)Ll/ase0;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    new-instance v2, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v3, v0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 11
    .line 12
    invoke-virtual {v3}, Lorg/eclipse/jetty/server/handler/AbstractHandler;->getServer()Lorg/eclipse/jetty/server/Server;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    const-class v4, Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 17
    .line 18
    invoke-virtual {v3, v4}, Lorg/eclipse/jetty/server/handler/AbstractHandlerContainer;->getChildHandlersByClass(Ljava/lang/Class;)[Lorg/eclipse/jetty/server/Handler;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    array-length v4, v3

    .line 23
    const/4 v7, 0x0

    .line 24
    const/4 v8, 0x0

    .line 25
    :goto_0
    const-string v9, "/"

    .line 26
    .line 27
    const/16 v10, 0x2f

    .line 28
    .line 29
    if-ge v7, v4, :cond_d

    .line 30
    .line 31
    aget-object v11, v3, v7

    .line 32
    .line 33
    if-nez v11, :cond_0

    .line 34
    .line 35
    goto/16 :goto_5

    .line 36
    .line 37
    :cond_0
    check-cast v11, Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 38
    .line 39
    invoke-virtual {v11}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getContextPath()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v12

    .line 43
    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v13

    .line 47
    if-nez v13, :cond_2

    .line 48
    .line 49
    invoke-virtual {v1, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result v13

    .line 53
    if-eqz v13, :cond_1

    .line 54
    .line 55
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    .line 56
    .line 57
    .line 58
    move-result v13

    .line 59
    invoke-virtual {v1, v13}, Ljava/lang/String;->charAt(I)C

    .line 60
    .line 61
    .line 62
    move-result v13

    .line 63
    if-eq v13, v10, :cond_2

    .line 64
    .line 65
    :cond_1
    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v9

    .line 69
    if-eqz v9, :cond_8

    .line 70
    .line 71
    :cond_2
    iget-object v9, v0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 72
    .line 73
    invoke-virtual {v9}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getVirtualHosts()[Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v9

    .line 77
    if-eqz v9, :cond_9

    .line 78
    .line 79
    iget-object v9, v0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 80
    .line 81
    invoke-virtual {v9}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getVirtualHosts()[Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v9

    .line 85
    array-length v9, v9

    .line 86
    if-lez v9, :cond_9

    .line 87
    .line 88
    invoke-virtual {v11}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getVirtualHosts()[Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v9

    .line 92
    if-eqz v9, :cond_8

    .line 93
    .line 94
    invoke-virtual {v11}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getVirtualHosts()[Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v9

    .line 98
    array-length v9, v9

    .line 99
    if-lez v9, :cond_8

    .line 100
    .line 101
    iget-object v9, v0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 102
    .line 103
    invoke-virtual {v9}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getVirtualHosts()[Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v9

    .line 107
    array-length v10, v9

    .line 108
    const/4 v13, 0x0

    .line 109
    :goto_1
    if-ge v13, v10, :cond_8

    .line 110
    .line 111
    aget-object v14, v9, v13

    .line 112
    .line 113
    invoke-virtual {v11}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getVirtualHosts()[Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v15

    .line 117
    const/16 v16, 0x0

    .line 118
    .line 119
    array-length v5, v15

    .line 120
    const/4 v6, 0x0

    .line 121
    :goto_2
    if-ge v6, v5, :cond_7

    .line 122
    .line 123
    aget-object v0, v15, v6

    .line 124
    .line 125
    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-eqz v0, :cond_5

    .line 130
    .line 131
    if-eqz v8, :cond_3

    .line 132
    .line 133
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    move/from16 v17, v4

    .line 138
    .line 139
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 140
    .line 141
    .line 142
    move-result v4

    .line 143
    if-le v0, v4, :cond_4

    .line 144
    .line 145
    goto :goto_3

    .line 146
    :cond_3
    move/from16 v17, v4

    .line 147
    .line 148
    :goto_3
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 149
    .line 150
    .line 151
    move-object v8, v12

    .line 152
    :cond_4
    invoke-virtual {v8, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    if-eqz v0, :cond_6

    .line 157
    .line 158
    invoke-interface {v2, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    goto :goto_4

    .line 162
    :cond_5
    move/from16 v17, v4

    .line 163
    .line 164
    :cond_6
    :goto_4
    add-int/lit8 v6, v6, 0x1

    .line 165
    .line 166
    move-object/from16 v0, p0

    .line 167
    .line 168
    move/from16 v4, v17

    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_7
    move/from16 v17, v4

    .line 172
    .line 173
    add-int/lit8 v13, v13, 0x1

    .line 174
    .line 175
    move-object/from16 v0, p0

    .line 176
    .line 177
    goto :goto_1

    .line 178
    :cond_8
    :goto_5
    move/from16 v17, v4

    .line 179
    .line 180
    const/16 v16, 0x0

    .line 181
    .line 182
    goto :goto_6

    .line 183
    :cond_9
    move/from16 v17, v4

    .line 184
    .line 185
    const/16 v16, 0x0

    .line 186
    .line 187
    if-eqz v8, :cond_a

    .line 188
    .line 189
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 194
    .line 195
    .line 196
    move-result v4

    .line 197
    if-le v0, v4, :cond_b

    .line 198
    .line 199
    :cond_a
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 200
    .line 201
    .line 202
    move-object v8, v12

    .line 203
    :cond_b
    invoke-virtual {v8, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    if-eqz v0, :cond_c

    .line 208
    .line 209
    invoke-interface {v2, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    :cond_c
    :goto_6
    add-int/lit8 v7, v7, 0x1

    .line 213
    .line 214
    move-object/from16 v0, p0

    .line 215
    .line 216
    move/from16 v4, v17

    .line 217
    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :cond_d
    const/16 v16, 0x0

    .line 221
    .line 222
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    if-lez v0, :cond_e

    .line 227
    .line 228
    const/4 v0, 0x0

    .line 229
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    check-cast v0, Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 234
    .line 235
    iget-object v0, v0, Lorg/eclipse/jetty/server/handler/ContextHandler;->_scontext:Lorg/eclipse/jetty/server/handler/ContextHandler$Context;

    .line 236
    .line 237
    return-object v0

    .line 238
    :cond_e
    array-length v0, v3

    .line 239
    move-object/from16 v5, v16

    .line 240
    .line 241
    const/4 v4, 0x0

    .line 242
    :goto_7
    if-ge v4, v0, :cond_15

    .line 243
    .line 244
    aget-object v6, v3, v4

    .line 245
    .line 246
    if-nez v6, :cond_f

    .line 247
    .line 248
    goto :goto_8

    .line 249
    :cond_f
    check-cast v6, Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 250
    .line 251
    invoke-virtual {v6}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getContextPath()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v7

    .line 255
    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result v8

    .line 259
    if-nez v8, :cond_11

    .line 260
    .line 261
    invoke-virtual {v1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 262
    .line 263
    .line 264
    move-result v8

    .line 265
    if-eqz v8, :cond_10

    .line 266
    .line 267
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 268
    .line 269
    .line 270
    move-result v8

    .line 271
    invoke-virtual {v1, v8}, Ljava/lang/String;->charAt(I)C

    .line 272
    .line 273
    .line 274
    move-result v8

    .line 275
    if-eq v8, v10, :cond_11

    .line 276
    .line 277
    :cond_10
    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 278
    .line 279
    .line 280
    move-result v8

    .line 281
    if-eqz v8, :cond_14

    .line 282
    .line 283
    :cond_11
    if-eqz v5, :cond_12

    .line 284
    .line 285
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 286
    .line 287
    .line 288
    move-result v8

    .line 289
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 290
    .line 291
    .line 292
    move-result v11

    .line 293
    if-le v8, v11, :cond_13

    .line 294
    .line 295
    :cond_12
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 296
    .line 297
    .line 298
    move-object v5, v7

    .line 299
    :cond_13
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 300
    .line 301
    .line 302
    move-result v7

    .line 303
    if-eqz v7, :cond_14

    .line 304
    .line 305
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 306
    .line 307
    .line 308
    :cond_14
    :goto_8
    add-int/lit8 v4, v4, 0x1

    .line 309
    .line 310
    goto :goto_7

    .line 311
    :cond_15
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 312
    .line 313
    .line 314
    move-result v0

    .line 315
    if-lez v0, :cond_16

    .line 316
    .line 317
    const/4 v0, 0x0

    .line 318
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    move-result-object v0

    .line 322
    check-cast v0, Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 323
    .line 324
    iget-object v0, v0, Lorg/eclipse/jetty/server/handler/ContextHandler;->_scontext:Lorg/eclipse/jetty/server/handler/ContextHandler$Context;

    .line 325
    .line 326
    return-object v0

    .line 327
    :cond_16
    return-object v16
.end method

.method public getContextHandler()Lorg/eclipse/jetty/server/handler/ContextHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContextPath()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$600(Lorg/eclipse/jetty/server/handler/ContextHandler;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 10
    .line 11
    invoke-static {v0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$600(Lorg/eclipse/jetty/server/handler/ContextHandler;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "/"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const-string p0, ""

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 27
    .line 28
    invoke-static {p0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$600(Lorg/eclipse/jetty/server/handler/ContextHandler;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public getDefaultSessionTrackingModes()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljavax/servlet/SessionTrackingMode;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    new-array v0, v0, [Ljava/lang/Object;

    .line 7
    .line 8
    const-string v1, "Unimplemented - use org.eclipse.jetty.servlet.ServletContextHandler"

    .line 9
    .line 10
    invoke-interface {p0, v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public getEffectiveMajorVersion()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->_majorVersion:I

    .line 2
    .line 3
    return p0
.end method

.method public getEffectiveMinorVersion()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->_minorVersion:I

    .line 2
    .line 3
    return p0
.end method

.method public getEffectiveSessionTrackingModes()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljavax/servlet/SessionTrackingMode;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    new-array v0, v0, [Ljava/lang/Object;

    .line 7
    .line 8
    const-string v1, "Unimplemented - use org.eclipse.jetty.servlet.ServletContextHandler"

    .line 9
    .line 10
    invoke-interface {p0, v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public getFilterRegistration(Ljava/lang/String;)Ll/umi;
    .locals 1

    .line 1
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    new-array p1, p1, [Ljava/lang/Object;

    .line 7
    .line 8
    const-string v0, "Unimplemented - use org.eclipse.jetty.servlet.ServletContextHandler"

    .line 9
    .line 10
    invoke-interface {p0, v0, p1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public getFilterRegistrations()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ll/umi;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    new-array v0, v0, [Ljava/lang/Object;

    .line 7
    .line 8
    const-string v1, "Unimplemented - use org.eclipse.jetty.servlet.ServletContextHandler"

    .line 9
    .line 10
    invoke-interface {p0, v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public getInitParameter(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getInitParameterNames()Ljava/util/Enumeration;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getInitParameterNames()Ljava/util/Enumeration;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getJspConfigDescriptor()Ll/zrq;
    .locals 2

    .line 1
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    new-array v0, v0, [Ljava/lang/Object;

    .line 7
    .line 8
    const-string v1, "Unimplemented - use org.eclipse.jetty.servlet.ServletContextHandler"

    .line 9
    .line 10
    invoke-interface {p0, v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public getMajorVersion()I
    .locals 0

    const/4 p0, 0x3

    return p0
.end method

.method public getMimeType(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$000(Lorg/eclipse/jetty/server/handler/ContextHandler;)Lorg/eclipse/jetty/http/MimeTypes;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 12
    .line 13
    invoke-static {p0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$000(Lorg/eclipse/jetty/server/handler/ContextHandler;)Lorg/eclipse/jetty/http/MimeTypes;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/http/MimeTypes;->getMimeByExtension(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_1
    return-object v1
.end method

.method public getMinorVersion()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getNamedDispatcher(Ljava/lang/String;)Ll/c2d0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getRealPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const-string v2, "/"

    .line 10
    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    move-object p1, v2

    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/16 v3, 0x2f

    .line 21
    .line 22
    if-eq v1, v3, :cond_2

    .line 23
    .line 24
    invoke-virtual {v2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    :cond_2
    :goto_0
    :try_start_0
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getResource(Ljava/lang/String;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    if-eqz p0, :cond_3

    .line 35
    .line 36
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/resource/Resource;->getFile()Ljava/io/File;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    if-eqz p0, :cond_3

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    return-object p0

    .line 47
    :catch_0
    move-exception p0

    .line 48
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-interface {p1, p0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    :cond_3
    return-object v0
.end method

.method public getRequestDispatcher(Ljava/lang/String;)Ll/c2d0;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    const-string v1, "/"

    .line 6
    .line 7
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_1
    const/16 v1, 0x3f

    .line 15
    .line 16
    :try_start_0
    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-lez v1, :cond_2

    .line 21
    .line 22
    add-int/lit8 v2, v1, 0x1

    .line 23
    .line 24
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const/4 v3, 0x0

    .line 29
    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    goto :goto_0

    .line 34
    :catch_0
    move-exception p0

    .line 35
    goto :goto_1

    .line 36
    :cond_2
    move-object v2, v0

    .line 37
    :goto_0
    invoke-static {p1}, Lorg/eclipse/jetty/util/URIUtil;->decodePath(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v1}, Lorg/eclipse/jetty/util/URIUtil;->canonicalPath(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->getContextPath()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-static {v3, p1}, Lorg/eclipse/jetty/util/URIUtil;->addPaths(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 54
    .line 55
    new-instance v3, Lorg/eclipse/jetty/server/Dispatcher;

    .line 56
    .line 57
    invoke-direct {v3, p0, p1, v1, v2}, Lorg/eclipse/jetty/server/Dispatcher;-><init>(Lorg/eclipse/jetty/server/handler/ContextHandler;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .line 59
    .line 60
    return-object v3

    .line 61
    :goto_1
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-interface {p1, p0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 66
    .line 67
    .line 68
    return-object v0
.end method

.method public getResource(Ljava/lang/String;)Ljava/net/URL;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getResource(Ljava/lang/String;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/resource/Resource;->exists()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/resource/Resource;->getURL()Ljava/net/URL;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->getResource(Ljava/lang/String;)Ljava/net/URL;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    invoke-static {p0}, Lorg/eclipse/jetty/util/resource/Resource;->newResource(Ljava/net/URL;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/resource/Resource;->getInputStream()Ljava/io/InputStream;

    .line 14
    .line 15
    .line 16
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    return-object p0

    .line 18
    :catch_0
    move-exception p0

    .line 19
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {p1, p0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    return-object v0
.end method

.method public getResourcePaths(Ljava/lang/String;)Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getResourcePaths(Ljava/lang/String;)Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getServerInfo()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "jetty/"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lorg/eclipse/jetty/server/Server;->getVersion()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public getServlet(Ljava/lang/String;)Ll/yre0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getServletContextName()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getDisplayName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 10
    .line 11
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getContextPath()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    return-object v0
.end method

.method public getServletNames()Ljava/util/Enumeration;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getServletRegistration(Ljava/lang/String;)Ll/fse0;
    .locals 1

    .line 1
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    new-array p1, p1, [Ljava/lang/Object;

    .line 7
    .line 8
    const-string v0, "Unimplemented - use org.eclipse.jetty.servlet.ServletContextHandler"

    .line 9
    .line 10
    invoke-interface {p0, v0, p1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public getServletRegistrations()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ll/fse0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    new-array v0, v0, [Ljava/lang/Object;

    .line 7
    .line 8
    const-string v1, "Unimplemented - use org.eclipse.jetty.servlet.ServletContextHandler"

    .line 9
    .line 10
    invoke-interface {p0, v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public getServlets()Ljava/util/Enumeration;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSessionCookieConfig()Ll/pse0;
    .locals 2

    .line 1
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    new-array v0, v0, [Ljava/lang/Object;

    .line 7
    .line 8
    const-string v1, "Unimplemented - use org.eclipse.jetty.servlet.ServletContextHandler"

    .line 9
    .line 10
    invoke-interface {p0, v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public isEnabled()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->_enabled:Z

    .line 2
    .line 3
    return p0
.end method

.method public log(Ljava/lang/Exception;Ljava/lang/String;)V
    .locals 0

    .line 14
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    invoke-static {p0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$200(Lorg/eclipse/jetty/server/handler/ContextHandler;)Lorg/eclipse/jetty/util/log/Logger;

    move-result-object p0

    invoke-interface {p0, p2, p1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public log(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$200(Lorg/eclipse/jetty/server/handler/ContextHandler;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    new-array v0, v0, [Ljava/lang/Object;

    .line 9
    .line 10
    invoke-interface {p0, p1, v0}, Lorg/eclipse/jetty/util/log/Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public log(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 15
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    invoke-static {p0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$200(Lorg/eclipse/jetty/server/handler/ContextHandler;)Lorg/eclipse/jetty/util/log/Logger;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public declared-synchronized removeAttribute(Ljava/lang/String;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {v0, p1, v1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->checkManagedAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 9
    .line 10
    invoke-static {v0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$300(Lorg/eclipse/jetty/server/handler/ContextHandler;)Lorg/eclipse/jetty/util/AttributesMap;

    .line 11
    .line 12
    .line 13
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    iget-object v1, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    :try_start_1
    invoke-static {v1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$400(Lorg/eclipse/jetty/server/handler/ContextHandler;)Lorg/eclipse/jetty/util/AttributesMap;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/util/AttributesMap;->removeAttribute(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    .line 24
    .line 25
    monitor-exit p0

    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :try_start_2
    invoke-static {v1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$300(Lorg/eclipse/jetty/server/handler/ContextHandler;)Lorg/eclipse/jetty/util/AttributesMap;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/util/AttributesMap;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 38
    .line 39
    invoke-static {v1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$300(Lorg/eclipse/jetty/server/handler/ContextHandler;)Lorg/eclipse/jetty/util/AttributesMap;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1, p1}, Lorg/eclipse/jetty/util/AttributesMap;->removeAttribute(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    iget-object v1, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 49
    .line 50
    invoke-static {v1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$500(Lorg/eclipse/jetty/server/handler/ContextHandler;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    if-eqz v1, :cond_1

    .line 55
    .line 56
    new-instance v1, Ljavax/servlet/ServletContextAttributeEvent;

    .line 57
    .line 58
    iget-object v2, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 59
    .line 60
    iget-object v2, v2, Lorg/eclipse/jetty/server/handler/ContextHandler;->_scontext:Lorg/eclipse/jetty/server/handler/ContextHandler$Context;

    .line 61
    .line 62
    invoke-direct {v1, v2, p1, v0}, Ljavax/servlet/ServletContextAttributeEvent;-><init>(Ll/ase0;Ljava/lang/String;Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    const/4 p1, 0x0

    .line 66
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 67
    .line 68
    invoke-static {v0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$500(Lorg/eclipse/jetty/server/handler/ContextHandler;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {v0}, Lorg/eclipse/jetty/util/LazyList;->size(Ljava/lang/Object;)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-ge p1, v0, :cond_1

    .line 77
    .line 78
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 79
    .line 80
    invoke-static {v0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$500(Lorg/eclipse/jetty/server/handler/ContextHandler;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-static {v0, p1}, Lorg/eclipse/jetty/util/LazyList;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    check-cast v0, Ll/bse0;

    .line 89
    .line 90
    invoke-interface {v0, v1}, Ll/bse0;->i(Ljavax/servlet/ServletContextAttributeEvent;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 91
    .line 92
    .line 93
    add-int/lit8 p1, p1, 0x1

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_1
    monitor-exit p0

    .line 97
    return-void

    .line 98
    :goto_1
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 99
    throw p1
.end method

.method public declared-synchronized setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 3
    .line 4
    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jetty/server/handler/ContextHandler;->checkManagedAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 8
    .line 9
    invoke-static {v0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$300(Lorg/eclipse/jetty/server/handler/ContextHandler;)Lorg/eclipse/jetty/util/AttributesMap;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/util/AttributesMap;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    iget-object v1, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 18
    .line 19
    if-nez p2, :cond_0

    .line 20
    .line 21
    :try_start_1
    invoke-static {v1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$300(Lorg/eclipse/jetty/server/handler/ContextHandler;)Lorg/eclipse/jetty/util/AttributesMap;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1, p1}, Lorg/eclipse/jetty/util/AttributesMap;->removeAttribute(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p1

    .line 30
    goto :goto_4

    .line 31
    :cond_0
    invoke-static {v1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$300(Lorg/eclipse/jetty/server/handler/ContextHandler;)Lorg/eclipse/jetty/util/AttributesMap;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1, p1, p2}, Lorg/eclipse/jetty/util/AttributesMap;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 39
    .line 40
    invoke-static {v1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$500(Lorg/eclipse/jetty/server/handler/ContextHandler;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    if-eqz v1, :cond_4

    .line 45
    .line 46
    new-instance v1, Ljavax/servlet/ServletContextAttributeEvent;

    .line 47
    .line 48
    iget-object v2, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 49
    .line 50
    iget-object v2, v2, Lorg/eclipse/jetty/server/handler/ContextHandler;->_scontext:Lorg/eclipse/jetty/server/handler/ContextHandler$Context;

    .line 51
    .line 52
    if-nez v0, :cond_1

    .line 53
    .line 54
    move-object v3, p2

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    move-object v3, v0

    .line 57
    :goto_1
    invoke-direct {v1, v2, p1, v3}, Ljavax/servlet/ServletContextAttributeEvent;-><init>(Ll/ase0;Ljava/lang/String;Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    const/4 p1, 0x0

    .line 61
    :goto_2
    iget-object v2, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 62
    .line 63
    invoke-static {v2}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$500(Lorg/eclipse/jetty/server/handler/ContextHandler;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-static {v2}, Lorg/eclipse/jetty/util/LazyList;->size(Ljava/lang/Object;)I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-ge p1, v2, :cond_4

    .line 72
    .line 73
    iget-object v2, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 74
    .line 75
    invoke-static {v2}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$500(Lorg/eclipse/jetty/server/handler/ContextHandler;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-static {v2, p1}, Lorg/eclipse/jetty/util/LazyList;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    check-cast v2, Ll/bse0;

    .line 84
    .line 85
    if-nez v0, :cond_2

    .line 86
    .line 87
    invoke-interface {v2, v1}, Ll/bse0;->b(Ljavax/servlet/ServletContextAttributeEvent;)V

    .line 88
    .line 89
    .line 90
    goto :goto_3

    .line 91
    :cond_2
    if-nez p2, :cond_3

    .line 92
    .line 93
    invoke-interface {v2, v1}, Ll/bse0;->i(Ljavax/servlet/ServletContextAttributeEvent;)V

    .line 94
    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_3
    invoke-interface {v2, v1}, Ll/bse0;->f(Ljavax/servlet/ServletContextAttributeEvent;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 98
    .line 99
    .line 100
    :goto_3
    add-int/lit8 p1, p1, 0x1

    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_4
    monitor-exit p0

    .line 104
    return-void

    .line 105
    :goto_4
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 106
    throw p1
.end method

.method public setEffectiveMajorVersion(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->_majorVersion:I

    .line 2
    .line 3
    return-void
.end method

.method public setEffectiveMinorVersion(I)V
    .locals 0

    .line 1
    iput p1, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->_minorVersion:I

    .line 2
    .line 3
    return-void
.end method

.method public setEnabled(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->_enabled:Z

    .line 2
    .line 3
    return-void
.end method

.method public setInitParameter(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 12
    .line 13
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getInitParams()Ljava/util/Map;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public setJspConfigDescriptor(Ll/zrq;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setSessionTrackingModes(Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljavax/servlet/SessionTrackingMode;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    new-array p1, p1, [Ljava/lang/Object;

    .line 7
    .line 8
    const-string v0, "Unimplemented - use org.eclipse.jetty.servlet.ServletContextHandler"

    .line 9
    .line 10
    invoke-interface {p0, v0, p1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "ServletContext@"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->this$0:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 9
    .line 10
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method
