.class public final Ll/mjv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/myv0;


# instance fields
.field public final a:Ll/g6u0;

.field public final b:Ll/h7u0;

.field public final c:Ll/igu0;

.field public final d:Ll/agu0;

.field public final e:Ll/hvt0;

.field public final f:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>(Ll/g6u0;Ll/h7u0;Ll/igu0;Ll/agu0;Ll/hvt0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/mjv0;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 11
    .line 12
    iput-object p1, p0, Ll/mjv0;->a:Ll/g6u0;

    .line 13
    .line 14
    iput-object p2, p0, Ll/mjv0;->b:Ll/h7u0;

    .line 15
    .line 16
    iput-object p3, p0, Ll/mjv0;->c:Ll/igu0;

    .line 17
    .line 18
    iput-object p4, p0, Ll/mjv0;->d:Ll/agu0;

    .line 19
    .line 20
    iput-object p5, p0, Ll/mjv0;->e:Ll/hvt0;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final declared-synchronized a(Landroid/view/View;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/mjv0;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :cond_0
    :try_start_1
    iget-object v0, p0, Ll/mjv0;->e:Ll/hvt0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/hvt0;->a()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/mjv0;->d:Ll/agu0;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ll/agu0;->w0(Landroid/view/View;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    .line 23
    .line 24
    monitor-exit p0

    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception p1

    .line 27
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 28
    throw p1
.end method

.method public final zzb()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mjv0;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/mjv0;->a:Ll/g6u0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/g6u0;->onAdClicked()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final zzc()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mjv0;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/mjv0;->b:Ll/h7u0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/h7u0;->zza()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/mjv0;->c:Ll/igu0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/igu0;->zza()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method
