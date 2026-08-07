.class public final Ll/j6x0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Ll/j6x0;


# instance fields
.field public final a:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ll/h6x0;->a:Ll/h6x0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/zzgpl;->zza(Ll/t7x0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/j6x0;

    .line 8
    .line 9
    sput-object v0, Ll/j6x0;->b:Ll/j6x0;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    new-instance v1, Ll/m7x0;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/m7x0;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v2, Ll/s7x0;

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-direct {v2, v1, v3}, Ll/s7x0;-><init>(Ll/m7x0;Ll/r7x0;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/j6x0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 21
    .line 22
    return-void
.end method

.method public static d()Ll/j6x0;
    .locals 1

    .line 1
    sget-object v0, Ll/j6x0;->b:Ll/j6x0;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public final a(Ll/l7x0;Ll/ayw0;)Ll/xww0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/j6x0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/s7x0;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/s7x0;->a(Ll/l7x0;Ll/ayw0;)Ll/xww0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final b(Ll/c7x0;Ll/ayw0;)Ll/xww0;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/j6x0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/s7x0;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/s7x0;->i(Ll/l7x0;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance p0, Ll/q5x0;

    .line 16
    .line 17
    invoke-direct {p0, p1, p2}, Ll/q5x0;-><init>(Ll/c7x0;Ll/ayw0;)V

    .line 18
    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/j6x0;->a(Ll/l7x0;Ll/ayw0;)Ll/xww0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final c(Ll/l7x0;)Ll/lxw0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/j6x0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/s7x0;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/s7x0;->b(Ll/l7x0;)Ll/lxw0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final e(Ll/xww0;Ljava/lang/Class;Ll/ayw0;)Ll/l7x0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/j6x0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/s7x0;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2, p3}, Ll/s7x0;->c(Ll/xww0;Ljava/lang/Class;Ll/ayw0;)Ll/l7x0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final f(Ll/lxw0;Ljava/lang/Class;)Ll/l7x0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/j6x0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/s7x0;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/s7x0;->d(Ll/lxw0;Ljava/lang/Class;)Ll/l7x0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final declared-synchronized g(Ll/j5x0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Ll/m7x0;

    .line 3
    .line 4
    iget-object v1, p0, Ll/j6x0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Ll/s7x0;

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ll/m7x0;-><init>(Ll/s7x0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ll/m7x0;->a(Ll/j5x0;)Ll/m7x0;

    .line 16
    .line 17
    .line 18
    new-instance p1, Ll/s7x0;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-direct {p1, v0, v1}, Ll/s7x0;-><init>(Ll/m7x0;Ll/r7x0;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/j6x0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    monitor-exit p0

    .line 30
    return-void

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    throw p1
.end method

.method public final declared-synchronized h(Ll/n5x0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Ll/m7x0;

    .line 3
    .line 4
    iget-object v1, p0, Ll/j6x0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Ll/s7x0;

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ll/m7x0;-><init>(Ll/s7x0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ll/m7x0;->b(Ll/n5x0;)Ll/m7x0;

    .line 16
    .line 17
    .line 18
    new-instance p1, Ll/s7x0;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-direct {p1, v0, v1}, Ll/s7x0;-><init>(Ll/m7x0;Ll/r7x0;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/j6x0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    monitor-exit p0

    .line 30
    return-void

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    throw p1
.end method

.method public final declared-synchronized i(Ll/n6x0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Ll/m7x0;

    .line 3
    .line 4
    iget-object v1, p0, Ll/j6x0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Ll/s7x0;

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ll/m7x0;-><init>(Ll/s7x0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ll/m7x0;->c(Ll/n6x0;)Ll/m7x0;

    .line 16
    .line 17
    .line 18
    new-instance p1, Ll/s7x0;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-direct {p1, v0, v1}, Ll/s7x0;-><init>(Ll/m7x0;Ll/r7x0;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/j6x0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    monitor-exit p0

    .line 30
    return-void

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    throw p1
.end method

.method public final declared-synchronized j(Ll/r6x0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Ll/m7x0;

    .line 3
    .line 4
    iget-object v1, p0, Ll/j6x0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Ll/s7x0;

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ll/m7x0;-><init>(Ll/s7x0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ll/m7x0;->d(Ll/r6x0;)Ll/m7x0;

    .line 16
    .line 17
    .line 18
    new-instance p1, Ll/s7x0;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-direct {p1, v0, v1}, Ll/s7x0;-><init>(Ll/m7x0;Ll/r7x0;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/j6x0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    monitor-exit p0

    .line 30
    return-void

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    throw p1
.end method

.method public final k(Ll/l7x0;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j6x0;->a:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/s7x0;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/s7x0;->j(Ll/l7x0;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method
