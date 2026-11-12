.class public final Lq2f;
.super Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;
.source "SourceFile"

# interfaces
.implements Lpim;


# instance fields
.field public final c:I

.field public d:Lkqd;

.field public e:Landroid/view/View$OnClickListener;

.field public f:Lcom/opera/android/bar/OmniButtonView;

.field public final g:Ltwf;

.field public final h:Lcq3;

.field public i:Z

.field public final j:Lcom/opera/android/widget/LottieAnimationView;

.field public final k:I

.field public final l:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 9

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;->d(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v1, Ltwf;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Ltwf;-><init>(Lq2f;B)V

    iput-object v1, p0, Lq2f;->g:Ltwf;

    const/high16 v1, 0x40800000    # 4.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v1, v3}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    iput v1, p0, Lq2f;->c:I

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v1, 0x7f0d0321

    const/4 v3, 0x0

    invoke-virtual {p1, v1, p0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a026e

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v4, :cond_cb

    new-instance v0, Lcq3;

    check-cast p1, Lcom/opera/android/bubbleview/BubbleView;

    invoke-direct {v0, p1, v4}, Lcq3;-><init>(Lcom/opera/android/bubbleview/BubbleView;Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;)V

    iput-object v0, p0, Lq2f;->h:Lcq3;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0d02fd

    invoke-virtual {p1, v0, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    new-instance p1, Lzvd;

    const/16 v0, 0xa

    invoke-direct {p1, p0, v0}, Lzvd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f0a0322

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/widget/LottieAnimationView;

    iput-object p1, p0, Lq2f;->j:Lcom/opera/android/widget/LottieAnimationView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f040750

    const v4, 0x7f060f46

    invoke-static {v1, v0, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lq2f;->k:I

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0402f0

    const v4, 0x7f06063b

    invoke-static {v1, v0, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lq2f;->l:I

    new-instance v0, Lp2f;

    invoke-direct {v0, p0, v3}, Lp2f;-><init>(Lq2f;B)V

    new-instance v1, Lp2f;

    invoke-direct {v1, p0, v2}, Lp2f;-><init>(Lq2f;B)V

    new-instance p0, Ldvb;

    const-string v3, "BlackStripeFill"

    const-string v4, "Black stripe"

    const-string v5, "Rectangle 1"

    filled-new-array {v4, v5, v3}, [Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Ldvb;-><init>([Ljava/lang/String;)V

    sget-object v3, Lk3d;->a:Landroid/graphics/PointF;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, p0, v2, v1}, Ln2d;->a(Ldvb;Ljava/lang/Object;Lua7;)V

    new-instance p0, Ldvb;

    const-string v3, "Group 1"

    const-string v4, "BellFill"

    const-string v6, "Bell"

    filled-new-array {v6, v3, v4}, [Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Ldvb;-><init>([Ljava/lang/String;)V

    invoke-virtual {p1, p0, v2, v1}, Ln2d;->a(Ldvb;Ljava/lang/Object;Lua7;)V

    new-instance p0, Ldvb;

    const-string v1, "White stripe"

    const-string v3, "WhiteStripeFill"

    filled-new-array {v1, v5, v3}, [Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Ldvb;-><init>([Ljava/lang/String;)V

    invoke-virtual {p1, p0, v2, v0}, Ln2d;->a(Ldvb;Ljava/lang/Object;Lua7;)V

    return-void

    :cond_cb
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public final f(Lhjm;)V
    .registers 9

    iget-boolean v0, p0, Lq2f;->i:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lq2f;->i:Z

    iget-object v0, p0, Lq2f;->g:Ltwf;

    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    sget-object v0, Lhjm;->a:Lhjm;

    if-ne p1, v0, :cond_14

    const-wide/16 v0, 0x64

    goto :goto_16

    :cond_14
    const-wide/16 v0, 0xfa

    :goto_16
    iget-object v2, p0, Lq2f;->h:Lcq3;

    iget-object v2, v2, Lcq3;->b:Landroid/view/View;

    check-cast v2, Lcom/opera/android/bubbleview/BubbleView;

    new-instance v3, Lhpd;

    const/16 v4, 0x1d

    invoke-direct {v3, p0, p1, v4}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v2, Lcom/opera/android/bubbleview/BubbleView;->t:Lxz3;

    if-eqz p0, :cond_2a

    const/4 p0, 0x0

    iput-object p0, v2, Lcom/opera/android/bubbleview/BubbleView;->t:Lxz3;

    :cond_2a
    sget-object p0, Llf1;->f:Landroid/view/animation/LinearInterpolator;

    iget-object p1, v2, Lcom/opera/android/bubbleview/BubbleView;->u:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v5, 0x0

    invoke-virtual {p1, v5, v6}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    iget-object p1, v2, Lcom/opera/android/bubbleview/BubbleView;->a:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v5, v6}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    iget-object p1, v2, Lcom/opera/android/bubbleview/BubbleView;->b:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v5, v6}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    iget-object p1, v2, Lcom/opera/android/bubbleview/BubbleView;->c:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v5, v6}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    iget-object p1, v2, Lcom/opera/android/bubbleview/BubbleView;->d:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, v5, v6}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    return-void
.end method

.method public final setOnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 2

    iput-object p1, p0, Lq2f;->e:Landroid/view/View$OnClickListener;

    return-void
.end method
