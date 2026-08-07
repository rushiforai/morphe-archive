.class public Lorg/eclipse/jetty/server/session/HashSessionManager;
.super Lorg/eclipse/jetty/server/session/AbstractSessionManager;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/server/session/HashSessionManager$ClassLoadingObjectInputStream;
    }
.end annotation


# static fields
.field private static __id:I

.field static final __log:Lorg/eclipse/jetty/util/log/Logger;


# instance fields
.field private _deleteUnrestorableSessions:Z

.field _idleSavePeriodMs:J

.field private _lazyLoad:Z

.field _savePeriodMs:J

.field private _saveTask:Ljava/util/TimerTask;

.field _scavengePeriodMs:J

.field protected final _sessions:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jetty/server/session/HashedSession;",
            ">;"
        }
    .end annotation
.end field

.field private volatile _sessionsLoaded:Z

.field _storeDir:Ljava/io/File;

.field private _task:Ljava/util/TimerTask;

.field private _timer:Ljava/util/Timer;

.field private _timerStop:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lorg/eclipse/jetty/server/session/SessionHandler;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    sput-object v0, Lorg/eclipse/jetty/server/session/HashSessionManager;->__log:Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/server/session/AbstractSessionManager;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_sessions:Ljava/util/concurrent/ConcurrentMap;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_timerStop:Z

    .line 13
    .line 14
    const-wide/16 v1, 0x7530

    .line 15
    .line 16
    iput-wide v1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_scavengePeriodMs:J

    .line 17
    .line 18
    const-wide/16 v1, 0x0

    .line 19
    .line 20
    iput-wide v1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_savePeriodMs:J

    .line 21
    .line 22
    iput-wide v1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_idleSavePeriodMs:J

    .line 23
    .line 24
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_lazyLoad:Z

    .line 25
    .line 26
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_sessionsLoaded:Z

    .line 27
    .line 28
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_deleteUnrestorableSessions:Z

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public addSession(Lorg/eclipse/jetty/server/session/AbstractSession;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isRunning()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_sessions:Ljava/util/concurrent/ConcurrentMap;

    .line 8
    .line 9
    invoke-virtual {p1}, Lorg/eclipse/jetty/server/session/AbstractSession;->getClusterId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast p1, Lorg/eclipse/jetty/server/session/HashedSession;

    .line 14
    .line 15
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public doStart()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->doStart()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_timerStop:Z

    .line 6
    .line 7
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getCurrentContext()Lorg/eclipse/jetty/server/handler/ContextHandler$Context;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string v1, "org.eclipse.jetty.server.session.timer"

    .line 14
    .line 15
    invoke-interface {v0, v1}, Ll/ase0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/util/Timer;

    .line 20
    .line 21
    iput-object v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_timer:Ljava/util/Timer;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_timer:Ljava/util/Timer;

    .line 24
    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_timerStop:Z

    .line 29
    .line 30
    new-instance v1, Ljava/util/Timer;

    .line 31
    .line 32
    new-instance v2, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v3, "HashSessionScavenger-"

    .line 35
    .line 36
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    sget v3, Lorg/eclipse/jetty/server/session/HashSessionManager;->__id:I

    .line 40
    .line 41
    add-int/lit8 v4, v3, 0x1

    .line 42
    .line 43
    sput v4, Lorg/eclipse/jetty/server/session/HashSessionManager;->__id:I

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-direct {v1, v2, v0}, Ljava/util/Timer;-><init>(Ljava/lang/String;Z)V

    .line 53
    .line 54
    .line 55
    iput-object v1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_timer:Ljava/util/Timer;

    .line 56
    .line 57
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/session/HashSessionManager;->getScavengePeriod()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/server/session/HashSessionManager;->setScavengePeriod(I)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_storeDir:Ljava/io/File;

    .line 65
    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-nez v0, :cond_2

    .line 73
    .line 74
    iget-object v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_storeDir:Ljava/io/File;

    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 77
    .line 78
    .line 79
    :cond_2
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_lazyLoad:Z

    .line 80
    .line 81
    if-nez v0, :cond_3

    .line 82
    .line 83
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/session/HashSessionManager;->restoreSessions()V

    .line 84
    .line 85
    .line 86
    :cond_3
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/session/HashSessionManager;->getSavePeriod()I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/server/session/HashSessionManager;->setSavePeriod(I)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public doStop()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_saveTask:Ljava/util/TimerTask;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_saveTask:Ljava/util/TimerTask;

    .line 14
    .line 15
    iget-object v1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_task:Ljava/util/TimerTask;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/util/TimerTask;->cancel()Z

    .line 20
    .line 21
    .line 22
    :cond_1
    iput-object v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_task:Ljava/util/TimerTask;

    .line 23
    .line 24
    iget-object v1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_timer:Ljava/util/Timer;

    .line 25
    .line 26
    if-eqz v1, :cond_2

    .line 27
    .line 28
    iget-boolean v2, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_timerStop:Z

    .line 29
    .line 30
    if-eqz v2, :cond_2

    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/util/Timer;->cancel()V

    .line 33
    .line 34
    .line 35
    :cond_2
    iput-object v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_timer:Ljava/util/Timer;

    .line 36
    .line 37
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    invoke-super {p0}, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->doStop()V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_sessions:Ljava/util/concurrent/ConcurrentMap;

    .line 42
    .line 43
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    throw v0
.end method

.method public getIdleSavePeriod()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_idleSavePeriodMs:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-gtz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    const-wide/16 v2, 0x3e8

    .line 12
    .line 13
    div-long/2addr v0, v2

    .line 14
    long-to-int p0, v0

    .line 15
    return p0
.end method

.method public getSavePeriod()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_savePeriodMs:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-gtz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    const-wide/16 v2, 0x3e8

    .line 12
    .line 13
    div-long/2addr v0, v2

    .line 14
    long-to-int p0, v0

    .line 15
    return p0
.end method

.method public getScavengePeriod()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_scavengePeriodMs:J

    .line 2
    .line 3
    const-wide/16 v2, 0x3e8

    .line 4
    .line 5
    div-long/2addr v0, v2

    .line 6
    long-to-int p0, v0

    .line 7
    return p0
.end method

.method public getSession(Ljava/lang/String;)Lorg/eclipse/jetty/server/session/AbstractSession;
    .locals 3

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_lazyLoad:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_sessionsLoaded:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/session/HashSessionManager;->restoreSessions()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catch_0
    move-exception v0

    .line 14
    sget-object v1, Lorg/eclipse/jetty/server/session/HashSessionManager;->__log:Lorg/eclipse/jetty/util/log/Logger;

    .line 15
    .line 16
    invoke-interface {v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_sessions:Ljava/util/concurrent/ConcurrentMap;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    return-object v1

    .line 25
    :cond_1
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lorg/eclipse/jetty/server/session/HashedSession;

    .line 30
    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    iget-boolean v2, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_lazyLoad:Z

    .line 34
    .line 35
    if-eqz v2, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/session/HashSessionManager;->restoreSession(Ljava/lang/String;)Lorg/eclipse/jetty/server/session/HashedSession;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    :cond_2
    if-nez v0, :cond_3

    .line 42
    .line 43
    return-object v1

    .line 44
    :cond_3
    iget-wide p0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_idleSavePeriodMs:J

    .line 45
    .line 46
    const-wide/16 v1, 0x0

    .line 47
    .line 48
    cmp-long p0, p0, v1

    .line 49
    .line 50
    if-eqz p0, :cond_4

    .line 51
    .line 52
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/session/HashedSession;->deIdle()V

    .line 53
    .line 54
    .line 55
    :cond_4
    return-object v0
.end method

.method public getSessions()I
    .locals 4

    .line 1
    invoke-super {p0}, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->getSessions()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget-object v1, Lorg/eclipse/jetty/server/session/HashSessionManager;->__log:Lorg/eclipse/jetty/util/log/Logger;

    .line 6
    .line 7
    invoke-interface {v1}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_sessions:Ljava/util/concurrent/ConcurrentMap;

    .line 14
    .line 15
    invoke-interface {v2}, Ljava/util/Map;->size()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eq v2, v0, :cond_0

    .line 20
    .line 21
    new-instance v2, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v3, "sessions: "

    .line 24
    .line 25
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_sessions:Ljava/util/concurrent/ConcurrentMap;

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string p0, "!="

    .line 38
    .line 39
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const/4 v2, 0x0

    .line 50
    new-array v2, v2, [Ljava/lang/Object;

    .line 51
    .line 52
    invoke-interface {v1, p0, v2}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return v0
.end method

.method public getStoreDirectory()Ljava/io/File;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_storeDir:Ljava/io/File;

    .line 2
    .line 3
    return-object p0
.end method

.method public invalidateSessions()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_sessions:Ljava/util/concurrent/ConcurrentMap;

    .line 4
    .line 5
    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 10
    .line 11
    .line 12
    const/16 v1, 0x64

    .line 13
    .line 14
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-lez v2, :cond_2

    .line 19
    .line 20
    add-int/lit8 v2, v1, -0x1

    .line 21
    .line 22
    if-lez v1, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isStopping()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    iget-object v1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_storeDir:Ljava/io/File;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    iget-object v1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_storeDir:Ljava/io/File;

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/io/File;->canWrite()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_0

    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_1

    .line 57
    .line 58
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    check-cast v1, Lorg/eclipse/jetty/server/session/HashedSession;

    .line 63
    .line 64
    const/4 v3, 0x0

    .line 65
    invoke-virtual {v1, v3}, Lorg/eclipse/jetty/server/session/HashedSession;->save(Z)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, v1, v3}, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->removeSession(Lorg/eclipse/jetty/server/session/AbstractSession;Z)V

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_1

    .line 81
    .line 82
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    check-cast v1, Lorg/eclipse/jetty/server/session/HashedSession;

    .line 87
    .line 88
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/session/AbstractSession;->invalidate()V

    .line 89
    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    .line 93
    .line 94
    iget-object v1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_sessions:Ljava/util/concurrent/ConcurrentMap;

    .line 95
    .line 96
    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 101
    .line 102
    .line 103
    move v1, v2

    .line 104
    goto :goto_0

    .line 105
    :cond_2
    return-void
.end method

.method public isDeleteUnrestorableSessions()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_deleteUnrestorableSessions:Z

    .line 2
    .line 3
    return p0
.end method

.method public isLazyLoad()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_lazyLoad:Z

    .line 2
    .line 3
    return p0
.end method

.method public newSession(JJLjava/lang/String;)Lorg/eclipse/jetty/server/session/AbstractSession;
    .locals 7

    .line 1
    new-instance v0, Lorg/eclipse/jetty/server/session/HashedSession;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move-wide v4, p3

    .line 6
    move-object v6, p5

    .line 7
    invoke-direct/range {v0 .. v6}, Lorg/eclipse/jetty/server/session/HashedSession;-><init>(Lorg/eclipse/jetty/server/session/HashSessionManager;JJLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public newSession(Ljavax/servlet/http/HttpServletRequest;)Lorg/eclipse/jetty/server/session/AbstractSession;
    .locals 1

    .line 11
    new-instance v0, Lorg/eclipse/jetty/server/session/HashedSession;

    invoke-direct {v0, p0, p1}, Lorg/eclipse/jetty/server/session/HashedSession;-><init>(Lorg/eclipse/jetty/server/session/HashSessionManager;Ljavax/servlet/http/HttpServletRequest;)V

    return-object v0
.end method

.method public removeSession(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_sessions:Ljava/util/concurrent/ConcurrentMap;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public restoreSession(Ljava/io/InputStream;Lorg/eclipse/jetty/server/session/HashedSession;)Lorg/eclipse/jetty/server/session/HashedSession;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 150
    new-instance v0, Ljava/io/DataInputStream;

    invoke-direct {v0, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 151
    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v6

    .line 152
    invoke-virtual {v0}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    .line 153
    invoke-virtual {v0}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v2

    .line 154
    invoke-virtual {v0}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v4

    .line 155
    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result p1

    move-object v1, p0

    if-nez p2, :cond_0

    .line 156
    invoke-virtual/range {v1 .. v6}, Lorg/eclipse/jetty/server/session/HashSessionManager;->newSession(JJLjava/lang/String;)Lorg/eclipse/jetty/server/session/AbstractSession;

    move-result-object p0

    move-object p2, p0

    check-cast p2, Lorg/eclipse/jetty/server/session/HashedSession;

    .line 157
    :cond_0
    invoke-virtual {p2, p1}, Lorg/eclipse/jetty/server/session/AbstractSession;->setRequests(I)V

    .line 158
    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result p0

    if-lez p0, :cond_2

    .line 159
    new-instance p1, Lorg/eclipse/jetty/server/session/HashSessionManager$ClassLoadingObjectInputStream;

    invoke-direct {p1, v1, v0}, Lorg/eclipse/jetty/server/session/HashSessionManager$ClassLoadingObjectInputStream;-><init>(Lorg/eclipse/jetty/server/session/HashSessionManager;Ljava/io/InputStream;)V

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p0, :cond_1

    .line 160
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v1

    .line 161
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v2

    .line 162
    invoke-virtual {p2, v1, v2}, Lorg/eclipse/jetty/server/session/AbstractSession;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 163
    :cond_1
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    return-object p2

    .line 164
    :cond_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    return-object p2
.end method

.method public declared-synchronized restoreSession(Ljava/lang/String;)Lorg/eclipse/jetty/server/session/HashedSession;
    .locals 7

    .line 1
    const-string v0, "Problem restoring session "

    .line 2
    .line 3
    const-string v1, "Deleting file for unrestorable session "

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    new-instance v2, Ljava/io/File;

    .line 7
    .line 8
    iget-object v3, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_storeDir:Ljava/io/File;

    .line 9
    .line 10
    invoke-direct {v2, v3, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    :try_start_1
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    if-eqz v4, :cond_0

    .line 19
    .line 20
    new-instance v4, Ljava/io/FileInputStream;

    .line 21
    .line 22
    invoke-direct {v4, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 23
    .line 24
    .line 25
    :try_start_2
    invoke-virtual {p0, v4, v3}, Lorg/eclipse/jetty/server/session/HashSessionManager;->restoreSession(Ljava/io/InputStream;Lorg/eclipse/jetty/server/session/HashedSession;)Lorg/eclipse/jetty/server/session/HashedSession;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    const/4 v6, 0x0

    .line 30
    invoke-virtual {p0, v5, v6}, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->addSession(Lorg/eclipse/jetty/server/session/AbstractSession;Z)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v5}, Lorg/eclipse/jetty/server/session/AbstractSession;->didActivate()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 34
    .line 35
    .line 36
    :try_start_3
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    goto/16 :goto_6

    .line 42
    .line 43
    :catch_0
    move-exception p1

    .line 44
    :try_start_4
    sget-object v0, Lorg/eclipse/jetty/server/session/HashSessionManager;->__log:Lorg/eclipse/jetty/util/log/Logger;

    .line 45
    .line 46
    invoke-interface {v0, p1}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 47
    .line 48
    .line 49
    :goto_0
    invoke-virtual {v2}, Ljava/io/File;->delete()Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 50
    .line 51
    .line 52
    monitor-exit p0

    .line 53
    return-object v5

    .line 54
    :catchall_1
    move-exception p1

    .line 55
    move-object v3, v4

    .line 56
    goto :goto_1

    .line 57
    :catch_1
    move-exception v5

    .line 58
    goto :goto_3

    .line 59
    :catchall_2
    move-exception p1

    .line 60
    goto :goto_1

    .line 61
    :catch_2
    move-exception v5

    .line 62
    move-object v4, v3

    .line 63
    goto :goto_3

    .line 64
    :cond_0
    :try_start_5
    invoke-virtual {v2}, Ljava/io/File;->delete()Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 65
    .line 66
    .line 67
    goto :goto_5

    .line 68
    :goto_1
    if-eqz v3, :cond_1

    .line 69
    .line 70
    :try_start_6
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 71
    .line 72
    .line 73
    goto :goto_2

    .line 74
    :catch_3
    move-exception v0

    .line 75
    :try_start_7
    sget-object v1, Lorg/eclipse/jetty/server/session/HashSessionManager;->__log:Lorg/eclipse/jetty/util/log/Logger;

    .line 76
    .line 77
    invoke-interface {v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    :goto_2
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 81
    .line 82
    .line 83
    throw p1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 84
    :goto_3
    if-eqz v4, :cond_2

    .line 85
    .line 86
    :try_start_8
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 87
    .line 88
    .line 89
    goto :goto_4

    .line 90
    :catch_4
    move-exception v4

    .line 91
    :try_start_9
    sget-object v6, Lorg/eclipse/jetty/server/session/HashSessionManager;->__log:Lorg/eclipse/jetty/util/log/Logger;

    .line 92
    .line 93
    invoke-interface {v6, v4}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 94
    .line 95
    .line 96
    :cond_2
    :goto_4
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/session/HashSessionManager;->isDeleteUnrestorableSessions()Z

    .line 97
    .line 98
    .line 99
    move-result v4

    .line 100
    if-eqz v4, :cond_3

    .line 101
    .line 102
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    if-eqz v4, :cond_3

    .line 107
    .line 108
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 109
    .line 110
    .line 111
    sget-object v0, Lorg/eclipse/jetty/server/session/HashSessionManager;->__log:Lorg/eclipse/jetty/util/log/Logger;

    .line 112
    .line 113
    new-instance v2, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-interface {v0, p1, v5}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 126
    .line 127
    .line 128
    goto :goto_5

    .line 129
    :cond_3
    sget-object v1, Lorg/eclipse/jetty/server/session/HashSessionManager;->__log:Lorg/eclipse/jetty/util/log/Logger;

    .line 130
    .line 131
    new-instance v2, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    invoke-interface {v1, p1, v5}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 144
    .line 145
    .line 146
    :goto_5
    monitor-exit p0

    .line 147
    return-object v3

    .line 148
    :goto_6
    :try_start_a
    monitor-exit p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 149
    throw p1
.end method

.method public restoreSessions()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_sessionsLoaded:Z

    .line 3
    .line 4
    iget-object v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_storeDir:Ljava/io/File;

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_storeDir:Ljava/io/File;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/io/File;->canRead()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_storeDir:Ljava/io/File;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    sget-object p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->__log:Lorg/eclipse/jetty/util/log/Logger;

    .line 27
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string v3, "Unable to restore Sessions: Cannot read from Session storage directory "

    .line 31
    .line 32
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-array v1, v2, [Ljava/lang/Object;

    .line 47
    .line 48
    invoke-interface {p0, v0, v1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->list()[Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    :goto_0
    if-eqz v0, :cond_2

    .line 57
    .line 58
    array-length v1, v0

    .line 59
    if-ge v2, v1, :cond_2

    .line 60
    .line 61
    aget-object v1, v0, v2

    .line 62
    .line 63
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/server/session/HashSessionManager;->restoreSession(Ljava/lang/String;)Lorg/eclipse/jetty/server/session/HashedSession;

    .line 64
    .line 65
    .line 66
    add-int/lit8 v2, v2, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    :goto_1
    return-void
.end method

.method public saveSessions(Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_storeDir:Ljava/io/File;

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object p1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_storeDir:Ljava/io/File;

    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/io/File;->canWrite()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    sget-object p1, Lorg/eclipse/jetty/server/session/HashSessionManager;->__log:Lorg/eclipse/jetty/util/log/Logger;

    .line 21
    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v1, "Unable to save Sessions: Session persistence storage directory "

    .line 25
    .line 26
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_storeDir:Ljava/io/File;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string p0, " is not writeable"

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const/4 v0, 0x0

    .line 48
    new-array v0, v0, [Ljava/lang/Object;

    .line 49
    .line 50
    invoke-interface {p1, p0, v0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_sessions:Ljava/util/concurrent/ConcurrentMap;

    .line 55
    .line 56
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_2

    .line 69
    .line 70
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    check-cast p1, Lorg/eclipse/jetty/server/session/HashedSession;

    .line 75
    .line 76
    const/4 v0, 0x1

    .line 77
    invoke-virtual {p1, v0}, Lorg/eclipse/jetty/server/session/HashedSession;->save(Z)V

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_2
    :goto_1
    return-void
.end method

.method public scavenge()V
    .locals 12

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isStopping()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_5

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->isStopped()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_3

    .line 14
    .line 15
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->_loader:Ljava/lang/ClassLoader;

    .line 24
    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/Thread;->setContextClassLoader(Ljava/lang/ClassLoader;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    goto :goto_2

    .line 33
    :cond_1
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 34
    .line 35
    .line 36
    move-result-wide v2

    .line 37
    iget-object v4, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_sessions:Ljava/util/concurrent/ConcurrentMap;

    .line 38
    .line 39
    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    :cond_2
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    if-eqz v5, :cond_4

    .line 52
    .line 53
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    check-cast v5, Lorg/eclipse/jetty/server/session/HashedSession;

    .line 58
    .line 59
    invoke-virtual {v5}, Lorg/eclipse/jetty/server/session/AbstractSession;->getMaxInactiveInterval()I

    .line 60
    .line 61
    .line 62
    move-result v6

    .line 63
    int-to-long v6, v6

    .line 64
    const-wide/16 v8, 0x3e8

    .line 65
    .line 66
    mul-long/2addr v6, v8

    .line 67
    const-wide/16 v8, 0x0

    .line 68
    .line 69
    cmp-long v10, v6, v8

    .line 70
    .line 71
    if-lez v10, :cond_3

    .line 72
    .line 73
    invoke-virtual {v5}, Lorg/eclipse/jetty/server/session/AbstractSession;->getAccessed()J

    .line 74
    .line 75
    .line 76
    move-result-wide v10

    .line 77
    add-long/2addr v10, v6

    .line 78
    cmp-long v6, v10, v2

    .line 79
    .line 80
    if-gez v6, :cond_3

    .line 81
    .line 82
    invoke-virtual {v5}, Lorg/eclipse/jetty/server/session/AbstractSession;->timeout()V

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_3
    iget-wide v6, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_idleSavePeriodMs:J

    .line 87
    .line 88
    cmp-long v6, v6, v8

    .line 89
    .line 90
    if-lez v6, :cond_2

    .line 91
    .line 92
    invoke-virtual {v5}, Lorg/eclipse/jetty/server/session/AbstractSession;->getAccessed()J

    .line 93
    .line 94
    .line 95
    move-result-wide v6

    .line 96
    iget-wide v8, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_idleSavePeriodMs:J

    .line 97
    .line 98
    add-long/2addr v6, v8

    .line 99
    cmp-long v6, v6, v2

    .line 100
    .line 101
    if-gez v6, :cond_2

    .line 102
    .line 103
    invoke-virtual {v5}, Lorg/eclipse/jetty/server/session/HashedSession;->idle()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_4
    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setContextClassLoader(Ljava/lang/ClassLoader;)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :goto_2
    :try_start_1
    sget-object v2, Lorg/eclipse/jetty/server/session/HashSessionManager;->__log:Lorg/eclipse/jetty/util/log/Logger;

    .line 112
    .line 113
    const-string v3, "Problem scavenging sessions"

    .line 114
    .line 115
    invoke-interface {v2, v3, p0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setContextClassLoader(Ljava/lang/ClassLoader;)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :catchall_1
    move-exception p0

    .line 123
    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setContextClassLoader(Ljava/lang/ClassLoader;)V

    .line 124
    .line 125
    .line 126
    throw p0

    .line 127
    :cond_5
    :goto_3
    return-void
.end method

.method public setDeleteUnrestorableSessions(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_deleteUnrestorableSessions:Z

    .line 2
    .line 3
    return-void
.end method

.method public setIdleSavePeriod(I)V
    .locals 4

    .line 1
    int-to-long v0, p1

    .line 2
    const-wide/16 v2, 0x3e8

    .line 3
    .line 4
    mul-long/2addr v0, v2

    .line 5
    iput-wide v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_idleSavePeriodMs:J

    .line 6
    .line 7
    return-void
.end method

.method public setLazyLoad(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_lazyLoad:Z

    .line 2
    .line 3
    return-void
.end method

.method public setMaxInactiveInterval(I)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->setMaxInactiveInterval(I)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lorg/eclipse/jetty/server/session/AbstractSessionManager;->_dftMaxIdleSecs:I

    .line 5
    .line 6
    if-lez p1, :cond_0

    .line 7
    .line 8
    iget-wide v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_scavengePeriodMs:J

    .line 9
    .line 10
    int-to-long v2, p1

    .line 11
    const-wide/16 v4, 0x3e8

    .line 12
    .line 13
    mul-long/2addr v2, v4

    .line 14
    cmp-long v0, v0, v2

    .line 15
    .line 16
    if-lez v0, :cond_0

    .line 17
    .line 18
    add-int/lit8 p1, p1, 0x9

    .line 19
    .line 20
    div-int/lit8 p1, p1, 0xa

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/session/HashSessionManager;->setScavengePeriod(I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public setSavePeriod(I)V
    .locals 6

    .line 1
    int-to-long v0, p1

    .line 2
    const-wide/16 v2, 0x3e8

    .line 3
    .line 4
    mul-long/2addr v0, v2

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p1, v0, v2

    .line 8
    .line 9
    if-gez p1, :cond_0

    .line 10
    .line 11
    move-wide v0, v2

    .line 12
    :cond_0
    iput-wide v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_savePeriodMs:J

    .line 13
    .line 14
    iget-object p1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_timer:Ljava/util/Timer;

    .line 15
    .line 16
    if-eqz p1, :cond_3

    .line 17
    .line 18
    monitor-enter p0

    .line 19
    :try_start_0
    iget-object p1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_saveTask:Ljava/util/TimerTask;

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/util/TimerTask;->cancel()Z

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    move-object p1, v0

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    :goto_0
    iget-wide v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_savePeriodMs:J

    .line 31
    .line 32
    cmp-long p1, v0, v2

    .line 33
    .line 34
    if-lez p1, :cond_2

    .line 35
    .line 36
    iget-object p1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_storeDir:Ljava/io/File;

    .line 37
    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    new-instance v1, Lorg/eclipse/jetty/server/session/HashSessionManager$1;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Lorg/eclipse/jetty/server/session/HashSessionManager$1;-><init>(Lorg/eclipse/jetty/server/session/HashSessionManager;)V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_saveTask:Ljava/util/TimerTask;

    .line 46
    .line 47
    iget-object v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_timer:Ljava/util/Timer;

    .line 48
    .line 49
    iget-wide v2, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_savePeriodMs:J

    .line 50
    .line 51
    move-wide v4, v2

    .line 52
    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 53
    .line 54
    .line 55
    :cond_2
    monitor-exit p0

    .line 56
    return-void

    .line 57
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    throw p1

    .line 59
    :cond_3
    return-void
.end method

.method public setScavengePeriod(I)V
    .locals 8

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/16 p1, 0x3c

    .line 4
    .line 5
    :cond_0
    iget-wide v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_scavengePeriodMs:J

    .line 6
    .line 7
    int-to-long v2, p1

    .line 8
    const-wide/16 v4, 0x3e8

    .line 9
    .line 10
    mul-long/2addr v2, v4

    .line 11
    const-wide/32 v6, 0xea60

    .line 12
    .line 13
    .line 14
    cmp-long p1, v2, v6

    .line 15
    .line 16
    if-lez p1, :cond_1

    .line 17
    .line 18
    move-wide v2, v6

    .line 19
    :cond_1
    cmp-long p1, v2, v4

    .line 20
    .line 21
    if-gez p1, :cond_2

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_2
    move-wide v4, v2

    .line 25
    :goto_0
    iput-wide v4, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_scavengePeriodMs:J

    .line 26
    .line 27
    iget-object p1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_timer:Ljava/util/Timer;

    .line 28
    .line 29
    if-eqz p1, :cond_5

    .line 30
    .line 31
    cmp-long p1, v4, v0

    .line 32
    .line 33
    if-nez p1, :cond_3

    .line 34
    .line 35
    iget-object p1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_task:Ljava/util/TimerTask;

    .line 36
    .line 37
    if-nez p1, :cond_5

    .line 38
    .line 39
    :cond_3
    monitor-enter p0

    .line 40
    :try_start_0
    iget-object p1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_task:Ljava/util/TimerTask;

    .line 41
    .line 42
    if-eqz p1, :cond_4

    .line 43
    .line 44
    invoke-virtual {p1}, Ljava/util/TimerTask;->cancel()Z

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :catchall_0
    move-exception v0

    .line 49
    move-object p1, v0

    .line 50
    goto :goto_2

    .line 51
    :cond_4
    :goto_1
    new-instance v1, Lorg/eclipse/jetty/server/session/HashSessionManager$2;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Lorg/eclipse/jetty/server/session/HashSessionManager$2;-><init>(Lorg/eclipse/jetty/server/session/HashSessionManager;)V

    .line 54
    .line 55
    .line 56
    iput-object v1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_task:Ljava/util/TimerTask;

    .line 57
    .line 58
    iget-object v0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_timer:Ljava/util/Timer;

    .line 59
    .line 60
    iget-wide v2, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_scavengePeriodMs:J

    .line 61
    .line 62
    move-wide v4, v2

    .line 63
    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 64
    .line 65
    .line 66
    monitor-exit p0

    .line 67
    return-void

    .line 68
    :goto_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    throw p1

    .line 70
    :cond_5
    return-void
.end method

.method public setStoreDirectory(Ljava/io/File;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager;->_storeDir:Ljava/io/File;

    .line 2
    .line 3
    return-void
.end method
