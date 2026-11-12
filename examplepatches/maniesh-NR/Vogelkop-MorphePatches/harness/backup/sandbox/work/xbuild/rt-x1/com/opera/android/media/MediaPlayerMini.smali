.class public Lcom/opera/android/media/MediaPlayerMini;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# static fields
.field public static final synthetic d:I


# instance fields
.field public a:Lei;

.field public b:Lxbf;

.field public final c:Lmig;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Lmig;

    new-instance p2, Ltld;

    invoke-direct {p2, p0}, Ltld;-><init>(Lcom/opera/android/media/MediaPlayerMini;)V

    invoke-direct {p1, p2}, Lmig;-><init>(Llig;)V

    iput-object p1, p0, Lcom/opera/android/media/MediaPlayerMini;->c:Lmig;

    return-void
.end method


# virtual methods
.method public final a(Loi0;)V
    .registers 9

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerMini;->b:Lxbf;

    iget-object v0, v0, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgig;

    invoke-interface {v0}, Lgig;->g()Lqjd;

    move-result-object v0

    if-eqz v0, :cond_45

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->c:Lx5f;

    iget-object v2, p0, Lcom/opera/android/media/MediaPlayerMini;->b:Lxbf;

    iget-object v2, v2, Lxbf;->b:Ljava/lang/Object;

    check-cast v2, Ltjg;

    invoke-static {v2, v0}, Lzkd;->R(Ltjg;Lqjd;)Lrh0;

    move-result-object v2

    iget-object p0, p0, Lcom/opera/android/media/MediaPlayerMini;->b:Lxbf;

    iget-object p0, p0, Lxbf;->b:Ljava/lang/Object;

    check-cast p0, Ltjg;

    invoke-virtual {p0, v0}, Ltjg;->k(Lqjd;)Lkg7;

    move-result-object p0

    sget-object v0, Lkg7;->g:Lkg7;

    if-ne p0, v0, :cond_3f

    sget-object p0, Lsh0;->b:Lsh0;

    goto :goto_41

    :cond_3f
    sget-object p0, Lsh0;->c:Lsh0;

    :goto_41
    iget-boolean v0, v1, Lx5f;->h:Z

    if-nez v0, :cond_46

    :cond_45
    return-void

    :cond_46
    iget-object v0, v1, Lx5f;->d:Lzpa;

    new-instance v3, Lni0;

    const/4 v4, -0x1

    const/4 v5, 0x3

    const/16 v6, 0x98b

    invoke-direct {v3, v6, v4, v5}, Ljf0;-><init>(III)V

    const/4 v4, 0x2

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5, p1}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object p1, Lpi0;->a:Lpi0;

    invoke-virtual {v3, v5, v5, p1}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 p1, 0x0

    invoke-virtual {v3, p1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lvh0;

    if-nez v4, :cond_71

    invoke-static {}, Lzpa;->A()Lvh0;

    move-result-object v4

    invoke-virtual {v3, p1, v5, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v3, p1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lvh0;

    :cond_71
    invoke-virtual {v4, v5, v5, v2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v4, p1, v5, p0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p0

    invoke-virtual {p0, v0}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    const/16 v0, 0xf

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_95

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_95

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v0, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_9e

    :cond_95
    invoke-static {p1, v0, v5}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v0, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_9e
    invoke-virtual {v4, v3}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, p0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 3

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_a

    return-void

    :cond_a
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->x()Ltjg;

    move-result-object v0

    iget-object v0, v0, Ltjg;->o:Lxbf;

    iput-object v0, p0, Lcom/opera/android/media/MediaPlayerMini;->b:Lxbf;

    iget-object v1, p0, Lcom/opera/android/media/MediaPlayerMini;->a:Lei;

    iget-object v1, v1, Lei;->e:Landroid/view/View;

    check-cast v1, Lcom/opera/android/media/PlayerContainerView;

    invoke-virtual {v1, v0}, Lcom/opera/android/media/PlayerContainerView;->b(Lxbf;)V

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerMini;->c:Lmig;

    iget-object p0, p0, Lcom/opera/android/media/MediaPlayerMini;->b:Lxbf;

    invoke-virtual {v0, p0}, Lmig;->a(Lxbf;)V

    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 3

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerMini;->c:Lmig;

    iget-object v1, p0, Lcom/opera/android/media/MediaPlayerMini;->b:Lxbf;

    invoke-virtual {v0, v1}, Lmig;->b(Lxbf;)V

    iget-object v0, p0, Lcom/opera/android/media/MediaPlayerMini;->a:Lei;

    iget-object v0, v0, Lei;->e:Landroid/view/View;

    check-cast v0, Lcom/opera/android/media/PlayerContainerView;

    iget-object v1, p0, Lcom/opera/android/media/MediaPlayerMini;->b:Lxbf;

    invoke-virtual {v0, v1}, Lcom/opera/android/media/PlayerContainerView;->c(Lxbf;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/media/MediaPlayerMini;->b:Lxbf;

    return-void
.end method

.method public final onFinishInflate()V
    .registers 13

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    const v0, 0x7f0a022d

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v4, :cond_d6

    const v0, 0x7f0a083e

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v5, :cond_d6

    const v0, 0x7f0a0845

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lcom/opera/android/media/PlayerContainerView;

    if-eqz v6, :cond_d6

    const v0, 0x7f0a0847

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroidx/media3/ui/PlayerView;

    if-eqz v7, :cond_d6

    const v0, 0x7f0a04f5

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Lcom/google/android/material/progressindicator/LinearProgressIndicator;

    if-eqz v8, :cond_d6

    const v0, 0x7f0a0af4

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v9, :cond_d6

    const v0, 0x7f0a06c5

    invoke-static {v0, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v10, :cond_d6

    new-instance v2, Lei;

    const/4 v11, 0x7

    move-object v3, p0

    invoke-direct/range {v2 .. v11}, Lei;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;B)V

    iput-object v2, v3, Lcom/opera/android/media/MediaPlayerMini;->a:Lei;

    invoke-virtual {v7}, Landroidx/media3/ui/PlayerView;->e()V

    iget-object p0, v3, Lcom/opera/android/media/MediaPlayerMini;->a:Lei;

    iget-object p0, p0, Lei;->f:Ljava/lang/Object;

    check-cast p0, Landroidx/media3/ui/PlayerView;

    iget-object p0, p0, Landroidx/media3/ui/PlayerView;->b:Landroidx/media3/ui/AspectRatioFrameLayout;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Landroidx/media3/ui/AspectRatioFrameLayout;->d:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_78

    iput v1, p0, Landroidx/media3/ui/AspectRatioFrameLayout;->d:I

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    :cond_78
    iget-object p0, v3, Lcom/opera/android/media/MediaPlayerMini;->a:Lei;

    iget-object p0, p0, Lei;->e:Landroid/view/View;

    check-cast p0, Lcom/opera/android/media/PlayerContainerView;

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    new-instance v4, Lp92;

    const v1, 0x7f0705d0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    const/4 v8, 0x2

    const/4 v9, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    invoke-direct/range {v4 .. v9}, Lp92;-><init>(ZFIIZ)V

    iput-object v4, p0, Lcom/opera/android/media/PlayerContainerView;->f:Lp92;

    invoke-virtual {p0}, Lcom/opera/android/media/PlayerContainerView;->a()V

    iget-object p0, v3, Lcom/opera/android/media/MediaPlayerMini;->a:Lei;

    iget-object p0, p0, Lei;->d:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v0, Lsld;

    const/4 v1, 0x0

    invoke-direct {v0, v3, v1}, Lsld;-><init>(Lcom/opera/android/media/MediaPlayerMini;B)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, v3, Lcom/opera/android/media/MediaPlayerMini;->a:Lei;

    iget-object p0, p0, Lei;->c:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v0, Lsld;

    const/4 v1, 0x1

    invoke-direct {v0, v3, v1}, Lsld;-><init>(Lcom/opera/android/media/MediaPlayerMini;B)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p0, Lsld;

    const/4 v0, 0x2

    invoke-direct {p0, v3, v0}, Lsld;-><init>(Lcom/opera/android/media/MediaPlayerMini;B)V

    invoke-virtual {v3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, v3, Lcom/opera/android/media/MediaPlayerMini;->a:Lei;

    iget-object p0, p0, Lei;->d:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v0, Llzb;

    const/16 v1, 0xb

    invoke-direct {v0, v3, v1}, Llzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v1

    if-nez v1, :cond_d2

    return-void

    :cond_d2
    invoke-static {v1, p0, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void

    :cond_d6
    move-object v3, p0

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Missing required view with ID: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
