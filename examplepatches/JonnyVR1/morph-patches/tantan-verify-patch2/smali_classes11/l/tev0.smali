.class public final Ll/tev0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcv0;


# instance fields
.field public final a:Ll/zxt0;

.field public final b:Ll/vdv0;

.field public final c:Ll/xvw0;

.field public final d:Ll/k6u0;

.field public final e:Ljava/util/concurrent/ScheduledExecutorService;

.field public final f:Ll/swu0;


# direct methods
.method public constructor <init>(Ll/zxt0;Ll/vdv0;Ll/k6u0;Ljava/util/concurrent/ScheduledExecutorService;Ll/xvw0;Ll/swu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/tev0;->a:Ll/zxt0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/tev0;->b:Ll/vdv0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/tev0;->d:Ll/k6u0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/tev0;->e:Ljava/util/concurrent/ScheduledExecutorService;

    .line 11
    .line 12
    iput-object p5, p0, Ll/tev0;->c:Ll/xvw0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/tev0;->f:Ll/swu0;

    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic d(Ll/tev0;)Ll/zxt0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tev0;->a:Ll/zxt0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic e(Ll/tev0;)Ll/k6u0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tev0;->d:Ll/k6u0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final a(Ll/b7w0;Ll/q6w0;)Z
    .locals 6

    .line 1
    iget-object v0, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/y6w0;->a:Ll/o7w0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/o7w0;->a()Ll/ins0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/tev0;->b:Ll/vdv0;

    .line 10
    .line 11
    invoke-virtual {v1, p1, p2}, Ll/vdv0;->a(Ll/b7w0;Ll/q6w0;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    sget-object p2, Ll/sgs0;->qb:Ll/dgs0;

    .line 16
    .line 17
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1, p2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    check-cast p2, Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    const/4 v1, 0x1

    .line 32
    if-eqz p2, :cond_2

    .line 33
    .line 34
    iget-object p2, p0, Ll/tev0;->f:Ll/swu0;

    .line 35
    .line 36
    const-string v2, "0"

    .line 37
    .line 38
    const-string v3, "1"

    .line 39
    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    move-object v4, v3

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    move-object v4, v2

    .line 45
    :goto_0
    invoke-virtual {p2}, Ll/swu0;->a()Ljava/util/Map;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    const-string v5, "has_dbl"

    .line 50
    .line 51
    invoke-interface {p2, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/tev0;->f:Ll/swu0;

    .line 55
    .line 56
    if-eq v1, p1, :cond_1

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    move-object v2, v3

    .line 60
    :goto_1
    invoke-virtual {p0}, Ll/swu0;->a()Ljava/util/Map;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const-string p2, "crdb"

    .line 65
    .line 66
    invoke-interface {p0, p2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    :cond_2
    if-eqz v0, :cond_3

    .line 70
    .line 71
    if-eqz p1, :cond_3

    .line 72
    .line 73
    return v1

    .line 74
    :cond_3
    const/4 p0, 0x0

    .line 75
    return p0
.end method

.method public final b(Ll/b7w0;Ll/q6w0;)Ll/hpr;
    .locals 1

    .line 1
    new-instance v0, Ll/rev0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/rev0;-><init>(Ll/tev0;Ll/b7w0;Ll/q6w0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/tev0;->c:Ll/xvw0;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final synthetic c(Ll/b7w0;Ll/q6w0;)Ll/uwt0;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/a0u0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p1, p2, v1}, Ll/a0u0;-><init>(Ll/b7w0;Ll/q6w0;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    new-instance v1, Ll/myt0;

    .line 8
    .line 9
    iget-object v2, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 10
    .line 11
    iget-object v2, v2, Ll/y6w0;->a:Ll/o7w0;

    .line 12
    .line 13
    invoke-virtual {v2}, Ll/o7w0;->a()Ll/ins0;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    new-instance v3, Ll/qev0;

    .line 18
    .line 19
    invoke-direct {v3, p0, p1, p2}, Ll/qev0;-><init>(Ll/tev0;Ll/b7w0;Ll/q6w0;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {v1, v2, v3}, Ll/myt0;-><init>(Ll/ins0;Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/tev0;->a:Ll/zxt0;

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1}, Ll/zxt0;->b(Ll/a0u0;Ll/myt0;)Ll/lyt0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-interface {p0}, Ll/lyt0;->zza()Ll/uwt0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public final synthetic f(Ll/b7w0;Ll/q6w0;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tev0;->b:Ll/vdv0;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/vdv0;->b(Ll/b7w0;Ll/q6w0;)Ll/hpr;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget p2, p2, Ll/q6w0;->S:I

    .line 8
    .line 9
    int-to-long v0, p2

    .line 10
    sget-object p2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 11
    .line 12
    iget-object v2, p0, Ll/tev0;->e:Ljava/util/concurrent/ScheduledExecutorService;

    .line 13
    .line 14
    invoke-static {p1, v0, v1, p2, v2}, Ll/pvw0;->o(Ll/hpr;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Ll/hpr;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance p2, Ll/sev0;

    .line 19
    .line 20
    invoke-direct {p2, p0}, Ll/sev0;-><init>(Ll/tev0;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/tev0;->c:Ll/xvw0;

    .line 24
    .line 25
    invoke-static {p1, p2, p0}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
