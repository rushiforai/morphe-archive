.class public Lcom/opera/android/widget/GraphView;
.super Landroid/view/View;
.source "SourceFile"

# interfaces
.implements Lk2c;


# static fields
.field public static final p:Lzp8;


# instance fields
.field public final a:Ll2c;

.field public final b:Landroid/graphics/Paint;

.field public final c:Landroid/graphics/Paint;

.field public final d:Landroid/graphics/Path;

.field public final e:Landroid/graphics/Path;

.field public final f:Landroid/util/SparseLongArray;

.field public final g:F

.field public h:Landroid/content/res/ColorStateList;

.field public i:Landroid/content/res/ColorStateList;

.field public j:F

.field public k:F

.field public l:Z

.field public m:Z

.field public n:F

.field public o:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lzp8;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/opera/android/widget/GraphView;->p:Lzp8;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/opera/android/widget/GraphView;->d:Landroid/graphics/Path;

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/opera/android/widget/GraphView;->e:Landroid/graphics/Path;

    new-instance v0, Landroid/util/SparseLongArray;

    invoke-direct {v0}, Landroid/util/SparseLongArray;-><init>()V

    iput-object v0, p0, Lcom/opera/android/widget/GraphView;->f:Landroid/util/SparseLongArray;

    const/high16 v0, -0x1000000

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    iput-object v1, p0, Lcom/opera/android/widget/GraphView;->h:Landroid/content/res/ColorStateList;

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/widget/GraphView;->i:Landroid/content/res/ColorStateList;

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/opera/android/widget/GraphView;->j:F

    iput v0, p0, Lcom/opera/android/widget/GraphView;->k:F

    const/4 v1, -0x1

    iput v1, p0, Lcom/opera/android/widget/GraphView;->o:I

    new-instance v1, Ll2c;

    invoke-direct {v1, p0, p0, p2}, Ll2c;-><init>(Landroid/view/View;Lk2c;Landroid/util/AttributeSet;)V

    iput-object v1, p0, Lcom/opera/android/widget/GraphView;->a:Ll2c;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const/high16 p2, 0x41800000    # 16.0f

    invoke-static {p2, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 v1, 0x1

    invoke-static {v1, v0, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    int-to-float p1, p1

    iput p1, p0, Lcom/opera/android/widget/GraphView;->g:F

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/opera/android/widget/GraphView;->b:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    new-instance v1, Landroid/graphics/CornerPathEffect;

    invoke-direct {v1, p2}, Landroid/graphics/CornerPathEffect;-><init>(F)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object p1, p0, Lcom/opera/android/widget/GraphView;->c:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 p1, 0x2

    new-array p1, p1, [F

    fill-array-data p1, :array_98

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    const-wide/16 v0, 0x5dc

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance p2, Lnl2;

    const/16 v0, 0x8

    invoke-direct {p2, p0, v0}, Lnl2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    return-void

    :array_98
    .array-data 4
        0x0
        0x40c00000    # 6.0f
    .end array-data
.end method


# virtual methods
.method public final a()V
    .registers 12

    iget-object v0, p0, Lcom/opera/android/widget/GraphView;->h:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v1

    const/high16 v2, -0x1000000

    invoke-virtual {v0, v1, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v8

    new-instance v3, Landroid/graphics/LinearGradient;

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v7, v0

    const/4 v0, 0x0

    invoke-static {v8, v0}, Lp37;->m0(II)I

    move-result v9

    sget-object v10, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-direct/range {v3 .. v10}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    iget-object v0, p0, Lcom/opera/android/widget/GraphView;->c:Landroid/graphics/Paint;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final b()Ll2c;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/widget/GraphView;->a:Ll2c;

    return-object p0
.end method

.method public final c(F)F
    .registers 3

    iget v0, p0, Lcom/opera/android/widget/GraphView;->j:F

    div-float/2addr p1, v0

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    mul-float/2addr p1, v0

    iget-boolean v0, p0, Lcom/opera/android/widget/GraphView;->m:Z

    if-eqz v0, :cond_14

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p0

    int-to-float p0, p0

    sub-float/2addr p0, p1

    return p0

    :cond_14
    return p1
.end method

.method public final d(FF)F
    .registers 7

    iget v0, p0, Lcom/opera/android/widget/GraphView;->o:I

    int-to-float v0, v0

    sub-float/2addr p2, v0

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p2, v0

    float-to-double v1, p2

    invoke-static {v1, v2}, Ljava/lang/Math;->floor(D)D

    move-result-wide v1

    double-to-float p2, v1

    iget-object v1, p0, Lcom/opera/android/widget/GraphView;->f:Landroid/util/SparseLongArray;

    invoke-virtual {v1}, Landroid/util/SparseLongArray;->size()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v0

    div-float/2addr p2, v1

    const v1, 0x3e4ccccd    # 0.2f

    div-float/2addr p2, v1

    iget v1, p0, Lcom/opera/android/widget/GraphView;->n:F

    sub-float/2addr v1, p2

    const/4 p2, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v1, p2, v2}, Lcs5;->s(FFF)F

    move-result p2

    sget-object v1, Lcom/opera/android/widget/GraphView;->p:Lzp8;

    invoke-virtual {v1, p2}, Lzp8;->getInterpolation(F)F

    move-result p2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    iget v3, p0, Lcom/opera/android/widget/GraphView;->g:F

    sub-float/2addr v1, v3

    iget p0, p0, Lcom/opera/android/widget/GraphView;->k:F

    div-float/2addr p1, p0

    mul-float/2addr p1, p2

    sub-float/2addr v2, p1

    mul-float/2addr v2, v1

    div-float/2addr v3, v0

    add-float/2addr v3, v2

    return v3
.end method

.method public final drawableStateChanged()V
    .registers 1

    invoke-super {p0}, Landroid/view/View;->drawableStateChanged()V

    invoke-virtual {p0}, Lcom/opera/android/widget/GraphView;->a()V

    return-void
.end method

.method public final i(I)V
    .registers 2

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/opera/android/widget/GraphView;->l:Z

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 11

    iget-boolean v0, p0, Lcom/opera/android/widget/GraphView;->l:Z

    iget-object v1, p0, Lcom/opera/android/widget/GraphView;->d:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/opera/android/widget/GraphView;->e:Landroid/graphics/Path;

    if-eqz v0, :cond_da

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/widget/GraphView;->l:Z

    iget-object v3, p0, Lcom/opera/android/widget/GraphView;->a:Ll2c;

    invoke-virtual {v3}, Ll2c;->b()Z

    move-result v3

    iput-boolean v3, p0, Lcom/opera/android/widget/GraphView;->m:Z

    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    iget-object v3, p0, Lcom/opera/android/widget/GraphView;->f:Landroid/util/SparseLongArray;

    invoke-virtual {v3, v0}, Landroid/util/SparseLongArray;->keyAt(I)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v3, v0}, Landroid/util/SparseLongArray;->valueAt(I)J

    move-result-wide v5

    long-to-float v5, v5

    invoke-virtual {p0, v4}, Lcom/opera/android/widget/GraphView;->c(F)F

    move-result v6

    invoke-virtual {p0, v5, v4}, Lcom/opera/android/widget/GraphView;->d(FF)F

    move-result v4

    invoke-virtual {v1, v6, v4}, Landroid/graphics/Path;->moveTo(FF)V

    const/4 v4, 0x1

    move v5, v4

    :goto_2f
    invoke-virtual {v3}, Landroid/util/SparseLongArray;->size()I

    move-result v6

    if-ge v5, v6, :cond_4d

    invoke-virtual {v3, v5}, Landroid/util/SparseLongArray;->keyAt(I)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v3, v5}, Landroid/util/SparseLongArray;->valueAt(I)J

    move-result-wide v7

    long-to-float v7, v7

    invoke-virtual {p0, v6}, Lcom/opera/android/widget/GraphView;->c(F)F

    move-result v8

    invoke-virtual {p0, v7, v6}, Lcom/opera/android/widget/GraphView;->d(FF)F

    move-result v6

    invoke-virtual {v1, v8, v6}, Landroid/graphics/Path;->lineTo(FF)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_2f

    :cond_4d
    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    const/4 v5, 0x0

    invoke-virtual {p0, v5}, Lcom/opera/android/widget/GraphView;->c(F)F

    move-result v6

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v2, v6, v7}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {p0, v5}, Lcom/opera/android/widget/GraphView;->c(F)F

    move-result v5

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v2, v5, v6}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v3, v0}, Landroid/util/SparseLongArray;->keyAt(I)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v3, v0}, Landroid/util/SparseLongArray;->valueAt(I)J

    move-result-wide v6

    long-to-float v6, v6

    invoke-virtual {p0, v5}, Lcom/opera/android/widget/GraphView;->c(F)F

    move-result v7

    invoke-virtual {p0, v6, v5}, Lcom/opera/android/widget/GraphView;->d(FF)F

    move-result v5

    invoke-virtual {v2, v7, v5}, Landroid/graphics/Path;->lineTo(FF)V

    :goto_7e
    invoke-virtual {v3}, Landroid/util/SparseLongArray;->size()I

    move-result v5

    if-ge v0, v5, :cond_9c

    invoke-virtual {v3, v0}, Landroid/util/SparseLongArray;->keyAt(I)I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v3, v0}, Landroid/util/SparseLongArray;->valueAt(I)J

    move-result-wide v6

    long-to-float v6, v6

    invoke-virtual {p0, v5}, Lcom/opera/android/widget/GraphView;->c(F)F

    move-result v7

    invoke-virtual {p0, v6, v5}, Lcom/opera/android/widget/GraphView;->d(FF)F

    move-result v5

    invoke-virtual {v2, v7, v5}, Landroid/graphics/Path;->lineTo(FF)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_7e

    :cond_9c
    invoke-virtual {v3}, Landroid/util/SparseLongArray;->size()I

    move-result v0

    sub-int/2addr v0, v4

    invoke-virtual {v3, v0}, Landroid/util/SparseLongArray;->keyAt(I)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {v3}, Landroid/util/SparseLongArray;->size()I

    move-result v5

    sub-int/2addr v5, v4

    invoke-virtual {v3, v5}, Landroid/util/SparseLongArray;->valueAt(I)J

    move-result-wide v3

    long-to-float v3, v3

    invoke-virtual {p0, v0}, Lcom/opera/android/widget/GraphView;->c(F)F

    move-result v4

    invoke-virtual {p0, v3, v0}, Lcom/opera/android/widget/GraphView;->d(FF)F

    move-result v0

    invoke-virtual {v2, v4, v0}, Landroid/graphics/Path;->lineTo(FF)V

    iget v0, p0, Lcom/opera/android/widget/GraphView;->j:F

    invoke-virtual {p0, v0}, Lcom/opera/android/widget/GraphView;->c(F)F

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v0, v3}, Landroid/graphics/Path;->lineTo(FF)V

    iget v0, p0, Lcom/opera/android/widget/GraphView;->j:F

    invoke-virtual {p0, v0}, Lcom/opera/android/widget/GraphView;->c(F)F

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v0, v3}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v2}, Landroid/graphics/Path;->close()V

    :cond_da
    iget-object v0, p0, Lcom/opera/android/widget/GraphView;->i:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    move-result-object v3

    const/high16 v4, -0x1000000

    invoke-virtual {v0, v3, v4}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    iget-object v3, p0, Lcom/opera/android/widget/GraphView;->b:Landroid/graphics/Paint;

    invoke-virtual {v3, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p0, p0, Lcom/opera/android/widget/GraphView;->c:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual {p1, v1, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method

.method public final onSizeChanged(IIII)V
    .registers 5

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    invoke-virtual {p0}, Lcom/opera/android/widget/GraphView;->a()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/opera/android/widget/GraphView;->l:Z

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method
