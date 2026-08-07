.class public final Ll/iiy0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/fiy0;

.field public final synthetic b:Ll/thy0;


# direct methods
.method public constructor <init>(Ll/thy0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/iiy0;->b:Ll/thy0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/iiy0;->b:Ll/thy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/yyx0;->h()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/iiy0;->a:Ll/fiy0;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/iiy0;->b:Ll/thy0;

    .line 11
    .line 12
    invoke-static {v0}, Ll/thy0;->v(Ll/thy0;)Landroid/os/Handler;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/iiy0;->a:Ll/fiy0;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Ll/iiy0;->b:Ll/thy0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/yyx0;->d()Ll/ajx0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Ll/ajx0;->u:Ll/dhx0;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-virtual {v0, v1}, Ll/dhx0;->a(Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/iiy0;->b:Ll/thy0;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/thy0;->x(Z)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/iiy0;->b:Ll/thy0;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/yyx0;->a()Ll/ajr0;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sget-object v1, Ll/whs0;->M0:Ll/zpw0;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    iget-object v0, p0, Ll/iiy0;->b:Ll/thy0;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/v1v0;->l()Lcom/google/android/gms/measurement/internal/g;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/g;->D0()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    iget-object v0, p0, Ll/iiy0;->b:Ll/thy0;

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Ll/d6x0;->E()Ll/l8x0;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    const-string v1, "Retrying trigger URI registration in foreground"

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Ll/iiy0;->b:Ll/thy0;

    .line 80
    .line 81
    invoke-virtual {p0}, Ll/v1v0;->l()Lcom/google/android/gms/measurement/internal/g;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/g;->B0()V

    .line 86
    .line 87
    .line 88
    :cond_1
    return-void
.end method

.method public final b(J)V
    .locals 6
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    new-instance v0, Ll/fiy0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/iiy0;->b:Ll/thy0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/yyx0;->zzb()Lcom/google/android/gms/common/util/Clock;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    move-object v1, p0

    .line 14
    move-wide v4, p1

    .line 15
    invoke-direct/range {v0 .. v5}, Ll/fiy0;-><init>(Ll/iiy0;JJ)V

    .line 16
    .line 17
    .line 18
    iput-object v0, v1, Ll/iiy0;->a:Ll/fiy0;

    .line 19
    .line 20
    iget-object p0, v1, Ll/iiy0;->b:Ll/thy0;

    .line 21
    .line 22
    invoke-static {p0}, Ll/thy0;->v(Ll/thy0;)Landroid/os/Handler;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    iget-object p1, v1, Ll/iiy0;->a:Ll/fiy0;

    .line 27
    .line 28
    const-wide/16 v0, 0x7d0

    .line 29
    .line 30
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 31
    .line 32
    .line 33
    return-void
.end method
