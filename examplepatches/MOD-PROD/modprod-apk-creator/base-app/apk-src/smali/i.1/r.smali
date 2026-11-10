.class public final Li/r;
.super Landroid/widget/Button;
.source "SourceFile"


# instance fields
.field public final a:Li/q;

.field public final b:Li/Z;

.field public c:Li/y;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    invoke-static {p1}, Li/T0;->a(Landroid/content/Context;)V

    const v0, 0x7f030043

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p0, p1}, Li/S0;->a(Landroid/view/View;Landroid/content/Context;)V

    new-instance p1, Li/q;

    invoke-direct {p1, p0}, Li/q;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Li/r;->a:Li/q;

    invoke-virtual {p1, p2, v0}, Li/q;->d(Landroid/util/AttributeSet;I)V

    new-instance p1, Li/Z;

    invoke-direct {p1, p0}, Li/Z;-><init>(Landroid/widget/TextView;)V

    iput-object p1, p0, Li/r;->b:Li/Z;

    invoke-virtual {p1, p2, v0}, Li/Z;->f(Landroid/util/AttributeSet;I)V

    invoke-virtual {p1}, Li/Z;->b()V

    invoke-direct {p0}, Li/r;->getEmojiTextViewHelper()Li/y;

    move-result-object p1

    invoke-virtual {p1, p2, v0}, Li/y;->a(Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private getEmojiTextViewHelper()Li/y;
    .locals 1

    iget-object v0, p0, Li/r;->c:Li/y;

    if-nez v0, :cond_0

    new-instance v0, Li/y;

    invoke-direct {v0, p0}, Li/y;-><init>(Landroid/widget/TextView;)V

    iput-object v0, p0, Li/r;->c:Li/y;

    :cond_0
    iget-object v0, p0, Li/r;->c:Li/y;

    return-object v0
.end method


# virtual methods
.method public final drawableStateChanged()V
    .locals 1

    invoke-super {p0}, Landroid/view/View;->drawableStateChanged()V

    iget-object v0, p0, Li/r;->a:Li/q;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Li/q;->a()V

    :cond_0
    iget-object v0, p0, Li/r;->b:Li/Z;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Li/Z;->b()V

    :cond_1
    return-void
.end method

.method public getAutoSizeMaxTextSize()I
    .locals 1

    sget-boolean v0, Li/m1;->c:Z

    if-eqz v0, :cond_0

    invoke-super {p0}, Landroid/widget/Button;->getAutoSizeMaxTextSize()I

    move-result v0

    return v0

    :cond_0
    iget-object v0, p0, Li/r;->b:Li/Z;

    if-eqz v0, :cond_1

    iget-object v0, v0, Li/Z;->i:Li/i0;

    iget v0, v0, Li/i0;->e:F

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0

    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method public getAutoSizeMinTextSize()I
    .locals 1

    sget-boolean v0, Li/m1;->c:Z

    if-eqz v0, :cond_0

    invoke-super {p0}, Landroid/widget/Button;->getAutoSizeMinTextSize()I

    move-result v0

    return v0

    :cond_0
    iget-object v0, p0, Li/r;->b:Li/Z;

    if-eqz v0, :cond_1

    iget-object v0, v0, Li/Z;->i:Li/i0;

    iget v0, v0, Li/i0;->d:F

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0

    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method public getAutoSizeStepGranularity()I
    .locals 1

    sget-boolean v0, Li/m1;->c:Z

    if-eqz v0, :cond_0

    invoke-super {p0}, Landroid/widget/Button;->getAutoSizeStepGranularity()I

    move-result v0

    return v0

    :cond_0
    iget-object v0, p0, Li/r;->b:Li/Z;

    if-eqz v0, :cond_1

    iget-object v0, v0, Li/Z;->i:Li/i0;

    iget v0, v0, Li/i0;->c:F

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0

    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method public getAutoSizeTextAvailableSizes()[I
    .locals 1

    sget-boolean v0, Li/m1;->c:Z

    if-eqz v0, :cond_0

    invoke-super {p0}, Landroid/widget/Button;->getAutoSizeTextAvailableSizes()[I

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Li/r;->b:Li/Z;

    if-eqz v0, :cond_1

    iget-object v0, v0, Li/Z;->i:Li/i0;

    iget-object v0, v0, Li/i0;->f:[I

    return-object v0

    :cond_1
    const/4 v0, 0x0

    new-array v0, v0, [I

    return-object v0
.end method

.method public getAutoSizeTextType()I
    .locals 3

    sget-boolean v0, Li/m1;->c:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-super {p0}, Landroid/widget/Button;->getAutoSizeTextType()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    return v2

    :cond_0
    return v1

    :cond_1
    iget-object v0, p0, Li/r;->b:Li/Z;

    if-eqz v0, :cond_2

    iget-object v0, v0, Li/Z;->i:Li/i0;

    iget v0, v0, Li/i0;->a:I

    return v0

    :cond_2
    return v1
.end method

.method public getCustomSelectionActionModeCallback()Landroid/view/ActionMode$Callback;
    .locals 1

    invoke-super {p0}, Landroid/widget/TextView;->getCustomSelectionActionModeCallback()Landroid/view/ActionMode$Callback;

    move-result-object v0

    invoke-static {v0}, LD/g;->T(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode$Callback;

    move-result-object v0

    return-object v0
.end method

.method public getSupportBackgroundTintList()Landroid/content/res/ColorStateList;
    .locals 1

    iget-object v0, p0, Li/r;->a:Li/q;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Li/q;->b()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSupportBackgroundTintMode()Landroid/graphics/PorterDuff$Mode;
    .locals 1

    iget-object v0, p0, Li/r;->a:Li/q;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Li/q;->c()Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSupportCompoundDrawablesTintList()Landroid/content/res/ColorStateList;
    .locals 1

    iget-object v0, p0, Li/r;->b:Li/Z;

    invoke-virtual {v0}, Li/Z;->d()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getSupportCompoundDrawablesTintMode()Landroid/graphics/PorterDuff$Mode;
    .locals 1

    iget-object v0, p0, Li/r;->b:Li/Z;

    invoke-virtual {v0}, Li/Z;->e()Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    return-object v0
.end method

.method public final onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    const-class v0, Landroid/widget/Button;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityRecord;->setClassName(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    const-class v0, Landroid/widget/Button;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final onLayout(ZIIII)V
    .locals 0

    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    move-object p1, p0

    iget-object p2, p1, Li/r;->b:Li/Z;

    if-eqz p2, :cond_0

    sget-boolean p3, Li/m1;->c:Z

    if-nez p3, :cond_0

    iget-object p2, p2, Li/Z;->i:Li/i0;

    invoke-virtual {p2}, Li/i0;->a()V

    :cond_0
    return-void
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->onTextChanged(Ljava/lang/CharSequence;III)V

    iget-object p1, p0, Li/r;->b:Li/Z;

    if-eqz p1, :cond_0

    sget-boolean p2, Li/m1;->c:Z

    if-nez p2, :cond_0

    iget-object p1, p1, Li/Z;->i:Li/i0;

    invoke-virtual {p1}, Li/i0;->f()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Li/i0;->a()V

    :cond_0
    return-void
.end method

.method public setAllCaps(Z)V
    .locals 1

    invoke-super {p0, p1}, Landroid/widget/TextView;->setAllCaps(Z)V

    invoke-direct {p0}, Li/r;->getEmojiTextViewHelper()Li/y;

    move-result-object v0

    invoke-virtual {v0, p1}, Li/y;->b(Z)V

    return-void
.end method

.method public final setAutoSizeTextTypeUniformWithConfiguration(IIII)V
    .locals 1

    sget-boolean v0, Li/m1;->c:Z

    if-eqz v0, :cond_0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/Button;->setAutoSizeTextTypeUniformWithConfiguration(IIII)V

    return-void

    :cond_0
    iget-object v0, p0, Li/r;->b:Li/Z;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1, p2, p3, p4}, Li/Z;->i(IIII)V

    :cond_1
    return-void
.end method

.method public final setAutoSizeTextTypeUniformWithPresetSizes([II)V
    .locals 1

    sget-boolean v0, Li/m1;->c:Z

    if-eqz v0, :cond_0

    invoke-super {p0, p1, p2}, Landroid/widget/Button;->setAutoSizeTextTypeUniformWithPresetSizes([II)V

    return-void

    :cond_0
    iget-object v0, p0, Li/r;->b:Li/Z;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1, p2}, Li/Z;->j([II)V

    :cond_1
    return-void
.end method

.method public setAutoSizeTextTypeWithDefaults(I)V
    .locals 1

    sget-boolean v0, Li/m1;->c:Z

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Landroid/widget/Button;->setAutoSizeTextTypeWithDefaults(I)V

    return-void

    :cond_0
    iget-object v0, p0, Li/r;->b:Li/Z;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Li/Z;->k(I)V

    :cond_1
    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Li/r;->a:Li/q;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Li/q;->e()V

    :cond_0
    return-void
.end method

.method public setBackgroundResource(I)V
    .locals 1

    invoke-super {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    iget-object v0, p0, Li/r;->a:Li/q;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Li/q;->f(I)V

    :cond_0
    return-void
.end method

.method public setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V
    .locals 0

    invoke-static {p1, p0}, LD/g;->U(Landroid/view/ActionMode$Callback;Landroid/widget/TextView;)Landroid/view/ActionMode$Callback;

    move-result-object p1

    invoke-super {p0, p1}, Landroid/widget/TextView;->setCustomSelectionActionModeCallback(Landroid/view/ActionMode$Callback;)V

    return-void
.end method

.method public setEmojiCompatEnabled(Z)V
    .locals 1

    invoke-direct {p0}, Li/r;->getEmojiTextViewHelper()Li/y;

    move-result-object v0

    invoke-virtual {v0, p1}, Li/y;->c(Z)V

    return-void
.end method

.method public setFilters([Landroid/text/InputFilter;)V
    .locals 1

    invoke-direct {p0}, Li/r;->getEmojiTextViewHelper()Li/y;

    move-result-object v0

    iget-object v0, v0, Li/y;->b:LC/j;

    iget-object v0, v0, LC/j;->b:Ljava/lang/Object;

    check-cast v0, LD/g;

    invoke-virtual {v0, p1}, LD/g;->u([Landroid/text/InputFilter;)[Landroid/text/InputFilter;

    move-result-object p1

    invoke-super {p0, p1}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    return-void
.end method

.method public setSupportAllCaps(Z)V
    .locals 1

    iget-object v0, p0, Li/r;->b:Li/Z;

    if-eqz v0, :cond_0

    iget-object v0, v0, Li/Z;->a:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setAllCaps(Z)V

    :cond_0
    return-void
.end method

.method public setSupportBackgroundTintList(Landroid/content/res/ColorStateList;)V
    .locals 1

    iget-object v0, p0, Li/r;->a:Li/q;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Li/q;->h(Landroid/content/res/ColorStateList;)V

    :cond_0
    return-void
.end method

.method public setSupportBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .locals 1

    iget-object v0, p0, Li/r;->a:Li/q;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Li/q;->i(Landroid/graphics/PorterDuff$Mode;)V

    :cond_0
    return-void
.end method

.method public setSupportCompoundDrawablesTintList(Landroid/content/res/ColorStateList;)V
    .locals 1

    iget-object v0, p0, Li/r;->b:Li/Z;

    invoke-virtual {v0, p1}, Li/Z;->l(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v0}, Li/Z;->b()V

    return-void
.end method

.method public setSupportCompoundDrawablesTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .locals 1

    iget-object v0, p0, Li/r;->b:Li/Z;

    invoke-virtual {v0, p1}, Li/Z;->m(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0}, Li/Z;->b()V

    return-void
.end method

.method public final setTextAppearance(Landroid/content/Context;I)V
    .locals 1

    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    iget-object v0, p0, Li/r;->b:Li/Z;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Li/Z;->g(Landroid/content/Context;I)V

    :cond_0
    return-void
.end method

.method public final setTextSize(IF)V
    .locals 2

    sget-boolean v0, Li/m1;->c:Z

    if-eqz v0, :cond_0

    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    return-void

    :cond_0
    iget-object v1, p0, Li/r;->b:Li/Z;

    if-eqz v1, :cond_1

    if-nez v0, :cond_1

    iget-object v0, v1, Li/Z;->i:Li/i0;

    invoke-virtual {v0}, Li/i0;->f()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0, p1, p2}, Li/i0;->g(IF)V

    :cond_1
    return-void
.end method
