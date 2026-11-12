.class public final Lcom/opera/android/widget/GradientSlider;
.super Lcom/google/android/material/slider/Slider;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "Lcom/opera/android/widget/GradientSlider;",
        "Lcom/google/android/material/slider/Slider;",
        "o2a",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final m1:Landroid/content/res/ColorStateList;


# instance fields
.field public f1:Landroid/content/res/ColorStateList;

.field public g1:Landroid/content/res/ColorStateList;

.field public final h1:I

.field public final i1:Z

.field public final j1:Landroid/graphics/Paint;

.field public final k1:Lo2a;

.field public final l1:Lf0a;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x0

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    sput-object v0, Lcom/opera/android/widget/GradientSlider;->m1:Landroid/content/res/ColorStateList;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 9
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/slider/Slider;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {p0}, Lcom/google/android/material/slider/Slider;->w0()Landroid/content/res/ColorStateList;

    move-result-object v1

    iput-object v1, p0, Lcom/opera/android/widget/GradientSlider;->f1:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Lcom/google/android/material/slider/Slider;->w0()Landroid/content/res/ColorStateList;

    move-result-object v1

    iput-object v1, p0, Lcom/opera/android/widget/GradientSlider;->g1:Landroid/content/res/ColorStateList;

    const/4 v1, -0x1

    iput v1, p0, Lcom/opera/android/widget/GradientSlider;->h1:I

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/opera/android/widget/GradientSlider;->i1:Z

    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    sget-object v4, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    invoke-virtual {p0}, Lcom/google/android/material/slider/Slider;->v0()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iput-object v3, p0, Lcom/opera/android/widget/GradientSlider;->j1:Landroid/graphics/Paint;

    new-instance v3, Lo2a;

    iget-object v4, p0, Lcom/opera/android/widget/GradientSlider;->f1:Landroid/content/res/ColorStateList;

    iget-object v5, p0, Lcom/opera/android/widget/GradientSlider;->g1:Landroid/content/res/ColorStateList;

    invoke-direct {v3, p0, v4, v5}, Lo2a;-><init>(Lcom/opera/android/widget/GradientSlider;Landroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;)V

    iput-object v3, p0, Lcom/opera/android/widget/GradientSlider;->k1:Lo2a;

    new-instance v3, Lf0a;

    invoke-direct {v3}, Lf0a;-><init>()V

    iput-object v3, p0, Lcom/opera/android/widget/GradientSlider;->l1:Lf0a;

    sget-object v3, Lkhh;->o:[I

    const v4, 0x7f04089e

    invoke-virtual {p1, p2, v3, v4, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    const v3, 0x7f0402ff

    const v4, 0x7f060614

    invoke-static {v3, p1, v4}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v3

    if-nez v3, :cond_62

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    invoke-static {v3, v4, v5}, Landroidx/core/content/res/ResourcesCompat;->a(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;

    move-result-object v3

    :cond_62
    const/4 v4, 0x2

    invoke-virtual {p2, v4}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    if-nez v4, :cond_6a

    move-object v4, v3

    :cond_6a
    iput-object v4, p0, Lcom/opera/android/widget/GradientSlider;->f1:Landroid/content/res/ColorStateList;

    invoke-virtual {p2, v2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    if-eqz v2, :cond_73

    move-object v3, v2

    :cond_73
    iput-object v3, p0, Lcom/opera/android/widget/GradientSlider;->g1:Landroid/content/res/ColorStateList;

    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    iput v0, p0, Lcom/opera/android/widget/GradientSlider;->h1:I

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    if-eq v0, v1, :cond_88

    new-instance p2, Ln2a;

    invoke-direct {p2, p0, p1}, Ln2a;-><init>(Lcom/opera/android/widget/GradientSlider;Landroid/content/Context;)V

    invoke-virtual {p0, p2}, Lcom/google/android/material/slider/Slider;->t0(Lw73;)V

    :cond_88
    const/4 p1, 0x0

    invoke-static {p0, p1}, Lr5n;->l(Landroid/view/View;Lf8;)V

    return-void
.end method


# virtual methods
.method public final B0(Landroid/content/res/ColorStateList;)V
    .registers 2

    sget-object p1, Lcom/opera/android/widget/GradientSlider;->m1:Landroid/content/res/ColorStateList;

    invoke-super {p0, p1}, Lcom/google/android/material/slider/Slider;->B0(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final W(Landroid/content/res/ColorStateList;)V
    .registers 2

    sget-object p1, Lcom/opera/android/widget/GradientSlider;->m1:Landroid/content/res/ColorStateList;

    invoke-super {p0, p1}, Lcom/google/android/material/slider/Slider;->W(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final X(I)V
    .registers 4

    iget-boolean v0, p0, Lcom/opera/android/widget/GradientSlider;->i1:Z

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/opera/android/widget/GradientSlider;->j1:Landroid/graphics/Paint;

    int-to-float v1, p1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    :cond_a
    invoke-super {p0, p1}, Lcom/google/android/material/slider/Slider;->X(I)V

    return-void
.end method

.method public final Y(Landroid/content/res/ColorStateList;)V
    .registers 2

    sget-object p1, Lcom/opera/android/widget/GradientSlider;->m1:Landroid/content/res/ColorStateList;

    invoke-super {p0, p1}, Lcom/google/android/material/slider/Slider;->Y(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 15

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "calculateTrackCenter"

    const/4 v2, 0x0

    invoke-static {p0, v1, v2, v0}, Lmzg;->j(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_13

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_19

    :cond_13
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    :goto_19
    int-to-float v3, v0

    invoke-virtual {p0}, Lcom/google/android/material/slider/Slider;->x0()I

    move-result v0

    int-to-float v2, v0

    invoke-virtual {p0}, Lcom/google/android/material/slider/Slider;->y0()I

    move-result v0

    int-to-float v0, v0

    add-float v4, v0, v2

    iget-object v0, p0, Lcom/opera/android/widget/GradientSlider;->f1:Landroid/content/res/ColorStateList;

    iget-object v1, p0, Lcom/opera/android/widget/GradientSlider;->g1:Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Landroid/view/View;->getLayoutDirection()I

    move-result v5

    const/4 v6, 0x1

    iget-object v12, p0, Lcom/opera/android/widget/GradientSlider;->k1:Lo2a;

    if-ne v5, v6, :cond_3e

    invoke-virtual {v12, v1}, Lo2a;->a(Landroid/content/res/ColorStateList;)I

    move-result v1

    invoke-virtual {v12, v0}, Lo2a;->a(Landroid/content/res/ColorStateList;)I

    move-result v0

    move v10, v0

    move v9, v1

    goto :goto_48

    :cond_3e
    invoke-virtual {v12, v0}, Lo2a;->a(Landroid/content/res/ColorStateList;)I

    move-result v0

    invoke-virtual {v12, v1}, Lo2a;->a(Landroid/content/res/ColorStateList;)I

    move-result v1

    move v9, v0

    move v10, v1

    :goto_48
    iget-object v0, v12, Lo2a;->e:Landroid/graphics/LinearGradient;

    if-eqz v0, :cond_62

    iget v1, v12, Lo2a;->b:F

    cmpg-float v1, v1, v2

    if-nez v1, :cond_62

    iget v1, v12, Lo2a;->a:F

    cmpg-float v1, v1, v4

    if-nez v1, :cond_62

    iget v1, v12, Lo2a;->c:I

    if-ne v1, v9, :cond_62

    iget v1, v12, Lo2a;->d:I

    if-ne v1, v10, :cond_62

    move v7, v4

    goto :goto_78

    :cond_62
    iput v2, v12, Lo2a;->b:F

    iput v4, v12, Lo2a;->a:F

    iput v9, v12, Lo2a;->c:I

    iput v10, v12, Lo2a;->d:I

    move v7, v4

    new-instance v4, Landroid/graphics/LinearGradient;

    const/4 v8, 0x0

    sget-object v11, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/4 v6, 0x0

    move v5, v2

    invoke-direct/range {v4 .. v11}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    iput-object v4, v12, Lo2a;->e:Landroid/graphics/LinearGradient;

    move-object v0, v4

    :goto_78
    iget-object v6, p0, Lcom/opera/android/widget/GradientSlider;->j1:Landroid/graphics/Paint;

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    move v5, v3

    move-object v1, p1

    move v4, v7

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    invoke-super {p0, v1}, Lcom/google/android/material/slider/Slider;->onDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 6

    invoke-super/range {p0 .. p5}, Lcom/google/android/material/slider/Slider;->onLayout(ZIIII)V

    iget-object p1, p0, Lcom/opera/android/widget/GradientSlider;->l1:Lf0a;

    iget-object p1, p1, Lf0a;->a:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p3

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p4

    const/4 p5, 0x0

    invoke-virtual {p2, p5, p5, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Rect;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemGestureExclusionRects(Ljava/util/List;)V

    return-void
.end method
