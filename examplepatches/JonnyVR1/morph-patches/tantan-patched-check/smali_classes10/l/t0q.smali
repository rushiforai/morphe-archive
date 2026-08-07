.class public Ll/t0q;
.super Ll/bzm;
.source "SourceFile"


# instance fields
.field public b:Ll/fh3;

.field public c:Ll/gh3;

.field public d:Ll/woc0;

.field public e:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/bzm;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/t0q;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 11
    .line 12
    new-instance v0, Ll/fh3;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/fh3;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/t0q;->b:Ll/fh3;

    .line 18
    .line 19
    new-instance v0, Ll/gh3;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/gh3;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/t0q;->c:Ll/gh3;

    .line 25
    .line 26
    new-instance v0, Ll/woc0;

    .line 27
    .line 28
    const/4 v1, 0x2

    .line 29
    invoke-direct {v0, v1}, Ll/woc0;-><init>(I)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/t0q;->d:Ll/woc0;

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public a(Ll/ur4;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/t0q;->b:Ll/fh3;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/ur4;->b()Ll/smc0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ll/fh3;->a(Ll/smc0;)Ll/yc60;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p1, v0}, Ll/ur4;->a(Ll/yc60;)Ll/ur4;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catch_0
    move-exception v0

    .line 18
    iget-object v1, p0, Ll/t0q;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 19
    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-virtual {v1, v2, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_2

    .line 26
    .line 27
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/t0q;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-interface {p1}, Ll/ur4;->b()Ll/smc0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0, v0}, Ll/t0q;->f(Ll/smc0;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/t0q;->g(Ll/ur4;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void

    .line 46
    :cond_2
    throw v0
.end method

.method public b(Ll/ur4;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/t0q;->c:Ll/gh3;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/ur4;->b()Ll/smc0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {p1}, Ll/ur4;->c()Ll/yc60;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v0, v1, v2}, Ll/gh3;->a(Ll/smc0;Ll/yc60;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catch_0
    move-exception v0

    .line 16
    invoke-virtual {p0}, Ll/bzm;->c()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-interface {p1}, Ll/ur4;->b()Ll/smc0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Ll/smc0;->m()Ll/vzv;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1, v0}, Ll/vzv;->b(Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    :goto_0
    iget-object v0, p0, Ll/t0q;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    const/4 v2, 0x1

    .line 37
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-interface {p1}, Ll/ur4;->b()Ll/smc0;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0, p1}, Ll/t0q;->f(Ll/smc0;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void

    .line 51
    :cond_1
    throw v0
.end method

.method public d()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/bzm;->d()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/t0q;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final f(Ll/smc0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/bzm;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/smc0;->m()Ll/vzv;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p1, "already release return the receive"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p0, p0, Ll/t0q;->d:Ll/woc0;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/m950;->b()Ll/nrc0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ll/irc0;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->a(Ll/smc0;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final g(Ll/ur4;)V
    .locals 1

    .line 1
    invoke-interface {p1}, Ll/ur4;->call()Ll/qy3;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Ll/irc0;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-interface {p1}, Ll/ur4;->call()Ll/qy3;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ll/irc0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/bzm;->c()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/irc0;->recycle()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p0, p0, Ll/t0q;->d:Ll/woc0;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/m950;->c(Ll/nrc0;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method
