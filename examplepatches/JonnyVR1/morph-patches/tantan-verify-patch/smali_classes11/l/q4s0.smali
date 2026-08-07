.class public final Ll/q4s0;
.super Ll/x5s0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;II)V
    .locals 0

    .line 1
    const-string p3, "gziBDgIPHk3UnbqAN9Ta9zRxJ8KBrTfiKBXyCZDQ588="

    .line 2
    .line 3
    const/4 p6, 0x5

    .line 4
    const-string p2, "nK4MIXXv/sY+coqtAjalB6f9NiJ1zVnlRnfsJ++LIaOoNJXY+cpXhUK9rjjc0N2G"

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
    iget-object v0, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 2
    .line 3
    const-wide/16 v1, -0x1

    .line 4
    .line 5
    invoke-virtual {v0, v1, v2}, Ll/fzr0;->n0(J)Ll/fzr0;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ll/fzr0;->m0(J)Ll/fzr0;

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/x5s0;->f:Ljava/lang/reflect/Method;

    .line 14
    .line 15
    iget-object v1, p0, Ll/x5s0;->b:Ll/b4s0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/b4s0;->b()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, [I

    .line 31
    .line 32
    iget-object v1, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 33
    .line 34
    monitor-enter v1

    .line 35
    :try_start_0
    iget-object v2, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    aget v3, v0, v3

    .line 39
    .line 40
    int-to-long v3, v3

    .line 41
    invoke-virtual {v2, v3, v4}, Ll/fzr0;->n0(J)Ll/fzr0;

    .line 42
    .line 43
    .line 44
    iget-object v2, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 45
    .line 46
    const/4 v3, 0x1

    .line 47
    aget v3, v0, v3

    .line 48
    .line 49
    int-to-long v3, v3

    .line 50
    invoke-virtual {v2, v3, v4}, Ll/fzr0;->m0(J)Ll/fzr0;

    .line 51
    .line 52
    .line 53
    const/4 v2, 0x2

    .line 54
    aget v0, v0, v2

    .line 55
    .line 56
    const/high16 v2, -0x80000000

    .line 57
    .line 58
    if-eq v0, v2, :cond_0

    .line 59
    .line 60
    iget-object p0, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 61
    .line 62
    int-to-long v2, v0

    .line 63
    invoke-virtual {p0, v2, v3}, Ll/fzr0;->l0(J)Ll/fzr0;

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :catchall_0
    move-exception p0

    .line 68
    goto :goto_1

    .line 69
    :cond_0
    :goto_0
    monitor-exit v1

    .line 70
    return-void

    .line 71
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    throw p0
.end method
