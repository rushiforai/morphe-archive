.class public final Ll/l5s0;
.super Ll/x5s0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;II)V
    .locals 0

    .line 1
    const-string p3, "XE2927Ta6gTWmjrPmk4in7GLLwsXJnqTbhVN3N+/b3M="

    .line 2
    .line 3
    const/4 p6, 0x3

    .line 4
    const-string p2, "hvOzu3pRF2dcNdvDy8db1rttL97bOQyvLLd+NabZhD5sRaprNsAQL2vdtDd+eY16"

    .line 5
    .line 6
    invoke-direct/range {p0 .. p6}, Ll/x5s0;-><init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 1
    sget-object v0, Ll/sgs0;->A2:Ll/dgs0;

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
    iget-object v1, p0, Ll/x5s0;->f:Ljava/lang/reflect/Method;

    .line 17
    .line 18
    iget-object v2, p0, Ll/x5s0;->b:Ll/b4s0;

    .line 19
    .line 20
    invoke-virtual {v2}, Ll/b4s0;->b()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    filled-new-array {v2, v0}, [Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-virtual {v1, v2, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ljava/lang/String;

    .line 34
    .line 35
    new-instance v1, Ll/a3s0;

    .line 36
    .line 37
    invoke-direct {v1, v0}, Ll/a3s0;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 41
    .line 42
    monitor-enter v0

    .line 43
    :try_start_0
    iget-object v2, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 44
    .line 45
    iget-wide v3, v1, Ll/a3s0;->a:J

    .line 46
    .line 47
    invoke-virtual {v2, v3, v4}, Ll/fzr0;->k0(J)Ll/fzr0;

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 51
    .line 52
    iget-wide v1, v1, Ll/a3s0;->b:J

    .line 53
    .line 54
    invoke-virtual {p0, v1, v2}, Ll/fzr0;->s(J)Ll/fzr0;

    .line 55
    .line 56
    .line 57
    monitor-exit v0

    .line 58
    return-void

    .line 59
    :catchall_0
    move-exception p0

    .line 60
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    throw p0
.end method
