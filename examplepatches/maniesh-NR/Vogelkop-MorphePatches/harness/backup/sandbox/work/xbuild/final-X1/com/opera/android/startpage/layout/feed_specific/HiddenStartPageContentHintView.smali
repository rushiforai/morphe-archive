.class public final Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;",
        "Landroid/view/View;",
        "bba",
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
.field public static final p:Lrxh;


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Landroid/text/TextPaint;

.field public final d:Llaj;

.field public e:I

.field public f:Z

.field public g:Lbba;

.field public h:Landroid/text/StaticLayout;

.field public i:Landroid/graphics/drawable/Drawable;

.field public j:Lf3d;

.field public k:I

.field public l:I

.field public m:Z

.field public n:Z

.field public o:Lf8k;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lrxh;

    const v1, 0x7f1411d0

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    sput-object v0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->p:Lrxh;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f07024b

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->a:I

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f07024c

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->b:I

    new-instance p2, Landroid/text/TextPaint;

    invoke-direct {p2}, Landroid/text/TextPaint;-><init>()V

    iput-object p2, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->c:Landroid/text/TextPaint;

    sget-object p2, Lmaj;->b:Lmaj;

    invoke-static {p1, p2}, Lu0h;->g(Landroid/content/Context;Lmaj;)Llaj;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->d:Llaj;

    sget-object p1, Lbba;->c:Lbba;

    iput-object p1, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->g:Lbba;

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 8

    iget-object v0, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->o:Lf8k;

    if-eqz v0, :cond_54

    iget-object v0, v0, Lf8k;->g:Lrmn;

    if-eqz v0, :cond_b

    iget-boolean v0, v0, Lrmn;->l:Z

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    const/high16 v1, -0x1000000

    if-eqz v0, :cond_12

    const/4 v0, -0x1

    goto :goto_13

    :cond_12
    move v0, v1

    :goto_13
    iget-object v2, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->c:Landroid/text/TextPaint;

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setColor(I)V

    if-eq v0, v1, :cond_1d

    iget-object v1, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->d:Llaj;

    goto :goto_1e

    :cond_1d
    const/4 v1, 0x0

    :goto_1e
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/DropShadowFrameLayout;

    invoke-virtual {v2, v1}, Lcom/opera/android/custom_views/DropShadowFrameLayout;->b(Llaj;)V

    iget-object v1, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->i:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_2e

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    :cond_2e
    iget-object v1, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->j:Lf3d;

    if-eqz v1, :cond_4f

    new-instance v2, Ldvb;

    const-string v3, "icon_fill"

    const-string v4, "**"

    filled-new-array {v4, v3, v4}, [Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ldvb;-><init>([Ljava/lang/String;)V

    sget-object v3, Lk3d;->a:Landroid/graphics/PointF;

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-instance v4, Lgz3;

    const/4 v5, 0x6

    invoke-direct {v4, v5, v0}, Lgz3;-><init>(BI)V

    invoke-virtual {v1, v2, v3, v4}, Lf3d;->a(Ldvb;Ljava/lang/Integer;Lykj;)V

    :cond_4f
    if-eqz p1, :cond_54

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_54
    return-void
.end method

.method public final b()V
    .registers 7

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    add-int/2addr v2, v1

    sub-int/2addr v0, v2

    iget v1, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->k:I

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->b:I

    sub-int/2addr v0, v1

    const/4 v1, 0x0

    if-gez v0, :cond_18

    move v0, v1

    :cond_18
    iget-object v2, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->g:Lbba;

    iget-object v2, v2, Lbba;->a:Lrxh;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v2, v3}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    iget-object v4, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->c:Landroid/text/TextPaint;

    invoke-static {v2, v1, v3, v4, v0}, Landroid/text/StaticLayout$Builder;->obtain(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/text/StaticLayout$Builder;->build()Landroid/text/StaticLayout;

    move-result-object v2

    invoke-virtual {v2}, Landroid/text/StaticLayout;->getLineCount()I

    move-result v3

    const/4 v5, 0x1

    if-le v3, v5, :cond_3e

    const/4 v2, 0x0

    :cond_3e
    if-nez v2, :cond_64

    sget-object v2, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->p:Lrxh;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v2, v3}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v3

    invoke-static {v2, v1, v3, v4, v0}, Landroid/text/StaticLayout$Builder;->obtain(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    move-result-object v1

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v1, v2}, Landroid/text/StaticLayout$Builder;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)Landroid/text/StaticLayout$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/text/StaticLayout$Builder;->setEllipsizedWidth(I)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/text/StaticLayout$Builder;->setMaxLines(I)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/text/StaticLayout$Builder;->build()Landroid/text/StaticLayout;

    move-result-object v2

    :cond_64
    iput-object v2, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->h:Landroid/text/StaticLayout;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 12

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget-boolean v0, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->f:Z

    if-eqz v0, :cond_a9

    sget-object v0, Lj14;->x:Landroid/graphics/Canvas;

    if-eq v0, p1, :cond_a9

    iget-object v0, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->i:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->h:Landroid/text/StaticLayout;

    if-eqz v0, :cond_a9

    if-eqz v1, :cond_a9

    iget v2, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->k:I

    iget v3, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->l:I

    invoke-virtual {v1}, Landroid/text/Layout;->getHeight()I

    move-result v4

    if-ge v4, v3, :cond_1e

    move v4, v3

    :cond_1e
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v5

    iget v6, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->e:I

    sub-int/2addr v5, v6

    invoke-virtual {v1}, Landroid/text/Layout;->getLineCount()I

    move-result v6

    const/4 v7, 0x0

    if-lez v6, :cond_3d

    invoke-virtual {v1, v7}, Landroid/text/Layout;->getLineRight(I)F

    move-result v6

    invoke-virtual {v1, v7}, Landroid/text/Layout;->getLineLeft(I)F

    move-result v8

    sub-float/2addr v6, v8

    float-to-double v8, v6

    invoke-static {v8, v9}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v8

    double-to-float v6, v8

    float-to-int v6, v6

    goto :goto_3e

    :cond_3d
    move v6, v7

    :goto_3e
    invoke-virtual {v1}, Landroid/text/Layout;->getLineCount()I

    move-result v8

    if-lez v8, :cond_52

    invoke-virtual {v1, v7}, Landroid/text/Layout;->getLineLeft(I)F

    move-result v7

    float-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->floor(D)D

    move-result-wide v7

    double-to-float v7, v7

    invoke-static {v7}, Lzed;->b(F)I

    move-result v7

    :cond_52
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v8

    sub-int/2addr v8, v6

    div-int/lit8 v8, v8, 0x2

    iget v6, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->b:I

    div-int/lit8 v9, v6, 0x2

    add-int/2addr v9, v8

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v9, v2

    iget p0, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->a:I

    sub-int/2addr v5, p0

    invoke-virtual {v1}, Landroid/text/Layout;->getHeight()I

    move-result p0

    add-int/2addr p0, v4

    div-int/lit8 p0, p0, 0x2

    sub-int p0, v5, p0

    int-to-float v8, v9

    int-to-float v7, v7

    sub-float/2addr v8, v7

    int-to-float p0, p0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v7

    invoke-virtual {p1, v8, p0}, Landroid/graphics/Canvas;->translate(FF)V

    :try_start_78
    invoke-virtual {v1, p1}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V
    :try_end_7b
    .catchall {:try_start_78 .. :try_end_7b} :catchall_a4

    invoke-virtual {p1, v7}, Landroid/graphics/Canvas;->restoreToCount(I)V

    sub-int/2addr v9, v6

    int-to-float p0, v5

    int-to-float v1, v4

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v1, v4

    sub-float/2addr p0, v1

    int-to-float v1, v3

    div-float/2addr v1, v4

    sub-float/2addr p0, v1

    float-to-int p0, p0

    sub-int/2addr v9, v2

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v3, p0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    div-int/lit8 v2, p0, 0x2

    sub-int/2addr v9, v2

    div-int/lit8 v2, v1, 0x2

    sub-int/2addr v3, v2

    add-int/2addr p0, v9

    add-int/2addr v1, v3

    invoke-virtual {v0, v9, v3, p0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void

    :catchall_a4
    move-exception p0

    invoke-virtual {p1, v7}, Landroid/graphics/Canvas;->restoreToCount(I)V

    throw p0

    :cond_a9
    return-void
.end method

.method public final onSizeChanged(IIII)V
    .registers 5

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    if-eq p1, p3, :cond_8

    invoke-virtual {p0}, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->b()V

    :cond_8
    return-void
.end method

.method public final onVisibilityChanged(Landroid/view/View;I)V
    .registers 10

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e9

    iget-boolean v0, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->f:Z

    if-nez v0, :cond_e9

    if-nez p2, :cond_e9

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f080520

    invoke-static {v1, v0}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    iput v1, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->k:I

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    iput v1, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->l:I

    iput-object v0, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->i:Landroid/graphics/drawable/Drawable;

    iget-boolean v0, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->m:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_51

    iget-object v0, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->o:Lf8k;

    if-eqz v0, :cond_3a

    iget-object v0, v0, Lf8k;->g:Lrmn;

    if-eqz v0, :cond_3a

    iget-boolean v0, v0, Lrmn;->l:Z

    if-ne v0, v1, :cond_3a

    const v0, 0x7f130054

    goto :goto_3d

    :cond_3a
    const v0, 0x7f130055

    :goto_3d
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v0, v2}, Lu2d;->j(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v0, v3}, Lu2d;->e(Landroid/content/Context;ILjava/lang/String;)Ln3d;

    move-result-object v0

    new-instance v2, Lhg2;

    invoke-direct {v2, p0, v1}, Lhg2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Ln3d;->b(Lj3d;)V

    :cond_51
    iget-object v0, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->c:Landroid/text/TextPaint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f040998

    const v5, 0x7f15027b

    invoke-static {v4, v3, v5}, Lf03;->E(ILandroid/content/Context;I)I

    move-result v3

    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    sget-object v5, Lzhh;->y:[I

    invoke-virtual {v4, v3, v5}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v3

    :try_start_72
    invoke-virtual {v0}, Landroid/graphics/Paint;->getTextSize()F

    move-result v4

    float-to-int v4, v4

    const/4 v5, 0x0

    invoke-virtual {v3, v5, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    const/16 v4, 0xc

    invoke-virtual {v3, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_a1

    const/4 v6, -0x1

    invoke-virtual {v3, v4, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    if-eq v4, v6, :cond_94

    invoke-static {v4, v2}, Landroidx/core/content/res/ResourcesCompat;->b(ILandroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v2

    goto :goto_9e

    :cond_94
    const/16 v2, 0xa

    invoke-virtual {v3, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v5}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v2

    :goto_9e
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    :cond_a1
    invoke-virtual {v0}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Typeface;->getWeight()I

    move-result v2

    const/16 v4, 0x1f4

    if-ne v2, v4, :cond_b7

    invoke-virtual {v0}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Typeface;->isItalic()Z

    move-result v2

    if-eqz v2, :cond_c2

    :cond_b7
    invoke-virtual {v0}, Landroid/graphics/Paint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v2

    invoke-static {v2, v4, v5}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
    :try_end_c2
    .catchall {:try_start_72 .. :try_end_c2} :catchall_e4

    :cond_c2
    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    invoke-virtual {p0}, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->b()V

    new-instance v0, Lpc5;

    const/16 v2, 0x1b

    invoke-direct {v0, p0, v2}, Lpc5;-><init>(Ljava/lang/Object;B)V

    sget-object v2, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object v2

    if-eqz v2, :cond_de

    invoke-static {v2, p0, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_de
    invoke-virtual {p0, v5}, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->a(Z)V

    iput-boolean v1, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->f:Z

    goto :goto_e9

    :catchall_e4
    move-exception p0

    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    throw p0

    :cond_e9
    :goto_e9
    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    return-void
.end method

.method public final verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .registers 3

    iget-object v0, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->i:Landroid/graphics/drawable/Drawable;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    invoke-super {p0, p1}, Landroid/view/View;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result p0

    if-nez p0, :cond_10

    const/4 p0, 0x0

    return p0

    :cond_10
    const/4 p0, 0x1

    return p0
.end method
