.class public final Ll/rvv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ll/grw0;

.field public final b:Landroid/content/Context;

.field public final c:Ll/xvw0;

.field public final d:Ljava/util/concurrent/ScheduledExecutorService;

.field public final e:Ll/ncv0;

.field public final f:Ll/o7w0;


# direct methods
.method public constructor <init>(Ll/grw0;Landroid/content/Context;Ll/xvw0;Ljava/util/concurrent/ScheduledExecutorService;Ll/ncv0;Ll/o7w0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rvv0;->a:Ll/grw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/rvv0;->b:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Ll/rvv0;->c:Ll/xvw0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/rvv0;->d:Ljava/util/concurrent/ScheduledExecutorService;

    .line 11
    .line 12
    iput-object p5, p0, Ll/rvv0;->e:Ll/ncv0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/rvv0;->f:Ll/o7w0;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final synthetic a(Ljava/lang/Throwable;)Ll/hpr;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rvv0;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w2t0;->c(Landroid/content/Context;)Ll/y2t0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "TopicsSignal.fetchTopicsSignal"

    .line 8
    .line 9
    invoke-interface {p0, p1, v0}, Ll/y2t0;->b(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    instance-of p0, p1, Ljava/lang/SecurityException;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    const-string v1, ""

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    new-instance p0, Ll/tvv0;

    .line 20
    .line 21
    const/4 p1, 0x2

    .line 22
    invoke-direct {p0, v1, p1, v0}, Ll/tvv0;-><init>(Ljava/lang/String;ILl/svv0;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    instance-of p0, p1, Ljava/lang/IllegalStateException;

    .line 27
    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    new-instance p0, Ll/tvv0;

    .line 31
    .line 32
    const/4 p1, 0x3

    .line 33
    invoke-direct {p0, v1, p1, v0}, Ll/tvv0;-><init>(Ljava/lang/String;ILl/svv0;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    instance-of p0, p1, Ljava/lang/IllegalArgumentException;

    .line 38
    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    new-instance p0, Ll/tvv0;

    .line 42
    .line 43
    const/4 p1, 0x4

    .line 44
    invoke-direct {p0, v1, p1, v0}, Ll/tvv0;-><init>(Ljava/lang/String;ILl/svv0;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    instance-of p0, p1, Ljava/util/concurrent/TimeoutException;

    .line 49
    .line 50
    if-eqz p0, :cond_3

    .line 51
    .line 52
    new-instance p0, Ll/tvv0;

    .line 53
    .line 54
    const/4 p1, 0x5

    .line 55
    invoke-direct {p0, v1, p1, v0}, Ll/tvv0;-><init>(Ljava/lang/String;ILl/svv0;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    new-instance p0, Ll/tvv0;

    .line 60
    .line 61
    const/4 p1, 0x0

    .line 62
    invoke-direct {p0, v1, p1, v0}, Ll/tvv0;-><init>(Ljava/lang/String;ILl/svv0;)V

    .line 63
    .line 64
    .line 65
    :goto_0
    invoke-static {p0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0
.end method

.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0x38

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 5

    .line 1
    sget-object v0, Ll/sgs0;->U9:Ll/dgs0;

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
    iget-object v0, p0, Ll/rvv0;->a:Ll/grw0;

    .line 20
    .line 21
    invoke-interface {v0}, Ll/grw0;->n()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    sget-object v0, Ll/sgs0;->X9:Ll/dgs0;

    .line 28
    .line 29
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljava/lang/Boolean;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    iget-object v0, p0, Ll/rvv0;->f:Ll/o7w0;

    .line 46
    .line 47
    sget-object v1, Lcom/google/android/gms/ads/RequestConfiguration$PublisherPrivacyPersonalizationState;->DISABLED:Lcom/google/android/gms/ads/RequestConfiguration$PublisherPrivacyPersonalizationState;

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/google/android/gms/ads/RequestConfiguration$PublisherPrivacyPersonalizationState;->getValue()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    iget-object v0, v0, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 54
    .line 55
    iget v0, v0, Lcom/google/android/gms/ads/internal/client/zzl;->zzy:I

    .line 56
    .line 57
    if-eq v0, v1, :cond_1

    .line 58
    .line 59
    :cond_0
    iget-object v0, p0, Ll/rvv0;->e:Ll/ncv0;

    .line 60
    .line 61
    const/4 v1, 0x0

    .line 62
    invoke-virtual {v0, v1}, Ll/ncv0;->a(Z)Ll/hpr;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sget-object v1, Ll/sgs0;->V9:Ll/dgs0;

    .line 67
    .line 68
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Ljava/lang/Integer;

    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    int-to-long v1, v1

    .line 83
    iget-object v3, p0, Ll/rvv0;->d:Ljava/util/concurrent/ScheduledExecutorService;

    .line 84
    .line 85
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 86
    .line 87
    invoke-static {v0, v1, v2, v4, v3}, Ll/pvw0;->o(Ll/hpr;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Ll/hpr;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-static {v0}, Ll/gvw0;->C(Ll/hpr;)Ll/gvw0;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iget-object v1, p0, Ll/rvv0;->c:Ll/xvw0;

    .line 96
    .line 97
    sget-object v2, Ll/pvv0;->a:Ll/pvv0;

    .line 98
    .line 99
    invoke-static {v0, v2, v1}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    new-instance v1, Ll/qvv0;

    .line 104
    .line 105
    invoke-direct {v1, p0}, Ll/qvv0;-><init>(Ll/rvv0;)V

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Ll/rvv0;->c:Ll/xvw0;

    .line 109
    .line 110
    const-class v2, Ljava/lang/Throwable;

    .line 111
    .line 112
    invoke-static {v0, v2, v1, p0}, Ll/pvw0;->f(Ll/hpr;Ljava/lang/Class;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    return-object p0

    .line 117
    :cond_1
    new-instance p0, Ll/tvv0;

    .line 118
    .line 119
    const/4 v0, -0x1

    .line 120
    const/4 v1, 0x0

    .line 121
    const-string v2, ""

    .line 122
    .line 123
    invoke-direct {p0, v2, v0, v1}, Ll/tvv0;-><init>(Ljava/lang/String;ILl/svv0;)V

    .line 124
    .line 125
    .line 126
    invoke-static {p0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    return-object p0
.end method
