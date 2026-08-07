.class public Ll/vod0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/u1n0;

.field public b:Ll/kcg0;

.field public c:Ll/kcg0;

.field public d:Ll/kcg0;

.field public e:Ll/kcg0;

.field public f:J

.field public g:J

.field public h:Z


# direct methods
.method public constructor <init>(Ll/u1n0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x2d

    .line 5
    .line 6
    iput-wide v0, p0, Ll/vod0;->g:J

    .line 7
    .line 8
    iput-object p1, p0, Ll/vod0;->a:Ll/u1n0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/vod0;->m()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-ltz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic b(Ll/vod0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vod0;->q(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic c(Ll/vod0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vod0;->n()V

    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Ll/vod0;Lcom/p1/mobile/putong/core/data/HeartBeat;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vod0;->o(Lcom/p1/mobile/putong/core/data/HeartBeat;)V

    return-void
.end method

.method public static synthetic f(Ll/vod0;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vod0;->j(I)V

    return-void
.end method

.method public static synthetic g(Ll/vod0;Ll/t54;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vod0;->r(Ll/t54;)V

    return-void
.end method

.method public static synthetic h(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i(Ll/vod0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vod0;->p(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public final j(I)V
    .locals 7

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-eq p1, v0, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-static {}, Ll/jpd0;->c()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    invoke-static {}, Ll/jpd0;->d()V

    .line 14
    .line 15
    .line 16
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->l7:I

    .line 17
    .line 18
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    iget-object p1, p0, Ll/vod0;->a:Ll/u1n0;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/u1n0;->f()Ll/azm0;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object v5, p1, Ll/azm0;->h:Ljava/lang/String;

    .line 29
    .line 30
    iget-object p1, p0, Ll/vod0;->a:Ll/u1n0;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/u1n0;->o()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    iget-object v0, p0, Ll/vod0;->a:Ll/u1n0;

    .line 37
    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/u1n0;->f()Ll/azm0;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object p1, p1, Ll/azm0;->g:Ljava/lang/String;

    .line 45
    .line 46
    :goto_0
    move-object v6, p1

    .line 47
    goto :goto_1

    .line 48
    :cond_2
    invoke-virtual {v0}, Ll/u1n0;->f()Ll/azm0;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget-object p1, p1, Ll/azm0;->f:Ljava/lang/String;

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :goto_1
    iget-object p1, p0, Ll/vod0;->a:Ll/u1n0;

    .line 56
    .line 57
    invoke-virtual {p1}, Ll/u1n0;->f()Ll/azm0;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget-object v1, p1, Ll/azm0;->i:Ljava/lang/String;

    .line 62
    .line 63
    iget-object p1, p0, Ll/vod0;->a:Ll/u1n0;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/u1n0;->f()Ll/azm0;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iget-object v3, p1, Ll/azm0;->k:Ljava/lang/String;

    .line 70
    .line 71
    iget-object p1, p0, Ll/vod0;->a:Ll/u1n0;

    .line 72
    .line 73
    invoke-virtual {p1}, Ll/u1n0;->f()Ll/azm0;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget-object v4, p1, Ll/azm0;->j:Ljava/lang/String;

    .line 78
    .line 79
    iget-object p1, p0, Ll/vod0;->a:Ll/u1n0;

    .line 80
    .line 81
    invoke-virtual {p1}, Ll/u1n0;->f()Ll/azm0;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iget-object v2, p1, Ll/azm0;->l:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/vod0;->t()V

    .line 88
    .line 89
    .line 90
    invoke-static {}, Ll/uqx;->C()Ll/uqx;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual/range {v0 .. v6}, Ll/uqx;->K(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    const/4 p1, 0x1

    .line 98
    iput-boolean p1, p0, Ll/vod0;->h:Z

    .line 99
    .line 100
    return-void

    .line 101
    :cond_3
    invoke-virtual {p0}, Ll/vod0;->s()V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public final k(Z)V
    .locals 4

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vod0;->l()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-object p1, p0, Ll/vod0;->a:Ll/u1n0;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/u1n0;->j()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iget-wide v2, p0, Ll/vod0;->f:J

    .line 14
    .line 15
    sub-long/2addr v0, v2

    .line 16
    iget-wide v2, p0, Ll/vod0;->g:J

    .line 17
    .line 18
    cmp-long p1, v0, v2

    .line 19
    .line 20
    if-ltz p1, :cond_1

    .line 21
    .line 22
    iget-object p1, p0, Ll/vod0;->a:Ll/u1n0;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/u1n0;->j()J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    iput-wide v0, p0, Ll/vod0;->f:J

    .line 29
    .line 30
    const-wide/16 v0, 0x2d

    .line 31
    .line 32
    iput-wide v0, p0, Ll/vod0;->g:J

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/vod0;->l()V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public final l()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->R0:Ll/rnb;

    .line 4
    .line 5
    iget-object v1, p0, Ll/vod0;->a:Ll/u1n0;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/u1n0;->l()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {}, Ll/uqx;->C()Ll/uqx;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Ll/uqx;->B()J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v0, v1, v2}, Ll/rnb;->o3(Ljava/lang/String;Ljava/lang/Long;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/sod0;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/sod0;-><init>(Ll/vod0;)V

    .line 30
    .line 31
    .line 32
    new-instance v2, Ll/tod0;

    .line 33
    .line 34
    invoke-direct {v2, p0}, Ll/tod0;-><init>(Ll/vod0;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final m()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vod0;->a:Ll/u1n0;

    .line 2
    .line 3
    new-instance v1, Ll/lod0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/lod0;-><init>(Ll/vod0;)V

    .line 6
    .line 7
    .line 8
    const-string v2, "rtcHelper"

    .line 9
    .line 10
    invoke-virtual {v0, v2, v1}, Ll/u1n0;->t(Ljava/lang/String;Ll/y20;)Ll/kcg0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/vod0;->b:Ll/kcg0;

    .line 15
    .line 16
    return-void
.end method

.method public final synthetic n()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Ll/vod0;->a:Ll/u1n0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/u1n0;->l()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic o(Lcom/p1/mobile/putong/core/data/HeartBeat;)V
    .locals 3

    .line 1
    iget p1, p1, Lcom/p1/mobile/putong/core/data/HeartBeat;->interval:I

    .line 2
    .line 3
    if-lez p1, :cond_0

    .line 4
    .line 5
    int-to-long v0, p1

    .line 6
    iput-wide v0, p0, Ll/vod0;->g:J

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const-wide/16 v0, 0x2d

    .line 10
    .line 11
    iput-wide v0, p0, Ll/vod0;->g:J

    .line 12
    .line 13
    :goto_0
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 14
    .line 15
    new-instance v0, Ll/uod0;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/uod0;-><init>(Ll/vod0;)V

    .line 18
    .line 19
    .line 20
    const-wide/16 v1, 0x3e8

    .line 21
    .line 22
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic p(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x2d

    .line 2
    .line 3
    iput-wide v0, p0, Ll/vod0;->g:J

    .line 4
    .line 5
    return-void
.end method

.method public final synthetic q(Ljava/lang/Long;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vod0;->a:Ll/u1n0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-virtual {v0, v1, v2}, Ll/u1n0;->v(J)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p1}, Ll/vod0;->k(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic r(Ll/t54;)V
    .locals 2

    .line 1
    sget-object v0, Ll/t54;->f:Ll/t54;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    iput-wide v0, p0, Ll/vod0;->f:J

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-virtual {p0, p1}, Ll/vod0;->k(Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    sget-object p0, Ll/t54;->c:Ll/t54;

    .line 15
    .line 16
    if-ne p1, p0, :cond_1

    .line 17
    .line 18
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 19
    .line 20
    invoke-static {p0}, Ll/f5y;->b(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    sget-object p0, Ll/t54;->g:Ll/t54;

    .line 25
    .line 26
    if-ne p1, p0, :cond_2

    .line 27
    .line 28
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 29
    .line 30
    sget-object p1, Ll/f5y;->b:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {p0, p1}, Ll/f5y;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    return-void
.end method

.method public s()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/vod0;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/vod0;->h:Z

    .line 7
    .line 8
    invoke-static {}, Ll/uqx;->C()Ll/uqx;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1, v0}, Ll/uqx;->S(I)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/uqx;->C()Ll/uqx;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/uqx;->V()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/vod0;->d:Ll/kcg0;

    .line 23
    .line 24
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/vod0;->e:Ll/kcg0;

    .line 28
    .line 29
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/vod0;->c:Ll/kcg0;

    .line 33
    .line 34
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final t()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/vod0;->d:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/uqx;->C()Ll/uqx;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v0, v0, Ll/uqx;->l:Lrx/subjects/a;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v2, Ll/mod0;

    .line 18
    .line 19
    invoke-direct {v2}, Ll/mod0;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v2, Ll/nod0;

    .line 27
    .line 28
    invoke-direct {v2, p0}, Ll/nod0;-><init>(Ll/vod0;)V

    .line 29
    .line 30
    .line 31
    new-instance v3, Ll/ood0;

    .line 32
    .line 33
    invoke-direct {v3}, Ll/ood0;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Ll/vod0;->d:Ll/kcg0;

    .line 45
    .line 46
    iget-object v0, p0, Ll/vod0;->e:Ll/kcg0;

    .line 47
    .line 48
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 49
    .line 50
    .line 51
    invoke-static {}, Ll/uqx;->C()Ll/uqx;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/uqx;->v()Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v2, Ll/pod0;

    .line 60
    .line 61
    invoke-direct {v2, p0}, Ll/pod0;-><init>(Ll/vod0;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iput-object v0, p0, Ll/vod0;->e:Ll/kcg0;

    .line 73
    .line 74
    iget-object v0, p0, Ll/vod0;->c:Ll/kcg0;

    .line 75
    .line 76
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 77
    .line 78
    .line 79
    invoke-static {}, Ll/uqx;->C()Ll/uqx;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Ll/uqx;->v()Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v1, p0, Ll/vod0;->a:Ll/u1n0;

    .line 92
    .line 93
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    new-instance v2, Ll/qod0;

    .line 97
    .line 98
    invoke-direct {v2, v1}, Ll/qod0;-><init>(Ll/u1n0;)V

    .line 99
    .line 100
    .line 101
    new-instance v1, Ll/rod0;

    .line 102
    .line 103
    invoke-direct {v1}, Ll/rod0;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-static {v2, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iput-object v0, p0, Ll/vod0;->c:Ll/kcg0;

    .line 115
    .line 116
    return-void
.end method
