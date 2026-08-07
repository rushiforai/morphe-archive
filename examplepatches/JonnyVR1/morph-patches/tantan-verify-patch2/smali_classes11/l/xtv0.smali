.class public final Ll/xtv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ll/xvw0;

.field public final c:Ljava/util/concurrent/ScheduledExecutorService;

.field public final d:Landroid/content/Context;

.field public final e:Ll/o7w0;

.field public final f:Ll/dlt0;


# direct methods
.method public constructor <init>(Ll/xvw0;Ljava/util/concurrent/ScheduledExecutorService;Ljava/lang/String;Landroid/content/Context;Ll/o7w0;Ll/dlt0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xtv0;->b:Ll/xvw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/xtv0;->c:Ljava/util/concurrent/ScheduledExecutorService;

    .line 7
    .line 8
    iput-object p3, p0, Ll/xtv0;->a:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Ll/xtv0;->d:Landroid/content/Context;

    .line 11
    .line 12
    iput-object p5, p0, Ll/xtv0;->e:Ll/o7w0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/xtv0;->f:Ll/dlt0;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Ll/xtv0;)Ll/hpr;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/xtv0;->f:Ll/dlt0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dlt0;->t()Ll/hrw0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/q5u0;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/q5u0;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Ll/xtv0;->d:Landroid/content/Context;

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ll/q5u0;->e(Landroid/content/Context;)Ll/q5u0;

    .line 15
    .line 16
    .line 17
    new-instance v2, Ll/m7w0;

    .line 18
    .line 19
    invoke-direct {v2}, Ll/m7w0;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v3, "adUnitId"

    .line 23
    .line 24
    invoke-virtual {v2, v3}, Ll/m7w0;->J(Ljava/lang/String;)Ll/m7w0;

    .line 25
    .line 26
    .line 27
    iget-object v3, p0, Ll/xtv0;->e:Ll/o7w0;

    .line 28
    .line 29
    iget-object v3, v3, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 30
    .line 31
    invoke-virtual {v2, v3}, Ll/m7w0;->e(Lcom/google/android/gms/ads/internal/client/zzl;)Ll/m7w0;

    .line 32
    .line 33
    .line 34
    new-instance v3, Lcom/google/android/gms/ads/internal/client/zzq;

    .line 35
    .line 36
    invoke-direct {v3}, Lcom/google/android/gms/ads/internal/client/zzq;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2, v3}, Ll/m7w0;->I(Lcom/google/android/gms/ads/internal/client/zzq;)Ll/m7w0;

    .line 40
    .line 41
    .line 42
    const/4 v3, 0x1

    .line 43
    invoke-virtual {v2, v3}, Ll/m7w0;->O(Z)Ll/m7w0;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2}, Ll/m7w0;->g()Ll/o7w0;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v1, v2}, Ll/q5u0;->i(Ll/o7w0;)Ll/q5u0;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1}, Ll/q5u0;->j()Ll/s5u0;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-interface {v0, v1}, Ll/hrw0;->b(Ll/s5u0;)Ll/hrw0;

    .line 58
    .line 59
    .line 60
    new-instance v1, Ll/ndr0;

    .line 61
    .line 62
    invoke-direct {v1}, Ll/ndr0;-><init>()V

    .line 63
    .line 64
    .line 65
    iget-object v2, p0, Ll/xtv0;->a:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v1, v2}, Ll/ndr0;->a(Ljava/lang/String;)Ll/ndr0;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1}, Ll/ndr0;->b()Ll/kgr0;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-interface {v0, v1}, Ll/hrw0;->a(Ll/kgr0;)Ll/hrw0;

    .line 75
    .line 76
    .line 77
    new-instance v1, Ll/ldu0;

    .line 78
    .line 79
    invoke-direct {v1}, Ll/ldu0;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-interface {v0}, Ll/hrw0;->zzc()Ll/rix0;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Ll/rix0;->c()Ll/hpr;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-static {v0}, Ll/gvw0;->C(Ll/hpr;)Ll/gvw0;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    sget-object v1, Ll/sgs0;->g7:Ll/dgs0;

    .line 95
    .line 96
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    check-cast v1, Ljava/lang/Long;

    .line 105
    .line 106
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 107
    .line 108
    .line 109
    move-result-wide v1

    .line 110
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 111
    .line 112
    iget-object v4, p0, Ll/xtv0;->c:Ljava/util/concurrent/ScheduledExecutorService;

    .line 113
    .line 114
    invoke-static {v0, v1, v2, v3, v4}, Ll/pvw0;->o(Ll/hpr;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Ll/hpr;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    check-cast v0, Ll/gvw0;

    .line 119
    .line 120
    sget-object v1, Ll/utv0;->a:Ll/utv0;

    .line 121
    .line 122
    iget-object v2, p0, Ll/xtv0;->b:Ll/xvw0;

    .line 123
    .line 124
    invoke-static {v0, v1, v2}, Ll/pvw0;->m(Ll/hpr;Ll/eow0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    sget-object v1, Ll/vtv0;->a:Ll/vtv0;

    .line 129
    .line 130
    iget-object p0, p0, Ll/xtv0;->b:Ll/xvw0;

    .line 131
    .line 132
    const-class v2, Ljava/lang/Exception;

    .line 133
    .line 134
    invoke-static {v0, v2, v1, p0}, Ll/pvw0;->e(Ll/hpr;Ljava/lang/Class;Ll/eow0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    return-object p0
.end method


# virtual methods
.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0x21

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 2

    .line 1
    sget-object v0, Ll/sgs0;->f7:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/xtv0;->e:Ll/o7w0;

    .line 20
    .line 21
    iget-boolean v0, v0, Ll/o7w0;->q:Z

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    new-instance v0, Ll/wtv0;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/wtv0;-><init>(Ll/xtv0;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/xtv0;->b:Ll/xvw0;

    .line 32
    .line 33
    invoke-static {v0, p0}, Ll/pvw0;->k(Ll/wuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_1
    :goto_0
    new-instance p0, Ll/ytv0;

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-direct {p0, v0}, Ll/ytv0;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method
