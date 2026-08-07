.class public Ll/uti0;
.super Ll/hn2;
.source "SourceFile"

# interfaces
.implements Ll/pvl;


# instance fields
.field d:Ll/sti0;

.field e:J


# direct methods
.method public constructor <init>(Lcom/momo/pipline/MomoInterface/MomoPipeline;Ll/uow;Ll/sti0;J)V
    .locals 0
    .param p1    # Lcom/momo/pipline/MomoInterface/MomoPipeline;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/hn2;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 5
    .line 6
    iput-object p3, p0, Ll/uti0;->d:Ll/sti0;

    .line 7
    .line 8
    iput-wide p4, p0, Ll/uti0;->e:J

    .line 9
    .line 10
    iget p1, p2, Ll/uow;->D0:I

    .line 11
    .line 12
    invoke-virtual {p3, p1}, Ll/sti0;->setFps(I)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 16
    .line 17
    iget-object p2, p0, Ll/uti0;->d:Ll/sti0;

    .line 18
    .line 19
    invoke-interface {p1, p2}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->f0(Ll/z5m;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 23
    .line 24
    iget-object p2, p0, Ll/uti0;->d:Ll/sti0;

    .line 25
    .line 26
    invoke-interface {p1, p2}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->u0(Ll/z5m;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/uti0;->d:Ll/sti0;

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/sti0;->start()V

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public G()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/uti0;->a()Ll/z5m;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/uti0;->a()Ll/z5m;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v0, v1}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->Z(Ll/z5m;)Ll/g510;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    :goto_0
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/g510;->j()V

    .line 26
    .line 27
    .line 28
    :cond_1
    invoke-super {p0}, Ll/hn2;->G()V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/uti0;->d:Ll/sti0;

    .line 32
    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/sti0;->stop()V

    .line 36
    .line 37
    .line 38
    :cond_2
    return-void
.end method

.method public a()Ll/z5m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uti0;->d:Ll/sti0;

    .line 2
    .line 3
    return-object p0
.end method
