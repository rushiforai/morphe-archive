.class public Lorg/eclipse/jetty/servlet/Invoker;
.super Ljavax/servlet/http/HttpServlet;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jetty/servlet/Invoker$InvokedRequest;
    }
.end annotation


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;


# instance fields
.field private _contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

.field private _invokerEntry:Ljava/util/Map$Entry;

.field private _nonContextServlets:Z

.field private _parameters:Ljava/util/Map;

.field private _servletHandler:Lorg/eclipse/jetty/servlet/ServletHandler;

.field private _verbose:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/servlet/Invoker;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/servlet/Invoker;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljavax/servlet/http/HttpServlet;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getHolder([Lorg/eclipse/jetty/servlet/ServletHolder;Ljava/lang/String;)Lorg/eclipse/jetty/servlet/ServletHolder;
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object p0

    .line 5
    :cond_0
    const/4 v0, 0x0

    .line 6
    :goto_0
    if-nez p0, :cond_2

    .line 7
    .line 8
    array-length v1, p1

    .line 9
    if-ge v0, v1, :cond_2

    .line 10
    .line 11
    aget-object v1, p1, v0

    .line 12
    .line 13
    invoke-virtual {v1}, Lorg/eclipse/jetty/servlet/Holder;->getName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    aget-object p0, p1, v0

    .line 24
    .line 25
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_2
    return-object p0
.end method


# virtual methods
.method public init()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ljavax/servlet/GenericServlet;->getServletContext()Ll/ase0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;

    .line 6
    .line 7
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/handler/ContextHandler$Context;->getContextHandler()Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lorg/eclipse/jetty/servlet/Invoker;->_contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 12
    .line 13
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/handler/HandlerWrapper;->getHandler()Lorg/eclipse/jetty/server/Handler;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    :goto_0
    if-eqz v0, :cond_0

    .line 18
    .line 19
    instance-of v1, v0, Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    instance-of v1, v0, Lorg/eclipse/jetty/server/handler/HandlerWrapper;

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    check-cast v0, Lorg/eclipse/jetty/server/handler/HandlerWrapper;

    .line 28
    .line 29
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/handler/HandlerWrapper;->getHandler()Lorg/eclipse/jetty/server/Handler;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    check-cast v0, Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 35
    .line 36
    iput-object v0, p0, Lorg/eclipse/jetty/servlet/Invoker;->_servletHandler:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 37
    .line 38
    invoke-virtual {p0}, Ljavax/servlet/GenericServlet;->getInitParameterNames()Ljava/util/Enumeration;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    :goto_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_6

    .line 47
    .line 48
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p0, v1}, Ljavax/servlet/GenericServlet;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 59
    .line 60
    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    const-string v4, "nonContextServlets"

    .line 65
    .line 66
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    const/4 v5, 0x0

    .line 71
    const/4 v6, 0x1

    .line 72
    const-string v7, "t"

    .line 73
    .line 74
    if-eqz v4, :cond_2

    .line 75
    .line 76
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    if-lez v4, :cond_1

    .line 81
    .line 82
    invoke-virtual {v3, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result v4

    .line 86
    if-eqz v4, :cond_1

    .line 87
    .line 88
    move v4, v6

    .line 89
    goto :goto_2

    .line 90
    :cond_1
    move v4, v5

    .line 91
    :goto_2
    iput-boolean v4, p0, Lorg/eclipse/jetty/servlet/Invoker;->_nonContextServlets:Z

    .line 92
    .line 93
    :cond_2
    const-string v4, "verbose"

    .line 94
    .line 95
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    if-eqz v4, :cond_4

    .line 100
    .line 101
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-lez v1, :cond_3

    .line 106
    .line 107
    invoke-virtual {v3, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-eqz v1, :cond_3

    .line 112
    .line 113
    move v5, v6

    .line 114
    :cond_3
    iput-boolean v5, p0, Lorg/eclipse/jetty/servlet/Invoker;->_verbose:Z

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_4
    iget-object v3, p0, Lorg/eclipse/jetty/servlet/Invoker;->_parameters:Ljava/util/Map;

    .line 118
    .line 119
    if-nez v3, :cond_5

    .line 120
    .line 121
    new-instance v3, Ljava/util/HashMap;

    .line 122
    .line 123
    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 124
    .line 125
    .line 126
    iput-object v3, p0, Lorg/eclipse/jetty/servlet/Invoker;->_parameters:Ljava/util/Map;

    .line 127
    .line 128
    :cond_5
    iget-object v3, p0, Lorg/eclipse/jetty/servlet/Invoker;->_parameters:Ljava/util/Map;

    .line 129
    .line 130
    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_6
    return-void
.end method

.method public service(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    move-object/from16 v7, p2

    .line 6
    .line 7
    const-string v0, "Dynamic load \'"

    .line 8
    .line 9
    const-string v3, "Dynamic servlet "

    .line 10
    .line 11
    const-string v4, "Making new servlet="

    .line 12
    .line 13
    const-string v5, "javax.servlet.include.servlet_path"

    .line 14
    .line 15
    invoke-interface {v2, v5}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    check-cast v5, Ljava/lang/String;

    .line 20
    .line 21
    const/4 v6, 0x1

    .line 22
    const/4 v8, 0x0

    .line 23
    if-nez v5, :cond_0

    .line 24
    .line 25
    invoke-interface {v2}, Ljavax/servlet/http/HttpServletRequest;->getServletPath()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    move v9, v8

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move v9, v6

    .line 32
    :goto_0
    const-string v10, "javax.servlet.include.path_info"

    .line 33
    .line 34
    invoke-interface {v2, v10}, Ll/gse0;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v10

    .line 38
    check-cast v10, Ljava/lang/String;

    .line 39
    .line 40
    if-nez v10, :cond_1

    .line 41
    .line 42
    invoke-interface {v2}, Ljavax/servlet/http/HttpServletRequest;->getPathInfo()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v10

    .line 46
    :cond_1
    const/16 v11, 0x194

    .line 47
    .line 48
    if-eqz v10, :cond_2

    .line 49
    .line 50
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    .line 51
    .line 52
    .line 53
    move-result v12

    .line 54
    if-gt v12, v6, :cond_3

    .line 55
    .line 56
    :cond_2
    move v0, v11

    .line 57
    goto/16 :goto_b

    .line 58
    .line 59
    :cond_3
    invoke-virtual {v10, v8}, Ljava/lang/String;->charAt(I)C

    .line 60
    .line 61
    .line 62
    move-result v12

    .line 63
    const/16 v13, 0x2f

    .line 64
    .line 65
    if-ne v12, v13, :cond_4

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_4
    move v6, v8

    .line 69
    :goto_1
    invoke-virtual {v10, v13, v6}, Ljava/lang/String;->indexOf(II)I

    .line 70
    .line 71
    .line 72
    move-result v12

    .line 73
    if-gez v12, :cond_5

    .line 74
    .line 75
    invoke-virtual {v10, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v6

    .line 79
    goto :goto_2

    .line 80
    :cond_5
    invoke-virtual {v10, v6, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v6

    .line 84
    :goto_2
    iget-object v12, v1, Lorg/eclipse/jetty/servlet/Invoker;->_servletHandler:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 85
    .line 86
    invoke-virtual {v12}, Lorg/eclipse/jetty/servlet/ServletHandler;->getServlets()[Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 87
    .line 88
    .line 89
    move-result-object v12

    .line 90
    invoke-direct {v1, v12, v6}, Lorg/eclipse/jetty/servlet/Invoker;->getHolder([Lorg/eclipse/jetty/servlet/ServletHolder;Ljava/lang/String;)Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 91
    .line 92
    .line 93
    move-result-object v12

    .line 94
    if-eqz v12, :cond_7

    .line 95
    .line 96
    sget-object v0, Lorg/eclipse/jetty/servlet/Invoker;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 97
    .line 98
    invoke-interface {v0}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    if-eqz v3, :cond_6

    .line 103
    .line 104
    new-instance v3, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    const-string v4, "Adding servlet mapping for named servlet:"

    .line 107
    .line 108
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string v4, ":"

    .line 115
    .line 116
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-static {v5, v6}, Lorg/eclipse/jetty/util/URIUtil;->addPaths(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v4, "/*"

    .line 127
    .line 128
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    new-array v4, v8, [Ljava/lang/Object;

    .line 136
    .line 137
    invoke-interface {v0, v3, v4}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    :cond_6
    new-instance v0, Lorg/eclipse/jetty/servlet/ServletMapping;

    .line 141
    .line 142
    invoke-direct {v0}, Lorg/eclipse/jetty/servlet/ServletMapping;-><init>()V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0, v6}, Lorg/eclipse/jetty/servlet/ServletMapping;->setServletName(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    new-instance v3, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 151
    .line 152
    .line 153
    invoke-static {v5, v6}, Lorg/eclipse/jetty/util/URIUtil;->addPaths(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v4

    .line 157
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    const-string v4, "/*"

    .line 161
    .line 162
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    invoke-virtual {v0, v3}, Lorg/eclipse/jetty/servlet/ServletMapping;->setPathSpec(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    iget-object v3, v1, Lorg/eclipse/jetty/servlet/Invoker;->_servletHandler:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 173
    .line 174
    invoke-virtual {v3}, Lorg/eclipse/jetty/servlet/ServletHandler;->getServletMappings()[Lorg/eclipse/jetty/servlet/ServletMapping;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    const-class v13, Lorg/eclipse/jetty/servlet/ServletMapping;

    .line 179
    .line 180
    invoke-static {v4, v0, v13}, Lorg/eclipse/jetty/util/LazyList;->addToArray([Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;)[Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    check-cast v0, [Lorg/eclipse/jetty/servlet/ServletMapping;

    .line 185
    .line 186
    invoke-virtual {v3, v0}, Lorg/eclipse/jetty/servlet/ServletHandler;->setServletMappings([Lorg/eclipse/jetty/servlet/ServletMapping;)V

    .line 187
    .line 188
    .line 189
    :goto_3
    move-object v4, v6

    .line 190
    goto/16 :goto_7

    .line 191
    .line 192
    :cond_7
    const-string v12, ".class"

    .line 193
    .line 194
    invoke-virtual {v6, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 195
    .line 196
    .line 197
    move-result v12

    .line 198
    if-eqz v12, :cond_8

    .line 199
    .line 200
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 201
    .line 202
    .line 203
    move-result v12

    .line 204
    add-int/lit8 v12, v12, -0x6

    .line 205
    .line 206
    invoke-virtual {v6, v8, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v6

    .line 210
    :cond_8
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 211
    .line 212
    .line 213
    move-result v12

    .line 214
    if-nez v12, :cond_9

    .line 215
    .line 216
    invoke-interface {v7, v11}, Ljavax/servlet/http/HttpServletResponse;->sendError(I)V

    .line 217
    .line 218
    .line 219
    return-void

    .line 220
    :cond_9
    iget-object v12, v1, Lorg/eclipse/jetty/servlet/Invoker;->_servletHandler:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 221
    .line 222
    monitor-enter v12

    .line 223
    :try_start_0
    iget-object v13, v1, Lorg/eclipse/jetty/servlet/Invoker;->_servletHandler:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 224
    .line 225
    invoke-virtual {v13, v5}, Lorg/eclipse/jetty/servlet/ServletHandler;->getHolderEntry(Ljava/lang/String;)Lorg/eclipse/jetty/http/PathMap$Entry;

    .line 226
    .line 227
    .line 228
    move-result-object v13

    .line 229
    iput-object v13, v1, Lorg/eclipse/jetty/servlet/Invoker;->_invokerEntry:Ljava/util/Map$Entry;

    .line 230
    .line 231
    invoke-static {v5, v6}, Lorg/eclipse/jetty/util/URIUtil;->addPaths(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v13

    .line 235
    iget-object v14, v1, Lorg/eclipse/jetty/servlet/Invoker;->_servletHandler:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 236
    .line 237
    invoke-virtual {v14, v13}, Lorg/eclipse/jetty/servlet/ServletHandler;->getHolderEntry(Ljava/lang/String;)Lorg/eclipse/jetty/http/PathMap$Entry;

    .line 238
    .line 239
    .line 240
    move-result-object v14

    .line 241
    if-eqz v14, :cond_a

    .line 242
    .line 243
    iget-object v15, v1, Lorg/eclipse/jetty/servlet/Invoker;->_invokerEntry:Ljava/util/Map$Entry;

    .line 244
    .line 245
    invoke-interface {v14, v15}, Ljava/util/Map$Entry;->equals(Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    move-result v15

    .line 249
    if-nez v15, :cond_a

    .line 250
    .line 251
    invoke-interface {v14}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    check-cast v0, Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 256
    .line 257
    goto/16 :goto_6

    .line 258
    .line 259
    :catchall_0
    move-exception v0

    .line 260
    goto/16 :goto_a

    .line 261
    .line 262
    :cond_a
    sget-object v14, Lorg/eclipse/jetty/servlet/Invoker;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 263
    .line 264
    invoke-interface {v14}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 265
    .line 266
    .line 267
    move-result v15

    .line 268
    if-eqz v15, :cond_b

    .line 269
    .line 270
    new-instance v15, Ljava/lang/StringBuilder;

    .line 271
    .line 272
    invoke-direct {v15, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    const-string v4, " with path="

    .line 279
    .line 280
    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 284
    .line 285
    .line 286
    const-string v4, "/*"

    .line 287
    .line 288
    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v4

    .line 295
    new-array v15, v8, [Ljava/lang/Object;

    .line 296
    .line 297
    invoke-interface {v14, v4, v15}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 298
    .line 299
    .line 300
    :cond_b
    iget-object v4, v1, Lorg/eclipse/jetty/servlet/Invoker;->_servletHandler:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 301
    .line 302
    new-instance v15, Ljava/lang/StringBuilder;

    .line 303
    .line 304
    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    .line 305
    .line 306
    .line 307
    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 308
    .line 309
    .line 310
    const-string v11, "/*"

    .line 311
    .line 312
    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 313
    .line 314
    .line 315
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v11

    .line 319
    invoke-virtual {v4, v6, v11}, Lorg/eclipse/jetty/servlet/ServletHandler;->addServletWithMapping(Ljava/lang/String;Ljava/lang/String;)Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 320
    .line 321
    .line 322
    move-result-object v4

    .line 323
    iget-object v11, v1, Lorg/eclipse/jetty/servlet/Invoker;->_parameters:Ljava/util/Map;

    .line 324
    .line 325
    if-eqz v11, :cond_c

    .line 326
    .line 327
    invoke-virtual {v4, v11}, Lorg/eclipse/jetty/servlet/Holder;->setInitParameters(Ljava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 328
    .line 329
    .line 330
    :cond_c
    :try_start_1
    invoke-virtual {v4}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->start()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 331
    .line 332
    .line 333
    :try_start_2
    iget-boolean v11, v1, Lorg/eclipse/jetty/servlet/Invoker;->_nonContextServlets:Z

    .line 334
    .line 335
    if-nez v11, :cond_e

    .line 336
    .line 337
    invoke-virtual {v4}, Lorg/eclipse/jetty/servlet/ServletHolder;->getServlet()Ll/yre0;

    .line 338
    .line 339
    .line 340
    move-result-object v11

    .line 341
    iget-object v15, v1, Lorg/eclipse/jetty/servlet/Invoker;->_contextHandler:Lorg/eclipse/jetty/server/handler/ContextHandler;

    .line 342
    .line 343
    invoke-virtual {v15}, Lorg/eclipse/jetty/server/handler/ContextHandler;->getClassLoader()Ljava/lang/ClassLoader;

    .line 344
    .line 345
    .line 346
    move-result-object v15

    .line 347
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 348
    .line 349
    .line 350
    move-result-object v16

    .line 351
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 352
    .line 353
    .line 354
    move-result-object v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 355
    if-ne v15, v8, :cond_d

    .line 356
    .line 357
    goto :goto_5

    .line 358
    :cond_d
    :try_start_3
    invoke-virtual {v4}, Lorg/eclipse/jetty/util/component/AbstractLifeCycle;->stop()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 359
    .line 360
    .line 361
    goto :goto_4

    .line 362
    :catch_0
    move-exception v0

    .line 363
    :try_start_4
    sget-object v1, Lorg/eclipse/jetty/servlet/Invoker;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 364
    .line 365
    invoke-interface {v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->ignore(Ljava/lang/Throwable;)V

    .line 366
    .line 367
    .line 368
    :goto_4
    sget-object v0, Lorg/eclipse/jetty/servlet/Invoker;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 369
    .line 370
    new-instance v1, Ljava/lang/StringBuilder;

    .line 371
    .line 372
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 373
    .line 374
    .line 375
    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 376
    .line 377
    .line 378
    const-string v3, " not loaded from context "

    .line 379
    .line 380
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 381
    .line 382
    .line 383
    invoke-interface {v2}, Ljavax/servlet/http/HttpServletRequest;->getContextPath()Ljava/lang/String;

    .line 384
    .line 385
    .line 386
    move-result-object v2

    .line 387
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 388
    .line 389
    .line 390
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object v1

    .line 394
    const/4 v2, 0x0

    .line 395
    new-array v2, v2, [Ljava/lang/Object;

    .line 396
    .line 397
    invoke-interface {v0, v1, v2}, Lorg/eclipse/jetty/util/log/Logger;->warn(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 398
    .line 399
    .line 400
    new-instance v0, Ljavax/servlet/UnavailableException;

    .line 401
    .line 402
    const-string v1, "Not in context"

    .line 403
    .line 404
    invoke-direct {v0, v1}, Ljavax/servlet/UnavailableException;-><init>(Ljava/lang/String;)V

    .line 405
    .line 406
    .line 407
    throw v0

    .line 408
    :cond_e
    :goto_5
    iget-boolean v3, v1, Lorg/eclipse/jetty/servlet/Invoker;->_verbose:Z

    .line 409
    .line 410
    if-eqz v3, :cond_f

    .line 411
    .line 412
    invoke-interface {v14}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 413
    .line 414
    .line 415
    move-result v3

    .line 416
    if-eqz v3, :cond_f

    .line 417
    .line 418
    new-instance v3, Ljava/lang/StringBuilder;

    .line 419
    .line 420
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 421
    .line 422
    .line 423
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 424
    .line 425
    .line 426
    const-string v0, "\' at "

    .line 427
    .line 428
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 429
    .line 430
    .line 431
    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 432
    .line 433
    .line 434
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 435
    .line 436
    .line 437
    move-result-object v0

    .line 438
    const/4 v3, 0x0

    .line 439
    new-array v8, v3, [Ljava/lang/Object;

    .line 440
    .line 441
    invoke-interface {v14, v0, v8}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 442
    .line 443
    .line 444
    :cond_f
    move-object v0, v4

    .line 445
    :goto_6
    monitor-exit v12
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 446
    move-object v12, v0

    .line 447
    goto/16 :goto_3

    .line 448
    .line 449
    :goto_7
    if-eqz v12, :cond_11

    .line 450
    .line 451
    instance-of v0, v2, Lorg/eclipse/jetty/server/Request;

    .line 452
    .line 453
    if-eqz v0, :cond_10

    .line 454
    .line 455
    move-object v0, v2

    .line 456
    check-cast v0, Lorg/eclipse/jetty/server/Request;

    .line 457
    .line 458
    :goto_8
    move-object v8, v0

    .line 459
    goto :goto_9

    .line 460
    :cond_10
    invoke-static {}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getCurrentConnection()Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 461
    .line 462
    .line 463
    move-result-object v0

    .line 464
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getRequest()Lorg/eclipse/jetty/server/Request;

    .line 465
    .line 466
    .line 467
    move-result-object v0

    .line 468
    goto :goto_8

    .line 469
    :goto_9
    new-instance v0, Lorg/eclipse/jetty/servlet/Invoker$InvokedRequest;

    .line 470
    .line 471
    move v3, v9

    .line 472
    move-object v6, v10

    .line 473
    invoke-direct/range {v0 .. v6}, Lorg/eclipse/jetty/servlet/Invoker$InvokedRequest;-><init>(Lorg/eclipse/jetty/servlet/Invoker;Ljavax/servlet/http/HttpServletRequest;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 474
    .line 475
    .line 476
    invoke-virtual {v12, v8, v0, v7}, Lorg/eclipse/jetty/servlet/ServletHolder;->handle(Lorg/eclipse/jetty/server/Request;Ll/gse0;Ll/lse0;)V

    .line 477
    .line 478
    .line 479
    return-void

    .line 480
    :cond_11
    sget-object v0, Lorg/eclipse/jetty/servlet/Invoker;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 481
    .line 482
    const-string v1, "Can\'t find holder for servlet: "

    .line 483
    .line 484
    invoke-virtual {v1, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 485
    .line 486
    .line 487
    move-result-object v1

    .line 488
    const/4 v2, 0x0

    .line 489
    new-array v2, v2, [Ljava/lang/Object;

    .line 490
    .line 491
    invoke-interface {v0, v1, v2}, Lorg/eclipse/jetty/util/log/Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 492
    .line 493
    .line 494
    const/16 v0, 0x194

    .line 495
    .line 496
    invoke-interface {v7, v0}, Ljavax/servlet/http/HttpServletResponse;->sendError(I)V

    .line 497
    .line 498
    .line 499
    return-void

    .line 500
    :catch_1
    move-exception v0

    .line 501
    :try_start_5
    sget-object v1, Lorg/eclipse/jetty/servlet/Invoker;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 502
    .line 503
    invoke-interface {v1, v0}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/Throwable;)V

    .line 504
    .line 505
    .line 506
    new-instance v1, Ljavax/servlet/UnavailableException;

    .line 507
    .line 508
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 509
    .line 510
    .line 511
    move-result-object v0

    .line 512
    invoke-direct {v1, v0}, Ljavax/servlet/UnavailableException;-><init>(Ljava/lang/String;)V

    .line 513
    .line 514
    .line 515
    throw v1

    .line 516
    :goto_a
    monitor-exit v12
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 517
    throw v0

    .line 518
    :goto_b
    invoke-interface {v7, v0}, Ljavax/servlet/http/HttpServletResponse;->sendError(I)V

    .line 519
    .line 520
    .line 521
    return-void
.end method
