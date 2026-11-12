.class public final Lqjg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Leig;


# instance fields
.field public final synthetic a:Ltjg;


# direct methods
.method public constructor <init>(Ltjg;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqjg;->a:Ltjg;

    return-void
.end method


# virtual methods
.method public final B(ILqjd;)V
    .registers 4

    iget-object p0, p0, Lqjg;->a:Ltjg;

    if-eqz p2, :cond_d

    if-eqz p1, :cond_d

    iget-object p2, p0, Ltjg;->i:Lujc;

    sget-object v0, Lthg;->d:Lthg;

    invoke-virtual {p2, v0}, Lgk9;->c(Lthg;)V

    :cond_d
    const/4 p2, 0x3

    if-ne p1, p2, :cond_13

    invoke-virtual {p0}, Ltjg;->g()V

    :cond_13
    return-void
.end method

.method public final F(Lrhg;)V
    .registers 7

    iget-object p1, p0, Lqjg;->a:Ltjg;

    iget-object v0, p1, Ltjg;->i:Lujc;

    iget-object v0, v0, Lgk9;->b:Lgig;

    invoke-interface {v0}, Lgig;->g()Lqjd;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1a

    iget-object v2, p1, Ltjg;->k:Lokg;

    iget-object v2, v2, Lokg;->e:Ljava/util/HashMap;

    iget-object v3, v0, Lqjd;->a:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Legd;

    goto :goto_1b

    :cond_1a
    move-object v2, v1

    :goto_1b
    iget-object v3, p1, Ltjg;->c:Ldjg;

    iget-object p1, p1, Ltjg;->a:Landroid/content/Context;

    if-eqz v0, :cond_29

    iget-object v0, v0, Lqjd;->e:Lvjd;

    iget-object v1, v0, Lvjd;->e:Ljava/lang/CharSequence;

    if-nez v1, :cond_29

    iget-object v1, v0, Lvjd;->a:Ljava/lang/CharSequence;

    :cond_29
    if-nez v1, :cond_31

    if-eqz v2, :cond_31

    invoke-virtual {v2}, Legd;->a()Ljava/lang/String;

    move-result-object v1

    :cond_31
    if-nez v1, :cond_35

    const-string v1, ""

    :cond_35
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f1412ec

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Lpjg;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lpjg;-><init>(Ljava/lang/Object;B)V

    iget-object p0, v3, Ldjg;->a:Li7f;

    new-instance v1, Lg7f;

    invoke-direct {v1, p0}, Lg7f;-><init>(Li7f;)V

    :cond_51
    :goto_51
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_74

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzw3;

    iget-object v2, p0, Lzw3;->a:Ldx3;

    iget-object v2, v2, Ldx3;->o:Lqim;

    if-eqz v2, :cond_51

    iget-object v2, v2, Lqim;->e:Lysj;

    new-instance v3, Ltl3;

    const/4 v4, 0x3

    invoke-direct {v3, p0, p1, v0, v4}, Ltl3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v2, v3, p0}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_51

    :cond_74
    return-void
.end method

.method public final K(Lgql;I)V
    .registers 3

    iget-object p0, p0, Lqjg;->a:Ltjg;

    invoke-virtual {p0}, Ltjg;->g()V

    return-void
.end method

.method public final P(Z)V
    .registers 3

    iget-object p0, p0, Lqjg;->a:Ltjg;

    iget-object p0, p0, Ltjg;->a:Landroid/content/Context;

    if-eqz p1, :cond_10

    const-string p1, "launch"

    const-class v0, Lcom/opera/android/media/PlayerService;

    invoke-static {p0, v0, p1}, Lbp;->S(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)V

    invoke-static {p0, v0}, Lbp;->R(Landroid/content/Context;Ljava/lang/Class;)Z

    :cond_10
    return-void
.end method

.method public final h(I)V
    .registers 2

    return-void
.end method

.method public final onPositionDiscontinuity(I)V
    .registers 5

    iget-object p0, p0, Lqjg;->a:Ltjg;

    iget-object v0, p0, Ltjg;->i:Lujc;

    iget-object v0, v0, Lgk9;->b:Lgig;

    invoke-interface {v0}, Lgig;->g()Lqjd;

    move-result-object v0

    iget-boolean v1, p0, Ltjg;->p:Z

    const/4 v2, 0x1

    if-nez v1, :cond_16

    if-ne p1, v2, :cond_16

    iget-object v1, p0, Ltjg;->i:Lujc;

    invoke-virtual {v1, v2}, Lgk9;->setPlayWhenReady(Z)V

    :cond_16
    if-eq p1, v2, :cond_1a

    if-nez p1, :cond_1d

    :cond_1a
    invoke-virtual {p0}, Ltjg;->h()V

    :cond_1d
    iget-object p1, p0, Ltjg;->g:Landroidx/media3/exoplayer/ExoPlayer;

    if-eqz p1, :cond_3b

    const/4 p1, 0x0

    if-eqz v0, :cond_31

    iget-object v0, v0, Lqjd;->c:Lmjd;

    if-eqz v0, :cond_31

    iget-object v0, v0, Lmjd;->a:Landroid/net/Uri;

    invoke-static {v0}, Ls29;->g(Landroid/net/Uri;)Z

    move-result v0

    if-nez v0, :cond_31

    move p1, v2

    :cond_31
    iget-object p0, p0, Ltjg;->g:Landroidx/media3/exoplayer/ExoPlayer;

    if-eqz p1, :cond_36

    const/4 v2, 0x2

    :cond_36
    check-cast p0, Lqi8;

    invoke-virtual {p0, v2}, Lqi8;->S0(I)V

    :cond_3b
    return-void
.end method

.method public final onShuffleModeEnabledChanged(Z)V
    .registers 3

    iget-object p0, p0, Lqjg;->a:Ltjg;

    if-nez p1, :cond_10

    iget-object p1, p0, Ltjg;->k:Lokg;

    iget-object v0, p1, Lokg;->c:Llkg;

    invoke-interface {v0}, Llkg;->b()V

    iget-object p1, p1, Lokg;->b:Lkjg;

    invoke-virtual {p1}, Lkjg;->b()V

    :cond_10
    invoke-virtual {p0}, Ltjg;->h()V

    return-void
.end method
