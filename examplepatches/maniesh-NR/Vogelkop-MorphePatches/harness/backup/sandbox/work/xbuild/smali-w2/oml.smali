.class public final Loml;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqmi;


# instance fields
.field public final a:Ln5o;

.field public final b:Lrmi;

.field public final c:Loml;

.field public final d:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method public constructor <init>(Lnml;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Loml;->d:Ljava/util/concurrent/atomic/AtomicReference;

    iget-object v0, p1, Lnml;->b:Ln5o;

    iput-object v0, p0, Loml;->a:Ln5o;

    iget-object v0, p1, Lnml;->c:Lrmi;

    iput-object v0, p0, Loml;->b:Lrmi;

    iget-object p1, p1, Lnml;->d:Loml;

    iput-object p1, p0, Loml;->c:Loml;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljri;)V
    .registers 9

    const-wide/16 v2, 0x0

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object v0, p0

    move-object v1, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    return-void
.end method

.method public final b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V
    .registers 8

    new-instance v0, Ljbd;

    const/16 v1, 0x19

    invoke-direct {v0, p0, p1, p5, v1}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p1, p0, Loml;->b:Lrmi;

    invoke-interface {p1, v0, p2, p3, p4}, Lrmi;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Lqmi;

    move-result-object p1

    iget-object p0, p0, Loml;->d:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqmi;

    return-void
.end method

.method public final cancel(Z)Z
    .registers 3

    iget-object v0, p0, Loml;->d:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqmi;

    if-nez v0, :cond_c

    const/4 p0, 0x0

    return p0

    :cond_c
    invoke-interface {v0, p1}, Lqmi;->cancel(Z)Z

    move-result v0

    iget-object p0, p0, Loml;->c:Loml;

    if-eqz p0, :cond_17

    invoke-virtual {p0, p1}, Loml;->cancel(Z)Z

    :cond_17
    return v0
.end method

.method public final isCancelled()Z
    .registers 1

    iget-object p0, p0, Loml;->d:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqmi;

    if-eqz p0, :cond_12

    invoke-interface {p0}, Lqmi;->isCancelled()Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method
