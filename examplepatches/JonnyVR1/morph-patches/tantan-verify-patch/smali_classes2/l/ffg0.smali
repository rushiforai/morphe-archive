.class public final Ll/ffg0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public b:J

.field public final c:Ll/kzg0;

.field public final d:Landroid/os/Handler;

.field public e:Z

.field public final f:J

.field public final g:Ll/qwg0;


# direct methods
.method public constructor <init>(JLl/dhg0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Handler;

    .line 5
    .line 6
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/ffg0;->d:Landroid/os/Handler;

    .line 14
    .line 15
    const-wide/16 v0, 0x64

    .line 16
    .line 17
    iput-wide v0, p0, Ll/ffg0;->f:J

    .line 18
    .line 19
    new-instance v0, Ll/qwg0;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/qwg0;-><init>(Ll/ffg0;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/ffg0;->g:Ll/qwg0;

    .line 25
    .line 26
    iput-wide p1, p0, Ll/ffg0;->a:J

    .line 27
    .line 28
    iput-object p3, p0, Ll/ffg0;->c:Ll/kzg0;

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public final declared-synchronized a()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/ffg0;->d:Landroid/os/Handler;

    .line 3
    .line 4
    iget-object v1, p0, Ll/ffg0;->g:Ll/qwg0;

    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/ffg0;->d:Landroid/os/Handler;

    .line 10
    .line 11
    iget-object v1, p0, Ll/ffg0;->g:Ll/qwg0;

    .line 12
    .line 13
    iget-wide v2, p0, Ll/ffg0;->f:J

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    .line 18
    monitor-exit p0

    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw v0
.end method

.method public final declared-synchronized b()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x1

    .line 3
    :try_start_0
    iput-boolean v0, p0, Ll/ffg0;->e:Z

    .line 4
    .line 5
    iget-wide v0, p0, Ll/ffg0;->a:J

    .line 6
    .line 7
    iput-wide v0, p0, Ll/ffg0;->b:J

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ffg0;->a()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    throw v0
.end method
