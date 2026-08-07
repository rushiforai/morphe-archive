.class public final Ll/ky3$b;
.super Ll/f2e0$a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ky3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:Ll/ft5;

.field public final b:Ll/ky3$a;

.field public final c:Ll/ky3$c;

.field public final d:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>(Ll/ky3$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/f2e0$a;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ft5;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ft5;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ky3$b;->a:Ll/ft5;

    .line 10
    .line 11
    iput-object p1, p0, Ll/ky3$b;->b:Ll/ky3$a;

    .line 12
    .line 13
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/ky3$b;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/ky3$a;->b()Ll/ky3$c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Ll/ky3$b;->c:Ll/ky3$c;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public b(Ll/x20;)Ll/kcg0;
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    invoke-virtual {p0, p1, v0, v1, v2}, Ll/ky3$b;->c(Ll/x20;JLjava/util/concurrent/TimeUnit;)Ll/kcg0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public c(Ll/x20;JLjava/util/concurrent/TimeUnit;)Ll/kcg0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ky3$b;->a:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ft5;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/pcg0;->d()Ll/kcg0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/ky3$b;->c:Ll/ky3$c;

    .line 15
    .line 16
    new-instance v1, Ll/ky3$b$a;

    .line 17
    .line 18
    invoke-direct {v1, p0, p1}, Ll/ky3$b$a;-><init>(Ll/ky3$b;Ll/x20;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1, p2, p3, p4}, Ll/lj40;->i(Ll/x20;JLjava/util/concurrent/TimeUnit;)Lrx/internal/schedulers/ScheduledAction;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object p2, p0, Ll/ky3$b;->a:Ll/ft5;

    .line 26
    .line 27
    invoke-virtual {p2, p1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/ky3$b;->a:Ll/ft5;

    .line 31
    .line 32
    invoke-virtual {p1, p0}, Lrx/internal/schedulers/ScheduledAction;->addParent(Ll/ft5;)V

    .line 33
    .line 34
    .line 35
    return-object p1
.end method

.method public isUnsubscribed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ky3$b;->a:Ll/ft5;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ft5;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public unsubscribe()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ky3$b;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/ky3$b;->b:Ll/ky3$a;

    .line 12
    .line 13
    iget-object v1, p0, Ll/ky3$b;->c:Ll/ky3$c;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/ky3$a;->d(Ll/ky3$c;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Ll/ky3$b;->a:Ll/ft5;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ft5;->unsubscribe()V

    .line 21
    .line 22
    .line 23
    return-void
.end method
