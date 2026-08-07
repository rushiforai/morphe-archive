.class public final Ll/zbs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;


# instance fields
.field public final synthetic a:Lcom/google/android/gms/internal/ads/zzbbb;

.field public final synthetic b:Ll/tct0;

.field public final synthetic c:Ll/bcs0;


# direct methods
.method public constructor <init>(Ll/bcs0;Lcom/google/android/gms/internal/ads/zzbbb;Ll/tct0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/zbs0;->a:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 2
    .line 3
    iput-object p3, p0, Ll/zbs0;->b:Ll/tct0;

    .line 4
    .line 5
    iput-object p1, p0, Ll/zbs0;->c:Ll/bcs0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onConnected(Landroid/os/Bundle;)V
    .locals 5
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Ll/zbs0;->c:Ll/bcs0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bcs0;->b(Ll/bcs0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    monitor-enter p1

    .line 8
    :try_start_0
    iget-object v0, p0, Ll/zbs0;->c:Ll/bcs0;

    .line 9
    .line 10
    invoke-static {v0}, Ll/bcs0;->f(Ll/bcs0;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    monitor-exit p1

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x1

    .line 21
    invoke-static {v0, v1}, Ll/bcs0;->d(Ll/bcs0;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/zbs0;->c:Ll/bcs0;

    .line 25
    .line 26
    invoke-static {v0}, Ll/bcs0;->a(Ll/bcs0;)Ll/rbs0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    monitor-exit p1

    .line 33
    return-void

    .line 34
    :cond_1
    sget-object v1, Ll/oct0;->a:Ll/xvw0;

    .line 35
    .line 36
    iget-object v2, p0, Ll/zbs0;->a:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 37
    .line 38
    iget-object v3, p0, Ll/zbs0;->b:Ll/tct0;

    .line 39
    .line 40
    new-instance v4, Ll/wbs0;

    .line 41
    .line 42
    invoke-direct {v4, p0, v0, v2, v3}, Ll/wbs0;-><init>(Ll/zbs0;Ll/rbs0;Lcom/google/android/gms/internal/ads/zzbbb;Ll/tct0;)V

    .line 43
    .line 44
    .line 45
    invoke-interface {v1, v4}, Ll/xvw0;->a(Ljava/lang/Runnable;)Ll/hpr;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object p0, p0, Ll/zbs0;->b:Ll/tct0;

    .line 50
    .line 51
    new-instance v1, Ll/xbs0;

    .line 52
    .line 53
    invoke-direct {v1, p0, v0}, Ll/xbs0;-><init>(Ll/tct0;Ljava/util/concurrent/Future;)V

    .line 54
    .line 55
    .line 56
    sget-object v0, Ll/oct0;->f:Ll/xvw0;

    .line 57
    .line 58
    invoke-virtual {p0, v1, v0}, Ll/tct0;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    .line 59
    .line 60
    .line 61
    monitor-exit p1

    .line 62
    return-void

    .line 63
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    throw p0
.end method

.method public final onConnectionSuspended(I)V
    .locals 0

    .line 1
    return-void
.end method
