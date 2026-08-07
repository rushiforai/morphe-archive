.class public abstract Ll/hn2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pvl;


# instance fields
.field protected a:Ll/uow;

.field protected b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

.field protected c:Ll/z5m;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->A(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public C(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->C(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public G()V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "stopRenderer"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 20
    .line 21
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, Ll/hn2;->c:Ll/z5m;

    .line 26
    .line 27
    iput-object v0, p0, Ll/hn2;->a:Ll/uow;

    .line 28
    .line 29
    iput-object v0, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 30
    .line 31
    return-void
.end method

.method public J(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->J(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public K()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->K()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public declared-synchronized i(Ljava/lang/Object;)V
    .locals 4

    .line 1
    const-string v0, "startRenderer"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v1, v2, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v1, p0, Ll/hn2;->c:Ll/z5m;

    .line 30
    .line 31
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->v0()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-lez v2, :cond_0

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/4 v2, 0x0

    .line 40
    :goto_0
    invoke-interface {v0, v1, p1, v2}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->q0(Ll/z5m;Ljava/lang/Object;Z)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 44
    .line 45
    invoke-interface {v0, p1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->x0(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :catchall_0
    move-exception p1

    .line 50
    goto :goto_2

    .line 51
    :cond_1
    :goto_1
    monitor-exit p0

    .line 52
    return-void

    .line 53
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    throw p1
.end method
