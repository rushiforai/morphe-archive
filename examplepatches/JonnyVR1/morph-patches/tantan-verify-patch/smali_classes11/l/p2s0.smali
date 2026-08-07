.class public final Ll/p2s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/q2s0;


# direct methods
.method public constructor <init>(Ll/q2s0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/p2s0;->a:Ll/q2s0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/p2s0;->a:Ll/q2s0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/q2s0;->b:Ljava/lang/Boolean;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-static {}, Ll/q2s0;->a()Landroid/os/ConditionVariable;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    monitor-enter v0

    .line 13
    :try_start_0
    iget-object v1, p0, Ll/p2s0;->a:Ll/q2s0;

    .line 14
    .line 15
    iget-object v1, v1, Ll/q2s0;->b:Ljava/lang/Boolean;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_2

    .line 23
    :cond_1
    const/4 v1, 0x0

    .line 24
    :try_start_1
    sget-object v2, Ll/sgs0;->q2:Ll/kis0;

    .line 25
    .line 26
    invoke-virtual {v2}, Ll/kis0;->e()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result v2
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move v2, v1

    .line 38
    :goto_0
    if-eqz v2, :cond_2

    .line 39
    .line 40
    :try_start_2
    iget-object v3, p0, Ll/p2s0;->a:Ll/q2s0;

    .line 41
    .line 42
    invoke-static {v3}, Ll/q2s0;->b(Ll/q2s0;)Ll/b4s0;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    iget-object v3, v3, Ll/b4s0;->a:Landroid/content/Context;

    .line 47
    .line 48
    const-string v4, "ADSHIELD"

    .line 49
    .line 50
    const/4 v5, 0x0

    .line 51
    invoke-static {v3, v4, v5}, Ll/xjw0;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ll/xjw0;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    sput-object v3, Ll/q2s0;->d:Ll/xjw0;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 56
    .line 57
    :cond_2
    move v1, v2

    .line 58
    :catchall_1
    :try_start_3
    iget-object p0, p0, Ll/p2s0;->a:Ll/q2s0;

    .line 59
    .line 60
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iput-object v1, p0, Ll/q2s0;->b:Ljava/lang/Boolean;

    .line 65
    .line 66
    invoke-static {}, Ll/q2s0;->a()Landroid/os/ConditionVariable;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Landroid/os/ConditionVariable;->open()V

    .line 71
    .line 72
    .line 73
    monitor-exit v0

    .line 74
    :goto_1
    return-void

    .line 75
    :goto_2
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 76
    throw p0
.end method
