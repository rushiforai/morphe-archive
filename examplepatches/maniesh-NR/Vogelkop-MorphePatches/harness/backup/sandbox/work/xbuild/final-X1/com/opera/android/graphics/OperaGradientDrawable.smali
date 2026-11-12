.class public final Lcom/opera/android/graphics/OperaGradientDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001:\u0001\u0002B\u0011\u0008\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005B\t\u0008\u0016\u00a2\u0006\u0004\u0008\u0004\u0010\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "Lcom/opera/android/graphics/OperaGradientDrawable;",
        "Landroid/graphics/drawable/Drawable;",
        "Lwkf;",
        "mConstantState",
        "<init>",
        "(Lwkf;)V",
        "()V",
        "graphics"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public a:Lwkf;

.field public final b:Landroid/graphics/Paint;

.field public c:Lo8f;

.field public d:Z

.field public e:I

.field public f:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 40
    new-instance v0, Lwkf;

    invoke-direct {v0}, Lwkf;-><init>()V

    invoke-direct {p0, v0}, Lcom/opera/android/graphics/OperaGradientDrawable;-><init>(Lwkf;)V

    return-void
.end method

.method private constructor <init>(Lwkf;)V
    .registers 3

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    iput-object p1, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->a:Lwkf;

    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->b:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->a:Lwkf;

    iget v0, v0, Lwkf;->b:I

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->a:Lwkf;

    iget v0, v0, Lwkf;->b:I

    if-nez v0, :cond_1e

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    goto :goto_20

    :cond_1e
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    :goto_20
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {p0}, Lcom/opera/android/graphics/OperaGradientDrawable;->a()Z

    return-void
.end method

