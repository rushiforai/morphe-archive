.class public final Ljig;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Leig;


# instance fields
.field public final synthetic a:Lmig;


# direct methods
.method public constructor <init>(Lmig;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljig;->a:Lmig;

    return-void
.end method


# virtual methods
.method public final K(Lgql;I)V
    .registers 3

    iget-object p0, p0, Ljig;->a:Lmig;

    invoke-virtual {p0}, Lmig;->h()V

    invoke-virtual {p0}, Lmig;->k()V

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object p1

    invoke-interface {p1}, Lgig;->g()Lqjd;

    move-result-object p1

    if-eqz p1, :cond_15

    iget-object p1, p1, Lqjd;->e:Lvjd;

    goto :goto_17

    :cond_15
    sget-object p1, Lvjd;->K:Lvjd;

    :goto_17
    iget-object p0, p0, Lmig;->c:Llig;

    iget-object p2, p1, Lvjd;->a:Ljava/lang/CharSequence;

    iget-object p1, p1, Lvjd;->f:Ljava/lang/CharSequence;

    invoke-interface {p0, p2, p1}, Llig;->i(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final P(Z)V
    .registers 2

    iget-object p0, p0, Ljig;->a:Lmig;

    invoke-virtual {p0}, Lmig;->j()V

    return-void
.end method

.method public final h(I)V
    .registers 2

    iget-object p0, p0, Ljig;->a:Lmig;

    invoke-virtual {p0}, Lmig;->i()V

    invoke-virtual {p0}, Lmig;->j()V

    return-void
.end method

.method public final onPositionDiscontinuity(I)V
    .registers 3

    iget-object p0, p0, Ljig;->a:Lmig;

    invoke-virtual {p0}, Lmig;->h()V

    invoke-virtual {p0}, Lmig;->k()V

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object p1

    invoke-interface {p1}, Lgig;->g()Lqjd;

    move-result-object p1

    if-eqz p1, :cond_15

    iget-object p1, p1, Lqjd;->e:Lvjd;

    goto :goto_17

    :cond_15
    sget-object p1, Lvjd;->K:Lvjd;

    :goto_17
    iget-object p0, p0, Lmig;->c:Llig;

    iget-object v0, p1, Lvjd;->a:Ljava/lang/CharSequence;

    iget-object p1, p1, Lvjd;->f:Ljava/lang/CharSequence;

    invoke-interface {p0, v0, p1}, Llig;->i(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final onRepeatModeChanged(I)V
    .registers 3

    iget-object p0, p0, Ljig;->a:Lmig;

    iget-object p1, p0, Lmig;->c:Llig;

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v0

    invoke-interface {v0}, Lgig;->getRepeatMode()I

    move-result v0

    invoke-interface {p1, v0}, Llig;->setRepeatMode(I)V

    invoke-virtual {p0}, Lmig;->h()V

    return-void
.end method

.method public final onShuffleModeEnabledChanged(Z)V
    .registers 3

    iget-object p0, p0, Ljig;->a:Lmig;

    iget-object p1, p0, Lmig;->c:Llig;

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object v0

    invoke-interface {v0}, Lgig;->getShuffleModeEnabled()Z

    move-result v0

    invoke-interface {p1, v0}, Llig;->g(Z)V

    invoke-virtual {p0}, Lmig;->h()V

    return-void
.end method

.method public final z(IZ)V
    .registers 3

    iget-object p0, p0, Ljig;->a:Lmig;

    invoke-virtual {p0}, Lmig;->i()V

    invoke-virtual {p0}, Lmig;->j()V

    return-void
.end method
