.class public Ll/jo50$b$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jo50$b;->call()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public e:Z

.field public final synthetic f:Ll/jo50$b;


# direct methods
.method public constructor <init>(Ll/jo50$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jo50$b$a;->f:Ll/jo50$b;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f(Ll/vk90;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jo50$b$a;->f:Ll/jo50$b;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jo50$b;->c:Ll/xk90;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xk90;->c(Ll/vk90;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final g()V
    .locals 5

    .line 1
    :cond_0
    iget-object v0, p0, Ll/jo50$b$a;->f:Ll/jo50$b;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jo50$b;->d:Ljava/util/concurrent/atomic/AtomicLong;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    const-wide v2, 0x7fffffffffffffffL

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    cmp-long v2, v0, v2

    .line 15
    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    iget-object v2, p0, Ll/jo50$b$a;->f:Ll/jo50$b;

    .line 19
    .line 20
    iget-object v2, v2, Ll/jo50$b;->d:Ljava/util/concurrent/atomic/AtomicLong;

    .line 21
    .line 22
    const-wide/16 v3, 0x1

    .line 23
    .line 24
    sub-long v3, v0, v3

    .line 25
    .line 26
    invoke-virtual {v2, v0, v1, v3, v4}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/jo50$b$a;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/jo50$b$a;->e:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/jo50$b$a;->f:Ll/jo50$b;

    .line 12
    .line 13
    iget-object p0, p0, Ll/jo50$b;->b:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-static {}, Lrx/Notification;->a()Lrx/Notification;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/jo50$b$a;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/jo50$b$a;->e:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/jo50$b$a;->f:Ll/jo50$b;

    .line 12
    .line 13
    iget-object p0, p0, Ll/jo50$b;->b:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-static {p1}, Lrx/Notification;->b(Ljava/lang/Throwable;)Lrx/Notification;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/jo50$b$a;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/jo50$b$a;->f:Ll/jo50$b;

    .line 6
    .line 7
    iget-object v0, v0, Ll/jo50$b;->a:Ll/gcg0;

    .line 8
    .line 9
    invoke-interface {v0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/jo50$b$a;->g()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/jo50$b$a;->f:Ll/jo50$b;

    .line 16
    .line 17
    iget-object p0, p0, Ll/jo50$b;->c:Ll/xk90;

    .line 18
    .line 19
    const-wide/16 v0, 0x1

    .line 20
    .line 21
    invoke-virtual {p0, v0, v1}, Ll/xk90;->b(J)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
