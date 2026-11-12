.class public final La9a;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Landroid/widget/TextView;

.field public final c:Lcom/opera/android/custom_views/BestHorizontalFitLayout;

.field public final d:Lcom/opera/android/custom_views/StylingTextView;

.field public final e:Lcom/opera/android/custom_views/StylingTextView;

.field public final f:Lcom/opera/android/custom_views/StylingTextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    const v0, 0x7f0a0604

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, La9a;->b:Landroid/widget/TextView;

    const v0, 0x7f0a0aab

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/BestHorizontalFitLayout;

    iput-object v0, p0, La9a;->c:Lcom/opera/android/custom_views/BestHorizontalFitLayout;

    const v0, 0x7f0a0325

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    iput-object v0, p0, La9a;->d:Lcom/opera/android/custom_views/StylingTextView;

    const v0, 0x7f0a0326

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    iput-object v0, p0, La9a;->e:Lcom/opera/android/custom_views/StylingTextView;

    const v0, 0x7f0a0321

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    iput-object p1, p0, La9a;->f:Lcom/opera/android/custom_views/StylingTextView;

    return-void
.end method


# virtual methods
.method public final U(Lvg7;)V
    .registers 12

    const/4 v0, 0x0

    if-eqz p1, :cond_61

    iget-boolean v1, p1, Lvg7;->c:Z

    if-eqz v1, :cond_61

    iget-wide v1, p1, Lvg7;->a:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    const-string v6, ""

    iget-object v7, p0, La9a;->c:Lcom/opera/android/custom_views/BestHorizontalFitLayout;

    if-gtz v5, :cond_15

    move-object v1, v6

    goto :goto_2e

    :cond_15
    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    sget-object v8, Llg7;->a:[[I

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-static {v1, v2, v5}, Laik;->h(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v2, 0x7f140623

    invoke-virtual {v8, v2, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :goto_2e
    iget-object v2, p0, La9a;->d:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p0, La9a;->e:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-wide v8, p1, Lvg7;->b:J

    cmp-long v2, v8, v3

    const/4 v3, 0x1

    if-lez v2, :cond_4b

    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v8, v9, v3}, Llg7;->c(Landroid/content/Context;JZ)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    :cond_4b
    iget-object v2, p0, La9a;->f:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5d

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5d

    move v0, v3

    :cond_5d
    invoke-virtual {p0, p1, v0}, La9a;->V(Lvg7;Z)V

    return-void

    :cond_61
    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0}, La9a;->V(Lvg7;Z)V

    return-void
.end method

.method public final V(Lvg7;Z)V
    .registers 5

    iget-object v0, p0, La9a;->c:Lcom/opera/android/custom_views/BestHorizontalFitLayout;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-eqz p2, :cond_16

    if-eqz p1, :cond_16

    iget-boolean p1, p1, Lvg7;->c:Z

    if-eqz p1, :cond_16

    const/4 p0, 0x4

    if-ne v1, p0, :cond_34

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_16
    if-nez v1, :cond_34

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v0, 0xfa

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance p2, Lld9;

    const/16 v0, 0x12

    invoke-direct {p2, p0, v0}, Lld9;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_34
    return-void
.end method
