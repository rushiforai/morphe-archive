.class public final Lwoi;
.super Lzwg;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final synthetic b:Lxoi;


# direct methods
.method public constructor <init>(Lxoi;Landroid/content/res/Resources;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwoi;->b:Lxoi;

    const/high16 p1, 0x447a0000    # 1000.0f

    invoke-static {p1, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    iput p1, p0, Lwoi;->a:I

    return-void
.end method


# virtual methods
.method public final onFling(II)Z
    .registers 6

    iget-object p1, p0, Lwoi;->b:Lxoi;

    iget-object v0, p1, Lxoi;->b:Ls9i;

    iget p0, p0, Lwoi;->a:I

    neg-int p0, p0

    if-ge p2, p0, :cond_86

    invoke-virtual {p1}, Lxoi;->a()Z

    move-result p0

    if-nez p0, :cond_86

    invoke-static {}, Lsle;->d()Z

    move-result p0

    if-eqz p0, :cond_86

    iget-object p0, v0, Ls9i;->b:Ljava/lang/Object;

    check-cast p0, Landroid/widget/FrameLayout;

    iget-object p2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast p2, Lro9;

    if-eqz p2, :cond_46

    iget-object p2, p2, Lro9;->c:Ljava/lang/Object;

    check-cast p2, Lxoi;

    invoke-virtual {p2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_46

    iget-object p2, v0, Ls9i;->c:Ljava/lang/Object;

    check-cast p2, Lro9;

    iget v1, p2, Lro9;->b:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_43

    iget-object p0, p2, Lro9;->d:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    const-wide/16 v1, 0x1770

    invoke-virtual {v0, p1, v1, v2}, Ls9i;->S(Lxoi;J)V

    goto :goto_89

    :cond_43
    const/4 p2, 0x1

    if-eq v1, p2, :cond_89

    :cond_46
    invoke-virtual {v0}, Ls9i;->T()V

    new-instance p2, Lro9;

    invoke-direct {p2, p1, p0}, Lro9;-><init>(Lxoi;Landroid/widget/FrameLayout;)V

    iput-object p2, v0, Ls9i;->c:Ljava/lang/Object;

    iget-object p2, p2, Lro9;->d:Ljava/lang/Object;

    check-cast p2, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const/4 p0, 0x0

    invoke-virtual {p2, p0}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p2, p0}, Landroid/view/View;->setScaleX(F)V

    invoke-virtual {p2, p0}, Landroid/view/View;->setScaleY(F)V

    invoke-virtual {p2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-virtual {p0, p2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    new-instance p2, Lwr9;

    invoke-direct {p2, v0, p1}, Lwr9;-><init>(Ls9i;Lxoi;)V

    invoke-virtual {p0, p2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_89

    :cond_86
    invoke-virtual {v0, p1}, Ls9i;->U(Lxoi;)V

    :cond_89
    :goto_89
    const/4 p0, 0x0

    return p0
.end method
