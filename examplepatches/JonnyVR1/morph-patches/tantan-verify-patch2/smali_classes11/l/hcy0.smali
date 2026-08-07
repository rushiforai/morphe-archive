.class public final Ll/hcy0;
.super Ll/kix0;
.source "SourceFile"


# instance fields
.field public final c:Ll/xfy0;

.field public d:Ll/isw0;

.field public volatile e:Ljava/lang/Boolean;

.field public final f:Ll/l2s0;

.field public final g:Ll/xiy0;

.field public final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field public final i:Ll/l2s0;


# direct methods
.method public constructor <init>(Ll/atx0;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/kix0;-><init>(Ll/atx0;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/hcy0;->h:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/xiy0;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/atx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1}, Ll/xiy0;-><init>(Lcom/google/android/gms/common/util/Clock;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/hcy0;->g:Ll/xiy0;

    .line 21
    .line 22
    new-instance v0, Ll/xfy0;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/xfy0;-><init>(Ll/hcy0;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/hcy0;->c:Ll/xfy0;

    .line 28
    .line 29
    new-instance v0, Ll/mcy0;

    .line 30
    .line 31
    invoke-direct {v0, p0, p1}, Ll/mcy0;-><init>(Ll/hcy0;Ll/hzx0;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ll/hcy0;->f:Ll/l2s0;

    .line 35
    .line 36
    new-instance v0, Ll/xey0;

    .line 37
    .line 38
    invoke-direct {v0, p0, p1}, Ll/xey0;-><init>(Ll/hcy0;Ll/hzx0;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Ll/hcy0;->i:Ll/l2s0;

    .line 42
    .line 43
    return-void
.end method

.method private final A(Ljava/lang/Runnable;)V
    .locals 4
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/hcy0;->a0()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Ll/hcy0;->h:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    int-to-long v0, v0

    .line 21
    const-wide/16 v2, 0x3e8

    .line 22
    .line 23
    cmp-long v0, v0, v2

    .line 24
    .line 25
    if-ltz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/d6x0;->A()Ll/l8x0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "Discarding data. Max runnable queue size reached"

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iget-object v0, p0, Ll/hcy0;->h:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/hcy0;->i:Ll/l2s0;

    .line 47
    .line 48
    const-wide/32 v0, 0xea60

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v0, v1}, Ll/l2s0;->b(J)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ll/hcy0;->T()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public static synthetic M(Ll/hcy0;Landroid/content/ComponentName;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/hcy0;->d:Ll/isw0;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/hcy0;->d:Ll/isw0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/d6x0;->E()Ll/l8x0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "Disconnected from device MeasurementService"

    .line 20
    .line 21
    invoke-virtual {v0, v1, p1}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/hcy0;->T()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public static bridge synthetic N(Ll/hcy0;Ll/isw0;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Ll/hcy0;->d:Ll/isw0;

    .line 3
    .line 4
    return-void
.end method

.method private final f0()V
    .locals 4
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/d6x0;->E()Ll/l8x0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Ll/hcy0;->h:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "Processing queued up service tasks"

    .line 23
    .line 24
    invoke-virtual {v0, v2, v1}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/hcy0;->h:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Ljava/lang/Runnable;

    .line 44
    .line 45
    :try_start_0
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catch_0
    move-exception v1

    .line 50
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v2}, Ll/d6x0;->A()Ll/l8x0;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    const-string v3, "Task exception while flushing queue"

    .line 59
    .line 60
    invoke-virtual {v2, v3, v1}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    iget-object v0, p0, Ll/hcy0;->h:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/hcy0;->i:Ll/l2s0;

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/l2s0;->a()V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method private final g0()V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/hcy0;->g:Ll/xiy0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/xiy0;->c()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/hcy0;->f:Ll/l2s0;

    .line 10
    .line 11
    sget-object v0, Ll/whs0;->M:Ll/zpw0;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Ll/zpw0;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/lang/Long;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    invoke-virtual {p0, v0, v1}, Ll/l2s0;->b(J)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static bridge synthetic h0(Ll/hcy0;)Ll/xfy0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hcy0;->c:Ll/xfy0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k0(Ll/hcy0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hcy0;->f0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l0(Ll/hcy0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/hcy0;->a0()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/d6x0;->E()Ll/l8x0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "Inactivity, disconnecting from the service"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/hcy0;->U()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public static synthetic m0(Ll/hcy0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hcy0;->g0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic v(Ll/hcy0;)Ll/isw0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hcy0;->d:Ll/isw0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final B(Ljava/util/concurrent/atomic/AtomicReference;)V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Ll/hcy0;->j0(Z)Lcom/google/android/gms/measurement/internal/zzo;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/gdy0;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1, v0}, Ll/gdy0;-><init>(Ll/hcy0;Ljava/util/concurrent/atomic/AtomicReference;Lcom/google/android/gms/measurement/internal/zzo;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, v1}, Ll/hcy0;->A(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final C(Ljava/util/concurrent/atomic/AtomicReference;Landroid/os/Bundle;)V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ljava/util/List<",
            "Lcom/google/android/gms/measurement/internal/zzno;",
            ">;>;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Ll/hcy0;->j0(Z)Lcom/google/android/gms/measurement/internal/zzo;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/ddy0;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1, v0, p2}, Ll/ddy0;-><init>(Ll/hcy0;Ljava/util/concurrent/atomic/AtomicReference;Lcom/google/android/gms/measurement/internal/zzo;Landroid/os/Bundle;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, v1}, Ll/hcy0;->A(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final D(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ljava/util/List<",
            "Lcom/google/android/gms/measurement/internal/zzae;",
            ">;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Ll/hcy0;->j0(Z)Lcom/google/android/gms/measurement/internal/zzo;

    .line 9
    .line 10
    .line 11
    move-result-object v7

    .line 12
    new-instance v1, Ll/lfy0;

    .line 13
    .line 14
    move-object v2, p0

    .line 15
    move-object v3, p1

    .line 16
    move-object v4, p2

    .line 17
    move-object v5, p3

    .line 18
    move-object v6, p4

    .line 19
    invoke-direct/range {v1 .. v7}, Ll/lfy0;-><init>(Ll/hcy0;Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzo;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {v2, v1}, Ll/hcy0;->A(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final E(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 9
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ljava/util/List<",
            "Lcom/google/android/gms/measurement/internal/zzon;",
            ">;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Ll/hcy0;->j0(Z)Lcom/google/android/gms/measurement/internal/zzo;

    .line 9
    .line 10
    .line 11
    move-result-object v7

    .line 12
    new-instance v1, Ll/qfy0;

    .line 13
    .line 14
    move-object v2, p0

    .line 15
    move-object v3, p1

    .line 16
    move-object v4, p2

    .line 17
    move-object v5, p3

    .line 18
    move-object v6, p4

    .line 19
    move v8, p5

    .line 20
    invoke-direct/range {v1 .. v8}, Ll/qfy0;-><init>(Ll/hcy0;Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzo;Z)V

    .line 21
    .line 22
    .line 23
    invoke-direct {v2, v1}, Ll/hcy0;->A(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final F(Ll/wmu0;)V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Ll/hcy0;->j0(Z)Lcom/google/android/gms/measurement/internal/zzo;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/ley0;

    .line 13
    .line 14
    invoke-direct {v1, p0, v0, p1}, Ll/ley0;-><init>(Ll/hcy0;Lcom/google/android/gms/measurement/internal/zzo;Ll/wmu0;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, v1}, Ll/hcy0;->A(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final G(Ll/wmu0;Lcom/google/android/gms/measurement/internal/zzbf;Ljava/lang/String;)V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/yyx0;->e()Ll/hny0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const v1, 0xbdfcb8

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/hny0;->o(I)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p2}, Ll/d6x0;->F()Ll/l8x0;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    const-string p3, "Not bundling data. Service unavailable or out of date"

    .line 29
    .line 30
    invoke-virtual {p2, p3}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/yyx0;->e()Ll/hny0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/4 p2, 0x0

    .line 38
    new-array p2, p2, [B

    .line 39
    .line 40
    invoke-virtual {p0, p1, p2}, Ll/hny0;->Q(Ll/wmu0;[B)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    new-instance v0, Ll/cfy0;

    .line 45
    .line 46
    invoke-direct {v0, p0, p2, p3, p1}, Ll/cfy0;-><init>(Ll/hcy0;Lcom/google/android/gms/measurement/internal/zzbf;Ljava/lang/String;Ll/wmu0;)V

    .line 47
    .line 48
    .line 49
    invoke-direct {p0, v0}, Ll/hcy0;->A(Ljava/lang/Runnable;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final H(Ll/wmu0;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Ll/hcy0;->j0(Z)Lcom/google/android/gms/measurement/internal/zzo;

    .line 9
    .line 10
    .line 11
    move-result-object v5

    .line 12
    new-instance v1, Ll/tfy0;

    .line 13
    .line 14
    move-object v2, p0

    .line 15
    move-object v6, p1

    .line 16
    move-object v3, p2

    .line 17
    move-object v4, p3

    .line 18
    invoke-direct/range {v1 .. v6}, Ll/tfy0;-><init>(Ll/hcy0;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzo;Ll/wmu0;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {v2, v1}, Ll/hcy0;->A(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final I(Ll/wmu0;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 8
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Ll/hcy0;->j0(Z)Lcom/google/android/gms/measurement/internal/zzo;

    .line 9
    .line 10
    .line 11
    move-result-object v5

    .line 12
    new-instance v1, Ll/xcy0;

    .line 13
    .line 14
    move-object v2, p0

    .line 15
    move-object v7, p1

    .line 16
    move-object v3, p2

    .line 17
    move-object v4, p3

    .line 18
    move v6, p4

    .line 19
    invoke-direct/range {v1 .. v7}, Ll/xcy0;-><init>(Ll/hcy0;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzo;ZLl/wmu0;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {v2, v1}, Ll/hcy0;->A(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final J(Ll/isw0;)V
    .locals 0
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/hcy0;->d:Ll/isw0;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/hcy0;->g0()V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Ll/hcy0;->f0()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final K(Ll/isw0;Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;Lcom/google/android/gms/measurement/internal/zzo;)V
    .locals 26
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    move-object/from16 v3, p2

    .line 6
    .line 7
    move-object/from16 v4, p3

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/yyx0;->h()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1}, Ll/kix0;->p()V

    .line 13
    .line 14
    .line 15
    const/16 v5, 0x64

    .line 16
    .line 17
    move v0, v5

    .line 18
    const/4 v7, 0x0

    .line 19
    :goto_0
    const/16 v8, 0x3e9

    .line 20
    .line 21
    if-ge v7, v8, :cond_8

    .line 22
    .line 23
    if-ne v0, v5, :cond_8

    .line 24
    .line 25
    new-instance v8, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ll/v1v0;->k()Ll/zvw0;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0, v5}, Ll/zvw0;->w(I)Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-interface {v8, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 41
    .line 42
    .line 43
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    move v9, v0

    .line 48
    goto :goto_1

    .line 49
    :cond_0
    const/4 v9, 0x0

    .line 50
    :goto_1
    if-eqz v3, :cond_1

    .line 51
    .line 52
    if-ge v9, v5, :cond_1

    .line 53
    .line 54
    invoke-interface {v8, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    :cond_1
    invoke-virtual {v1}, Ll/yyx0;->a()Ll/ajr0;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sget-object v10, Ll/whs0;->F0:Ll/zpw0;

    .line 62
    .line 63
    invoke-virtual {v0, v10}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 64
    .line 65
    .line 66
    move-result v10

    .line 67
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    .line 68
    .line 69
    .line 70
    move-result v11

    .line 71
    const/4 v0, 0x0

    .line 72
    :goto_2
    if-ge v0, v11, :cond_7

    .line 73
    .line 74
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v12

    .line 78
    add-int/lit8 v13, v0, 0x1

    .line 79
    .line 80
    check-cast v12, Lcom/google/android/gms/common/internal/safeparcel/AbstractSafeParcelable;

    .line 81
    .line 82
    instance-of v0, v12, Lcom/google/android/gms/measurement/internal/zzbf;

    .line 83
    .line 84
    if-eqz v0, :cond_3

    .line 85
    .line 86
    const-wide/16 v14, 0x0

    .line 87
    .line 88
    if-eqz v10, :cond_2

    .line 89
    .line 90
    :try_start_0
    iget-object v0, v1, Ll/yyx0;->a:Ll/atx0;

    .line 91
    .line 92
    invoke-virtual {v0}, Ll/atx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 97
    .line 98
    .line 99
    move-result-wide v16
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1

    .line 100
    :try_start_1
    iget-object v0, v1, Ll/yyx0;->a:Ll/atx0;

    .line 101
    .line 102
    invoke-virtual {v0}, Ll/atx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 107
    .line 108
    .line 109
    move-result-wide v18
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 110
    move-wide/from16 v24, v18

    .line 111
    .line 112
    move-wide/from16 v19, v16

    .line 113
    .line 114
    goto :goto_3

    .line 115
    :catch_0
    move-exception v0

    .line 116
    move-wide/from16 v24, v14

    .line 117
    .line 118
    move-wide/from16 v19, v16

    .line 119
    .line 120
    goto :goto_4

    .line 121
    :catch_1
    move-exception v0

    .line 122
    move-wide/from16 v19, v14

    .line 123
    .line 124
    move-wide/from16 v24, v19

    .line 125
    .line 126
    goto :goto_4

    .line 127
    :cond_2
    move-wide/from16 v19, v14

    .line 128
    .line 129
    move-wide/from16 v24, v19

    .line 130
    .line 131
    :goto_3
    :try_start_2
    check-cast v12, Lcom/google/android/gms/measurement/internal/zzbf;

    .line 132
    .line 133
    invoke-interface {v2, v12, v4}, Ll/isw0;->r4(Lcom/google/android/gms/measurement/internal/zzbf;Lcom/google/android/gms/measurement/internal/zzo;)V

    .line 134
    .line 135
    .line 136
    if-eqz v10, :cond_6

    .line 137
    .line 138
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {v0}, Ll/d6x0;->E()Ll/l8x0;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    const-string v12, "Logging telemetry for logEvent from database"

    .line 147
    .line 148
    invoke-virtual {v0, v12}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    iget-object v0, v1, Ll/yyx0;->a:Ll/atx0;

    .line 152
    .line 153
    invoke-static {v0}, Ll/v3x0;->a(Ll/atx0;)Ll/v3x0;

    .line 154
    .line 155
    .line 156
    move-result-object v16

    .line 157
    iget-object v0, v1, Ll/yyx0;->a:Ll/atx0;

    .line 158
    .line 159
    invoke-virtual {v0}, Ll/atx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 164
    .line 165
    .line 166
    move-result-wide v21

    .line 167
    iget-object v0, v1, Ll/yyx0;->a:Ll/atx0;

    .line 168
    .line 169
    invoke-virtual {v0}, Ll/atx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 174
    .line 175
    .line 176
    move-result-wide v17

    .line 177
    sub-long v5, v17, v24

    .line 178
    .line 179
    long-to-int v0, v5

    .line 180
    const v17, 0x8dcd

    .line 181
    .line 182
    .line 183
    const/16 v18, 0x0

    .line 184
    .line 185
    move/from16 v23, v0

    .line 186
    .line 187
    invoke-virtual/range {v16 .. v23}, Ll/v3x0;->b(IIJJI)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_2

    .line 188
    .line 189
    .line 190
    goto/16 :goto_5

    .line 191
    .line 192
    :catch_2
    move-exception v0

    .line 193
    :goto_4
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 194
    .line 195
    .line 196
    move-result-object v5

    .line 197
    invoke-virtual {v5}, Ll/d6x0;->A()Ll/l8x0;

    .line 198
    .line 199
    .line 200
    move-result-object v5

    .line 201
    const-string v6, "Failed to send event to the service"

    .line 202
    .line 203
    invoke-virtual {v5, v6, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 204
    .line 205
    .line 206
    if-eqz v10, :cond_6

    .line 207
    .line 208
    cmp-long v0, v19, v14

    .line 209
    .line 210
    if-eqz v0, :cond_6

    .line 211
    .line 212
    iget-object v0, v1, Ll/yyx0;->a:Ll/atx0;

    .line 213
    .line 214
    invoke-static {v0}, Ll/v3x0;->a(Ll/atx0;)Ll/v3x0;

    .line 215
    .line 216
    .line 217
    move-result-object v16

    .line 218
    iget-object v0, v1, Ll/yyx0;->a:Ll/atx0;

    .line 219
    .line 220
    invoke-virtual {v0}, Ll/atx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 225
    .line 226
    .line 227
    move-result-wide v21

    .line 228
    iget-object v0, v1, Ll/yyx0;->a:Ll/atx0;

    .line 229
    .line 230
    invoke-virtual {v0}, Ll/atx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 235
    .line 236
    .line 237
    move-result-wide v5

    .line 238
    sub-long v5, v5, v24

    .line 239
    .line 240
    long-to-int v0, v5

    .line 241
    const v17, 0x8dcd

    .line 242
    .line 243
    .line 244
    const/16 v18, 0xd

    .line 245
    .line 246
    move/from16 v23, v0

    .line 247
    .line 248
    invoke-virtual/range {v16 .. v23}, Ll/v3x0;->b(IIJJI)V

    .line 249
    .line 250
    .line 251
    goto :goto_5

    .line 252
    :cond_3
    instance-of v0, v12, Lcom/google/android/gms/measurement/internal/zzon;

    .line 253
    .line 254
    if-eqz v0, :cond_4

    .line 255
    .line 256
    :try_start_3
    check-cast v12, Lcom/google/android/gms/measurement/internal/zzon;

    .line 257
    .line 258
    invoke-interface {v2, v12, v4}, Ll/isw0;->Q4(Lcom/google/android/gms/measurement/internal/zzon;Lcom/google/android/gms/measurement/internal/zzo;)V
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_3

    .line 259
    .line 260
    .line 261
    goto :goto_5

    .line 262
    :catch_3
    move-exception v0

    .line 263
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 264
    .line 265
    .line 266
    move-result-object v5

    .line 267
    invoke-virtual {v5}, Ll/d6x0;->A()Ll/l8x0;

    .line 268
    .line 269
    .line 270
    move-result-object v5

    .line 271
    const-string v6, "Failed to send user property to the service"

    .line 272
    .line 273
    invoke-virtual {v5, v6, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 274
    .line 275
    .line 276
    goto :goto_5

    .line 277
    :cond_4
    instance-of v0, v12, Lcom/google/android/gms/measurement/internal/zzae;

    .line 278
    .line 279
    if-eqz v0, :cond_5

    .line 280
    .line 281
    :try_start_4
    check-cast v12, Lcom/google/android/gms/measurement/internal/zzae;

    .line 282
    .line 283
    invoke-interface {v2, v12, v4}, Ll/isw0;->g3(Lcom/google/android/gms/measurement/internal/zzae;Lcom/google/android/gms/measurement/internal/zzo;)V
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_4

    .line 284
    .line 285
    .line 286
    goto :goto_5

    .line 287
    :catch_4
    move-exception v0

    .line 288
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 289
    .line 290
    .line 291
    move-result-object v5

    .line 292
    invoke-virtual {v5}, Ll/d6x0;->A()Ll/l8x0;

    .line 293
    .line 294
    .line 295
    move-result-object v5

    .line 296
    const-string v6, "Failed to send conditional user property to the service"

    .line 297
    .line 298
    invoke-virtual {v5, v6, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 299
    .line 300
    .line 301
    goto :goto_5

    .line 302
    :cond_5
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    invoke-virtual {v0}, Ll/d6x0;->A()Ll/l8x0;

    .line 307
    .line 308
    .line 309
    move-result-object v0

    .line 310
    const-string v5, "Discarding data. Unrecognized parcel type."

    .line 311
    .line 312
    invoke-virtual {v0, v5}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    :cond_6
    :goto_5
    move v0, v13

    .line 316
    const/16 v5, 0x64

    .line 317
    .line 318
    goto/16 :goto_2

    .line 319
    .line 320
    :cond_7
    add-int/lit8 v7, v7, 0x1

    .line 321
    .line 322
    move v0, v9

    .line 323
    const/16 v5, 0x64

    .line 324
    .line 325
    goto/16 :goto_0

    .line 326
    .line 327
    :cond_8
    return-void
.end method

.method public final L(Ll/way0;)V
    .locals 1
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/oey0;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Ll/oey0;-><init>(Ll/hcy0;Ll/way0;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, v0}, Ll/hcy0;->A(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final O(Z)V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/ziy0;->a()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/yyx0;->a()Ll/ajr0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Ll/whs0;->Y0:Ll/zpw0;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    :cond_0
    if-eqz p1, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/v1v0;->k()Ll/zvw0;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ll/zvw0;->B()V

    .line 32
    .line 33
    .line 34
    :cond_1
    invoke-virtual {p0}, Ll/hcy0;->c0()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    const/4 p1, 0x0

    .line 41
    invoke-virtual {p0, p1}, Ll/hcy0;->j0(Z)Lcom/google/android/gms/measurement/internal/zzo;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    new-instance v0, Ll/ify0;

    .line 46
    .line 47
    invoke-direct {v0, p0, p1}, Ll/ify0;-><init>(Ll/hcy0;Lcom/google/android/gms/measurement/internal/zzo;)V

    .line 48
    .line 49
    .line 50
    invoke-direct {p0, v0}, Ll/hcy0;->A(Ljava/lang/Runnable;)V

    .line 51
    .line 52
    .line 53
    :cond_2
    return-void
.end method

.method public final P()Lcom/google/android/gms/measurement/internal/zzaj;
    .locals 3
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/hcy0;->d:Ll/isw0;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/hcy0;->T()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/d6x0;->z()Ll/l8x0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "Failed to get consents; not connected to service yet."

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-object v1

    .line 29
    :cond_0
    const/4 v2, 0x0

    .line 30
    invoke-virtual {p0, v2}, Ll/hcy0;->j0(Z)Lcom/google/android/gms/measurement/internal/zzo;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    :try_start_0
    invoke-interface {v0, v2}, Ll/isw0;->L5(Lcom/google/android/gms/measurement/internal/zzo;)Lcom/google/android/gms/measurement/internal/zzaj;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-direct {p0}, Ll/hcy0;->g0()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .line 43
    .line 44
    return-object v0

    .line 45
    :catch_0
    move-exception v0

    .line 46
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Ll/d6x0;->A()Ll/l8x0;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string v2, "Failed to get consents; remote exception"

    .line 55
    .line 56
    invoke-virtual {p0, v2, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    return-object v1
.end method

.method public final Q()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hcy0;->e:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public final R()V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, v0}, Ll/hcy0;->j0(Z)Lcom/google/android/gms/measurement/internal/zzo;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/rey0;

    .line 13
    .line 14
    invoke-direct {v1, p0, v0}, Ll/rey0;-><init>(Ll/hcy0;Lcom/google/android/gms/measurement/internal/zzo;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, v1}, Ll/hcy0;->A(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final S()V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, v0}, Ll/hcy0;->j0(Z)Lcom/google/android/gms/measurement/internal/zzo;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Ll/v1v0;->k()Ll/zvw0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Ll/zvw0;->C()Z

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/iey0;

    .line 20
    .line 21
    invoke-direct {v1, p0, v0}, Ll/iey0;-><init>(Ll/hcy0;Lcom/google/android/gms/measurement/internal/zzo;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0, v1}, Ll/hcy0;->A(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final T()V
    .locals 4
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/hcy0;->a0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/hcy0;->e0()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Ll/hcy0;->c:Ll/xfy0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xfy0;->a()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-virtual {p0}, Ll/yyx0;->a()Ll/ajr0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/ajr0;->R()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_3

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Landroid/content/Intent;

    .line 45
    .line 46
    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    const-string v3, "com.google.android.gms.measurement.AppMeasurementService"

    .line 54
    .line 55
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const/high16 v2, 0x10000

    .line 60
    .line 61
    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    if-eqz v0, :cond_2

    .line 66
    .line 67
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_2

    .line 72
    .line 73
    new-instance v0, Landroid/content/Intent;

    .line 74
    .line 75
    const-string v1, "com.google.android.gms.measurement.START"

    .line 76
    .line 77
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    new-instance v1, Landroid/content/ComponentName;

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Ll/hcy0;->c:Ll/xfy0;

    .line 93
    .line 94
    invoke-virtual {p0, v0}, Ll/xfy0;->b(Landroid/content/Intent;)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_2
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {p0}, Ll/d6x0;->A()Ll/l8x0;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    const-string v0, "Unable to use remote or local measurement implementation. Please register the AppMeasurementService service in the app manifest"

    .line 107
    .line 108
    invoke-virtual {p0, v0}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    :cond_3
    :goto_0
    return-void
.end method

.method public final U()V
    .locals 3
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/hcy0;->c:Ll/xfy0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/xfy0;->d()V

    .line 10
    .line 11
    .line 12
    :try_start_0
    invoke-static {}, Lcom/google/android/gms/common/stats/ConnectionTracker;->getInstance()Lcom/google/android/gms/common/stats/ConnectionTracker;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v2, p0, Ll/hcy0;->c:Ll/xfy0;

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/common/stats/ConnectionTracker;->unbindService(Landroid/content/Context;Landroid/content/ServiceConnection;)V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    :catch_0
    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Ll/hcy0;->d:Ll/isw0;

    .line 27
    .line 28
    return-void
.end method

.method public final synthetic V()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hcy0;->d:Ll/isw0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/d6x0;->A()Ll/l8x0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "Failed to send Dma consent settings to service"

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const/4 v1, 0x0

    .line 20
    :try_start_0
    invoke-virtual {p0, v1}, Ll/hcy0;->j0(Z)Lcom/google/android/gms/measurement/internal/zzo;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    invoke-interface {v0, v1}, Ll/isw0;->U7(Lcom/google/android/gms/measurement/internal/zzo;)V

    .line 28
    .line 29
    .line 30
    invoke-direct {p0}, Ll/hcy0;->g0()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catch_0
    move-exception v0

    .line 35
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ll/d6x0;->A()Ll/l8x0;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string v1, "Failed to send Dma consent settings to the service"

    .line 44
    .line 45
    invoke-virtual {p0, v1, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic W()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hcy0;->d:Ll/isw0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/d6x0;->A()Ll/l8x0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "Failed to send storage consent settings to service"

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const/4 v1, 0x0

    .line 20
    :try_start_0
    invoke-virtual {p0, v1}, Ll/hcy0;->j0(Z)Lcom/google/android/gms/measurement/internal/zzo;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    invoke-interface {v0, v1}, Ll/isw0;->x7(Lcom/google/android/gms/measurement/internal/zzo;)V

    .line 28
    .line 29
    .line 30
    invoke-direct {p0}, Ll/hcy0;->g0()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catch_0
    move-exception v0

    .line 35
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ll/d6x0;->A()Ll/l8x0;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string v1, "Failed to send storage consent settings to the service"

    .line 44
    .line 45
    invoke-virtual {p0, v1, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final X()V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Ll/hcy0;->j0(Z)Lcom/google/android/gms/measurement/internal/zzo;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Ll/v1v0;->k()Ll/zvw0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Ll/zvw0;->B()V

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/fey0;

    .line 20
    .line 21
    invoke-direct {v1, p0, v0}, Ll/fey0;-><init>(Ll/hcy0;Lcom/google/android/gms/measurement/internal/zzo;)V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0, v1}, Ll/hcy0;->A(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final Y()V
    .locals 1
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/qcy0;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/qcy0;-><init>(Ll/hcy0;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, v0}, Ll/hcy0;->A(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final Z()V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, v0}, Ll/hcy0;->j0(Z)Lcom/google/android/gms/measurement/internal/zzo;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/zey0;

    .line 13
    .line 14
    invoke-direct {v1, p0, v0}, Ll/zey0;-><init>(Ll/hcy0;Lcom/google/android/gms/measurement/internal/zzo;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, v1}, Ll/hcy0;->A(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final bridge synthetic a()Ll/ajr0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->a()Ll/ajr0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final a0()Z
    .locals 0
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/hcy0;->d:Ll/isw0;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final bridge synthetic b()Ll/o7s0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->b()Ll/o7s0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final b0()Z
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/hcy0;->e0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/yyx0;->e()Ll/hny0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/hny0;->C0()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    const v0, 0x310c4

    .line 24
    .line 25
    .line 26
    if-lt p0, v0, :cond_1

    .line 27
    .line 28
    return v1

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public final bridge synthetic c()Ll/wxw0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->c()Ll/wxw0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final c0()Z
    .locals 3
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/hcy0;->e0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/yyx0;->e()Ll/hny0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/hny0;->C0()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    sget-object v0, Ll/whs0;->u0:Ll/zpw0;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-virtual {v0, v2}, Ll/zpw0;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ljava/lang/Integer;

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-lt p0, v0, :cond_1

    .line 37
    .line 38
    return v1

    .line 39
    :cond_1
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public final bridge synthetic d()Ll/ajx0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->d()Ll/ajx0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final d0()Z
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/hcy0;->e0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/yyx0;->e()Ll/hny0;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/hny0;->C0()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    const v0, 0x3ae30

    .line 24
    .line 25
    .line 26
    if-lt p0, v0, :cond_1

    .line 27
    .line 28
    return v1

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public final bridge synthetic e()Ll/hny0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->e()Ll/hny0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final e0()Z
    .locals 5
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/hcy0;->e:Ljava/lang/Boolean;

    .line 8
    .line 9
    if-nez v0, :cond_c

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/yyx0;->d()Ll/ajx0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/ajx0;->H()Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x1

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    goto/16 :goto_6

    .line 35
    .line 36
    :cond_0
    invoke-virtual {p0}, Ll/v1v0;->j()Lcom/google/android/gms/measurement/internal/c;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/c;->w()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    const/4 v3, 0x0

    .line 45
    if-ne v2, v1, :cond_1

    .line 46
    .line 47
    :goto_0
    move v0, v1

    .line 48
    goto/16 :goto_4

    .line 49
    .line 50
    :cond_1
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v2}, Ll/d6x0;->E()Ll/l8x0;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    const-string v4, "Checking service availability"

    .line 59
    .line 60
    invoke-virtual {v2, v4}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ll/yyx0;->e()Ll/hny0;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    const v4, 0xbdfcb8

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2, v4}, Ll/hny0;->o(I)I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    if-eqz v2, :cond_9

    .line 75
    .line 76
    if-eq v2, v1, :cond_8

    .line 77
    .line 78
    const/4 v4, 0x2

    .line 79
    if-eq v2, v4, :cond_5

    .line 80
    .line 81
    const/4 v0, 0x3

    .line 82
    if-eq v2, v0, :cond_4

    .line 83
    .line 84
    const/16 v0, 0x9

    .line 85
    .line 86
    if-eq v2, v0, :cond_3

    .line 87
    .line 88
    const/16 v0, 0x12

    .line 89
    .line 90
    if-eq v2, v0, :cond_2

    .line 91
    .line 92
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Ll/d6x0;->F()Ll/l8x0;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    const-string v1, "Unexpected service status"

    .line 101
    .line 102
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-virtual {v0, v1, v2}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    :goto_1
    move v0, v3

    .line 110
    move v1, v0

    .line 111
    goto/16 :goto_4

    .line 112
    .line 113
    :cond_2
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0}, Ll/d6x0;->F()Ll/l8x0;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    const-string v2, "Service updating"

    .line 122
    .line 123
    invoke-virtual {v0, v2}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_3
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0}, Ll/d6x0;->F()Ll/l8x0;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    const-string v1, "Service invalid"

    .line 136
    .line 137
    invoke-virtual {v0, v1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_4
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {v0}, Ll/d6x0;->F()Ll/l8x0;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    const-string v1, "Service disabled"

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_5
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    invoke-virtual {v2}, Ll/d6x0;->z()Ll/l8x0;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    const-string v4, "Service container out of date"

    .line 164
    .line 165
    invoke-virtual {v2, v4}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {p0}, Ll/yyx0;->e()Ll/hny0;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    invoke-virtual {v2}, Ll/hny0;->C0()I

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    const/16 v4, 0x4423

    .line 177
    .line 178
    if-ge v2, v4, :cond_6

    .line 179
    .line 180
    :goto_2
    move v0, v1

    .line 181
    move v1, v3

    .line 182
    goto :goto_4

    .line 183
    :cond_6
    if-nez v0, :cond_7

    .line 184
    .line 185
    goto :goto_3

    .line 186
    :cond_7
    move v1, v3

    .line 187
    :goto_3
    move v0, v3

    .line 188
    goto :goto_4

    .line 189
    :cond_8
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-virtual {v0}, Ll/d6x0;->E()Ll/l8x0;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    const-string v2, "Service missing"

    .line 198
    .line 199
    invoke-virtual {v0, v2}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    goto :goto_2

    .line 203
    :cond_9
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {v0}, Ll/d6x0;->E()Ll/l8x0;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    const-string v2, "Service available"

    .line 212
    .line 213
    invoke-virtual {v0, v2}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    goto/16 :goto_0

    .line 217
    .line 218
    :goto_4
    if-nez v1, :cond_a

    .line 219
    .line 220
    invoke-virtual {p0}, Ll/yyx0;->a()Ll/ajr0;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    invoke-virtual {v2}, Ll/ajr0;->R()Z

    .line 225
    .line 226
    .line 227
    move-result v2

    .line 228
    if-eqz v2, :cond_a

    .line 229
    .line 230
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    invoke-virtual {v0}, Ll/d6x0;->A()Ll/l8x0;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    const-string v2, "No way to upload. Consider using the full version of Analytics"

    .line 239
    .line 240
    invoke-virtual {v0, v2}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 241
    .line 242
    .line 243
    goto :goto_5

    .line 244
    :cond_a
    move v3, v0

    .line 245
    :goto_5
    if-eqz v3, :cond_b

    .line 246
    .line 247
    invoke-virtual {p0}, Ll/yyx0;->d()Ll/ajx0;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    invoke-virtual {v0, v1}, Ll/ajx0;->r(Z)V

    .line 252
    .line 253
    .line 254
    :cond_b
    :goto_6
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    iput-object v0, p0, Ll/hcy0;->e:Ljava/lang/Boolean;

    .line 259
    .line 260
    :cond_c
    iget-object p0, p0, Ll/hcy0;->e:Ljava/lang/Boolean;

    .line 261
    .line 262
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 263
    .line 264
    .line 265
    move-result p0

    .line 266
    return p0
.end method

.method public final bridge synthetic f()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final bridge synthetic g()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final bridge synthetic h()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final bridge synthetic i()Ll/n9s0;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->i()Ll/n9s0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final i0(Z)V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/ziy0;->a()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/yyx0;->a()Ll/ajr0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Ll/whs0;->Y0:Ll/zpw0;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    :cond_0
    if-eqz p1, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/v1v0;->k()Ll/zvw0;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ll/zvw0;->B()V

    .line 32
    .line 33
    .line 34
    :cond_1
    new-instance p1, Ll/ccy0;

    .line 35
    .line 36
    invoke-direct {p1, p0}, Ll/ccy0;-><init>(Ll/hcy0;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0, p1}, Ll/hcy0;->A(Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final bridge synthetic j()Lcom/google/android/gms/measurement/internal/c;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->j()Lcom/google/android/gms/measurement/internal/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final j0(Z)Lcom/google/android/gms/measurement/internal/zzo;
    .locals 1
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/v1v0;->j()Lcom/google/android/gms/measurement/internal/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/d6x0;->I()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    :goto_0
    invoke-virtual {v0, p0}, Lcom/google/android/gms/measurement/internal/c;->v(Ljava/lang/String;)Lcom/google/android/gms/measurement/internal/zzo;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final bridge synthetic k()Ll/zvw0;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->k()Ll/zvw0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic l()Lcom/google/android/gms/measurement/internal/g;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->l()Lcom/google/android/gms/measurement/internal/g;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic m()Ll/say0;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->m()Ll/say0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic n()Ll/hcy0;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->n()Ll/hcy0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic o()Ll/thy0;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/v1v0;->o()Ll/thy0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final u()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final w(Landroid/os/Bundle;)V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Ll/hcy0;->j0(Z)Lcom/google/android/gms/measurement/internal/zzo;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/uey0;

    .line 13
    .line 14
    invoke-direct {v1, p0, v0, p1}, Ll/uey0;-><init>(Ll/hcy0;Lcom/google/android/gms/measurement/internal/zzo;Landroid/os/Bundle;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, v1}, Ll/hcy0;->A(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final x(Lcom/google/android/gms/measurement/internal/zzae;)V
    .locals 8
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/v1v0;->k()Ll/zvw0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p1}, Ll/zvw0;->y(Lcom/google/android/gms/measurement/internal/zzae;)Z

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    new-instance v6, Lcom/google/android/gms/measurement/internal/zzae;

    .line 19
    .line 20
    invoke-direct {v6, p1}, Lcom/google/android/gms/measurement/internal/zzae;-><init>(Lcom/google/android/gms/measurement/internal/zzae;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    invoke-virtual {p0, v0}, Ll/hcy0;->j0(Z)Lcom/google/android/gms/measurement/internal/zzo;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    new-instance v1, Ll/nfy0;

    .line 29
    .line 30
    const/4 v3, 0x1

    .line 31
    move-object v2, p0

    .line 32
    move-object v7, p1

    .line 33
    invoke-direct/range {v1 .. v7}, Ll/nfy0;-><init>(Ll/hcy0;ZLcom/google/android/gms/measurement/internal/zzo;ZLcom/google/android/gms/measurement/internal/zzae;Lcom/google/android/gms/measurement/internal/zzae;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {v2, v1}, Ll/hcy0;->A(Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final y(Lcom/google/android/gms/measurement/internal/zzbf;Ljava/lang/String;)V
    .locals 8
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/v1v0;->k()Ll/zvw0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p1}, Ll/zvw0;->z(Lcom/google/android/gms/measurement/internal/zzbf;)Z

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p0, v0}, Ll/hcy0;->j0(Z)Lcom/google/android/gms/measurement/internal/zzo;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    new-instance v1, Ll/ffy0;

    .line 24
    .line 25
    const/4 v3, 0x1

    .line 26
    move-object v2, p0

    .line 27
    move-object v6, p1

    .line 28
    move-object v7, p2

    .line 29
    invoke-direct/range {v1 .. v7}, Ll/ffy0;-><init>(Ll/hcy0;ZLcom/google/android/gms/measurement/internal/zzo;ZLcom/google/android/gms/measurement/internal/zzbf;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-direct {v2, v1}, Ll/hcy0;->A(Ljava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final z(Lcom/google/android/gms/measurement/internal/zzon;)V
    .locals 3
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/kix0;->p()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/v1v0;->k()Ll/zvw0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Ll/zvw0;->A(Lcom/google/android/gms/measurement/internal/zzon;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {p0, v1}, Ll/hcy0;->j0(Z)Lcom/google/android/gms/measurement/internal/zzo;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    new-instance v2, Ll/ady0;

    .line 21
    .line 22
    invoke-direct {v2, p0, v1, v0, p1}, Ll/ady0;-><init>(Ll/hcy0;Lcom/google/android/gms/measurement/internal/zzo;ZLcom/google/android/gms/measurement/internal/zzon;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0, v2}, Ll/hcy0;->A(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final bridge synthetic zza()Landroid/content/Context;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->zza()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic zzb()Lcom/google/android/gms/common/util/Clock;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic zzd()Ll/zbr0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->zzd()Ll/zbr0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic zzj()Ll/d6x0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final bridge synthetic zzl()Ll/qsx0;
    .locals 0
    .annotation runtime Lorg/checkerframework/dataflow/qual/Pure;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/yyx0;->zzl()Ll/qsx0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
