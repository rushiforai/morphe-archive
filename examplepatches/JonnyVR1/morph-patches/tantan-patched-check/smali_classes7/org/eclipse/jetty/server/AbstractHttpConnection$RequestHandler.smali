.class Lorg/eclipse/jetty/server/AbstractHttpConnection$RequestHandler;
.super Lorg/eclipse/jetty/http/HttpParser$EventHandler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/server/AbstractHttpConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RequestHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/server/AbstractHttpConnection;


# direct methods
.method private constructor <init>(Lorg/eclipse/jetty/server/AbstractHttpConnection;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection$RequestHandler;->this$0:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/eclipse/jetty/http/HttpParser$EventHandler;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lorg/eclipse/jetty/server/AbstractHttpConnection;Lorg/eclipse/jetty/server/AbstractHttpConnection$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lorg/eclipse/jetty/server/AbstractHttpConnection$RequestHandler;-><init>(Lorg/eclipse/jetty/server/AbstractHttpConnection;)V

    return-void
.end method


# virtual methods
.method public content(Lorg/eclipse/jetty/io/Buffer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection$RequestHandler;->this$0:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->content(Lorg/eclipse/jetty/io/Buffer;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public earlyEOF()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection$RequestHandler;->this$0:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->earlyEOF()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public headerComplete()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection$RequestHandler;->this$0:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->headerComplete()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public messageComplete(J)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection$RequestHandler;->this$0:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->messageComplete(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public parsedHeader(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection$RequestHandler;->this$0:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->parsedHeader(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public startRequest(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/AbstractHttpConnection$RequestHandler;->this$0:Lorg/eclipse/jetty/server/AbstractHttpConnection;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->startRequest(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public startResponse(Lorg/eclipse/jetty/io/Buffer;ILorg/eclipse/jetty/io/Buffer;)V
    .locals 2

    .line 1
    invoke-static {}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lorg/eclipse/jetty/util/log/Logger;->isDebugEnabled()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lorg/eclipse/jetty/server/AbstractHttpConnection;->access$100()Lorg/eclipse/jetty/util/log/Logger;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string v1, "Bad request!: "

    .line 18
    .line 19
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p1, " "

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const/4 p2, 0x0

    .line 44
    new-array p2, p2, [Ljava/lang/Object;

    .line 45
    .line 46
    invoke-interface {p0, p1, p2}, Lorg/eclipse/jetty/util/log/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method
