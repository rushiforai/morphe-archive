.class public Ll/jx5;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/jx5$b;
    }
.end annotation


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public d:Ll/wxl;

.field public e:Ll/smc0;

.field public f:Ll/kcg0;

.field public g:I

.field public h:Landroid/os/Handler;

.field public i:Landroid/os/HandlerThread;

.field public j:Ll/gxl$g;

.field public k:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public volatile l:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public m:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public n:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;


# direct methods
.method public constructor <init>(Ll/smc0;Landroid/app/Application;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Ll/jx5;->a:Ljava/lang/Object;

    .line 10
    .line 11
    new-instance p2, Ljava/lang/Object;

    .line 12
    .line 13
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Ll/jx5;->b:Ljava/lang/Object;

    .line 17
    .line 18
    new-instance p2, Ljava/lang/Object;

    .line 19
    .line 20
    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, Ll/jx5;->c:Ljava/lang/Object;

    .line 24
    .line 25
    const/4 p2, 0x0

    .line 26
    iput p2, p0, Ll/jx5;->g:I

    .line 27
    .line 28
    new-instance v0, Ll/jx5$a;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/jx5$a;-><init>(Ll/jx5;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/jx5;->j:Ll/gxl$g;

    .line 34
    .line 35
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 36
    .line 37
    invoke-direct {v0, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Ll/jx5;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 41
    .line 42
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Ll/jx5;->l:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 49
    .line 50
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 51
    .line 52
    invoke-direct {v0, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Ll/jx5;->m:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 56
    .line 57
    new-instance p2, Landroid/os/HandlerThread;

    .line 58
    .line 59
    const-string v0, "live_long_link_connect_event"

    .line 60
    .line 61
    invoke-direct {p2, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iput-object p2, p0, Ll/jx5;->i:Landroid/os/HandlerThread;

    .line 65
    .line 66
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    .line 67
    .line 68
    .line 69
    new-instance p2, Landroid/os/Handler;

    .line 70
    .line 71
    iget-object v0, p0, Ll/jx5;->i:Landroid/os/HandlerThread;

    .line 72
    .line 73
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v1, Ll/jx5$b;

    .line 78
    .line 79
    const/4 v2, 0x0

    .line 80
    invoke-direct {v1, p0, v2}, Ll/jx5$b;-><init>(Ll/jx5;Ll/kx5;)V

    .line 81
    .line 82
    .line 83
    invoke-direct {p2, v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 84
    .line 85
    .line 86
    iput-object p2, p0, Ll/jx5;->h:Landroid/os/Handler;

    .line 87
    .line 88
    iput-object p1, p0, Ll/jx5;->e:Ll/smc0;

    .line 89
    .line 90
    invoke-virtual {p1}, Ll/smc0;->g()Ll/l4f;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    new-instance p2, Ll/fx5;

    .line 95
    .line 96
    invoke-direct {p2}, Ll/fx5;-><init>()V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Ll/jx5;->j:Ll/gxl$g;

    .line 100
    .line 101
    invoke-virtual {p1, p2, v0}, Ll/l4f;->c(Ll/qcj;Ll/l4f$b;)V

    .line 102
    .line 103
    .line 104
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    invoke-virtual {p1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    new-instance p2, Ll/gx5;

    .line 125
    .line 126
    invoke-direct {p2, p0}, Ll/gx5;-><init>(Ll/jx5;)V

    .line 127
    .line 128
    .line 129
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    iput-object p1, p0, Ll/jx5;->f:Ll/kcg0;

    .line 138
    .line 139
    return-void
.end method

.method public static synthetic a(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ll/jx5;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jx5;->E(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic c(Ll/jx5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jx5;->F()V

    return-void
.end method

.method public static synthetic d(Ll/l4f$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    instance-of p0, p0, Ll/gxl;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static bridge synthetic e(Ll/jx5;)Ll/smc0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jx5;->e:Ll/smc0;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/jx5;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jx5;->m:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object p0
.end method

.method public static bridge synthetic g(Ll/jx5;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jx5;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object p0
.end method

.method public static bridge synthetic h(Ll/jx5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jx5;->v()V

    return-void
.end method

.method public static bridge synthetic i(Ll/jx5;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jx5;->x(I)V

    return-void
.end method

.method public static bridge synthetic j(Ll/jx5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jx5;->A()V

    return-void
.end method

.method public static bridge synthetic k(Ll/jx5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jx5;->B()V

    return-void
.end method

.method public static bridge synthetic l(Ll/jx5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jx5;->C()V

    return-void
.end method

.method public static bridge synthetic m(Ll/jx5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jx5;->D()V

    return-void
.end method

.method public static bridge synthetic n(Ll/jx5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jx5;->N()V

    return-void
.end method

.method public static bridge synthetic o(Ll/jx5;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jx5;->O(I)V

    return-void
.end method

.method public static bridge synthetic p(Ll/jx5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jx5;->P()V

    return-void
.end method

.method public static bridge synthetic q(Ll/jx5;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jx5;->Q()V

    return-void
.end method


# virtual methods
.method public final A()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jx5;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/jx5;->e:Ll/smc0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/smc0;->m()Ll/vzv;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "is no start can not connect"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v0, p0, Ll/jx5;->l:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Ll/jx5;->e:Ll/smc0;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/smc0;->m()Ll/vzv;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string v0, "connect network not available for retryConnect"

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iget-object v0, p0, Ll/jx5;->n:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;

    .line 42
    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;->isConnected()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    iget-object p0, p0, Ll/jx5;->e:Ll/smc0;

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/smc0;->m()Ll/vzv;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string v0, "connection connect for retryConnect"

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    iget-object v0, p0, Ll/jx5;->c:Ljava/lang/Object;

    .line 64
    .line 65
    monitor-enter v0

    .line 66
    :try_start_0
    iget v1, p0, Ll/jx5;->g:I

    .line 67
    .line 68
    const/4 v2, 0x1

    .line 69
    add-int/2addr v1, v2

    .line 70
    iput v1, p0, Ll/jx5;->g:I

    .line 71
    .line 72
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/smc0;->o()Ll/r3w;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput v2, v0, Ll/r3w;->i:I

    .line 80
    .line 81
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 82
    .line 83
    invoke-virtual {v0}, Ll/smc0;->o()Ll/r3w;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-static {}, Ll/pzi0;->o()J

    .line 88
    .line 89
    .line 90
    move-result-wide v1

    .line 91
    iput-wide v1, v0, Ll/r3w;->k:J

    .line 92
    .line 93
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 94
    .line 95
    invoke-virtual {v0}, Ll/smc0;->o()Ll/r3w;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iget v1, p0, Ll/jx5;->g:I

    .line 100
    .line 101
    iput v1, v0, Ll/r3w;->o:I

    .line 102
    .line 103
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0}, Ll/p6s;->A0()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_3

    .line 112
    .line 113
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 114
    .line 115
    invoke-virtual {v0}, Ll/smc0;->o()Ll/r3w;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-static {v0}, Ll/z1w;->d(Ll/r3w;)Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    new-instance v1, Ll/hx5;

    .line 124
    .line 125
    invoke-direct {v1}, Ll/hx5;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 133
    .line 134
    .line 135
    :cond_3
    invoke-virtual {p0}, Ll/jx5;->M()V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :catchall_0
    move-exception p0

    .line 140
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 141
    throw p0
.end method

.method public final B()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/smc0;->o()Ll/r3w;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    iput v1, v0, Ll/r3w;->i:I

    .line 9
    .line 10
    invoke-static {}, Ll/pzi0;->o()J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    iget-object v2, p0, Ll/jx5;->e:Ll/smc0;

    .line 15
    .line 16
    invoke-virtual {v2}, Ll/smc0;->o()Ll/r3w;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iput-wide v0, v2, Ll/r3w;->j:J

    .line 21
    .line 22
    iget-object v2, p0, Ll/jx5;->e:Ll/smc0;

    .line 23
    .line 24
    invoke-virtual {v2}, Ll/smc0;->o()Ll/r3w;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iput-wide v0, v2, Ll/r3w;->k:J

    .line 29
    .line 30
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/smc0;->m()Ll/vzv;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "do start connect"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/jx5;->l:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_0

    .line 48
    .line 49
    iget-object p0, p0, Ll/jx5;->e:Ll/smc0;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/smc0;->m()Ll/vzv;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string v0, "connect network not available for startConnect"

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    iget-object v0, p0, Ll/jx5;->n:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;

    .line 62
    .line 63
    if-eqz v0, :cond_1

    .line 64
    .line 65
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;->isConnected()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_1

    .line 70
    .line 71
    iget-object p0, p0, Ll/jx5;->e:Ll/smc0;

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/smc0;->m()Ll/vzv;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const-string v0, "already connected return"

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_1
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 84
    .line 85
    invoke-virtual {v0}, Ll/smc0;->k()Ll/t0q;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0}, Ll/t0q;->d()V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ll/jx5;->M()V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final C()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/smc0;->o()Ll/r3w;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ll/pzi0;->o()J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    iput-wide v1, v0, Ll/r3w;->l:J

    .line 12
    .line 13
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/smc0;->m()Ll/vzv;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "handle stop connect"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/jx5;->n:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;->isConnected()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/smc0;->m()Ll/vzv;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "stop connect done"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/jx5;->G()V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/jx5;->n:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;

    .line 49
    .line 50
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;->c()V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public final D()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jx5;->u()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/jx5;->C()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/jx5;->t()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic E(Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/jx5;->I()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/jx5;->J()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic F()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/jx5;->e:Ll/smc0;

    .line 2
    .line 3
    new-instance v0, Ll/gzq;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/gzq;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/smc0;->a(Ll/qy3;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final G()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/smc0;->k()Ll/t0q;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/t0q;->d()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/smc0;->l()Ll/hzq;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/hzq;->d()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/smc0;->b()Ll/a10;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/bzm;->d()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/smc0;->n()Ll/x250;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/bzm;->d()V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/jx5;->e:Ll/smc0;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/smc0;->j()Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Ll/bzm;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/bzm;->d()V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    return-void
.end method

.method public final H()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/smc0;->k()Ll/t0q;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/bzm;->e()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/smc0;->l()Ll/hzq;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/hzq;->e()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/smc0;->b()Ll/a10;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/bzm;->e()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/smc0;->n()Ll/x250;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/bzm;->e()V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/jx5;->e:Ll/smc0;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/smc0;->j()Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Ll/bzm;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/bzm;->e()V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    return-void
.end method

.method public final I()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/smc0;->m()Ll/vzv;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "network connect"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/smc0;->i()Ll/ixl;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-virtual {v0, v1}, Ll/ixl;->d(Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/jx5;->l:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/jx5;->v()V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final J()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/smc0;->m()Ll/vzv;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "network disconnect"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/jx5;->l:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/smc0;->i()Ll/ixl;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0, v1}, Ll/ixl;->d(Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/jx5;->N()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public K(IILl/gxl;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/smc0;->m()Ll/vzv;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p1}, Ll/m3g0;->a(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, "----->"

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-static {p2}, Ll/m3g0;->a(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/jx5;->e:Ll/smc0;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/smc0;->i()Ll/ixl;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0, p1, p2, p3}, Ll/ixl;->b(IILl/gxl;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public L()Lokio/BufferedSource;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const-string v0, "readPacket error state:"

    .line 2
    .line 3
    iget-object v1, p0, Ll/jx5;->a:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object v2, p0, Ll/jx5;->n:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;

    .line 7
    .line 8
    if-eqz v2, :cond_1

    .line 9
    .line 10
    invoke-interface {v2}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;->isConnected()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/jx5;->n:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;

    .line 17
    .line 18
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;->read()Lokio/BufferedSource;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    monitor-exit v1

    .line 23
    return-object p0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    new-instance v2, Ljava/lang/Exception;

    .line 27
    .line 28
    new-instance v3, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/jx5;->n:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;

    .line 34
    .line 35
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;->getCurrentState()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    invoke-static {p0}, Ll/m3g0;->a(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-direct {v2, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    throw v2

    .line 54
    :cond_1
    new-instance p0, Ljava/lang/Exception;

    .line 55
    .line 56
    const-string v0, "connection is null writePacket start wait"

    .line 57
    .line 58
    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    throw p0

    .line 62
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    throw p0
.end method

.method public final M()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/smc0;->e()Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/jx5;->e:Ll/smc0;

    .line 8
    .line 9
    iget v2, p0, Ll/jx5;->g:I

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/b;->a(Ll/smc0;I)Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/jx5;->n:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;

    .line 16
    .line 17
    iget-object v0, p0, Ll/jx5;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/jx5;->t()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :catch_0
    move-exception v0

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object v0, p0, Ll/jx5;->n:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;

    .line 32
    .line 33
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;->a()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :goto_0
    iget-object v1, p0, Ll/jx5;->e:Ll/smc0;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/smc0;->m()Ll/vzv;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1, v0}, Ll/vzv;->b(Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/jx5;->e:Ll/smc0;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/smc0;->i()Ll/ixl;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0, v0}, Ll/ixl;->a(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final N()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jx5;->c:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iput v1, p0, Ll/jx5;->g:I

    .line 6
    .line 7
    monitor-exit v0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p0

    .line 10
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    throw p0
.end method

.method public final O(I)V
    .locals 2

    .line 1
    const/4 v0, 0x4

    .line 2
    if-eq p1, v0, :cond_2

    .line 3
    .line 4
    const/4 v1, 0x7

    .line 5
    if-eq p1, v1, :cond_1

    .line 6
    .line 7
    const/16 v1, 0xc

    .line 8
    .line 9
    if-eq p1, v1, :cond_0

    .line 10
    .line 11
    const/16 v1, 0xd

    .line 12
    .line 13
    if-eq p1, v1, :cond_3

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v0, 0x3

    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/4 v0, 0x2

    .line 20
    goto :goto_0

    .line 21
    :cond_2
    const/4 v0, 0x1

    .line 22
    :cond_3
    :goto_0
    iget-object p0, p0, Ll/jx5;->e:Ll/smc0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/smc0;->o()Ll/r3w;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Ll/r3w;->p:Ljava/lang/String;

    .line 33
    .line 34
    return-void
.end method

.method public final P()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/smc0;->s()Ll/c0j0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/jx5;->Q()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/smc0;->s()Ll/c0j0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/ix5;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/ix5;-><init>(Ll/jx5;)V

    .line 21
    .line 22
    .line 23
    iget-object v2, p0, Ll/jx5;->e:Ll/smc0;

    .line 24
    .line 25
    invoke-virtual {v2}, Ll/smc0;->r()Ll/zxi0;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v0, v1, v2}, Ll/c0j0;->b(Ljava/lang/Runnable;Ll/zxi0;)Ll/wxl;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Ll/jx5;->d:Ll/wxl;

    .line 34
    .line 35
    invoke-interface {v0}, Ll/wxl;->start()V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public final Q()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jx5;->d:Ll/wxl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/wxl;->stop()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public R(Lokio/Buffer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const-string v0, "writePacket drop this packet current state:"

    .line 2
    .line 3
    iget-object v1, p0, Ll/jx5;->b:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object v2, p0, Ll/jx5;->n:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/jx5;->e:Ll/smc0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/smc0;->m()Ll/vzv;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string p1, "connection is null writePacket start wait"

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    monitor-exit v1

    .line 22
    return-void

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-interface {v2}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;->isConnected()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Ll/jx5;->n:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;

    .line 32
    .line 33
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;->b(Lokio/Buffer;)V

    .line 34
    .line 35
    .line 36
    monitor-exit v1

    .line 37
    return-void

    .line 38
    :cond_1
    iget-object p1, p0, Ll/jx5;->e:Ll/smc0;

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/smc0;->m()Ll/vzv;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    new-instance v2, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/jx5;->n:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;

    .line 50
    .line 51
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a;->getCurrentState()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    invoke-static {p0}, Ll/m3g0;->a(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p1, p0}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    monitor-exit v1

    .line 70
    return-void

    .line 71
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    throw p0
.end method

.method public r()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/jx5;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/jx5;->w()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catch_0
    move-exception v0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/smc0;->m()Ll/vzv;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "already started can not connect"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ll/vzv;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/jx5;->e:Ll/smc0;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/smc0;->m()Ll/vzv;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0, v0}, Ll/vzv;->b(Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public s()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/jx5;->k:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/jx5;->y()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catch_0
    move-exception v0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/smc0;->m()Ll/vzv;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "already stop can not disconnect"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ll/vzv;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/jx5;->e:Ll/smc0;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/smc0;->m()Ll/vzv;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0, v0}, Ll/vzv;->b(Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final t()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/smc0;->g()Ll/l4f;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/jx5;->j:Ll/gxl$g;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/l4f;->d(Ll/l4f$b;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/smc0;->r()Ll/zxi0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/zxi0;->c()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/smc0;->i()Ll/ixl;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/ixl;->e()V

    .line 28
    .line 29
    .line 30
    :try_start_0
    iget-object v0, p0, Ll/jx5;->i:Landroid/os/HandlerThread;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    .line 35
    :catch_0
    invoke-virtual {p0}, Ll/jx5;->N()V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/jx5;->l:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/jx5;->m:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final u()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jx5;->e:Ll/smc0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/smc0;->m()Ll/vzv;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "shutdown the connect"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/jx5;->N()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/jx5;->f:Ll/kcg0;

    .line 16
    .line 17
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/jx5;->Q()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/jx5;->H()V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/jx5;->e:Ll/smc0;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/smc0;->d()Ll/t24;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ll/t24;->h()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final v()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/jx5;->h:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final w()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/jx5;->h:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final x(I)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/jx5;->O(I)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/jx5;->e:Ll/smc0;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/smc0;->m()Ll/vzv;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const-string v0, "doStopConnect"

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/jx5;->h:Landroid/os/Handler;

    .line 16
    .line 17
    const/4 v0, 0x3

    .line 18
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/jx5;->h:Landroid/os/Handler;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final y()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jx5;->h:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/jx5;->h:Landroid/os/Handler;

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/jx5;->h:Landroid/os/Handler;

    .line 14
    .line 15
    const/4 v0, 0x4

    .line 16
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public z()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/jx5;->m:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
