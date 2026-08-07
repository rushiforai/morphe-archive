.class public Ll/vsr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/grr;


# instance fields
.field public final a:Lv/VDraweeView;

.field public final b:Lv/VFrame;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->g:Lv/VDraweeView;

    .line 5
    .line 6
    iput-object v0, p0, Ll/vsr;->a:Lv/VDraweeView;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->k:Lv/VFrame;

    .line 9
    .line 10
    iput-object p1, p0, Ll/vsr;->b:Lv/VFrame;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic k(Ll/vsr;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vsr;->s()V

    return-void
.end method

.method public static synthetic l(Ll/vsr;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vsr;->q()V

    return-void
.end method

.method public static synthetic m(Ll/vsr;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vsr;->r(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic n(Ll/vsr;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vsr;->p(Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    const p0, -0x16300

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public b(Ll/msr;Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p2}, Ll/vsr;->o(Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const-string p2, "context_square"

    .line 8
    .line 9
    iget-object v0, p0, Ll/vsr;->a:Lv/VDraweeView;

    .line 10
    .line 11
    invoke-static {p2, v0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 16
    .line 17
    iget-object p2, p0, Ll/vsr;->a:Lv/VDraweeView;

    .line 18
    .line 19
    invoke-virtual {p1, p2}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 20
    .line 21
    .line 22
    :goto_0
    iget-object p0, p0, Ll/vsr;->a:Lv/VDraweeView;

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vsr;->b:Lv/VFrame;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/vsr;->b:Lv/VFrame;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public d()I
    .locals 0

    .line 1
    const p0, -0x5a6c6

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    const/high16 p0, 0x433e0000    # 190.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    const/high16 p0, 0x42780000    # 62.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    sget p0, Ll/nbc0;->t:I

    .line 2
    .line 3
    return p0
.end method

.method public h(Landroid/animation/ValueAnimator;Ll/grr;)V
    .locals 0

    .line 1
    new-instance p2, Ll/tsr;

    .line 2
    .line 3
    invoke-direct {p2, p0}, Ll/tsr;-><init>(Ll/vsr;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 7
    .line 8
    .line 9
    new-instance p2, Ll/usr;

    .line 10
    .line 11
    invoke-direct {p2, p0}, Ll/usr;-><init>(Ll/vsr;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, p2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public i()I
    .locals 0

    .line 1
    sget p0, Ll/qa00;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public j(Landroid/animation/ValueAnimator;Ll/grr;)V
    .locals 0

    .line 1
    new-instance p2, Ll/rsr;

    .line 2
    .line 3
    invoke-direct {p2, p0}, Ll/rsr;-><init>(Ll/vsr;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 7
    .line 8
    .line 9
    new-instance p2, Ll/ssr;

    .line 10
    .line 11
    invoke-direct {p2, p0}, Ll/ssr;-><init>(Ll/vsr;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, p2}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final o(Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->icons:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->icons:Ljava/util/List;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/String;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public final synthetic p(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p0, p0, Ll/vsr;->b:Lv/VFrame;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic q()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/vsr;->b:Lv/VFrame;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic r(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p0, p0, Ll/vsr;->b:Lv/VFrame;

    .line 12
    .line 13
    const/high16 v0, 0x3f800000    # 1.0f

    .line 14
    .line 15
    sub-float/2addr v0, p1

    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic s()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/vsr;->b:Lv/VFrame;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
