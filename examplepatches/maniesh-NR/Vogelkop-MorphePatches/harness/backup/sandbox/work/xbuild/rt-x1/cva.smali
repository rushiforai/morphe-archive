.class public final Lcva;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/MessageQueue$IdleHandler;


# instance fields
.field public final a:Landroid/os/MessageQueue;

.field public final b:Ljava/util/ArrayDeque;

.field public c:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-static {}, Landroid/os/Looper;->myQueue()Landroid/os/MessageQueue;

    move-result-object v0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Ljava/util/ArrayDeque;

    invoke-direct {v1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v1, p0, Lcva;->b:Ljava/util/ArrayDeque;

    iput-object v0, p0, Lcva;->a:Landroid/os/MessageQueue;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Runnable;)V
    .registers 4

    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcva;->b(Ljava/lang/Runnable;J)V

    return-void
.end method

.method public final b(Ljava/lang/Runnable;J)V
    .registers 6

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-eqz v0, :cond_c

    new-instance v1, Lbva;

    invoke-direct {v1, p0, p1}, Lbva;-><init>(Lcva;Ljava/lang/Runnable;)V

    move-object p1, v1

    :cond_c
    iget-object v1, p0, Lcva;->b:Ljava/util/ArrayDeque;

    invoke-virtual {v1, p1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    if-eqz v0, :cond_16

    invoke-static {p1, p2, p3}, Lvml;->d(Ljava/lang/Runnable;J)V

    :cond_16
    iget-boolean p1, p0, Lcva;->c:Z

    if-nez p1, :cond_22

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcva;->c:Z

    iget-object p1, p0, Lcva;->a:Landroid/os/MessageQueue;

    invoke-virtual {p1, p0}, Landroid/os/MessageQueue;->addIdleHandler(Landroid/os/MessageQueue$IdleHandler;)V

    :cond_22
    return-void
.end method

.method public final c(Ljava/lang/Runnable;)Z
    .registers 6

    iget-object v0, p0, Lcva;->b:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Runnable;

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1c

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_30

    :cond_1c
    instance-of v3, v2, Lbva;

    if-eqz v3, :cond_6

    move-object v3, v2

    check-cast v3, Lbva;

    iget-object v3, v3, Lbva;->a:Ljava/lang/Runnable;

    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_30

    :cond_2f
    const/4 v2, 0x0

    :goto_30
    instance-of p1, v2, Lbva;

    if-eqz p1, :cond_37

    invoke-static {v2}, Lvml;->a(Ljava/lang/Runnable;)V

    :cond_37
    const/4 p1, 0x0

    if-eqz v2, :cond_47

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_47

    iput-boolean p1, p0, Lcva;->c:Z

    iget-object v0, p0, Lcva;->a:Landroid/os/MessageQueue;

    invoke-virtual {v0, p0}, Landroid/os/MessageQueue;->removeIdleHandler(Landroid/os/MessageQueue$IdleHandler;)V

    :cond_47
    if-eqz v2, :cond_4b

    const/4 p0, 0x1

    return p0

    :cond_4b
    return p1
.end method

.method public final queueIdle()Z
    .registers 4

    iget-object v0, p0, Lcva;->b:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_a

    return v2

    :cond_a
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_20

    iput-boolean v2, p0, Lcva;->c:Z

    iget-object v1, p0, Lcva;->a:Landroid/os/MessageQueue;

    invoke-virtual {v1, p0}, Landroid/os/MessageQueue;->removeIdleHandler(Landroid/os/MessageQueue$IdleHandler;)V

    :cond_20
    xor-int/lit8 v0, v0, 0x1

    return v0
.end method
