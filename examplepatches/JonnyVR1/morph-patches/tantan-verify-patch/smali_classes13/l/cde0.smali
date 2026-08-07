.class public Ll/cde0;
.super Ll/hn2;
.source "SourceFile"

# interfaces
.implements Ll/n5m;


# instance fields
.field private d:Ll/m5m;

.field e:Z


# direct methods
.method public constructor <init>(Ll/uow;Lcom/momo/pipline/MomoInterface/MomoPipeline;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/hn2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/cde0;->e:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/hn2;->a:Ll/uow;

    .line 8
    .line 9
    iput-object p2, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 10
    .line 11
    invoke-static {}, Ll/f410;->e()Ll/m5m;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/cde0;->d:Ll/m5m;

    .line 16
    .line 17
    iput-object p1, p0, Ll/hn2;->c:Ll/z5m;

    .line 18
    .line 19
    iget-object p2, p0, Ll/hn2;->a:Ll/uow;

    .line 20
    .line 21
    iget p2, p2, Ll/uow;->D0:I

    .line 22
    .line 23
    invoke-interface {p1, p2}, Ll/z5m;->setFps(I)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 27
    .line 28
    iget-object p2, p0, Ll/cde0;->d:Ll/m5m;

    .line 29
    .line 30
    invoke-interface {p1, p2}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->f0(Ll/z5m;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 34
    .line 35
    iget-object p0, p0, Ll/cde0;->d:Ll/m5m;

    .line 36
    .line 37
    invoke-interface {p1, p0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->u0(Ll/z5m;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public declared-synchronized G()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput-boolean v0, p0, Ll/cde0;->e:Z

    .line 4
    .line 5
    iget-object v0, p0, Ll/cde0;->d:Ll/m5m;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    monitor-exit p0

    .line 10
    return-void

    .line 11
    :cond_0
    :try_start_1
    iget-object v1, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 12
    .line 13
    invoke-interface {v1, v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->Z(Ll/z5m;)Ll/g510;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/g510;->j()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/cde0;->d:Ll/m5m;

    .line 21
    .line 22
    invoke-interface {v0}, Ll/m5m;->P1()V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Ll/cde0;->d:Ll/m5m;

    .line 27
    .line 28
    invoke-super {p0}, Ll/hn2;->G()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    .line 30
    .line 31
    monitor-exit p0

    .line 32
    return-void

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 35
    throw v0
.end method

.method public a()Ll/z5m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cde0;->d:Ll/m5m;

    .line 2
    .line 3
    return-object p0
.end method

.method public declared-synchronized o(Landroid/media/projection/MediaProjection;)V
    .locals 2
    .param p1    # Landroid/media/projection/MediaProjection;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/cde0;->d:Ll/m5m;

    .line 3
    .line 4
    iget-object v1, p0, Ll/hn2;->a:Ll/uow;

    .line 5
    .line 6
    invoke-interface {v0, v1, p1}, Ll/m5m;->U0(Ll/uow;Landroid/media/projection/MediaProjection;)V

    .line 7
    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Ll/cde0;->e:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    throw p1
.end method
