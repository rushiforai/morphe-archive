.class public final Ll/i3w0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y3w0;


# instance fields
.field public final a:Ll/y3w0;

.field public b:Ll/p5u0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/y3w0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/i3w0;->a:Ll/y3w0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final bridge synthetic a(Ll/z3w0;Ll/x3w0;Ljava/lang/Object;)Ll/hpr;
    .locals 0
    .param p3    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p3, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3}, Ll/i3w0;->c(Ll/z3w0;Ll/x3w0;Ll/p5u0;)Ll/hpr;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public final declared-synchronized b()Ll/p5u0;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/i3w0;->b:Ll/p5u0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-object v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public final declared-synchronized c(Ll/z3w0;Ll/x3w0;Ll/p5u0;)Ll/hpr;
    .locals 1
    .param p3    # Ll/p5u0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p3, p0, Ll/i3w0;->b:Ll/p5u0;

    .line 3
    .line 4
    iget-object v0, p1, Ll/z3w0;->a:Lcom/google/android/gms/internal/ads/zzbze;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {p3}, Ll/p5u0;->zzb()Ll/z0u0;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    iget-object p1, p1, Ll/z3w0;->a:Lcom/google/android/gms/internal/ads/zzbze;

    .line 13
    .line 14
    invoke-static {p1}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p2, p1}, Ll/z0u0;->k(Ll/hpr;)Ll/hpr;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p2, p1}, Ll/z0u0;->i(Ll/hpr;)Ll/hpr;

    .line 23
    .line 24
    .line 25
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    monitor-exit p0

    .line 27
    return-object p1

    .line 28
    :catchall_0
    move-exception p1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    :try_start_1
    iget-object v0, p0, Ll/i3w0;->a:Ll/y3w0;

    .line 31
    .line 32
    check-cast v0, Ll/h3w0;

    .line 33
    .line 34
    invoke-virtual {v0, p1, p2, p3}, Ll/h3w0;->c(Ll/z3w0;Ll/x3w0;Ll/p5u0;)Ll/hpr;

    .line 35
    .line 36
    .line 37
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    monitor-exit p0

    .line 39
    return-object p1

    .line 40
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 41
    throw p1
.end method

.method public final bridge synthetic zzd()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/i3w0;->b()Ll/p5u0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
