.class public final Ll/kzu0;
.super Ll/hss0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Ljava/lang/Object;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:J

.field public final synthetic d:Ll/rdw0;

.field public final synthetic e:Ll/tct0;

.field public final synthetic f:Ll/lzu0;


# direct methods
.method public constructor <init>(Ll/lzu0;Ljava/lang/Object;Ljava/lang/String;JLl/rdw0;Ll/tct0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/kzu0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    iput-object p3, p0, Ll/kzu0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-wide p4, p0, Ll/kzu0;->c:J

    .line 6
    .line 7
    iput-object p6, p0, Ll/kzu0;->d:Ll/rdw0;

    .line 8
    .line 9
    iput-object p7, p0, Ll/kzu0;->e:Ll/tct0;

    .line 10
    .line 11
    iput-object p1, p0, Ll/kzu0;->f:Ll/lzu0;

    .line 12
    .line 13
    invoke-direct {p0}, Ll/hss0;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final c(Ljava/lang/String;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/kzu0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/kzu0;->f:Ll/lzu0;

    .line 5
    .line 6
    iget-object v2, p0, Ll/kzu0;->b:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 9
    .line 10
    .line 11
    move-result-object v3

    .line 12
    invoke-interface {v3}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 13
    .line 14
    .line 15
    move-result-wide v3

    .line 16
    iget-wide v5, p0, Ll/kzu0;->c:J

    .line 17
    .line 18
    sub-long/2addr v3, v5

    .line 19
    long-to-int v3, v3

    .line 20
    const/4 v4, 0x0

    .line 21
    invoke-static {v1, v2, v4, p1, v3}, Ll/lzu0;->k(Ll/lzu0;Ljava/lang/String;ZLjava/lang/String;I)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/kzu0;->f:Ll/lzu0;

    .line 25
    .line 26
    invoke-static {v1}, Ll/lzu0;->d(Ll/lzu0;)Ll/hxu0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v2, p0, Ll/kzu0;->b:Ljava/lang/String;

    .line 31
    .line 32
    const-string v3, "error"

    .line 33
    .line 34
    invoke-virtual {v1, v2, v3}, Ll/hxu0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/kzu0;->f:Ll/lzu0;

    .line 38
    .line 39
    invoke-static {v1}, Ll/lzu0;->c(Ll/lzu0;)Ll/yeu0;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v2, p0, Ll/kzu0;->b:Ljava/lang/String;

    .line 44
    .line 45
    const-string v3, "error"

    .line 46
    .line 47
    invoke-virtual {v1, v2, v3}, Ll/yeu0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Ll/kzu0;->f:Ll/lzu0;

    .line 51
    .line 52
    invoke-static {v1}, Ll/lzu0;->e(Ll/lzu0;)Ll/hew0;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget-object v2, p0, Ll/kzu0;->d:Ll/rdw0;

    .line 57
    .line 58
    invoke-interface {v2, p1}, Ll/rdw0;->zzc(Ljava/lang/String;)Ll/rdw0;

    .line 59
    .line 60
    .line 61
    invoke-interface {v2, v4}, Ll/rdw0;->S(Z)Ll/rdw0;

    .line 62
    .line 63
    .line 64
    invoke-interface {v2}, Ll/rdw0;->zzl()Ll/vdw0;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {v1, p1}, Ll/hew0;->b(Ll/vdw0;)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Ll/kzu0;->e:Ll/tct0;

    .line 72
    .line 73
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 74
    .line 75
    invoke-virtual {p0, p1}, Ll/tct0;->b(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    monitor-exit v0

    .line 79
    return-void

    .line 80
    :catchall_0
    move-exception p0

    .line 81
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    throw p0
.end method

.method public final zzf()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/kzu0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/kzu0;->f:Ll/lzu0;

    .line 5
    .line 6
    iget-object v2, p0, Ll/kzu0;->b:Ljava/lang/String;

    .line 7
    .line 8
    const-string v3, ""

    .line 9
    .line 10
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 11
    .line 12
    .line 13
    move-result-object v4

    .line 14
    invoke-interface {v4}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 15
    .line 16
    .line 17
    move-result-wide v4

    .line 18
    iget-wide v6, p0, Ll/kzu0;->c:J

    .line 19
    .line 20
    sub-long/2addr v4, v6

    .line 21
    long-to-int v4, v4

    .line 22
    const/4 v5, 0x1

    .line 23
    invoke-static {v1, v2, v5, v3, v4}, Ll/lzu0;->k(Ll/lzu0;Ljava/lang/String;ZLjava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ll/kzu0;->f:Ll/lzu0;

    .line 27
    .line 28
    invoke-static {v1}, Ll/lzu0;->d(Ll/lzu0;)Ll/hxu0;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v2, p0, Ll/kzu0;->b:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ll/hxu0;->d(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/kzu0;->f:Ll/lzu0;

    .line 38
    .line 39
    invoke-static {v1}, Ll/lzu0;->c(Ll/lzu0;)Ll/yeu0;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v2, p0, Ll/kzu0;->b:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ll/yeu0;->z(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/kzu0;->f:Ll/lzu0;

    .line 49
    .line 50
    invoke-static {v1}, Ll/lzu0;->e(Ll/lzu0;)Ll/hew0;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iget-object v2, p0, Ll/kzu0;->d:Ll/rdw0;

    .line 55
    .line 56
    invoke-interface {v2, v5}, Ll/rdw0;->S(Z)Ll/rdw0;

    .line 57
    .line 58
    .line 59
    invoke-interface {v2}, Ll/rdw0;->zzl()Ll/vdw0;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v1, v2}, Ll/hew0;->b(Ll/vdw0;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Ll/kzu0;->e:Ll/tct0;

    .line 67
    .line 68
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 69
    .line 70
    invoke-virtual {p0, v1}, Ll/tct0;->b(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    monitor-exit v0

    .line 74
    return-void

    .line 75
    :catchall_0
    move-exception p0

    .line 76
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    throw p0
.end method
