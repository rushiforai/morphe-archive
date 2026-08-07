.class public final Ll/znu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/j7u0;


# instance fields
.field public final a:Ll/ulu0;

.field public final b:Ll/zlu0;

.field public final c:Ljava/util/concurrent/Executor;

.field public final d:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>(Ll/ulu0;Ll/zlu0;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/znu0;->a:Ll/ulu0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/znu0;->b:Ll/zlu0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/znu0;->c:Ljava/util/concurrent/Executor;

    .line 9
    .line 10
    iput-object p4, p0, Ll/znu0;->d:Ljava/util/concurrent/Executor;

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic b(Ll/znu0;Ll/wit0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/znu0;->c(Ll/wit0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/znu0;->b:Ll/zlu0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/zlu0;->d()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object v0, p0, Ll/znu0;->a:Ll/ulu0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/ulu0;->h0()Ll/hfw0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/ulu0;->j0()Ll/hpr;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    sget-object v0, Ll/sgs0;->a5:Ll/dgs0;

    .line 25
    .line 26
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v2, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ljava/lang/Boolean;

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-object v0, p0, Ll/znu0;->a:Ll/ulu0;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/ulu0;->j0()Ll/hpr;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0}, Ll/ulu0;->c0()Ll/tct0;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    if-eqz v1, :cond_4

    .line 53
    .line 54
    if-eqz v0, :cond_4

    .line 55
    .line 56
    const/4 v2, 0x2

    .line 57
    new-array v2, v2, [Ll/hpr;

    .line 58
    .line 59
    const/4 v3, 0x0

    .line 60
    aput-object v1, v2, v3

    .line 61
    .line 62
    const/4 v1, 0x1

    .line 63
    aput-object v0, v2, v1

    .line 64
    .line 65
    invoke-static {v2}, Ll/pvw0;->l([Ll/hpr;)Ll/hpr;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Ll/ynu0;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/ynu0;-><init>(Ll/znu0;)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Ll/znu0;->d:Ljava/util/concurrent/Executor;

    .line 75
    .line 76
    invoke-static {v0, v1, p0}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    if-eqz v1, :cond_4

    .line 81
    .line 82
    iget-object v0, p0, Ll/znu0;->a:Ll/ulu0;

    .line 83
    .line 84
    invoke-virtual {v0}, Ll/ulu0;->e0()Ll/wit0;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v0}, Ll/ulu0;->f0()Ll/wit0;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    if-eqz v1, :cond_2

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    if-eqz v0, :cond_3

    .line 96
    .line 97
    move-object v1, v0

    .line 98
    goto :goto_0

    .line 99
    :cond_3
    const/4 v1, 0x0

    .line 100
    :goto_0
    if-eqz v1, :cond_4

    .line 101
    .line 102
    invoke-virtual {p0, v1}, Ll/znu0;->c(Ll/wit0;)V

    .line 103
    .line 104
    .line 105
    :cond_4
    :goto_1
    return-void
.end method

.method public final c(Ll/wit0;)V
    .locals 1

    .line 1
    new-instance v0, Ll/xnu0;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/xnu0;-><init>(Ll/wit0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/znu0;->c:Ljava/util/concurrent/Executor;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
