.class public abstract Lfnb;
.super Lorg/chromium/net/UploadDataSink;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final b:Lenb;

.field public final c:Lonb;

.field public final d:Ltom;

.field public e:Ljava/nio/ByteBuffer;

.field public f:J

.field public g:J

.field public h:I


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Lonb;Ltom;)V
    .registers 6

    invoke-direct {p0}, Lorg/chromium/net/UploadDataSink;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lfnb;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Lenb;

    invoke-direct {v0, p0, p1}, Lenb;-><init>(Lfnb;Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lfnb;->b:Lenb;

    iput-object p2, p0, Lfnb;->c:Lonb;

    new-instance p1, Ltom;

    const/4 p2, 0x1

    invoke-direct {p1, p3, p2}, Ltom;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lfnb;->d:Ltom;

    return-void
.end method


# virtual methods
.method public final a(Lgnb;Ljava/lang/String;)V
    .registers 5

    const-string v0, "JavaUploadDataSinkBase#executeOnExecutor "

    invoke-virtual {v0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Llni;->h(Ljava/lang/String;)V

    :try_start_9
    iget-object p0, p0, Lfnb;->c:Lonb;

    new-instance v0, Lzr9;

    const/16 v1, 0xb

    invoke-direct {v0, p2, p1, v1}, Lzr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lonb;->execute(Ljava/lang/Runnable;)V
    :try_end_15
    .catchall {:try_start_9 .. :try_end_15} :catchall_19

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :catchall_19
    move-exception p0

    :try_start_1a
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_1d
    .catchall {:try_start_1a .. :try_end_1d} :catchall_1e

    goto :goto_22

    :catchall_1e
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_22
    throw p0
.end method

.method public final b(Lqnb;Ljava/lang/String;)V
    .registers 6

    const-string v0, "Cronet JavaUploadDataSinkBase#executeOnUploadExecutor "

    :try_start_2
    invoke-virtual {v0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Llni;->h(Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_2 .. :try_end_9} :catch_23

    :try_start_9
    iget-object v0, p0, Lfnb;->b:Lenb;

    new-instance v1, Lgl6;

    const/16 v2, 0x1a

    invoke-direct {v1, p0, p2, p1, v2}, Lgl6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lenb;->execute(Ljava/lang/Runnable;)V
    :try_end_15
    .catchall {:try_start_9 .. :try_end_15} :catchall_19

    :try_start_15
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_18
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_15 .. :try_end_18} :catch_23

    return-void

    :catchall_19
    move-exception p1

    :try_start_1a
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_1d
    .catchall {:try_start_1a .. :try_end_1d} :catchall_1e

    goto :goto_22

    :catchall_1e
    move-exception p2

    :try_start_1f
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_22
    throw p1
    :try_end_23
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1f .. :try_end_23} :catch_23

    :catch_23
    move-exception p1

    invoke-virtual {p0, p1}, Lfnb;->c(Ljava/lang/Exception;)V

    return-void
.end method

.method public abstract c(Ljava/lang/Exception;)V
.end method

.method public final onReadError(Ljava/lang/Exception;)V
    .registers 2

    invoke-virtual {p0, p1}, Lfnb;->c(Ljava/lang/Exception;)V

    return-void
.end method

.method public final onReadSucceeded(Z)V
    .registers 5

    iget-object v0, p0, Lfnb;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v1

    if-eqz v1, :cond_20

    new-instance v0, Lvw;

    const/4 v1, 0x6

    invoke-direct {v0, v1, p0, p1}, Lvw;-><init>(BLjava/lang/Object;Z)V

    move-object p1, p0

    check-cast p1, Lnnb;

    new-instance v1, Lgnb;

    iget-object p1, p1, Lnnb;->m:Lpnb;

    invoke-direct {v1, p1, v0, v2}, Lgnb;-><init>(Lpnb;Lqnb;B)V

    const-string p1, "onReadSucceeded"

    invoke-virtual {p0, v1, p1}, Lfnb;->a(Lgnb;Ljava/lang/String;)V

    return-void

    :cond_20
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p0

    const-string p1, "onReadSucceeded() called when not awaiting a read result; in state: "

    invoke-static {p0, p1}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method

.method public final onRewindError(Ljava/lang/Exception;)V
    .registers 2

    invoke-virtual {p0, p1}, Lfnb;->c(Ljava/lang/Exception;)V

    return-void
.end method

.method public final onRewindSucceeded()V
    .registers 5

    iget-object v0, p0, Lfnb;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v3

    if-eqz v3, :cond_1f

    new-instance v0, Lcnb;

    invoke-direct {v0, p0, v1}, Lcnb;-><init>(Lfnb;B)V

    move-object v1, p0

    check-cast v1, Lnnb;

    new-instance v3, Lgnb;

    iget-object v1, v1, Lnnb;->m:Lpnb;

    invoke-direct {v3, v1, v0, v2}, Lgnb;-><init>(Lpnb;Lqnb;B)V

    const-string v0, "startRead"

    invoke-virtual {p0, v3, v0}, Lfnb;->a(Lgnb;Ljava/lang/String;)V

    return-void

    :cond_1f
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p0

    const-string v0, "onRewindSucceeded() called when not awaiting a rewind; in state: "

    invoke-static {p0, v0}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method
