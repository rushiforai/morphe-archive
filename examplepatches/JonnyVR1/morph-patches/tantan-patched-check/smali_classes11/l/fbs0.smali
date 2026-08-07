.class public final Ll/fbs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/internal/BaseGmsClient$BaseConnectionCallbacks;


# instance fields
.field public final synthetic a:Ll/hbs0;


# direct methods
.method public constructor <init>(Ll/hbs0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fbs0;->a:Ll/hbs0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onConnected(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Ll/fbs0;->a:Ll/hbs0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/hbs0;->e(Ll/hbs0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    monitor-enter p1

    .line 8
    :try_start_0
    iget-object v0, p0, Ll/fbs0;->a:Ll/hbs0;

    .line 9
    .line 10
    invoke-static {v0}, Ll/hbs0;->c(Ll/hbs0;)Ll/rbs0;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-static {v0}, Ll/hbs0;->c(Ll/hbs0;)Ll/rbs0;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ll/rbs0;->d()Ll/tbs0;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {v0, v1}, Ll/hbs0;->k(Ll/hbs0;Ll/tbs0;)V
    :try_end_0
    .catch Landroid/os/DeadObjectException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_1

    .line 30
    :catch_0
    move-exception v0

    .line 31
    :try_start_1
    const-string v1, "Unable to obtain a cache service instance."

    .line 32
    .line 33
    invoke-static {v1, v0}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/fbs0;->a:Ll/hbs0;

    .line 37
    .line 38
    invoke-static {v0}, Ll/hbs0;->h(Ll/hbs0;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    :goto_0
    iget-object p0, p0, Ll/fbs0;->a:Ll/hbs0;

    .line 42
    .line 43
    invoke-static {p0}, Ll/hbs0;->e(Ll/hbs0;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 48
    .line 49
    .line 50
    monitor-exit p1

    .line 51
    return-void

    .line 52
    :goto_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 53
    throw p0
.end method

.method public final onConnectionSuspended(I)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/fbs0;->a:Ll/hbs0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/hbs0;->e(Ll/hbs0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    monitor-enter p1

    .line 8
    :try_start_0
    iget-object v0, p0, Ll/fbs0;->a:Ll/hbs0;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, v1}, Ll/hbs0;->k(Ll/hbs0;Ll/tbs0;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/fbs0;->a:Ll/hbs0;

    .line 15
    .line 16
    invoke-static {p0}, Ll/hbs0;->e(Ll/hbs0;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 21
    .line 22
    .line 23
    monitor-exit p1

    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    throw p0
.end method
