.class public abstract Lldk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ltcl;

.field public final b:Lr16;

.field public final c:Z

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/util/ArrayDeque;

.field public final f:Lhd;

.field public g:Ljava/util/ArrayDeque;

.field public h:I

.field public i:Z


# direct methods
.method public constructor <init>(Ltcl;)V
    .registers 4

    sget-object v0, Lngh;->a:Lr16;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lldk;->d:Ljava/lang/Object;

    new-instance v1, Ljava/util/ArrayDeque;

    invoke-direct {v1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v1, p0, Lldk;->e:Ljava/util/ArrayDeque;

    new-instance v1, Ljava/util/ArrayDeque;

    invoke-direct {v1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v1, p0, Lldk;->g:Ljava/util/ArrayDeque;

    const/4 v1, 0x1

    iput v1, p0, Lldk;->h:I

    const/4 v1, 0x0

    iput-boolean v1, p0, Lldk;->c:Z

    iput-object p1, p0, Lldk;->a:Ltcl;

    iput-object v0, p0, Lldk;->b:Lr16;

    new-instance v0, Lhd;

    invoke-direct {v0, p0, p1}, Lhd;-><init>(Lldk;Ltcl;)V

    iput-object v0, p0, Lldk;->f:Lhd;

    return-void
.end method

.method public constructor <init>(Lumi;Z)V
    .registers 5

    sget-object v0, Lngh;->a:Lr16;

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lldk;->d:Ljava/lang/Object;

    .line 46
    new-instance v1, Ljava/util/ArrayDeque;

    invoke-direct {v1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v1, p0, Lldk;->e:Ljava/util/ArrayDeque;

    .line 47
    new-instance v1, Ljava/util/ArrayDeque;

    invoke-direct {v1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v1, p0, Lldk;->g:Ljava/util/ArrayDeque;

    const/4 v1, 0x1

    .line 48
    iput v1, p0, Lldk;->h:I

    .line 49
    iput-boolean p2, p0, Lldk;->c:Z

    .line 50
    iput-object p1, p0, Lldk;->a:Ltcl;

    .line 51
    iput-object v0, p0, Lldk;->b:Lr16;

    .line 52
    new-instance p2, Lhd;

    invoke-direct {p2, p0, p1}, Lhd;-><init>(Lldk;Ltcl;)V

    iput-object p2, p0, Lldk;->f:Lhd;

    return-void
.end method


# virtual methods
.method public abstract a()Ljava/lang/Object;
.end method

.method public abstract b(Ljava/lang/Object;)V
.end method

.method public c()I
    .registers 1

    const/4 p0, 0x2

    return p0
.end method

.method public d(Ljava/lang/Object;)V
    .registers 2

    return-void
.end method

.method public final e()V
    .registers 4

    iget-boolean v0, p0, Lldk;->i:Z

    if-nez v0, :cond_34

    iget v0, p0, Lldk;->h:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_34

    iget-object v0, p0, Lldk;->e:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkdk;

    if-eqz v0, :cond_34

    const/4 v1, 0x4

    iput v1, p0, Lldk;->h:I

    iget-object p0, v0, Lkdk;->d:Lldk;

    iget-object p0, p0, Lldk;->b:Lr16;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lngh;->b:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    if-eqz p0, :cond_2a

    :try_start_22
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_29
    .catch Ljava/lang/IllegalAccessException; {:try_start_22 .. :try_end_29} :catch_2f
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_22 .. :try_end_29} :catch_2f

    goto :goto_2f

    :cond_2a
    sget-object p0, Lngh;->d:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {p0, v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    :catch_2f
    :goto_2f
    iget-object p0, v0, Lkdk;->b:Loml;

    invoke-virtual {p0, v1, v1}, Loml;->a(Ljava/lang/Object;Ljri;)V

    :cond_34
    return-void
.end method

.method public final f(Ljava/lang/Runnable;)V
    .registers 2

    iget-object p0, p0, Lldk;->g:Ljava/util/ArrayDeque;

    if-eqz p0, :cond_8

    invoke-virtual {p0, p1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    return-void

    :cond_8
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method public final g(Ljava/lang/Object;)V
    .registers 5

    iget-object v0, p0, Lldk;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-boolean v1, p0, Lldk;->i:Z

    if-eqz v1, :cond_9

    monitor-exit v0

    return-void

    :cond_9
    iget-object v1, p0, Lldk;->e:Ljava/util/ArrayDeque;

    new-instance v2, Lkdk;

    invoke-direct {v2, p0, p1}, Lkdk;-><init>(Lldk;Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayDeque;->offer(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lldk;->e()V

    monitor-exit v0

    return-void

    :goto_18
    monitor-exit v0
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_1a

    throw p0

    :catchall_1a
    move-exception p0

    goto :goto_18
.end method

.method public final h()V
    .registers 4

    iget-object v0, p0, Lldk;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget v1, p0, Lldk;->h:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_a

    monitor-exit v0

    return-void

    :cond_a
    const/4 v1, 0x2

    iput v1, p0, Lldk;->h:I

    iget-object p0, p0, Lldk;->f:Lhd;

    iget-object p0, p0, Lhd;->d:Ljava/lang/Object;

    check-cast p0, Loml;

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v1}, Loml;->a(Ljava/lang/Object;Ljri;)V

    monitor-exit v0

    return-void

    :goto_19
    monitor-exit v0
    :try_end_1a
    .catchall {:try_start_3 .. :try_end_1a} :catchall_1b

    throw p0

    :catchall_1b
    move-exception p0

    goto :goto_19
.end method

.method public final i()V
    .registers 3

    iget-object p0, p0, Lldk;->f:Lhd;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_5
    iget-object v0, p0, Lhd;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V

    iget-object v0, p0, Lhd;->e:Ljava/lang/Object;

    check-cast v0, Loml;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    invoke-virtual {p0}, Lhd;->f()V
    :try_end_17
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_17} :catch_17

    :catch_17
    return-void
.end method
