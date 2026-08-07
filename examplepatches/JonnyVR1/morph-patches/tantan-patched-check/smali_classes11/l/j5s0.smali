.class public final Ll/j5s0;
.super Ll/x5s0;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;II)V
    .locals 0

    .line 1
    const-string p3, "t0k+Q4WGODPCHlTh1fiMgaVG6LJXWEyq2lqorD4gMCo="

    .line 2
    .line 3
    const/16 p6, 0xc

    .line 4
    .line 5
    const-string p2, "somG6HzRa3YZJrwwnfL6K8d6jP9Npv493BtTLjfx2vaqxDUDPiPCNzpi42Jpggs8"

    .line 6
    .line 7
    invoke-direct/range {p0 .. p6}, Ll/x5s0;-><init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;II)V

    .line 8
    .line 9
    .line 10
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
    iget-object v0, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 2
    .line 3
    const-wide/16 v1, -0x1

    .line 4
    .line 5
    invoke-virtual {v0, v1, v2}, Ll/fzr0;->q(J)Ll/fzr0;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/x5s0;->f:Ljava/lang/reflect/Method;

    .line 9
    .line 10
    iget-object v1, p0, Ll/x5s0;->b:Ll/b4s0;

    .line 11
    .line 12
    invoke-virtual {v1}, Ll/b4s0;->b()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ljava/lang/Long;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    iget-object p0, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 32
    .line 33
    invoke-virtual {p0, v0, v1}, Ll/fzr0;->q(J)Ll/fzr0;

    .line 34
    .line 35
    .line 36
    return-void
.end method
