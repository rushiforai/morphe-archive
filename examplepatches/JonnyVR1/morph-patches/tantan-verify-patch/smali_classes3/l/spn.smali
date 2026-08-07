.class public Ll/spn;
.super Ll/ar2;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/api/c0$c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/gqn;",
        ">;",
        "Lcom/p1/mobile/putong/core/api/c0$c;"
    }
.end annotation


# instance fields
.field public a:Z

.field public b:Ll/ubo;

.field public final c:Ljava/lang/String;

.field public d:Lcom/p1/mobile/putong/location/Location;

.field public e:Z

.field public f:Z

.field public g:J

.field public h:J

.field public i:I


# direct methods
.method public constructor <init>(Ll/ner;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "hide_and_seek_timer"

    .line 5
    .line 6
    iput-object p1, p0, Ll/spn;->c:Ljava/lang/String;

    .line 7
    .line 8
    const-wide/16 p1, 0x1

    .line 9
    .line 10
    iput-wide p1, p0, Ll/spn;->g:J

    .line 11
    .line 12
    return-void
.end method

.method private synthetic I0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setConvertActivityFromTranslucentEnable(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p1, Ll/gqn;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/gqn;->r()V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast p1, Ll/gqn;

    .line 19
    .line 20
    new-instance v0, Ll/spn$a;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/spn$a;-><init>(Ll/spn;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ll/gqn;->i(Ll/hyl$a;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/spn;->x0()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic e0(Ll/spn;Lcom/p1/mobile/putong/core/data/HideAndSeekInfoEnv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/spn;->H0(Lcom/p1/mobile/putong/core/data/HideAndSeekInfoEnv;)V

    return-void
.end method

.method public static synthetic f0(Ll/spn;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/spn;->L0(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic g0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h0(Landroid/util/Pair;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/lang/Boolean;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic i0(Ll/spn;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/spn;->D0()V

    return-void
.end method

.method public static synthetic j0(Ll/spn;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/spn;->I0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic k0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l0(Ll/spn;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/spn;->F0()V

    return-void
.end method

.method public static synthetic m0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n0(Ll/spn;Lcom/p1/mobile/putong/core/data/HideAndSeekPushEnv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/spn;->C0(Lcom/p1/mobile/putong/core/data/HideAndSeekPushEnv;)V

    return-void
.end method

.method public static synthetic o0(Ll/spn;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/spn;->E0()V

    return-void
.end method

.method public static synthetic p0(Ll/spn;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/spn;->J0()V

    return-void
.end method

.method public static synthetic q0(Ll/spn;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/spn;->G0()V

    return-void
.end method

.method public static synthetic r0(Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic s0(Ll/spn;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic t0(Ll/spn;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public A0()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic C0(Lcom/p1/mobile/putong/core/data/HideAndSeekPushEnv;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekPushEnv;->data:Lcom/p1/mobile/putong/core/data/HideAndSeekPushData;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekPushEnv;->data:Lcom/p1/mobile/putong/core/data/HideAndSeekPushData;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/HideAndSeekPushData;->gameStage:Lcom/p1/mobile/putong/core/data/GameStage;

    .line 12
    .line 13
    const-string v1, "end"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/spn;->z0()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast p0, Ll/gqn;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekPushEnv;->data:Lcom/p1/mobile/putong/core/data/HideAndSeekPushData;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/gqn;->j(Lcom/p1/mobile/putong/core/data/HideAndSeekPushData;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic D0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/spn;->e:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic E0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/spn;->f:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic F0()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x2

    .line 2
    .line 3
    iput-wide v0, p0, Ll/spn;->g:J

    .line 4
    .line 5
    iget-wide v0, p0, Ll/spn;->h:J

    .line 6
    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/spn;->O0(Ljava/lang/Long;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic G0()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x3

    .line 2
    .line 3
    iput-wide v0, p0, Ll/spn;->g:J

    .line 4
    .line 5
    iget-wide v0, p0, Ll/spn;->h:J

    .line 6
    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/spn;->O0(Ljava/lang/Long;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic H0(Lcom/p1/mobile/putong/core/data/HideAndSeekInfoEnv;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/gqn;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HideAndSeekInfoEnv;->data:Lcom/p1/mobile/putong/core/data/HideAndSeekInfoData;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/gqn;->z(Lcom/p1/mobile/putong/core/data/HideAndSeekInfoData;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic J0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/gqn;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gqn;->x()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic L0(Landroid/util/Pair;)V
    .locals 0

    .line 1
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/location/Location;

    .line 4
    .line 5
    iput-object p1, p0, Ll/spn;->d:Lcom/p1/mobile/putong/location/Location;

    .line 6
    .line 7
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Ll/gqn;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/gqn;->k(Lcom/p1/mobile/putong/location/Location;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public N0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/spn;->b:Ll/ubo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/ubo;

    .line 7
    .line 8
    invoke-direct {v0}, Ll/ubo;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/spn;->b:Ll/ubo;

    .line 12
    .line 13
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast v0, Ll/gqn;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/gqn;->p()Ll/hyl;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Ll/hyl;->E3()Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/epn;

    .line 26
    .line 27
    invoke-direct {v1}, Ll/epn;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v1, p0, Ll/spn;->b:Ll/ubo;

    .line 35
    .line 36
    invoke-virtual {v1}, Ll/ubo;->i()Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    new-instance v2, Ll/fpn;

    .line 41
    .line 42
    invoke-direct {v2}, Ll/fpn;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/gpn;

    .line 54
    .line 55
    invoke-direct {v1}, Ll/gpn;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/hpn;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/hpn;-><init>(Ll/spn;)V

    .line 65
    .line 66
    .line 67
    new-instance v2, Ll/ipn;

    .line 68
    .line 69
    invoke-direct {v2}, Ll/ipn;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Ll/spn;->b:Ll/ubo;

    .line 80
    .line 81
    invoke-virtual {p0}, Ll/ubo;->k()V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public O0(Ljava/lang/Long;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    cmp-long v0, v0, v2

    .line 10
    .line 11
    if-gez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iput-wide v0, p0, Ll/spn;->h:J

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/spn;->N0()V

    .line 21
    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 26
    .line 27
    const-string v1, "hide_and_seek_timer"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Lcom/p1/mobile/putong/core/api/c0$a;

    .line 33
    .line 34
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/c0$a;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/c0$a;->g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const/4 v2, 0x1

    .line 42
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/c0$a;->a(Z)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const-wide/16 v2, 0x1

    .line 47
    .line 48
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/core/api/c0$a;->h(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 53
    .line 54
    .line 55
    move-result-wide v2

    .line 56
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/core/api/c0$a;->f(J)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/c0$a;->d(Lcom/p1/mobile/putong/core/api/c0$c;)Lcom/p1/mobile/putong/core/api/c0$a;

    .line 61
    .line 62
    .line 63
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/c0;->r(Lcom/p1/mobile/putong/core/api/c0$a;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    new-instance v0, Ll/dpn;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/dpn;-><init>(Ll/spn;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/jpn;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/jpn;-><init>(Ll/spn;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/spn;->b:Ll/ubo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ubo;->n()V

    .line 6
    .line 7
    .line 8
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 11
    .line 12
    const-string v0, "hide_and_seek_timer"

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public u(Ljava/lang/String;JJJJ)V
    .locals 0

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide p1

    .line 5
    sub-long/2addr p6, p1

    .line 6
    const-wide/16 p1, 0x1f4

    .line 7
    .line 8
    cmp-long p1, p6, p1

    .line 9
    .line 10
    if-lez p1, :cond_2

    .line 11
    .line 12
    iget-object p1, p0, Ll/spn;->d:Lcom/p1/mobile/putong/location/Location;

    .line 13
    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    iget p1, p0, Ll/spn;->i:I

    .line 17
    .line 18
    add-int/lit8 p1, p1, 0x1

    .line 19
    .line 20
    iput p1, p0, Ll/spn;->i:I

    .line 21
    .line 22
    const/4 p2, 0x5

    .line 23
    if-le p1, p2, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Ll/spn;->b:Ll/ubo;

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ubo;->m()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void

    .line 33
    :cond_1
    const/4 p2, 0x0

    .line 34
    iput p2, p0, Ll/spn;->i:I

    .line 35
    .line 36
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->d2:Ll/a39;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 41
    .line 42
    .line 43
    move-result-wide p3

    .line 44
    invoke-static {p3, p4}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iget-object p3, p0, Ll/spn;->d:Lcom/p1/mobile/putong/location/Location;

    .line 49
    .line 50
    invoke-virtual {p3}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 51
    .line 52
    .line 53
    move-result-wide p3

    .line 54
    invoke-static {p3, p4}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    invoke-virtual {p2, p1, p3}, Ll/a39;->n3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    new-instance p2, Ll/kpn;

    .line 67
    .line 68
    invoke-direct {p2, p0}, Ll/kpn;-><init>(Ll/spn;)V

    .line 69
    .line 70
    .line 71
    new-instance p0, Ll/lpn;

    .line 72
    .line 73
    invoke-direct {p0}, Ll/lpn;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_2
    invoke-virtual {p0}, Ll/spn;->z0()V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public u0()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/mpn;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/mpn;-><init>(Ll/spn;)V

    .line 4
    .line 5
    .line 6
    const-string v1, "\u73a9\u5bb6\u968f\u673a\u79fb\u52a8"

    .line 7
    .line 8
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/npn;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/npn;-><init>(Ll/spn;)V

    .line 15
    .line 16
    .line 17
    const-string v2, "\u5730\u7406\u504f\u79fb\u4fee\u6b63"

    .line 18
    .line 19
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    new-instance v2, Ll/opn;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Ll/opn;-><init>(Ll/spn;)V

    .line 26
    .line 27
    .line 28
    const-string v3, "\u5237\u65b0\u65f6\u95f42s"

    .line 29
    .line 30
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    new-instance v3, Ll/ppn;

    .line 35
    .line 36
    invoke-direct {v3, p0}, Ll/ppn;-><init>(Ll/spn;)V

    .line 37
    .line 38
    .line 39
    const-string p0, "\u5237\u65b0\u65f6\u95f43s"

    .line 40
    .line 41
    invoke-static {p0, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    filled-new-array {v0, v1, v2, p0}, [Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0
.end method

.method public final x0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->d2:Ll/a39;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/a39;->m3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/qpn;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/qpn;-><init>(Ll/spn;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ll/rpn;

    .line 19
    .line 20
    invoke-direct {p0}, Ll/rpn;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public y0()Lcom/p1/mobile/putong/location/Location;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/spn;->d:Lcom/p1/mobile/putong/location/Location;

    .line 2
    .line 3
    return-object p0
.end method

.method public z0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/spn;->x0()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->t1:Lcom/p1/mobile/putong/core/api/c0;

    .line 7
    .line 8
    const-string v1, "hide_and_seek_timer"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/c0;->u(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/spn;->b:Ll/ubo;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/ubo;->n()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
