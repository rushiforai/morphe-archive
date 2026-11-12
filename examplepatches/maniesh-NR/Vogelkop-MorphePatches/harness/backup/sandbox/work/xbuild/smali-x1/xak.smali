.class public final Lxak;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field public static final h:Ljava/lang/Object;


# instance fields
.field public final a:Ljava/util/concurrent/Executor;

.field public final b:Lv6f;

.field public final c:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final d:Ljava/util/concurrent/atomic/AtomicReference;

.field public e:Ljava/lang/Object;

.field public f:I

.field public g:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lxak;->h:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/Executor;Lv6f;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lxak;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    sget-object v0, Lxak;->h:Ljava/lang/Object;

    iput-object v0, p0, Lxak;->e:Ljava/lang/Object;

    const/4 v0, -0x1

    iput v0, p0, Lxak;->f:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lxak;->g:Z

    iput-object p1, p0, Lxak;->d:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object p2, p0, Lxak;->a:Ljava/util/concurrent/Executor;

    iput-object p3, p0, Lxak;->b:Lv6f;

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 3

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lxak;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_b

    monitor-exit p0

    return-void

    :cond_b
    iget v0, p0, Lxak;->f:I

    if-gt p1, v0, :cond_11

    monitor-exit p0

    return-void

    :cond_11
    iput p1, p0, Lxak;->f:I

    iget-boolean p1, p0, Lxak;->g:Z

    if-eqz p1, :cond_19

    monitor-exit p0

    return-void

    :cond_19
    const/4 p1, 0x1

    iput-boolean p1, p0, Lxak;->g:Z

    monitor-exit p0
    :try_end_1d
    .catchall {:try_start_1 .. :try_end_1d} :catchall_2f

    :try_start_1d
    iget-object p1, p0, Lxak;->a:Ljava/util/concurrent/Executor;

    invoke-interface {p1, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_22
    .catchall {:try_start_1d .. :try_end_22} :catchall_23

    return-void

    :catchall_23
    monitor-enter p0

    const/4 p1, 0x0

    :try_start_25
    iput-boolean p1, p0, Lxak;->g:Z

    monitor-exit p0

    return-void

    :goto_29
    monitor-exit p0
    :try_end_2a
    .catchall {:try_start_25 .. :try_end_2a} :catchall_2b

    throw p1

    :catchall_2b
    move-exception p1

    goto :goto_29

    :goto_2d
    :try_start_2d
    monitor-exit p0
    :try_end_2e
    .catchall {:try_start_2d .. :try_end_2e} :catchall_2f

    throw p1

    :catchall_2f
    move-exception p1

    goto :goto_2d
.end method

.method public final run()V
    .registers 6

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lxak;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_e

    iput-boolean v1, p0, Lxak;->g:Z

    monitor-exit p0

    return-void

    :cond_e
    iget-object v0, p0, Lxak;->d:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    iget v2, p0, Lxak;->f:I

    monitor-exit p0
    :try_end_17
    .catchall {:try_start_1 .. :try_end_17} :catchall_50

    :goto_17
    iget-object v3, p0, Lxak;->e:Ljava/lang/Object;

    invoke-static {v3, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2f

    iput-object v0, p0, Lxak;->e:Ljava/lang/Object;

    instance-of v3, v0, Lro2;

    iget-object v4, p0, Lxak;->b:Lv6f;

    if-eqz v3, :cond_2c

    const/4 v0, 0x0

    invoke-interface {v4, v0}, Lv6f;->onError(Ljava/lang/Throwable;)V

    goto :goto_2f

    :cond_2c
    invoke-interface {v4, v0}, Lv6f;->a(Ljava/lang/Object;)V

    :cond_2f
    :goto_2f
    monitor-enter p0

    :try_start_30
    iget v0, p0, Lxak;->f:I

    if-eq v2, v0, :cond_46

    iget-object v0, p0, Lxak;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_46

    iget-object v0, p0, Lxak;->d:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    iget v2, p0, Lxak;->f:I

    monitor-exit p0

    goto :goto_17

    :cond_46
    iput-boolean v1, p0, Lxak;->g:Z

    monitor-exit p0

    return-void

    :goto_4a
    monitor-exit p0
    :try_end_4b
    .catchall {:try_start_30 .. :try_end_4b} :catchall_4c

    throw v0

    :catchall_4c
    move-exception v0

    goto :goto_4a

    :goto_4e
    :try_start_4e
    monitor-exit p0
    :try_end_4f
    .catchall {:try_start_4e .. :try_end_4f} :catchall_50

    throw v0

    :catchall_50
    move-exception v0

    goto :goto_4e
.end method
