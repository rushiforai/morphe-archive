.class public final Ll/z7w0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/q6w0;

.field public final b:Ll/t6w0;

.field public final c:Ll/fbv0;

.field public final d:Ll/yew0;

.field public final e:Ll/cew0;

.field public final f:Ll/dut0;


# direct methods
.method public constructor <init>(Ll/fbv0;Ll/yew0;Ll/q6w0;Ll/t6w0;Ll/dut0;Ll/cew0;)V
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/z7w0;->a:Ll/q6w0;

    .line 5
    .line 6
    iput-object p4, p0, Ll/z7w0;->b:Ll/t6w0;

    .line 7
    .line 8
    iput-object p1, p0, Ll/z7w0;->c:Ll/fbv0;

    .line 9
    .line 10
    iput-object p2, p0, Ll/z7w0;->d:Ll/yew0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/z7w0;->f:Ll/dut0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/z7w0;->e:Ll/cew0;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a(Ljava/util/List;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/String;

    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    invoke-virtual {p0, v0, v1}, Ll/z7w0;->b(Ljava/lang/String;I)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void
.end method

.method public final b(Ljava/lang/String;I)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/z7w0;->a:Ll/q6w0;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/q6w0;->j0:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Ll/z7w0;->d:Ll/yew0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/z7w0;->e:Ll/cew0;

    .line 10
    .line 11
    invoke-virtual {p2, p1, p0}, Ll/yew0;->c(Ljava/lang/String;Ll/cew0;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    new-instance v0, Ll/hbv0;

    .line 16
    .line 17
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    iget-object v3, p0, Ll/z7w0;->b:Ll/t6w0;

    .line 26
    .line 27
    iget-object v3, v3, Ll/t6w0;->b:Ljava/lang/String;

    .line 28
    .line 29
    move-object v4, p1

    .line 30
    move v5, p2

    .line 31
    invoke-direct/range {v0 .. v5}, Ll/hbv0;-><init>(JLjava/lang/String;Ljava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/z7w0;->c:Ll/fbv0;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/fbv0;->g(Ll/hbv0;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final c(Ljava/util/List;I)V
    .locals 3

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/String;

    .line 16
    .line 17
    sget-object v1, Ll/sgs0;->L9:Ll/dgs0;

    .line 18
    .line 19
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-static {v0}, Ll/dut0;->h(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    iget-object v1, p0, Ll/z7w0;->f:Ll/dut0;

    .line 42
    .line 43
    invoke-static {}, Ll/k6s0;->e()Ljava/util/Random;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v1, v0, v2}, Ll/dut0;->b(Ljava/lang/String;Ljava/util/Random;)Ll/hpr;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    goto :goto_1

    .line 52
    :cond_0
    invoke-static {v0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    :goto_1
    new-instance v1, Ll/y7w0;

    .line 57
    .line 58
    invoke-direct {v1, p0, p2}, Ll/y7w0;-><init>(Ll/z7w0;I)V

    .line 59
    .line 60
    .line 61
    sget-object v2, Ll/oct0;->a:Ll/xvw0;

    .line 62
    .line 63
    invoke-static {v0, v1, v2}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    return-void
.end method
