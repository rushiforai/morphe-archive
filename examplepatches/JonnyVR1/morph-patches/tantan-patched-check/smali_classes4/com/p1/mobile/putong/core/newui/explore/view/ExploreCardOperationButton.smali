.class public Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/drawable/Drawable;

.field public b:Landroid/graphics/drawable/Drawable;

.field public c:I

.field public d:I

.field public e:I

.field public f:F

.field public g:Landroid/graphics/Paint;

.field public h:Landroid/graphics/Path;

.field public i:Landroid/view/View;

.field public j:Landroid/view/View;

.field public k:Lv/VIcon;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 81
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 80
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    sget-object p3, Ll/khc0;->u0:[I

    .line 5
    .line 6
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    sget p2, Ll/khc0;->y0:I

    .line 11
    .line 12
    const/4 p3, -0x1

    .line 13
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->e:I

    .line 18
    .line 19
    sget p2, Ll/khc0;->v0:I

    .line 20
    .line 21
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->d:I

    .line 26
    .line 27
    sget p2, Ll/khc0;->x0:I

    .line 28
    .line 29
    const/high16 v0, 0x3fc00000    # 1.5f

    .line 30
    .line 31
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->f:F

    .line 36
    .line 37
    const/high16 v1, 0x3f000000    # 0.5f

    .line 38
    .line 39
    invoke-static {v1, p2}, Ljava/lang/Math;->max(FF)F

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    invoke-static {p2, v0}, Ljava/lang/Math;->min(FF)F

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->f:F

    .line 48
    .line 49
    sget p2, Ll/khc0;->w0:I

    .line 50
    .line 51
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->c:I

    .line 56
    .line 57
    sget p2, Ll/khc0;->z0:I

    .line 58
    .line 59
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->b:Landroid/graphics/drawable/Drawable;

    .line 64
    .line 65
    sget p2, Ll/khc0;->A0:I

    .line 66
    .line 67
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->a:Landroid/graphics/drawable/Drawable;

    .line 72
    .line 73
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->s()V

    .line 77
    .line 78
    .line 79
    return-void
.end method


# virtual methods
.method public a(FLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 3

    .line 1
    const/high16 p2, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    cmpl-float v1, p1, v0

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->j:Landroid/view/View;

    .line 15
    .line 16
    if-lez v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v2, p1}, Landroid/view/View;->setAlpha(F)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->k:Lv/VIcon;

    .line 22
    .line 23
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->d:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {v2, v0}, Landroid/view/View;->setAlpha(F)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->k:Lv/VIcon;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/widget/ImageView;->clearColorFilter()V

    .line 35
    .line 36
    .line 37
    :goto_0
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->f:F

    .line 38
    .line 39
    sub-float/2addr v0, p2

    .line 40
    mul-float/2addr v0, p1

    .line 41
    add-float/2addr v0, p2

    .line 42
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleX(F)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleY(F)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->j(F)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public j(F)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->UNKNOWN:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->a(FLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget v1, Ll/kec0;->b3:I

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->p(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->c:I

    .line 22
    .line 23
    const/4 v1, -0x1

    .line 24
    if-eq v0, v1, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->k:Lv/VIcon;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->c:I

    .line 33
    .line 34
    invoke-static {v2, v3}, Landroid/animation/AnimatorInflater;->loadStateListAnimator(Landroid/content/Context;I)Landroid/animation/StateListAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v0, v2}, Landroid/view/View;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->e:I

    .line 42
    .line 43
    if-eq v0, v1, :cond_1

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->k:Lv/VIcon;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->b:Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->setNormalStateLayerBackground(Landroid/graphics/drawable/Drawable;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->a:Landroid/graphics/drawable/Drawable;

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->setPressedStateLayerBackground(Landroid/graphics/drawable/Drawable;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->j:Landroid/view/View;

    .line 61
    .line 62
    const/4 v0, 0x0

    .line 63
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jpf;->a(Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public reset()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->UNKNOWN:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->c(Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final s()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->g:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Landroid/graphics/Path;

    .line 13
    .line 14
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->h:Landroid/graphics/Path;

    .line 18
    .line 19
    return-void
.end method

.method public setNormalStateLayerBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->i:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setPressedStateLayerBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->j:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u(II)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->i:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardOperationButton;->k:Lv/VIcon;

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
