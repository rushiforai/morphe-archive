.class public Ll/jo50$d$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jo50$d;->call()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic e:Ll/jo50$d;


# direct methods
.method public constructor <init>(Ll/jo50$d;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jo50$d$a;->e:Ll/jo50$d;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/gcg0;-><init>(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f(Ll/vk90;)V
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

.method public onCompleted()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jo50$d$a;->e:Ll/jo50$d;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jo50$d;->b:Ll/gcg0;

    .line 4
    .line 5
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jo50$d$a;->e:Ll/jo50$d;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jo50$d;->b:Ll/gcg0;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/jo50$d$a;->e:Ll/jo50$d;

    .line 2
    .line 3
    iget-object p1, p1, Ll/jo50$d;->b:Ll/gcg0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/gcg0;->isUnsubscribed()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, Ll/jo50$d$a;->e:Ll/jo50$d;

    .line 12
    .line 13
    iget-object p1, p1, Ll/jo50$d;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    cmp-long p1, v0, v2

    .line 22
    .line 23
    iget-object p0, p0, Ll/jo50$d$a;->e:Ll/jo50$d;

    .line 24
    .line 25
    if-lez p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Ll/jo50$d;->d:Ll/f2e0$a;

    .line 28
    .line 29
    iget-object p0, p0, Ll/jo50$d;->e:Ll/x20;

    .line 30
    .line 31
    invoke-virtual {p1, p0}, Ll/f2e0$a;->b(Ll/x20;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object p0, p0, Ll/jo50$d;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 36
    .line 37
    const/4 p1, 0x0

    .line 38
    const/4 v0, 0x1

    .line 39
    invoke-virtual {p0, p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method
