.class public final Ll/ibt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z7s0;


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Ll/grw0;

.field public final c:Ll/gbt0;

.field public final d:Ll/fbt0;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final e:Ljava/util/HashSet;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public final f:Ljava/util/HashSet;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public g:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll/grw0;)V
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
    iput-object v0, p0, Ll/ibt0;->a:Ljava/lang/Object;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashSet;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/ibt0;->e:Ljava/util/HashSet;

    .line 17
    .line 18
    new-instance v0, Ljava/util/HashSet;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/ibt0;->f:Ljava/util/HashSet;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Ll/ibt0;->g:Z

    .line 27
    .line 28
    new-instance v0, Ll/fbt0;

    .line 29
    .line 30
    invoke-direct {v0, p1, p2}, Ll/fbt0;-><init>(Ljava/lang/String;Ll/grw0;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/ibt0;->d:Ll/fbt0;

    .line 34
    .line 35
    iput-object p2, p0, Ll/ibt0;->b:Ll/grw0;

    .line 36
    .line 37
    new-instance p1, Ll/gbt0;

    .line 38
    .line 39
    invoke-direct {p1}, Ll/gbt0;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Ll/ibt0;->c:Ll/gbt0;

    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 4

    .line 1
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iget-object v2, p0, Ll/ibt0;->b:Ll/grw0;

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-interface {v2}, Ll/grw0;->zzd()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    sub-long/2addr v0, v2

    .line 18
    sget-object p1, Ll/sgs0;->T0:Ll/dgs0;

    .line 19
    .line 20
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Ljava/lang/Long;

    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 31
    .line 32
    .line 33
    move-result-wide v2

    .line 34
    cmp-long p1, v0, v2

    .line 35
    .line 36
    iget-object v0, p0, Ll/ibt0;->d:Ll/fbt0;

    .line 37
    .line 38
    if-lez p1, :cond_0

    .line 39
    .line 40
    const/4 p1, -0x1

    .line 41
    iput p1, v0, Ll/fbt0;->d:I

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget-object p1, p0, Ll/ibt0;->b:Ll/grw0;

    .line 45
    .line 46
    invoke-interface {p1}, Ll/grw0;->zzc()I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    iput p1, v0, Ll/fbt0;->d:I

    .line 51
    .line 52
    :goto_0
    const/4 p1, 0x1

    .line 53
    iput-boolean p1, p0, Ll/ibt0;->g:Z

    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    invoke-interface {v2, v0, v1}, Ll/grw0;->q(J)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/ibt0;->b:Ll/grw0;

    .line 60
    .line 61
    iget-object p0, p0, Ll/ibt0;->d:Ll/fbt0;

    .line 62
    .line 63
    iget p0, p0, Ll/fbt0;->d:I

    .line 64
    .line 65
    invoke-interface {p1, p0}, Ll/grw0;->d(I)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final b()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ibt0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/ibt0;->d:Ll/fbt0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/fbt0;->a()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    monitor-exit v0

    .line 11
    return p0

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    throw p0
.end method

.method public final c(Lcom/google/android/gms/common/util/Clock;Ljava/lang/String;)Ll/xat0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ibt0;->c:Ll/gbt0;

    .line 2
    .line 3
    new-instance v1, Ll/xat0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/gbt0;->a()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {v1, p1, p0, v0, p2}, Ll/xat0;-><init>(Lcom/google/android/gms/common/util/Clock;Ll/ibt0;Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-object v1
.end method

.method public final d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ibt0;->c:Ll/gbt0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gbt0;->b()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final e(Ll/xat0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ibt0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/ibt0;->e:Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public final f()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ibt0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/ibt0;->d:Ll/fbt0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/fbt0;->c()V

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public final g()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ibt0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/ibt0;->d:Ll/fbt0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/fbt0;->d()V

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public final h()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ibt0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/ibt0;->d:Ll/fbt0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/fbt0;->e()V

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public final i()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ibt0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/ibt0;->d:Ll/fbt0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/fbt0;->f()V

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public final j(Lcom/google/android/gms/ads/internal/client/zzl;J)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ibt0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/ibt0;->d:Ll/fbt0;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3}, Ll/fbt0;->g(Lcom/google/android/gms/ads/internal/client/zzl;J)V

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public final k()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ibt0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/ibt0;->d:Ll/fbt0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/fbt0;->h()V

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public final l(Ljava/util/HashSet;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ibt0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/ibt0;->e:Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public final m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ibt0;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public final n(Landroid/content/Context;Ll/b9w0;)Landroid/os/Bundle;
    .locals 4

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/ibt0;->a:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter v1

    .line 9
    :try_start_0
    iget-object v2, p0, Ll/ibt0;->e:Ljava/util/HashSet;

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    iget-object v2, p0, Ll/ibt0;->e:Ljava/util/HashSet;

    .line 15
    .line 16
    invoke-virtual {v2}, Ljava/util/HashSet;->clear()V

    .line 17
    .line 18
    .line 19
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    new-instance v1, Landroid/os/Bundle;

    .line 21
    .line 22
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Ll/ibt0;->d:Ll/fbt0;

    .line 26
    .line 27
    iget-object v3, p0, Ll/ibt0;->c:Ll/gbt0;

    .line 28
    .line 29
    invoke-virtual {v3}, Ll/gbt0;->b()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v2, p1, v3}, Ll/fbt0;->b(Landroid/content/Context;Ljava/lang/String;)Landroid/os/Bundle;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string v2, "app"

    .line 38
    .line 39
    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 40
    .line 41
    .line 42
    new-instance p1, Landroid/os/Bundle;

    .line 43
    .line 44
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/ibt0;->f:Ljava/util/HashSet;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-nez v2, :cond_1

    .line 58
    .line 59
    const-string p0, "slots"

    .line 60
    .line 61
    invoke-virtual {v1, p0, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 62
    .line 63
    .line 64
    new-instance p0, Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    if-eqz v2, :cond_0

    .line 78
    .line 79
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    check-cast v2, Ll/xat0;

    .line 84
    .line 85
    invoke-virtual {v2}, Ll/xat0;->a()Landroid/os/Bundle;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_0
    const-string p1, "ads"

    .line 94
    .line 95
    invoke-virtual {v1, p1, p0}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p2, v0}, Ll/b9w0;->b(Ljava/util/HashSet;)V

    .line 99
    .line 100
    .line 101
    return-object v1

    .line 102
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    check-cast p0, Ll/hbt0;

    .line 107
    .line 108
    const/4 p0, 0x0

    .line 109
    throw p0

    .line 110
    :catchall_0
    move-exception p0

    .line 111
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 112
    throw p0
.end method
