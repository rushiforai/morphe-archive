.class public final Ll/xvv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ljava/util/concurrent/ScheduledExecutorService;

.field public final c:Ljava/util/concurrent/Executor;

.field public final d:I

.field public final e:Z

.field public final f:Z

.field public final g:Ll/vat0;


# direct methods
.method public constructor <init>(Ll/vat0;Landroid/content/Context;Ljava/util/concurrent/ScheduledExecutorService;Ljava/util/concurrent/Executor;IZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xvv0;->g:Ll/vat0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/xvv0;->a:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Ll/xvv0;->b:Ljava/util/concurrent/ScheduledExecutorService;

    .line 9
    .line 10
    iput-object p4, p0, Ll/xvv0;->c:Ljava/util/concurrent/Executor;

    .line 11
    .line 12
    iput p5, p0, Ll/xvv0;->d:I

    .line 13
    .line 14
    iput-boolean p6, p0, Ll/xvv0;->e:Z

    .line 15
    .line 16
    iput-boolean p7, p0, Ll/xvv0;->f:Z

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final synthetic a(Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$a;)Ll/yvv0;
    .locals 7

    .line 1
    new-instance v0, Ll/glw0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/glw0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Ll/xvv0;->e:Z

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    sget-object v1, Ll/sgs0;->R2:Ll/dgs0;

    .line 11
    .line 12
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_1

    .line 27
    .line 28
    :cond_0
    iget-boolean v1, p0, Ll/xvv0;->e:Z

    .line 29
    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    sget-object v1, Ll/sgs0;->S2:Ll/dgs0;

    .line 33
    .line 34
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Ljava/lang/Boolean;

    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_2

    .line 49
    .line 50
    :cond_1
    :try_start_0
    iget-object v0, p0, Ll/xvv0;->a:Landroid/content/Context;

    .line 51
    .line 52
    invoke-static {v0}, Ll/klw0;->k(Landroid/content/Context;)Ll/klw0;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$a;->a()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/xvv0;->a:Landroid/content/Context;

    .line 67
    .line 68
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    sget-object v0, Ll/sgs0;->Y2:Ll/dgs0;

    .line 73
    .line 74
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    invoke-virtual {v4, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Ljava/lang/Long;

    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 85
    .line 86
    .line 87
    move-result-wide v4

    .line 88
    iget-boolean v6, p0, Ll/xvv0;->f:Z

    .line 89
    .line 90
    invoke-virtual/range {v1 .. v6}, Ll/klw0;->j(Ljava/lang/String;Ljava/lang/String;JZ)Ll/glw0;

    .line 91
    .line 92
    .line 93
    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    goto :goto_2

    .line 95
    :catch_0
    move-exception v0

    .line 96
    :goto_0
    move-object p0, v0

    .line 97
    goto :goto_1

    .line 98
    :catch_1
    move-exception v0

    .line 99
    goto :goto_0

    .line 100
    :goto_1
    const-string v0, "AdIdInfoSignalSource.getPaidV1"

    .line 101
    .line 102
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {v1, p0, v0}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    new-instance v0, Ll/glw0;

    .line 110
    .line 111
    invoke-direct {v0}, Ll/glw0;-><init>()V

    .line 112
    .line 113
    .line 114
    :cond_2
    :goto_2
    new-instance p0, Ll/yvv0;

    .line 115
    .line 116
    const/4 v1, 0x0

    .line 117
    invoke-direct {p0, p1, v1, v0}, Ll/yvv0;-><init>(Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$a;Ljava/lang/String;Ll/glw0;)V

    .line 118
    .line 119
    .line 120
    return-object p0
.end method

.method public final synthetic b(Ljava/lang/Throwable;)Ll/yvv0;
    .locals 2

    .line 1
    invoke-static {}, Ll/k6s0;->b()Ll/obt0;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/xvv0;->a:Landroid/content/Context;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 p1, 0x0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    move-object p0, p1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string v0, "android_id"

    .line 16
    .line 17
    invoke-static {p0, v0}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :goto_0
    new-instance v0, Ll/yvv0;

    .line 22
    .line 23
    new-instance v1, Ll/glw0;

    .line 24
    .line 25
    invoke-direct {v1}, Ll/glw0;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-direct {v0, p1, p0, v1}, Ll/yvv0;-><init>(Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$a;Ljava/lang/String;Ll/glw0;)V

    .line 29
    .line 30
    .line 31
    return-object v0
.end method

.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0x28

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 5

    .line 1
    sget-object v0, Ll/sgs0;->U0:Ll/dgs0;

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
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/xvv0;->g:Ll/vat0;

    .line 20
    .line 21
    iget-object v1, p0, Ll/xvv0;->a:Landroid/content/Context;

    .line 22
    .line 23
    iget v2, p0, Ll/xvv0;->d:I

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Ll/vat0;->a(Landroid/content/Context;I)Ll/hpr;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Ll/gvw0;->C(Ll/hpr;)Ll/gvw0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/vvv0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/vvv0;-><init>(Ll/xvv0;)V

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Ll/xvv0;->c:Ljava/util/concurrent/Executor;

    .line 39
    .line 40
    invoke-static {v0, v1, v2}, Ll/pvw0;->m(Ll/hpr;Ll/eow0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sget-object v1, Ll/sgs0;->V0:Ll/dgs0;

    .line 45
    .line 46
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Ljava/lang/Long;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 57
    .line 58
    .line 59
    move-result-wide v1

    .line 60
    iget-object v3, p0, Ll/xvv0;->b:Ljava/util/concurrent/ScheduledExecutorService;

    .line 61
    .line 62
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 63
    .line 64
    invoke-static {v0, v1, v2, v4, v3}, Ll/pvw0;->o(Ll/hpr;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Ll/hpr;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Ll/gvw0;

    .line 69
    .line 70
    new-instance v1, Ll/wvv0;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/wvv0;-><init>(Ll/xvv0;)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Ll/xvv0;->c:Ljava/util/concurrent/Executor;

    .line 76
    .line 77
    const-class v2, Ljava/lang/Throwable;

    .line 78
    .line 79
    invoke-static {v0, v2, v1, p0}, Ll/pvw0;->e(Ll/hpr;Ljava/lang/Class;Ll/eow0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    return-object p0

    .line 84
    :cond_0
    new-instance p0, Ljava/lang/Exception;

    .line 85
    .line 86
    const-string v0, "Did not ad Ad ID into query param."

    .line 87
    .line 88
    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-static {p0}, Ll/pvw0;->g(Ljava/lang/Throwable;)Ll/hpr;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0
.end method
