.class public Ll/uj20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wk90;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/wk90<",
        "Ll/n0f;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/fj80;

.field public final b:Ll/wq3;

.field public final c:Ll/vj20;


# direct methods
.method public constructor <init>(Ll/fj80;Ll/wq3;Ll/vj20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/uj20;->a:Ll/fj80;

    .line 5
    .line 6
    iput-object p2, p0, Ll/uj20;->b:Ll/wq3;

    .line 7
    .line 8
    iput-object p3, p0, Ll/uj20;->c:Ll/vj20;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic c(Ll/uj20;Ll/vhi;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/uj20;->k(Ll/vhi;)V

    return-void
.end method

.method public static bridge synthetic d(Ll/uj20;Ll/vhi;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/uj20;->l(Ll/vhi;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static e(II)F
    .locals 2

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    int-to-float p0, p0

    .line 4
    int-to-float p1, p1

    .line 5
    div-float/2addr p0, p1

    .line 6
    return p0

    .line 7
    :cond_0
    neg-int p0, p0

    .line 8
    int-to-double p0, p0

    .line 9
    const-wide v0, 0x40e86a0000000000L    # 50000.0

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    div-double/2addr p0, v0

    .line 15
    invoke-static {p0, p1}, Ljava/lang/Math;->exp(D)D

    .line 16
    .line 17
    .line 18
    move-result-wide p0

    .line 19
    double-to-float p0, p0

    .line 20
    const/high16 p1, 0x3f800000    # 1.0f

    .line 21
    .line 22
    sub-float/2addr p1, p0

    .line 23
    return p1
.end method

.method public static j(Ll/hj80;ILl/vr3;Ll/z06;Ll/yk90;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hj80;",
            "I",
            "Ll/vr3;",
            "Ll/z06<",
            "Ll/n0f;",
            ">;",
            "Ll/yk90;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/hj80;->k()Lcom/facebook/common/memory/PooledByteBuffer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/fb5;->S(Ljava/io/Closeable;)Ll/fb5;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 p4, 0x0

    .line 10
    :try_start_0
    new-instance v0, Ll/n0f;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/n0f;-><init>(Ll/fb5;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 13
    .line 14
    .line 15
    :try_start_1
    invoke-virtual {v0, p2}, Ll/n0f;->k0(Ll/vr3;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ll/n0f;->e0()V

    .line 19
    .line 20
    .line 21
    invoke-interface {p3, v0, p1}, Ll/z06;->b(Ljava/lang/Object;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    .line 23
    .line 24
    invoke-static {v0}, Ll/n0f;->n(Ll/n0f;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p0}, Ll/fb5;->v(Ll/fb5;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    move-object p4, v0

    .line 33
    goto :goto_0

    .line 34
    :catchall_1
    move-exception p1

    .line 35
    :goto_0
    invoke-static {p4}, Ll/n0f;->n(Ll/n0f;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p0}, Ll/fb5;->v(Ll/fb5;)V

    .line 39
    .line 40
    .line 41
    throw p1
.end method


# virtual methods
.method public b(Ll/z06;Ll/yk90;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/n0f;",
            ">;",
            "Ll/yk90;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ll/yk90;->n()Ll/cl90;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "NetworkFetchProducer"

    .line 6
    .line 7
    invoke-interface {v0, p2, v1}, Ll/cl90;->d(Ll/yk90;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/uj20;->c:Ll/vj20;

    .line 11
    .line 12
    invoke-interface {v0, p1, p2}, Ll/vj20;->d(Ll/z06;Ll/yk90;)Ll/vhi;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p2, p0, Ll/uj20;->c:Ll/vj20;

    .line 17
    .line 18
    new-instance v0, Ll/uj20$a;

    .line 19
    .line 20
    invoke-direct {v0, p0, p1}, Ll/uj20$a;-><init>(Ll/uj20;Ll/vhi;)V

    .line 21
    .line 22
    .line 23
    invoke-interface {p2, p1, v0}, Ll/vj20;->a(Ll/vhi;Ll/vj20$a;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final f(Ll/vhi;I)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vhi;",
            "I)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/vhi;->d()Ll/cl90;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/vhi;->b()Ll/yk90;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "NetworkFetchProducer"

    .line 10
    .line 11
    invoke-interface {v0, v1, v2}, Ll/cl90;->k(Ll/yk90;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0

    .line 19
    :cond_0
    iget-object p0, p0, Ll/uj20;->c:Ll/vj20;

    .line 20
    .line 21
    invoke-interface {p0, p1, p2}, Ll/vj20;->c(Ll/vhi;I)Ljava/util/Map;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public g()J
    .locals 2
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public h(Ll/hj80;Ll/vhi;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/hj80;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, p2, v0}, Ll/uj20;->f(Ll/vhi;I)Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p2}, Ll/vhi;->d()Ll/cl90;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p2}, Ll/vhi;->b()Ll/yk90;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "NetworkFetchProducer"

    .line 18
    .line 19
    invoke-interface {v0, v1, v2, p0}, Ll/cl90;->f(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2}, Ll/vhi;->b()Ll/yk90;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-interface {v0, p0, v2, v1}, Ll/cl90;->e(Ll/yk90;Ljava/lang/String;Z)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2}, Ll/vhi;->b()Ll/yk90;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string v0, "network"

    .line 35
    .line 36
    invoke-interface {p0, v0}, Ll/yk90;->B(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2}, Ll/vhi;->e()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    or-int/2addr p0, v1

    .line 44
    invoke-virtual {p2}, Ll/vhi;->f()Ll/vr3;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p2}, Ll/vhi;->a()Ll/z06;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {p2}, Ll/vhi;->b()Ll/yk90;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-static {p1, p0, v0, v1, p2}, Ll/uj20;->j(Ll/hj80;ILl/vr3;Ll/z06;Ll/yk90;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public i(Ll/hj80;Ll/vhi;)V
    .locals 6

    .line 1
    invoke-virtual {p2}, Ll/vhi;->b()Ll/yk90;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, p2, v0}, Ll/uj20;->n(Ll/vhi;Ll/yk90;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/uj20;->g()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    invoke-virtual {p2}, Ll/vhi;->c()J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    sub-long v2, v0, v2

    .line 20
    .line 21
    const-wide/16 v4, 0x64

    .line 22
    .line 23
    cmp-long p0, v2, v4

    .line 24
    .line 25
    if-ltz p0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p2, v0, v1}, Ll/vhi;->h(J)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2}, Ll/vhi;->d()Ll/cl90;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p2}, Ll/vhi;->b()Ll/yk90;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "NetworkFetchProducer"

    .line 39
    .line 40
    const-string v2, "intermediate_result"

    .line 41
    .line 42
    invoke-interface {p0, v0, v1, v2}, Ll/cl90;->j(Ll/yk90;Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p2}, Ll/vhi;->e()I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    invoke-virtual {p2}, Ll/vhi;->f()Ll/vr3;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p2}, Ll/vhi;->a()Ll/z06;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {p2}, Ll/vhi;->b()Ll/yk90;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-static {p1, p0, v0, v1, p2}, Ll/uj20;->j(Ll/hj80;ILl/vr3;Ll/z06;Ll/yk90;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    return-void
.end method

.method public final k(Ll/vhi;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/vhi;->d()Ll/cl90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Ll/vhi;->b()Ll/yk90;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "NetworkFetchProducer"

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-interface {p0, v0, v1, v2}, Ll/cl90;->a(Ll/yk90;Ljava/lang/String;Ljava/util/Map;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Ll/vhi;->a()Ll/z06;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ll/z06;->a()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final l(Ll/vhi;Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/vhi;->d()Ll/cl90;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Ll/vhi;->b()Ll/yk90;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    const-string v2, "NetworkFetchProducer"

    .line 11
    .line 12
    invoke-interface {p0, v0, v2, p2, v1}, Ll/cl90;->i(Ll/yk90;Ljava/lang/String;Ljava/lang/Throwable;Ljava/util/Map;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Ll/vhi;->d()Ll/cl90;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1}, Ll/vhi;->b()Ll/yk90;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-interface {p0, v0, v2, v1}, Ll/cl90;->e(Ll/yk90;Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Ll/vhi;->b()Ll/yk90;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v0, "network"

    .line 32
    .line 33
    invoke-interface {p0, v0}, Ll/yk90;->B(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Ll/vhi;->a()Ll/z06;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-interface {p0, p2}, Ll/z06;->onFailure(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public m(Ll/vhi;Ljava/io/InputStream;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/uj20;->a:Ll/fj80;

    .line 2
    .line 3
    if-lez p3, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p3}, Ll/fj80;->d(I)Ll/hj80;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-interface {v0}, Ll/fj80;->b()Ll/hj80;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :goto_0
    iget-object v1, p0, Ll/uj20;->b:Ll/wq3;

    .line 15
    .line 16
    const/16 v2, 0x4000

    .line 17
    .line 18
    invoke-interface {v1, v2}, Ll/vi80;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, [B

    .line 23
    .line 24
    :cond_1
    :goto_1
    :try_start_0
    invoke-virtual {p2, v1}, Ljava/io/InputStream;->read([B)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-ltz v2, :cond_2

    .line 29
    .line 30
    if-lez v2, :cond_1

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v0, p1}, Ll/uj20;->i(Ll/hj80;Ll/vhi;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ll/hj80;->size()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-static {v2, p3}, Ll/uj20;->e(II)F

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-virtual {p1}, Ll/vhi;->a()Ll/z06;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-interface {v3, v2}, Ll/z06;->c(F)V

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :catchall_0
    move-exception p1

    .line 56
    goto :goto_2

    .line 57
    :cond_2
    iget-object p2, p0, Ll/uj20;->c:Ll/vj20;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/hj80;->size()I

    .line 60
    .line 61
    .line 62
    move-result p3

    .line 63
    invoke-interface {p2, p1, p3}, Ll/vj20;->e(Ll/vhi;I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, v0, p1}, Ll/uj20;->h(Ll/hj80;Ll/vhi;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/uj20;->b:Ll/wq3;

    .line 70
    .line 71
    invoke-interface {p0, v1}, Ll/vi80;->release(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0}, Ll/hj80;->close()V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :goto_2
    iget-object p0, p0, Ll/uj20;->b:Ll/wq3;

    .line 79
    .line 80
    invoke-interface {p0, v1}, Ll/vi80;->release(Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0}, Ll/hj80;->close()V

    .line 84
    .line 85
    .line 86
    throw p1
.end method

.method public final n(Ll/vhi;Ll/yk90;)Z
    .locals 1

    .line 1
    invoke-interface {p2}, Ll/yk90;->m()Ll/tjm;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-interface {p2}, Ll/tjm;->c()Ll/t4b0;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const/4 v0, 0x0

    .line 10
    if-eqz p2, :cond_2

    .line 11
    .line 12
    invoke-interface {p2}, Ll/t4b0;->c()Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-nez p2, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {p1}, Ll/vhi;->b()Ll/yk90;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-interface {p2}, Ll/yk90;->F()Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-nez p2, :cond_1

    .line 28
    .line 29
    return v0

    .line 30
    :cond_1
    iget-object p0, p0, Ll/uj20;->c:Ll/vj20;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Ll/vj20;->b(Ll/vhi;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0

    .line 37
    :cond_2
    :goto_0
    return v0
.end method
