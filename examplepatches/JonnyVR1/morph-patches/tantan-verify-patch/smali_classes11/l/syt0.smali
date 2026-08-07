.class public final Ll/syt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/k8u0;
.implements Ll/y6s0;


# instance fields
.field public final a:Ll/q6w0;

.field public final b:Ll/h7u0;

.field public final c:Ll/t8u0;

.field public final d:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final e:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>(Ll/q6w0;Ll/h7u0;Ll/t8u0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/syt0;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/syt0;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 17
    .line 18
    iput-object p1, p0, Ll/syt0;->a:Ll/q6w0;

    .line 19
    .line 20
    iput-object p2, p0, Ll/syt0;->b:Ll/h7u0;

    .line 21
    .line 22
    iput-object p3, p0, Ll/syt0;->c:Ll/t8u0;

    .line 23
    .line 24
    return-void
.end method

.method private final b()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/syt0;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

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
    iget-object p0, p0, Ll/syt0;->b:Ll/h7u0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/h7u0;->zza()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method


# virtual methods
.method public final U(Ll/x6s0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/syt0;->a:Ll/q6w0;

    .line 2
    .line 3
    iget v0, v0, Ll/q6w0;->f:I

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iget-boolean v0, p1, Ll/x6s0;->j:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-direct {p0}, Ll/syt0;->b()V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-boolean p1, p1, Ll/x6s0;->j:Z

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Ll/syt0;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p1, v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Ll/syt0;->c:Ll/t8u0;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/t8u0;->zza()V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public final declared-synchronized zzr()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/syt0;->a:Ll/q6w0;

    .line 3
    .line 4
    iget v0, v0, Ll/q6w0;->f:I

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Ll/syt0;->b()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    throw v0
.end method
