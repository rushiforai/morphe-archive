.class public final Lp1j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqmi;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lqie;Lq1j;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lp1j;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lp1j;->d:Ljava/lang/Object;

    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object p1, p0, Lp1j;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p2, p0, Lp1j;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Luml;Ljava/lang/Runnable;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lp1j;->a:B

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lp1j;->c:Ljava/lang/Object;

    iput-object p1, p0, Lp1j;->d:Ljava/lang/Object;

    .line 19
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object p1, p0, Lp1j;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method


# virtual methods
.method public final cancel(Z)Z
    .registers 6

    iget-byte v0, p0, Lp1j;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_66

    iget-object p1, p0, Lp1j;->c:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Runnable;

    iget-object v0, p0, Lp1j;->d:Ljava/lang/Object;

    check-cast v0, Luml;

    iget-object v0, v0, Luml;->a:Landroid/os/Handler;

    iget-object p0, p0, Lp1j;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result p0

    if-nez p0, :cond_1f

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->hasMessages(ILjava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_21

    :cond_1f
    move v1, v2

    goto :goto_24

    :cond_21
    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->removeMessages(ILjava/lang/Object;)V

    :goto_24
    return v1

    :pswitch_25
    iget-object v0, p0, Lp1j;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_60

    iget-object v0, p0, Lp1j;->c:Ljava/lang/Object;

    check-cast v0, Lq1j;

    iget-object v0, v0, Lq1j;->a:Loml;

    invoke-virtual {v0, p1}, Loml;->cancel(Z)Z

    move-result p1

    iget-object v0, p0, Lp1j;->d:Ljava/lang/Object;

    check-cast v0, Lqie;

    iget-object p0, p0, Lp1j;->c:Ljava/lang/Object;

    check-cast p0, Lq1j;

    iget-object v1, v0, Lqie;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayDeque;

    monitor-enter v1

    :try_start_44
    iget-object v2, v0, Lqie;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayDeque;

    invoke-virtual {v2}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    iget-object v3, v0, Lqie;->b:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayDeque;

    invoke-virtual {v3, p0}, Ljava/util/ArrayDeque;->remove(Ljava/lang/Object;)Z

    move-result p0

    monitor-exit v1
    :try_end_59
    .catchall {:try_start_44 .. :try_end_59} :catchall_63

    if-eqz v2, :cond_5e

    invoke-virtual {v0}, Lqie;->o()V

    :cond_5e
    or-int v2, p1, p0

    :cond_60
    return v2

    :goto_61
    :try_start_61
    monitor-exit v1
    :try_end_62
    .catchall {:try_start_61 .. :try_end_62} :catchall_63

    throw p0

    :catchall_63
    move-exception p0

    goto :goto_61

    nop

    :pswitch_data_66
    .packed-switch 0x0
        :pswitch_25
    .end packed-switch
.end method

.method public final isCancelled()Z
    .registers 2

    iget-byte v0, p0, Lp1j;->a:B

    iget-object p0, p0, Lp1j;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    packed-switch v0, :pswitch_data_12

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p0

    return p0

    :pswitch_c
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p0

    return p0

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method
