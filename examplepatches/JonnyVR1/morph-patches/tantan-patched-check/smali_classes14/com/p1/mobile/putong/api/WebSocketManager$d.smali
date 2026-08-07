.class public Lcom/p1/mobile/putong/api/WebSocketManager$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/api/WebSocketManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/WebSocketManager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/api/WebSocketManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$d;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/WebSocketManager;Ll/zsp0;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/api/WebSocketManager$d;-><init>(Lcom/p1/mobile/putong/api/WebSocketManager;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$d;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->S()Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->CONNECTED:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 8
    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$d;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/api/WebSocketManager;->B(Lcom/p1/mobile/putong/api/WebSocketManager;Lokio/ByteString;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$d;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->i(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/putong/data/Connector;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Connector;->config:Lcom/p1/mobile/putong/data/ConnectorConfig;

    .line 28
    .line 29
    iget v1, v1, Lcom/p1/mobile/putong/data/ConnectorConfig;->keepalive_tries:I

    .line 30
    .line 31
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/api/WebSocketManager;->E(Lcom/p1/mobile/putong/api/WebSocketManager;I)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$d;->a:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 35
    .line 36
    invoke-static {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->F(Lcom/p1/mobile/putong/api/WebSocketManager;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    return-void
.end method
