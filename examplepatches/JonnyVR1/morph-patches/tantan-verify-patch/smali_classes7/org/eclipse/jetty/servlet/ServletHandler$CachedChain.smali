.class Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;
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
    name = "CachedChain"
.end annotation


# instance fields
.field _filterHolder:Lorg/eclipse/jetty/servlet/FilterHolder;

.field _next:Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;

.field _servletHolder:Lorg/eclipse/jetty/servlet/ServletHolder;

.field final synthetic this$0:Lorg/eclipse/jetty/servlet/ServletHandler;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/servlet/ServletHandler;Ljava/lang/Object;Lorg/eclipse/jetty/servlet/ServletHolder;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;->this$0:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Lorg/eclipse/jetty/util/LazyList;->size(Ljava/lang/Object;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {p2, v0}, Lorg/eclipse/jetty/util/LazyList;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lorg/eclipse/jetty/servlet/FilterHolder;

    .line 18
    .line 19
    iput-object v1, p0, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;->_filterHolder:Lorg/eclipse/jetty/servlet/FilterHolder;

    .line 20
    .line 21
    invoke-static {p2, v0}, Lorg/eclipse/jetty/util/LazyList;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    new-instance v0, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;

    .line 26
    .line 27
    invoke-direct {v0, p1, p2, p3}, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;-><init>(Lorg/eclipse/jetty/servlet/ServletHandler;Ljava/lang/Object;Lorg/eclipse/jetty/servlet/ServletHolder;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;->_next:Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;

    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iput-object p3, p0, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;->_servletHolder:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 34
    .line 35
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
    iget-object v1, p0, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;->_filterHolder:Lorg/eclipse/jetty/servlet/FilterHolder;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    if-eqz v1, :cond_4

    .line 21
    .line 22
    invoke-static {}, Lorg/eclipse/jetty/servlet/ServletHandler;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-interface {v1}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    invoke-static {}, Lorg/eclipse/jetty/servlet/ServletHandler;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    new-instance v3, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v4, "call filter "

    .line 39
    .line 40
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object v4, p0, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;->_filterHolder:Lorg/eclipse/jetty/servlet/FilterHolder;

    .line 44
    .line 45
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    new-array v4, v2, [Ljava/lang/Object;

    .line 53
    .line 54
    invoke-interface {v1, v3, v4}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;->_filterHolder:Lorg/eclipse/jetty/servlet/FilterHolder;

    .line 58
    .line 59
    invoke-virtual {v1}, Lorg/eclipse/jetty/servlet/FilterHolder;->getFilter()Ll/gli;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iget-object v3, p0, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;->_filterHolder:Lorg/eclipse/jetty/servlet/FilterHolder;

    .line 64
    .line 65
    invoke-virtual {v3}, Lorg/eclipse/jetty/servlet/Holder;->isAsyncSupported()Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-eqz v3, :cond_2

    .line 70
    .line 71
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;->_next:Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;

    .line 72
    .line 73
    invoke-interface {v1, p1, p2, p0}, Ll/gli;->doFilter(Ll/gse0;Ll/lse0;Ll/nli;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_2
    invoke-virtual {v0}, Lorg/eclipse/jetty/server/Request;->isAsyncSupported()Z

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    if-eqz v3, :cond_3

    .line 82
    .line 83
    const/4 v3, 0x1

    .line 84
    :try_start_0
    invoke-virtual {v0, v2}, Lorg/eclipse/jetty/server/Request;->setAsyncSupported(Z)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;->_next:Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;

    .line 88
    .line 89
    invoke-interface {v1, p1, p2, p0}, Ll/gli;->doFilter(Ll/gse0;Ll/lse0;Ll/nli;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v3}, Lorg/eclipse/jetty/server/Request;->setAsyncSupported(Z)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :catchall_0
    move-exception p0

    .line 97
    invoke-virtual {v0, v3}, Lorg/eclipse/jetty/server/Request;->setAsyncSupported(Z)V

    .line 98
    .line 99
    .line 100
    throw p0

    .line 101
    :cond_3
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;->_next:Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;

    .line 102
    .line 103
    invoke-interface {v1, p1, p2, p0}, Ll/gli;->doFilter(Ll/gse0;Ll/lse0;Ll/nli;)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_4
    move-object v1, p1

    .line 108
    check-cast v1, Ljavax/servlet/http/HttpServletRequest;

    .line 109
    .line 110
    iget-object v3, p0, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;->_servletHolder:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 111
    .line 112
    if-eqz v3, :cond_6

    .line 113
    .line 114
    invoke-static {}, Lorg/eclipse/jetty/servlet/ServletHandler;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-interface {v1}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-eqz v1, :cond_5

    .line 123
    .line 124
    invoke-static {}, Lorg/eclipse/jetty/servlet/ServletHandler;->access$000()Lorg/eclipse/jetty/util/log/Logger;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    new-instance v3, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    const-string v4, "call servlet "

    .line 131
    .line 132
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    iget-object v4, p0, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;->_servletHolder:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 136
    .line 137
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    new-array v2, v2, [Ljava/lang/Object;

    .line 145
    .line 146
    invoke-interface {v1, v3, v2}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 147
    .line 148
    .line 149
    :cond_5
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;->_servletHolder:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 150
    .line 151
    invoke-virtual {p0, v0, p1, p2}, Lorg/eclipse/jetty/servlet/ServletHolder;->handle(Lorg/eclipse/jetty/server/Request;Ll/gse0;Ll/lse0;)V

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_6
    iget-object p1, p0, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;->this$0:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 156
    .line 157
    invoke-virtual {p1}, Lorg/eclipse/jetty/server/handler/HandlerWrapper;->getHandler()Lorg/eclipse/jetty/server/Handler;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;->this$0:Lorg/eclipse/jetty/servlet/ServletHandler;

    .line 162
    .line 163
    if-nez p1, :cond_7

    .line 164
    .line 165
    check-cast p2, Ljavax/servlet/http/HttpServletResponse;

    .line 166
    .line 167
    invoke-virtual {p0, v1, p2}, Lorg/eclipse/jetty/servlet/ServletHandler;->notFound(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :cond_7
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getServletPath()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    invoke-interface {v1}, Ljavax/servlet/http/HttpServletRequest;->getPathInfo()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    invoke-static {p1, v2}, Lorg/eclipse/jetty/util/URIUtil;->addPaths(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    check-cast p2, Ljavax/servlet/http/HttpServletResponse;

    .line 184
    .line 185
    invoke-virtual {p0, p1, v0, v1, p2}, Lorg/eclipse/jetty/server/handler/ScopedHandler;->nextHandle(Ljava/lang/String;Lorg/eclipse/jetty/server/Request;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

    .line 186
    .line 187
    .line 188
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;->_filterHolder:Lorg/eclipse/jetty/servlet/FilterHolder;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;->_filterHolder:Lorg/eclipse/jetty/servlet/FilterHolder;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "->"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;->_next:Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;

    .line 21
    .line 22
    invoke-virtual {p0}, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/servlet/ServletHandler$CachedChain;->_servletHolder:Lorg/eclipse/jetty/servlet/ServletHolder;

    .line 35
    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Lorg/eclipse/jetty/servlet/Holder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :cond_1
    const-string p0, "null"

    .line 44
    .line 45
    return-object p0
.end method
