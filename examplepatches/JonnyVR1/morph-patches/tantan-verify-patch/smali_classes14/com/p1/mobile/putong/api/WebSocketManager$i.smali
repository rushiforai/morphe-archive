.class public Lcom/p1/mobile/putong/api/WebSocketManager$i;
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
    name = "i"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:Z

.field public final synthetic d:Lcom/p1/mobile/putong/api/WebSocketManager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/api/WebSocketManager;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$i;->d:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$i;->a:I

    .line 8
    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$i;->c:Z

    .line 10
    .line 11
    iput p2, p0, Lcom/p1/mobile/putong/api/WebSocketManager$i;->b:I

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$i;->d:Lcom/p1/mobile/putong/api/WebSocketManager;

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
    return-void

    .line 12
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$i;->c:Z

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    if-nez v0, :cond_3

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    move v2, v0

    .line 19
    :goto_0
    iget v3, p0, Lcom/p1/mobile/putong/api/WebSocketManager$i;->a:I

    .line 20
    .line 21
    add-int/lit8 v4, v3, 0x1

    .line 22
    .line 23
    iput v4, p0, Lcom/p1/mobile/putong/api/WebSocketManager$i;->a:I

    .line 24
    .line 25
    iget v4, p0, Lcom/p1/mobile/putong/api/WebSocketManager$i;->b:I

    .line 26
    .line 27
    if-ge v3, v4, :cond_1

    .line 28
    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/api/WebSocketManager$i;->d:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 32
    .line 33
    invoke-static {v2, v1}, Lcom/p1/mobile/putong/api/WebSocketManager;->B(Lcom/p1/mobile/putong/api/WebSocketManager;Lokio/ByteString;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    if-eqz v2, :cond_2

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/api/WebSocketManager$i;->d:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 41
    .line 42
    invoke-static {v1}, Lcom/p1/mobile/putong/api/WebSocketManager;->m(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/putong/api/WebSocketManager$g;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iget-object v2, p0, Lcom/p1/mobile/putong/api/WebSocketManager$i;->d:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 47
    .line 48
    invoke-static {v2}, Lcom/p1/mobile/putong/api/WebSocketManager;->i(Lcom/p1/mobile/putong/api/WebSocketManager;)Lcom/p1/mobile/putong/data/Connector;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Connector;->config:Lcom/p1/mobile/putong/data/ConnectorConfig;

    .line 53
    .line 54
    iget v2, v2, Lcom/p1/mobile/putong/data/ConnectorConfig;->keepalive_timeout:I

    .line 55
    .line 56
    int-to-long v2, v2

    .line 57
    const-wide/16 v4, 0x3e8

    .line 58
    .line 59
    mul-long/2addr v2, v4

    .line 60
    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 61
    .line 62
    .line 63
    :cond_2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$i;->c:Z

    .line 64
    .line 65
    return-void

    .line 66
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/api/WebSocketManager$i;->d:Lcom/p1/mobile/putong/api/WebSocketManager;

    .line 67
    .line 68
    invoke-static {p0}, Lcom/p1/mobile/putong/api/WebSocketManager;->k(Lcom/p1/mobile/putong/api/WebSocketManager;)Ll/isp0;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    new-instance v0, Ljava/lang/Exception;

    .line 73
    .line 74
    const-string v2, "send probe ping failed"

    .line 75
    .line 76
    invoke-direct {v0, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-interface {p0, v0, v1}, Ll/isp0;->f(Ljava/lang/Exception;Ll/i5d0;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method
