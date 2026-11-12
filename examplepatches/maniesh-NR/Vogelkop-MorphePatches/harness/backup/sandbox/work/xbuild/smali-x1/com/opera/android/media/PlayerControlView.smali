.class public Lcom/opera/android/media/PlayerControlView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public a:Lwkd;

.field public final b:Lmig;

.field public final c:Lvl9;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lmig;

    new-instance p2, Ljld;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Ljld;-><init>(Landroid/view/View$OnClickListener;B)V

    invoke-direct {p1, p2}, Lmig;-><init>(Llig;)V

    iput-object p1, p0, Lcom/opera/android/media/PlayerControlView;->b:Lmig;

    new-instance p1, Lvl9;

    const/16 p2, 0x17

    invoke-direct {p1, p0, p2}, Lvl9;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/media/PlayerControlView;->c:Lvl9;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->q:Lcom/opera/android/custom_views/StylingTextView;

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-eqz p1, :cond_b

    move v3, v2

    goto :goto_c

    :cond_b
    move v3, v1

    :goto_c
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->n:Lcom/opera/android/custom_views/StylingTextView;

    if-eqz p1, :cond_17

    move v3, v2

    goto :goto_18

    :cond_17
    move v3, v1

    :goto_18
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->f:Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p1, :cond_23

    move v3, v1

    goto :goto_24

    :cond_23
    move v3, v2

    :goto_24
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->d:Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p1, :cond_2f

    move v3, v1

    goto :goto_30

    :cond_2f
    move v3, v2

    :goto_30
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->m:Landroid/widget/Space;

    if-eqz p1, :cond_3b

    move v3, v1

    goto :goto_3c

    :cond_3b
    move v3, v2

    :goto_3c
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->l:Landroid/widget/Space;

    if-eqz p1, :cond_47

    move v3, v1

    goto :goto_48

    :cond_47
    move v3, v2

    :goto_48
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object p0, p0, Lwkd;->r:Landroid/widget/RelativeLayout;

    if-eqz p1, :cond_52

    move v1, v2

    :cond_52
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 4

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->c:Lvl9;

    const-wide/16 v1, 0x708

    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-object p0, p0, Lcom/opera/android/media/PlayerControlView;->b:Lmig;

    iget-object v0, p0, Lhkg;->a:Lgig;

    if-eqz v0, :cond_b0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a083e

    if-ne v0, v1, :cond_13

    invoke-virtual {p0}, Lmig;->e()Z

    return-void

    :cond_13
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a0895

    if-ne v0, v1, :cond_24

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object p0

    invoke-interface {p0}, Lgig;->p0()V

    return-void

    :cond_24
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a0896

    if-ne v0, v1, :cond_40

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object p1

    invoke-interface {p1}, Lgig;->getPlaybackState()I

    move-result p1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_87

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object p0

    invoke-interface {p0}, Lgig;->o0()V

    return-void

    :cond_40
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a0bd9

    if-ne v0, v1, :cond_51

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object p0

    invoke-interface {p0}, Lgig;->r()V

    return-void

    :cond_51
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a0bd8

    if-ne v0, v1, :cond_62

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object p0

    invoke-interface {p0}, Lgig;->M()V

    return-void

    :cond_62
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a0842

    const/4 v2, 0x1

    if-eq v0, v1, :cond_a0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a0843

    if-eq v0, v1, :cond_a0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0a0840

    if-eq v0, v1, :cond_88

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0a0841

    if-eq p1, v0, :cond_88

    :cond_87
    return-void

    :cond_88
    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object p1

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object p0

    invoke-interface {p0}, Lgig;->getRepeatMode()I

    move-result p0

    const/4 v0, 0x2

    if-eqz p0, :cond_9b

    if-eq p0, v0, :cond_9c

    const/4 v2, 0x0

    goto :goto_9c

    :cond_9b
    move v2, v0

    :cond_9c
    :goto_9c
    invoke-interface {p1, v2}, Lgig;->setRepeatMode(I)V

    return-void

    :cond_a0
    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object p1

    invoke-virtual {p0}, Lhkg;->c()Lgig;

    move-result-object p0

    invoke-interface {p0}, Lgig;->getShuffleModeEnabled()Z

    move-result p0

    xor-int/2addr p0, v2

    invoke-interface {p1, p0}, Lgig;->setShuffleModeEnabled(Z)V

    :cond_b0
    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->c:Lvl9;

    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final onFinishInflate()V
    .registers 3

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    invoke-static {p0}, Lwkd;->a(Landroid/view/View;)Lwkd;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->t:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->s:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->h:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->i:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->b:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->c:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->d:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->e:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v0, v0, Lwkd;->f:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/opera/android/media/PlayerControlView;->b:Lmig;

    iget-object v0, v0, Lmig;->i:Lkig;

    iget-object v1, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v1, v1, Lwkd;->k:Lcom/google/android/material/slider/Slider;

    invoke-virtual {v1, v0}, Lcom/google/android/material/slider/Slider;->t0(Lw73;)V

    iget-object v1, p0, Lcom/opera/android/media/PlayerControlView;->a:Lwkd;

    iget-object v1, v1, Lwkd;->k:Lcom/google/android/material/slider/Slider;

    invoke-virtual {v1, v0}, Lcom/google/android/material/slider/Slider;->u0(Lx73;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/opera/android/media/PlayerControlView;->a(Z)V

    return-void
.end method
