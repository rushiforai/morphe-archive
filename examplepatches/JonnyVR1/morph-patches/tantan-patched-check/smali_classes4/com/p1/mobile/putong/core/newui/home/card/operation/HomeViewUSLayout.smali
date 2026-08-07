.class public Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public A:Landroid/view/View;

.field public B:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public C:Landroid/view/View;

.field public D:Landroid/view/View;

.field public E:Landroid/view/View;

.field public F:Landroid/animation/ValueAnimator;

.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Landroid/view/View;

.field public c:Lv/VText;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public f:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public g:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public h:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public i:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public j:Landroid/widget/LinearLayout;

.field public k:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public l:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public n:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public o:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public p:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public q:Lv/VLinear;

.field public r:Lv/VLinear;

.field public s:Landroid/widget/RelativeLayout;

.field public t:Lv/VImage;

.field public u:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public v:Landroid/widget/RelativeLayout;

.field public w:Lv/VImage;

.field public x:Lv/VLinear;

.field public y:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public z:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gra;->N3()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->u()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->b:Landroid/view/View;

    .line 17
    .line 18
    const/high16 v1, 0x42f00000    # 120.0f

    .line 19
    .line 20
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-static {v0, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->b:Landroid/view/View;

    .line 28
    .line 29
    const/high16 v2, 0x429e0000    # 79.0f

    .line 30
    .line 31
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-static {v0, v2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->j:Landroid/widget/LinearLayout;

    .line 39
    .line 40
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->b:Landroid/view/View;

    .line 48
    .line 49
    const/high16 v1, 0x42100000    # 36.0f

    .line 50
    .line 51
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->c:Lv/VText;

    .line 59
    .line 60
    const/high16 v0, 0x41400000    # 12.0f

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->w()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/dgl;->a(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->v()V

    .line 4
    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->u()V

    .line 8
    .line 9
    .line 10
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->F:Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 15
    .line 16
    .line 17
    :cond_1
    const/4 v0, 0x2

    .line 18
    new-array v1, v0, [F

    .line 19
    .line 20
    fill-array-data v1, :array_0

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->F:Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    new-array v0, v0, [F

    .line 32
    .line 33
    fill-array-data v0, :array_1

    .line 34
    .line 35
    .line 36
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->F:Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->F:Landroid/animation/ValueAnimator;

    .line 43
    .line 44
    const-wide/16 v1, 0xc8

    .line 45
    .line 46
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->F:Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$a;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->F:Landroid/animation/ValueAnimator;

    .line 60
    .line 61
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$b;

    .line 62
    .line 63
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$b;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;Z)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->F:Landroid/animation/ValueAnimator;

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final u()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->j:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->z:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->k:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->A:Landroid/view/View;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->m:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->B:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->n:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->C:Landroid/view/View;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->o:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->D:Landroid/view/View;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->p:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->E:Landroid/view/View;

    .line 24
    .line 25
    return-void
.end method

.method public final v()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->x:Lv/VLinear;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->A:Landroid/view/View;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->u:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->B:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->v:Landroid/widget/RelativeLayout;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->C:Landroid/view/View;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->s:Landroid/widget/RelativeLayout;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->D:Landroid/view/View;

    .line 16
    .line 17
    return-void
.end method

.method public final w()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->d:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->z:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->e:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->A:Landroid/view/View;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->f:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->B:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->g:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->C:Landroid/view/View;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->h:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->D:Landroid/view/View;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->i:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->E:Landroid/view/View;

    .line 24
    .line 25
    return-void
.end method
