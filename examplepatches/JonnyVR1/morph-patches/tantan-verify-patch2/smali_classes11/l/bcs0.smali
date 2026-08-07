.class public final Ll/bcs0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/rbs0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public b:Z

.field public final c:Landroid/content/Context;

.field public final d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/bcs0;->d:Ljava/lang/Object;

    .line 10
    .line 11
    iput-object p1, p0, Ll/bcs0;->c:Landroid/content/Context;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic a(Ll/bcs0;)Ll/rbs0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bcs0;->a:Ll/rbs0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic b(Ll/bcs0;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bcs0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic d(Ll/bcs0;Z)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/bcs0;->b:Z

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic e(Ll/bcs0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bcs0;->d:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/bcs0;->a:Ll/rbs0;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {v1}, Lcom/google/android/gms/common/internal/BaseGmsClient;->disconnect()V

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput-object v1, p0, Ll/bcs0;->a:Ll/rbs0;

    .line 17
    .line 18
    invoke-static {}, Landroid/os/Binder;->flushPendingCommands()V

    .line 19
    .line 20
    .line 21
    monitor-exit v0

    .line 22
    return-void

    .line 23
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public static bridge synthetic f(Ll/bcs0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bcs0;->b:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public final c(Lcom/google/android/gms/internal/ads/zzbbb;)Ljava/util/concurrent/Future;
    .locals 6

    .line 1
    new-instance v0, Ll/vbs0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vbs0;-><init>(Ll/bcs0;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/zbs0;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1, v0}, Ll/zbs0;-><init>(Ll/bcs0;Lcom/google/android/gms/internal/ads/zzbbb;Ll/tct0;)V

    .line 9
    .line 10
    .line 11
    new-instance p1, Ll/acs0;

    .line 12
    .line 13
    invoke-direct {p1, p0, v0}, Ll/acs0;-><init>(Ll/bcs0;Ll/tct0;)V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Ll/bcs0;->d:Ljava/lang/Object;

    .line 17
    .line 18
    monitor-enter v2

    .line 19
    :try_start_0
    new-instance v3, Ll/rbs0;

    .line 20
    .line 21
    iget-object v4, p0, Ll/bcs0;->c:Landroid/content/Context;

    .line 22
    .line 23
    invoke-static {}, Ll/bxy0;->v()Ll/y1t0;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    invoke-virtual {v5}, Ll/y1t0;->b()Landroid/os/Looper;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    invoke-direct {v3, v4, v5, v1, p1}, Ll/rbs0;-><init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;)V

    .line 32
    .line 33
    .line 34
    iput-object v3, p0, Ll/bcs0;->a:Ll/rbs0;

    .line 35
    .line 36
    invoke-virtual {v3}, Lcom/google/android/gms/common/internal/BaseGmsClient;->checkAvailabilityAndConnect()V

    .line 37
    .line 38
    .line 39
    monitor-exit v2

    .line 40
    return-object v0

    .line 41
    :catchall_0
    move-exception p0

    .line 42
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    throw p0
.end method
