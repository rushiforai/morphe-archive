.class public final Ll/ols0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/bou0;

.field public final b:Ljava/util/concurrent/Executor;

.field public final c:Ljava/util/concurrent/atomic/AtomicReference;

.field public final d:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method public constructor <init>(Ll/bou0;Ljava/util/concurrent/Executor;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ols0;->c:Ljava/util/concurrent/atomic/AtomicReference;

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/ols0;->d:Ljava/util/concurrent/atomic/AtomicReference;

    .line 17
    .line 18
    iput-object p1, p0, Ll/ols0;->a:Ll/bou0;

    .line 19
    .line 20
    iput-object p2, p0, Ll/ols0;->b:Ljava/util/concurrent/Executor;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final synthetic a(Ll/e6s0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ols0;->d:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/kbs0;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/kbs0;-><init>(Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 9
    .line 10
    .line 11
    new-instance p0, Ll/rcs0;

    .line 12
    .line 13
    invoke-direct {p0}, Ll/rcs0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0, p0}, Ll/e6s0;->g(Ll/sfk0$b;Ll/sfk0$a;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final b(Ll/sfk0$b;Ll/sfk0$a;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/pot0;->a()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ols0;->c:Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ll/eos0;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    new-instance p0, Lcom/google/android/gms/internal/consent_sdk/zzg;

    .line 15
    .line 16
    const/4 p1, 0x3

    .line 17
    const-string v0, "No available form can be built."

    .line 18
    .line 19
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/consent_sdk/zzg;-><init>(ILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/google/android/gms/internal/consent_sdk/zzg;->zza()Ll/m1j;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p2, p0}, Ll/sfk0$a;->b(Ll/m1j;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object p0, p0, Ll/ols0;->a:Ll/bou0;

    .line 31
    .line 32
    invoke-interface {p0}, Ll/bou0;->zza()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Ll/tyr0;

    .line 37
    .line 38
    invoke-interface {p0, v0}, Ll/tyr0;->a(Ll/eos0;)Ll/tyr0;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-interface {p0}, Ll/tyr0;->zzb()Ll/vzr0;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-interface {p0}, Ll/vzr0;->zza()Ll/e6s0;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0, p1, p2}, Ll/e6s0;->g(Ll/sfk0$b;Ll/sfk0$a;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final c()V
    .locals 3
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ols0;->c:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/eos0;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string p0, "UserMessagingPlatform"

    .line 12
    .line 13
    const-string v0, "Failed to load and cache a form due to null consent form resources."

    .line 14
    .line 15
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v1, p0, Ll/ols0;->a:Ll/bou0;

    .line 20
    .line 21
    invoke-interface {v1}, Ll/bou0;->zza()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ll/tyr0;

    .line 26
    .line 27
    invoke-interface {v1, v0}, Ll/tyr0;->a(Ll/eos0;)Ll/tyr0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Ll/tyr0;->zzb()Ll/vzr0;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {v0}, Ll/vzr0;->zza()Ll/e6s0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const/4 v1, 0x1

    .line 40
    iput-boolean v1, v0, Ll/e6s0;->l:Z

    .line 41
    .line 42
    sget-object v1, Ll/pot0;->a:Landroid/os/Handler;

    .line 43
    .line 44
    new-instance v2, Ll/das0;

    .line 45
    .line 46
    invoke-direct {v2, p0, v0}, Ll/das0;-><init>(Ll/ols0;Ll/e6s0;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final d(Ll/eos0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ols0;->c:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
