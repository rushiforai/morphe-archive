.class public final Ll/k4s0;
.super Ll/x5s0;
.source "SourceFile"


# instance fields
.field public final i:Landroid/app/Activity;

.field public final j:Landroid/view/View;


# direct methods
.method public constructor <init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;IILandroid/view/View;Landroid/app/Activity;)V
    .locals 0

    .line 1
    const-string p3, "FdxRYG9/HOndmgVdj1eVgDulreHUGSjsWl31nKn2TzY="

    .line 2
    .line 3
    const/16 p6, 0x3e

    .line 4
    .line 5
    const-string p2, "sA157cQy3kuoY6/Q8khf6XMDmxSzcYyzmkuwKzX0O8QIfXTfkmyj/S2OF9jehLNc"

    .line 6
    .line 7
    invoke-direct/range {p0 .. p6}, Ll/x5s0;-><init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;II)V

    .line 8
    .line 9
    .line 10
    iput-object p7, p0, Ll/k4s0;->j:Landroid/view/View;

    .line 11
    .line 12
    iput-object p8, p0, Ll/k4s0;->i:Landroid/app/Activity;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/k4s0;->j:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v0, Ll/sgs0;->u2:Ll/dgs0;

    .line 7
    .line 8
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iget-object v2, p0, Ll/x5s0;->f:Ljava/lang/reflect/Method;

    .line 23
    .line 24
    iget-object v3, p0, Ll/k4s0;->j:Landroid/view/View;

    .line 25
    .line 26
    iget-object v4, p0, Ll/k4s0;->i:Landroid/app/Activity;

    .line 27
    .line 28
    filled-new-array {v3, v4, v0}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v3, 0x0

    .line 33
    invoke-virtual {v2, v3, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, [Ljava/lang/Object;

    .line 38
    .line 39
    iget-object v2, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 40
    .line 41
    monitor-enter v2

    .line 42
    :try_start_0
    iget-object v3, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 43
    .line 44
    const/4 v4, 0x0

    .line 45
    aget-object v4, v0, v4

    .line 46
    .line 47
    check-cast v4, Ljava/lang/Long;

    .line 48
    .line 49
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 50
    .line 51
    .line 52
    move-result-wide v4

    .line 53
    invoke-virtual {v3, v4, v5}, Ll/fzr0;->d0(J)Ll/fzr0;

    .line 54
    .line 55
    .line 56
    iget-object v3, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 57
    .line 58
    const/4 v4, 0x1

    .line 59
    aget-object v4, v0, v4

    .line 60
    .line 61
    check-cast v4, Ljava/lang/Long;

    .line 62
    .line 63
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 64
    .line 65
    .line 66
    move-result-wide v4

    .line 67
    invoke-virtual {v3, v4, v5}, Ll/fzr0;->f0(J)Ll/fzr0;

    .line 68
    .line 69
    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    iget-object p0, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 73
    .line 74
    const/4 v1, 0x2

    .line 75
    aget-object v0, v0, v1

    .line 76
    .line 77
    check-cast v0, Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Ll/fzr0;->e0(Ljava/lang/String;)Ll/fzr0;

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :catchall_0
    move-exception p0

    .line 84
    goto :goto_1

    .line 85
    :cond_1
    :goto_0
    monitor-exit v2

    .line 86
    return-void

    .line 87
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    throw p0
.end method
