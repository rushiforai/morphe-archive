.class public final Ldf1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/bar/OmniButtonView;)V
    .registers 3

    const/4 v0, 0x3

    iput-byte v0, p0, Ldf1;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Ldf1;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 12
    iput-byte p2, p0, Ldf1;->a:B

    iput-object p1, p0, Ldf1;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final b(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final c(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final d(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final e(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final f(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final g(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final h(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final i(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final j(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final k(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final l(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final m(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final n(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final o(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final p(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final q(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final r(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final s(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final t(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final u(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final v(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method

.method private final w(Landroid/animation/Animator;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final onAnimationCancel(Landroid/animation/Animator;)V
    .registers 2

    iget-byte p1, p0, Ldf1;->a:B

    packed-switch p1, :pswitch_data_e

    :pswitch_5
    return-void

    :pswitch_6
    iget-object p0, p0, Ldf1;->b:Ljava/lang/Object;

    check-cast p0, Lc9l;

    invoke-virtual {p0}, Lc9l;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_5
    .end packed-switch
.end method

.method public final onAnimationEnd(Landroid/animation/Animator;)V
    .registers 6

    iget-byte p1, p0, Ldf1;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x0

    iget-object p0, p0, Ldf1;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_76

    check-cast p0, Ltqo;

    iput-object v1, p0, Ltqo;->g:Landroid/animation/ObjectAnimator;

    return-void

    :pswitch_e
    check-cast p0, Luvl;

    iput-object v1, p0, Luvl;->q:Landroid/animation/ValueAnimator;

    return-void

    :pswitch_13
    check-cast p0, Lfwk;

    new-instance p1, Lewk;

    invoke-direct {p1}, Landroid/graphics/drawable/Drawable;-><init>()V

    invoke-virtual {p0, v0, p1}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_1e
    check-cast p0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;

    iput-object v1, p0, Lcom/opera/android/search/behavior/ScrollableToolbarBehavior;->e:Landroid/animation/ValueAnimator;

    return-void

    :pswitch_23
    check-cast p0, Lcom/opera/android/bar/OmniButtonView;

    iget-object p1, p0, Lcom/opera/android/bar/OmniButtonView;->e:Lbp;

    iget-object v1, p0, Lcom/opera/android/bar/OmniButtonView;->f:Lbp;

    if-eqz v1, :cond_2e

    invoke-virtual {p0, v1}, Lcom/opera/android/bar/OmniButtonView;->d(Lbp;)V

    :cond_2e
    iget-object v1, p0, Lcom/opera/android/bar/OmniButtonView;->j:Lbp;

    if-eqz v1, :cond_35

    invoke-virtual {v1, v0}, Lbp;->U(Z)V

    :cond_35
    if-eqz p1, :cond_4d

    iget-object v0, p0, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    if-eqz v0, :cond_49

    iget-object v1, p1, Lbp;->b:Ljava/lang/Object;

    check-cast v1, Luaf;

    iget-object v1, v1, Luaf;->a:Ltaf;

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Luaf;

    iget-object v0, v0, Luaf;->a:Ltaf;

    if-eq v1, v0, :cond_4d

    :cond_49
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/bar/OmniButtonView;->f(Lbp;Z)V

    :cond_4d
    return-void

    :pswitch_4e
    check-cast p0, Lydb;

    iget-object p1, p0, Lydb;->b:Landroid/graphics/Matrix;

    invoke-virtual {p0, p1}, Lydb;->c(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object p1

    iget v0, p1, Landroid/graphics/RectF;->left:F

    const/4 v1, 0x0

    cmpl-float v2, v0, v1

    if-nez v2, :cond_63

    iget v2, p1, Landroid/graphics/RectF;->top:F

    cmpl-float v1, v2, v1

    if-eqz v1, :cond_6a

    :cond_63
    iget p1, p1, Landroid/graphics/RectF;->top:F

    float-to-double v0, v0

    float-to-double v2, p1

    invoke-virtual {p0, v0, v1, v2, v3}, Lydb;->k(DD)V

    :cond_6a
    return-void

    :pswitch_6b
    check-cast p0, Lql2;

    iput-object v1, p0, Lql2;->e:Landroid/animation/ValueAnimator;

    iget-object p0, p0, Lql2;->a:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p0, v0}, Lcom/opera/android/widget/UrlFieldEditText;->y(Z)V

    :pswitch_74
    return-void

    nop

    :pswitch_data_76
    .packed-switch 0x0
        :pswitch_74
        :pswitch_6b
        :pswitch_4e
        :pswitch_23
        :pswitch_1e
        :pswitch_13
        :pswitch_e
    .end packed-switch
.end method

.method public final onAnimationRepeat(Landroid/animation/Animator;)V
    .registers 2

    iget-byte p0, p0, Ldf1;->a:B

    return-void
.end method

.method public final onAnimationStart(Landroid/animation/Animator;)V
    .registers 2

    iget-byte p1, p0, Ldf1;->a:B

    packed-switch p1, :pswitch_data_10

    :pswitch_5
    return-void

    :pswitch_6
    iget-object p0, p0, Ldf1;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/bar/OmniButtonView;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    :pswitch_e
    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_5
    .end packed-switch
.end method
