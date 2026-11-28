.class public Landroidx/appcompat/widget/ButtonBarLayout;
.super Landroid/widget/LinearLayout;
.source ""


# instance fields
.field public a:Z

.field public b:I

.field public c:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 11

    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, -0x1

    iput v0, p0, Landroidx/appcompat/widget/ButtonBarLayout;->b:I

    const/4 v0, 0x0

    iput v0, p0, Landroidx/appcompat/widget/ButtonBarLayout;->c:I

    sget-object v0, Ld/b/j;->ButtonBarLayout:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-lt v1, v2, :cond_0

    sget-object v3, Ld/b/j;->ButtonBarLayout:[I

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v4, p2

    move-object v5, v0

    invoke-virtual/range {v1 .. v7}, Landroid/widget/LinearLayout;->saveAttributeDataForStyleable(Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    :cond_0
    sget p1, Ld/b/j;->ButtonBarLayout_allowStacking:I

    const/4 p2, 0x1

    invoke-virtual {v0, p1, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    iput-boolean p1, p0, Landroidx/appcompat/widget/ButtonBarLayout;->a:Z

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    iget-boolean v0, p0, Landroidx/appcompat/widget/ButtonBarLayout;->a:Z

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroidx/appcompat/widget/ButtonBarLayout;->setStacked(Z)V

    :cond_1
    return-void
.end method

.method private setStacked(Z)V
    .registers 3

    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    if-eqz p1, :cond_0

    const v0, 0x800005

    goto :goto_0

    :cond_0
    const/16 v0, 0x50

    :goto_0
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    sget v0, Ld/b/f;->spacer:I

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2

    if-eqz p1, :cond_1

    const/16 p1, 0x8

    goto :goto_1

    :cond_1
    const/4 p1, 0x4

    :goto_1
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p1

    add-int/lit8 p1, p1, -0x2

    :goto_2
    if-ltz p1, :cond_3

    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->bringChildToFront(Landroid/view/View;)V

    add-int/lit8 p1, p1, -0x1

    goto :goto_2

    :cond_3
    return-void
.end method


# virtual methods
.method public onMeasure(II)V
    .registers 10

    move v5, p1

    move v6, p2

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    iget-boolean v1, p0, Landroidx/appcompat/widget/ButtonBarLayout;->a:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    iget v1, p0, Landroidx/appcompat/widget/ButtonBarLayout;->b:I

    if-le v0, v1, :cond_0

    invoke-virtual {p0}, Landroidx/appcompat/widget/ButtonBarLayout;->a()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-direct {p0, v2}, Landroidx/appcompat/widget/ButtonBarLayout;->setStacked(Z)V

    :cond_0
    iput v0, p0, Landroidx/appcompat/widget/ButtonBarLayout;->b:I

    :cond_1
    invoke-virtual {p0}, Landroidx/appcompat/widget/ButtonBarLayout;->a()Z

    move-result v1

    const/4 v3, 0x1

    if-nez v1, :cond_2

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    const/high16 v4, 0x40000000    # 2.0f

    if-ne v1, v4, :cond_2

    const/high16 v1, -0x80000000

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    move v0, p1

    const/4 v1, 0x0

    :goto_0
    invoke-super {p0, v0, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    iget-boolean v0, p0, Landroidx/appcompat/widget/ButtonBarLayout;->a:Z

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Landroidx/appcompat/widget/ButtonBarLayout;->a()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getMeasuredWidthAndState()I

    move-result v0

    const/high16 v4, -0x1000000

    and-int/2addr v0, v4

    const/high16 v4, 0x1000000

    if-ne v0, v4, :cond_3

    const/4 v0, 0x1

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_4

    invoke-direct {p0, v3}, Landroidx/appcompat/widget/ButtonBarLayout;->setStacked(Z)V

    const/4 v1, 0x1

    :cond_4
    if-eqz v1, :cond_5

    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    :cond_5
    invoke-virtual {p0, v2}, Landroidx/appcompat/widget/ButtonBarLayout;->a(I)I

    move-result p1

    if-ltz p1, :cond_8

    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    move-result v1

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    move-result p2

    add-int/2addr p2, v1

    iget v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    add-int/2addr p2, v1

    iget v0, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    add-int/2addr p2, v0

    add-int/2addr p2, v2

    invoke-virtual {p0}, Landroidx/appcompat/widget/ButtonBarLayout;->a()Z

    move-result v0

    if-eqz v0, :cond_7

    add-int/2addr p1, v3

    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/ButtonBarLayout;->a(I)I

    move-result p1

    if-ltz p1, :cond_6

    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result p1

    const/high16 v0, 0x41800000    # 16.0f

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float v1, v1, v0

    float-to-int v0, v1

    add-int/2addr p1, v0

    add-int/2addr p1, p2

    move v2, p1

    goto :goto_2

    :cond_6
    move v2, p2

    goto :goto_2

    :cond_7
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    move-result p1

    add-int v2, p1, p2

    :cond_8
    :goto_2
    invoke-static {p0}, Ld/h/l/p;->i(Landroid/view/View;)I

    move-result p1

    if-eq p1, v2, :cond_9

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    invoke-static {v6}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    if-nez v0, :cond_9

    invoke-super {p0, v5, v6}, Landroid/widget/LinearLayout;->onMeasure(II)V

    :cond_9
    return-void
.end method
