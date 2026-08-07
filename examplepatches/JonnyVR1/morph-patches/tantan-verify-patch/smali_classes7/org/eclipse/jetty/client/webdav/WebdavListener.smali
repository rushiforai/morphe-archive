.class public Lorg/eclipse/jetty/client/webdav/WebdavListener;
.super Lorg/eclipse/jetty/client/HttpEventListenerWrapper;
.source "SourceFile"


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;


# instance fields
.field private _destination:Lorg/eclipse/jetty/client/HttpDestination;

.field private _exchange:Lorg/eclipse/jetty/client/HttpExchange;

.field private _needIntercept:Z

.field private _requestComplete:Z

.field private _responseComplete:Z

.field private _webdavEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/client/webdav/WebdavListener;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jetty/client/HttpDestination;Lorg/eclipse/jetty/client/HttpExchange;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Lorg/eclipse/jetty/client/HttpExchange;->getEventListener()Lorg/eclipse/jetty/client/HttpEventListener;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-direct {p0, v0, v1}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;-><init>(Lorg/eclipse/jetty/client/HttpEventListener;Z)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 10
    .line 11
    iput-object p2, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 12
    .line 13
    const-string p1, "PUT"

    .line 14
    .line 15
    invoke-virtual {p2}, Lorg/eclipse/jetty/client/HttpExchange;->getMethod()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iput-boolean v1, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_webdavEnabled:Z

    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method private checkExists(Ljava/lang/String;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 5
    .line 6
    const-string p1, "have failed miserably"

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return v0

    .line 12
    :cond_0
    new-instance v1, Lorg/eclipse/jetty/client/webdav/PropfindExchange;

    .line 13
    .line 14
    invoke-direct {v1}, Lorg/eclipse/jetty/client/webdav/PropfindExchange;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 18
    .line 19
    invoke-virtual {v2}, Lorg/eclipse/jetty/client/HttpExchange;->getAddress()Lorg/eclipse/jetty/client/Address;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Lorg/eclipse/jetty/client/HttpExchange;->setAddress(Lorg/eclipse/jetty/client/Address;)V

    .line 24
    .line 25
    .line 26
    const-string v2, "GET"

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Lorg/eclipse/jetty/client/HttpExchange;->setMethod(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 32
    .line 33
    invoke-virtual {v2}, Lorg/eclipse/jetty/client/HttpExchange;->getScheme()Lorg/eclipse/jetty/io/Buffer;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v1, v2}, Lorg/eclipse/jetty/client/HttpExchange;->setScheme(Lorg/eclipse/jetty/io/Buffer;)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Lorg/eclipse/jetty/client/security/SecurityListener;

    .line 41
    .line 42
    iget-object v3, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 43
    .line 44
    invoke-direct {v2, v3, v1}, Lorg/eclipse/jetty/client/security/SecurityListener;-><init>(Lorg/eclipse/jetty/client/HttpDestination;Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v2}, Lorg/eclipse/jetty/client/HttpExchange;->setEventListener(Lorg/eclipse/jetty/client/HttpEventListener;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, v0}, Lorg/eclipse/jetty/client/HttpExchange;->setConfigureListeners(Z)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1, p1}, Lorg/eclipse/jetty/client/HttpExchange;->setRequestURI(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 57
    .line 58
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/client/HttpDestination;->send(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 59
    .line 60
    .line 61
    :try_start_0
    invoke-virtual {v1}, Lorg/eclipse/jetty/client/HttpExchange;->waitForDone()I

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1}, Lorg/eclipse/jetty/client/webdav/PropfindExchange;->exists()Z

    .line 65
    .line 66
    .line 67
    move-result p0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    return p0

    .line 69
    :catch_0
    move-exception p0

    .line 70
    sget-object p1, Lorg/eclipse/jetty/client/webdav/WebdavListener;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 71
    .line 72
    invoke-interface {p1, p0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 73
    .line 74
    .line 75
    return v0
.end method

.method private checkWebdavSupported()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/eclipse/jetty/client/webdav/WebdavSupportedExchange;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/eclipse/jetty/client/webdav/WebdavSupportedExchange;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 7
    .line 8
    invoke-virtual {v1}, Lorg/eclipse/jetty/client/HttpExchange;->getAddress()Lorg/eclipse/jetty/client/Address;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setAddress(Lorg/eclipse/jetty/client/Address;)V

    .line 13
    .line 14
    .line 15
    const-string v1, "OPTIONS"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setMethod(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 21
    .line 22
    invoke-virtual {v1}, Lorg/eclipse/jetty/client/HttpExchange;->getScheme()Lorg/eclipse/jetty/io/Buffer;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setScheme(Lorg/eclipse/jetty/io/Buffer;)V

    .line 27
    .line 28
    .line 29
    new-instance v1, Lorg/eclipse/jetty/client/security/SecurityListener;

    .line 30
    .line 31
    iget-object v2, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 32
    .line 33
    invoke-direct {v1, v2, v0}, Lorg/eclipse/jetty/client/security/SecurityListener;-><init>(Lorg/eclipse/jetty/client/HttpDestination;Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setEventListener(Lorg/eclipse/jetty/client/HttpEventListener;)V

    .line 37
    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setConfigureListeners(Z)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 44
    .line 45
    invoke-virtual {v2}, Lorg/eclipse/jetty/client/HttpExchange;->getURI()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v0, v2}, Lorg/eclipse/jetty/client/HttpExchange;->setRequestURI(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpDestination;->send(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 55
    .line 56
    .line 57
    :try_start_0
    invoke-virtual {v0}, Lorg/eclipse/jetty/client/webdav/WebdavSupportedExchange;->waitTilCompletion()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Lorg/eclipse/jetty/client/webdav/WebdavSupportedExchange;->isWebdavSupported()Z

    .line 61
    .line 62
    .line 63
    move-result p0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 64
    return p0

    .line 65
    :catch_0
    move-exception p0

    .line 66
    sget-object v0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 67
    .line 68
    invoke-interface {v0, p0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 69
    .line 70
    .line 71
    return v1
.end method

.method private makeCollection(Ljava/lang/String;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/eclipse/jetty/client/webdav/MkcolExchange;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/eclipse/jetty/client/webdav/MkcolExchange;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 7
    .line 8
    invoke-virtual {v1}, Lorg/eclipse/jetty/client/HttpExchange;->getAddress()Lorg/eclipse/jetty/client/Address;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setAddress(Lorg/eclipse/jetty/client/Address;)V

    .line 13
    .line 14
    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v2, "MKCOL "

    .line 18
    .line 19
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v2, " HTTP/1.1"

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setMethod(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 38
    .line 39
    invoke-virtual {v1}, Lorg/eclipse/jetty/client/HttpExchange;->getScheme()Lorg/eclipse/jetty/io/Buffer;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setScheme(Lorg/eclipse/jetty/io/Buffer;)V

    .line 44
    .line 45
    .line 46
    new-instance v1, Lorg/eclipse/jetty/client/security/SecurityListener;

    .line 47
    .line 48
    iget-object v2, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 49
    .line 50
    invoke-direct {v1, v2, v0}, Lorg/eclipse/jetty/client/security/SecurityListener;-><init>(Lorg/eclipse/jetty/client/HttpDestination;Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setEventListener(Lorg/eclipse/jetty/client/HttpEventListener;)V

    .line 54
    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpExchange;->setConfigureListeners(Z)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, p1}, Lorg/eclipse/jetty/client/HttpExchange;->setRequestURI(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpDestination;->send(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 66
    .line 67
    .line 68
    :try_start_0
    invoke-virtual {v0}, Lorg/eclipse/jetty/client/HttpExchange;->waitForDone()I

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Lorg/eclipse/jetty/client/webdav/MkcolExchange;->exists()Z

    .line 72
    .line 73
    .line 74
    move-result p0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    return p0

    .line 76
    :catch_0
    move-exception p0

    .line 77
    sget-object p1, Lorg/eclipse/jetty/client/webdav/WebdavListener;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 78
    .line 79
    invoke-interface {p1, p0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 80
    .line 81
    .line 82
    return v1
.end method

.method private resolveCollectionIssues()Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/eclipse/jetty/client/HttpExchange;->getURI()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 8
    .line 9
    invoke-virtual {v1}, Lorg/eclipse/jetty/client/HttpExchange;->getURI()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "/"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    array-length v3, v1

    .line 20
    invoke-static {v0}, Lorg/eclipse/jetty/util/URIUtil;->parentPath(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v4, 0x0

    .line 25
    move v5, v4

    .line 26
    :goto_0
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-direct {p0, v0}, Lorg/eclipse/jetty/client/webdav/WebdavListener;->checkExists(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v6

    .line 32
    if-nez v6, :cond_0

    .line 33
    .line 34
    add-int/lit8 v5, v5, 0x1

    .line 35
    .line 36
    invoke-static {v0}, Lorg/eclipse/jetty/util/URIUtil;->parentPath(Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-direct {p0}, Lorg/eclipse/jetty/client/webdav/WebdavListener;->checkWebdavSupported()Z

    .line 42
    .line 43
    .line 44
    move-result v6

    .line 45
    if-eqz v6, :cond_1

    .line 46
    .line 47
    :goto_1
    const/4 v4, 0x1

    .line 48
    if-lez v5, :cond_1

    .line 49
    .line 50
    new-instance v6, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    sub-int v7, v3, v5

    .line 62
    .line 63
    sub-int/2addr v7, v4

    .line 64
    aget-object v4, v1, v7

    .line 65
    .line 66
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-direct {p0, v4}, Lorg/eclipse/jetty/client/webdav/WebdavListener;->makeCollection(Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    new-instance v4, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    aget-object v0, v1, v7

    .line 88
    .line 89
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    add-int/lit8 v5, v5, -0x1

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_1
    return v4
.end method


# virtual methods
.method public onRequestComplete()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_requestComplete:Z

    .line 3
    .line 4
    iget-boolean v1, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_needIntercept:Z

    .line 5
    .line 6
    if-eqz v1, :cond_3

    .line 7
    .line 8
    iget-boolean v1, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_responseComplete:Z

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    :try_start_0
    invoke-direct {p0}, Lorg/eclipse/jetty/client/webdav/WebdavListener;->resolveCollectionIssues()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegatingRequests(Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegatingResponses(Z)V

    .line 23
    .line 24
    .line 25
    iput-boolean v2, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_requestComplete:Z

    .line 26
    .line 27
    iput-boolean v2, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_responseComplete:Z

    .line 28
    .line 29
    iget-object v0, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 30
    .line 31
    iget-object v1, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpDestination;->resend(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegatingRequests(Z)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegatingResponses(Z)V

    .line 41
    .line 42
    .line 43
    invoke-super {p0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->onRequestComplete()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :catch_0
    sget-object v0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 48
    .line 49
    const-string v1, "WebdavListener:Complete:IOException: might not be dealing with dav server, delegate"

    .line 50
    .line 51
    new-array v2, v2, [Ljava/lang/Object;

    .line 52
    .line 53
    invoke-interface {v0, v1, v2}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    invoke-super {p0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->onRequestComplete()V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    sget-object v0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 61
    .line 62
    invoke-interface {v0}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_2

    .line 67
    .line 68
    const-string v1, "WebdavListener:Not ready, calling super"

    .line 69
    .line 70
    new-array v2, v2, [Ljava/lang/Object;

    .line 71
    .line 72
    invoke-interface {v0, v1, v2}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    :cond_2
    invoke-super {p0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->onRequestComplete()V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_3
    invoke-super {p0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->onRequestComplete()V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public onResponseComplete()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_responseComplete:Z

    .line 3
    .line 4
    iget-boolean v1, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_needIntercept:Z

    .line 5
    .line 6
    if-eqz v1, :cond_3

    .line 7
    .line 8
    iget-boolean v1, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_requestComplete:Z

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    :try_start_0
    invoke-direct {p0}, Lorg/eclipse/jetty/client/webdav/WebdavListener;->resolveCollectionIssues()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegatingRequests(Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegatingResponses(Z)V

    .line 23
    .line 24
    .line 25
    iput-boolean v2, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_requestComplete:Z

    .line 26
    .line 27
    iput-boolean v2, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_responseComplete:Z

    .line 28
    .line 29
    iget-object v0, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 30
    .line 31
    iget-object v1, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_exchange:Lorg/eclipse/jetty/client/HttpExchange;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/client/HttpDestination;->resend(Lorg/eclipse/jetty/client/HttpExchange;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    invoke-virtual {p0, v2}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegationResult(Z)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegatingRequests(Z)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegatingResponses(Z)V

    .line 44
    .line 45
    .line 46
    invoke-super {p0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->onResponseComplete()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :catch_0
    sget-object v0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 51
    .line 52
    const-string v1, "WebdavListener:Complete:IOException: might not be dealing with dav server, delegate"

    .line 53
    .line 54
    new-array v2, v2, [Ljava/lang/Object;

    .line 55
    .line 56
    invoke-interface {v0, v1, v2}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    invoke-super {p0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->onResponseComplete()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    sget-object v0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 64
    .line 65
    invoke-interface {v0}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    const-string v1, "WebdavListener:Not ready, calling super"

    .line 72
    .line 73
    new-array v2, v2, [Ljava/lang/Object;

    .line 74
    .line 75
    invoke-interface {v0, v1, v2}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    :cond_2
    invoke-super {p0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->onResponseComplete()V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_3
    invoke-super {p0}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->onResponseComplete()V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public onResponseStatus(Lorg/eclipse/jetty/io/Buffer;ILorg/eclipse/jetty/io/Buffer;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_webdavEnabled:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_needIntercept:Z

    .line 7
    .line 8
    invoke-super {p0, p1, p2, p3}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->onResponseStatus(Lorg/eclipse/jetty/io/Buffer;ILorg/eclipse/jetty/io/Buffer;)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget-object v0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 13
    .line 14
    invoke-interface {v0}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    new-instance v2, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v3, "WebdavListener:Response Status: "

    .line 23
    .line 24
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    new-array v3, v1, [Ljava/lang/Object;

    .line 35
    .line 36
    invoke-interface {v0, v2, v3}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    const/16 v2, 0x193

    .line 40
    .line 41
    const/4 v3, 0x1

    .line 42
    if-eq p2, v2, :cond_3

    .line 43
    .line 44
    const/16 v2, 0x199

    .line 45
    .line 46
    if-ne p2, v2, :cond_2

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    iput-boolean v1, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_needIntercept:Z

    .line 50
    .line 51
    invoke-virtual {p0, v3}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegatingResponses(Z)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v3}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegatingRequests(Z)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_3
    :goto_0
    iget-boolean v2, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_webdavEnabled:Z

    .line 59
    .line 60
    if-eqz v2, :cond_5

    .line 61
    .line 62
    invoke-interface {v0}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eqz v2, :cond_4

    .line 67
    .line 68
    const-string v2, "WebdavListener:Response Status: dav enabled, taking a stab at resolving put issue"

    .line 69
    .line 70
    new-array v4, v1, [Ljava/lang/Object;

    .line 71
    .line 72
    invoke-interface {v0, v2, v4}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    :cond_4
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegatingResponses(Z)V

    .line 76
    .line 77
    .line 78
    iput-boolean v3, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_needIntercept:Z

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_5
    invoke-interface {v0}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    if-eqz v2, :cond_6

    .line 86
    .line 87
    const-string v2, "WebdavListener:Response Status: Webdav Disabled"

    .line 88
    .line 89
    new-array v4, v1, [Ljava/lang/Object;

    .line 90
    .line 91
    invoke-interface {v0, v2, v4}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    :cond_6
    invoke-virtual {p0, v3}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegatingResponses(Z)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0, v3}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->setDelegatingRequests(Z)V

    .line 98
    .line 99
    .line 100
    iput-boolean v1, p0, Lorg/eclipse/jetty/client/webdav/WebdavListener;->_needIntercept:Z

    .line 101
    .line 102
    :goto_1
    invoke-super {p0, p1, p2, p3}, Lorg/eclipse/jetty/client/HttpEventListenerWrapper;->onResponseStatus(Lorg/eclipse/jetty/io/Buffer;ILorg/eclipse/jetty/io/Buffer;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method
