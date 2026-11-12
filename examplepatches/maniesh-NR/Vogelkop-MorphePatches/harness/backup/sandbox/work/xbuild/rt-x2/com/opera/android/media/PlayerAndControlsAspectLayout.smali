.class public Lcom/opera/android/media/PlayerAndControlsAspectLayout;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# static fields
.field public static final b:[Landroid/graphics/Point;


# instance fields
.field public a:F


# direct methods
.method static constructor <clinit>()V
    .registers 6

    new-instance v0, Landroid/graphics/Point;

    const/4 v1, 0x1

    const/4 v2, 0x2

    invoke-direct {v0, v2, v1}, Landroid/graphics/Point;-><init>(II)V

    new-instance v1, Landroid/graphics/Point;

    const/16 v3, 0x10

    const/16 v4, 0x9

    invoke-direct {v1, v3, v4}, Landroid/graphics/Point;-><init>(II)V

    new-instance v3, Landroid/graphics/Point;

    const/4 v4, 0x3

    invoke-direct {v3, v4, v2}, Landroid/graphics/Point;-><init>(II)V

    new-instance v4, Landroid/graphics/Point;

    const/4 v5, 0x4

    invoke-direct {v4, v5, v2}, Landroid/graphics/Point;-><init>(II)V

    filled-new-array {v0, v1, v3, v4}, [Landroid/graphics/Point;

    move-result-object v0

    sput-object v0, Lcom/opera/android/media/PlayerAndControlsAspectLayout;->b:[Landroid/graphics/Point;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const p1, 0x3ee66666    # 0.45f

    iput p1, p0, Lcom/opera/android/media/PlayerAndControlsAspectLayout;->a:F

    return-void
.end method


# virtual methods
.method public final onFinishInflate()V
    .registers 1

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 7

    const/4 p1, 0x0

    move p2, p1

    move p3, p2

    :goto_3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p4

    if-ge p2, p4, :cond_21

    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p4

    invoke-virtual {p4}, Landroid/view/View;->getMeasuredWidth()I

    move-result p5

    invoke-virtual {p4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    add-int/2addr v0, p3

    invoke-virtual {p4, p1, p3, p5, v0}, Landroid/view/View;->layout(IIII)V

    invoke-virtual {p4}, Landroid/view/View;->getMeasuredHeight()I

    move-result p4

    add-int/2addr p3, p4

    add-int/lit8 p2, p2, 0x1

    goto :goto_3

    :cond_21
    return-void
.end method

.method public final onMeasure(II)V
    .registers 15

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {p0, v3, p1, v1}, Landroid/view/ViewGroup;->measureChild(Landroid/view/View;II)V

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    invoke-static {v4, p2}, Ljava/lang/Math;->min(II)I

    move-result v4

    const/4 v5, 0x0

    const/4 v6, -0x1

    move v7, v6

    :goto_20
    sget-object v8, Lcom/opera/android/media/PlayerAndControlsAspectLayout;->b:[Landroid/graphics/Point;

    array-length v9, v8

    if-ge v1, v9, :cond_4d

    aget-object v8, v8, v1

    iget v9, v8, Landroid/graphics/Point;->y:I

    int-to-float v9, v9

    iget v8, v8, Landroid/graphics/Point;->x:I

    int-to-float v8, v8

    div-float/2addr v9, v8

    int-to-float v8, v0

    mul-float/2addr v8, v9

    int-to-float v9, p2

    div-float v10, v8, v9

    iget v11, p0, Lcom/opera/android/media/PlayerAndControlsAspectLayout;->a:F

    sub-float/2addr v11, v10

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v10

    int-to-float v11, v4

    add-float/2addr v8, v11

    cmpl-float v8, v8, v9

    if-lez v8, :cond_42

    const/4 v1, 0x0

    goto :goto_4f

    :cond_42
    if-eq v7, v6, :cond_48

    cmpg-float v8, v10, v5

    if-gez v8, :cond_4a

    :cond_48
    move v7, v1

    move v5, v10

    :cond_4a
    add-int/lit8 v1, v1, 0x1

    goto :goto_20

    :cond_4d
    aget-object v1, v8, v7

    :goto_4f
    if-eqz v1, :cond_58

    iget v4, v1, Landroid/graphics/Point;->y:I

    mul-int/2addr v4, v0

    iget v1, v1, Landroid/graphics/Point;->x:I

    div-int/2addr v4, v1

    goto :goto_5a

    :cond_58
    sub-int v4, p2, v4

    :goto_5a
    sub-int v1, p2, v4

    const/high16 v5, 0x40000000    # 2.0f

    invoke-static {v4, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    invoke-virtual {p0, v2, p1, v4}, Landroid/view/ViewGroup;->measureChild(Landroid/view/View;II)V

    invoke-static {v1, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    invoke-virtual {p0, v3, p1, v1}, Landroid/view/ViewGroup;->measureChild(Landroid/view/View;II)V

    invoke-virtual {p0, v0, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method
