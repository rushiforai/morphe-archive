.class public Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;
.super Ll/ii2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection$LongLinkConnectErrorException;
    }
.end annotation


# instance fields
.field public d:Ll/smc0;

.field public e:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;

.field public f:I


# direct methods
.method public constructor <init>(Ll/smc0;Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/ii2;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->d:Ll/smc0;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->e:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;

    .line 7
    .line 8
    new-instance v0, Ll/gxl$i;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/smc0;->g()Ll/l4f;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-direct {v0, p1, p2}, Ll/gxl$i;-><init>(Ll/l4f;Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->n(Ll/gxl;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public declared-synchronized a()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Ll/ii2;->a()Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->l()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    monitor-exit p0

    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw v0
.end method

.method public b(Lokio/Buffer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, "write drop the the buffer is null"

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->k(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-super {p0, p1}, Ll/ii2;->b(Lokio/Buffer;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public d()Ljava/net/Socket;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->e:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->d:Ll/smc0;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/smc0;->q()Ll/lyt;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->e:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;

    .line 14
    .line 15
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;->a()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {v0, p0}, Ll/lyt;->a(Ljava/lang/String;)Ljava/net/Socket;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public g(Ljava/lang/Throwable;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->d:Ll/smc0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/smc0;->m()Ll/vzv;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection$LongLinkConnectErrorException;

    .line 8
    .line 9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v3, "connect error, clientIp"

    .line 12
    .line 13
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->e:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;

    .line 17
    .line 18
    invoke-interface {v3}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;->b()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v3, ", net status:"

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-direct {v1, v2, p1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection$LongLinkConnectErrorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ll/vzv;->b(Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->d:Ll/smc0;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/smc0;->i()Ll/ixl;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0, p1}, Ll/ixl;->a(Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    new-instance v0, Ll/gxl$c;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->d:Ll/smc0;

    .line 59
    .line 60
    invoke-virtual {v1}, Ll/smc0;->g()Ll/l4f;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->e:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;

    .line 65
    .line 66
    invoke-direct {v0, v1, v2, p1}, Ll/gxl$c;-><init>(Ll/l4f;Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;Ljava/lang/Throwable;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->n(Ll/gxl;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public getCurrentState()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public h()V
    .locals 3

    .line 1
    new-instance v0, Ll/gxl$d;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->d:Ll/smc0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/smc0;->g()Ll/l4f;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->e:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2}, Ll/gxl$d;-><init>(Ll/l4f;Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->n(Ll/gxl;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public i()V
    .locals 3

    .line 1
    new-instance v0, Ll/gxl$e;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->d:Ll/smc0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/smc0;->g()Ll/l4f;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->e:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2}, Ll/gxl$e;-><init>(Ll/l4f;Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->n(Ll/gxl;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public isConnected()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->f:I

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x6

    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public j()V
    .locals 3

    .line 1
    new-instance v0, Ll/gxl$f;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->d:Ll/smc0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/smc0;->g()Ll/l4f;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->e:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;

    .line 10
    .line 11
    invoke-direct {v0, v1, v2}, Ll/gxl$f;-><init>(Ll/l4f;Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->n(Ll/gxl;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public k(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->d:Ll/smc0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/smc0;->m()Ll/vzv;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ljava/lang/RuntimeException;

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "onWarn:"

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/vzv;->b(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final l()V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->d:Ll/smc0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/smc0;->c()Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->d:Ll/smc0;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/a;->b(Ll/smc0;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/gxl$b;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->d:Ll/smc0;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/smc0;->g()Ll/l4f;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->e:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;

    .line 21
    .line 22
    invoke-direct {v0, v1, v2}, Ll/gxl$b;-><init>(Ll/l4f;Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->n(Ll/gxl;)V
    :try_end_0
    .catch Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/auth/Auth$AuthException; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :catch_0
    move-exception v0

    .line 30
    new-instance v1, Ll/gxl$a;

    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->d:Ll/smc0;

    .line 33
    .line 34
    invoke-virtual {v2}, Ll/smc0;->g()Ll/l4f;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->e:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;

    .line 39
    .line 40
    invoke-direct {v1, v2, v3, v0}, Ll/gxl$a;-><init>(Ll/l4f;Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->n(Ll/gxl;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public m()Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->e:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public final n(Ll/gxl;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/gxl;->e()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->f:I

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/gxl;->a()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public o(Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/RealConnection;->e:Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/connection/a$a;

    .line 2
    .line 3
    return-void
.end method
