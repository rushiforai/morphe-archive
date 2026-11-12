.class public Lcom/opera/android/custom_views/AutoResizeTextView;
.super Lcom/opera/android/custom_views/StylingTextView;
.source "SourceFile"


# instance fields
.field public final m:Lj1f;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/custom_views/StylingTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lj1f;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p1, Lj1f;->e:Landroid/os/Parcelable;

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p1, Lj1f;->f:Ljava/lang/Object;

    iput-object p0, p1, Lj1f;->d:Ljava/lang/Object;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lkhh;->e:[I

    invoke-virtual {v1, p2, v2, v0, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v1, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p1, Lj1f;->a:I

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    invoke-virtual {p0}, Landroid/widget/TextView;->getTextSize()F

    move-result p2

    float-to-int p2, p2

    iput p2, p1, Lj1f;->b:I

    new-instance p2, Landroid/text/TextPaint;

    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    iput-object p2, p1, Lj1f;->g:Ljava/lang/Object;

    iput-object p1, p0, Lcom/opera/android/custom_views/AutoResizeTextView;->m:Lj1f;

    return-void
.end method


# virtual methods
.method public final onSizeChanged(IIII)V
    .registers 5

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    if-ne p1, p3, :cond_8

    if-ne p2, p4, :cond_8

    return-void

    :cond_8
    invoke-virtual {p0}, Lcom/opera/android/custom_views/AutoResizeTextView;->t()V

    return-void
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    invoke-super {p0, p1, p2, p3, p4}, Lcom/opera/android/custom_views/StylingTextView;->onTextChanged(Ljava/lang/CharSequence;III)V

    invoke-virtual {p0}, Lcom/opera/android/custom_views/AutoResizeTextView;->t()V

    return-void
.end method

.method public final setAllCaps(Z)V
    .registers 2

    invoke-super {p0, p1}, Lyq1;->setAllCaps(Z)V

    invoke-virtual {p0}, Lcom/opera/android/custom_views/AutoResizeTextView;->t()V

    return-void
.end method

.method public final setLineSpacing(FF)V
    .registers 3

    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setLineSpacing(FF)V

    invoke-virtual {p0}, Lcom/opera/android/custom_views/AutoResizeTextView;->t()V

    return-void
.end method

.method public final setLines(I)V
    .registers 2

    invoke-super {p0, p1}, Landroid/widget/TextView;->setLines(I)V

    invoke-virtual {p0}, Lcom/opera/android/custom_views/AutoResizeTextView;->t()V

    return-void
.end method

.method public final setMaxLines(I)V
    .registers 2

    invoke-super {p0, p1}, Landroid/widget/TextView;->setMaxLines(I)V

    invoke-virtual {p0}, Lcom/opera/android/custom_views/AutoResizeTextView;->t()V

    return-void
.end method

.method public final setSingleLine()V
    .registers 2

    const/4 v0, 0x1

    .line 7
    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/AutoResizeTextView;->setSingleLine(Z)V

    return-void
.end method

.method public final setSingleLine(Z)V
    .registers 2

    invoke-super {p0, p1}, Landroid/widget/TextView;->setSingleLine(Z)V

    invoke-virtual {p0}, Lcom/opera/android/custom_views/AutoResizeTextView;->t()V

    return-void
.end method

.method public final setTextSize(F)V
    .registers 3

    const/4 v0, 0x2

    .line 31
    invoke-virtual {p0, v0, p1}, Lcom/opera/android/custom_views/AutoResizeTextView;->setTextSize(IF)V

    return-void
.end method

.method public final setTextSize(IF)V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/custom_views/AutoResizeTextView;->m:Lj1f;

    if-eqz v0, :cond_1b

    iget-object p0, v0, Lj1f;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/AutoResizeTextView;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    invoke-static {p1, p2, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    float-to-int p0, p0

    iput p0, v0, Lj1f;->b:I

    invoke-virtual {v0}, Lj1f;->a()V

    return-void

    :cond_1b
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    return-void
.end method

.method public final setTypeface(Landroid/graphics/Typeface;)V
    .registers 2

    invoke-super {p0, p1}, Lyq1;->setTypeface(Landroid/graphics/Typeface;)V

    invoke-virtual {p0}, Lcom/opera/android/custom_views/AutoResizeTextView;->t()V

    return-void
.end method

.method public final t()V
    .registers 1

    iget-object p0, p0, Lcom/opera/android/custom_views/AutoResizeTextView;->m:Lj1f;

    if-nez p0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Lj1f;->a()V

    return-void
.end method

.method public final u(F)V
    .registers 3

    const/4 v0, 0x0

    invoke-super {p0, v0, p1}, Landroid/widget/TextView;->setTextSize(IF)V

    return-void
.end method
