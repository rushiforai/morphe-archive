.class public final Ll/d5s0;
.super Ll/x5s0;
.source "SourceFile"


# instance fields
.field public final i:Ll/c4s0;


# direct methods
.method public constructor <init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;IILl/c4s0;)V
    .locals 0

    .line 1
    const-string p3, "+ExOXtPxYV6dYowx9W8QaGOBr19dRESYWAuzCGJGeu8="

    .line 2
    .line 3
    const/16 p6, 0x55

    .line 4
    .line 5
    const-string p2, "Srq4/7DDafVhhxKPQvFzGwPCcbAxjsRhBUoTZMyZ8i1elMwCHCPiECib9I+dpg+U"

    .line 6
    .line 7
    invoke-direct/range {p0 .. p6}, Ll/x5s0;-><init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;II)V

    .line 8
    .line 9
    .line 10
    iput-object p7, p0, Ll/d5s0;->i:Ll/c4s0;

    .line 11
    .line 12
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
    iget-object v0, p0, Ll/x5s0;->f:Ljava/lang/reflect/Method;

    .line 2
    .line 3
    iget-object v1, p0, Ll/d5s0;->i:Ll/c4s0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/c4s0;->d()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p0, Ll/d5s0;->i:Ll/c4s0;

    .line 14
    .line 15
    invoke-virtual {v2}, Ll/c4s0;->h()J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-object v3, p0, Ll/d5s0;->i:Ll/c4s0;

    .line 24
    .line 25
    invoke-virtual {v3}, Ll/c4s0;->b()J

    .line 26
    .line 27
    .line 28
    move-result-wide v3

    .line 29
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    iget-object v4, p0, Ll/d5s0;->i:Ll/c4s0;

    .line 34
    .line 35
    invoke-virtual {v4}, Ll/c4s0;->f()J

    .line 36
    .line 37
    .line 38
    move-result-wide v4

    .line 39
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    filled-new-array {v1, v2, v3, v4}, [Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const/4 v2, 0x0

    .line 48
    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, [J

    .line 53
    .line 54
    iget-object v1, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 55
    .line 56
    monitor-enter v1

    .line 57
    :try_start_0
    iget-object v2, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 58
    .line 59
    const/4 v3, 0x0

    .line 60
    aget-wide v3, v0, v3

    .line 61
    .line 62
    invoke-virtual {v2, v3, v4}, Ll/fzr0;->w0(J)Ll/fzr0;

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 66
    .line 67
    const/4 v2, 0x1

    .line 68
    aget-wide v2, v0, v2

    .line 69
    .line 70
    invoke-virtual {p0, v2, v3}, Ll/fzr0;->v0(J)Ll/fzr0;

    .line 71
    .line 72
    .line 73
    monitor-exit v1

    .line 74
    return-void

    .line 75
    :catchall_0
    move-exception p0

    .line 76
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    throw p0
.end method
