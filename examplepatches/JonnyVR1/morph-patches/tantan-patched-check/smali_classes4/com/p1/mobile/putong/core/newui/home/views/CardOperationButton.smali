.class public Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;
.super Lv/VFrame;
.source "SourceFile"

# interfaces
.implements Ll/avl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton$a;,
        Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton$b;
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/view/View;

.field public c:Lv/VIcon;

.field public d:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field public e:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public f:I

.field public g:F

.field public h:I

.field public i:Landroid/graphics/drawable/Drawable;

.field public j:Landroid/graphics/drawable/Drawable;

.field public k:Landroid/view/View;

.field public l:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton$b;

.field public m:Z

.field public n:Z

.field public o:Landroid/graphics/Paint;

.field public p:Landroid/graphics/Path;

.field public q:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 98
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 97
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p3, -0x1

    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->h:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->m:Z

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->q:F

    .line 12
    .line 13
    sget-object v0, Ll/khc0;->G:[I

    .line 14
    .line 15
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget p2, Ll/khc0;->H:I

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->f:I

    .line 27
    .line 28
    sget p2, Ll/khc0;->L:I

    .line 29
    .line 30
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->d:I

    .line 35
    .line 36
    sget p2, Ll/khc0;->I:I

    .line 37
    .line 38
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->e:I

    .line 43
    .line 44
    sget p2, Ll/khc0;->K:I

    .line 45
    .line 46
    const/high16 v0, 0x3fc00000    # 1.5f

    .line 47
    .line 48
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->g:F

    .line 53
    .line 54
    const/high16 v1, 0x3f000000    # 0.5f

    .line 55
    .line 56
    invoke-static {v1, p2}, Ljava/lang/Math;->max(FF)F

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    invoke-static {p2, v0}, Ljava/lang/Math;->min(FF)F

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->g:F

    .line 65
    .line 66
    sget p2, Ll/khc0;->J:I

    .line 67
    .line 68
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->h:I

    .line 73
    .line 74
    sget p2, Ll/khc0;->M:I

    .line 75
    .line 76
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->i:Landroid/graphics/drawable/Drawable;

    .line 81
    .line 82
    sget p2, Ll/khc0;->N:I

    .line 83
    .line 84
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->j:Landroid/graphics/drawable/Drawable;

    .line 89
    .line 90
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 91
    .line 92
    .line 93
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->z()V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->B(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;Lv/VIcon;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->c:Lv/VIcon;

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->a:Landroid/view/View;

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->b:Landroid/view/View;

    return-void
.end method

.method private z()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->o:Landroid/graphics/Paint;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->p:Landroid/graphics/Path;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public final synthetic B(Landroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->n:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->l:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton$b;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton$b;->a()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return p1
.end method

.method public a(FLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 3

    .line 1
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->m:Z

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/high16 p2, 0x3f800000    # 1.0f

    .line 7
    .line 8
    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    cmpl-float v1, p1, v0

    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->b:Landroid/view/View;

    .line 20
    .line 21
    if-lez v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {v2, p1}, Landroid/view/View;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->c:Lv/VIcon;

    .line 27
    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->e:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-virtual {v2, v0}, Landroid/view/View;->setAlpha(F)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->c:Lv/VIcon;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/widget/ImageView;->clearColorFilter()V

    .line 40
    .line 41
    .line 42
    :goto_0
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->g:F

    .line 43
    .line 44
    sub-float/2addr v0, p2

    .line 45
    mul-float/2addr v0, p1

    .line 46
    add-float/2addr v0, p2

    .line 47
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleX(F)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleY(F)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->m:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 p1, 0x0

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->j(F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 6
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->q:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    cmpl-float v0, v0, v1

    .line 5
    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->p:Landroid/graphics/Path;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->p:Landroid/graphics/Path;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    div-int/lit8 v2, v2, 0x2

    .line 20
    .line 21
    int-to-float v2, v2

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    div-int/lit8 v3, v3, 0x2

    .line 27
    .line 28
    int-to-float v3, v3

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    div-int/lit8 v4, v4, 0x2

    .line 34
    .line 35
    int-to-float v4, v4

    .line 36
    sget-object v5, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    .line 37
    .line 38
    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->p:Landroid/graphics/Path;

    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->o:Landroid/graphics/Paint;

    .line 47
    .line 48
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->q:F

    .line 49
    .line 50
    const/high16 v3, 0x19000000

    .line 51
    .line 52
    invoke-virtual {v0, v2, v1, v1, v3}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->p:Landroid/graphics/Path;

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->o:Landroid/graphics/Paint;

    .line 58
    .line 59
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public getRealView()Landroid/view/View;
    .locals 0

    return-object p0
.end method

.method public i()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->m:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->reset()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public j(F)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->UNKNOWN:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->a(FLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

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
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->m:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget v1, Ll/kec0;->P0:I

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->w(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->c:Lv/VIcon;

    .line 27
    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->f:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lv/VIcon;->setIconStyle(I)V

    .line 31
    .line 32
    .line 33
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->h:I

    .line 34
    .line 35
    const/4 v1, -0x1

    .line 36
    if-eq v0, v1, :cond_1

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->c:Lv/VIcon;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    iget v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->h:I

    .line 45
    .line 46
    invoke-static {v2, v3}, Landroid/animation/AnimatorInflater;->loadStateListAnimator(Landroid/content/Context;I)Landroid/animation/StateListAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v0, v2}, Landroid/view/View;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->d:I

    .line 54
    .line 55
    if-eq v0, v1, :cond_2

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->c:Lv/VIcon;

    .line 58
    .line 59
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 60
    .line 61
    .line 62
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->i:Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->setNormalStateLayerBackground(Landroid/graphics/drawable/Drawable;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->j:Landroid/graphics/drawable/Drawable;

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->setPressedStateLayerBackground(Landroid/graphics/drawable/Drawable;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->b:Landroid/view/View;

    .line 73
    .line 74
    const/4 v0, 0x0

    .line 75
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public reset()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;->UNKNOWN:Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->c(Lcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setActivated(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setActivated(Z)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->m:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->c:Lv/VIcon;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Landroid/view/View;->setPressed(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->k:Landroid/view/View;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->k:Landroid/view/View;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/view/View;->setPressed(Z)V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method

.method public setHovered(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setHovered(Z)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->m:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->c:Lv/VIcon;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Landroid/view/View;->setHovered(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->k:Landroid/view/View;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->k:Landroid/view/View;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/view/View;->setPressed(Z)V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method

.method public setIconAlpha(F)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->m:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->c:Lv/VIcon;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setIconPressStateColor(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->m:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->e:I

    .line 7
    .line 8
    return-void
.end method

.method public setNormalStateIcon(I)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->m:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->c:Lv/VIcon;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setNormalStateLayerBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->m:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->a:Landroid/view/View;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setOnLongPressListener(Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->l:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton$b;

    .line 2
    .line 3
    new-instance p1, Ll/hm4;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Ll/hm4;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setPressed(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setPressed(Z)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_1

    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->n:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->l:Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton$b;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton$b;->b()V

    .line 15
    .line 16
    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->n:Z

    .line 19
    .line 20
    :cond_1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->m:Z

    .line 21
    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    return-void

    .line 25
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->c:Lv/VIcon;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Landroid/view/View;->setPressed(Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->k:Landroid/view/View;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->k:Landroid/view/View;

    .line 39
    .line 40
    invoke-virtual {v0, p1}, Landroid/view/View;->setPressed(Z)V

    .line 41
    .line 42
    .line 43
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->b:Landroid/view/View;

    .line 44
    .line 45
    if-eqz p1, :cond_4

    .line 46
    .line 47
    const/high16 p1, 0x3f800000    # 1.0f

    .line 48
    .line 49
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->c:Lv/VIcon;

    .line 53
    .line 54
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->e:I

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_4
    const/4 p1, 0x0

    .line 61
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->c:Lv/VIcon;

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/widget/ImageView;->clearColorFilter()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public setPressedStateLayerBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->m:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->b:Landroid/view/View;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setShadowSize(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;->q:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final w(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton$a;->a(Lcom/p1/mobile/putong/core/newui/home/views/CardOperationButton;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
