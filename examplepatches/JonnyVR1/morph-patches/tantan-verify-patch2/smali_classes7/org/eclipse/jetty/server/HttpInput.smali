.class public Lorg/eclipse/jetty/server/HttpInput;
.super Ll/dse0;
.source "SourceFile"


# instance fields
.field protected final _connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

.field protected final _parser:Lorg/eclipse/jetty/http/HttpParser;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/AbstractHttpConnection;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/dse0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/server/HttpInput;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 5
    .line 6
    invoke-virtual {p1}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getParser()Lorg/eclipse/jetty/http/Parser;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lorg/eclipse/jetty/http/HttpParser;

    .line 11
    .line 12
    iput-object p1, p0, Lorg/eclipse/jetty/server/HttpInput;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public available()I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/HttpInput;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/http/HttpParser;->available()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 39
    new-array v1, v0, [B

    const/4 v2, 0x0

    .line 40
    invoke-virtual {p0, v1, v2, v0}, Lorg/eclipse/jetty/server/HttpInput;->read([BII)I

    move-result p0

    if-gez p0, :cond_0

    const/4 p0, -0x1

    return p0

    .line 41
    :cond_0
    aget-byte p0, v1, v2

    and-int/lit16 p0, p0, 0xff

    return p0
.end method

.method public read([BII)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/server/HttpInput;->_parser:Lorg/eclipse/jetty/http/HttpParser;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/server/HttpInput;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 4
    .line 5
    invoke-virtual {v1}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->getMaxIdleTime()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-long v1, v1

    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jetty/http/HttpParser;->blockForContent(J)Lorg/eclipse/jetty/io/Buffer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-interface {v0, p1, p2, p3}, Lorg/eclipse/jetty/io/Buffer;->get([BII)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_0
    iget-object p0, p0, Lorg/eclipse/jetty/server/HttpInput;->_connection:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 22
    .line 23
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->isEarlyEOF()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_1

    .line 28
    .line 29
    const/4 p0, -0x1

    .line 30
    return p0

    .line 31
    :cond_1
    new-instance p0, Lorg/eclipse/jetty/io/EofException;

    .line 32
    .line 33
    const-string p1, "early EOF"

    .line 34
    .line 35
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/io/EofException;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    throw p0
.end method
