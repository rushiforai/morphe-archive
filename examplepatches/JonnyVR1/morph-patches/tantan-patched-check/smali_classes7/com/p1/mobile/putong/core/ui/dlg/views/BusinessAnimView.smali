.class public Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public A:Landroid/widget/CompoundButton$OnCheckedChangeListener;

.field public a:Landroid/widget/RelativeLayout;

.field public b:Lv/VDraweeView;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lcom/tantan/library/svga/SVGAnimationView;

.field public e:Lcom/tantan/library/svga/SVGAnimationView;

.field public f:Landroid/widget/ImageView;

.field public g:Lv/VFrame;

.field public h:Lv/VFrame;

.field public i:Lv/VImage;

.field public j:Lv/VImage;

.field public k:Lv/VText;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/widget/TextView;

.field public o:Landroid/widget/LinearLayout;

.field public p:Lv/VCheckBox;

.field public q:Landroid/widget/TextView;

.field public r:Lv/VButton;

.field public s:Landroid/widget/TextView;

.field public t:Landroid/view/View;

.field public u:Lv/VFrame;

.field public v:Landroid/widget/TextView;

.field public final w:Landroid/graphics/Path;

.field public x:Ll/jtd0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/jtd0<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public y:F

.field public z:Landroid/animation/ObjectAnimator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 22
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 21
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, 0x41a00000    # 20.0f

    .line 5
    .line 6
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    int-to-float p1, p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->y:F

    .line 12
    .line 13
    new-instance p1, Landroid/graphics/Path;

    .line 14
    .line 15
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->w:Landroid/graphics/Path;

    .line 19
    .line 20
    return-void
.end method

.method private synthetic K(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->A:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->A:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->p:Lv/VCheckBox;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    invoke-interface {p1, p0, p2}, Landroid/widget/CompoundButton$OnCheckedChangeListener;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method private P(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->w:Landroid/graphics/Path;

    .line 2
    .line 3
    new-instance v1, Landroid/graphics/RectF;

    .line 4
    .line 5
    int-to-float p1, p1

    .line 6
    int-to-float p2, p2

    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-direct {v1, v2, v2, p1, p2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 9
    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->y:F

    .line 12
    .line 13
    sget-object p1, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 14
    .line 15
    invoke-virtual {v0, v1, p0, p0, p1}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->K(Ljava/lang/Runnable;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Ljava/lang/Runnable;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public B(Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->m:Landroid/widget/TextView;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->m:Landroid/widget/TextView;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-object p0
.end method

.method public C(Landroid/view/View;)Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->h:Lv/VFrame;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->h:Lv/VFrame;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->c:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public E(I)Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->j:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->j:Lv/VImage;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public F()Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;
    .locals 3

    .line 1
    new-instance v0, Ll/rgi0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/rgi0;-><init>(Lcom/tantan/library/svga/SVGAnimationView;Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->x:Ll/jtd0;

    .line 11
    .line 12
    const-string v1, "https://auto.tancdn.com/v1/raw/48b01864-e871-498a-9151-f761e3d3188708.so"

    .line 13
    .line 14
    const/4 v2, -0x1

    .line 15
    invoke-interface {v0, v1, v2}, Ll/jtd0;->c(Ljava/lang/Object;I)V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method public G()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->u:Lv/VFrame;

    .line 2
    .line 3
    const/high16 v1, 0x40e00000    # 7.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    const/4 v2, 0x3

    .line 11
    new-array v2, v2, [F

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    const/4 v4, 0x0

    .line 15
    aput v4, v2, v3

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    aput v1, v2, v3

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    aput v4, v2, v1

    .line 22
    .line 23
    const-string v1, "translationY"

    .line 24
    .line 25
    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->z:Landroid/animation/ObjectAnimator;

    .line 30
    .line 31
    const-wide/16 v1, 0x5dc

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->z:Landroid/animation/ObjectAnimator;

    .line 37
    .line 38
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 39
    .line 40
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->z:Landroid/animation/ObjectAnimator;

    .line 47
    .line 48
    const/4 v0, -0x1

    .line 49
    invoke-virtual {p0, v0}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public L(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->s:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->s:Landroid/widget/TextView;

    .line 13
    .line 14
    new-instance v0, Ll/wj3;

    .line 15
    .line 16
    invoke-direct {v0, p2}, Ll/wj3;-><init>(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-object p0
.end method

.method public M(ILandroid/widget/CompoundButton$OnCheckedChangeListener;)Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->o:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->q:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 10
    .line 11
    .line 12
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->A:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    .line 13
    .line 14
    return-object p0
.end method

.method public N(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->r:Lv/VButton;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->r:Lv/VButton;

    .line 7
    .line 8
    new-instance v0, Ll/vj3;

    .line 9
    .line 10
    invoke-direct {v0, p0, p2}, Ll/vj3;-><init>(Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    return-object p0
.end method

.method public O(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->b:Lv/VDraweeView;

    .line 2
    .line 3
    const/high16 v1, 0x437a0000    # 250.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->b:Lv/VDraweeView;

    .line 15
    .line 16
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->D(Landroid/view/View;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-object p0
.end method

.method public Q()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->z:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->x:Ll/jtd0;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->x:Ll/jtd0;

    .line 15
    .line 16
    invoke-interface {p0}, Ll/jtd0;->a()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public R(Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->l:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->l:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public S(I)Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->l:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public T(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->k:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->k:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->w:Landroid/graphics/Path;

    .line 6
    .line 7
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 8
    .line 9
    .line 10
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->Q()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "boost_dlg_bubble"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->u(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->G()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->r:Lv/VButton;

    .line 11
    .line 12
    sget v1, Ll/dbc0;->U:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->k:Lv/VText;

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {p0, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->P(II)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setRectRadius(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->y:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final u(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/xj3;->a(Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public v(Ljava/lang/String;I)Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->x:Ll/jtd0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->x:Ll/jtd0;

    .line 10
    .line 11
    invoke-interface {v0, p1, p2}, Ll/jtd0;->b(Ljava/lang/Object;I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-object p0
.end method

.method public w(I)Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->b:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->b:Lv/VDraweeView;

    .line 7
    .line 8
    const/high16 v0, 0x437a0000    # 250.0f

    .line 9
    .line 10
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method

.method public z(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/views/BusinessAnimView;->p:Lv/VCheckBox;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
