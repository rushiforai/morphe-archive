.class public final Ll/gbs0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/common/internal/BaseGmsClient$BaseOnConnectionFailedListener;


# instance fields
.field public final synthetic a:Ll/hbs0;


# direct methods
.method public constructor <init>(Ll/hbs0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gbs0;->a:Ll/hbs0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V
    .locals 3
    .param p1    # Lcom/google/android/gms/common/ConnectionResult;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Ll/gbs0;->a:Ll/hbs0;

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
    iget-object v0, p0, Ll/gbs0;->a:Ll/hbs0;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, v1}, Ll/hbs0;->k(Ll/hbs0;Ll/tbs0;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/gbs0;->a:Ll/hbs0;

    .line 15
    .line 16
    invoke-static {v0}, Ll/hbs0;->c(Ll/hbs0;)Ll/rbs0;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/hbs0;->f(Ll/hbs0;Ll/rbs0;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    iget-object p0, p0, Ll/gbs0;->a:Ll/hbs0;

    .line 29
    .line 30
    invoke-static {p0}, Ll/hbs0;->e(Ll/hbs0;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 35
    .line 36
    .line 37
    monitor-exit p1

    .line 38
    return-void

    .line 39
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    throw p0
.end method
