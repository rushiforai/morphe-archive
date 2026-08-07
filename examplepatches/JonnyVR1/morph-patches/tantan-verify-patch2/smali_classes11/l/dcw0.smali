.class public final Ll/dcw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:Ll/hpr;

.field public final d:Ljava/util/List;

.field public final e:Ll/hpr;

.field public final synthetic f:Ll/ecw0;


# direct methods
.method public constructor <init>(Ll/ecw0;Ljava/lang/Object;Ljava/lang/String;Ll/hpr;Ljava/util/List;Ll/hpr;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dcw0;->f:Ll/ecw0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/dcw0;->a:Ljava/lang/Object;

    .line 7
    .line 8
    iput-object p3, p0, Ll/dcw0;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Ll/dcw0;->c:Ll/hpr;

    .line 11
    .line 12
    iput-object p5, p0, Ll/dcw0;->d:Ljava/util/List;

    .line 13
    .line 14
    iput-object p6, p0, Ll/dcw0;->e:Ll/hpr;

    .line 15
    .line 16
    return-void
.end method

.method public synthetic constructor <init>(Ll/ecw0;Ljava/lang/Object;Ljava/lang/String;Ll/hpr;Ljava/util/List;Ll/hpr;Ll/ccw0;)V
    .locals 0

    const/4 p3, 0x0

    .line 17
    invoke-direct/range {p0 .. p6}, Ll/dcw0;-><init>(Ll/ecw0;Ljava/lang/Object;Ljava/lang/String;Ll/hpr;Ljava/util/List;Ll/hpr;)V

    return-void
.end method


# virtual methods
.method public final a()Ll/mbw0;
    .locals 4

    .line 1
    new-instance v0, Ll/mbw0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/dcw0;->a:Ljava/lang/Object;

    .line 4
    .line 5
    iget-object v2, p0, Ll/dcw0;->b:Ljava/lang/String;

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    iget-object v2, p0, Ll/dcw0;->f:Ll/ecw0;

    .line 10
    .line 11
    invoke-virtual {v2, v1}, Ll/ecw0;->f(Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    :cond_0
    iget-object v3, p0, Ll/dcw0;->e:Ll/hpr;

    .line 16
    .line 17
    invoke-direct {v0, v1, v2, v3}, Ll/mbw0;-><init>(Ljava/lang/Object;Ljava/lang/String;Ll/hpr;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/dcw0;->f:Ll/ecw0;

    .line 21
    .line 22
    invoke-static {v1}, Ll/ecw0;->c(Ll/ecw0;)Ll/fcw0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-interface {v1, v0}, Ll/fcw0;->S(Ll/mbw0;)V

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/dcw0;->c:Ll/hpr;

    .line 30
    .line 31
    new-instance v2, Ll/acw0;

    .line 32
    .line 33
    invoke-direct {v2, p0, v0}, Ll/acw0;-><init>(Ll/dcw0;Ll/mbw0;)V

    .line 34
    .line 35
    .line 36
    sget-object v3, Ll/oct0;->f:Ll/xvw0;

    .line 37
    .line 38
    invoke-interface {v1, v2, v3}, Ll/hpr;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 39
    .line 40
    .line 41
    new-instance v1, Ll/bcw0;

    .line 42
    .line 43
    invoke-direct {v1, p0, v0}, Ll/bcw0;-><init>(Ll/dcw0;Ll/mbw0;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v1, v3}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V

    .line 47
    .line 48
    .line 49
    return-object v0
.end method

.method public final b(Ljava/lang/Object;)Ll/dcw0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dcw0;->f:Ll/ecw0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dcw0;->a()Ll/mbw0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p1, p0}, Ll/ecw0;->b(Ljava/lang/Object;Ll/hpr;)Ll/dcw0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final c(Ljava/lang/Class;Ll/xuw0;)Ll/dcw0;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/dcw0;->f:Ll/ecw0;

    .line 2
    .line 3
    new-instance v1, Ll/dcw0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/ecw0;->e(Ll/ecw0;)Ll/xvw0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v2, p0, Ll/dcw0;->e:Ll/hpr;

    .line 10
    .line 11
    invoke-static {v2, p1, p2, v0}, Ll/pvw0;->f(Ll/hpr;Ljava/lang/Class;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 12
    .line 13
    .line 14
    move-result-object v7

    .line 15
    iget-object v2, p0, Ll/dcw0;->f:Ll/ecw0;

    .line 16
    .line 17
    iget-object v3, p0, Ll/dcw0;->a:Ljava/lang/Object;

    .line 18
    .line 19
    iget-object v4, p0, Ll/dcw0;->b:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v5, p0, Ll/dcw0;->c:Ll/hpr;

    .line 22
    .line 23
    iget-object v6, p0, Ll/dcw0;->d:Ljava/util/List;

    .line 24
    .line 25
    invoke-direct/range {v1 .. v7}, Ll/dcw0;-><init>(Ll/ecw0;Ljava/lang/Object;Ljava/lang/String;Ll/hpr;Ljava/util/List;Ll/hpr;)V

    .line 26
    .line 27
    .line 28
    return-object v1
.end method

.method public final d(Ll/hpr;)Ll/dcw0;
    .locals 1

    .line 1
    new-instance v0, Ll/ubw0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/ubw0;-><init>(Ll/hpr;)V

    .line 4
    .line 5
    .line 6
    sget-object p1, Ll/oct0;->f:Ll/xvw0;

    .line 7
    .line 8
    invoke-virtual {p0, v0, p1}, Ll/dcw0;->g(Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/dcw0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final e(Ll/kbw0;)Ll/dcw0;
    .locals 1

    .line 1
    new-instance v0, Ll/tbw0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/tbw0;-><init>(Ll/kbw0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/dcw0;->f(Ll/xuw0;)Ll/dcw0;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final f(Ll/xuw0;)Ll/dcw0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dcw0;->f:Ll/ecw0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ecw0;->e(Ll/ecw0;)Ll/xvw0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, p1, v0}, Ll/dcw0;->g(Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/dcw0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final g(Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/dcw0;
    .locals 7

    .line 1
    new-instance v0, Ll/dcw0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/dcw0;->e:Ll/hpr;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget-object v1, p0, Ll/dcw0;->f:Ll/ecw0;

    .line 7
    .line 8
    move-object v3, v2

    .line 9
    iget-object v2, p0, Ll/dcw0;->a:Ljava/lang/Object;

    .line 10
    .line 11
    move-object v4, v3

    .line 12
    iget-object v3, p0, Ll/dcw0;->b:Ljava/lang/String;

    .line 13
    .line 14
    move-object v5, v4

    .line 15
    iget-object v4, p0, Ll/dcw0;->c:Ll/hpr;

    .line 16
    .line 17
    iget-object p0, p0, Ll/dcw0;->d:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {v5, p1, p2}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    move-object v5, p0

    .line 24
    invoke-direct/range {v0 .. v6}, Ll/dcw0;-><init>(Ll/ecw0;Ljava/lang/Object;Ljava/lang/String;Ll/hpr;Ljava/util/List;Ll/hpr;)V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method

.method public final h(Ljava/lang/String;)Ll/dcw0;
    .locals 7

    .line 1
    iget-object v4, p0, Ll/dcw0;->c:Ll/hpr;

    .line 2
    .line 3
    iget-object v5, p0, Ll/dcw0;->d:Ljava/util/List;

    .line 4
    .line 5
    iget-object v6, p0, Ll/dcw0;->e:Ll/hpr;

    .line 6
    .line 7
    new-instance v0, Ll/dcw0;

    .line 8
    .line 9
    iget-object v1, p0, Ll/dcw0;->f:Ll/ecw0;

    .line 10
    .line 11
    iget-object v2, p0, Ll/dcw0;->a:Ljava/lang/Object;

    .line 12
    .line 13
    move-object v3, p1

    .line 14
    invoke-direct/range {v0 .. v6}, Ll/dcw0;-><init>(Ll/ecw0;Ljava/lang/Object;Ljava/lang/String;Ll/hpr;Ljava/util/List;Ll/hpr;)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public final i(JLjava/util/concurrent/TimeUnit;)Ll/dcw0;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/dcw0;->f:Ll/ecw0;

    .line 2
    .line 3
    new-instance v1, Ll/dcw0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/ecw0;->g(Ll/ecw0;)Ljava/util/concurrent/ScheduledExecutorService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v2, p0, Ll/dcw0;->e:Ll/hpr;

    .line 10
    .line 11
    invoke-static {v2, p1, p2, p3, v0}, Ll/pvw0;->o(Ll/hpr;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Ll/hpr;

    .line 12
    .line 13
    .line 14
    move-result-object v7

    .line 15
    iget-object v2, p0, Ll/dcw0;->f:Ll/ecw0;

    .line 16
    .line 17
    iget-object v3, p0, Ll/dcw0;->a:Ljava/lang/Object;

    .line 18
    .line 19
    iget-object v4, p0, Ll/dcw0;->b:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v5, p0, Ll/dcw0;->c:Ll/hpr;

    .line 22
    .line 23
    iget-object v6, p0, Ll/dcw0;->d:Ljava/util/List;

    .line 24
    .line 25
    invoke-direct/range {v1 .. v7}, Ll/dcw0;-><init>(Ll/ecw0;Ljava/lang/Object;Ljava/lang/String;Ll/hpr;Ljava/util/List;Ll/hpr;)V

    .line 26
    .line 27
    .line 28
    return-object v1
.end method
