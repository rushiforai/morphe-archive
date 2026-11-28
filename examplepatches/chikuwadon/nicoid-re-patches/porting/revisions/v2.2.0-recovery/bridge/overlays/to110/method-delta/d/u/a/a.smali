.class public Ld/u/a/a;
.super Landroid/widget/ImageView;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ld/u/a/a$a;
    }
.end annotation


# instance fields
.field public a:Landroid/view/animation/Animation$AnimationListener;

.field public b:I

.field private backgroundColor228:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-static {p1}, Ld/u/a/a;->resolveSpinnerColor228(Landroid/content/Context;)I

    move-result v0

    invoke-direct {p0, p1, v0}, Ld/u/a/a;-><init>(Landroid/content/Context;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 8

    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v0, 0x3fe00000    # 1.75f

    mul-float v0, v0, p1

    float-to-int v0, v0

    const/4 v1, 0x0

    mul-float v1, v1, p1

    float-to-int v1, v1

    const/high16 v2, 0x40600000    # 3.5f

    mul-float v2, v2, p1

    float-to-int v2, v2

    iput v2, p0, Ld/u/a/a;->b:I

    .line 1
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    const/4 v4, 0x1

    if-lt v2, v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_1

    .line 2
    new-instance v0, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v1, Landroid/graphics/drawable/shapes/OvalShape;

    invoke-direct {v1}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    const/high16 v1, 0x40800000    # 4.0f

    mul-float p1, p1, v1

    invoke-virtual {p0, p1}, Landroid/view/View;->setElevation(F)V

    goto :goto_1

    :cond_1
    new-instance p1, Ld/u/a/a$a;

    iget v2, p0, Ld/u/a/a;->b:I

    invoke-direct {p1, p0, v2}, Ld/u/a/a$a;-><init>(Ld/u/a/a;I)V

    new-instance v2, Landroid/graphics/drawable/ShapeDrawable;

    invoke-direct {v2, p1}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    invoke-virtual {v2}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object p1

    invoke-virtual {p0, v4, p1}, Landroid/widget/ImageView;->setLayerType(ILandroid/graphics/Paint;)V

    invoke-virtual {v2}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object p1

    iget v3, p0, Ld/u/a/a;->b:I

    int-to-float v3, v3

    int-to-float v1, v1

    int-to-float v0, v0

    const/high16 v4, 0x1e000000

    invoke-virtual {p1, v3, v1, v0, v4}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    iget p1, p0, Ld/u/a/a;->b:I

    invoke-virtual {p0, p1, p1, p1, p1}, Landroid/widget/ImageView;->setPadding(IIII)V

    move-object v0, v2

    :goto_1
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    iput p2, p0, Ld/u/a/a;->backgroundColor228:I

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method private static resolveSpinnerColor228(Landroid/content/Context;)I
    .registers 5

    sget-object v1, Landroidx/swiperefreshlayout/R$styleable;->SwipeRefreshLayout:[I

    sget v3, Landroidx/swiperefreshlayout/R$styleable;->SwipeRefreshLayout_swipeRefreshLayoutProgressSpinnerBackgroundColor:I

    const v0, -0x50506

    invoke-virtual {p0, v1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v1

    :try_start_0
    invoke-virtual {v1, v3, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    return v0

    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    throw v0
.end method


# virtual methods
.method public getBackgroundColor()I
    .registers 2

    iget v0, p0, Ld/u/a/a;->backgroundColor228:I

    return v0
.end method

.method public setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V
    .registers 2

    iput-object p1, p0, Ld/u/a/a;->a:Landroid/view/animation/Animation$AnimationListener;

    return-void
.end method

.method public setBackgroundColor(I)V
    .registers 3

    invoke-virtual {p0}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Landroid/graphics/drawable/ShapeDrawable;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/ShapeDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    iput p1, p0, Ld/u/a/a;->backgroundColor228:I

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_0
    return-void
.end method
