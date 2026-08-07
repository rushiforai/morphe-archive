.class public final Ll/h5s0;
.super Ll/x5s0;
.source "SourceFile"


# instance fields
.field public final i:Ll/u3s0;


# direct methods
.method public constructor <init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;IILl/u3s0;)V
    .locals 0

    .line 1
    const-string p3, "5BsC37pqFx3Fp5Qtv0y+RSU8LVttAMXjX8aFccLrzxg="

    .line 2
    .line 3
    const/16 p6, 0x5e

    .line 4
    .line 5
    const-string p2, "ouo6/s5NPxZlxezvpiuAYZ73R/AsqpZljIGTfLgJpzrsB+84nXU0ZzhmetmfkBrN"

    .line 6
    .line 7
    invoke-direct/range {p0 .. p6}, Ll/x5s0;-><init>(Ll/b4s0;Ljava/lang/String;Ljava/lang/String;Ll/fzr0;II)V

    .line 8
    .line 9
    .line 10
    iput-object p7, p0, Ll/h5s0;->i:Ll/u3s0;

    .line 11
    .line 12
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
    iget-object v1, p0, Ll/h5s0;->i:Ll/u3s0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/u3s0;->a()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/lang/Integer;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 25
    .line 26
    monitor-enter v1

    .line 27
    :try_start_0
    iget-object p0, p0, Ll/x5s0;->e:Ll/fzr0;

    .line 28
    .line 29
    invoke-static {v0}, Ll/qzr0;->a(I)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-virtual {p0, v0}, Ll/fzr0;->Z(I)Ll/fzr0;

    .line 34
    .line 35
    .line 36
    monitor-exit v1

    .line 37
    return-void

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    throw p0
.end method
