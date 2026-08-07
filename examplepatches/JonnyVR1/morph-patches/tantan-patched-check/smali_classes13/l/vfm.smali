.class public Ll/vfm;
.super Ll/hn2;
.source "SourceFile"

# interfaces
.implements Ll/lvl;


# instance fields
.field d:Ll/eh0;

.field e:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;


# direct methods
.method public constructor <init>(Ll/uow;Lcom/momo/pipline/MomoInterface/MomoPipeline;Landroid/content/Context;IZLl/brx;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ll/hn2;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hn2;->a:Ll/uow;

    .line 5
    .line 6
    iput-object p2, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 7
    .line 8
    iget-object v1, p1, Ll/uow;->x0:Ljava/lang/String;

    .line 9
    .line 10
    invoke-interface {p2}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->A0()Ll/q210$a;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    move-object v0, p3

    .line 15
    move v3, p4

    .line 16
    move v4, p5

    .line 17
    move-object v5, p6

    .line 18
    invoke-static/range {v0 .. v5}, Ll/d410;->j(Landroid/content/Context;Ljava/lang/String;Ll/q210$a;IZLl/brx;)Ll/eh0;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    iput-object p2, p0, Ll/vfm;->d:Ll/eh0;

    .line 23
    .line 24
    iput-object p2, p0, Ll/hn2;->c:Ll/z5m;

    .line 25
    .line 26
    iget p1, p1, Ll/uow;->D0:I

    .line 27
    .line 28
    invoke-virtual {p2, p1}, Ll/xfm;->setFps(I)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 32
    .line 33
    iget-object p2, p0, Ll/vfm;->d:Ll/eh0;

    .line 34
    .line 35
    invoke-interface {p1, p2}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->f0(Ll/z5m;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 39
    .line 40
    iget-object p2, p0, Ll/vfm;->d:Ll/eh0;

    .line 41
    .line 42
    invoke-interface {p1, p2}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->u0(Ll/z5m;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/vfm;->e:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 46
    .line 47
    if-eqz p1, :cond_0

    .line 48
    .line 49
    iget-object p0, p0, Ll/vfm;->d:Ll/eh0;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ll/eh0;->b2(Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method


# virtual methods
.method public G()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vfm;->d:Ll/eh0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/hn2;->b:Lcom/momo/pipline/MomoInterface/MomoPipeline;

    .line 6
    .line 7
    invoke-interface {v1, v0}, Lcom/momo/pipline/MomoInterface/MomoPipeline;->Z(Ll/z5m;)Ll/g510;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/g510;->j()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/vfm;->d:Ll/eh0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/eh0;->stop()V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Ll/vfm;->e:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 21
    .line 22
    iput-object v0, p0, Ll/vfm;->d:Ll/eh0;

    .line 23
    .line 24
    :cond_0
    invoke-super {p0}, Ll/hn2;->G()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public a()Ll/z5m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vfm;->d:Ll/eh0;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vfm;->e:Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;

    .line 2
    .line 3
    iget-object p0, p0, Ll/vfm;->d:Ll/eh0;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/eh0;->b2(Ltv/danmaku/ijk/media/player/OnPlayerStateCallback;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public getCurrentPosition()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/vfm;->d:Ll/eh0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xfm;->S1()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getDuration()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/vfm;->d:Ll/eh0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/eh0;->getDuration()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public n(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vfm;->d:Ll/eh0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xfm;->X1(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public p(III)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vfm;->d:Ll/eh0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/eh0;->W1(III)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public pause()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vfm;->d:Ll/eh0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xfm;->pause()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public resume()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vfm;->d:Ll/eh0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xfm;->resume()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public seek(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vfm;->d:Ll/eh0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/xfm;->seek(J)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setVolume(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vfm;->d:Ll/eh0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/eh0;->Y1(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public t(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vfm;->d:Ll/eh0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xfm;->T1(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public y(Lcom/momo/piplinemomoext/input/audio/a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vfm;->d:Ll/eh0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/eh0;->V1(Lcom/momo/piplinemomoext/input/audio/a;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
