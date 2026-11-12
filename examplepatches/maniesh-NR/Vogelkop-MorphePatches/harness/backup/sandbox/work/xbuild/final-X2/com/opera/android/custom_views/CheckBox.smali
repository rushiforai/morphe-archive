.class public Lcom/opera/android/custom_views/CheckBox;
.super Lcom/opera/android/custom_views/StylingTextView;
.source "SourceFile"

# interfaces
.implements Landroid/widget/Checkable;


# static fields
.field public static final q:[I


# instance fields
.field public m:Lav4;

.field public n:Z

.field public final o:I

.field public final p:Lzu4;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const v0, 0x10100a0

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lcom/opera/android/custom_views/CheckBox;->q:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 8

    const v0, 0x7f0401a6

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/custom_views/StylingTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v1, 0x1

    iput v1, p0, Lcom/opera/android/custom_views/CheckBox;->o:I

    invoke-virtual {p0, v1}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setFocusable(Z)V

    sget-object v2, Lkhh;->g:[I

    const/4 v3, 0x0

    invoke-virtual {p1, p2, v2, v0, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    iget p2, p0, Lcom/opera/android/custom_views/CheckBox;->o:I

    invoke-virtual {p1, v1, p2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p2

    iput p2, p0, Lcom/opera/android/custom_views/CheckBox;->o:I

    const/4 p2, 0x2

    invoke-virtual {p1, p2, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/CheckBox;->setChecked(Z)V

    invoke-virtual {p1, v3, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    iget v2, p0, Lcom/opera/android/custom_views/CheckBox;->o:I

    const/4 v3, 0x0

    const/4 v4, 0x3

    if-eq v2, v4, :cond_38

    if-nez v0, :cond_38

    const-string p0, "Specify a box drawable"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    throw v3

    :cond_38
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    iget p1, p0, Lcom/opera/android/custom_views/CheckBox;->o:I

    if-eq p1, v4, :cond_64

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {v0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_64

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    new-instance v0, Lzu4;

    invoke-direct {v0, p0, p1}, Lzu4;-><init>(Lcom/opera/android/custom_views/CheckBox;Landroid/graphics/drawable/Drawable;)V

    iput-object v0, p0, Lcom/opera/android/custom_views/CheckBox;->p:Lzu4;

    iget p1, p0, Lcom/opera/android/custom_views/CheckBox;->o:I

    if-eq p1, v1, :cond_5d

    const/4 v1, 0x4

    if-eq p1, v1, :cond_5d

    move-object v1, v3

    goto :goto_5e

    :cond_5d
    move-object v1, v0

    :goto_5e
    if-ne p1, p2, :cond_61

    move-object v3, v0

    :cond_61
    invoke-virtual {p0, v1, v3}, Lcom/opera/android/custom_views/StylingTextView;->s(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :cond_64
    return-void
.end method


# virtual methods
.method public final drawableStateChanged()V
    .registers 1

    invoke-super {p0}, Lcom/opera/android/custom_views/StylingTextView;->drawableStateChanged()V

    iget-object p0, p0, Lcom/opera/android/custom_views/CheckBox;->p:Lzu4;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_a
    return-void
.end method

.method public final isChecked()Z
    .registers 1

    iget-boolean p0, p0, Lcom/opera/android/custom_views/CheckBox;->n:Z

    return p0
.end method

.method public final onCreateDrawableState(I)[I
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/custom_views/CheckBox;->n:Z

    if-eqz v0, :cond_11

    add-int/lit8 p1, p1, 0x1

    invoke-super {p0, p1}, Landroid/view/View;->onCreateDrawableState(I)[I

    move-result-object p0

    sget-object p1, Lcom/opera/android/custom_views/CheckBox;->q:[I

    invoke-static {p0, p1}, Landroid/view/View;->mergeDrawableStates([I[I)[I

    move-result-object p0

    return-object p0

    :cond_11
    invoke-super {p0, p1}, Landroid/view/View;->onCreateDrawableState(I)[I

    move-result-object p0

    return-object p0
.end method

.method public final onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    iget-boolean p0, p0, Lcom/opera/android/custom_views/CheckBox;->n:Z

    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityRecord;->setChecked(Z)V

    return-void
.end method

.method public final onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    iget-boolean p0, p0, Lcom/opera/android/custom_views/CheckBox;->n:Z

    invoke-static {p1, p0}, Lf03;->g0(Landroid/view/accessibility/AccessibilityNodeInfo;Z)V

    return-void
.end method

.method public final performClick()Z
    .registers 3

    invoke-virtual {p0}, Lcom/opera/android/custom_views/CheckBox;->toggle()V

    invoke-super {p0}, Landroid/view/View;->performClick()Z

    move-result v0

    if-nez v0, :cond_d

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/view/View;->playSoundEffect(I)V

    :cond_d
    return v0
.end method

.method public final setChecked(Z)V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/custom_views/CheckBox;->n:Z

    if-eq v0, p1, :cond_10

    iput-boolean p1, p0, Lcom/opera/android/custom_views/CheckBox;->n:Z

    invoke-virtual {p0}, Landroid/view/View;->refreshDrawableState()V

    iget-object p1, p0, Lcom/opera/android/custom_views/CheckBox;->m:Lav4;

    if-eqz p1, :cond_10

    invoke-interface {p1, p0}, Lav4;->E(Lcom/opera/android/custom_views/CheckBox;)V

    :cond_10
    return-void
.end method

.method public final toggle()V
    .registers 2

    iget-boolean v0, p0, Lcom/opera/android/custom_views/CheckBox;->n:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/CheckBox;->setChecked(Z)V

    return-void
.end method
