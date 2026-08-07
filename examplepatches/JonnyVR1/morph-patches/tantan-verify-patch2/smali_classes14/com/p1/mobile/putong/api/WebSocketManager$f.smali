.class public Lcom/p1/mobile/putong/api/WebSocketManager$f;
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
    name = "f"
.end annotation


# instance fields
.field public a:Lokio/ByteString;

.field public b:I

.field public c:I

.field public final synthetic d:Lcom/p1/mobile/putong/api/WebSocketManager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/api/WebSocketManager;Lokio/ByteString;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$f;->d:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$f;->b:I

    .line 8
    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/api/WebSocketManager$f;->a:Lokio/ByteString;

    .line 10
    .line 11
    iput p3, p0, Lcom/p1/mobile/putong/api/WebSocketManager$f;->c:I

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$f;->d:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->S()Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->FORBIDDEN:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 8
    .line 9
    if-eq v0, v1, :cond_2

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;->CLOSE:Lcom/p1/mobile/putong/api/WebSocketManager$STATUS;

    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$f;->b:I

    .line 17
    .line 18
    add-int/lit8 v1, v0, 0x1

    .line 19
    .line 20
    iput v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$f;->b:I

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$f;->c:I

    .line 23
    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/api/WebSocketManager$f;->d:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 25
    .line 26
    if-ge v0, v1, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$f;->a:Lokio/ByteString;

    .line 29
    .line 30
    invoke-static {v2, v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->x(Lcom/p1/mobile/putong/api/WebSocketManager;Lokio/ByteString;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$f;->d:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/p1/mobile/putong/api/WebSocketManager;->m(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$f;->d:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 40
    .line 41
    invoke-static {v1}, Lcom/p1/mobile/putong/api/WebSocketManager;->i(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/putong/data/Connector;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Connector;->config:Lcom/p1/mobile/putong/data/ConnectorConfig;

    .line 46
    .line 47
    iget v1, v1, Lcom/p1/mobile/putong/data/ConnectorConfig;->keepalive_timeout:I

    .line 48
    .line 49
    int-to-long v1, v1

    .line 50
    const-wide/16 v3, 0x3e8

    .line 51
    .line 52
    mul-long/2addr v1, v3

    .line 53
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    invoke-static {v2}, Lcom/p1/mobile/putong/api/WebSocketManager;->k(Lcom/p1/mobile/putong/api/WebSocketManager;)Ll/isp0;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    new-instance v0, Ljava/lang/Exception;

    .line 62
    .line 63
    const-string v1, "retry send msg failed"

    .line 64
    .line 65
    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    const/4 v1, 0x0

    .line 69
    invoke-interface {p0, v0, v1}, Ll/isp0;->f(Ljava/lang/Exception;Ll/i5d0;)V

    .line 70
    .line 71
    .line 72
    :cond_2
    :goto_0
    return-void
.end method
