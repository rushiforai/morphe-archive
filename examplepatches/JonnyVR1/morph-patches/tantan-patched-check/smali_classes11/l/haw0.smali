.class public final Ll/haw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/h9w0;

.field public final b:Ll/faw0;

.field public final c:Ll/d9w0;

.field public final d:Ljava/util/ArrayDeque;

.field public e:Ll/naw0;

.field public f:I


# direct methods
.method public constructor <init>(Ll/h9w0;Ll/d9w0;Ll/faw0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/haw0;->f:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/haw0;->a:Ll/h9w0;

    .line 8
    .line 9
    iput-object p2, p0, Ll/haw0;->c:Ll/d9w0;

    .line 10
    .line 11
    iput-object p3, p0, Ll/haw0;->b:Ll/faw0;

    .line 12
    .line 13
    new-instance p1, Ljava/util/ArrayDeque;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/haw0;->d:Ljava/util/ArrayDeque;

    .line 19
    .line 20
    new-instance p1, Ll/caw0;

    .line 21
    .line 22
    invoke-direct {p1, p0}, Ll/caw0;-><init>(Ll/haw0;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2, p1}, Ll/d9w0;->b(Ll/caw0;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static bridge synthetic b(Ll/haw0;)Ljava/util/ArrayDeque;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/haw0;->d:Ljava/util/ArrayDeque;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic c(Ll/haw0;Ll/naw0;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Ll/haw0;->e:Ll/naw0;

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Ll/haw0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/haw0;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic g(Ll/haw0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/haw0;->f:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public final declared-synchronized a(Ll/gaw0;)Ll/hpr;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x2

    .line 3
    :try_start_0
    iput v0, p0, Ll/haw0;->f:I

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/haw0;->i()Z

    .line 6
    .line 7
    .line 8
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    monitor-exit p0

    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0

    .line 14
    :cond_0
    :try_start_1
    iget-object v0, p0, Ll/haw0;->e:Ll/naw0;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ll/naw0;->a(Ll/gaw0;)Ll/hpr;

    .line 17
    .line 18
    .line 19
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    monitor-exit p0

    .line 21
    return-object p1

    .line 22
    :catchall_0
    move-exception p1

    .line 23
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 24
    throw p1
.end method

.method public final declared-synchronized e(Ll/gaw0;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/haw0;->d:Ljava/util/ArrayDeque;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw p1
.end method

.method public final synthetic f()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x1

    .line 3
    :try_start_0
    iput v0, p0, Ll/haw0;->f:I

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/haw0;->h()V

    .line 6
    .line 7
    .line 8
    monitor-exit p0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    throw v0
.end method

.method public final declared-synchronized h()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget-object v0, Ll/sgs0;->p6:Ll/dgs0;

    .line 3
    .line 4
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/ebt0;->i()Ll/grw0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v0}, Ll/grw0;->zzh()Ll/yat0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/yat0;->h()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object v0, p0, Ll/haw0;->d:Ljava/util/ArrayDeque;

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    .line 43
    .line 44
    monitor-exit p0

    .line 45
    return-void

    .line 46
    :catchall_0
    move-exception v0

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    :goto_0
    :try_start_1
    invoke-virtual {p0}, Ll/haw0;->i()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    :cond_2
    iget-object v0, p0, Ll/haw0;->d:Ljava/util/ArrayDeque;

    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-nez v0, :cond_4

    .line 61
    .line 62
    iget-object v0, p0, Ll/haw0;->d:Ljava/util/ArrayDeque;

    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->pollFirst()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Ll/gaw0;

    .line 69
    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    invoke-interface {v0}, Ll/gaw0;->zza()Ll/v9w0;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    if-eqz v1, :cond_2

    .line 77
    .line 78
    iget-object v1, p0, Ll/haw0;->a:Ll/h9w0;

    .line 79
    .line 80
    invoke-interface {v0}, Ll/gaw0;->zza()Ll/v9w0;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-interface {v1, v2}, Ll/h9w0;->c(Ll/v9w0;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-eqz v1, :cond_2

    .line 89
    .line 90
    :cond_3
    iget-object v1, p0, Ll/haw0;->a:Ll/h9w0;

    .line 91
    .line 92
    iget-object v2, p0, Ll/haw0;->b:Ll/faw0;

    .line 93
    .line 94
    new-instance v3, Ll/naw0;

    .line 95
    .line 96
    invoke-direct {v3, v1, v2, v0}, Ll/naw0;-><init>(Ll/h9w0;Ll/faw0;Ll/gaw0;)V

    .line 97
    .line 98
    .line 99
    iput-object v3, p0, Ll/haw0;->e:Ll/naw0;

    .line 100
    .line 101
    new-instance v1, Ll/daw0;

    .line 102
    .line 103
    invoke-direct {v1, p0, v0}, Ll/daw0;-><init>(Ll/haw0;Ll/gaw0;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v3, v1}, Ll/naw0;->d(Ll/lvw0;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 107
    .line 108
    .line 109
    monitor-exit p0

    .line 110
    return-void

    .line 111
    :cond_4
    monitor-exit p0

    .line 112
    return-void

    .line 113
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 114
    throw v0
.end method

.method public final declared-synchronized i()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/haw0;->e:Ll/naw0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :catchall_0
    move-exception v0

    .line 12
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    throw v0
.end method
