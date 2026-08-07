.class public Lorg/eclipse/jetty/servlet/DefaultServlet;
.super Ljavax/servlet/http/HttpServlet;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/util/resource/ResourceFactory;


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;

.field private static final serialVersionUID:J = 0x446c8213da929ba9L


# instance fields
.field private _acceptRanges:Z

.field private _cache:Lorg/eclipse/jetty/server/ResourceCache;

.field private _cacheControl:Lorg/eclipse/jetty/io/ByteArrayBuffer;

.field private _contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

.field private _defaultHolder:Lorg/eclipse/jetty/servlet/ServletHolder;

.field private _dirAllowed:Z

.field private _gzip:Z

.field private _mimeTypes:Lorg/eclipse/jetty/http/MimeTypes;

.field private _pathInfoOnly:Z

.field private _redirectWelcome:Z

.field private _relativeResourceBase:Ljava/lang/String;

.field private _resourceBase:Lorg/eclipse/jetty/util/resource/Resource;

.field private _servletContext:Ll/ase0;

.field private _servletHandler:Lorg/eclipse/jetty/servlet/ServletHandler;

.field private _stylesheet:Lorg/eclipse/jetty/util/resource/Resource;

.field private _useFileMappedBuffer:Z

.field private _welcomeExactServlets:Z

.field private _welcomeServlets:Z

.field private _welcomes:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/servlet/DefaultServlet;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/servlet/DefaultServlet;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljavax/servlet/http/HttpServlet;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_acceptRanges:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_dirAllowed:Z

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_welcomeServlets:Z

    .line 11
    .line 12
    iput-boolean v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_welcomeExactServlets:Z

    .line 13
    .line 14
    iput-boolean v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_redirectWelcome:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_gzip:Z

    .line 17
    .line 18
    iput-boolean v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_pathInfoOnly:Z

    .line 19
    .line 20
    iput-boolean v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_useFileMappedBuffer:Z

    .line 21
    .line 22
    return-void
.end method

.method private getInitBoolean(Ljava/lang/String;Z)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_3

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    const-string p1, "t"

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_2

    .line 21
    .line 22
    const-string p1, "T"

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_2

    .line 29
    .line 30
    const-string p1, "y"

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-nez p1, :cond_2

    .line 37
    .line 38
    const-string p1, "Y"

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_2

    .line 45
    .line 46
    const-string p1, "1"

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    const/4 p0, 0x0

    .line 56
    return p0

    .line 57
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 58
    return p0

    .line 59
    :cond_3
    :goto_1
    return p2
.end method

.method private getInitInt(Ljava/lang/String;I)I
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-lez p0, :cond_1

    .line 18
    .line 19
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_1
    return p2
.end method

