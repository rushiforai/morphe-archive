.class public final Ll/i5s0;
.super Ll/x5s0;
.source "SourceFile"


# instance fields
.field public final i:Ll/y2s0;

.field public final j:J

.field public final k:J


# direct methods
.method public constructor <init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;IILl/y2s0;JJ)V
    .locals 0

    .line 1
    const-string p3, "tJ+SvALjKnpAv9FF8u56pKKRS55/vzUDe+m9ct97Lx4="

    .line 2
    .line 3
    const/16 p6, 0xb

    .line 4
    .line 5
    const-string p2, "ChMYhePBDqkXl5DeRTg9cgSXXNPVEcIqgEVciYHEVlkZyx/HkVQXSnen8aw33G2s"

    .line 6
    .line 7
    invoke-direct/range {p0 .. p6}, Ll/x5s0;-><init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;II)V

    .line 8
    .line 9
    .line 10
    iput-object p7, p0, Ll/i5s0;->i:Ll/y2s0;

    .line 11
    .line 12
    iput-wide p8, p0, Ll/i5s0;->j:J

    .line 13
    .line 14
    iput-wide p10, p0, Ll/i5s0;->k:J

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/i5s0;->i:Ll/y2s0;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v1, p0, Ll/x5s0;->f:Ljava/lang/reflect/Method;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/y2s0;->b()Landroid/net/NetworkCapabilities;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-wide v2, p0, Ll/i5s0;->j:J

    .line 12
    .line 13
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget-wide v3, p0, Ll/i5s0;->k:J

    .line 18
    .line 19
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    filled-new-array {v0, v2, v3}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {v1, v2, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ljava/lang/String;

    .line 33
    .line 34
    new-instance v1, Ll/w2s0;

    .line 35
    .line 36
    invoke-direct {v1, v0}, Ll/w2s0;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 40
    .line 41
    monitor-enter v0

    .line 42
    :try_start_0
    iget-object v2, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 43
    .line 44
    iget-object v3, v1, Ll/w2s0;->a:Ljava/lang/Long;

    .line 45
    .line 46
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 47
    .line 48
    .line 49
    move-result-wide v3

    .line 50
    invoke-virtual {v2, v3, v4}, Ll/fzr0;->A0(J)Ll/fzr0;

    .line 51
    .line 52
    .line 53
    iget-object v2, v1, Ll/w2s0;->b:Ljava/lang/Long;

    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 56
    .line 57
    .line 58
    move-result-wide v2

    .line 59
    const-wide/16 v4, 0x0

    .line 60
    .line 61
    cmp-long v2, v2, v4

    .line 62
    .line 63
    if-ltz v2, :cond_0

    .line 64
    .line 65
    iget-object v2, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 66
    .line 67
    iget-object v3, v1, Ll/w2s0;->b:Ljava/lang/Long;

    .line 68
    .line 69
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 70
    .line 71
    .line 72
    move-result-wide v6

    .line 73
    invoke-virtual {v2, v6, v7}, Ll/fzr0;->K(J)Ll/fzr0;

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :catchall_0
    move-exception p0

    .line 78
    goto :goto_1

    .line 79
    :cond_0
    :goto_0
    iget-object v2, v1, Ll/w2s0;->c:Ljava/lang/Long;

    .line 80
    .line 81
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 82
    .line 83
    .line 84
    move-result-wide v2

    .line 85
    cmp-long v2, v2, v4

    .line 86
    .line 87
    if-ltz v2, :cond_1

    .line 88
    .line 89
    iget-object p0, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 90
    .line 91
    iget-object v1, v1, Ll/w2s0;->c:Ljava/lang/Long;

    .line 92
    .line 93
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 94
    .line 95
    .line 96
    move-result-wide v1

    .line 97
    invoke-virtual {p0, v1, v2}, Ll/fzr0;->g0(J)Ll/fzr0;

    .line 98
    .line 99
    .line 100
    :cond_1
    monitor-exit v0

    .line 101
    return-void

    .line 102
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    throw p0

    .line 104
    :cond_2
    return-void
.end method
