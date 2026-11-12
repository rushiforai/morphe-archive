.class public final Lmig;
.super Lhkg;
.source "SourceFile"


# instance fields
.field public final c:Llig;

.field public d:Ltjg;

.field public final e:Lc5o;

.field public final f:Lfql;

.field public final g:Lisd;

.field public h:Z

.field public final i:Lkig;


# direct methods
.method public constructor <init>(Llig;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lc5o;

    const/16 v1, 0x1d

    invoke-direct {v0, v1}, Lc5o;-><init>(B)V

    iput-object v0, p0, Lmig;->e:Lc5o;

    new-instance v0, Lfql;

    invoke-direct {v0}, Lfql;-><init>()V

    iput-object v0, p0, Lmig;->f:Lfql;

    new-instance v0, Lisd;

    invoke-direct {v0, p0}, Lisd;-><init>(Lmig;)V

    iput-object v0, p0, Lmig;->g:Lisd;

    new-instance v0, Ljig;

    invoke-direct {v0, p0}, Ljig;-><init>(Lmig;)V

    new-instance v1, Lkig;

    invoke-direct {v1, p0}, Lkig;-><init>(Lmig;)V

    iput-object v1, p0, Lmig;->i:Lkig;

    iput-object p1, p0, Lmig;->c:Llig;

    iget-object p1, p0, Lhkg;->b:Leig;

    if-eq p1, v0, :cond_3e

    if-eqz p1, :cond_35

    iget-object v1, p0, Lhkg;->a:Lgig;

    if-eqz v1, :cond_35

    invoke-interface {v1, p1}, Lgig;->g0(Leig;)V

    :cond_35
    iput-object v0, p0, Lhkg;->b:Leig;

    iget-object p0, p0, Lhkg;->a:Lgig;

    if-eqz p0, :cond_3e

    invoke-interface {p0, v0}, Lgig;->S(Leig;)V

    :cond_3e
    return-void
.end method

.method public static f(Lgig;J)V
    .registers 7

    invoke-interface {p0}, Lgig;->getCurrentPosition()J

    move-result-wide v0

    add-long/2addr v0, p1

    invoke-interface {p0}, Lgig;->getDuration()J

    move-result-wide p1

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v2, p1, v2

    if-eqz v2, :cond_16

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    :cond_16
    const-wide/16 p1, 0x0

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    invoke-interface {p0, p1, p2}, Lgig;->seekTo(J)V

    return-void
.end method


# virtual methods
.method public final a(Lxbf;)V
    .registers 2

    invoke-super {p0, p1}, Lhkg;->a(Lxbf;)V

    iget-object p1, p1, Lxbf;->b:Ljava/lang/Object;

    check-cast p1, Ltjg;

    iput-object p1, p0, Lmig;->d:Ltjg;

    invoke-virtual {p0}, Lmig;->g()V

    return-void
.end method

.method public final b(Lxbf;)V
    .registers 2

    invoke-super {p0, p1}, Lhkg;->b(Lxbf;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lmig;->d:Ltjg;

    iget-object p0, p0, Lmig;->g:Lisd;

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lvdf;

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final d(Lgig;)V
    .registers 2

    invoke-virtual {p0}, Lmig;->g()V

    return-void
.end method

.method public final e()Z
    .registers 6

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v0

    invoke-interface {v0}, Lgig;->getPlaybackState()I

    move-result v0

    const/4 v1, 0x4

    const/4 v2, 0x1

    if-eq v0, v2, :cond_21

    if-eq v0, v1, :cond_21

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v0

    invoke-interface {v0}, Lgig;->getPlayWhenReady()Z

    move-result v0

    if-eqz v0, :cond_21

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object p0

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Lgig;->setPlayWhenReady(Z)V

    return v0

    :cond_21
    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v0

    invoke-interface {v0}, Lgig;->getPlaybackState()I

    move-result v0

    if-ne v0, v2, :cond_33

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v0

    invoke-interface {v0}, Lgig;->a()V

    goto :goto_49

    :cond_33
    if-ne v0, v1, :cond_49

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v0

    invoke-interface {v0}, Lgig;->getCurrentWindowIndex()I

    move-result v0

    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v1

    invoke-interface {v1, v0, v3, v4}, Lgig;->seekTo(IJ)V

    :cond_49
    :goto_49
    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object p0

    invoke-interface {p0, v2}, Lgig;->setPlayWhenReady(Z)V

    return v2
.end method

.method public final g()V
    .registers 3

    invoke-virtual {p0}, Lmig;->i()V

    invoke-virtual {p0}, Lmig;->h()V

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v0

    invoke-interface {v0}, Lgig;->getRepeatMode()I

    move-result v0

    iget-object v1, p0, Lmig;->c:Llig;

    invoke-interface {v1, v0}, Llig;->setRepeatMode(I)V

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v0

    invoke-interface {v0}, Lgig;->getShuffleModeEnabled()Z

    move-result v0

    invoke-interface {v1, v0}, Llig;->g(Z)V

    invoke-virtual {p0}, Lmig;->k()V

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object p0

    invoke-interface {p0}, Lgig;->g()Lqjd;

    move-result-object p0

    if-eqz p0, :cond_2e

    iget-object p0, p0, Lqjd;->e:Lvjd;

    goto :goto_30

    :cond_2e
    sget-object p0, Lvjd;->K:Lvjd;

    :goto_30
    iget-object v0, p0, Lvjd;->a:Ljava/lang/CharSequence;

    iget-object p0, p0, Lvjd;->f:Ljava/lang/CharSequence;

    invoke-interface {v1, v0, p0}, Llig;->i(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final h()V
    .registers 6

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v0

    invoke-interface {v0}, Lgig;->getCurrentTimeline()Lgql;

    move-result-object v0

    invoke-virtual {v0}, Lgql;->p()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_51

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v1

    invoke-interface {v1}, Lgig;->isPlayingAd()Z

    move-result v1

    if-nez v1, :cond_51

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v1

    invoke-interface {v1}, Lgig;->getCurrentWindowIndex()I

    move-result v1

    iget-object v3, p0, Lmig;->f:Lfql;

    invoke-virtual {v0, v1, v3}, Lgql;->n(ILfql;)V

    iget-boolean v0, v3, Lfql;->g:Z

    const/4 v1, 0x1

    if-nez v0, :cond_3b

    iget-boolean v4, v3, Lfql;->h:Z

    if-eqz v4, :cond_3b

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v4

    invoke-interface {v4}, Lgig;->Z()Z

    move-result v4

    if-nez v4, :cond_3b

    move v4, v2

    goto :goto_3c

    :cond_3b
    move v4, v1

    :goto_3c
    iget-boolean v3, v3, Lfql;->h:Z

    if-nez v3, :cond_4a

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v3

    invoke-interface {v3}, Lgig;->y()Z

    move-result v3

    if-eqz v3, :cond_4b

    :cond_4a
    move v2, v1

    :cond_4b
    move v1, v0

    move v0, v2

    move v2, v4

    :goto_4e
    move v3, v1

    move v4, v3

    goto :goto_54

    :cond_51
    move v0, v2

    move v1, v0

    goto :goto_4e

    :goto_54
    iget-object p0, p0, Lmig;->c:Llig;

    invoke-interface {p0, v2, v0}, Llig;->f(ZZ)V

    invoke-interface {p0, v1, v3, v4}, Llig;->j(ZZZ)V

    return-void
.end method

.method public final i()V
    .registers 5

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v0

    invoke-interface {v0}, Lgig;->getPlaybackState()I

    move-result v0

    const/4 v1, 0x4

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq v0, v1, :cond_23

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v0

    invoke-interface {v0}, Lgig;->getPlaybackState()I

    move-result v0

    if-eq v0, v3, :cond_23

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v0

    invoke-interface {v0}, Lgig;->getPlayWhenReady()Z

    move-result v0

    if-eqz v0, :cond_23

    move v0, v3

    goto :goto_24

    :cond_23
    move v0, v2

    :goto_24
    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v1

    invoke-interface {v1}, Lgig;->g()Lqjd;

    move-result-object v1

    if-eqz v1, :cond_2f

    move v2, v3

    :cond_2f
    iget-object v1, p0, Lmig;->c:Llig;

    invoke-interface {v1, v0, v2}, Llig;->d(ZZ)V

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object p0

    invoke-interface {p0}, Lgig;->getPlaybackState()I

    move-result p0

    invoke-interface {v1, p0}, Llig;->a(I)V

    return-void
.end method

.method public final j()V
    .registers 5

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v0

    invoke-interface {v0}, Lgig;->getCurrentPosition()J

    move-result-wide v0

    iget-boolean v2, p0, Lmig;->h:Z

    if-nez v2, :cond_1a

    iget-object v2, p0, Lmig;->e:Lc5o;

    invoke-virtual {v2, v0, v1}, Lc5o;->t(J)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lmig;->c:Llig;

    invoke-interface {v3, v2}, Llig;->h(Ljava/lang/String;)V

    invoke-interface {v3, v0, v1}, Llig;->e(J)V

    :cond_1a
    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v0

    invoke-interface {v0}, Lgig;->getPlaybackState()I

    move-result v0

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v1

    invoke-interface {v1}, Lgig;->e0()Z

    move-result v1

    iget-object p0, p0, Lmig;->g:Lisd;

    if-nez v1, :cond_3c

    const/4 v1, 0x4

    if-eq v0, v1, :cond_34

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3c

    :cond_34
    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lvdf;

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    return-void

    :cond_3c
    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Lvdf;

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    const-wide/16 v0, 0x3e8

    invoke-static {p0, v0, v1}, Lvml;->d(Ljava/lang/Runnable;J)V

    return-void
.end method

.method public final k()V
    .registers 5

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v0

    invoke-interface {v0}, Lgig;->getDuration()J

    move-result-wide v0

    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v2, v0, v2

    iget-object v3, p0, Lmig;->c:Llig;

    if-nez v2, :cond_1e

    const-string v0, ""

    invoke-interface {v3, v0}, Llig;->c(Ljava/lang/String;)V

    const-wide/16 v0, 0x0

    invoke-interface {v3, v0, v1}, Llig;->b(J)V

    goto :goto_2a

    :cond_1e
    iget-object v2, p0, Lmig;->e:Lc5o;

    invoke-virtual {v2, v0, v1}, Lc5o;->t(J)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v3, v2}, Llig;->c(Ljava/lang/String;)V

    invoke-interface {v3, v0, v1}, Llig;->b(J)V

    :goto_2a
    invoke-virtual {p0}, Lmig;->j()V

    return-void
.end method
