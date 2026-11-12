.class public final Lewn;
.super Lsvn;
.source "SourceFile"


# instance fields
.field public final a:Lumi;

.field public final b:Ljava/lang/Object;

.field public c:Lokhttp3/internal/ws/RealWebSocket;

.field public d:Ljava/lang/String;

.field public e:Lcom/opera/api/Callback;


# direct methods
.method public constructor <init>(Lumi;Landroid/net/Uri;Lt9f;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lewn;->b:Ljava/lang/Object;

    iput-object p1, p0, Lewn;->a:Lumi;

    new-instance p1, Lfvh;

    invoke-direct {p1}, Lfvh;-><init>()V

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lfvh;->h(Ljava/lang/String;)V

    const-string p2, "Sec-WebSocket-Protocol"

    const-string v0, "oscore.v1"

    invoke-virtual {p1, p2, v0}, Lfvh;->a(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p2, Lkvh;

    invoke-direct {p2, p1}, Lkvh;-><init>(Lfvh;)V

    invoke-virtual {p3, p2, p0}, Lt9f;->a(Lkvh;Lsvn;)Lokhttp3/internal/ws/RealWebSocket;

    move-result-object p1

    iput-object p1, p0, Lewn;->c:Lokhttp3/internal/ws/RealWebSocket;

    return-void
.end method


# virtual methods
.method public final a(ILjava/lang/String;)V
    .registers 3

    new-instance p1, Lwvn;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lwvn;-><init>(Lewn;B)V

    iget-object p0, p0, Lewn;->a:Lumi;

    invoke-interface {p0, p1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final c(Ljava/lang/Exception;Lpzh;)V
    .registers 3

    new-instance p1, Lwvn;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lwvn;-><init>(Lewn;B)V

    iget-object p0, p0, Lewn;->a:Lumi;

    invoke-interface {p0, p1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final e(Ljava/lang/String;)V
    .registers 5

    iget-object v0, p0, Lewn;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lewn;->d:Ljava/lang/String;

    if-nez v1, :cond_1a

    iput-object p1, p0, Lewn;->d:Ljava/lang/String;

    iget-object p1, p0, Lewn;->a:Lumi;

    new-instance v1, Lwvn;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lwvn;-><init>(Lewn;B)V

    invoke-interface {p1, v1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    goto :goto_2d

    :cond_1a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lewn;->d:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lewn;->d:Ljava/lang/String;

    :goto_2d
    monitor-exit v0

    return-void

    :goto_2f
    monitor-exit v0
    :try_end_30
    .catchall {:try_start_3 .. :try_end_30} :catchall_31

    throw p0

    :catchall_31
    move-exception p0

    goto :goto_2f
.end method

.method public final g()V
    .registers 4

    iget-object v0, p0, Lewn;->e:Lcom/opera/api/Callback;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lewn;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_7
    iget-object v1, p0, Lewn;->d:Ljava/lang/String;

    const/4 v2, 0x0

    iput-object v2, p0, Lewn;->d:Ljava/lang/String;

    monitor-exit v0
    :try_end_d
    .catchall {:try_start_7 .. :try_end_d} :catchall_1e

    iget-object v0, p0, Lewn;->c:Lokhttp3/internal/ws/RealWebSocket;

    if-eqz v0, :cond_14

    if-nez v1, :cond_14

    :cond_13
    return-void

    :cond_14
    iget-object v0, p0, Lewn;->e:Lcom/opera/api/Callback;

    iput-object v2, p0, Lewn;->e:Lcom/opera/api/Callback;

    invoke-interface {v0, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :goto_1c
    :try_start_1c
    monitor-exit v0
    :try_end_1d
    .catchall {:try_start_1c .. :try_end_1d} :catchall_1e

    throw p0

    :catchall_1e
    move-exception p0

    goto :goto_1c
.end method

.method public final h(Lcom/opera/api/Callback;)V
    .registers 5

    iget-object v0, p0, Lewn;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lewn;->d:Ljava/lang/String;

    const/4 v2, 0x0

    iput-object v2, p0, Lewn;->d:Ljava/lang/String;

    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_1c

    if-nez v1, :cond_16

    iget-object v0, p0, Lewn;->c:Lokhttp3/internal/ws/RealWebSocket;

    if-nez v0, :cond_13

    invoke-interface {p1, v2}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_13
    iput-object p1, p0, Lewn;->e:Lcom/opera/api/Callback;

    return-void

    :cond_16
    invoke-interface {p1, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :goto_1a
    :try_start_1a
    monitor-exit v0
    :try_end_1b
    .catchall {:try_start_1a .. :try_end_1b} :catchall_1c

    throw p0

    :catchall_1c
    move-exception p0

    goto :goto_1a
.end method