.method public synthetic constructor <init>(Lwkf;Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 3

    .line 39
    invoke-direct {p0, p1}, Lcom/opera/android/graphics/OperaGradientDrawable;-><init>(Lwkf;)V

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 6

    iget-object v0, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->a:Lwkf;

    iget-object v0, v0, Lwkf;->d:Lbp;

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    iget v1, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->e:I

    const/4 v3, 0x1

    if-ne v0, v1, :cond_18

    move v0, v2

    goto :goto_1b

    :cond_18
    iput v0, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->e:I

    move v0, v3

    :goto_1b
    iget-object v1, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->a:Lwkf;

    iget-object v1, v1, Lwkf;->e:Lbp;

    iget-object v1, v1, Lbp;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v4

    invoke-virtual {v1, v4, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    iget v4, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->f:I

    if-eq v1, v4, :cond_32

    iput v1, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->f:I

    move v2, v3

    :cond_32
    or-int/2addr v0, v2

    return v0
.end method

.method public final applyTheme(Landroid/content/res/Resources$Theme;)V
    .registers 7

    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->applyTheme(Landroid/content/res/Resources$Theme;)V

    iget-object v0, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->a:Lwkf;

    iget-object v0, v0, Lwkf;->d:Lbp;

    iget v1, v0, Lbp;->a:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_f

    move v0, v3

    goto :goto_21

    :cond_f
    filled-new-array {v1}, [I

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    iput-object v4, v0, Lbp;->b:Ljava/lang/Object;

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    move v0, v2

    :goto_21
    iget-object v1, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->a:Lwkf;

    iget-object v1, v1, Lwkf;->e:Lbp;

    iget v4, v1, Lbp;->a:I

    if-nez v4, :cond_2b

    move v2, v3

    goto :goto_3c

    :cond_2b
    filled-new-array {v4}, [I

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    iput-object v3, v1, Lbp;->b:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    :goto_3c
    if-nez v0, :cond_40

    if-eqz v2, :cond_53

    :cond_40
    invoke-virtual {p0}, Lcom/opera/android/graphics/OperaGradientDrawable;->a()Z

    move-result p1

    if-eqz p1, :cond_53

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/Rect;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_53

    invoke-virtual {p0}, Lcom/opera/android/graphics/OperaGradientDrawable;->b()V

    :cond_53
    return-void
.end method

.method public final b()V
    .registers 10

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    iget-object v2, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->a:Lwkf;

    iget v2, v2, Lwkf;->c:I

    invoke-static {v1, v0, v2}, Lzi4;->w(III)Landroid/graphics/Rect;

    move-result-object v0

    new-instance v1, Landroid/graphics/LinearGradient;

    iget v2, v0, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    iget v3, v0, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    iget v4, v0, Landroid/graphics/Rect;->right:I

    int-to-float v4, v4

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v5, v0

    iget v6, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->e:I

    iget v7, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->f:I

    sget-object v8, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v1 .. v8}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    iget-object v0, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->b:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    iget-object v0, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->c:Lo8f;

    if-eqz v0, :cond_37

    invoke-virtual {v0, v1}, Lo8f;->run(Ljava/lang/Object;)V

    :cond_37
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public final canApplyTheme()Z
    .registers 2

    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->canApplyTheme()Z

    move-result v0

    if-nez v0, :cond_16

    iget-object p0, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->a:Lwkf;

    iget-object v0, p0, Lwkf;->d:Lbp;

    iget v0, v0, Lbp;->a:I

    if-nez v0, :cond_16

    iget-object p0, p0, Lwkf;->e:Lbp;

    iget p0, p0, Lbp;->a:I

    if-nez p0, :cond_16

    const/4 p0, 0x0

    return p0

    :cond_16
    const/4 p0, 0x1

    return p0
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .registers 14

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iget-object v1, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->a:Lwkf;

    iget v2, v1, Lwkf;->b:I

    int-to-float v2, v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    iget v3, v0, Landroid/graphics/Rect;->left:I

    int-to-float v3, v3

    add-float v5, v3, v2

    iget v3, v0, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    add-float v6, v3, v2

    iget v3, v0, Landroid/graphics/Rect;->right:I

    int-to-float v3, v3

    sub-float v7, v3, v2

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v0, v0

    sub-float v8, v0, v2

    iget v0, v1, Lwkf;->a:I

    int-to-float v1, v0

    sub-float v9, v1, v2

    int-to-float v0, v0

    sub-float v10, v0, v2

    iget-object v11, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->b:Landroid/graphics/Paint;

    move-object v4, p1

    invoke-virtual/range {v4 .. v11}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public final getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->a:Lwkf;

    return-object p0
.end method

.method public final getOpacity()I
    .registers 1

    const/4 p0, -0x3

    return p0
.end method

.method public final getOutline(Landroid/graphics/Outline;)V
    .registers 3

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iget-object p0, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->a:Lwkf;

    iget p0, p0, Lwkf;->a:I

    int-to-float p0, p0

    invoke-virtual {p1, v0, p0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    const/high16 p0, 0x3f800000    # 1.0f

    invoke-virtual {p1, p0}, Landroid/graphics/Outline;->setAlpha(F)V

    return-void
.end method

.method public final inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V
    .registers 8

    invoke-super {p0, p1, p2, p3, p4}, Landroid/graphics/drawable/Drawable;->inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V

    sget-object p2, Llhh;->a:[I

    const/4 v0, 0x0

    if-eqz p4, :cond_e

    invoke-virtual {p4, p3, p2, v0, v0}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p4

    if-nez p4, :cond_12

    :cond_e
    invoke-virtual {p1, p3, p2}, Landroid/content/res/Resources;->obtainAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p4

    :cond_12
    iget-object p1, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->a:Lwkf;

    const/4 p2, 0x1

    invoke-virtual {p4, p2, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p2

    iput p2, p1, Lwkf;->c:I

    invoke-virtual {p4, v0, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p1, Lwkf;->a:I

    const/4 p2, 0x4

    invoke-virtual {p4, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p1, Lwkf;->b:I

    iget-object p2, p1, Lwkf;->d:Lbp;

    const/4 p3, 0x3

    invoke-virtual {p4, p3}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v0

    const/4 v1, 0x2

    if-eqz v0, :cond_41

    iget v2, v0, Landroid/util/TypedValue;->type:I

    if-ne v2, v1, :cond_3b

    iget p3, v0, Landroid/util/TypedValue;->data:I

    iput p3, p2, Lbp;->a:I

    goto :goto_41

    :cond_3b
    invoke-virtual {p4, p3}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p3

    iput-object p3, p2, Lbp;->b:Ljava/lang/Object;

    :cond_41
    :goto_41
    iget-object p1, p1, Lwkf;->e:Lbp;

    invoke-virtual {p4, v1}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object p2

    if-eqz p2, :cond_58

    iget p3, p2, Landroid/util/TypedValue;->type:I

    if-ne p3, v1, :cond_52

    iget p2, p2, Landroid/util/TypedValue;->data:I

    iput p2, p1, Lbp;->a:I

    goto :goto_58

    :cond_52
    invoke-virtual {p4, v1}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    iput-object p2, p1, Lbp;->b:Ljava/lang/Object;

    :cond_58
    :goto_58
    invoke-virtual {p4}, Landroid/content/res/TypedArray;->recycle()V

    iget-object p1, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->a:Lwkf;

    iget p1, p1, Lwkf;->b:I

    int-to-float p1, p1

    iget-object p2, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->b:Landroid/graphics/Paint;

    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object p1, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->a:Lwkf;

    iget p1, p1, Lwkf;->b:I

    if-nez p1, :cond_6e

    sget-object p1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    goto :goto_70

    :cond_6e
    sget-object p1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    :goto_70
    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {p0}, Lcom/opera/android/graphics/OperaGradientDrawable;->a()Z

    return-void
.end method

.method public final isStateful()Z
    .registers 2

    iget-object v0, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->a:Lwkf;

    iget-object v0, v0, Lwkf;->d:Lbp;

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v0

    if-nez v0, :cond_1e

    iget-object p0, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->a:Lwkf;

    iget-object p0, p0, Lwkf;->e:Lbp;

    iget-object p0, p0, Lbp;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/res/ColorStateList;

    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result p0

    if-nez p0, :cond_1e

    const/4 p0, 0x0

    return p0

    :cond_1e
    const/4 p0, 0x1

    return p0
.end method

.method public final mutate()Landroid/graphics/drawable/Drawable;
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->d:Z

    if-nez v0, :cond_16

    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-ne v0, p0, :cond_16

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->d:Z

    new-instance v0, Lwkf;

    iget-object v1, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->a:Lwkf;

    invoke-direct {v0, v1}, Lwkf;-><init>(Lwkf;)V

    iput-object v0, p0, Lcom/opera/android/graphics/OperaGradientDrawable;->a:Lwkf;

    :cond_16
    return-object p0
.end method

.method public final onBoundsChange(Landroid/graphics/Rect;)V
    .registers 2

    invoke-virtual {p0}, Lcom/opera/android/graphics/OperaGradientDrawable;->b()V

    return-void
.end method

.method public final onStateChange([I)Z
    .registers 2

    invoke-virtual {p0}, Lcom/opera/android/graphics/OperaGradientDrawable;->a()Z

    move-result p1

    if-eqz p1, :cond_b

    invoke-virtual {p0}, Lcom/opera/android/graphics/OperaGradientDrawable;->b()V

    const/4 p0, 0x1

    return p0

    :cond_b
    const/4 p0, 0x0

    return p0
.end method

.method public final setAlpha(I)V
    .registers 2

    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2

    return-void
.end method
