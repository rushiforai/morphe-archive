.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okio/v;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "FrameSink"
.end annotation


# instance fields
.field public a:I

.field public b:J

.field public c:Z

.field public d:Z

.field public final synthetic e:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public close()V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;

    .line 6
    .line 7
    iget v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->a:I

    .line 8
    .line 9
    iget-object v0, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->f:Lcom/tencent/cloud/ai/network/okio/e;

    .line 10
    .line 11
    iget-wide v3, v0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 12
    .line 13
    iget-boolean v5, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->c:Z

    .line 14
    .line 15
    const/4 v6, 0x1

    .line 16
    invoke-virtual/range {v1 .. v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->a(IJZZ)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->d:Z

    .line 21
    .line 22
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->h:Z

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const-string p0, "closed"

    .line 29
    .line 30
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public flush()V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;

    .line 6
    .line 7
    iget v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->a:I

    .line 8
    .line 9
    iget-object v0, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->f:Lcom/tencent/cloud/ai/network/okio/e;

    .line 10
    .line 11
    iget-wide v3, v0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 12
    .line 13
    iget-boolean v5, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->c:Z

    .line 14
    .line 15
    const/4 v6, 0x0

    .line 16
    invoke-virtual/range {v1 .. v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->a(IJZZ)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->c:Z

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const-string p0, "closed"

    .line 24
    .line 25
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public timeout()Lcom/tencent/cloud/ai/network/okio/x;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->c:Lcom/tencent/cloud/ai/network/okio/f;

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/v;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public write(Lcom/tencent/cloud/ai/network/okio/e;J)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->f:Lcom/tencent/cloud/ai/network/okio/e;

    .line 8
    .line 9
    invoke-virtual {v0, p1, p2, p3}, Lcom/tencent/cloud/ai/network/okio/e;->write(Lcom/tencent/cloud/ai/network/okio/e;J)V

    .line 10
    .line 11
    .line 12
    iget-boolean p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->c:Z

    .line 13
    .line 14
    const/4 p2, 0x0

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->b:J

    .line 18
    .line 19
    const-wide/16 v2, -0x1

    .line 20
    .line 21
    cmp-long p1, v0, v2

    .line 22
    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->f:Lcom/tencent/cloud/ai/network/okio/e;

    .line 28
    .line 29
    iget-wide v2, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 30
    .line 31
    const-wide/16 v4, 0x2000

    .line 32
    .line 33
    sub-long/2addr v0, v4

    .line 34
    cmp-long p1, v2, v0

    .line 35
    .line 36
    if-lez p1, :cond_0

    .line 37
    .line 38
    const/4 p1, 0x1

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    move p1, p2

    .line 41
    :goto_0
    iget-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;

    .line 42
    .line 43
    iget-object p3, p3, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->f:Lcom/tencent/cloud/ai/network/okio/e;

    .line 44
    .line 45
    invoke-virtual {p3}, Lcom/tencent/cloud/ai/network/okio/e;->l()J

    .line 46
    .line 47
    .line 48
    move-result-wide v2

    .line 49
    const-wide/16 v0, 0x0

    .line 50
    .line 51
    cmp-long p3, v2, v0

    .line 52
    .line 53
    if-lez p3, :cond_1

    .line 54
    .line 55
    if-nez p1, :cond_1

    .line 56
    .line 57
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;

    .line 58
    .line 59
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->a:I

    .line 60
    .line 61
    iget-boolean v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->c:Z

    .line 62
    .line 63
    const/4 v5, 0x0

    .line 64
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->a(IJZZ)V

    .line 65
    .line 66
    .line 67
    iput-boolean p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->c:Z

    .line 68
    .line 69
    :cond_1
    return-void

    .line 70
    :cond_2
    const-string p0, "closed"

    .line 71
    .line 72
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method
