.class public final Lfal;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lpvk;


# instance fields
.field public final a:Lcom/opera/android/custom_views/EqualWidthLinearLayout;

.field public final b:Landroid/view/View;

.field public final c:Lqvk;

.field public d:F

.field public final synthetic e:Lgal;


# direct methods
.method public constructor <init>(Lgal;Lcom/opera/android/custom_views/EqualWidthLinearLayout;Landroid/view/View;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfal;->e:Lgal;

    iput-object p2, p0, Lfal;->a:Lcom/opera/android/custom_views/EqualWidthLinearLayout;

    iput-object p3, p0, Lfal;->b:Landroid/view/View;

    new-instance p1, Lqvk;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, v0}, Lqvk;-><init>(Landroid/content/Context;)V

    iput-object p0, p1, Lqvk;->e:Lpvk;

    iput-object p1, p0, Lfal;->c:Lqvk;

    new-instance p1, Leal;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Leal;-><init>(Lfal;B)V

    iput-object p1, p2, Lcom/opera/android/custom_views/EqualWidthLinearLayout;->c:Leal;

    new-instance p1, Leal;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Leal;-><init>(Lfal;B)V

    invoke-virtual {p3, p1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method


# virtual methods
.method public final a(I)Z
    .registers 2

    if-eqz p1, :cond_7

    const/4 p0, 0x2

    if-eq p1, p0, :cond_7

    const/4 p0, 0x0

    return p0

    :cond_7
    const/4 p0, 0x1

    return p0
.end method

.method public final b(IIIIII)V
    .registers 7

    neg-int p1, p5

    int-to-float p1, p1

    iget-object p2, p0, Lfal;->e:Lgal;

    iget-object p3, p2, Lgal;->c:Lebl;

    iget-object p3, p3, Lebl;->a:Lcom/opera/android/tabui2/TabUiRootFrameLayout;

    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    sget-object p4, Lgal;->w:Lixh;

    invoke-virtual {p4, p3}, Ly7h;->l(Landroid/content/Context;)F

    move-result p3

    div-float/2addr p1, p3

    invoke-virtual {p2}, Lgal;->f()Z

    move-result p3

    if-eqz p3, :cond_1a

    neg-float p1, p1

    :cond_1a
    iget p0, p0, Lfal;->d:F

    add-float/2addr p0, p1

    const/4 p1, 0x0

    const/high16 p3, 0x3f800000    # 1.0f

    invoke-static {p0, p1, p3}, Ldjh;->b(FFF)F

    move-result p0

    iput p0, p2, Lgal;->f:F

    invoke-virtual {p2}, Lgal;->e()V

    return-void
.end method

.method public final c(IIIIII)V
    .registers 7

    new-instance p1, Lbr;

    const/16 p2, 0x1a

    iget-object p3, p0, Lfal;->e:Lgal;

    invoke-direct {p1, p5, p3, p2}, Lbr;-><init>(ILjava/lang/Object;B)V

    iget-object p0, p0, Lfal;->a:Lcom/opera/android/custom_views/EqualWidthLinearLayout;

    invoke-virtual {p0, p1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final d()V
    .registers 3

    iget-object p0, p0, Lfal;->e:Lgal;

    iget v0, p0, Lgal;->f:F

    const/high16 v1, 0x3f000000    # 0.5f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_d

    sget-object v0, Lp6l;->b:Lp6l;

    goto :goto_f

    :cond_d
    sget-object v0, Lp6l;->a:Lp6l;

    :goto_f
    invoke-virtual {p0, v0}, Lgal;->g(Lp6l;)V

    const-wide/16 v0, 0xc8

    invoke-virtual {p0, v0, v1}, Lgal;->b(J)V

    return-void
.end method

.method public final e(III)V
    .registers 4

    iget-object p1, p0, Lfal;->b:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->cancelLongPress()V

    iget-object p1, p0, Lfal;->e:Lgal;

    iget p2, p1, Lgal;->f:F

    iput p2, p0, Lfal;->d:F

    iget-object p0, p1, Lgal;->k:Landroid/animation/ValueAnimator;

    if-eqz p0, :cond_12

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_12
    return-void
.end method
