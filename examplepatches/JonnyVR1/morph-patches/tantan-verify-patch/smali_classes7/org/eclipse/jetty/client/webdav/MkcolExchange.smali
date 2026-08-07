.class public Lorg/eclipse/jetty/client/webdav/MkcolExchange;
.super Lorg/eclipse/jetty/client/CachedExchange;
.source "SourceFile"


# static fields
.field private static final LOG:Lorg/eclipse/jetty/util/log/Logger;


# instance fields
.field exists:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/client/webdav/MkcolExchange;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/eclipse/jetty/util/log/Log;->getLogger(Ljava/lang/Class;)Lorg/eclipse/jetty/util/log/Logger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/eclipse/jetty/client/webdav/MkcolExchange;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lorg/eclipse/jetty/client/CachedExchange;-><init>(Z)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lorg/eclipse/jetty/client/webdav/MkcolExchange;->exists:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public exists()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/eclipse/jetty/client/webdav/MkcolExchange;->exists:Z

    .line 2
    .line 3
    return p0
.end method

.method public onResponseStatus(Lorg/eclipse/jetty/io/Buffer;ILorg/eclipse/jetty/io/Buffer;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/16 v0, 0xc9

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-ne p2, v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lorg/eclipse/jetty/client/webdav/MkcolExchange;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 8
    .line 9
    const-string v3, "MkcolExchange:Status: Successfully created resource"

    .line 10
    .line 11
    new-array v4, v2, [Ljava/lang/Object;

    .line 12
    .line 13
    invoke-interface {v0, v3, v4}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iput-boolean v1, p0, Lorg/eclipse/jetty/client/webdav/MkcolExchange;->exists:Z

    .line 17
    .line 18
    :cond_0
    const/16 v0, 0x195

    .line 19
    .line 20
    if-ne p2, v0, :cond_1

    .line 21
    .line 22
    sget-object v0, Lorg/eclipse/jetty/client/webdav/MkcolExchange;->LOG:Lorg/eclipse/jetty/util/log/Logger;

    .line 23
    .line 24
    const-string v3, "MkcolExchange:Status: Resource must exist"

    .line 25
    .line 26
    new-array v2, v2, [Ljava/lang/Object;

    .line 27
    .line 28
    invoke-interface {v0, v3, v2}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iput-boolean v1, p0, Lorg/eclipse/jetty/client/webdav/MkcolExchange;->exists:Z

    .line 32
    .line 33
    :cond_1
    invoke-super {p0, p1, p2, p3}, Lorg/eclipse/jetty/client/CachedExchange;->onResponseStatus(Lorg/eclipse/jetty/io/Buffer;ILorg/eclipse/jetty/io/Buffer;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
