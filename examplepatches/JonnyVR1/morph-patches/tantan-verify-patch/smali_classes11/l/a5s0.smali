.class public final Ll/a5s0;
.super Ll/x5s0;
.source "SourceFile"


# instance fields
.field public final i:J


# direct methods
.method public constructor <init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;JII)V
    .locals 7

    .line 1
    const-string v3, "mLbfRIQxtPVbZphUgAhWqMeuqa25Ale/5rz8vv9YVkc="

    .line 2
    .line 3
    const/16 v6, 0x19

    .line 4
    .line 5
    const-string v2, "hIbo0WHjc5N2XBD7HI+Mwh9BXu/nIzOhdTaHZ1DPjeizuR48SZNCpBdtOxY4cHlb"

    .line 6
    .line 7
    move-object v0, p0

    .line 8
    move-object v1, p1

    .line 9
    move-object v4, p4

    .line 10
    move v5, p7

    .line 11
    invoke-direct/range {v0 .. v6}, Ll/x5s0;-><init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;II)V

    .line 12
    .line 13
    .line 14
    iput-wide p5, v0, Ll/a5s0;->i:J

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 7
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
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ljava/lang/Long;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    iget-object v2, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 15
    .line 16
    monitor-enter v2

    .line 17
    :try_start_0
    iget-object v3, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 18
    .line 19
    invoke-virtual {v3, v0, v1}, Ll/fzr0;->u0(J)Ll/fzr0;

    .line 20
    .line 21
    .line 22
    iget-wide v3, p0, Ll/a5s0;->i:J

    .line 23
    .line 24
    const-wide/16 v5, 0x0

    .line 25
    .line 26
    cmp-long v5, v3, v5

    .line 27
    .line 28
    if-eqz v5, :cond_0

    .line 29
    .line 30
    iget-object v5, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 31
    .line 32
    sub-long/2addr v0, v3

    .line 33
    invoke-virtual {v5, v0, v1}, Ll/fzr0;->N(J)Ll/fzr0;

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 37
    .line 38
    iget-wide v3, p0, Ll/a5s0;->i:J

    .line 39
    .line 40
    invoke-virtual {v0, v3, v4}, Ll/fzr0;->O(J)Ll/fzr0;

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_1

    .line 46
    :cond_0
    :goto_0
    monitor-exit v2

    .line 47
    return-void

    .line 48
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    throw p0
.end method
