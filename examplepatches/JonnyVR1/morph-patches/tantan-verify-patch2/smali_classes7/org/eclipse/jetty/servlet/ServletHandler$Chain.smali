.class Lorg/eclipse/jetty/servlet/ServletHandler$Chain;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/nli;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/servlet/ServletHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Chain"
.end annotation


# instance fields
.field final _baseRequest:Lorg/eclipse/jetty/server/Request;

.field final _chain:Ljava/lang/Object;

.field _filter:I

.field final _servletHolder:Lorg/eclipse/jetty/servlet/ServletHolder;

.field final synthetic this$0:Lorg/eclipse/jetty/servlet/ServletHandler;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/servlet/ServletHandler;Lorg/eclipse/jetty/server/Request;Ljava/lang/Object;Lorg/eclipse/jetty/servlet/ServletHolder;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->this$0:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->_filter:I

    .line 8
    .line 9
    iput-object p2, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->_baseRequest:Lorg/eclipse/jetty/server/Request;

    .line 10
    .line 11
    iput-object p3, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->_chain:Ljava/lang/Object;

    .line 12
    .line 13
    iput-object p4, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->_servletHolder:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public doFilter(Ll/gse0;Ll/lse0;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .line 1
    invoke-static {}, Lorg/eclipse/jetty/servlet/ServletHandler;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Lorg/eclipse/jetty/servlet/ServletHandler;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v2, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v3, "doFilter "

    .line 19
    .line 20
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget v3, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->_filter:I

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    new-array v3, v1, [Ljava/lang/Object;

    .line 33
    .line 34
    invoke-interface {v0, v2, v3}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget v0, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->_filter:I

    .line 38
    .line 39
    iget-object v2, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->_chain:Ljava/lang/Object;

    .line 40
    .line 41
    invoke-static {v2}, Lorg/eclipse/jetty/util/LazyList;->size(Ljava/lang/Object;)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-ge v0, v2, :cond_4

    .line 46
    .line 47
    iget-object v0, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->_chain:Ljava/lang/Object;

    .line 48
    .line 49
    iget v2, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->_filter:I

    .line 50
    .line 51
    add-int/lit8 v3, v2, 0x1

    .line 52
    .line 53
    iput v3, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->_filter:I

    .line 54
    .line 55
    invoke-static {v0, v2}, Lorg/eclipse/jetty/util/LazyList;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lorg/eclipse/jetty/servlet/FilterHolder;

    .line 60
    .line 61
    invoke-static {}, Lorg/eclipse/jetty/servlet/ServletHandler;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-interface {v2}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_1

    .line 70
    .line 71
    invoke-static {}, Lorg/eclipse/jetty/servlet/ServletHandler;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    new-instance v3, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    const-string v4, "call filter "

    .line 78
    .line 79
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    new-array v4, v1, [Ljava/lang/Object;

    .line 90
    .line 91
    invoke-interface {v2, v3, v4}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    :cond_1
    invoke-virtual {v0}, Lorg/eclipse/jetty/servlet/FilterHolder;->getFilter()Ll/gli;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v0}, Lorg/eclipse/jetty/servlet/Holder;->isAsyncSupported()Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-nez v0, :cond_3

    .line 103
    .line 104
    iget-object v0, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->_baseRequest:Lorg/eclipse/jetty/server/Request;

    .line 105
    .line 106
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->isAsyncSupported()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-nez v0, :cond_2

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_2
    const/4 v0, 0x1

    .line 114
    :try_start_0
    iget-object v3, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->_baseRequest:Lorg/eclipse/jetty/server/Request;

    .line 115
    .line 116
    invoke-virtual {v3, v1}, Lorg/eclipse/jetty/server/Request;->setAsyncSupported(Z)V

    .line 117
    .line 118
    .line 119
    invoke-interface {v2, p1, p2, p0}, Ll/gli;->doFilter(Ll/gse0;Ll/lse0;Ll/nli;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 120
    .line 121
    .line 122
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->_baseRequest:Lorg/eclipse/jetty/server/Request;

    .line 123
    .line 124
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/server/Request;->setAsyncSupported(Z)V

    .line 125
    .line 126
    .line 127
    return-void

    .line 128
    :catchall_0
    move-exception p1

    .line 129
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->_baseRequest:Lorg/eclipse/jetty/server/Request;

    .line 130
    .line 131
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/server/Request;->setAsyncSupported(Z)V

    .line 132
    .line 133
    .line 134
    throw p1

    .line 135
    :cond_3
    :goto_0
    invoke-interface {v2, p1, p2, p0}, Ll/gli;->doFilter(Ll/gse0;Ll/lse0;Ll/nli;)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_4
    move-object v0, p1

    .line 140
    check-cast v0, Ljavax/servlet/http/HttpServletRequest;

    .line 141
    .line 142
    iget-object v2, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->_servletHolder:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 143
    .line 144
    if-eqz v2, :cond_6

    .line 145
    .line 146
    invoke-static {}, Lorg/eclipse/jetty/servlet/ServletHandler;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-interface {v0}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-eqz v0, :cond_5

    .line 155
    .line 156
    invoke-static {}, Lorg/eclipse/jetty/servlet/ServletHandler;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    new-instance v2, Ljava/lang/StringBuilder;

    .line 161
    .line 162
    const-string v3, "call servlet "

    .line 163
    .line 164
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    iget-object v3, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->_servletHolder:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 168
    .line 169
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    new-array v1, v1, [Ljava/lang/Object;

    .line 177
    .line 178
    invoke-interface {v0, v2, v1}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 179
    .line 180
    .line 181
    :cond_5
    iget-object v0, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->_servletHolder:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 182
    .line 183
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->_baseRequest:Lorg/eclipse/jetty/server/Request;

    .line 184
    .line 185
    invoke-virtual {v0, p0, p1, p2}, Lorg/eclipse/jetty/servlet/ServletHolder;->handle(Lorg/eclipse/jetty/server/Request;Ll/gse0;Ll/lse0;)V

    .line 186
    .line 187
    .line 188
    return-void

    .line 189
    :cond_6
    iget-object v1, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->this$0:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 190
    .line 191
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/handler/HandlerWrapper;->getHandler()Lorg/eclipse/jetty/server/Handler;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    if-nez v1, :cond_7

    .line 196
    .line 197
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->this$0:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 198
    .line 199
    check-cast p2, Ljavax/servlet/http/HttpServletResponse;

    .line 200
    .line 201
    invoke-virtual {p0, v0, p2}, Lorg/eclipse/jetty/servlet/ServletHandler;->notFound(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

    .line 202
    .line 203
    .line 204
    return-void

    .line 205
    :cond_7
    instance-of v1, p1, Lorg/eclipse/jetty/server/Request;

    .line 206
    .line 207
    if-eqz v1, :cond_8

    .line 208
    .line 209
    check-cast p1, Lorg/eclipse/jetty/server/Request;

    .line 210
    .line 211
    goto :goto_1

    .line 212
    :cond_8
    invoke-static {}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getCurrentConnection()Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    invoke-virtual {p1}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getRequest()Lorg/eclipse/jetty/server/Request;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    :goto_1
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->this$0:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 221
    .line 222
    invoke-interface {v0}, Ljavax/servlet/http/HttpServletRequest;->getServletPath()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    invoke-interface {v0}, Ljavax/servlet/http/HttpServletRequest;->getPathInfo()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v2

    .line 230
    invoke-static {v1, v2}, Lorg/eclipse/jetty/util/URIUtil;->addPaths(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    check-cast p2, Ljavax/servlet/http/HttpServletResponse;

    .line 235
    .line 236
    invoke-virtual {p0, v1, p1, v0, p2}, Lorg/eclipse/jetty/server/handler/ScopedHandler;->nextHandle(Ljava/lang/String;Lorg/eclipse/jetty/server/Request;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

    .line 237
    .line 238
    .line 239
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->_chain:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-static {v2}, Lorg/eclipse/jetty/util/LazyList;->size(Ljava/lang/Object;)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-ge v1, v2, :cond_0

    .line 14
    .line 15
    iget-object v2, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->_chain:Ljava/lang/Object;

    .line 16
    .line 17
    invoke-static {v2, v1}, Lorg/eclipse/jetty/util/LazyList;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v2, "->"

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    add-int/lit8 v1, v1, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ServletHandler$Chain;->_servletHolder:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method
