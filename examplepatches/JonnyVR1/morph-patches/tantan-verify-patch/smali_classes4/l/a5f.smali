.class public Ll/a5f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/a5f$b;,
        Ll/a5f$c;
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/k5f;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/q3k0;

.field public d:Ll/zx3;

.field public e:Ll/u4f;

.field public f:Ll/wtb;

.field public g:Ll/v31;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/a5f;->a:Ljava/lang/Object;

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/a5f;->b:Ljava/util/List;

    .line 17
    .line 18
    return-void
.end method

.method public synthetic constructor <init>(Ll/a5f$a;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ll/a5f;-><init>()V

    return-void
.end method

.method public static synthetic a(Ll/a5f;Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a5f;->n(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/a5f;Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/a5f;->p(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ll/a5f;Ll/m4f;)Lcom/tantanapp/beatles/v2/upload/UploadStatus;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a5f;->t(Ll/m4f;)Lcom/tantanapp/beatles/v2/upload/UploadStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Ll/a5f;)Ll/q3k0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a5f;->c:Ll/q3k0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Ll/a5f;)Ll/zx3;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a5f;->d:Ll/zx3;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Ll/a5f;)Ll/v31;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a5f;->g:Ll/v31;

    .line 2
    .line 3
    return-object p0
.end method

.method public static m()Ll/a5f;
    .locals 1

    .line 1
    invoke-static {}, Ll/a5f$c;->a()Ll/a5f;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public final g(Ll/k5f;)V
    .locals 0
    .param p1    # Ll/k5f;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/a5f;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final h(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)Ljava/lang/Runnable;
    .locals 1

    .line 1
    new-instance v0, Ll/a5f$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/a5f$a;-><init>(Ll/a5f;Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public i()Ll/v31;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a5f;->g:Ll/v31;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Ll/u4f;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a5f;->e:Ll/u4f;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/k5f;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/a5f;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public l()V
    .locals 4

    .line 1
    invoke-static {}, Ll/du2;->p()Ll/cjk0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ll/cjk0;->l()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v2, "attachments"

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {}, Ll/du2;->o()Ll/q3k0;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iput-object v2, p0, Ll/a5f;->c:Ll/q3k0;

    .line 36
    .line 37
    new-instance v3, Ll/v31;

    .line 38
    .line 39
    invoke-direct {v3, v2, v1}, Ll/v31;-><init>(Ll/q3k0;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iput-object v3, p0, Ll/a5f;->g:Ll/v31;

    .line 43
    .line 44
    new-instance v1, Ll/jsw;

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/cjk0;->d()Ll/r4f;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-direct {v1, v2}, Ll/jsw;-><init>(Ll/r4f;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v1}, Ll/a5f;->g(Ll/k5f;)V

    .line 54
    .line 55
    .line 56
    new-instance v1, Ll/xld;

    .line 57
    .line 58
    invoke-static {}, Ll/du2;->e()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-direct {v1, v2}, Ll/xld;-><init>(Landroid/content/Context;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, v1}, Ll/a5f;->g(Ll/k5f;)V

    .line 66
    .line 67
    .line 68
    new-instance v1, Ll/w31;

    .line 69
    .line 70
    iget-object v2, p0, Ll/a5f;->g:Ll/v31;

    .line 71
    .line 72
    invoke-direct {v1, v2}, Ll/w31;-><init>(Ll/v31;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v1}, Ll/a5f;->g(Ll/k5f;)V

    .line 76
    .line 77
    .line 78
    new-instance v1, Ll/zx3;

    .line 79
    .line 80
    invoke-direct {v1}, Ll/zx3;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object v1, p0, Ll/a5f;->d:Ll/zx3;

    .line 84
    .line 85
    new-instance v1, Ll/nod;

    .line 86
    .line 87
    invoke-direct {v1}, Ll/nod;-><init>()V

    .line 88
    .line 89
    .line 90
    iput-object v1, p0, Ll/a5f;->e:Ll/u4f;

    .line 91
    .line 92
    new-instance v1, Ll/wtb;

    .line 93
    .line 94
    invoke-direct {v1}, Ll/wtb;-><init>()V

    .line 95
    .line 96
    .line 97
    iput-object v1, p0, Ll/a5f;->f:Ll/wtb;

    .line 98
    .line 99
    invoke-virtual {v0}, Ll/cjk0;->a()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_0

    .line 104
    .line 105
    invoke-virtual {p0}, Ll/a5f;->o()V

    .line 106
    .line 107
    .line 108
    :cond_0
    return-void
.end method

.method public final n(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getEventProcessors()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/k5f;

    .line 20
    .line 21
    invoke-interface {v0, p1}, Ll/k5f;->a(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void
.end method

.method public o()V
    .locals 1

    .line 1
    new-instance v0, Ll/a5f$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/a5f$b;-><init>(Ll/a5f;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/beatles/NetConnectivityReceiver;->registerCallBack(Lcom/tantanapp/beatles/NetConnectivityReceiver$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final p(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/a5f;->f:Ll/wtb;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wtb;->c(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a5f;->h(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)Ljava/lang/Runnable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Ll/xni0;->d()Ll/yni0;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1, p0}, Ll/yni0;->a(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public r(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1}, Ll/a5f;->h(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)Ljava/lang/Runnable;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/a5f;->a:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    invoke-static {}, Ll/xni0;->b()Ll/yni0;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1, p1}, Ll/yni0;->a(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    const-string p1, "[report] current thread wait!!!"

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    new-array v2, v1, [Ljava/lang/Object;

    .line 19
    .line 20
    invoke-static {p1, v2}, Ll/f610;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/a5f;->a:Ljava/lang/Object;

    .line 24
    .line 25
    const-wide/16 v2, 0x7d0

    .line 26
    .line 27
    invoke-virtual {p0, v2, v3}, Ljava/lang/Object;->wait(J)V

    .line 28
    .line 29
    .line 30
    const-string p0, "[report] notify the wait thread!!!"

    .line 31
    .line 32
    new-array p1, v1, [Ljava/lang/Object;

    .line 33
    .line 34
    invoke-static {p0, p1}, Ll/f610;->d(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    goto :goto_1

    .line 40
    :catch_0
    :goto_0
    :try_start_1
    monitor-exit v0

    .line 41
    return-void

    .line 42
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 43
    throw p0
.end method

.method public s(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a5f;->c:Ll/q3k0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/q3k0;->q(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final t(Ll/m4f;)Lcom/tantanapp/beatles/v2/upload/UploadStatus;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a5f;->c:Ll/q3k0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/q3k0;->r(Ll/m4f;)Lcom/tantanapp/beatles/v2/upload/UploadStatus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
