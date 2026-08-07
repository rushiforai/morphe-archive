.class public final Ll/oij0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/oij0$b;
    }
.end annotation


# instance fields
.field public final a:Ll/rg50;

.field public final b:Ll/kmc0;

.field public final c:Ll/ry3;

.field public final d:Ll/t4f;

.field public final e:Lokio/AsyncTimeout;

.field public f:Ljava/lang/Object;

.field public g:Ll/x1d0;

.field public h:Ll/p6f;

.field public i:Ll/imc0;

.field public j:Ll/n6f;

.field public k:Z

.field public l:Z

.field public m:Z

.field public n:Z

.field public o:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/rg50;Ll/ry3;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/oij0$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/oij0$a;-><init>(Ll/oij0;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/oij0;->e:Lokio/AsyncTimeout;

    .line 10
    .line 11
    iput-object p1, p0, Ll/oij0;->a:Ll/rg50;

    .line 12
    .line 13
    sget-object v1, Ll/kzm;->a:Ll/kzm;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/rg50;->j()Ll/lx5;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v1, v2}, Ll/kzm;->i(Ll/lx5;)Ll/kmc0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, p0, Ll/oij0;->b:Ll/kmc0;

    .line 24
    .line 25
    iput-object p2, p0, Ll/oij0;->c:Ll/ry3;

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/rg50;->o()Ll/t4f$b;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-interface {v1, p2}, Ll/t4f$b;->create(Ll/ry3;)Ll/t4f;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    iput-object p2, p0, Ll/oij0;->d:Ll/t4f;

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/rg50;->d()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    int-to-long p0, p0

    .line 42
    sget-object p2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 43
    .line 44
    invoke-virtual {v0, p0, p1, p2}, Lokio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/Timeout;

    .line 45
    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public a(Ll/imc0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oij0;->i:Ll/imc0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Ll/oij0;->i:Ll/imc0;

    .line 6
    .line 7
    iget-object p1, p1, Ll/imc0;->p:Ljava/util/List;

    .line 8
    .line 9
    new-instance v0, Ll/oij0$b;

    .line 10
    .line 11
    iget-object v1, p0, Ll/oij0;->f:Ljava/lang/Object;

    .line 12
    .line 13
    invoke-direct {v0, p0, v1}, Ll/oij0$b;-><init>(Ll/oij0;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "response.body().close()"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lokhttp3/internal/platform/Platform;->getStackTraceForCloseable(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/oij0;->f:Ljava/lang/Object;

    .line 12
    .line 13
    iget-object v0, p0, Ll/oij0;->d:Ll/t4f;

    .line 14
    .line 15
    iget-object p0, p0, Ll/oij0;->c:Ll/ry3;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ll/t4f;->callStart(Ll/ry3;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public c()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oij0;->h:Ll/p6f;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/p6f;->f()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/oij0;->h:Ll/p6f;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/p6f;->e()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public d()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/oij0;->b:Ll/kmc0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Ll/oij0;->m:Z

    .line 6
    .line 7
    iget-object v1, p0, Ll/oij0;->j:Ll/n6f;

    .line 8
    .line 9
    iget-object v2, p0, Ll/oij0;->h:Ll/p6f;

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    invoke-virtual {v2}, Ll/p6f;->a()Ll/imc0;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ll/oij0;->h:Ll/p6f;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/p6f;->a()Ll/imc0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    iget-object p0, p0, Ll/oij0;->i:Ll/imc0;

    .line 29
    .line 30
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    invoke-virtual {v1}, Ll/n6f;->b()V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    if-eqz p0, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/imc0;->g()V

    .line 40
    .line 41
    .line 42
    :cond_2
    return-void

    .line 43
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    throw p0
.end method

.method public final e(Ll/rnl;)Ll/y80;
    .locals 14

    .line 1
    invoke-virtual {p1}, Ll/rnl;->n()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/oij0;->a:Ll/rg50;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/rg50;->K()Ljavax/net/ssl/SSLSocketFactory;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/oij0;->a:Ll/rg50;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/rg50;->r()Ljavax/net/ssl/HostnameVerifier;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Ll/oij0;->a:Ll/rg50;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/rg50;->e()Ll/xq4;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    move-object v6, v0

    .line 26
    move-object v7, v1

    .line 27
    move-object v8, v2

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 v0, 0x0

    .line 30
    move-object v6, v0

    .line 31
    move-object v7, v6

    .line 32
    move-object v8, v7

    .line 33
    :goto_0
    new-instance v1, Ll/y80;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/rnl;->m()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {p1}, Ll/rnl;->y()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    iget-object p1, p0, Ll/oij0;->a:Ll/rg50;

    .line 44
    .line 45
    invoke-virtual {p1}, Ll/rg50;->n()Ll/o6e;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    iget-object p1, p0, Ll/oij0;->a:Ll/rg50;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/rg50;->G()Ljavax/net/SocketFactory;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    iget-object p1, p0, Ll/oij0;->a:Ll/rg50;

    .line 56
    .line 57
    invoke-virtual {p1}, Ll/rg50;->B()Ll/ce1;

    .line 58
    .line 59
    .line 60
    move-result-object v9

    .line 61
    iget-object p1, p0, Ll/oij0;->a:Ll/rg50;

    .line 62
    .line 63
    invoke-virtual {p1}, Ll/rg50;->A()Ljava/net/Proxy;

    .line 64
    .line 65
    .line 66
    move-result-object v10

    .line 67
    iget-object p1, p0, Ll/oij0;->a:Ll/rg50;

    .line 68
    .line 69
    invoke-virtual {p1}, Ll/rg50;->z()Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object v11

    .line 73
    iget-object p1, p0, Ll/oij0;->a:Ll/rg50;

    .line 74
    .line 75
    invoke-virtual {p1}, Ll/rg50;->k()Ljava/util/List;

    .line 76
    .line 77
    .line 78
    move-result-object v12

    .line 79
    iget-object p0, p0, Ll/oij0;->a:Ll/rg50;

    .line 80
    .line 81
    invoke-virtual {p0}, Ll/rg50;->C()Ljava/net/ProxySelector;

    .line 82
    .line 83
    .line 84
    move-result-object v13

    .line 85
    invoke-direct/range {v1 .. v13}, Ll/y80;-><init>(Ljava/lang/String;ILl/o6e;Ljavax/net/SocketFactory;Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/HostnameVerifier;Ll/xq4;Ll/ce1;Ljava/net/Proxy;Ljava/util/List;Ljava/util/List;Ljava/net/ProxySelector;)V

    .line 86
    .line 87
    .line 88
    return-object v1
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oij0;->b:Ll/kmc0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/oij0;->o:Z

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput-object v1, p0, Ll/oij0;->j:Ll/n6f;

    .line 10
    .line 11
    monitor-exit v0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 18
    .line 19
    .line 20
    throw p0

    .line 21
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw p0
.end method

.method public g(Ll/n6f;ZZLjava/io/IOException;)Ljava/io/IOException;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/oij0;->b:Ll/kmc0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/oij0;->j:Ll/n6f;

    .line 5
    .line 6
    if-eq p1, v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-object p4

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_2

    .line 12
    :cond_0
    const/4 p1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    iget-boolean p2, p0, Ll/oij0;->k:Z

    .line 17
    .line 18
    xor-int/2addr p2, p1

    .line 19
    iput-boolean p1, p0, Ll/oij0;->k:Z

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    move p2, v2

    .line 23
    :goto_0
    if-eqz p3, :cond_3

    .line 24
    .line 25
    iget-boolean p3, p0, Ll/oij0;->l:Z

    .line 26
    .line 27
    if-nez p3, :cond_2

    .line 28
    .line 29
    move p2, p1

    .line 30
    :cond_2
    iput-boolean p1, p0, Ll/oij0;->l:Z

    .line 31
    .line 32
    :cond_3
    iget-boolean p3, p0, Ll/oij0;->k:Z

    .line 33
    .line 34
    if-eqz p3, :cond_4

    .line 35
    .line 36
    iget-boolean p3, p0, Ll/oij0;->l:Z

    .line 37
    .line 38
    if-eqz p3, :cond_4

    .line 39
    .line 40
    if-eqz p2, :cond_4

    .line 41
    .line 42
    invoke-virtual {v1}, Ll/n6f;->c()Ll/imc0;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    iget p3, p2, Ll/imc0;->m:I

    .line 47
    .line 48
    add-int/2addr p3, p1

    .line 49
    iput p3, p2, Ll/imc0;->m:I

    .line 50
    .line 51
    const/4 p2, 0x0

    .line 52
    iput-object p2, p0, Ll/oij0;->j:Ll/n6f;

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_4
    move p1, v2

    .line 56
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    if-eqz p1, :cond_5

    .line 58
    .line 59
    invoke-virtual {p0, p4, v2}, Ll/oij0;->j(Ljava/io/IOException;Z)Ljava/io/IOException;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    return-object p0

    .line 64
    :cond_5
    return-object p4

    .line 65
    :goto_2
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    throw p0
.end method

.method public h()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oij0;->b:Ll/kmc0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/oij0;->j:Ll/n6f;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    monitor-exit v0

    .line 12
    return p0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method

.method public i()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oij0;->b:Ll/kmc0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean p0, p0, Ll/oij0;->m:Z

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public final j(Ljava/io/IOException;Z)Ljava/io/IOException;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/oij0;->b:Ll/kmc0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    if-eqz p2, :cond_1

    .line 5
    .line 6
    :try_start_0
    iget-object v1, p0, Ll/oij0;->j:Ll/n6f;

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 12
    .line 13
    const-string p1, "cannot release connection while it is in use"

    .line 14
    .line 15
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    throw p0

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_3

    .line 21
    :cond_1
    :goto_0
    iget-object v1, p0, Ll/oij0;->i:Ll/imc0;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    if-eqz v1, :cond_3

    .line 25
    .line 26
    iget-object v3, p0, Ll/oij0;->j:Ll/n6f;

    .line 27
    .line 28
    if-nez v3, :cond_3

    .line 29
    .line 30
    if-nez p2, :cond_2

    .line 31
    .line 32
    iget-boolean p2, p0, Ll/oij0;->o:Z

    .line 33
    .line 34
    if-eqz p2, :cond_3

    .line 35
    .line 36
    :cond_2
    invoke-virtual {p0}, Ll/oij0;->n()Ljava/net/Socket;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    goto :goto_1

    .line 41
    :cond_3
    move-object p2, v2

    .line 42
    :goto_1
    iget-object v3, p0, Ll/oij0;->i:Ll/imc0;

    .line 43
    .line 44
    if-eqz v3, :cond_4

    .line 45
    .line 46
    move-object v1, v2

    .line 47
    :cond_4
    iget-boolean v2, p0, Ll/oij0;->o:Z

    .line 48
    .line 49
    const/4 v3, 0x0

    .line 50
    const/4 v4, 0x1

    .line 51
    if-eqz v2, :cond_5

    .line 52
    .line 53
    iget-object v2, p0, Ll/oij0;->j:Ll/n6f;

    .line 54
    .line 55
    if-nez v2, :cond_5

    .line 56
    .line 57
    move v2, v4

    .line 58
    goto :goto_2

    .line 59
    :cond_5
    move v2, v3

    .line 60
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    invoke-static {p2}, Ll/jj5;->b(Ljava/net/Socket;)V

    .line 62
    .line 63
    .line 64
    if-eqz v1, :cond_6

    .line 65
    .line 66
    iget-object p2, p0, Ll/oij0;->d:Ll/t4f;

    .line 67
    .line 68
    iget-object v0, p0, Ll/oij0;->c:Ll/ry3;

    .line 69
    .line 70
    invoke-virtual {p2, v0, v1}, Ll/t4f;->connectionReleased(Ll/ry3;Ll/bx5;)V

    .line 71
    .line 72
    .line 73
    :cond_6
    if-eqz v2, :cond_9

    .line 74
    .line 75
    if-eqz p1, :cond_7

    .line 76
    .line 77
    move v3, v4

    .line 78
    :cond_7
    invoke-virtual {p0, p1}, Ll/oij0;->q(Ljava/io/IOException;)Ljava/io/IOException;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object p2, p0, Ll/oij0;->d:Ll/t4f;

    .line 83
    .line 84
    if-eqz v3, :cond_8

    .line 85
    .line 86
    iget-object p0, p0, Ll/oij0;->c:Ll/ry3;

    .line 87
    .line 88
    invoke-virtual {p2, p0, p1}, Ll/t4f;->callFailed(Ll/ry3;Ljava/io/IOException;)V

    .line 89
    .line 90
    .line 91
    return-object p1

    .line 92
    :cond_8
    iget-object p0, p0, Ll/oij0;->c:Ll/ry3;

    .line 93
    .line 94
    invoke-virtual {p2, p0}, Ll/t4f;->callEnd(Ll/ry3;)V

    .line 95
    .line 96
    .line 97
    :cond_9
    return-object p1

    .line 98
    :goto_3
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 99
    throw p0
.end method

.method public k(Ll/azm$a;Z)Ll/n6f;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v1, p0, Ll/oij0;->b:Ll/kmc0;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-boolean v0, p0, Ll/oij0;->o:Z

    .line 5
    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Ll/oij0;->j:Ll/n6f;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 13
    iget-object v0, p0, Ll/oij0;->h:Ll/p6f;

    .line 14
    .line 15
    iget-object v1, p0, Ll/oij0;->a:Ll/rg50;

    .line 16
    .line 17
    invoke-virtual {v0, v1, p1, p2}, Ll/p6f;->b(Ll/rg50;Ll/azm$a;Z)Ll/o6f;

    .line 18
    .line 19
    .line 20
    move-result-object v7

    .line 21
    new-instance v2, Ll/n6f;

    .line 22
    .line 23
    iget-object v4, p0, Ll/oij0;->c:Ll/ry3;

    .line 24
    .line 25
    iget-object v5, p0, Ll/oij0;->d:Ll/t4f;

    .line 26
    .line 27
    iget-object v6, p0, Ll/oij0;->h:Ll/p6f;

    .line 28
    .line 29
    move-object v3, p0

    .line 30
    invoke-direct/range {v2 .. v7}, Ll/n6f;-><init>(Ll/oij0;Ll/ry3;Ll/t4f;Ll/p6f;Ll/o6f;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, v3, Ll/oij0;->b:Ll/kmc0;

    .line 34
    .line 35
    monitor-enter p0

    .line 36
    :try_start_1
    iput-object v2, v3, Ll/oij0;->j:Ll/n6f;

    .line 37
    .line 38
    const/4 p1, 0x0

    .line 39
    iput-boolean p1, v3, Ll/oij0;->k:Z

    .line 40
    .line 41
    iput-boolean p1, v3, Ll/oij0;->l:Z

    .line 42
    .line 43
    monitor-exit p0

    .line 44
    return-object v2

    .line 45
    :catchall_0
    move-exception v0

    .line 46
    move-object p1, v0

    .line 47
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    throw p1

    .line 49
    :catchall_1
    move-exception v0

    .line 50
    move-object p0, v0

    .line 51
    goto :goto_0

    .line 52
    :cond_0
    :try_start_2
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 53
    .line 54
    const-string p1, "cannot make a new request because the previous response is still open: please call response.close()"

    .line 55
    .line 56
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    throw p0

    .line 60
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 61
    .line 62
    const-string p1, "released"

    .line 63
    .line 64
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    throw p0

    .line 68
    :goto_0
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 69
    throw p0
.end method

.method public l(Ljava/io/IOException;)Ljava/io/IOException;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oij0;->b:Ll/kmc0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Ll/oij0;->o:Z

    .line 6
    .line 7
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, p1, v0}, Ll/oij0;->j(Ljava/io/IOException;Z)Ljava/io/IOException;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    throw p0
.end method

.method public m(Ll/x1d0;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/oij0;->g:Ll/x1d0;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/x1d0;->k()Ll/rnl;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v0, v1}, Ll/zlk0;->D(Ll/rnl;Ll/rnl;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/oij0;->h:Ll/p6f;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/p6f;->e()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object v0, p0, Ll/oij0;->j:Ll/n6f;

    .line 29
    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Ll/oij0;->h:Ll/p6f;

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-virtual {p0, v1, v0}, Ll/oij0;->j(Ljava/io/IOException;Z)Ljava/io/IOException;

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Ll/oij0;->h:Ll/p6f;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-static {}, Ll/wpg0;->a()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    :goto_0
    iput-object p1, p0, Ll/oij0;->g:Ll/x1d0;

    .line 49
    .line 50
    new-instance v2, Ll/p6f;

    .line 51
    .line 52
    iget-object v4, p0, Ll/oij0;->b:Ll/kmc0;

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p0, p1}, Ll/oij0;->e(Ll/rnl;)Ll/y80;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    iget-object v6, p0, Ll/oij0;->c:Ll/ry3;

    .line 63
    .line 64
    iget-object v7, p0, Ll/oij0;->d:Ll/t4f;

    .line 65
    .line 66
    move-object v3, p0

    .line 67
    invoke-direct/range {v2 .. v7}, Ll/p6f;-><init>(Ll/oij0;Ll/kmc0;Ll/y80;Ll/ry3;Ll/t4f;)V

    .line 68
    .line 69
    .line 70
    iput-object v2, v3, Ll/oij0;->h:Ll/p6f;

    .line 71
    .line 72
    return-void
.end method

.method public n()Ljava/net/Socket;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/oij0;->i:Ll/imc0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/imc0;->p:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    :goto_0
    const/4 v2, -0x1

    .line 11
    if-ge v1, v0, :cond_1

    .line 12
    .line 13
    iget-object v3, p0, Ll/oij0;->i:Ll/imc0;

    .line 14
    .line 15
    iget-object v3, v3, Ll/imc0;->p:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    check-cast v3, Ljava/lang/ref/Reference;

    .line 22
    .line 23
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    if-ne v3, p0, :cond_0

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    move v1, v2

    .line 34
    :goto_1
    const/4 v0, 0x0

    .line 35
    if-eq v1, v2, :cond_3

    .line 36
    .line 37
    iget-object v2, p0, Ll/oij0;->i:Ll/imc0;

    .line 38
    .line 39
    iget-object v3, v2, Ll/imc0;->p:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v3, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ll/oij0;->i:Ll/imc0;

    .line 45
    .line 46
    iget-object v1, v2, Ll/imc0;->p:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 55
    .line 56
    .line 57
    move-result-wide v3

    .line 58
    iput-wide v3, v2, Ll/imc0;->q:J

    .line 59
    .line 60
    iget-object p0, p0, Ll/oij0;->b:Ll/kmc0;

    .line 61
    .line 62
    invoke-virtual {p0, v2}, Ll/kmc0;->d(Ll/imc0;)Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_2

    .line 67
    .line 68
    invoke-virtual {v2}, Ll/imc0;->d()Ljava/net/Socket;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0

    .line 73
    :cond_2
    return-object v0

    .line 74
    :cond_3
    invoke-static {}, Ll/wpg0;->a()V

    .line 75
    .line 76
    .line 77
    return-object v0
.end method

.method public o()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/oij0;->n:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/oij0;->n:Z

    .line 7
    .line 8
    iget-object p0, p0, Ll/oij0;->e:Lokio/AsyncTimeout;

    .line 9
    .line 10
    invoke-virtual {p0}, Lokio/AsyncTimeout;->exit()Z

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public p()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oij0;->e:Lokio/AsyncTimeout;

    .line 2
    .line 3
    invoke-virtual {p0}, Lokio/AsyncTimeout;->enter()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final q(Ljava/io/IOException;)Ljava/io/IOException;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/oij0;->n:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object p0, p0, Ll/oij0;->e:Lokio/AsyncTimeout;

    .line 7
    .line 8
    invoke-virtual {p0}, Lokio/AsyncTimeout;->exit()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    :goto_0
    return-object p1

    .line 15
    :cond_1
    new-instance p0, Ljava/io/InterruptedIOException;

    .line 16
    .line 17
    const-string v0, "timeout"

    .line 18
    .line 19
    invoke-direct {p0, v0}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 25
    .line 26
    .line 27
    :cond_2
    return-object p0
.end method
