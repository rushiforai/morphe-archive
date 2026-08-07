.class public Lorg/eclipse/jetty/server/handler/ResourceHandler;
.super Lorg/eclipse/jetty/server/handler/HandlerWrapper;
.source "SourceFile"


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;


# instance fields
.field _aliases:Z

.field _baseResource:Lorg/eclipse/jetty/util/resource/Resource;

.field _cacheControl:Lorg/eclipse/jetty/io/ByteArrayBuffer;

.field _context:Lorg/eclipse/jetty/server/handler/ContextHandler;

.field _defaultStylesheet:Lorg/eclipse/jetty/util/resource/Resource;

.field _directory:Z

.field _mimeTypes:Lorg/eclipse/jetty/http/MimeTypes;

.field _stylesheet:Lorg/eclipse/jetty/util/resource/Resource;

.field _welcomeFiles:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/server/handler/ResourceHandler;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/server/handler/HandlerWrapper;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "index.html"

    .line 5
    .line 6
    filled-new-array {v0}, [Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_welcomeFiles:[Ljava/lang/String;

    .line 11
    .line 12
    new-instance v0, Lorg/eclipse/jetty/http/MimeTypes;

    .line 13
    .line 14
    invoke-direct {v0}, Lorg/eclipse/jetty/http/MimeTypes;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_mimeTypes:Lorg/eclipse/jetty/http/MimeTypes;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public doDirectory(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lorg/eclipse/jetty/util/resource/Resource;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_directory:Z

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getRequestURI()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getPathInfo()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "/"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-lez p1, :cond_0

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p1, 0x0

    .line 24
    :goto_0
    invoke-virtual {p3, p0, p1}, Lorg/eclipse/jetty/util/resource/Resource;->getListHTML(Ljava/lang/String;Z)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, "text/html; charset=UTF-8"

    .line 29
    .line 30
    invoke-interface {p2, p1}, Ll/lse0;->setContentType(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-interface {p2}, Ll/lse0;->getWriter()Ljava/io/PrintWriter;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    const/16 p0, 0x193

    .line 42
    .line 43
    invoke-interface {p2, p0}, Ljavax/servlet/http/HttpServletResponse;->sendError(I)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public doResponseHeaders(Ljavax/servlet/http/HttpServletResponse;Lorg/eclipse/jetty/util/resource/Resource;Ljava/lang/String;)V
    .locals 3

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-interface {p1, p3}, Ll/lse0;->setContentType(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    invoke-virtual {p2}, Lorg/eclipse/jetty/util/resource/Resource;->length()J

    .line 7
    .line 8
    .line 9
    move-result-wide p2

    .line 10
    instance-of v0, p1, Lorg/eclipse/jetty/server/Response;

    .line 11
    .line 12
    const-wide/16 v1, 0x0

    .line 13
    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    check-cast p1, Lorg/eclipse/jetty/server/Response;

    .line 17
    .line 18
    invoke-virtual {p1}, Lorg/eclipse/jetty/server/Response;->getHttpFields()Lorg/eclipse/jetty/http/HttpFields;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    cmp-long v0, p2, v1

    .line 23
    .line 24
    if-lez v0, :cond_1

    .line 25
    .line 26
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CONTENT_LENGTH_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 27
    .line 28
    invoke-virtual {p1, v0, p2, p3}, Lorg/eclipse/jetty/http/HttpFields;->putLongField(Lorg/eclipse/jetty/io/Buffer;J)V

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_cacheControl:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 32
    .line 33
    if-eqz p0, :cond_4

    .line 34
    .line 35
    sget-object p2, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE_CONTROL_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 36
    .line 37
    invoke-virtual {p1, p2, p0}, Lorg/eclipse/jetty/http/HttpFields;->put(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    cmp-long v0, p2, v1

    .line 42
    .line 43
    if-lez v0, :cond_3

    .line 44
    .line 45
    const-string v0, "Content-Length"

    .line 46
    .line 47
    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-interface {p1, v0, p2}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_3
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_cacheControl:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 55
    .line 56
    if-eqz p0, :cond_4

    .line 57
    .line 58
    const-string p2, "Cache-Control"

    .line 59
    .line 60
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-interface {p1, p2, p0}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_4
    return-void
.end method

.method public doStart()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getCurrentContext()Lorg/eclipse/jetty/server/handler/ContextHandler$Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->getContextHandler()Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    :goto_0
    iput-object v0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_context:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->isAliases()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput-boolean v0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_aliases:Z

    .line 22
    .line 23
    :cond_1
    iget-boolean v0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_aliases:Z

    .line 24
    .line 25
    if-nez v0, :cond_3

    .line 26
    .line 27
    invoke-static {}, Lorg/eclipse/jetty/util/resource/FileResource;->getCheckAliases()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_2
    const-string p0, "Alias checking disabled"

    .line 35
    .line 36
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_3
    :goto_1
    invoke-super {p0}, Lorg/eclipse/jetty/server/handler/HandlerWrapper;->doStart()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public getBaseResource()Lorg/eclipse/jetty/util/resource/Resource;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_baseResource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    :cond_0
    return-object p0
.end method

.method public getCacheControl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_cacheControl:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getMimeTypes()Lorg/eclipse/jetty/http/MimeTypes;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_mimeTypes:Lorg/eclipse/jetty/http/MimeTypes;

    .line 2
    .line 3
    return-object p0
.end method

.method public getResource(Ljava/lang/String;)Lorg/eclipse/jetty/util/resource/Resource;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    if-eqz p1, :cond_2

    .line 60
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 61
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_baseResource:Lorg/eclipse/jetty/util/resource/Resource;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 62
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_context:Lorg/eclipse/jetty/server/handler/ContextHandler;

    if-nez p0, :cond_0

    return-object v1

    .line 63
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getBaseResource()Lorg/eclipse/jetty/util/resource/Resource;

    move-result-object v0

    if-nez v0, :cond_1

    return-object v1

    .line 64
    :cond_1
    :try_start_0
    invoke-static {p1}, Lorg/eclipse/jetty/util/URIUtil;->canonicalPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Lorg/eclipse/jetty/util/resource/Resource;->addPath(Ljava/lang/String;)Lorg/eclipse/jetty/util/resource/Resource;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 66
    sget-object p1, Lorg/eclipse/jetty/server/handler/ResourceHandler;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    invoke-interface {p1, p0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    return-object v1

    .line 67
    :cond_2
    new-instance p0, Ljava/net/MalformedURLException;

    invoke-direct {p0, p1}, Ljava/net/MalformedURLException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public getResource(Ljavax/servlet/http/HttpServletRequest;)Lorg/eclipse/jetty/util/resource/Resource;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 1
    const-string v0, "javax.servlet.include.request_uri"

    .line 2
    .line 3
    invoke-interface {p1, v0}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    :goto_0
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const-string v0, "javax.servlet.include.servlet_path"

    .line 15
    .line 16
    invoke-interface {p1, v0}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/String;

    .line 21
    .line 22
    const-string v1, "javax.servlet.include.path_info"

    .line 23
    .line 24
    invoke-interface {p1, v1}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Ljava/lang/String;

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    if-nez v1, :cond_2

    .line 33
    .line 34
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getServletPath()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getPathInfo()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getServletPath()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getPathInfo()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    :cond_2
    :goto_1
    invoke-static {v0, v1}, Lorg/eclipse/jetty/util/URIUtil;->addPaths(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/handler/ResourceHandler;->getResource(Ljava/lang/String;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0
.end method

.method public getResourceBase()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_baseResource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getStylesheet()Lorg/eclipse/jetty/util/resource/Resource;
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_stylesheet:Lorg/eclipse/jetty/util/resource/Resource;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_defaultStylesheet:Lorg/eclipse/jetty/util/resource/Resource;

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "/jetty-dir.css"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getResource(Ljava/lang/String;)Ljava/net/URL;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Lorg/eclipse/jetty/util/resource/Resource;->newResource(Ljava/net/URL;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_defaultStylesheet:Lorg/eclipse/jetty/util/resource/Resource;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catch_0
    move-exception v0

    .line 28
    sget-object v1, Lorg/eclipse/jetty/server/handler/ResourceHandler;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const/4 v3, 0x0

    .line 35
    new-array v3, v3, [Ljava/lang/Object;

    .line 36
    .line 37
    invoke-interface {v1, v2, v3}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    invoke-interface {v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    :goto_0
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_defaultStylesheet:Lorg/eclipse/jetty/util/resource/Resource;

    .line 44
    .line 45
    return-object p0
.end method

.method public getWelcome(Lorg/eclipse/jetty/util/resource/Resource;)Lorg/eclipse/jetty/util/resource/Resource;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_welcomeFiles:[Ljava/lang/String;

    .line 3
    .line 4
    array-length v2, v1

    .line 5
    if-ge v0, v2, :cond_1

    .line 6
    .line 7
    aget-object v1, v1, v0

    .line 8
    .line 9
    invoke-virtual {p1, v1}, Lorg/eclipse/jetty/util/resource/Resource;->addPath(Ljava/lang/String;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lorg/eclipse/jetty/util/resource/Resource;->exists()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    invoke-virtual {v1}, Lorg/eclipse/jetty/util/resource/Resource;->isDirectory()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    return-object v1

    .line 26
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method

.method public getWelcomeFiles()[Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_welcomeFiles:[Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public handle(Ljava/lang/String;Lorg/eclipse/jetty/server/Request;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Lorg/eclipse/jetty/server/Request;->isHandled()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_5

    .line 8
    .line 9
    :cond_0
    const-string v0, "GET"

    .line 10
    .line 11
    invoke-interface {p3}, Ljavax/servlet/http/HttpServletRequest;->getMethod()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x0

    .line 20
    const/4 v2, 0x1

    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    const-string v0, "HEAD"

    .line 24
    .line 25
    invoke-interface {p3}, Ljavax/servlet/http/HttpServletRequest;->getMethod()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    invoke-super {p0, p1, p2, p3, p4}, Lorg/eclipse/jetty/server/handler/HandlerWrapper;->handle(Ljava/lang/String;Lorg/eclipse/jetty/server/Request;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    move v0, v2

    .line 40
    goto :goto_0

    .line 41
    :cond_2
    move v0, v1

    .line 42
    :goto_0
    invoke-virtual {p0, p3}, Lorg/eclipse/jetty/server/handler/ResourceHandler;->getResource(Ljavax/servlet/http/HttpServletRequest;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    if-eqz v3, :cond_3

    .line 47
    .line 48
    invoke-virtual {v3}, Lorg/eclipse/jetty/util/resource/Resource;->exists()Z

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    if-nez v4, :cond_5

    .line 53
    .line 54
    :cond_3
    const-string v3, "/jetty-dir.css"

    .line 55
    .line 56
    invoke-virtual {p1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-eqz v3, :cond_f

    .line 61
    .line 62
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/ResourceHandler;->getStylesheet()Lorg/eclipse/jetty/util/resource/Resource;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    if-nez v3, :cond_4

    .line 67
    .line 68
    goto/16 :goto_5

    .line 69
    .line 70
    :cond_4
    const-string p1, "text/css"

    .line 71
    .line 72
    invoke-interface {p4, p1}, Ll/lse0;->setContentType(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_5
    iget-boolean p1, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_aliases:Z

    .line 76
    .line 77
    if-nez p1, :cond_6

    .line 78
    .line 79
    invoke-virtual {v3}, Lorg/eclipse/jetty/util/resource/Resource;->getAlias()Ljava/net/URL;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    if-eqz p1, :cond_6

    .line 84
    .line 85
    sget-object p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 86
    .line 87
    new-instance p1, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string p2, " aliased to "

    .line 96
    .line 97
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v3}, Lorg/eclipse/jetty/util/resource/Resource;->getAlias()Ljava/net/URL;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    new-array p2, v1, [Ljava/lang/Object;

    .line 112
    .line 113
    invoke-interface {p0, p1, p2}, Lorg/eclipse/jetty/util/log/Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_6
    invoke-virtual {p2, v2}, Lorg/eclipse/jetty/server/Request;->setHandled(Z)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v3}, Lorg/eclipse/jetty/util/resource/Resource;->isDirectory()Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    if-eqz p1, :cond_9

    .line 125
    .line 126
    invoke-interface {p3}, Ljavax/servlet/http/HttpServletRequest;->getPathInfo()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    const-string v1, "/"

    .line 131
    .line 132
    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    if-nez p1, :cond_7

    .line 137
    .line 138
    invoke-interface {p3}, Ljavax/servlet/http/HttpServletRequest;->getRequestURI()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-static {p0, v1}, Lorg/eclipse/jetty/util/URIUtil;->addPaths(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-interface {p4, p0}, Ljavax/servlet/http/HttpServletResponse;->encodeRedirectURL(Ljava/lang/String;)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-interface {p4, p0}, Ljavax/servlet/http/HttpServletResponse;->sendRedirect(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    return-void

    .line 154
    :cond_7
    invoke-virtual {p0, v3}, Lorg/eclipse/jetty/server/handler/ResourceHandler;->getWelcome(Lorg/eclipse/jetty/util/resource/Resource;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    if-eqz p1, :cond_8

    .line 159
    .line 160
    invoke-virtual {p1}, Lorg/eclipse/jetty/util/resource/Resource;->exists()Z

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    if-eqz v1, :cond_8

    .line 165
    .line 166
    move-object v4, p1

    .line 167
    goto :goto_1

    .line 168
    :cond_8
    invoke-virtual {p0, p3, p4, v3}, Lorg/eclipse/jetty/server/handler/ResourceHandler;->doDirectory(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lorg/eclipse/jetty/util/resource/Resource;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p2, v2}, Lorg/eclipse/jetty/server/Request;->setHandled(Z)V

    .line 172
    .line 173
    .line 174
    return-void

    .line 175
    :cond_9
    move-object v4, v3

    .line 176
    :goto_1
    invoke-virtual {v4}, Lorg/eclipse/jetty/util/resource/Resource;->lastModified()J

    .line 177
    .line 178
    .line 179
    move-result-wide p1

    .line 180
    const-wide/16 v1, 0x0

    .line 181
    .line 182
    cmp-long v3, p1, v1

    .line 183
    .line 184
    if-lez v3, :cond_a

    .line 185
    .line 186
    const-string v3, "If-Modified-Since"

    .line 187
    .line 188
    invoke-interface {p3, v3}, Ljavax/servlet/http/HttpServletRequest;->getDateHeader(Ljava/lang/String;)J

    .line 189
    .line 190
    .line 191
    move-result-wide v5

    .line 192
    cmp-long v1, v5, v1

    .line 193
    .line 194
    if-lez v1, :cond_a

    .line 195
    .line 196
    const-wide/16 v1, 0x3e8

    .line 197
    .line 198
    div-long v7, p1, v1

    .line 199
    .line 200
    div-long/2addr v5, v1

    .line 201
    cmp-long v1, v7, v5

    .line 202
    .line 203
    if-gtz v1, :cond_a

    .line 204
    .line 205
    const/16 p0, 0x130

    .line 206
    .line 207
    invoke-interface {p4, p0}, Ljavax/servlet/http/HttpServletResponse;->setStatus(I)V

    .line 208
    .line 209
    .line 210
    return-void

    .line 211
    :cond_a
    iget-object v1, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_mimeTypes:Lorg/eclipse/jetty/http/MimeTypes;

    .line 212
    .line 213
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    invoke-virtual {v1, v2}, Lorg/eclipse/jetty/http/MimeTypes;->getMimeByExtension(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    .line 218
    .line 219
    .line 220
    move-result-object v1

    .line 221
    if-nez v1, :cond_b

    .line 222
    .line 223
    iget-object v1, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_mimeTypes:Lorg/eclipse/jetty/http/MimeTypes;

    .line 224
    .line 225
    invoke-interface {p3}, Ljavax/servlet/http/HttpServletRequest;->getPathInfo()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object p3

    .line 229
    invoke-virtual {v1, p3}, Lorg/eclipse/jetty/http/MimeTypes;->getMimeByExtension(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    :cond_b
    if-eqz v1, :cond_c

    .line 234
    .line 235
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p3

    .line 239
    goto :goto_2

    .line 240
    :cond_c
    const/4 p3, 0x0

    .line 241
    :goto_2
    invoke-virtual {p0, p4, v4, p3}, Lorg/eclipse/jetty/server/handler/ResourceHandler;->doResponseHeaders(Ljavax/servlet/http/HttpServletResponse;Lorg/eclipse/jetty/util/resource/Resource;Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    const-string p0, "Last-Modified"

    .line 245
    .line 246
    invoke-interface {p4, p0, p1, p2}, Ljavax/servlet/http/HttpServletResponse;->setDateHeader(Ljava/lang/String;J)V

    .line 247
    .line 248
    .line 249
    if-eqz v0, :cond_d

    .line 250
    .line 251
    goto :goto_5

    .line 252
    :cond_d
    :try_start_0
    invoke-interface {p4}, Ll/lse0;->getOutputStream()Ll/ese0;

    .line 253
    .line 254
    .line 255
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 256
    :goto_3
    move-object v5, p0

    .line 257
    goto :goto_4

    .line 258
    :catch_0
    new-instance p0, Lorg/eclipse/jetty/io/WriterOutputStream;

    .line 259
    .line 260
    invoke-interface {p4}, Ll/lse0;->getWriter()Ljava/io/PrintWriter;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/io/WriterOutputStream;-><init>(Ljava/io/Writer;)V

    .line 265
    .line 266
    .line 267
    goto :goto_3

    .line 268
    :goto_4
    instance-of p0, v5, Lorg/eclipse/jetty/server/AbstractHttpConnection$Output;

    .line 269
    .line 270
    if-eqz p0, :cond_e

    .line 271
    .line 272
    check-cast v5, Lorg/eclipse/jetty/server/AbstractHttpConnection$Output;

    .line 273
    .line 274
    invoke-virtual {v4}, Lorg/eclipse/jetty/util/resource/Resource;->getInputStream()Ljava/io/InputStream;

    .line 275
    .line 276
    .line 277
    move-result-object p0

    .line 278
    invoke-virtual {v5, p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection$Output;->sendContent(Ljava/lang/Object;)V

    .line 279
    .line 280
    .line 281
    goto :goto_5

    .line 282
    :cond_e
    const-wide/16 v6, 0x0

    .line 283
    .line 284
    invoke-virtual {v4}, Lorg/eclipse/jetty/util/resource/Resource;->length()J

    .line 285
    .line 286
    .line 287
    move-result-wide v8

    .line 288
    invoke-virtual/range {v4 .. v9}, Lorg/eclipse/jetty/util/resource/Resource;->writeTo(Ljava/io/OutputStream;JJ)V

    .line 289
    .line 290
    .line 291
    :goto_5
    return-void

    .line 292
    :cond_f
    invoke-super {p0, p1, p2, p3, p4}, Lorg/eclipse/jetty/server/handler/HandlerWrapper;->handle(Ljava/lang/String;Lorg/eclipse/jetty/server/Request;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

    .line 293
    .line 294
    .line 295
    return-void
.end method

.method public isAliases()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_aliases:Z

    .line 2
    .line 3
    return p0
.end method

.method public isDirectoriesListed()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_directory:Z

    .line 2
    .line 3
    return p0
.end method

.method public setAliases(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_aliases:Z

    .line 2
    .line 3
    return-void
.end method

.method public setBaseResource(Lorg/eclipse/jetty/util/resource/Resource;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_baseResource:Lorg/eclipse/jetty/util/resource/Resource;

    .line 2
    .line 3
    return-void
.end method

.method public setCacheControl(Ljava/lang/String;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    new-instance v0, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    move-object p1, v0

    .line 11
    :goto_0
    iput-object p1, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_cacheControl:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 12
    .line 13
    return-void
.end method

.method public setDirectoriesListed(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_directory:Z

    .line 2
    .line 3
    return-void
.end method

.method public setMimeTypes(Lorg/eclipse/jetty/http/MimeTypes;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_mimeTypes:Lorg/eclipse/jetty/http/MimeTypes;

    .line 2
    .line 3
    return-void
.end method

.method public setResourceBase(Ljava/lang/String;)V
    .locals 3

    .line 1
    :try_start_0
    invoke-static {p1}, Lorg/eclipse/jetty/util/resource/Resource;->newResource(Ljava/lang/String;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/server/handler/ResourceHandler;->setBaseResource(Lorg/eclipse/jetty/util/resource/Resource;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    sget-object v0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, 0x0

    .line 17
    new-array v2, v2, [Ljava/lang/Object;

    .line 18
    .line 19
    invoke-interface {v0, v1, v2}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v0, p0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setStylesheet(Ljava/lang/String;)V
    .locals 4

    .line 1
    const-string v0, "unable to find custom stylesheet: "

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    invoke-static {p1}, Lorg/eclipse/jetty/util/resource/Resource;->newResource(Ljava/lang/String;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    iput-object v2, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_stylesheet:Lorg/eclipse/jetty/util/resource/Resource;

    .line 9
    .line 10
    invoke-virtual {v2}, Lorg/eclipse/jetty/util/resource/Resource;->exists()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-nez v2, :cond_0

    .line 15
    .line 16
    sget-object v2, Lorg/eclipse/jetty/server/handler/ResourceHandler;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 17
    .line 18
    new-instance v3, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-array v3, v1, [Ljava/lang/Object;

    .line 31
    .line 32
    invoke-interface {v2, v0, v3}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    iput-object v0, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_stylesheet:Lorg/eclipse/jetty/util/resource/Resource;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    return-void

    .line 39
    :catch_0
    move-exception p0

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-void

    .line 42
    :goto_0
    sget-object v0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    new-array v1, v1, [Ljava/lang/Object;

    .line 49
    .line 50
    invoke-interface {v0, v2, v1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    invoke-interface {v0, p0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    throw p0
.end method

.method public setWelcomeFiles([Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/handler/ResourceHandler;->_welcomeFiles:[Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
