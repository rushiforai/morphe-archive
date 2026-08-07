.class public abstract Ll/aud;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/aud$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ll/gcg0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final e:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-TR;>;"
        }
    .end annotation
.end field

.field public f:Z

.field public g:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TR;"
        }
    .end annotation
.end field

.field public final h:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public constructor <init>(Ll/gcg0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TR;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/aud;->e:Ll/gcg0;

    .line 5
    .line 6
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/aud;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final f(Ll/vk90;)V
    .locals 2

    .line 1
    const-wide v0, 0x7fffffffffffffffL

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    invoke-interface {p1, v0, v1}, Ll/vk90;->request(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final g()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aud;->e:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final h(Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/aud;->e:Ll/gcg0;

    .line 2
    .line 3
    :cond_0
    iget-object v1, p0, Ll/aud;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x2

    .line 10
    if-eq v1, v2, :cond_4

    .line 11
    .line 12
    const/4 v3, 0x3

    .line 13
    if-eq v1, v3, :cond_4

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/gcg0;->isUnsubscribed()Z

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    if-eqz v4, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 v4, 0x1

    .line 23
    if-ne v1, v4, :cond_3

    .line 24
    .line 25
    invoke-interface {v0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ll/gcg0;->isUnsubscribed()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_2

    .line 33
    .line 34
    invoke-interface {v0}, Ll/bb50;->onCompleted()V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object p0, p0, Ll/aud;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 38
    .line 39
    invoke-virtual {p0, v3}, Ljava/util/concurrent/atomic/AtomicInteger;->lazySet(I)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_3
    iput-object p1, p0, Ll/aud;->g:Ljava/lang/Object;

    .line 44
    .line 45
    iget-object v1, p0, Ll/aud;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 46
    .line 47
    const/4 v3, 0x0

    .line 48
    invoke-virtual {v1, v3, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    :cond_4
    :goto_0
    return-void
.end method

.method public final i(J)V
    .locals 4

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_4

    .line 6
    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object p1, p0, Ll/aud;->e:Ll/gcg0;

    .line 10
    .line 11
    :cond_0
    iget-object p2, p0, Ll/aud;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    const/4 v0, 0x1

    .line 18
    if-eq p2, v0, :cond_3

    .line 19
    .line 20
    const/4 v1, 0x3

    .line 21
    if-eq p2, v1, :cond_3

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/gcg0;->isUnsubscribed()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget-object v2, p0, Ll/aud;->h:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 31
    .line 32
    const/4 v3, 0x2

    .line 33
    if-ne p2, v3, :cond_2

    .line 34
    .line 35
    invoke-virtual {v2, v3, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eqz p2, :cond_3

    .line 40
    .line 41
    iget-object p0, p0, Ll/aud;->g:Ljava/lang/Object;

    .line 42
    .line 43
    invoke-interface {p1, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Ll/gcg0;->isUnsubscribed()Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-nez p0, :cond_3

    .line 51
    .line 52
    invoke-interface {p1}, Ll/bb50;->onCompleted()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    const/4 p2, 0x0

    .line 57
    invoke-virtual {v2, p2, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    if-eqz p2, :cond_0

    .line 62
    .line 63
    :cond_3
    :goto_0
    return-void

    .line 64
    :cond_4
    const-string p0, "n >= 0 required but it was "

    .line 65
    .line 66
    invoke-static {p0, p1, p2}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final j()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/aud;->e:Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/aud$a;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/aud$a;-><init>(Ll/aud;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/gcg0;->f(Ll/vk90;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final k(Lrx/c;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "+TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/aud;->j()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p0}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/aud;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/aud;->g:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/aud;->h(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/aud;->g()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/aud;->g:Ljava/lang/Object;

    .line 3
    .line 4
    iget-object p0, p0, Ll/aud;->e:Ll/gcg0;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
