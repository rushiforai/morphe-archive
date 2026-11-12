.class public Lcom/opera/android/custom_views/Spinner;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public final a:Landroid/graphics/drawable/Drawable;

.field public b:J

.field public c:I

.field public d:Z

.field public e:I

.field public f:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/opera/android/custom_views/Spinner;->d:Z

    sget-object v1, Lkhh;->I:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p2

    const/4 v1, 0x4

    invoke-virtual {p2, v1, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    if-nez v0, :cond_16

    const/4 p1, 0x0

    goto :goto_1a

    :cond_16
    invoke-static {v0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    :goto_1a
    iput-object p1, p0, Lcom/opera/android/custom_views/Spinner;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    iget-boolean v0, p0, Lcom/opera/android/custom_views/Spinner;->d:Z

    if-eqz v0, :cond_8

    return-void

    :cond_8
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/custom_views/Spinner;->d:Z

    iget v0, p0, Lcom/opera/android/custom_views/Spinner;->c:I

    const/4 v1, 0x0

    iput v1, p0, Lcom/opera/android/custom_views/Spinner;->c:I

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x3

    div-long/2addr v1, v3

    iget v3, p0, Lcom/opera/android/custom_views/Spinner;->c:I

    int-to-long v3, v3

    add-long/2addr v1, v3

    const-wide/16 v3, 0x168

    rem-long/2addr v1, v3

    long-to-int v1, v1

    if-ge v0, v1, :cond_23

    add-int/lit16 v0, v0, 0x168

    :cond_23
    sub-int/2addr v0, v1

    iput v0, p0, Lcom/opera/android/custom_views/Spinner;->c:I

    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 7

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/opera/android/custom_views/Spinner;->a:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_4e

    iget-boolean v1, p0, Lcom/opera/android/custom_views/Spinner;->d:Z

    if-nez v1, :cond_e

    iget v1, p0, Lcom/opera/android/custom_views/Spinner;->c:I

    goto :goto_1d

    :cond_e
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    const-wide/16 v3, 0x3

    div-long/2addr v1, v3

    iget v3, p0, Lcom/opera/android/custom_views/Spinner;->c:I

    int-to-long v3, v3

    add-long/2addr v1, v3

    const-wide/16 v3, 0x168

    rem-long/2addr v1, v3

    long-to-int v1, v1

    :goto_1d
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget v2, p0, Lcom/opera/android/custom_views/Spinner;->e:I

    int-to-float v2, v2

    iget v3, p0, Lcom/opera/android/custom_views/Spinner;->f:I

    int-to-float v3, v3

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    neg-int v1, v1

    int-to-float v1, v1

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->rotate(F)V

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    iget-boolean p1, p0, Lcom/opera/android/custom_views/Spinner;->d:Z

    if-eqz p1, :cond_4e

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/opera/android/custom_views/Spinner;->b:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x32

    cmp-long p1, v0, v2

    if-ltz p1, :cond_4e

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/opera/android/custom_views/Spinner;->b:J

    invoke-virtual {p0, v2, v3}, Landroid/view/View;->postInvalidateDelayed(J)V

    :cond_4e
    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 6

    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    iget-object p1, p0, Lcom/opera/android/custom_views/Spinner;->a:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_40

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p3

    sub-int/2addr p1, p3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result p3

    sub-int/2addr p1, p3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result p3

    sub-int/2addr p2, p3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result p3

    sub-int/2addr p2, p3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result p3

    div-int/lit8 p4, p1, 0x2

    add-int/2addr p3, p4

    iput p3, p0, Lcom/opera/android/custom_views/Spinner;->e:I

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result p3

    div-int/lit8 p5, p2, 0x2

    add-int/2addr p3, p5

    iput p3, p0, Lcom/opera/android/custom_views/Spinner;->f:I

    neg-int p1, p1

    div-int/lit8 p1, p1, 0x2

    neg-int p2, p2

    div-int/lit8 p2, p2, 0x2

    iget-object p0, p0, Lcom/opera/android/custom_views/Spinner;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1, p2, p4, p5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_40
    return-void
.end method
