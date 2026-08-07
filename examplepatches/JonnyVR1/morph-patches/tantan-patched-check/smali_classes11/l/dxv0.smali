.class public final Ll/dxv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ll/ebt0;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/util/concurrent/ScheduledExecutorService;

.field public final d:Ll/xvw0;

.field public final e:Ll/cbs0;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll/cbs0;Ll/ebt0;Ljava/util/concurrent/ScheduledExecutorService;Ll/xvw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dxv0;->b:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/dxv0;->e:Ll/cbs0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/dxv0;->a:Ll/ebt0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/dxv0;->c:Ljava/util/concurrent/ScheduledExecutorService;

    .line 11
    .line 12
    iput-object p5, p0, Ll/dxv0;->d:Ll/xvw0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final synthetic a(Ljava/lang/Exception;)Ll/exv0;
    .locals 1

    .line 1
    const-string v0, "AppSetIdInfoGmscoreSignal"

    .line 2
    .line 3
    iget-object p0, p0, Ll/dxv0;->a:Ll/ebt0;

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Ll/exv0;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    const/4 v0, -0x1

    .line 12
    invoke-direct {p0, p1, v0}, Ll/exv0;-><init>(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0x2b

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 5

    .line 1
    sget-object v0, Ll/sgs0;->C2:Ll/dgs0;

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
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    sget-object v0, Ll/sgs0;->H2:Ll/dgs0;

    .line 21
    .line 22
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-static {v1}, Ll/toi0;->f(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0, v1}, Ll/olw0;->a(Lcom/google/android/gms/tasks/Task;Ll/ig4;)Ll/hpr;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v1, p0, Ll/dxv0;->d:Ll/xvw0;

    .line 47
    .line 48
    sget-object v2, Ll/bxv0;->a:Ll/bxv0;

    .line 49
    .line 50
    invoke-static {v0, v2, v1}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sget-object v1, Ll/nis0;->a:Ll/kis0;

    .line 55
    .line 56
    invoke-virtual {v1}, Ll/kis0;->e()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    check-cast v1, Ljava/lang/Boolean;

    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_0

    .line 67
    .line 68
    sget-object v1, Ll/nis0;->b:Ll/kis0;

    .line 69
    .line 70
    invoke-virtual {v1}, Ll/kis0;->e()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    check-cast v1, Ljava/lang/Long;

    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 77
    .line 78
    .line 79
    move-result-wide v1

    .line 80
    iget-object v3, p0, Ll/dxv0;->c:Ljava/util/concurrent/ScheduledExecutorService;

    .line 81
    .line 82
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 83
    .line 84
    invoke-static {v0, v1, v2, v4, v3}, Ll/pvw0;->o(Ll/hpr;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Ll/hpr;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    :cond_0
    new-instance v1, Ll/cxv0;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/cxv0;-><init>(Ll/dxv0;)V

    .line 91
    .line 92
    .line 93
    iget-object p0, p0, Ll/dxv0;->d:Ll/xvw0;

    .line 94
    .line 95
    const-class v2, Ljava/lang/Exception;

    .line 96
    .line 97
    invoke-static {v0, v2, v1, p0}, Ll/pvw0;->e(Ll/hpr;Ljava/lang/Class;Ll/eow0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    return-object p0

    .line 102
    :cond_1
    new-instance p0, Ll/exv0;

    .line 103
    .line 104
    const/4 v0, -0x1

    .line 105
    invoke-direct {p0, v1, v0}, Ll/exv0;-><init>(Ljava/lang/String;I)V

    .line 106
    .line 107
    .line 108
    invoke-static {p0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    return-object p0
.end method
