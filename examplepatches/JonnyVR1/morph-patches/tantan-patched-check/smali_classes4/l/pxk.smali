.class public Ll/pxk;
.super Landroid/os/Handler;
.source "SourceFile"

# interfaces
.implements Ll/dm80;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/os/Handler;",
        "Ll/dm80<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final a:Ll/dr60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dr60<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final b:I

.field private final c:Ll/v3f$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/v3f$b<",
            "TT;*>;"
        }
    .end annotation
.end field

.field private d:Z


# direct methods
.method public constructor <init>(Ll/v3f$b;Landroid/os/Looper;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v3f$b<",
            "TT;*>;",
            "Landroid/os/Looper;",
            "I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pxk;->c:Ll/v3f$b;

    .line 5
    .line 6
    iput p3, p0, Ll/pxk;->b:I

    .line 7
    .line 8
    new-instance p1, Ll/dr60;

    .line 9
    .line 10
    invoke-direct {p1}, Ll/dr60;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/pxk;->a:Ll/dr60;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(Ll/jcg0;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jcg0<",
            "TT;>;TT;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/cr60;

    .line 2
    .line 3
    invoke-direct {v0, p2, p1}, Ll/cr60;-><init>(Ljava/lang/Object;Ll/jcg0;)V

    .line 4
    .line 5
    .line 6
    monitor-enter p0

    .line 7
    :try_start_0
    iget-object p1, p0, Ll/pxk;->a:Ll/dr60;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ll/dr60;->a(Ll/cr60;)V

    .line 10
    .line 11
    .line 12
    iget-boolean p1, p0, Ll/pxk;->d:Z

    .line 13
    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    iput-boolean p1, p0, Ll/pxk;->d:Z

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    new-instance p1, Lcom/tantan/eventbus/EventBusException;

    .line 31
    .line 32
    const-string p2, "Could not send handler message"

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/tantan/eventbus/EventBusException;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    throw p1

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    :goto_0
    monitor-exit p0

    .line 41
    return-void

    .line 42
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    throw p1
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 6

    .line 1
    const/4 p1, 0x0

    .line 2
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 3
    .line 4
    .line 5
    move-result-wide v0

    .line 6
    :cond_0
    iget-object v2, p0, Ll/pxk;->a:Ll/dr60;

    .line 7
    .line 8
    invoke-virtual {v2}, Ll/dr60;->b()Ll/cr60;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    if-nez v2, :cond_2

    .line 13
    .line 14
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 15
    :try_start_1
    iget-object v2, p0, Ll/pxk;->a:Ll/dr60;

    .line 16
    .line 17
    invoke-virtual {v2}, Ll/dr60;->b()Ll/cr60;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    if-nez v2, :cond_1

    .line 22
    .line 23
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    iput-boolean p1, p0, Ll/pxk;->d:Z

    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    :try_start_2
    monitor-exit p0

    .line 30
    goto :goto_1

    .line 31
    :goto_0
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 32
    :try_start_3
    throw v0

    .line 33
    :catchall_1
    move-exception v0

    .line 34
    goto :goto_2

    .line 35
    :cond_2
    :goto_1
    iget-object v3, p0, Ll/pxk;->c:Ll/v3f$b;

    .line 36
    .line 37
    invoke-virtual {v3, v2}, Ll/v3f$b;->e(Ll/cr60;)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 41
    .line 42
    .line 43
    move-result-wide v2

    .line 44
    sub-long/2addr v2, v0

    .line 45
    iget v4, p0, Ll/pxk;->b:I

    .line 46
    .line 47
    int-to-long v4, v4

    .line 48
    cmp-long v2, v2, v4

    .line 49
    .line 50
    if-ltz v2, :cond_0

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 57
    .line 58
    .line 59
    move-result v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    const/4 p1, 0x1

    .line 63
    iput-boolean p1, p0, Ll/pxk;->d:Z

    .line 64
    .line 65
    return-void

    .line 66
    :cond_3
    :try_start_4
    new-instance v0, Lcom/tantan/eventbus/EventBusException;

    .line 67
    .line 68
    const-string v1, "Could not send handler message"

    .line 69
    .line 70
    invoke-direct {v0, v1}, Lcom/tantan/eventbus/EventBusException;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 74
    :goto_2
    iput-boolean p1, p0, Ll/pxk;->d:Z

    .line 75
    .line 76
    throw v0
.end method
