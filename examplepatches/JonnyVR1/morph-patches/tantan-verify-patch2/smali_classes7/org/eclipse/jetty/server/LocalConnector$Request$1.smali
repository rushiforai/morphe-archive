.class Lorg/eclipse/jetty/server/LocalConnector$Request$1;
.super Lorg/eclipse/jetty/io/ByteArrayEndPoint;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/server/LocalConnector$Request;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/eclipse/jetty/server/LocalConnector$Request;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/LocalConnector$Request;[BI)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/LocalConnector$Request$1;->this$1:Lorg/eclipse/jetty/server/LocalConnector$Request;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Lorg/eclipse/jetty/io/ByteArrayEndPoint;-><init>([BI)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public setConnection(Lorg/eclipse/jetty/io/Connection;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->getConnection()Lorg/eclipse/jetty/io/Connection;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->getConnection()Lorg/eclipse/jetty/io/Connection;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eq p1, v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lorg/eclipse/jetty/server/LocalConnector$Request$1;->this$1:Lorg/eclipse/jetty/server/LocalConnector$Request;

    .line 14
    .line 15
    iget-object v0, v0, Lorg/eclipse/jetty/server/LocalConnector$Request;->this$0:Lorg/eclipse/jetty/server/LocalConnector;

    .line 16
    .line 17
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->getConnection()Lorg/eclipse/jetty/io/Connection;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1, p1}, Lorg/eclipse/jetty/server/AbstractConnector;->connectionUpgraded(Lorg/eclipse/jetty/io/Connection;Lorg/eclipse/jetty/io/Connection;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    invoke-super {p0, p1}, Lorg/eclipse/jetty/io/ByteArrayEndPoint;->setConnection(Lorg/eclipse/jetty/io/Connection;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
