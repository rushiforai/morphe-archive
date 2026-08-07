.class public final Ll/vus0;
.super Ll/kdt0;
.source "SourceFile"


# instance fields
.field public final c:Ljava/lang/Object;

.field public final d:Ll/avs0;

.field public e:Z


# direct methods
.method public constructor <init>(Ll/avs0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/kdt0;-><init>()V

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
    iput-object v0, p0, Ll/vus0;->c:Ljava/lang/Object;

    .line 10
    .line 11
    iput-object p1, p0, Ll/vus0;->d:Ll/avs0;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic f(Ll/vus0;)Ll/avs0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vus0;->d:Ll/avs0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final g()V
    .locals 3

    .line 1
    const-string v0, "release: Trying to acquire lock"

    .line 2
    .line 3
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/vus0;->c:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    const-string v1, "release: Lock acquired"

    .line 10
    .line 11
    invoke-static {v1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-boolean v1, p0, Ll/vus0;->e:Z

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    const-string p0, "release: Lock already released"

    .line 19
    .line 20
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    monitor-exit v0

    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v1, 0x1

    .line 28
    iput-boolean v1, p0, Ll/vus0;->e:Z

    .line 29
    .line 30
    new-instance v1, Ll/sus0;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/sus0;-><init>(Ll/vus0;)V

    .line 33
    .line 34
    .line 35
    new-instance v2, Ll/wct0;

    .line 36
    .line 37
    invoke-direct {v2}, Ll/wct0;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v1, v2}, Ll/kdt0;->e(Ll/xct0;Ll/vct0;)V

    .line 41
    .line 42
    .line 43
    new-instance v1, Ll/tus0;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/tus0;-><init>(Ll/vus0;)V

    .line 46
    .line 47
    .line 48
    new-instance v2, Ll/uus0;

    .line 49
    .line 50
    invoke-direct {v2, p0}, Ll/uus0;-><init>(Ll/vus0;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v1, v2}, Ll/kdt0;->e(Ll/xct0;Ll/vct0;)V

    .line 54
    .line 55
    .line 56
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    const-string p0, "release: Lock released"

    .line 58
    .line 59
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    throw p0
.end method
