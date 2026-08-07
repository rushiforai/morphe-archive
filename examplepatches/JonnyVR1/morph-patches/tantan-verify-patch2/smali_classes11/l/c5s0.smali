.class public final Ll/c5s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final a:Ll/b4s0;

.field public final b:Ll/fzr0;


# direct methods
.method public constructor <init>(Ll/b4s0;Ll/fzr0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/c5s0;->a:Ll/b4s0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/c5s0;->b:Ll/fzr0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final bridge synthetic call()Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/c5s0;->a:Ll/b4s0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/b4s0;->l()Ljava/util/concurrent/Future;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/c5s0;->a:Ll/b4s0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/b4s0;->l()Ljava/util/concurrent/Future;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/c5s0;->a:Ll/b4s0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/b4s0;->c()Lcom/google/android/gms/internal/ads/n;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    :try_start_0
    iget-object v1, p0, Ll/c5s0;->b:Ll/fzr0;

    .line 27
    .line 28
    monitor-enter v1
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzhag; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    :try_start_1
    iget-object p0, p0, Ll/c5s0;->b:Ll/fzr0;

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/h5;->h()[B

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {}, Ll/jhx0;->a()Ll/jhx0;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    array-length v3, v0

    .line 40
    const/4 v4, 0x0

    .line 41
    invoke-virtual {p0, v0, v4, v3, v2}, Ll/shx0;->l([BIILl/jhx0;)Ll/shx0;

    .line 42
    .line 43
    .line 44
    monitor-exit v1

    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception p0

    .line 47
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    :try_start_2
    throw p0
    :try_end_2
    .catch Lcom/google/android/gms/internal/ads/zzhag; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_0

    .line 49
    :catch_0
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method