.method private getWelcomeFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_welcomes:[Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_welcomes:[Ljava/lang/String;

    .line 9
    .line 10
    array-length v3, v2

    .line 11
    if-ge v0, v3, :cond_5

    .line 12
    .line 13
    aget-object v2, v2, v0

    .line 14
    .line 15
    invoke-static {p1, v2}, Lorg/eclipse/jetty/util/URIUtil;->addPaths(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {p0, v2}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getResource(Ljava/lang/String;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    if-eqz v3, :cond_1

    .line 24
    .line 25
    invoke-virtual {v3}, Lorg/eclipse/jetty/util/resource/Resource;->exists()Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_welcomes:[Ljava/lang/String;

    .line 32
    .line 33
    aget-object p0, p0, v0

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_1
    iget-boolean v3, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_welcomeServlets:Z

    .line 37
    .line 38
    if-nez v3, :cond_2

    .line 39
    .line 40
    iget-boolean v3, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_welcomeExactServlets:Z

    .line 41
    .line 42
    if-eqz v3, :cond_4

    .line 43
    .line 44
    :cond_2
    if-nez v1, :cond_4

    .line 45
    .line 46
    iget-object v3, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_servletHandler:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 47
    .line 48
    invoke-virtual {v3, v2}, Lorg/eclipse/jetty/servlet/ServletHandler;->getHolderEntry(Ljava/lang/String;)Lorg/eclipse/jetty/http/PathMap$Entry;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    if-eqz v3, :cond_4

    .line 53
    .line 54
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    iget-object v5, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_defaultHolder:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 59
    .line 60
    if-eq v4, v5, :cond_4

    .line 61
    .line 62
    iget-boolean v4, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_welcomeServlets:Z

    .line 63
    .line 64
    if-nez v4, :cond_3

    .line 65
    .line 66
    iget-boolean v4, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_welcomeExactServlets:Z

    .line 67
    .line 68
    if-eqz v4, :cond_4

    .line 69
    .line 70
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    invoke-virtual {v3, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    if-eqz v3, :cond_4

    .line 79
    .line 80
    :cond_3
    move-object v1, v2

    .line 81
    :cond_4
    add-int/lit8 v0, v0, 0x1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_5
    return-object v1
.end method

.method private hasDefinedRange(Ljava/util/Enumeration;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Enumeration<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 4
    .line 5
    .line 6
    move-result p0

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


# virtual methods
.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_cache:Lorg/eclipse/jetty/server/ResourceCache;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/ResourceCache;->flushCache()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-super {p0}, Ljavax/servlet/GenericServlet;->destroy()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public doGet(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    const-string v3, "!"

    .line 8
    .line 9
    const-string v4, "uri="

    .line 10
    .line 11
    const-string v5, "javax.servlet.include.request_uri"

    .line 12
    .line 13
    invoke-interface {v1, v5}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    const/4 v6, 0x1

    .line 18
    const/4 v7, 0x0

    .line 19
    if-eqz v5, :cond_0

    .line 20
    .line 21
    move v5, v6

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move v5, v7

    .line 24
    :goto_0
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object v8

    .line 28
    const/4 v9, 0x0

    .line 29
    if-eqz v5, :cond_2

    .line 30
    .line 31
    const-string v5, "javax.servlet.include.servlet_path"

    .line 32
    .line 33
    invoke-interface {v1, v5}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    check-cast v5, Ljava/lang/String;

    .line 38
    .line 39
    const-string v10, "javax.servlet.include.path_info"

    .line 40
    .line 41
    invoke-interface {v1, v10}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v10

    .line 45
    check-cast v10, Ljava/lang/String;

    .line 46
    .line 47
    if-nez v5, :cond_1

    .line 48
    .line 49
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getServletPath()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getPathInfo()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v10

    .line 57
    :cond_1
    :goto_1
    move-object v11, v9

    .line 58
    goto :goto_3

    .line 59
    :cond_2
    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 60
    .line 61
    iget-boolean v5, v0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_pathInfoOnly:Z

    .line 62
    .line 63
    if-eqz v5, :cond_3

    .line 64
    .line 65
    const-string v5, "/"

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_3
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getServletPath()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    :goto_2
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getPathInfo()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v10

    .line 76
    const-string v11, "Range"

    .line 77
    .line 78
    invoke-interface {v1, v11}, Ljavax/servlet/http/HttpServletRequest;->getHeaders(Ljava/lang/String;)Ljava/util/Enumeration;

    .line 79
    .line 80
    .line 81
    move-result-object v11

    .line 82
    invoke-direct {v0, v11}, Lorg/eclipse/jetty/servlet/DefaultServlet;->hasDefinedRange(Ljava/util/Enumeration;)Z

    .line 83
    .line 84
    .line 85
    move-result v12

    .line 86
    if-nez v12, :cond_4

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_4
    :goto_3
    invoke-static {v5, v10}, Lorg/eclipse/jetty/util/URIUtil;->addPaths(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    if-nez v10, :cond_5

    .line 94
    .line 95
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getServletPath()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v10

    .line 99
    :cond_5
    const-string v12, "/"

    .line 100
    .line 101
    invoke-virtual {v10, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v10

    .line 105
    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    .line 106
    .line 107
    .line 108
    move-result v12

    .line 109
    if-nez v12, :cond_6

    .line 110
    .line 111
    iget-boolean v12, v0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_gzip:Z

    .line 112
    .line 113
    if-eqz v12, :cond_6

    .line 114
    .line 115
    if-nez v11, :cond_6

    .line 116
    .line 117
    if-nez v10, :cond_6

    .line 118
    .line 119
    const-string v12, "Vary"

    .line 120
    .line 121
    const-string v13, "Accept-Encoding"

    .line 122
    .line 123
    invoke-interface {v2, v12, v13}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    const-string v12, "Accept-Encoding"

    .line 127
    .line 128
    invoke-interface {v1, v12}, Ljavax/servlet/http/HttpServletRequest;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v12

    .line 132
    if-eqz v12, :cond_6

    .line 133
    .line 134
    const-string v13, "gzip"

    .line 135
    .line 136
    invoke-virtual {v12, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 137
    .line 138
    .line 139
    move-result v12

    .line 140
    if-ltz v12, :cond_6

    .line 141
    .line 142
    move v12, v6

    .line 143
    goto :goto_4

    .line 144
    :cond_6
    move v12, v7

    .line 145
    :goto_4
    if-eqz v12, :cond_a

    .line 146
    .line 147
    :try_start_0
    new-instance v13, Ljava/lang/StringBuilder;

    .line 148
    .line 149
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    const-string v14, ".gz"

    .line 156
    .line 157
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v13

    .line 164
    iget-object v14, v0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_cache:Lorg/eclipse/jetty/server/ResourceCache;

    .line 165
    .line 166
    if-nez v14, :cond_7

    .line 167
    .line 168
    invoke-virtual {v0, v13}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getResource(Ljava/lang/String;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 169
    .line 170
    .line 171
    move-result-object v13

    .line 172
    move-object v14, v9

    .line 173
    goto :goto_6

    .line 174
    :catchall_0
    move-exception v0

    .line 175
    move-object v4, v9

    .line 176
    goto/16 :goto_18

    .line 177
    .line 178
    :catch_0
    move-exception v0

    .line 179
    move-object v14, v9

    .line 180
    goto/16 :goto_16

    .line 181
    .line 182
    :cond_7
    invoke-virtual {v14, v13}, Lorg/eclipse/jetty/server/ResourceCache;->lookup(Ljava/lang/String;)Lorg/eclipse/jetty/http/HttpContent;

    .line 183
    .line 184
    .line 185
    move-result-object v13
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 186
    if-nez v13, :cond_8

    .line 187
    .line 188
    move-object v14, v9

    .line 189
    goto :goto_5

    .line 190
    :cond_8
    :try_start_1
    invoke-interface {v13}, Lorg/eclipse/jetty/http/HttpContent;->getResource()Lorg/eclipse/jetty/util/resource/Resource;

    .line 191
    .line 192
    .line 193
    move-result-object v14
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 194
    :goto_5
    move-object/from16 v16, v14

    .line 195
    .line 196
    move-object v14, v13

    .line 197
    move-object/from16 v13, v16

    .line 198
    .line 199
    :goto_6
    if-eqz v13, :cond_9

    .line 200
    .line 201
    :try_start_2
    invoke-virtual {v13}, Lorg/eclipse/jetty/util/resource/Resource;->exists()Z

    .line 202
    .line 203
    .line 204
    move-result v15

    .line 205
    if-eqz v15, :cond_9

    .line 206
    .line 207
    invoke-virtual {v13}, Lorg/eclipse/jetty/util/resource/Resource;->isDirectory()Z

    .line 208
    .line 209
    .line 210
    move-result v15

    .line 211
    if-eqz v15, :cond_b

    .line 212
    .line 213
    goto :goto_8

    .line 214
    :catchall_1
    move-exception v0

    .line 215
    move-object v4, v13

    .line 216
    :goto_7
    move-object v9, v14

    .line 217
    goto/16 :goto_18

    .line 218
    .line 219
    :catch_1
    move-exception v0

    .line 220
    move-object v9, v13

    .line 221
    goto/16 :goto_16

    .line 222
    .line 223
    :cond_9
    :goto_8
    move v12, v7

    .line 224
    goto :goto_9

    .line 225
    :catchall_2
    move-exception v0

    .line 226
    move-object v4, v9

    .line 227
    move-object v9, v13

    .line 228
    goto/16 :goto_18

    .line 229
    .line 230
    :catch_2
    move-exception v0

    .line 231
    move-object v14, v13

    .line 232
    goto/16 :goto_16

    .line 233
    .line 234
    :cond_a
    move-object v13, v9

    .line 235
    move-object v14, v13

    .line 236
    :cond_b
    :goto_9
    if-nez v12, :cond_e

    .line 237
    .line 238
    iget-object v15, v0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_cache:Lorg/eclipse/jetty/server/ResourceCache;

    .line 239
    .line 240
    if-nez v15, :cond_c

    .line 241
    .line 242
    invoke-virtual {v0, v5}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getResource(Ljava/lang/String;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 243
    .line 244
    .line 245
    move-result-object v9

    .line 246
    goto :goto_a

    .line 247
    :cond_c
    invoke-virtual {v15, v5}, Lorg/eclipse/jetty/server/ResourceCache;->lookup(Ljava/lang/String;)Lorg/eclipse/jetty/http/HttpContent;

    .line 248
    .line 249
    .line 250
    move-result-object v14

    .line 251
    if-nez v14, :cond_d

    .line 252
    .line 253
    goto :goto_a

    .line 254
    :cond_d
    invoke-interface {v14}, Lorg/eclipse/jetty/http/HttpContent;->getResource()Lorg/eclipse/jetty/util/resource/Resource;

    .line 255
    .line 256
    .line 257
    move-result-object v9
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 258
    goto :goto_a

    .line 259
    :cond_e
    move-object v9, v13

    .line 260
    :goto_a
    :try_start_3
    sget-object v13, Lorg/eclipse/jetty/servlet/DefaultServlet;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 261
    .line 262
    invoke-interface {v13}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 263
    .line 264
    .line 265
    move-result v15
    :try_end_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_8
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 266
    if-eqz v15, :cond_10

    .line 267
    .line 268
    :try_start_4
    new-instance v15, Ljava/lang/StringBuilder;

    .line 269
    .line 270
    invoke-direct {v15, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getRequestURI()Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object v4

    .line 277
    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    const-string v4, " resource="

    .line 281
    .line 282
    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    if-eqz v14, :cond_f

    .line 289
    .line 290
    const-string v4, " content"

    .line 291
    .line 292
    goto :goto_b

    .line 293
    :catchall_3
    move-exception v0

    .line 294
    move-object v4, v9

    .line 295
    goto :goto_7

    .line 296
    :catch_3
    move-exception v0

    .line 297
    goto/16 :goto_16

    .line 298
    .line 299
    :cond_f
    const-string v4, ""

    .line 300
    .line 301
    :goto_b
    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 302
    .line 303
    .line 304
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object v4

    .line 308
    new-array v15, v7, [Ljava/lang/Object;

    .line 309
    .line 310
    invoke-interface {v13, v4, v15}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 311
    .line 312
    .line 313
    :cond_10
    if-eqz v9, :cond_11

    .line 314
    .line 315
    :try_start_5
    invoke-virtual {v9}, Lorg/eclipse/jetty/util/resource/Resource;->exists()Z

    .line 316
    .line 317
    .line 318
    move-result v4

    .line 319
    if-nez v4, :cond_12

    .line 320
    .line 321
    :cond_11
    move-object v4, v9

    .line 322
    goto/16 :goto_14

    .line 323
    .line 324
    :cond_12
    invoke-virtual {v9}, Lorg/eclipse/jetty/util/resource/Resource;->isDirectory()Z

    .line 325
    .line 326
    .line 327
    move-result v3
    :try_end_5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_5} :catch_8
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 328
    if-nez v3, :cond_19

    .line 329
    .line 330
    if-eqz v10, :cond_14

    .line 331
    .line 332
    :try_start_6
    iget-object v3, v0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 333
    .line 334
    invoke-virtual {v3}, Lorg/eclipse/jetty/server/handler/ContextHandler;->isAliases()Z

    .line 335
    .line 336
    .line 337
    move-result v3

    .line 338
    if-eqz v3, :cond_14

    .line 339
    .line 340
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 341
    .line 342
    .line 343
    move-result v3

    .line 344
    if-le v3, v6, :cond_14

    .line 345
    .line 346
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getQueryString()Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object v1

    .line 350
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 351
    .line 352
    .line 353
    move-result v3

    .line 354
    sub-int/2addr v3, v6

    .line 355
    invoke-virtual {v5, v7, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object v3

    .line 359
    if-eqz v1, :cond_13

    .line 360
    .line 361
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 362
    .line 363
    .line 364
    move-result v4

    .line 365
    if-eqz v4, :cond_13

    .line 366
    .line 367
    new-instance v4, Ljava/lang/StringBuilder;

    .line 368
    .line 369
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 370
    .line 371
    .line 372
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 373
    .line 374
    .line 375
    const-string v3, "?"

    .line 376
    .line 377
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 378
    .line 379
    .line 380
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 381
    .line 382
    .line 383
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 384
    .line 385
    .line 386
    move-result-object v3

    .line 387
    :cond_13
    iget-object v0, v0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_servletContext:Ll/ase0;

    .line 388
    .line 389
    invoke-interface {v0}, Ll/ase0;->getContextPath()Ljava/lang/String;

    .line 390
    .line 391
    .line 392
    move-result-object v0

    .line 393
    invoke-static {v0, v3}, Lorg/eclipse/jetty/util/URIUtil;->addPaths(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 394
    .line 395
    .line 396
    move-result-object v0

    .line 397
    invoke-interface {v2, v0}, Ljavax/servlet/http/HttpServletResponse;->encodeRedirectURL(Ljava/lang/String;)Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    invoke-interface {v2, v0}, Ljavax/servlet/http/HttpServletResponse;->sendRedirect(Ljava/lang/String;)V

    .line 402
    .line 403
    .line 404
    move-object v4, v9

    .line 405
    goto/16 :goto_15

    .line 406
    .line 407
    :cond_14
    if-nez v14, :cond_15

    .line 408
    .line 409
    new-instance v3, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;

    .line 410
    .line 411
    iget-object v4, v0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_mimeTypes:Lorg/eclipse/jetty/http/MimeTypes;

    .line 412
    .line 413
    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 414
    .line 415
    .line 416
    move-result-object v6

    .line 417
    invoke-virtual {v4, v6}, Lorg/eclipse/jetty/http/MimeTypes;->getMimeByExtension(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    .line 418
    .line 419
    .line 420
    move-result-object v4

    .line 421
    invoke-interface {v2}, Ll/lse0;->getBufferSize()I

    .line 422
    .line 423
    .line 424
    move-result v6

    .line 425
    invoke-direct {v3, v9, v4, v6}, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;-><init>(Lorg/eclipse/jetty/util/resource/Resource;Lorg/eclipse/jetty/io/Buffer;I)V
    :try_end_6
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 426
    .line 427
    .line 428
    move-object v14, v3

    .line 429
    :cond_15
    :try_start_7
    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    .line 430
    .line 431
    .line 432
    move-result v3
    :try_end_7
    .catch Ljava/lang/IllegalArgumentException; {:try_start_7 .. :try_end_7} :catch_5
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    .line 433
    if-nez v3, :cond_17

    .line 434
    .line 435
    :try_start_8
    invoke-virtual {v0, v1, v2, v9, v14}, Lorg/eclipse/jetty/servlet/DefaultServlet;->passConditionalHeaders(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lorg/eclipse/jetty/util/resource/Resource;Lorg/eclipse/jetty/http/HttpContent;)Z

    .line 436
    .line 437
    .line 438
    move-result v3

    .line 439
    if-eqz v3, :cond_16

    .line 440
    .line 441
    goto :goto_c

    .line 442
    :cond_16
    move-object v4, v9

    .line 443
    move-object v5, v14

    .line 444
    goto :goto_d

    .line 445
    :cond_17
    :goto_c
    if-eqz v12, :cond_18

    .line 446
    .line 447
    const-string v3, "Content-Encoding"

    .line 448
    .line 449
    const-string v4, "gzip"

    .line 450
    .line 451
    invoke-interface {v2, v3, v4}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 452
    .line 453
    .line 454
    iget-object v3, v0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_servletContext:Ll/ase0;

    .line 455
    .line 456
    invoke-interface {v3, v5}, Ll/ase0;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    .line 457
    .line 458
    .line 459
    move-result-object v3

    .line 460
    if-eqz v3, :cond_18

    .line 461
    .line 462
    invoke-interface {v2, v3}, Ll/lse0;->setContentType(Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/lang/IllegalArgumentException; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 463
    .line 464
    .line 465
    :cond_18
    :try_start_9
    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    .line 466
    .line 467
    .line 468
    move-result v3
    :try_end_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_9 .. :try_end_9} :catch_5
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    .line 469
    move-object v4, v9

    .line 470
    move-object v6, v11

    .line 471
    move-object v5, v14

    .line 472
    :try_start_a
    invoke-virtual/range {v0 .. v6}, Lorg/eclipse/jetty/servlet/DefaultServlet;->sendData(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;ZLorg/eclipse/jetty/util/resource/Resource;Lorg/eclipse/jetty/http/HttpContent;Ljava/util/Enumeration;)V
    :try_end_a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_a .. :try_end_a} :catch_4
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 473
    .line 474
    .line 475
    :goto_d
    move-object v14, v5

    .line 476
    goto/16 :goto_15

    .line 477
    .line 478
    :catchall_4
    move-exception v0

    .line 479
    :goto_e
    move-object v9, v5

    .line 480
    goto/16 :goto_18

    .line 481
    .line 482
    :catch_4
    move-exception v0

    .line 483
    move-object v9, v4

    .line 484
    move-object v14, v5

    .line 485
    goto/16 :goto_16

    .line 486
    .line 487
    :catchall_5
    move-exception v0

    .line 488
    move-object v4, v9

    .line 489
    move-object v5, v14

    .line 490
    goto :goto_e

    .line 491
    :catch_5
    move-exception v0

    .line 492
    move-object v4, v9

    .line 493
    move-object v5, v14

    .line 494
    goto/16 :goto_16

    .line 495
    .line 496
    :cond_19
    move-object v4, v9

    .line 497
    if-eqz v10, :cond_21

    .line 498
    .line 499
    :try_start_b
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 500
    .line 501
    .line 502
    move-result v3

    .line 503
    if-ne v3, v6, :cond_1a

    .line 504
    .line 505
    const-string v3, "org.eclipse.jetty.server.nullPathInfo"

    .line 506
    .line 507
    invoke-interface {v1, v3}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 508
    .line 509
    .line 510
    move-result-object v3

    .line 511
    if-eqz v3, :cond_1a

    .line 512
    .line 513
    goto/16 :goto_11

    .line 514
    .line 515
    :catchall_6
    move-exception v0

    .line 516
    goto/16 :goto_7

    .line 517
    .line 518
    :catch_6
    move-exception v0

    .line 519
    :goto_f
    move-object v9, v4

    .line 520
    goto/16 :goto_16

    .line 521
    .line 522
    :cond_1a
    invoke-direct {v0, v5}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getWelcomeFile(Ljava/lang/String;)Ljava/lang/String;

    .line 523
    .line 524
    .line 525
    move-result-object v3

    .line 526
    if-eqz v3, :cond_1e

    .line 527
    .line 528
    const-string v5, "welcome={}"

    .line 529
    .line 530
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 531
    .line 532
    .line 533
    move-result-object v6

    .line 534
    invoke-interface {v13, v5, v6}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 535
    .line 536
    .line 537
    iget-boolean v5, v0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_redirectWelcome:Z

    .line 538
    .line 539
    if-eqz v5, :cond_1c

    .line 540
    .line 541
    invoke-interface {v2, v7}, Ll/lse0;->setContentLength(I)V

    .line 542
    .line 543
    .line 544
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getQueryString()Ljava/lang/String;

    .line 545
    .line 546
    .line 547
    move-result-object v1

    .line 548
    if-eqz v1, :cond_1b

    .line 549
    .line 550
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 551
    .line 552
    .line 553
    move-result v5

    .line 554
    if-eqz v5, :cond_1b

    .line 555
    .line 556
    new-instance v5, Ljava/lang/StringBuilder;

    .line 557
    .line 558
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 559
    .line 560
    .line 561
    iget-object v0, v0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_servletContext:Ll/ase0;

    .line 562
    .line 563
    invoke-interface {v0}, Ll/ase0;->getContextPath()Ljava/lang/String;

    .line 564
    .line 565
    .line 566
    move-result-object v0

    .line 567
    invoke-static {v0, v3}, Lorg/eclipse/jetty/util/URIUtil;->addPaths(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 568
    .line 569
    .line 570
    move-result-object v0

    .line 571
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 572
    .line 573
    .line 574
    const-string v0, "?"

    .line 575
    .line 576
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 577
    .line 578
    .line 579
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 580
    .line 581
    .line 582
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 583
    .line 584
    .line 585
    move-result-object v0

    .line 586
    invoke-interface {v2, v0}, Ljavax/servlet/http/HttpServletResponse;->encodeRedirectURL(Ljava/lang/String;)Ljava/lang/String;

    .line 587
    .line 588
    .line 589
    move-result-object v0

    .line 590
    invoke-interface {v2, v0}, Ljavax/servlet/http/HttpServletResponse;->sendRedirect(Ljava/lang/String;)V

    .line 591
    .line 592
    .line 593
    goto/16 :goto_15

    .line 594
    .line 595
    :cond_1b
    iget-object v0, v0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_servletContext:Ll/ase0;

    .line 596
    .line 597
    invoke-interface {v0}, Ll/ase0;->getContextPath()Ljava/lang/String;

    .line 598
    .line 599
    .line 600
    move-result-object v0

    .line 601
    invoke-static {v0, v3}, Lorg/eclipse/jetty/util/URIUtil;->addPaths(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 602
    .line 603
    .line 604
    move-result-object v0

    .line 605
    invoke-interface {v2, v0}, Ljavax/servlet/http/HttpServletResponse;->encodeRedirectURL(Ljava/lang/String;)Ljava/lang/String;

    .line 606
    .line 607
    .line 608
    move-result-object v0

    .line 609
    invoke-interface {v2, v0}, Ljavax/servlet/http/HttpServletResponse;->sendRedirect(Ljava/lang/String;)V

    .line 610
    .line 611
    .line 612
    goto/16 :goto_15

    .line 613
    .line 614
    :cond_1c
    invoke-interface {v1, v3}, Ll/gse0;->getRequestDispatcher(Ljava/lang/String;)Ll/c2d0;

    .line 615
    .line 616
    .line 617
    move-result-object v0

    .line 618
    if-eqz v0, :cond_24

    .line 619
    .line 620
    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    .line 621
    .line 622
    .line 623
    move-result v5

    .line 624
    if-eqz v5, :cond_1d

    .line 625
    .line 626
    invoke-interface {v0, v1, v2}, Ll/c2d0;->include(Ll/gse0;Ll/lse0;)V

    .line 627
    .line 628
    .line 629
    goto/16 :goto_15

    .line 630
    .line 631
    :cond_1d
    const-string v5, "org.eclipse.jetty.server.welcome"

    .line 632
    .line 633
    invoke-interface {v1, v5, v3}, Ll/gse0;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 634
    .line 635
    .line 636
    invoke-interface {v0, v1, v2}, Ll/c2d0;->forward(Ll/gse0;Ll/lse0;)V

    .line 637
    .line 638
    .line 639
    goto/16 :goto_15

    .line 640
    .line 641
    :cond_1e
    new-instance v9, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;

    .line 642
    .line 643
    iget-object v3, v0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_mimeTypes:Lorg/eclipse/jetty/http/MimeTypes;

    .line 644
    .line 645
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 646
    .line 647
    .line 648
    move-result-object v6

    .line 649
    invoke-virtual {v3, v6}, Lorg/eclipse/jetty/http/MimeTypes;->getMimeByExtension(Ljava/lang/String;)Lorg/eclipse/jetty/io/Buffer;

    .line 650
    .line 651
    .line 652
    move-result-object v3

    .line 653
    invoke-direct {v9, v4, v3}, Lorg/eclipse/jetty/http/HttpContent$ResourceAsHttpContent;-><init>(Lorg/eclipse/jetty/util/resource/Resource;Lorg/eclipse/jetty/io/Buffer;)V
    :try_end_b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_b .. :try_end_b} :catch_6
    .catchall {:try_start_b .. :try_end_b} :catchall_6

    .line 654
    .line 655
    .line 656
    :try_start_c
    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    .line 657
    .line 658
    .line 659
    move-result v3

    .line 660
    if-nez v3, :cond_1f

    .line 661
    .line 662
    invoke-virtual {v0, v1, v2, v4, v9}, Lorg/eclipse/jetty/servlet/DefaultServlet;->passConditionalHeaders(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lorg/eclipse/jetty/util/resource/Resource;Lorg/eclipse/jetty/http/HttpContent;)Z

    .line 663
    .line 664
    .line 665
    move-result v3

    .line 666
    if-eqz v3, :cond_20

    .line 667
    .line 668
    goto :goto_10

    .line 669
    :catchall_7
    move-exception v0

    .line 670
    goto/16 :goto_18

    .line 671
    .line 672
    :catch_7
    move-exception v0

    .line 673
    move-object v14, v9

    .line 674
    goto/16 :goto_f

    .line 675
    .line 676
    :cond_1f
    :goto_10
    invoke-virtual {v0, v1, v2, v4, v5}, Lorg/eclipse/jetty/servlet/DefaultServlet;->sendDirectory(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lorg/eclipse/jetty/util/resource/Resource;Ljava/lang/String;)V
    :try_end_c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_c .. :try_end_c} :catch_7
    .catchall {:try_start_c .. :try_end_c} :catchall_7

    .line 677
    .line 678
    .line 679
    :cond_20
    move-object v14, v9

    .line 680
    goto :goto_15

    .line 681
    :cond_21
    :goto_11
    :try_start_d
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getRequestURL()Ljava/lang/StringBuffer;

    .line 682
    .line 683
    .line 684
    move-result-object v3

    .line 685
    monitor-enter v3
    :try_end_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_d .. :try_end_d} :catch_6
    .catchall {:try_start_d .. :try_end_d} :catchall_6

    .line 686
    :try_start_e
    const-string v0, ";"

    .line 687
    .line 688
    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->lastIndexOf(Ljava/lang/String;)I

    .line 689
    .line 690
    .line 691
    move-result v0

    .line 692
    const/16 v5, 0x2f

    .line 693
    .line 694
    if-gez v0, :cond_22

    .line 695
    .line 696
    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 697
    .line 698
    .line 699
    goto :goto_12

    .line 700
    :catchall_8
    move-exception v0

    .line 701
    goto :goto_13

    .line 702
    :cond_22
    invoke-virtual {v3, v0, v5}, Ljava/lang/StringBuffer;->insert(IC)Ljava/lang/StringBuffer;

    .line 703
    .line 704
    .line 705
    :goto_12
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getQueryString()Ljava/lang/String;

    .line 706
    .line 707
    .line 708
    move-result-object v0

    .line 709
    if-eqz v0, :cond_23

    .line 710
    .line 711
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 712
    .line 713
    .line 714
    move-result v1

    .line 715
    if-eqz v1, :cond_23

    .line 716
    .line 717
    const/16 v1, 0x3f

    .line 718
    .line 719
    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 720
    .line 721
    .line 722
    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 723
    .line 724
    .line 725
    :cond_23
    invoke-interface {v2, v7}, Ll/lse0;->setContentLength(I)V

    .line 726
    .line 727
    .line 728
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 729
    .line 730
    .line 731
    move-result-object v0

    .line 732
    invoke-interface {v2, v0}, Ljavax/servlet/http/HttpServletResponse;->encodeRedirectURL(Ljava/lang/String;)Ljava/lang/String;

    .line 733
    .line 734
    .line 735
    move-result-object v0

    .line 736
    invoke-interface {v2, v0}, Ljavax/servlet/http/HttpServletResponse;->sendRedirect(Ljava/lang/String;)V

    .line 737
    .line 738
    .line 739
    monitor-exit v3

    .line 740
    goto :goto_15

    .line 741
    :goto_13
    monitor-exit v3
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_8

    .line 742
    :try_start_f
    throw v0

    .line 743
    :catch_8
    move-exception v0

    .line 744
    move-object v4, v9

    .line 745
    goto :goto_16

    .line 746
    :goto_14
    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    .line 747
    .line 748
    .line 749
    move-result v0

    .line 750
    if-nez v0, :cond_26

    .line 751
    .line 752
    const/16 v0, 0x194

    .line 753
    .line 754
    invoke-interface {v2, v0}, Ljavax/servlet/http/HttpServletResponse;->sendError(I)V
    :try_end_f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_f .. :try_end_f} :catch_6
    .catchall {:try_start_f .. :try_end_f} :catchall_6

    .line 755
    .line 756
    .line 757
    :cond_24
    :goto_15
    if-eqz v14, :cond_25

    .line 758
    .line 759
    invoke-interface {v14}, Lorg/eclipse/jetty/http/HttpContent;->release()V

    .line 760
    .line 761
    .line 762
    return-void

    .line 763
    :cond_25
    if-eqz v4, :cond_29

    .line 764
    .line 765
    invoke-virtual {v4}, Lorg/eclipse/jetty/util/resource/Resource;->release()V

    .line 766
    .line 767
    .line 768
    return-void

    .line 769
    :cond_26
    :try_start_10
    new-instance v0, Ljava/io/FileNotFoundException;

    .line 770
    .line 771
    new-instance v1, Ljava/lang/StringBuilder;

    .line 772
    .line 773
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 774
    .line 775
    .line 776
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 777
    .line 778
    .line 779
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 780
    .line 781
    .line 782
    move-result-object v1

    .line 783
    invoke-direct {v0, v1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    .line 784
    .line 785
    .line 786
    throw v0
    :try_end_10
    .catch Ljava/lang/IllegalArgumentException; {:try_start_10 .. :try_end_10} :catch_6
    .catchall {:try_start_10 .. :try_end_10} :catchall_6

    .line 787
    :goto_16
    :try_start_11
    sget-object v1, Lorg/eclipse/jetty/servlet/DefaultServlet;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 788
    .line 789
    const-string v3, "EXCEPTION "

    .line 790
    .line 791
    invoke-interface {v1, v3, v0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 792
    .line 793
    .line 794
    invoke-interface {v2}, Ll/lse0;->isCommitted()Z

    .line 795
    .line 796
    .line 797
    move-result v1

    .line 798
    if-nez v1, :cond_27

    .line 799
    .line 800
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 801
    .line 802
    .line 803
    move-result-object v0

    .line 804
    const/16 v1, 0x1f4

    .line 805
    .line 806
    invoke-interface {v2, v1, v0}, Ljavax/servlet/http/HttpServletResponse;->sendError(ILjava/lang/String;)V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_3

    .line 807
    .line 808
    .line 809
    :cond_27
    if-eqz v14, :cond_28

    .line 810
    .line 811
    invoke-interface {v14}, Lorg/eclipse/jetty/http/HttpContent;->release()V

    .line 812
    .line 813
    .line 814
    goto :goto_17

    .line 815
    :cond_28
    if-eqz v9, :cond_29

    .line 816
    .line 817
    invoke-virtual {v9}, Lorg/eclipse/jetty/util/resource/Resource;->release()V

    .line 818
    .line 819
    .line 820
    :cond_29
    :goto_17
    return-void

    .line 821
    :goto_18
    if-nez v9, :cond_2a

    .line 822
    .line 823
    if-eqz v4, :cond_2b

    .line 824
    .line 825
    invoke-virtual {v4}, Lorg/eclipse/jetty/util/resource/Resource;->release()V

    .line 826
    .line 827
    .line 828
    goto :goto_19

    .line 829
    :cond_2a
    invoke-interface {v9}, Lorg/eclipse/jetty/http/HttpContent;->release()V

    .line 830
    .line 831
    .line 832
    :cond_2b
    :goto_19
    throw v0
.end method

.method public doOptions(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "Allow"

    .line 2
    .line 3
    const-string p1, "GET,HEAD,POST,OPTIONS"

    .line 4
    .line 5
    invoke-interface {p2, p0, p1}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/servlet/DefaultServlet;->doGet(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public doTrace(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/16 p0, 0x195

    .line 2
    .line 3
    invoke-interface {p2, p0}, Ljavax/servlet/http/HttpServletResponse;->sendError(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getInitParameter(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljavax/servlet/GenericServlet;->getServletContext()Ll/ase0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "org.eclipse.jetty.servlet.Default."

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v0, v1}, Ll/ase0;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    invoke-super {p0, p1}, Ljavax/servlet/GenericServlet;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_0
    return-object v0
.end method

.method public getResource(Ljava/lang/String;)Lorg/eclipse/jetty/util/resource/Resource;
    .locals 4

    .line 1
    const-string v0, "Resource "

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_relativeResourceBase:Ljava/lang/String;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    invoke-static {v1, p1}, Lorg/eclipse/jetty/util/URIUtil;->addPaths(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :cond_0
    const/4 v1, 0x0

    .line 12
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_resourceBase:Lorg/eclipse/jetty/util/resource/Resource;

    .line 13
    .line 14
    if-eqz v2, :cond_1

    .line 15
    .line 16
    invoke-virtual {v2, p1}, Lorg/eclipse/jetty/util/resource/Resource;->addPath(Ljava/lang/String;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    goto :goto_0

    .line 21
    :catch_0
    move-exception v0

    .line 22
    goto :goto_1

    .line 23
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_servletContext:Ll/ase0;

    .line 24
    .line 25
    invoke-interface {v2, p1}, Ll/ase0;->getResource(Ljava/lang/String;)Ljava/net/URL;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iget-object v3, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 30
    .line 31
    invoke-virtual {v3, v2}, Lorg/eclipse/jetty/server/handler/ContextHandler;->newResource(Ljava/net/URL;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    :goto_0
    sget-object v2, Lorg/eclipse/jetty/servlet/DefaultServlet;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 36
    .line 37
    invoke-interface {v2}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_2

    .line 42
    .line 43
    new-instance v3, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v0, "="

    .line 52
    .line 53
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const/4 v3, 0x0

    .line 64
    new-array v3, v3, [Ljava/lang/Object;

    .line 65
    .line 66
    invoke-interface {v2, v0, v3}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .line 68
    .line 69
    goto :goto_2

    .line 70
    :goto_1
    sget-object v2, Lorg/eclipse/jetty/servlet/DefaultServlet;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 71
    .line 72
    invoke-interface {v2, v0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 73
    .line 74
    .line 75
    :cond_2
    :goto_2
    if-eqz v1, :cond_3

    .line 76
    .line 77
    invoke-virtual {v1}, Lorg/eclipse/jetty/util/resource/Resource;->exists()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_4

    .line 82
    .line 83
    :cond_3
    const-string v0, "/jetty-dir.css"

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_4

    .line 90
    .line 91
    iget-object v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_stylesheet:Lorg/eclipse/jetty/util/resource/Resource;

    .line 92
    .line 93
    :cond_4
    return-object v1
.end method

.method public init()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/UnavailableException;
        }
    .end annotation

    .line 1
    const-string v0, "!"

    .line 2
    .line 3
    invoke-virtual {p0}, Ljavax/servlet/GenericServlet;->getServletContext()Ll/ase0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iput-object v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_servletContext:Ll/ase0;

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/servlet/DefaultServlet;->initContextHandler(Ll/ase0;)Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 14
    .line 15
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getMimeTypes()Lorg/eclipse/jetty/http/MimeTypes;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_mimeTypes:Lorg/eclipse/jetty/http/MimeTypes;

    .line 20
    .line 21
    iget-object v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 22
    .line 23
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getWelcomeFiles()[Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iput-object v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_welcomes:[Ljava/lang/String;

    .line 28
    .line 29
    if-nez v1, :cond_0

    .line 30
    .line 31
    const-string v1, "index.html"

    .line 32
    .line 33
    const-string v2, "index.jsp"

    .line 34
    .line 35
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_welcomes:[Ljava/lang/String;

    .line 40
    .line 41
    :cond_0
    const-string v1, "acceptRanges"

    .line 42
    .line 43
    iget-boolean v2, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_acceptRanges:Z

    .line 44
    .line 45
    invoke-direct {p0, v1, v2}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getInitBoolean(Ljava/lang/String;Z)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iput-boolean v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_acceptRanges:Z

    .line 50
    .line 51
    const-string v1, "dirAllowed"

    .line 52
    .line 53
    iget-boolean v2, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_dirAllowed:Z

    .line 54
    .line 55
    invoke-direct {p0, v1, v2}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getInitBoolean(Ljava/lang/String;Z)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    iput-boolean v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_dirAllowed:Z

    .line 60
    .line 61
    const-string v1, "redirectWelcome"

    .line 62
    .line 63
    iget-boolean v2, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_redirectWelcome:Z

    .line 64
    .line 65
    invoke-direct {p0, v1, v2}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getInitBoolean(Ljava/lang/String;Z)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    iput-boolean v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_redirectWelcome:Z

    .line 70
    .line 71
    const-string v1, "gzip"

    .line 72
    .line 73
    iget-boolean v2, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_gzip:Z

    .line 74
    .line 75
    invoke-direct {p0, v1, v2}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getInitBoolean(Ljava/lang/String;Z)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    iput-boolean v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_gzip:Z

    .line 80
    .line 81
    const-string v1, "pathInfoOnly"

    .line 82
    .line 83
    iget-boolean v2, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_pathInfoOnly:Z

    .line 84
    .line 85
    invoke-direct {p0, v1, v2}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getInitBoolean(Ljava/lang/String;Z)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    iput-boolean v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_pathInfoOnly:Z

    .line 90
    .line 91
    const-string v1, "exact"

    .line 92
    .line 93
    const-string v2, "welcomeServlets"

    .line 94
    .line 95
    invoke-virtual {p0, v2}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    const/4 v3, 0x0

    .line 104
    if-eqz v1, :cond_1

    .line 105
    .line 106
    const/4 v1, 0x1

    .line 107
    iput-boolean v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_welcomeExactServlets:Z

    .line 108
    .line 109
    iput-boolean v3, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_welcomeServlets:Z

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_1
    iget-boolean v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_welcomeServlets:Z

    .line 113
    .line 114
    invoke-direct {p0, v2, v1}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getInitBoolean(Ljava/lang/String;Z)Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    iput-boolean v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_welcomeServlets:Z

    .line 119
    .line 120
    :goto_0
    const-string v1, "aliases"

    .line 121
    .line 122
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    if-eqz v2, :cond_2

    .line 127
    .line 128
    iget-object v2, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 129
    .line 130
    invoke-direct {p0, v1, v3}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getInitBoolean(Ljava/lang/String;Z)Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    invoke-virtual {v2, v1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->setAliases(Z)V

    .line 135
    .line 136
    .line 137
    :cond_2
    iget-object v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 138
    .line 139
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->isAliases()Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-nez v1, :cond_4

    .line 144
    .line 145
    invoke-static {}, Lorg/eclipse/jetty/util/resource/FileResource;->getCheckAliases()Z

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    if-eqz v2, :cond_3

    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_3
    const-string p0, "Alias checking disabled"

    .line 153
    .line 154
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :cond_4
    :goto_1
    if-eqz v1, :cond_5

    .line 159
    .line 160
    iget-object v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_servletContext:Ll/ase0;

    .line 161
    .line 162
    const-string v2, "Aliases are enabled"

    .line 163
    .line 164
    invoke-interface {v1, v2}, Ll/ase0;->log(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    :cond_5
    const-string v1, "useFileMappedBuffer"

    .line 168
    .line 169
    iget-boolean v2, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_useFileMappedBuffer:Z

    .line 170
    .line 171
    invoke-direct {p0, v1, v2}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getInitBoolean(Ljava/lang/String;Z)Z

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    iput-boolean v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_useFileMappedBuffer:Z

    .line 176
    .line 177
    const-string v1, "relativeResourceBase"

    .line 178
    .line 179
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    iput-object v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_relativeResourceBase:Ljava/lang/String;

    .line 184
    .line 185
    const-string v1, "resourceBase"

    .line 186
    .line 187
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    const-string v2, "EXCEPTION "

    .line 192
    .line 193
    if-eqz v1, :cond_7

    .line 194
    .line 195
    iget-object v4, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_relativeResourceBase:Ljava/lang/String;

    .line 196
    .line 197
    if-nez v4, :cond_6

    .line 198
    .line 199
    :try_start_0
    iget-object v4, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 200
    .line 201
    invoke-virtual {v4, v1}, Lorg/eclipse/jetty/server/handler/ContextHandler;->newResource(Ljava/lang/String;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    iput-object v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_resourceBase:Lorg/eclipse/jetty/util/resource/Resource;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 206
    .line 207
    goto :goto_2

    .line 208
    :catch_0
    move-exception p0

    .line 209
    sget-object v0, Lorg/eclipse/jetty/servlet/DefaultServlet;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 210
    .line 211
    invoke-interface {v0, v2, p0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 212
    .line 213
    .line 214
    new-instance v0, Ljavax/servlet/UnavailableException;

    .line 215
    .line 216
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    invoke-direct {v0, p0}, Ljavax/servlet/UnavailableException;-><init>(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    throw v0

    .line 224
    :cond_6
    new-instance p0, Ljavax/servlet/UnavailableException;

    .line 225
    .line 226
    const-string v0, "resourceBase & relativeResourceBase"

    .line 227
    .line 228
    invoke-direct {p0, v0}, Ljavax/servlet/UnavailableException;-><init>(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    throw p0

    .line 232
    :cond_7
    :goto_2
    const-string v1, "stylesheet"

    .line 233
    .line 234
    invoke-virtual {p0, v1}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    const/4 v4, 0x0

    .line 239
    if-eqz v1, :cond_8

    .line 240
    .line 241
    :try_start_1
    invoke-static {v1}, Lorg/eclipse/jetty/util/resource/Resource;->newResource(Ljava/lang/String;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 242
    .line 243
    .line 244
    move-result-object v5

    .line 245
    iput-object v5, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_stylesheet:Lorg/eclipse/jetty/util/resource/Resource;

    .line 246
    .line 247
    invoke-virtual {v5}, Lorg/eclipse/jetty/util/resource/Resource;->exists()Z

    .line 248
    .line 249
    .line 250
    move-result v5

    .line 251
    if-nez v5, :cond_8

    .line 252
    .line 253
    sget-object v5, Lorg/eclipse/jetty/servlet/DefaultServlet;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 254
    .line 255
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    new-array v1, v3, [Ljava/lang/Object;

    .line 260
    .line 261
    invoke-interface {v5, v0, v1}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 262
    .line 263
    .line 264
    iput-object v4, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_stylesheet:Lorg/eclipse/jetty/util/resource/Resource;

    .line 265
    .line 266
    goto :goto_3

    .line 267
    :catch_1
    move-exception v0

    .line 268
    goto :goto_4

    .line 269
    :cond_8
    :goto_3
    iget-object v0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_stylesheet:Lorg/eclipse/jetty/util/resource/Resource;

    .line 270
    .line 271
    if-nez v0, :cond_9

    .line 272
    .line 273
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    const-string v1, "/jetty-dir.css"

    .line 278
    .line 279
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getResource(Ljava/lang/String;)Ljava/net/URL;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    invoke-static {v0}, Lorg/eclipse/jetty/util/resource/Resource;->newResource(Ljava/net/URL;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    iput-object v0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_stylesheet:Lorg/eclipse/jetty/util/resource/Resource;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 288
    .line 289
    goto :goto_5

    .line 290
    :goto_4
    sget-object v1, Lorg/eclipse/jetty/servlet/DefaultServlet;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 291
    .line 292
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v5

    .line 296
    new-array v6, v3, [Ljava/lang/Object;

    .line 297
    .line 298
    invoke-interface {v1, v5, v6}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 299
    .line 300
    .line 301
    invoke-interface {v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V

    .line 302
    .line 303
    .line 304
    :cond_9
    :goto_5
    const-string v0, "cacheControl"

    .line 305
    .line 306
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object v0

    .line 310
    if-eqz v0, :cond_a

    .line 311
    .line 312
    new-instance v1, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 313
    .line 314
    invoke-direct {v1, v0}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(Ljava/lang/String;)V

    .line 315
    .line 316
    .line 317
    iput-object v1, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_cacheControl:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 318
    .line 319
    :cond_a
    const-string v0, "resourceCache"

    .line 320
    .line 321
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object v0

    .line 325
    const-string v1, "maxCacheSize"

    .line 326
    .line 327
    const/4 v5, -0x2

    .line 328
    invoke-direct {p0, v1, v5}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getInitInt(Ljava/lang/String;I)I

    .line 329
    .line 330
    .line 331
    move-result v1

    .line 332
    const-string v6, "maxCachedFileSize"

    .line 333
    .line 334
    invoke-direct {p0, v6, v5}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getInitInt(Ljava/lang/String;I)I

    .line 335
    .line 336
    .line 337
    move-result v6

    .line 338
    const-string v7, "maxCachedFiles"

    .line 339
    .line 340
    invoke-direct {p0, v7, v5}, Lorg/eclipse/jetty/servlet/DefaultServlet;->getInitInt(Ljava/lang/String;I)I

    .line 341
    .line 342
    .line 343
    move-result v7

    .line 344
    const/4 v8, -0x1

    .line 345
    if-eqz v0, :cond_e

    .line 346
    .line 347
    if-ne v1, v8, :cond_b

    .line 348
    .line 349
    if-ne v6, v5, :cond_b

    .line 350
    .line 351
    if-eq v7, v5, :cond_c

    .line 352
    .line 353
    :cond_b
    sget-object v5, Lorg/eclipse/jetty/servlet/DefaultServlet;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 354
    .line 355
    const-string v9, "ignoring resource cache configuration, using resourceCache attribute"

    .line 356
    .line 357
    new-array v10, v3, [Ljava/lang/Object;

    .line 358
    .line 359
    invoke-interface {v5, v9, v10}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 360
    .line 361
    .line 362
    :cond_c
    iget-object v5, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_relativeResourceBase:Ljava/lang/String;

    .line 363
    .line 364
    if-nez v5, :cond_d

    .line 365
    .line 366
    iget-object v5, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_resourceBase:Lorg/eclipse/jetty/util/resource/Resource;

    .line 367
    .line 368
    if-nez v5, :cond_d

    .line 369
    .line 370
    iget-object v5, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_servletContext:Ll/ase0;

    .line 371
    .line 372
    invoke-interface {v5, v0}, Ll/ase0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 373
    .line 374
    .line 375
    move-result-object v5

    .line 376
    check-cast v5, Lorg/eclipse/jetty/server/ResourceCache;

    .line 377
    .line 378
    iput-object v5, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_cache:Lorg/eclipse/jetty/server/ResourceCache;

    .line 379
    .line 380
    sget-object v9, Lorg/eclipse/jetty/servlet/DefaultServlet;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 381
    .line 382
    const-string v10, "Cache {}={}"

    .line 383
    .line 384
    filled-new-array {v0, v5}, [Ljava/lang/Object;

    .line 385
    .line 386
    .line 387
    move-result-object v0

    .line 388
    invoke-interface {v9, v10, v0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 389
    .line 390
    .line 391
    goto :goto_6

    .line 392
    :cond_d
    new-instance p0, Ljavax/servlet/UnavailableException;

    .line 393
    .line 394
    const-string v0, "resourceCache specified with resource bases"

    .line 395
    .line 396
    invoke-direct {p0, v0}, Ljavax/servlet/UnavailableException;-><init>(Ljava/lang/String;)V

    .line 397
    .line 398
    .line 399
    throw p0

    .line 400
    :cond_e
    :goto_6
    :try_start_2
    iget-object v0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_cache:Lorg/eclipse/jetty/server/ResourceCache;

    .line 401
    .line 402
    if-nez v0, :cond_11

    .line 403
    .line 404
    if-lez v7, :cond_11

    .line 405
    .line 406
    new-instance v0, Lorg/eclipse/jetty/server/ResourceCache;

    .line 407
    .line 408
    iget-object v5, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_mimeTypes:Lorg/eclipse/jetty/http/MimeTypes;

    .line 409
    .line 410
    iget-boolean v9, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_useFileMappedBuffer:Z

    .line 411
    .line 412
    invoke-direct {v0, v4, p0, v5, v9}, Lorg/eclipse/jetty/server/ResourceCache;-><init>(Lorg/eclipse/jetty/server/ResourceCache;Lorg/eclipse/jetty/util/resource/ResourceFactory;Lorg/eclipse/jetty/http/MimeTypes;Z)V

    .line 413
    .line 414
    .line 415
    iput-object v0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_cache:Lorg/eclipse/jetty/server/ResourceCache;

    .line 416
    .line 417
    if-lez v1, :cond_f

    .line 418
    .line 419
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/server/ResourceCache;->setMaxCacheSize(I)V

    .line 420
    .line 421
    .line 422
    goto :goto_7

    .line 423
    :catch_2
    move-exception p0

    .line 424
    goto :goto_9

    .line 425
    :cond_f
    :goto_7
    if-lt v6, v8, :cond_10

    .line 426
    .line 427
    iget-object v0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_cache:Lorg/eclipse/jetty/server/ResourceCache;

    .line 428
    .line 429
    invoke-virtual {v0, v6}, Lorg/eclipse/jetty/server/ResourceCache;->setMaxCachedFileSize(I)V

    .line 430
    .line 431
    .line 432
    :cond_10
    if-lt v7, v8, :cond_11

    .line 433
    .line 434
    iget-object v0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_cache:Lorg/eclipse/jetty/server/ResourceCache;

    .line 435
    .line 436
    invoke-virtual {v0, v7}, Lorg/eclipse/jetty/server/ResourceCache;->setMaxCachedFiles(I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 437
    .line 438
    .line 439
    :cond_11
    iget-object v0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 440
    .line 441
    const-class v1, Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 442
    .line 443
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/server/handler/AbstractHandlerContainer;->getChildHandlerByClass(Ljava/lang/Class;)Lorg/eclipse/jetty/server/Handler;

    .line 444
    .line 445
    .line 446
    move-result-object v0

    .line 447
    check-cast v0, Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 448
    .line 449
    iput-object v0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_servletHandler:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 450
    .line 451
    invoke-virtual {v0}, Lorg/eclipse/jetty/servlet/ServletHandler;->getServlets()[Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 452
    .line 453
    .line 454
    move-result-object v0

    .line 455
    array-length v1, v0

    .line 456
    move v2, v3

    .line 457
    :goto_8
    if-ge v2, v1, :cond_13

    .line 458
    .line 459
    aget-object v4, v0, v2

    .line 460
    .line 461
    invoke-virtual {v4}, Lorg/eclipse/jetty/servlet/ServletHolder;->getServletInstance()Ll/yre0;

    .line 462
    .line 463
    .line 464
    move-result-object v5

    .line 465
    if-ne v5, p0, :cond_12

    .line 466
    .line 467
    iput-object v4, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_defaultHolder:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 468
    .line 469
    :cond_12
    add-int/lit8 v2, v2, 0x1

    .line 470
    .line 471
    goto :goto_8

    .line 472
    :cond_13
    sget-object v0, Lorg/eclipse/jetty/servlet/DefaultServlet;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 473
    .line 474
    invoke-interface {v0}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 475
    .line 476
    .line 477
    move-result v1

    .line 478
    if-eqz v1, :cond_14

    .line 479
    .line 480
    new-instance v1, Ljava/lang/StringBuilder;

    .line 481
    .line 482
    const-string v2, "resource base = "

    .line 483
    .line 484
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 485
    .line 486
    .line 487
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_resourceBase:Lorg/eclipse/jetty/util/resource/Resource;

    .line 488
    .line 489
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 490
    .line 491
    .line 492
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 493
    .line 494
    .line 495
    move-result-object p0

    .line 496
    new-array v1, v3, [Ljava/lang/Object;

    .line 497
    .line 498
    invoke-interface {v0, p0, v1}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 499
    .line 500
    .line 501
    :cond_14
    return-void

    .line 502
    :goto_9
    sget-object v0, Lorg/eclipse/jetty/servlet/DefaultServlet;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 503
    .line 504
    invoke-interface {v0, v2, p0}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 505
    .line 506
    .line 507
    new-instance v0, Ljavax/servlet/UnavailableException;

    .line 508
    .line 509
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 510
    .line 511
    .line 512
    move-result-object p0

    .line 513
    invoke-direct {v0, p0}, Ljavax/servlet/UnavailableException;-><init>(Ljava/lang/String;)V

    .line 514
    .line 515
    .line 516
    throw v0
.end method

.method public initContextHandler(Ll/ase0;)Lorg/eclipse/jetty/server/handler/ContextHandler;
    .locals 3

    .line 1
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getCurrentContext()Lorg/eclipse/jetty/server/handler/ContextHandler$Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    instance-of p0, p1, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    check-cast p1, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;

    .line 12
    .line 13
    invoke-virtual {p1}, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->getContextHandler()Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 19
    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v1, "The servletContext "

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-class v1, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const-string v2, " "

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string p1, " is not "

    .line 53
    .line 54
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    throw p0

    .line 68
    :cond_1
    invoke-static {}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getCurrentContext()Lorg/eclipse/jetty/server/handler/ContextHandler$Context;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->getContextHandler()Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    return-object p0
.end method

.method public passConditionalHeaders(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lorg/eclipse/jetty/util/resource/Resource;Lorg/eclipse/jetty/http/HttpContent;)Z
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string v0, "If-Modified-Since"

    .line 2
    .line 3
    :try_start_0
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getMethod()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "HEAD"

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x1

    .line 14
    if-nez v1, :cond_2

    .line 15
    .line 16
    invoke-interface {p1, v0}, Ljavax/servlet/http/HttpServletRequest;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-wide/16 v3, -0x1

    .line 21
    .line 22
    const/4 v5, 0x0

    .line 23
    const-wide/16 v6, 0x3e8

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    invoke-static {p2}, Lorg/eclipse/jetty/server/Response;->getResponse(Ljavax/servlet/http/HttpServletResponse;)Lorg/eclipse/jetty/server/Response;

    .line 28
    .line 29
    .line 30
    move-result-object v8

    .line 31
    const/16 v9, 0x130

    .line 32
    .line 33
    if-eqz p4, :cond_0

    .line 34
    .line 35
    invoke-interface/range {p4 .. p4}, Lorg/eclipse/jetty/http/HttpContent;->getLastModified()Lorg/eclipse/jetty/io/Buffer;

    .line 36
    .line 37
    .line 38
    move-result-object v10

    .line 39
    if-eqz v10, :cond_0

    .line 40
    .line 41
    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v10

    .line 45
    invoke-virtual {v1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    invoke-virtual {v8, v2}, Lorg/eclipse/jetty/server/Response;->reset(Z)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v8, v9}, Lorg/eclipse/jetty/server/Response;->setStatus(I)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v8}, Lorg/eclipse/jetty/server/Response;->flushBuffer()V

    .line 58
    .line 59
    .line 60
    return v5

    .line 61
    :catch_0
    move-exception v0

    .line 62
    move-object p1, v0

    .line 63
    goto :goto_0

    .line 64
    :cond_0
    invoke-interface {p1, v0}, Ljavax/servlet/http/HttpServletRequest;->getDateHeader(Ljava/lang/String;)J

    .line 65
    .line 66
    .line 67
    move-result-wide v0

    .line 68
    cmp-long v10, v0, v3

    .line 69
    .line 70
    if-eqz v10, :cond_1

    .line 71
    .line 72
    invoke-virtual {p3}, Lorg/eclipse/jetty/util/resource/Resource;->lastModified()J

    .line 73
    .line 74
    .line 75
    move-result-wide v10

    .line 76
    div-long/2addr v10, v6

    .line 77
    div-long/2addr v0, v6

    .line 78
    cmp-long v0, v10, v0

    .line 79
    .line 80
    if-gtz v0, :cond_1

    .line 81
    .line 82
    invoke-virtual {v8, v2}, Lorg/eclipse/jetty/server/Response;->reset(Z)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v8, v9}, Lorg/eclipse/jetty/server/Response;->setStatus(I)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v8}, Lorg/eclipse/jetty/server/Response;->flushBuffer()V

    .line 89
    .line 90
    .line 91
    return v5

    .line 92
    :cond_1
    const-string v0, "If-Unmodified-Since"

    .line 93
    .line 94
    invoke-interface {p1, v0}, Ljavax/servlet/http/HttpServletRequest;->getDateHeader(Ljava/lang/String;)J

    .line 95
    .line 96
    .line 97
    move-result-wide v0

    .line 98
    cmp-long p1, v0, v3

    .line 99
    .line 100
    if-eqz p1, :cond_2

    .line 101
    .line 102
    invoke-virtual {p3}, Lorg/eclipse/jetty/util/resource/Resource;->lastModified()J

    .line 103
    .line 104
    .line 105
    move-result-wide v3

    .line 106
    div-long/2addr v3, v6

    .line 107
    div-long/2addr v0, v6

    .line 108
    cmp-long p1, v3, v0

    .line 109
    .line 110
    if-lez p1, :cond_2

    .line 111
    .line 112
    const/16 p1, 0x19c

    .line 113
    .line 114
    invoke-interface {p2, p1}, Ljavax/servlet/http/HttpServletResponse;->sendError(I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 115
    .line 116
    .line 117
    return v5

    .line 118
    :cond_2
    return v2

    .line 119
    :goto_0
    invoke-interface {p2}, Ll/lse0;->isCommitted()Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-nez v0, :cond_3

    .line 124
    .line 125
    const/16 v0, 0x190

    .line 126
    .line 127
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-interface {p2, v0, v1}, Ljavax/servlet/http/HttpServletResponse;->sendError(ILjava/lang/String;)V

    .line 132
    .line 133
    .line 134
    :cond_3
    throw p1
.end method

.method public sendData(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;ZLorg/eclipse/jetty/util/resource/Resource;Lorg/eclipse/jetty/http/HttpContent;Ljava/util/Enumeration;)V
    .locals 25
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p5

    .line 6
    .line 7
    move-object/from16 v3, p6

    .line 8
    .line 9
    const/4 v4, 0x1

    .line 10
    const/4 v5, 0x0

    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    invoke-virtual/range {p4 .. p4}, Lorg/eclipse/jetty/util/resource/Resource;->length()J

    .line 14
    .line 15
    .line 16
    move-result-wide v6

    .line 17
    move-wide v13, v6

    .line 18
    move v6, v5

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    invoke-static {}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getCurrentConnection()Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 21
    .line 22
    .line 23
    move-result-object v6

    .line 24
    invoke-virtual {v6}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getConnector()Lorg/eclipse/jetty/server/Connector;

    .line 25
    .line 26
    .line 27
    move-result-object v6

    .line 28
    instance-of v7, v6, Lorg/eclipse/jetty/server/nio/NIOConnector;

    .line 29
    .line 30
    if-eqz v7, :cond_1

    .line 31
    .line 32
    move-object v7, v6

    .line 33
    check-cast v7, Lorg/eclipse/jetty/server/nio/NIOConnector;

    .line 34
    .line 35
    invoke-interface {v7}, Lorg/eclipse/jetty/server/nio/NIOConnector;->getUseDirectBuffers()Z

    .line 36
    .line 37
    .line 38
    move-result v7

    .line 39
    if-eqz v7, :cond_1

    .line 40
    .line 41
    instance-of v6, v6, Lorg/eclipse/jetty/server/ssl/SslConnector;

    .line 42
    .line 43
    if-nez v6, :cond_1

    .line 44
    .line 45
    move v6, v4

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    move v6, v5

    .line 48
    :goto_0
    invoke-interface {v2}, Lorg/eclipse/jetty/http/HttpContent;->getContentLength()J

    .line 49
    .line 50
    .line 51
    move-result-wide v7

    .line 52
    move-wide v13, v7

    .line 53
    :goto_1
    :try_start_0
    invoke-interface {v1}, Ll/lse0;->getOutputStream()Ll/ese0;

    .line 54
    .line 55
    .line 56
    move-result-object v7

    .line 57
    instance-of v8, v7, Lorg/eclipse/jetty/server/HttpOutput;

    .line 58
    .line 59
    if-eqz v8, :cond_2

    .line 60
    .line 61
    move-object v8, v7

    .line 62
    check-cast v8, Lorg/eclipse/jetty/server/HttpOutput;

    .line 63
    .line 64
    invoke-virtual {v8}, Lorg/eclipse/jetty/server/HttpOutput;->isWritten()Z

    .line 65
    .line 66
    .line 67
    move-result v8

    .line 68
    goto :goto_2

    .line 69
    :cond_2
    invoke-static {}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getCurrentConnection()Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 70
    .line 71
    .line 72
    move-result-object v8

    .line 73
    invoke-virtual {v8}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getGenerator()Lorg/eclipse/jetty/http/Generator;

    .line 74
    .line 75
    .line 76
    move-result-object v8

    .line 77
    invoke-interface {v8}, Lorg/eclipse/jetty/http/Generator;->isWritten()Z

    .line 78
    .line 79
    .line 80
    move-result v8
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    :goto_2
    move-object v10, v7

    .line 82
    goto :goto_3

    .line 83
    :catch_0
    new-instance v7, Lorg/eclipse/jetty/io/WriterOutputStream;

    .line 84
    .line 85
    invoke-interface {v1}, Ll/lse0;->getWriter()Ljava/io/PrintWriter;

    .line 86
    .line 87
    .line 88
    move-result-object v8

    .line 89
    invoke-direct {v7, v8}, Lorg/eclipse/jetty/io/WriterOutputStream;-><init>(Ljava/io/Writer;)V

    .line 90
    .line 91
    .line 92
    move v8, v4

    .line 93
    goto :goto_2

    .line 94
    :goto_3
    const-wide/16 v11, -0x1

    .line 95
    .line 96
    if-eqz v3, :cond_f

    .line 97
    .line 98
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 99
    .line 100
    .line 101
    move-result v7

    .line 102
    if-eqz v7, :cond_f

    .line 103
    .line 104
    const-wide/16 v15, 0x0

    .line 105
    .line 106
    cmp-long v7, v13, v15

    .line 107
    .line 108
    if-gez v7, :cond_3

    .line 109
    .line 110
    goto/16 :goto_b

    .line 111
    .line 112
    :cond_3
    invoke-static {v3, v13, v14}, Lorg/eclipse/jetty/server/InclusiveByteRange;->satisfiableRanges(Ljava/util/Enumeration;J)Ljava/util/List;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    const-string v6, "Content-Range"

    .line 117
    .line 118
    if-eqz v3, :cond_e

    .line 119
    .line 120
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 121
    .line 122
    .line 123
    move-result v7

    .line 124
    if-nez v7, :cond_4

    .line 125
    .line 126
    goto/16 :goto_a

    .line 127
    .line 128
    :cond_4
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 129
    .line 130
    .line 131
    move-result v7

    .line 132
    const/16 v8, 0xce

    .line 133
    .line 134
    if-ne v7, v4, :cond_5

    .line 135
    .line 136
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    check-cast v3, Lorg/eclipse/jetty/server/InclusiveByteRange;

    .line 141
    .line 142
    invoke-virtual {v3, v13, v14}, Lorg/eclipse/jetty/server/InclusiveByteRange;->getSize(J)J

    .line 143
    .line 144
    .line 145
    move-result-wide v4

    .line 146
    invoke-virtual {v0, v1, v2, v4, v5}, Lorg/eclipse/jetty/servlet/DefaultServlet;->writeHeaders(Ljavax/servlet/http/HttpServletResponse;Lorg/eclipse/jetty/http/HttpContent;J)V

    .line 147
    .line 148
    .line 149
    invoke-interface {v1, v8}, Ljavax/servlet/http/HttpServletResponse;->setStatus(I)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v3, v13, v14}, Lorg/eclipse/jetty/server/InclusiveByteRange;->toHeaderRangeString(J)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    invoke-interface {v1, v6, v0}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v3, v13, v14}, Lorg/eclipse/jetty/server/InclusiveByteRange;->getFirst(J)J

    .line 160
    .line 161
    .line 162
    move-result-wide v17

    .line 163
    move-object/from16 v15, p4

    .line 164
    .line 165
    move-wide/from16 v19, v4

    .line 166
    .line 167
    move-object/from16 v16, v10

    .line 168
    .line 169
    invoke-virtual/range {v15 .. v20}, Lorg/eclipse/jetty/util/resource/Resource;->writeTo(Ljava/io/OutputStream;JJ)V

    .line 170
    .line 171
    .line 172
    return-void

    .line 173
    :cond_5
    invoke-virtual {v0, v1, v2, v11, v12}, Lorg/eclipse/jetty/servlet/DefaultServlet;->writeHeaders(Ljavax/servlet/http/HttpServletResponse;Lorg/eclipse/jetty/http/HttpContent;J)V

    .line 174
    .line 175
    .line 176
    invoke-interface {v2}, Lorg/eclipse/jetty/http/HttpContent;->getContentType()Lorg/eclipse/jetty/io/Buffer;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    new-instance v2, Lorg/eclipse/jetty/util/MultiPartOutputStream;

    .line 185
    .line 186
    invoke-direct {v2, v10}, Lorg/eclipse/jetty/util/MultiPartOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 187
    .line 188
    .line 189
    invoke-interface {v1, v8}, Ljavax/servlet/http/HttpServletResponse;->setStatus(I)V

    .line 190
    .line 191
    .line 192
    const-string v4, "Request-Range"

    .line 193
    .line 194
    move-object/from16 v6, p1

    .line 195
    .line 196
    invoke-interface {v6, v4}, Ljavax/servlet/http/HttpServletRequest;->getHeader(Ljava/lang/String;)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v4

    .line 200
    if-eqz v4, :cond_6

    .line 201
    .line 202
    const-string v4, "multipart/x-byteranges; boundary="

    .line 203
    .line 204
    goto :goto_4

    .line 205
    :cond_6
    const-string v4, "multipart/byteranges; boundary="

    .line 206
    .line 207
    :goto_4
    new-instance v6, Ljava/lang/StringBuilder;

    .line 208
    .line 209
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v2}, Lorg/eclipse/jetty/util/MultiPartOutputStream;->getBoundary()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v4

    .line 219
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v4

    .line 226
    invoke-interface {v1, v4}, Ll/lse0;->setContentType(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    invoke-virtual/range {p4 .. p4}, Lorg/eclipse/jetty/util/resource/Resource;->getInputStream()Ljava/io/InputStream;

    .line 230
    .line 231
    .line 232
    move-result-object v4

    .line 233
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 234
    .line 235
    .line 236
    move-result v6

    .line 237
    new-array v6, v6, [Ljava/lang/String;

    .line 238
    .line 239
    move v7, v5

    .line 240
    move v8, v7

    .line 241
    :goto_5
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 242
    .line 243
    .line 244
    move-result v9

    .line 245
    if-ge v7, v9, :cond_8

    .line 246
    .line 247
    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object v9

    .line 251
    check-cast v9, Lorg/eclipse/jetty/server/InclusiveByteRange;

    .line 252
    .line 253
    invoke-virtual {v9, v13, v14}, Lorg/eclipse/jetty/server/InclusiveByteRange;->toHeaderRangeString(J)Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v10

    .line 257
    aput-object v10, v6, v7

    .line 258
    .line 259
    int-to-long v10, v8

    .line 260
    const/4 v8, 0x2

    .line 261
    if-lez v7, :cond_7

    .line 262
    .line 263
    move v12, v8

    .line 264
    goto :goto_6

    .line 265
    :cond_7
    move v12, v5

    .line 266
    :goto_6
    add-int/2addr v12, v8

    .line 267
    invoke-virtual {v2}, Lorg/eclipse/jetty/util/MultiPartOutputStream;->getBoundary()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v8

    .line 271
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 272
    .line 273
    .line 274
    move-result v8

    .line 275
    add-int/2addr v12, v8

    .line 276
    add-int/lit8 v12, v12, 0x10

    .line 277
    .line 278
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 279
    .line 280
    .line 281
    move-result v8

    .line 282
    add-int/2addr v12, v8

    .line 283
    add-int/lit8 v12, v12, 0x11

    .line 284
    .line 285
    aget-object v8, v6, v7

    .line 286
    .line 287
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 288
    .line 289
    .line 290
    move-result v8

    .line 291
    add-int/2addr v12, v8

    .line 292
    add-int/lit8 v12, v12, 0x4

    .line 293
    .line 294
    move-object/from16 v18, v6

    .line 295
    .line 296
    int-to-long v5, v12

    .line 297
    invoke-virtual {v9, v13, v14}, Lorg/eclipse/jetty/server/InclusiveByteRange;->getLast(J)J

    .line 298
    .line 299
    .line 300
    move-result-wide v19

    .line 301
    invoke-virtual {v9, v13, v14}, Lorg/eclipse/jetty/server/InclusiveByteRange;->getFirst(J)J

    .line 302
    .line 303
    .line 304
    move-result-wide v8

    .line 305
    sub-long v19, v19, v8

    .line 306
    .line 307
    add-long v5, v5, v19

    .line 308
    .line 309
    const-wide/16 v8, 0x1

    .line 310
    .line 311
    add-long/2addr v5, v8

    .line 312
    add-long/2addr v10, v5

    .line 313
    long-to-int v8, v10

    .line 314
    add-int/lit8 v7, v7, 0x1

    .line 315
    .line 316
    move-object/from16 v6, v18

    .line 317
    .line 318
    const/4 v5, 0x0

    .line 319
    goto :goto_5

    .line 320
    :cond_8
    move-object/from16 v18, v6

    .line 321
    .line 322
    invoke-virtual {v2}, Lorg/eclipse/jetty/util/MultiPartOutputStream;->getBoundary()Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object v5

    .line 326
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 327
    .line 328
    .line 329
    move-result v5

    .line 330
    add-int/lit8 v5, v5, 0x8

    .line 331
    .line 332
    add-int/2addr v8, v5

    .line 333
    invoke-interface {v1, v8}, Ll/lse0;->setContentLength(I)V

    .line 334
    .line 335
    .line 336
    move-wide v6, v15

    .line 337
    const/4 v5, 0x0

    .line 338
    :goto_7
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 339
    .line 340
    .line 341
    move-result v1

    .line 342
    if-ge v5, v1, :cond_c

    .line 343
    .line 344
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 345
    .line 346
    .line 347
    move-result-object v1

    .line 348
    check-cast v1, Lorg/eclipse/jetty/server/InclusiveByteRange;

    .line 349
    .line 350
    new-instance v8, Ljava/lang/StringBuilder;

    .line 351
    .line 352
    const-string v9, "Content-Range: "

    .line 353
    .line 354
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 355
    .line 356
    .line 357
    aget-object v9, v18, v5

    .line 358
    .line 359
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    .line 361
    .line 362
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 363
    .line 364
    .line 365
    move-result-object v8

    .line 366
    filled-new-array {v8}, [Ljava/lang/String;

    .line 367
    .line 368
    .line 369
    move-result-object v8

    .line 370
    invoke-virtual {v2, v0, v8}, Lorg/eclipse/jetty/util/MultiPartOutputStream;->startPart(Ljava/lang/String;[Ljava/lang/String;)V

    .line 371
    .line 372
    .line 373
    invoke-virtual {v1, v13, v14}, Lorg/eclipse/jetty/server/InclusiveByteRange;->getFirst(J)J

    .line 374
    .line 375
    .line 376
    move-result-wide v21

    .line 377
    invoke-virtual {v1, v13, v14}, Lorg/eclipse/jetty/server/InclusiveByteRange;->getSize(J)J

    .line 378
    .line 379
    .line 380
    move-result-wide v8

    .line 381
    if-eqz v4, :cond_b

    .line 382
    .line 383
    cmp-long v1, v21, v6

    .line 384
    .line 385
    if-gez v1, :cond_9

    .line 386
    .line 387
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 388
    .line 389
    .line 390
    invoke-virtual/range {p4 .. p4}, Lorg/eclipse/jetty/util/resource/Resource;->getInputStream()Ljava/io/InputStream;

    .line 391
    .line 392
    .line 393
    move-result-object v4

    .line 394
    move-wide v6, v15

    .line 395
    :cond_9
    cmp-long v1, v6, v21

    .line 396
    .line 397
    if-gez v1, :cond_a

    .line 398
    .line 399
    sub-long v6, v21, v6

    .line 400
    .line 401
    invoke-virtual {v4, v6, v7}, Ljava/io/InputStream;->skip(J)J

    .line 402
    .line 403
    .line 404
    goto :goto_8

    .line 405
    :cond_a
    move-wide/from16 v21, v6

    .line 406
    .line 407
    :goto_8
    invoke-static {v4, v2, v8, v9}, Lorg/eclipse/jetty/util/IO;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;J)V

    .line 408
    .line 409
    .line 410
    add-long v6, v21, v8

    .line 411
    .line 412
    move-object/from16 v20, v2

    .line 413
    .line 414
    goto :goto_9

    .line 415
    :cond_b
    move-object/from16 v19, p4

    .line 416
    .line 417
    move-object/from16 v20, v2

    .line 418
    .line 419
    move-wide/from16 v23, v8

    .line 420
    .line 421
    invoke-virtual/range {v19 .. v24}, Lorg/eclipse/jetty/util/resource/Resource;->writeTo(Ljava/io/OutputStream;JJ)V

    .line 422
    .line 423
    .line 424
    :goto_9
    add-int/lit8 v5, v5, 0x1

    .line 425
    .line 426
    move-object/from16 v2, v20

    .line 427
    .line 428
    goto :goto_7

    .line 429
    :cond_c
    move-object/from16 v20, v2

    .line 430
    .line 431
    if-eqz v4, :cond_d

    .line 432
    .line 433
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 434
    .line 435
    .line 436
    :cond_d
    invoke-virtual/range {v20 .. v20}, Lorg/eclipse/jetty/util/MultiPartOutputStream;->close()V

    .line 437
    .line 438
    .line 439
    goto/16 :goto_f

    .line 440
    .line 441
    :cond_e
    :goto_a
    invoke-virtual {v0, v1, v2, v13, v14}, Lorg/eclipse/jetty/servlet/DefaultServlet;->writeHeaders(Ljavax/servlet/http/HttpServletResponse;Lorg/eclipse/jetty/http/HttpContent;J)V

    .line 442
    .line 443
    .line 444
    const/16 v0, 0x1a0

    .line 445
    .line 446
    invoke-interface {v1, v0}, Ljavax/servlet/http/HttpServletResponse;->setStatus(I)V

    .line 447
    .line 448
    .line 449
    invoke-static {v13, v14}, Lorg/eclipse/jetty/server/InclusiveByteRange;->to416HeaderRangeString(J)Ljava/lang/String;

    .line 450
    .line 451
    .line 452
    move-result-object v0

    .line 453
    invoke-interface {v1, v6, v0}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 454
    .line 455
    .line 456
    const-wide/16 v11, 0x0

    .line 457
    .line 458
    move-object/from16 v9, p4

    .line 459
    .line 460
    invoke-virtual/range {v9 .. v14}, Lorg/eclipse/jetty/util/resource/Resource;->writeTo(Ljava/io/OutputStream;JJ)V

    .line 461
    .line 462
    .line 463
    return-void

    .line 464
    :cond_f
    :goto_b
    if-eqz p3, :cond_10

    .line 465
    .line 466
    const-wide/16 v11, 0x0

    .line 467
    .line 468
    move-object/from16 v9, p4

    .line 469
    .line 470
    invoke-virtual/range {v9 .. v14}, Lorg/eclipse/jetty/util/resource/Resource;->writeTo(Ljava/io/OutputStream;JJ)V

    .line 471
    .line 472
    .line 473
    goto :goto_f

    .line 474
    :cond_10
    if-eqz v2, :cond_14

    .line 475
    .line 476
    if-nez v8, :cond_14

    .line 477
    .line 478
    instance-of v3, v10, Lorg/eclipse/jetty/server/HttpOutput;

    .line 479
    .line 480
    if-eqz v3, :cond_14

    .line 481
    .line 482
    instance-of v3, v1, Lorg/eclipse/jetty/server/Response;

    .line 483
    .line 484
    if-eqz v3, :cond_11

    .line 485
    .line 486
    check-cast v1, Lorg/eclipse/jetty/server/Response;

    .line 487
    .line 488
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/Response;->getHttpFields()Lorg/eclipse/jetty/http/HttpFields;

    .line 489
    .line 490
    .line 491
    move-result-object v1

    .line 492
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/servlet/DefaultServlet;->writeOptionHeaders(Lorg/eclipse/jetty/http/HttpFields;)V

    .line 493
    .line 494
    .line 495
    check-cast v10, Lorg/eclipse/jetty/server/AbstractHttpConnection$Output;

    .line 496
    .line 497
    invoke-virtual {v10, v2}, Lorg/eclipse/jetty/server/AbstractHttpConnection$Output;->sendContent(Ljava/lang/Object;)V

    .line 498
    .line 499
    .line 500
    goto :goto_f

    .line 501
    :cond_11
    if-eqz v6, :cond_12

    .line 502
    .line 503
    invoke-interface {v2}, Lorg/eclipse/jetty/http/HttpContent;->getDirectBuffer()Lorg/eclipse/jetty/io/Buffer;

    .line 504
    .line 505
    .line 506
    move-result-object v3

    .line 507
    goto :goto_c

    .line 508
    :cond_12
    invoke-interface {v2}, Lorg/eclipse/jetty/http/HttpContent;->getIndirectBuffer()Lorg/eclipse/jetty/io/Buffer;

    .line 509
    .line 510
    .line 511
    move-result-object v3

    .line 512
    :goto_c
    if-eqz v3, :cond_13

    .line 513
    .line 514
    invoke-virtual {v0, v1, v2, v13, v14}, Lorg/eclipse/jetty/servlet/DefaultServlet;->writeHeaders(Ljavax/servlet/http/HttpServletResponse;Lorg/eclipse/jetty/http/HttpContent;J)V

    .line 515
    .line 516
    .line 517
    check-cast v10, Lorg/eclipse/jetty/server/AbstractHttpConnection$Output;

    .line 518
    .line 519
    invoke-virtual {v10, v3}, Lorg/eclipse/jetty/server/AbstractHttpConnection$Output;->sendContent(Ljava/lang/Object;)V

    .line 520
    .line 521
    .line 522
    goto :goto_f

    .line 523
    :cond_13
    invoke-virtual {v0, v1, v2, v13, v14}, Lorg/eclipse/jetty/servlet/DefaultServlet;->writeHeaders(Ljavax/servlet/http/HttpServletResponse;Lorg/eclipse/jetty/http/HttpContent;J)V

    .line 524
    .line 525
    .line 526
    const-wide/16 v11, 0x0

    .line 527
    .line 528
    move-object/from16 v9, p4

    .line 529
    .line 530
    invoke-virtual/range {v9 .. v14}, Lorg/eclipse/jetty/util/resource/Resource;->writeTo(Ljava/io/OutputStream;JJ)V

    .line 531
    .line 532
    .line 533
    goto :goto_f

    .line 534
    :cond_14
    if-eqz v8, :cond_15

    .line 535
    .line 536
    goto :goto_d

    .line 537
    :cond_15
    move-wide v11, v13

    .line 538
    :goto_d
    invoke-virtual {v0, v1, v2, v11, v12}, Lorg/eclipse/jetty/servlet/DefaultServlet;->writeHeaders(Ljavax/servlet/http/HttpServletResponse;Lorg/eclipse/jetty/http/HttpContent;J)V

    .line 539
    .line 540
    .line 541
    if-nez v2, :cond_16

    .line 542
    .line 543
    const/4 v0, 0x0

    .line 544
    goto :goto_e

    .line 545
    :cond_16
    invoke-interface {v2}, Lorg/eclipse/jetty/http/HttpContent;->getIndirectBuffer()Lorg/eclipse/jetty/io/Buffer;

    .line 546
    .line 547
    .line 548
    move-result-object v0

    .line 549
    :goto_e
    if-eqz v0, :cond_17

    .line 550
    .line 551
    invoke-interface {v0, v10}, Lorg/eclipse/jetty/io/Buffer;->writeTo(Ljava/io/OutputStream;)V

    .line 552
    .line 553
    .line 554
    goto :goto_f

    .line 555
    :cond_17
    const-wide/16 v11, 0x0

    .line 556
    .line 557
    move-object/from16 v9, p4

    .line 558
    .line 559
    invoke-virtual/range {v9 .. v14}, Lorg/eclipse/jetty/util/resource/Resource;->writeTo(Ljava/io/OutputStream;JJ)V

    .line 560
    .line 561
    .line 562
    :goto_f
    return-void
.end method

.method public sendDirectory(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lorg/eclipse/jetty/util/resource/Resource;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_dirAllowed:Z

    .line 2
    .line 3
    const/16 v1, 0x193

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p2, v1}, Ljavax/servlet/http/HttpServletResponse;->sendError(I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getRequestURI()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "/"

    .line 16
    .line 17
    invoke-static {p1, v0}, Lorg/eclipse/jetty/util/URIUtil;->addPaths(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object v0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_resourceBase:Lorg/eclipse/jetty/util/resource/Resource;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    instance-of p0, v0, Lorg/eclipse/jetty/util/resource/ResourceCollection;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    invoke-virtual {v0, p4}, Lorg/eclipse/jetty/util/resource/Resource;->addPath(Ljava/lang/String;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 35
    .line 36
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getBaseResource()Lorg/eclipse/jetty/util/resource/Resource;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    instance-of v0, v0, Lorg/eclipse/jetty/util/resource/ResourceCollection;

    .line 41
    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 45
    .line 46
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getBaseResource()Lorg/eclipse/jetty/util/resource/Resource;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0, p4}, Lorg/eclipse/jetty/util/resource/Resource;->addPath(Ljava/lang/String;)Lorg/eclipse/jetty/util/resource/Resource;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    :cond_2
    :goto_0
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    const/4 p4, 0x1

    .line 59
    if-le p0, p4, :cond_3

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_3
    const/4 p4, 0x0

    .line 63
    :goto_1
    invoke-virtual {p3, p1, p4}, Lorg/eclipse/jetty/util/resource/Resource;->getListHTML(Ljava/lang/String;Z)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    if-nez p0, :cond_4

    .line 68
    .line 69
    const-string p0, "No directory"

    .line 70
    .line 71
    invoke-interface {p2, v1, p0}, Ljavax/servlet/http/HttpServletResponse;->sendError(ILjava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_4
    const-string p1, "UTF-8"

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const-string p1, "text/html; charset=UTF-8"

    .line 82
    .line 83
    invoke-interface {p2, p1}, Ll/lse0;->setContentType(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    array-length p1, p0

    .line 87
    invoke-interface {p2, p1}, Ll/lse0;->setContentLength(I)V

    .line 88
    .line 89
    .line 90
    invoke-interface {p2}, Ll/lse0;->getOutputStream()Ll/ese0;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write([B)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public writeHeaders(Ljavax/servlet/http/HttpServletResponse;Lorg/eclipse/jetty/http/HttpContent;J)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Lorg/eclipse/jetty/http/HttpContent;->getContentType()Lorg/eclipse/jetty/io/Buffer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ll/lse0;->getContentType()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p2}, Lorg/eclipse/jetty/http/HttpContent;->getContentType()Lorg/eclipse/jetty/io/Buffer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {p1, v0}, Ll/lse0;->setContentType(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    instance-of v0, p1, Lorg/eclipse/jetty/server/Response;

    .line 25
    .line 26
    const-wide/16 v1, -0x1

    .line 27
    .line 28
    if-eqz v0, :cond_4

    .line 29
    .line 30
    check-cast p1, Lorg/eclipse/jetty/server/Response;

    .line 31
    .line 32
    invoke-virtual {p1}, Lorg/eclipse/jetty/server/Response;->getHttpFields()Lorg/eclipse/jetty/http/HttpFields;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-interface {p2}, Lorg/eclipse/jetty/http/HttpContent;->getLastModified()Lorg/eclipse/jetty/io/Buffer;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    if-eqz v3, :cond_1

    .line 41
    .line 42
    sget-object v3, Lorg/eclipse/jetty/http/HttpHeaders;->LAST_MODIFIED_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 43
    .line 44
    invoke-interface {p2}, Lorg/eclipse/jetty/http/HttpContent;->getLastModified()Lorg/eclipse/jetty/io/Buffer;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-virtual {v0, v3, p2}, Lorg/eclipse/jetty/http/HttpFields;->put(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    invoke-interface {p2}, Lorg/eclipse/jetty/http/HttpContent;->getResource()Lorg/eclipse/jetty/util/resource/Resource;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    if-eqz v3, :cond_2

    .line 57
    .line 58
    invoke-interface {p2}, Lorg/eclipse/jetty/http/HttpContent;->getResource()Lorg/eclipse/jetty/util/resource/Resource;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-virtual {p2}, Lorg/eclipse/jetty/util/resource/Resource;->lastModified()J

    .line 63
    .line 64
    .line 65
    move-result-wide v3

    .line 66
    cmp-long p2, v3, v1

    .line 67
    .line 68
    if-eqz p2, :cond_2

    .line 69
    .line 70
    sget-object p2, Lorg/eclipse/jetty/http/HttpHeaders;->LAST_MODIFIED_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    .line 71
    .line 72
    invoke-virtual {v0, p2, v3, v4}, Lorg/eclipse/jetty/http/HttpFields;->putDateField(Lorg/eclipse/jetty/io/Buffer;J)V

    .line 73
    .line 74
    .line 75
    :cond_2
    :goto_0
    cmp-long p2, p3, v1

    .line 76
    .line 77
    if-eqz p2, :cond_3

    .line 78
    .line 79
    invoke-virtual {p1, p3, p4}, Lorg/eclipse/jetty/server/Response;->setLongContentLength(J)V

    .line 80
    .line 81
    .line 82
    :cond_3
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/servlet/DefaultServlet;->writeOptionHeaders(Lorg/eclipse/jetty/http/HttpFields;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_4
    invoke-interface {p2}, Lorg/eclipse/jetty/http/HttpContent;->getResource()Lorg/eclipse/jetty/util/resource/Resource;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-virtual {p2}, Lorg/eclipse/jetty/util/resource/Resource;->lastModified()J

    .line 91
    .line 92
    .line 93
    move-result-wide v3

    .line 94
    const-wide/16 v5, 0x0

    .line 95
    .line 96
    cmp-long p2, v3, v5

    .line 97
    .line 98
    if-ltz p2, :cond_5

    .line 99
    .line 100
    const-string p2, "Last-Modified"

    .line 101
    .line 102
    invoke-interface {p1, p2, v3, v4}, Ljavax/servlet/http/HttpServletResponse;->setDateHeader(Ljava/lang/String;J)V

    .line 103
    .line 104
    .line 105
    :cond_5
    cmp-long p2, p3, v1

    .line 106
    .line 107
    if-eqz p2, :cond_7

    .line 108
    .line 109
    const-wide/32 v0, 0x7fffffff

    .line 110
    .line 111
    .line 112
    cmp-long p2, p3, v0

    .line 113
    .line 114
    if-gez p2, :cond_6

    .line 115
    .line 116
    long-to-int p2, p3

    .line 117
    invoke-interface {p1, p2}, Ll/lse0;->setContentLength(I)V

    .line 118
    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_6
    const-string p2, "Content-Length"

    .line 122
    .line 123
    invoke-static {p3, p4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p3

    .line 127
    invoke-interface {p1, p2, p3}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :cond_7
    :goto_1
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/servlet/DefaultServlet;->writeOptionHeaders(Ljavax/servlet/http/HttpServletResponse;)V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public writeOptionHeaders(Ljavax/servlet/http/HttpServletResponse;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_acceptRanges:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v0, "Accept-Ranges"

    .line 6
    .line 7
    const-string v1, "bytes"

    .line 8
    .line 9
    invoke-interface {p1, v0, v1}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_cacheControl:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    const-string v0, "Cache-Control"

    .line 17
    .line 18
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p1, v0, p0}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public writeOptionHeaders(Lorg/eclipse/jetty/http/HttpFields;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 26
    iget-boolean v0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_acceptRanges:Z

    if-eqz v0, :cond_0

    .line 27
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->ACCEPT_RANGES_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    sget-object v1, Lorg/eclipse/jetty/http/HttpHeaderValues;->BYTES_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    invoke-virtual {p1, v0, v1}, Lorg/eclipse/jetty/http/HttpFields;->put(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 28
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/DefaultServlet;->_cacheControl:Lorg/eclipse/jetty/io/ByteArrayBuffer;

    if-eqz p0, :cond_1

    .line 29
    sget-object v0, Lorg/eclipse/jetty/http/HttpHeaders;->CACHE_CONTROL_BUFFER:Lorg/eclipse/jetty/io/Buffer;

    invoke-virtual {p1, v0, p0}, Lorg/eclipse/jetty/http/HttpFields;->put(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    :cond_1
    return-void
.end method
