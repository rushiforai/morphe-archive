.class public Lorg/eclipse/jetty/server/Dispatcher;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/c2d0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/server/Dispatcher$IncludeAttributes;,
        Lorg/eclipse/jetty/server/Dispatcher$ForwardAttributes;
    }
.end annotation


# static fields
.field public static final __FORWARD_PREFIX:Ljava/lang/String; = "javax.servlet.forward."

.field public static final __INCLUDE_PREFIX:Ljava/lang/String; = "javax.servlet.include."

.field public static final __JSP_FILE:Ljava/lang/String; = "org.apache.catalina.jsp_file"


# instance fields
.field private final _contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

.field private final _dQuery:Ljava/lang/String;

.field private final _named:Ljava/lang/String;

.field private final _path:Ljava/lang/String;

.field private final _uri:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/handler/ContextHandler;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lorg/eclipse/jetty/server/Dispatcher;->_contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 18
    iput-object p2, p0, Lorg/eclipse/jetty/server/Dispatcher;->_named:Ljava/lang/String;

    const/4 p1, 0x0

    .line 19
    iput-object p1, p0, Lorg/eclipse/jetty/server/Dispatcher;->_uri:Ljava/lang/String;

    .line 20
    iput-object p1, p0, Lorg/eclipse/jetty/server/Dispatcher;->_path:Ljava/lang/String;

    .line 21
    iput-object p1, p0, Lorg/eclipse/jetty/server/Dispatcher;->_dQuery:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jetty/server/handler/ContextHandler;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/server/Dispatcher;->_contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/eclipse/jetty/server/Dispatcher;->_uri:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lorg/eclipse/jetty/server/Dispatcher;->_path:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Lorg/eclipse/jetty/server/Dispatcher;->_dQuery:Ljava/lang/String;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Lorg/eclipse/jetty/server/Dispatcher;->_named:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic access$000(Lorg/eclipse/jetty/server/Dispatcher;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/Dispatcher;->_named:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private commitResponse(Ll/lse0;Lorg/eclipse/jetty/server/Request;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Lorg/eclipse/jetty/server/Request;->getResponse()Lorg/eclipse/jetty/server/Response;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/Response;->isWriting()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    :try_start_0
    invoke-interface {p1}, Ll/lse0;->getWriter()Ljava/io/PrintWriter;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ljava/io/PrintWriter;->close()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    invoke-interface {p1}, Ll/lse0;->getOutputStream()Ll/ese0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :try_start_1
    invoke-interface {p1}, Ll/lse0;->getOutputStream()Ll/ese0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :catch_1
    invoke-interface {p1}, Ll/lse0;->getWriter()Ljava/io/PrintWriter;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ljava/io/PrintWriter;->close()V

    .line 40
    .line 41
    .line 42
    :goto_0
    return-void
.end method


# virtual methods
.method public error(Ll/gse0;Ll/lse0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Ljavax/servlet/DispatcherType;->ERROR:Ljavax/servlet/DispatcherType;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, v0}, Lorg/eclipse/jetty/server/Dispatcher;->forward(Ll/gse0;Ll/lse0;Ljavax/servlet/DispatcherType;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public forward(Ll/gse0;Ll/lse0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 303
    sget-object v0, Ljavax/servlet/DispatcherType;->FORWARD:Ljavax/servlet/DispatcherType;

    invoke-virtual {p0, p1, p2, v0}, Lorg/eclipse/jetty/server/Dispatcher;->forward(Ll/gse0;Ll/lse0;Ljavax/servlet/DispatcherType;)V

    return-void
.end method

.method public forward(Ll/gse0;Ll/lse0;Ljavax/servlet/DispatcherType;)V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string v0, "javax.servlet.forward.request_uri"

    .line 2
    .line 3
    instance-of v1, p1, Lorg/eclipse/jetty/server/Request;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    move-object v1, p1

    .line 8
    check-cast v1, Lorg/eclipse/jetty/server/Request;

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-static {}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getCurrentConnection()Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getRequest()Lorg/eclipse/jetty/server/Request;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    :goto_0
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/Request;->getResponse()Lorg/eclipse/jetty/server/Response;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {p2}, Ll/lse0;->resetBuffer()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2}, Lorg/eclipse/jetty/server/Response;->fwdReset()V

    .line 27
    .line 28
    .line 29
    instance-of v2, p1, Ljavax/servlet/http/HttpServletRequest;

    .line 30
    .line 31
    if-nez v2, :cond_1

    .line 32
    .line 33
    new-instance v2, Lorg/eclipse/jetty/server/ServletRequestHttpWrapper;

    .line 34
    .line 35
    invoke-direct {v2, p1}, Lorg/eclipse/jetty/server/ServletRequestHttpWrapper;-><init>(Ll/gse0;)V

    .line 36
    .line 37
    .line 38
    move-object p1, v2

    .line 39
    :cond_1
    instance-of v2, p2, Ljavax/servlet/http/HttpServletResponse;

    .line 40
    .line 41
    if-nez v2, :cond_2

    .line 42
    .line 43
    new-instance v2, Lorg/eclipse/jetty/server/ServletResponseHttpWrapper;

    .line 44
    .line 45
    invoke-direct {v2, p2}, Lorg/eclipse/jetty/server/ServletResponseHttpWrapper;-><init>(Ll/lse0;)V

    .line 46
    .line 47
    .line 48
    move-object p2, v2

    .line 49
    :cond_2
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/Request;->isHandled()Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/Request;->getRequestURI()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/Request;->getContextPath()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/Request;->getServletPath()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/Request;->getPathInfo()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/Request;->getQueryString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v7

    .line 73
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/Request;->getAttributes()Lorg/eclipse/jetty/util/Attributes;

    .line 74
    .line 75
    .line 76
    move-result-object v8

    .line 77
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/Request;->getDispatcherType()Ljavax/servlet/DispatcherType;

    .line 78
    .line 79
    .line 80
    move-result-object v9

    .line 81
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/Request;->getParameters()Lorg/eclipse/jetty/util/MultiMap;

    .line 82
    .line 83
    .line 84
    move-result-object v10

    .line 85
    const/4 v11, 0x0

    .line 86
    :try_start_0
    invoke-virtual {v1, v11}, Lorg/eclipse/jetty/server/Request;->setHandled(Z)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1, p3}, Lorg/eclipse/jetty/server/Request;->setDispatcherType(Ljavax/servlet/DispatcherType;)V

    .line 90
    .line 91
    .line 92
    iget-object p3, p0, Lorg/eclipse/jetty/server/Dispatcher;->_named:Ljava/lang/String;

    .line 93
    .line 94
    if-eqz p3, :cond_3

    .line 95
    .line 96
    iget-object p0, p0, Lorg/eclipse/jetty/server/Dispatcher;->_contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 97
    .line 98
    check-cast p1, Ljavax/servlet/http/HttpServletRequest;

    .line 99
    .line 100
    check-cast p2, Ljavax/servlet/http/HttpServletResponse;

    .line 101
    .line 102
    invoke-virtual {p0, p3, v1, p1, p2}, Lorg/eclipse/jetty/server/handler/ScopedHandler;->handle(Ljava/lang/String;Lorg/eclipse/jetty/server/Request;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

    .line 103
    .line 104
    .line 105
    goto/16 :goto_2

    .line 106
    .line 107
    :catchall_0
    move-exception p0

    .line 108
    goto/16 :goto_3

    .line 109
    .line 110
    :cond_3
    iget-object p3, p0, Lorg/eclipse/jetty/server/Dispatcher;->_dQuery:Ljava/lang/String;

    .line 111
    .line 112
    if-eqz p3, :cond_5

    .line 113
    .line 114
    if-nez v10, :cond_4

    .line 115
    .line 116
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/Request;->extractParameters()V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/Request;->getParameters()Lorg/eclipse/jetty/util/MultiMap;

    .line 120
    .line 121
    .line 122
    move-result-object v10

    .line 123
    :cond_4
    invoke-virtual {v1, p3}, Lorg/eclipse/jetty/server/Request;->mergeQueryString(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    :cond_5
    new-instance p3, Lorg/eclipse/jetty/server/Dispatcher$ForwardAttributes;

    .line 127
    .line 128
    invoke-direct {p3, p0, v8}, Lorg/eclipse/jetty/server/Dispatcher$ForwardAttributes;-><init>(Lorg/eclipse/jetty/server/Dispatcher;Lorg/eclipse/jetty/util/Attributes;)V

    .line 129
    .line 130
    .line 131
    invoke-interface {v8, v0}, Lorg/eclipse/jetty/util/Attributes;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v11

    .line 135
    if-eqz v11, :cond_6

    .line 136
    .line 137
    const-string v11, "javax.servlet.forward.path_info"

    .line 138
    .line 139
    invoke-interface {v8, v11}, Lorg/eclipse/jetty/util/Attributes;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v11

    .line 143
    check-cast v11, Ljava/lang/String;

    .line 144
    .line 145
    iput-object v11, p3, Lorg/eclipse/jetty/server/Dispatcher$ForwardAttributes;->_pathInfo:Ljava/lang/String;

    .line 146
    .line 147
    const-string v11, "javax.servlet.forward.query_string"

    .line 148
    .line 149
    invoke-interface {v8, v11}, Lorg/eclipse/jetty/util/Attributes;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v11

    .line 153
    check-cast v11, Ljava/lang/String;

    .line 154
    .line 155
    iput-object v11, p3, Lorg/eclipse/jetty/server/Dispatcher$ForwardAttributes;->_query:Ljava/lang/String;

    .line 156
    .line 157
    invoke-interface {v8, v0}, Lorg/eclipse/jetty/util/Attributes;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    check-cast v0, Ljava/lang/String;

    .line 162
    .line 163
    iput-object v0, p3, Lorg/eclipse/jetty/server/Dispatcher$ForwardAttributes;->_requestURI:Ljava/lang/String;

    .line 164
    .line 165
    const-string v0, "javax.servlet.forward.context_path"

    .line 166
    .line 167
    invoke-interface {v8, v0}, Lorg/eclipse/jetty/util/Attributes;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    check-cast v0, Ljava/lang/String;

    .line 172
    .line 173
    iput-object v0, p3, Lorg/eclipse/jetty/server/Dispatcher$ForwardAttributes;->_contextPath:Ljava/lang/String;

    .line 174
    .line 175
    const-string v0, "javax.servlet.forward.servlet_path"

    .line 176
    .line 177
    invoke-interface {v8, v0}, Lorg/eclipse/jetty/util/Attributes;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    check-cast v0, Ljava/lang/String;

    .line 182
    .line 183
    iput-object v0, p3, Lorg/eclipse/jetty/server/Dispatcher$ForwardAttributes;->_servletPath:Ljava/lang/String;

    .line 184
    .line 185
    goto :goto_1

    .line 186
    :cond_6
    iput-object v6, p3, Lorg/eclipse/jetty/server/Dispatcher$ForwardAttributes;->_pathInfo:Ljava/lang/String;

    .line 187
    .line 188
    iput-object v7, p3, Lorg/eclipse/jetty/server/Dispatcher$ForwardAttributes;->_query:Ljava/lang/String;

    .line 189
    .line 190
    iput-object v3, p3, Lorg/eclipse/jetty/server/Dispatcher$ForwardAttributes;->_requestURI:Ljava/lang/String;

    .line 191
    .line 192
    iput-object v4, p3, Lorg/eclipse/jetty/server/Dispatcher$ForwardAttributes;->_contextPath:Ljava/lang/String;

    .line 193
    .line 194
    iput-object v5, p3, Lorg/eclipse/jetty/server/Dispatcher$ForwardAttributes;->_servletPath:Ljava/lang/String;

    .line 195
    .line 196
    :goto_1
    iget-object v0, p0, Lorg/eclipse/jetty/server/Dispatcher;->_uri:Ljava/lang/String;

    .line 197
    .line 198
    invoke-virtual {v1, v0}, Lorg/eclipse/jetty/server/Request;->setRequestURI(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    iget-object v0, p0, Lorg/eclipse/jetty/server/Dispatcher;->_contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 202
    .line 203
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getContextPath()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {v1, v0}, Lorg/eclipse/jetty/server/Request;->setContextPath(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    const/4 v0, 0x0

    .line 211
    invoke-virtual {v1, v0}, Lorg/eclipse/jetty/server/Request;->setServletPath(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    iget-object v0, p0, Lorg/eclipse/jetty/server/Dispatcher;->_uri:Ljava/lang/String;

    .line 215
    .line 216
    invoke-virtual {v1, v0}, Lorg/eclipse/jetty/server/Request;->setPathInfo(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {v1, p3}, Lorg/eclipse/jetty/server/Request;->setAttributes(Lorg/eclipse/jetty/util/Attributes;)V

    .line 220
    .line 221
    .line 222
    iget-object p3, p0, Lorg/eclipse/jetty/server/Dispatcher;->_contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 223
    .line 224
    iget-object v0, p0, Lorg/eclipse/jetty/server/Dispatcher;->_path:Ljava/lang/String;

    .line 225
    .line 226
    check-cast p1, Ljavax/servlet/http/HttpServletRequest;

    .line 227
    .line 228
    move-object v11, p2

    .line 229
    check-cast v11, Ljavax/servlet/http/HttpServletResponse;

    .line 230
    .line 231
    invoke-virtual {p3, v0, v1, p1, v11}, Lorg/eclipse/jetty/server/handler/ScopedHandler;->handle(Ljava/lang/String;Lorg/eclipse/jetty/server/Request;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

    .line 232
    .line 233
    .line 234
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/Request;->getAsyncContinuation()Lorg/eclipse/jetty/server/AsyncContinuation;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    invoke-virtual {p1}, Lorg/eclipse/jetty/server/AsyncContinuation;->isAsyncStarted()Z

    .line 239
    .line 240
    .line 241
    move-result p1

    .line 242
    if-nez p1, :cond_7

    .line 243
    .line 244
    invoke-direct {p0, p2, v1}, Lorg/eclipse/jetty/server/Dispatcher;->commitResponse(Ll/lse0;Lorg/eclipse/jetty/server/Request;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 245
    .line 246
    .line 247
    :cond_7
    :goto_2
    invoke-virtual {v1, v2}, Lorg/eclipse/jetty/server/Request;->setHandled(Z)V

    .line 248
    .line 249
    .line 250
    invoke-virtual {v1, v3}, Lorg/eclipse/jetty/server/Request;->setRequestURI(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    invoke-virtual {v1, v4}, Lorg/eclipse/jetty/server/Request;->setContextPath(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {v1, v5}, Lorg/eclipse/jetty/server/Request;->setServletPath(Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v1, v6}, Lorg/eclipse/jetty/server/Request;->setPathInfo(Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v1, v8}, Lorg/eclipse/jetty/server/Request;->setAttributes(Lorg/eclipse/jetty/util/Attributes;)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {v1, v10}, Lorg/eclipse/jetty/server/Request;->setParameters(Lorg/eclipse/jetty/util/MultiMap;)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {v1, v7}, Lorg/eclipse/jetty/server/Request;->setQueryString(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {v1, v9}, Lorg/eclipse/jetty/server/Request;->setDispatcherType(Ljavax/servlet/DispatcherType;)V

    .line 272
    .line 273
    .line 274
    return-void

    .line 275
    :goto_3
    invoke-virtual {v1, v2}, Lorg/eclipse/jetty/server/Request;->setHandled(Z)V

    .line 276
    .line 277
    .line 278
    invoke-virtual {v1, v3}, Lorg/eclipse/jetty/server/Request;->setRequestURI(Ljava/lang/String;)V

    .line 279
    .line 280
    .line 281
    invoke-virtual {v1, v4}, Lorg/eclipse/jetty/server/Request;->setContextPath(Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    invoke-virtual {v1, v5}, Lorg/eclipse/jetty/server/Request;->setServletPath(Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    invoke-virtual {v1, v6}, Lorg/eclipse/jetty/server/Request;->setPathInfo(Ljava/lang/String;)V

    .line 288
    .line 289
    .line 290
    invoke-virtual {v1, v8}, Lorg/eclipse/jetty/server/Request;->setAttributes(Lorg/eclipse/jetty/util/Attributes;)V

    .line 291
    .line 292
    .line 293
    invoke-virtual {v1, v10}, Lorg/eclipse/jetty/server/Request;->setParameters(Lorg/eclipse/jetty/util/MultiMap;)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {v1, v7}, Lorg/eclipse/jetty/server/Request;->setQueryString(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {v1, v9}, Lorg/eclipse/jetty/server/Request;->setDispatcherType(Ljavax/servlet/DispatcherType;)V

    .line 300
    .line 301
    .line 302
    throw p0
.end method

.method public include(Ll/gse0;Ll/lse0;)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    instance-of v0, p1, Lorg/eclipse/jetty/server/Request;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lorg/eclipse/jetty/server/Request;

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-static {}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getCurrentConnection()Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getRequest()Lorg/eclipse/jetty/server/Request;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :goto_0
    instance-of v1, p1, Ljavax/servlet/http/HttpServletRequest;

    .line 18
    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    new-instance v1, Lorg/eclipse/jetty/server/ServletRequestHttpWrapper;

    .line 22
    .line 23
    invoke-direct {v1, p1}, Lorg/eclipse/jetty/server/ServletRequestHttpWrapper;-><init>(Ll/gse0;)V

    .line 24
    .line 25
    .line 26
    move-object p1, v1

    .line 27
    :cond_1
    instance-of v1, p2, Ljavax/servlet/http/HttpServletResponse;

    .line 28
    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    new-instance v1, Lorg/eclipse/jetty/server/ServletResponseHttpWrapper;

    .line 32
    .line 33
    invoke-direct {v1, p2}, Lorg/eclipse/jetty/server/ServletResponseHttpWrapper;-><init>(Ll/lse0;)V

    .line 34
    .line 35
    .line 36
    move-object p2, v1

    .line 37
    :cond_2
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->getDispatcherType()Ljavax/servlet/DispatcherType;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->getAttributes()Lorg/eclipse/jetty/util/Attributes;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->getParameters()Lorg/eclipse/jetty/util/MultiMap;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    :try_start_0
    sget-object v4, Ljavax/servlet/DispatcherType;->INCLUDE:Ljavax/servlet/DispatcherType;

    .line 50
    .line 51
    invoke-virtual {v0, v4}, Lorg/eclipse/jetty/server/Request;->setDispatcherType(Ljavax/servlet/DispatcherType;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->getConnection()Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-virtual {v4}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->include()V

    .line 59
    .line 60
    .line 61
    iget-object v4, p0, Lorg/eclipse/jetty/server/Dispatcher;->_named:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz v4, :cond_3

    .line 64
    .line 65
    iget-object p0, p0, Lorg/eclipse/jetty/server/Dispatcher;->_contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 66
    .line 67
    check-cast p1, Ljavax/servlet/http/HttpServletRequest;

    .line 68
    .line 69
    check-cast p2, Ljavax/servlet/http/HttpServletResponse;

    .line 70
    .line 71
    invoke-virtual {p0, v4, v0, p1, p2}, Lorg/eclipse/jetty/server/handler/ScopedHandler;->handle(Ljava/lang/String;Lorg/eclipse/jetty/server/Request;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

    .line 72
    .line 73
    .line 74
    goto/16 :goto_2

    .line 75
    .line 76
    :catchall_0
    move-exception p0

    .line 77
    goto/16 :goto_3

    .line 78
    .line 79
    :cond_3
    iget-object v4, p0, Lorg/eclipse/jetty/server/Dispatcher;->_dQuery:Ljava/lang/String;

    .line 80
    .line 81
    if-eqz v4, :cond_7

    .line 82
    .line 83
    if-nez v3, :cond_4

    .line 84
    .line 85
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->extractParameters()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->getParameters()Lorg/eclipse/jetty/util/MultiMap;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    :cond_4
    new-instance v5, Lorg/eclipse/jetty/util/MultiMap;

    .line 93
    .line 94
    invoke-direct {v5}, Lorg/eclipse/jetty/util/MultiMap;-><init>()V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->getCharacterEncoding()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v6

    .line 101
    invoke-static {v4, v5, v6}, Lorg/eclipse/jetty/util/UrlEncoded;->decodeTo(Ljava/lang/String;Lorg/eclipse/jetty/util/MultiMap;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    if-eqz v3, :cond_6

    .line 105
    .line 106
    invoke-virtual {v3}, Lorg/eclipse/jetty/util/MultiMap;->size()I

    .line 107
    .line 108
    .line 109
    move-result v6

    .line 110
    if-lez v6, :cond_6

    .line 111
    .line 112
    invoke-virtual {v3}, Lorg/eclipse/jetty/util/MultiMap;->entrySet()Ljava/util/Set;

    .line 113
    .line 114
    .line 115
    move-result-object v6

    .line 116
    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 117
    .line 118
    .line 119
    move-result-object v6

    .line 120
    :cond_5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 121
    .line 122
    .line 123
    move-result v7

    .line 124
    if-eqz v7, :cond_6

    .line 125
    .line 126
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v7

    .line 130
    check-cast v7, Ljava/util/Map$Entry;

    .line 131
    .line 132
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v8

    .line 136
    check-cast v8, Ljava/lang/String;

    .line 137
    .line 138
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v7

    .line 142
    const/4 v9, 0x0

    .line 143
    :goto_1
    invoke-static {v7}, Lorg/eclipse/jetty/util/LazyList;->size(Ljava/lang/Object;)I

    .line 144
    .line 145
    .line 146
    move-result v10

    .line 147
    if-ge v9, v10, :cond_5

    .line 148
    .line 149
    invoke-static {v7, v9}, Lorg/eclipse/jetty/util/LazyList;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v10

    .line 153
    invoke-virtual {v5, v8, v10}, Lorg/eclipse/jetty/util/MultiMap;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 154
    .line 155
    .line 156
    add-int/lit8 v9, v9, 0x1

    .line 157
    .line 158
    goto :goto_1

    .line 159
    :cond_6
    invoke-virtual {v0, v5}, Lorg/eclipse/jetty/server/Request;->setParameters(Lorg/eclipse/jetty/util/MultiMap;)V

    .line 160
    .line 161
    .line 162
    :cond_7
    new-instance v5, Lorg/eclipse/jetty/server/Dispatcher$IncludeAttributes;

    .line 163
    .line 164
    invoke-direct {v5, p0, v2}, Lorg/eclipse/jetty/server/Dispatcher$IncludeAttributes;-><init>(Lorg/eclipse/jetty/server/Dispatcher;Lorg/eclipse/jetty/util/Attributes;)V

    .line 165
    .line 166
    .line 167
    iget-object v6, p0, Lorg/eclipse/jetty/server/Dispatcher;->_uri:Ljava/lang/String;

    .line 168
    .line 169
    iput-object v6, v5, Lorg/eclipse/jetty/server/Dispatcher$IncludeAttributes;->_requestURI:Ljava/lang/String;

    .line 170
    .line 171
    iget-object v6, p0, Lorg/eclipse/jetty/server/Dispatcher;->_contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 172
    .line 173
    invoke-virtual {v6}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getContextPath()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v6

    .line 177
    iput-object v6, v5, Lorg/eclipse/jetty/server/Dispatcher$IncludeAttributes;->_contextPath:Ljava/lang/String;

    .line 178
    .line 179
    const/4 v6, 0x0

    .line 180
    iput-object v6, v5, Lorg/eclipse/jetty/server/Dispatcher$IncludeAttributes;->_servletPath:Ljava/lang/String;

    .line 181
    .line 182
    iget-object v6, p0, Lorg/eclipse/jetty/server/Dispatcher;->_path:Ljava/lang/String;

    .line 183
    .line 184
    iput-object v6, v5, Lorg/eclipse/jetty/server/Dispatcher$IncludeAttributes;->_pathInfo:Ljava/lang/String;

    .line 185
    .line 186
    iput-object v4, v5, Lorg/eclipse/jetty/server/Dispatcher$IncludeAttributes;->_query:Ljava/lang/String;

    .line 187
    .line 188
    invoke-virtual {v0, v5}, Lorg/eclipse/jetty/server/Request;->setAttributes(Lorg/eclipse/jetty/util/Attributes;)V

    .line 189
    .line 190
    .line 191
    iget-object v4, p0, Lorg/eclipse/jetty/server/Dispatcher;->_contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 192
    .line 193
    iget-object p0, p0, Lorg/eclipse/jetty/server/Dispatcher;->_path:Ljava/lang/String;

    .line 194
    .line 195
    check-cast p1, Ljavax/servlet/http/HttpServletRequest;

    .line 196
    .line 197
    check-cast p2, Ljavax/servlet/http/HttpServletResponse;

    .line 198
    .line 199
    invoke-virtual {v4, p0, v0, p1, p2}, Lorg/eclipse/jetty/server/handler/ScopedHandler;->handle(Ljava/lang/String;Lorg/eclipse/jetty/server/Request;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 200
    .line 201
    .line 202
    :goto_2
    invoke-virtual {v0, v2}, Lorg/eclipse/jetty/server/Request;->setAttributes(Lorg/eclipse/jetty/util/Attributes;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->getConnection()Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->included()V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v0, v3}, Lorg/eclipse/jetty/server/Request;->setParameters(Lorg/eclipse/jetty/util/MultiMap;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/server/Request;->setDispatcherType(Ljavax/servlet/DispatcherType;)V

    .line 216
    .line 217
    .line 218
    return-void

    .line 219
    :goto_3
    invoke-virtual {v0, v2}, Lorg/eclipse/jetty/server/Request;->setAttributes(Lorg/eclipse/jetty/util/Attributes;)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->getConnection()Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    invoke-virtual {p1}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->included()V

    .line 227
    .line 228
    .line 229
    invoke-virtual {v0, v3}, Lorg/eclipse/jetty/server/Request;->setParameters(Lorg/eclipse/jetty/util/MultiMap;)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/server/Request;->setDispatcherType(Ljavax/servlet/DispatcherType;)V

    .line 233
    .line 234
    .line 235
    throw p0
.end method
