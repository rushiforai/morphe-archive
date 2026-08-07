.class public Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;
.super Lorg/eclipse/jetty/server/session/AbstractSession;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/server/session/JDBCSessionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Session"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x48482e75793f5edfL


# instance fields
.field private final _data:Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;

.field private _dirty:Z

.field final synthetic this$0:Lorg/eclipse/jetty/server/session/JDBCSessionManager;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/session/JDBCSessionManager;JLorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;)V
    .locals 7

    .line 77
    iput-object p1, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->this$0:Lorg/eclipse/jetty/server/session/JDBCSessionManager;

    .line 78
    invoke-virtual {p4}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->getCreated()J

    move-result-wide v2

    invoke-virtual {p4}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->getId()Ljava/lang/String;

    move-result-object v6

    move-object v0, p0

    move-object v1, p1

    move-wide v4, p2

    invoke-direct/range {v0 .. v6}, Lorg/eclipse/jetty/server/session/AbstractSession;-><init>(Lorg/eclipse/jetty/server/session/AbstractSessionManager;JJLjava/lang/String;)V

    const/4 p0, 0x0

    .line 79
    iput-boolean p0, v0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->_dirty:Z

    .line 80
    iput-object p4, v0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->_data:Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;

    .line 81
    iget p0, v1, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->_dftMaxIdleSecs:I

    if-lez p0, :cond_0

    int-to-long p0, p0

    const-wide/16 p2, 0x3e8

    mul-long/2addr p0, p2

    .line 82
    invoke-virtual {p4, p0, p1}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->setMaxIdleMs(J)V

    .line 83
    :cond_0
    invoke-virtual {p4}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->getAttributeMap()Ljava/util/Map;

    move-result-object p0

    invoke-virtual {v0, p0}, Lorg/eclipse/jetty/server/session/AbstractSession;->addAttributes(Ljava/util/Map;)V

    .line 84
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/session/AbstractSession;->getAttributeMap()Ljava/util/Map;

    move-result-object p0

    invoke-virtual {p4, p0}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->setAttributeMap(Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jetty/server/session/JDBCSessionManager;Ljavax/servlet/http/HttpServletRequest;)V
    .locals 5

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->this$0:Lorg/eclipse/jetty/server/session/JDBCSessionManager;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jetty/server/session/AbstractSession;-><init>(Lorg/eclipse/jetty/server/session/AbstractSessionManager;Ljavax/servlet/http/HttpServletRequest;)V

    .line 4
    .line 5
    .line 6
    const/4 p2, 0x0

    .line 7
    iput-boolean p2, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->_dirty:Z

    .line 8
    .line 9
    new-instance p2, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;

    .line 10
    .line 11
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/session/AbstractSession;->getClusterId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/session/AbstractSession;->getAttributeMap()Ljava/util/Map;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-direct {p2, p1, v0, v1}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;-><init>(Lorg/eclipse/jetty/server/session/JDBCSessionManager;Ljava/lang/String;Ljava/util/Map;)V

    .line 20
    .line 21
    .line 22
    iput-object p2, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->_data:Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;

    .line 23
    .line 24
    iget v0, p1, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->_dftMaxIdleSecs:I

    .line 25
    .line 26
    const-wide/16 v1, 0x3e8

    .line 27
    .line 28
    if-lez v0, :cond_0

    .line 29
    .line 30
    int-to-long v3, v0

    .line 31
    mul-long/2addr v3, v1

    .line 32
    invoke-virtual {p2, v3, v4}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->setMaxIdleMs(J)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p1, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->_context:Lorg/eclipse/jetty/server/handler/ContextHandler$Context;

    .line 36
    .line 37
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->getContextPath()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {p1, v0}, Lorg/eclipse/jetty/server/session/JDBCSessionManager;->access$000(Lorg/eclipse/jetty/server/session/JDBCSessionManager;Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p2, v0}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->setCanonicalContext(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p1, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->_context:Lorg/eclipse/jetty/server/handler/ContextHandler$Context;

    .line 49
    .line 50
    invoke-static {p1, v0}, Lorg/eclipse/jetty/server/session/JDBCSessionManager;->access$100(Lorg/eclipse/jetty/server/session/JDBCSessionManager;Lorg/eclipse/jetty/server/handler/ContextHandler$Context;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p2, p1}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->setVirtualHost(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/session/AbstractSession;->getMaxInactiveInterval()I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-gtz p0, :cond_1

    .line 62
    .line 63
    const-wide/16 p0, 0x0

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 67
    .line 68
    .line 69
    move-result-wide v3

    .line 70
    int-to-long p0, p0

    .line 71
    mul-long/2addr p0, v1

    .line 72
    add-long/2addr p0, v3

    .line 73
    :goto_0
    invoke-virtual {p2, p0, p1}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->setExpiryTime(J)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public static synthetic access$500(Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;)Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->_data:Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public access(J)Z
    .locals 4

    .line 1
    invoke-super {p0, p1, p2}, Lorg/eclipse/jetty/server/session/AbstractSession;->access(J)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->_data:Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;

    .line 8
    .line 9
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->getAccessed()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->setLastAccessed(J)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->_data:Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;

    .line 17
    .line 18
    invoke-virtual {v0, p1, p2}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->setAccessed(J)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/session/AbstractSession;->getMaxInactiveInterval()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->_data:Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;

    .line 26
    .line 27
    if-gtz v0, :cond_0

    .line 28
    .line 29
    const-wide/16 p1, 0x0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    int-to-long v0, v0

    .line 33
    const-wide/16 v2, 0x3e8

    .line 34
    .line 35
    mul-long/2addr v0, v2

    .line 36
    add-long/2addr p1, v0

    .line 37
    :goto_0
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->setExpiryTime(J)V

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    return p0

    .line 42
    :cond_1
    const/4 p0, 0x0

    .line 43
    return p0
.end method

.method public complete()V
    .locals 8

    .line 1
    const-string v0, "Problem persisting changed session data id="

    .line 2
    .line 3
    invoke-super {p0}, Lorg/eclipse/jetty/server/session/AbstractSession;->complete()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :try_start_0
    iget-boolean v2, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->_dirty:Z

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/session/AbstractSession;->willPassivate()V

    .line 12
    .line 13
    .line 14
    iget-object v2, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->this$0:Lorg/eclipse/jetty/server/session/JDBCSessionManager;

    .line 15
    .line 16
    iget-object v3, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->_data:Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;

    .line 17
    .line 18
    invoke-virtual {v2, v3}, Lorg/eclipse/jetty/server/session/JDBCSessionManager;->updateSession(Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/session/AbstractSession;->didActivate()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    goto :goto_2

    .line 27
    :catch_0
    move-exception v2

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->_data:Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;

    .line 30
    .line 31
    invoke-static {v2}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->access$200(Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;)J

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    iget-object v4, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->_data:Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;

    .line 36
    .line 37
    invoke-static {v4}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->access$300(Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;)J

    .line 38
    .line 39
    .line 40
    move-result-wide v4

    .line 41
    sub-long/2addr v2, v4

    .line 42
    iget-object v4, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->this$0:Lorg/eclipse/jetty/server/session/JDBCSessionManager;

    .line 43
    .line 44
    invoke-virtual {v4}, Lorg/eclipse/jetty/server/session/JDBCSessionManager;->getSaveInterval()J

    .line 45
    .line 46
    .line 47
    move-result-wide v4

    .line 48
    const-wide/16 v6, 0x3e8

    .line 49
    .line 50
    mul-long/2addr v4, v6

    .line 51
    cmp-long v2, v2, v4

    .line 52
    .line 53
    if-ltz v2, :cond_1

    .line 54
    .line 55
    iget-object v2, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->this$0:Lorg/eclipse/jetty/server/session/JDBCSessionManager;

    .line 56
    .line 57
    iget-object v3, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->_data:Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;

    .line 58
    .line 59
    invoke-static {v2, v3}, Lorg/eclipse/jetty/server/session/JDBCSessionManager;->access$400(Lorg/eclipse/jetty/server/session/JDBCSessionManager;Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    .line 61
    .line 62
    :cond_1
    :goto_0
    iput-boolean v1, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->_dirty:Z

    .line 63
    .line 64
    return-void

    .line 65
    :goto_1
    :try_start_1
    sget-object v3, Lorg/eclipse/jetty/server/session/AbstractSession;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 66
    .line 67
    new-instance v4, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/session/AbstractSession;->getId()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-interface {v3, v0, v2}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 84
    .line 85
    .line 86
    iput-boolean v1, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->_dirty:Z

    .line 87
    .line 88
    return-void

    .line 89
    :goto_2
    iput-boolean v1, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->_dirty:Z

    .line 90
    .line 91
    throw v0
.end method

.method public cookieSet()V
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->_data:Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->getAccessed()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jetty/server/session/JDBCSessionManager$SessionData;->setCookieSet(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public removeAttribute(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lorg/eclipse/jetty/server/session/AbstractSession;->removeAttribute(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->_dirty:Z

    .line 6
    .line 7
    return-void
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lorg/eclipse/jetty/server/session/AbstractSession;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lorg/eclipse/jetty/server/session/JDBCSessionManager$Session;->_dirty:Z

    .line 6
    .line 7
    return-void
.end method

.method public timeout()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    sget-object v0, Lorg/eclipse/jetty/server/session/AbstractSession;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "Timing out session id="

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/session/AbstractSession;->getClusterId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/4 v2, 0x0

    .line 28
    new-array v2, v2, [Ljava/lang/Object;

    .line 29
    .line 30
    invoke-interface {v0, v1, v2}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-super {p0}, Lorg/eclipse/jetty/server/session/AbstractSession;->timeout()V

    .line 34
    .line 35
    .line 36
    return-void
.end method
