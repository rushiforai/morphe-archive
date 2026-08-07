.class public final Ll/thy0;
.super Ll/kix0;
.source "SourceFile"


# instance fields
.field public c:Landroid/os/Handler;

.field public d:Z

.field public final e:Ll/riy0;

.field public final f:Ll/liy0;

.field public final g:Ll/iiy0;


# direct methods
.method public constructor <init>(Ll/atx0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kix0;-><init>(Ll/atx0;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Ll/thy0;->d:Z

    .line 6
    .line 7
    new-instance p1, Ll/riy0;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Ll/riy0;-><init>(Ll/thy0;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Ll/thy0;->e:Ll/riy0;

    .line 13
    .line 14
    new-instance p1, Ll/liy0;

    .line 15
    .line 16
    invoke-direct {p1, p0}, Ll/liy0;-><init>(Ll/thy0;)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Ll/thy0;->f:Ll/liy0;

    .line 20
    .line 21
    new-instance p1, Ll/iiy0;

    .line 22
    .line 23
    invoke-direct {p1, p0}, Ll/iiy0;-><init>(Ll/thy0;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Ll/thy0;->g:Ll/iiy0;

    .line 27
    .line 28
    return-void
.end method

.method public static synthetic B(Ll/thy0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/thy0;->A()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic C(Ll/thy0;J)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/thy0;->A()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/d6x0;->E()Ll/l8x0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "Activity resumed, time"

    .line 16
    .line 17
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v0, v1, v2}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/yyx0;->a()Ll/ajr0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Ll/whs0;->P0:Ll/zpw0;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/yyx0;->a()Ll/ajr0;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/ajr0;->P()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_0

    .line 45
    .line 46
    iget-boolean v0, p0, Ll/thy0;->d:Z

    .line 47
    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    :cond_0
    iget-object v0, p0, Ll/thy0;->f:Ll/liy0;

    .line 51
    .line 52
    invoke-virtual {v0, p1, p2}, Ll/liy0;->f(J)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    invoke-virtual {p0}, Ll/yyx0;->a()Ll/ajr0;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ll/ajr0;->P()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_2

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/yyx0;->d()Ll/ajx0;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-object v0, v0, Ll/ajx0;->u:Ll/dhx0;

    .line 71
    .line 72
    invoke-virtual {v0}, Ll/dhx0;->b()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_3

    .line 77
    .line 78
    :cond_2
    iget-object v0, p0, Ll/thy0;->f:Ll/liy0;

    .line 79
    .line 80
    invoke-virtual {v0, p1, p2}, Ll/liy0;->f(J)V

    .line 81
    .line 82
    .line 83
    :cond_3
    :goto_0
    iget-object p1, p0, Ll/thy0;->g:Ll/iiy0;

    .line 84
    .line 85
    invoke-virtual {p1}, Ll/iiy0;->a()V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Ll/thy0;->e:Ll/riy0;

    .line 89
    .line 90
    iget-object p1, p0, Ll/riy0;->a:Ll/thy0;

    .line 91
    .line 92
    invoke-virtual {p1}, Ll/yyx0;->h()V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Ll/riy0;->a:Ll/thy0;

    .line 96
    .line 97
    iget-object p1, p1, Ll/yyx0;->a:Ll/atx0;

    .line 98
    .line 99
    invoke-virtual {p1}, Ll/atx0;->k()Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-eqz p1, :cond_4

    .line 104
    .line 105
    iget-object p1, p0, Ll/riy0;->a:Ll/thy0;

    .line 106
    .line 107
    invoke-virtual {p1}, Ll/yyx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 112
    .line 113
    .line 114
    move-result-wide p1

    .line 115
    const/4 v0, 0x0

    .line 116
    invoke-virtual {p0, p1, p2, v0}, Ll/riy0;->b(JZ)V

    .line 117
    .line 118
    .line 119
    :cond_4
    return-void
.end method

.method public static bridge synthetic v(Ll/thy0;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/thy0;->c:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic w(Ll/thy0;J)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/thy0;->A()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/d6x0;->E()Ll/l8x0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "Activity paused, time"

    .line 16
    .line 17
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v0, v1, v2}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/thy0;->g:Ll/iiy0;

    .line 25
    .line 26
    invoke-virtual {v0, p1, p2}, Ll/iiy0;->b(J)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/yyx0;->a()Ll/ajr0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ll/ajr0;->P()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    iget-object p0, p0, Ll/thy0;->f:Ll/liy0;

    .line 40
    .line 41
    invoke-virtual {p0, p1, p2}, Ll/liy0;->e(J)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method


# virtual methods
.method public final A()V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/thy0;->c:Landroid/os/Handler;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ll/beu0;

    .line 9
    .line 10
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-direct {v0, v1}, Ll/beu0;-><init>(Landroid/os/Looper;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/thy0;->c:Landroid/os/Handler;

    .line 18
    .line 19
    :cond_0
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

.method public final x(Z)V
    .locals 0
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/thy0;->d:Z

    .line 5
    .line 6
    return-void
.end method

.method public final y(ZZJ)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/thy0;->f:Ll/liy0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/liy0;->d(ZZJ)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final z()Z
    .locals 0
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/yyx0;->h()V

    .line 2
    .line 3
    .line 4
    iget-boolean p0, p0, Ll/thy0;->d:Z

    .line 5
    .line 6
    return p0
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
