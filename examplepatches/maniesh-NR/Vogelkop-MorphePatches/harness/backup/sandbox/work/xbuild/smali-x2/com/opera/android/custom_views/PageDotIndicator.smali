.class public Lcom/opera/android/custom_views/PageDotIndicator;
.super Landroid/view/View;
.source "SourceFile"


# static fields
.field public static final e:[I

.field public static final f:[I


# instance fields
.field public final a:Lwwf;

.field public b:Landroidx/viewpager/widget/ViewPager;

.field public c:Landroid/graphics/drawable/Drawable;

.field public final d:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const v0, 0x10100a1

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lcom/opera/android/custom_views/PageDotIndicator;->e:[I

    const/4 v0, 0x0

    new-array v0, v0, [I

    sput-object v0, Lcom/opera/android/custom_views/PageDotIndicator;->f:[I

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

    sget-object v0, Lkhh;->y:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_1a

    invoke-virtual {p2, v0, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    invoke-static {v1, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/custom_views/PageDotIndicator;->c:Landroid/graphics/drawable/Drawable;

    :cond_1a
    const/4 p1, 0x1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    iput p1, p0, Lcom/opera/android/custom_views/PageDotIndicator;->d:I

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    new-instance p1, Lwwf;

    new-instance p2, Lwub;

    invoke-direct {p2, p0}, Lwub;-><init>(Ljava/lang/Object;)V

    invoke-direct {p1, p2}, Lwwf;-><init>(Lvwf;)V

    iput-object p1, p0, Lcom/opera/android/custom_views/PageDotIndicator;->a:Lwwf;

    return-void
.end method


# virtual methods
.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 12

    iget-object v0, p0, Lcom/opera/android/custom_views/PageDotIndicator;->c:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_7d

    iget-object v1, p0, Lcom/opera/android/custom_views/PageDotIndicator;->b:Landroidx/viewpager/widget/ViewPager;

    if-eqz v1, :cond_7d

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    iget-object v1, p0, Lcom/opera/android/custom_views/PageDotIndicator;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    iget-object v4, p0, Lcom/opera/android/custom_views/PageDotIndicator;->b:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v4}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v4

    const/4 v5, 0x0

    :goto_25
    if-ge v5, v4, :cond_7d

    iget v6, p0, Lcom/opera/android/custom_views/PageDotIndicator;->d:I

    add-int/2addr v6, v0

    mul-int/2addr v6, v5

    add-int/2addr v6, v2

    iget-object v7, p0, Lcom/opera/android/custom_views/PageDotIndicator;->c:Landroid/graphics/drawable/Drawable;

    add-int v8, v6, v0

    add-int v9, v3, v1

    invoke-virtual {v7, v6, v3, v8, v9}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    int-to-float v6, v5

    iget-object v7, p0, Lcom/opera/android/custom_views/PageDotIndicator;->a:Lwwf;

    iget v7, v7, Lwwf;->c:F

    sub-float/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-static {v7, v6}, Ljava/lang/Math;->min(FF)F

    move-result v6

    sub-float v6, v7, v6

    sub-float/2addr v7, v6

    const/high16 v8, 0x437f0000    # 255.0f

    mul-float/2addr v7, v8

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    mul-float/2addr v6, v8

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    if-lez v7, :cond_67

    iget-object v8, p0, Lcom/opera/android/custom_views/PageDotIndicator;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v8, v7}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object v7, p0, Lcom/opera/android/custom_views/PageDotIndicator;->c:Landroid/graphics/drawable/Drawable;

    sget-object v8, Lcom/opera/android/custom_views/PageDotIndicator;->f:[I

    invoke-virtual {v7, v8}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    iget-object v7, p0, Lcom/opera/android/custom_views/PageDotIndicator;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_67
    if-lez v6, :cond_7a

    iget-object v7, p0, Lcom/opera/android/custom_views/PageDotIndicator;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v7, v6}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object v6, p0, Lcom/opera/android/custom_views/PageDotIndicator;->c:Landroid/graphics/drawable/Drawable;

    sget-object v7, Lcom/opera/android/custom_views/PageDotIndicator;->e:[I

    invoke-virtual {v6, v7}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    iget-object v6, p0, Lcom/opera/android/custom_views/PageDotIndicator;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_7a
    add-int/lit8 v5, v5, 0x1

    goto :goto_25

    :cond_7d
    return-void
.end method

.method public final onMeasure(II)V
    .registers 6

    iget-object p1, p0, Lcom/opera/android/custom_views/PageDotIndicator;->c:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_40

    iget-object p1, p0, Lcom/opera/android/custom_views/PageDotIndicator;->b:Landroidx/viewpager/widget/ViewPager;

    if-eqz p1, :cond_40

    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result p1

    add-int/lit8 p2, p1, -0x1

    iget v0, p0, Lcom/opera/android/custom_views/PageDotIndicator;->d:I

    mul-int/2addr p2, v0

    const/4 v0, 0x1

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    add-int/2addr v2, v0

    iget-object v0, p0, Lcom/opera/android/custom_views/PageDotIndicator;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    mul-int/2addr v0, p1

    add-int/2addr v0, p2

    add-int/2addr v0, v1

    iget-object p1, p0, Lcom/opera/android/custom_views/PageDotIndicator;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p1

    add-int/2addr p1, v2

    invoke-virtual {p0, v0, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void

    :cond_40
    const/16 p1, 0x32

    const/16 p2, 0xa

    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    return-void
.end method
