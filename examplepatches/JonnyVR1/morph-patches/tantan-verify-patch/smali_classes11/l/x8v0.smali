.class public final Ll/x8v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/afu0;


# instance fields
.field public a:Z
    .annotation build Landroidx/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field public b:Z
    .annotation build Landroidx/annotation/GuardedBy;
        value = "this"
    .end annotation
.end field

.field public final c:Ljava/lang/String;

.field public final d:Ll/vcw0;

.field public final e:Ll/grw0;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll/vcw0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/x8v0;->a:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/x8v0;->b:Z

    .line 8
    .line 9
    iput-object p1, p0, Ll/x8v0;->c:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p2, p0, Ll/x8v0;->d:Ll/vcw0;

    .line 12
    .line 13
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ll/ebt0;->i()Ll/grw0;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Ll/x8v0;->e:Ll/grw0;

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Ll/ucw0;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/x8v0;->e:Ll/grw0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/grw0;->f()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Ll/x8v0;->c:Ljava/lang/String;

    .line 13
    .line 14
    :goto_0
    invoke-static {p1}, Ll/ucw0;->b(Ljava/lang/String;)Ll/ucw0;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    const/16 v2, 0xa

    .line 27
    .line 28
    invoke-static {v0, v1, v2}, Ljava/lang/Long;->toString(JI)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "tms"

    .line 33
    .line 34
    invoke-virtual {p1, v1, v0}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 35
    .line 36
    .line 37
    const-string v0, "tid"

    .line 38
    .line 39
    invoke-virtual {p1, v0, p0}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 40
    .line 41
    .line 42
    return-object p1
.end method

.method public final b(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "adapter_init_finished"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/x8v0;->a(Ljava/lang/String;)Ll/ucw0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "ancn"

    .line 8
    .line 9
    invoke-virtual {v0, v1, p1}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 10
    .line 11
    .line 12
    const-string p1, "rqe"

    .line 13
    .line 14
    invoke-virtual {v0, p1, p2}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/x8v0;->d:Ll/vcw0;

    .line 18
    .line 19
    invoke-interface {p0, v0}, Ll/vcw0;->a(Ll/ucw0;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final z(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "adapter_init_finished"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/x8v0;->a(Ljava/lang/String;)Ll/ucw0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "ancn"

    .line 8
    .line 9
    invoke-virtual {v0, v1, p1}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/x8v0;->d:Ll/vcw0;

    .line 13
    .line 14
    invoke-interface {p0, v0}, Ll/vcw0;->a(Ll/ucw0;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final zza(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string p1, "aaia"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/x8v0;->a(Ljava/lang/String;)Ll/ucw0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "aair"

    .line 8
    .line 9
    const-string v1, "MalformedJson"

    .line 10
    .line 11
    invoke-virtual {p1, v0, v1}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/x8v0;->d:Ll/vcw0;

    .line 15
    .line 16
    invoke-interface {p0, p1}, Ll/vcw0;->a(Ll/ucw0;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final zzc(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "adapter_init_started"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/x8v0;->a(Ljava/lang/String;)Ll/ucw0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "ancn"

    .line 8
    .line 9
    invoke-virtual {v0, v1, p1}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/x8v0;->d:Ll/vcw0;

    .line 13
    .line 14
    invoke-interface {p0, v0}, Ll/vcw0;->a(Ll/ucw0;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final declared-synchronized zze()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/x8v0;->b:Z

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Ll/x8v0;->d:Ll/vcw0;

    .line 7
    .line 8
    const-string v1, "init_finished"

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Ll/x8v0;->a(Ljava/lang/String;)Ll/ucw0;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-interface {v0, v1}, Ll/vcw0;->a(Ll/ucw0;)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Ll/x8v0;->b:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    monitor-exit p0

    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    monitor-exit p0

    .line 25
    return-void

    .line 26
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    throw v0
.end method

.method public final declared-synchronized zzf()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/x8v0;->a:Z

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Ll/x8v0;->d:Ll/vcw0;

    .line 7
    .line 8
    const-string v1, "init_started"

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Ll/x8v0;->a(Ljava/lang/String;)Ll/ucw0;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-interface {v0, v1}, Ll/vcw0;->a(Ll/ucw0;)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Ll/x8v0;->a:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    monitor-exit p0

    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    monitor-exit p0

    .line 25
    return-void

    .line 26
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    throw v0
.end method
