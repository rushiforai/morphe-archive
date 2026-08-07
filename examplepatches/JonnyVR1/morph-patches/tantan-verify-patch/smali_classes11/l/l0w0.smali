.class public final Ll/l0w0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ll/ebt0;

.field public final b:Z

.field public final c:Z

.field public final d:Ljava/util/concurrent/ScheduledExecutorService;

.field public final e:Ll/xvw0;

.field public final f:Ljava/lang/String;

.field public final g:Ll/tat0;


# direct methods
.method public constructor <init>(Ll/ebt0;ZZLl/tat0;Ll/xvw0;Ljava/lang/String;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/l0w0;->a:Ll/ebt0;

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/l0w0;->b:Z

    .line 7
    .line 8
    iput-boolean p3, p0, Ll/l0w0;->c:Z

    .line 9
    .line 10
    iput-object p4, p0, Ll/l0w0;->g:Ll/tat0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/l0w0;->e:Ll/xvw0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/l0w0;->f:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p7, p0, Ll/l0w0;->d:Ljava/util/concurrent/ScheduledExecutorService;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final synthetic a(Ljava/lang/Exception;)Ll/m0w0;
    .locals 1

    .line 1
    const-string v0, "TrustlessTokenSignal"

    .line 2
    .line 3
    iget-object p0, p0, Ll/l0w0;->a:Ll/ebt0;

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0x32

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 5

    .line 1
    sget-object v0, Ll/sgs0;->h7:Ll/dgs0;

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
    iget-boolean v0, p0, Ll/l0w0;->c:Z

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-static {v1}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_1
    :goto_0
    iget-boolean v0, p0, Ll/l0w0;->b:Z

    .line 31
    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    invoke-static {v1}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_2
    invoke-static {v1}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v1, p0, Ll/l0w0;->e:Ll/xvw0;

    .line 44
    .line 45
    sget-object v2, Ll/j0w0;->a:Ll/j0w0;

    .line 46
    .line 47
    invoke-static {v0, v2, v1}, Ll/pvw0;->m(Ll/hpr;Ll/eow0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sget-object v1, Ll/vjs0;->c:Ll/kis0;

    .line 52
    .line 53
    invoke-virtual {v1}, Ll/kis0;->e()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Ljava/lang/Long;

    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 60
    .line 61
    .line 62
    move-result-wide v1

    .line 63
    iget-object v3, p0, Ll/l0w0;->d:Ljava/util/concurrent/ScheduledExecutorService;

    .line 64
    .line 65
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 66
    .line 67
    invoke-static {v0, v1, v2, v4, v3}, Ll/pvw0;->o(Ll/hpr;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Ll/hpr;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    new-instance v1, Ll/k0w0;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/k0w0;-><init>(Ll/l0w0;)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Ll/l0w0;->e:Ll/xvw0;

    .line 77
    .line 78
    const-class v2, Ljava/lang/Exception;

    .line 79
    .line 80
    invoke-static {v0, v2, v1, p0}, Ll/pvw0;->e(Ll/hpr;Ljava/lang/Class;Ll/eow0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    return-object p0
.end method
