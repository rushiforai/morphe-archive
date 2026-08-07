.class public final Ll/o5s0;
.super Ll/x5s0;
.source "SourceFile"


# instance fields
.field public final i:Z


# direct methods
.method public constructor <init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;II)V
    .locals 0

    .line 1
    const-string p3, "JQeYWB/Ar5LqSSZ5i6IhxYZ+uXn8SEDYL9xPjgGTx2M="

    .line 2
    .line 3
    const/16 p6, 0x3d

    .line 4
    .line 5
    const-string p2, "JHENilgoa32pdW2+FQZfbiKa1To+b6hAFc5hyxP6u/LWvHbIhkfTDC3kQMR4mpq3"

    .line 6
    .line 7
    invoke-direct/range {p0 .. p6}, Ll/x5s0;-><init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;II)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ll/b4s0;->s()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput-boolean p1, p0, Ll/o5s0;->i:Z

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3
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
    iget-object v1, p0, Ll/x5s0;->b:Ll/b4s0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/b4s0;->b()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-boolean v2, p0, Ll/o5s0;->i:Z

    .line 10
    .line 11
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ljava/lang/Long;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    iget-object v2, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 31
    .line 32
    monitor-enter v2

    .line 33
    :try_start_0
    iget-object p0, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 34
    .line 35
    invoke-virtual {p0, v0, v1}, Ll/fzr0;->u(J)Ll/fzr0;

    .line 36
    .line 37
    .line 38
    monitor-exit v2

    .line 39
    return-void

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    throw p0
.end method
