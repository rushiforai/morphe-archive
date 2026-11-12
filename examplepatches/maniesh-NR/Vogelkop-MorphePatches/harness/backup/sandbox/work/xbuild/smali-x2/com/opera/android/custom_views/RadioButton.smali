.class public Lcom/opera/android/custom_views/RadioButton;
.super Lcom/opera/android/custom_views/StylingTextView;
.source "SourceFile"

# interfaces
.implements Landroid/widget/Checkable;


# static fields
.field public static final o:[I


# instance fields
.field public m:Lyhe;

.field public n:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const v0, 0x10100a0

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lcom/opera/android/custom_views/RadioButton;->o:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6

    const v0, 0x101007e

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/custom_views/StylingTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iget-object v1, p0, Lcom/opera/android/custom_views/StylingTextView;->i:Lzg;

    iget-object v1, v1, Lzg;->c:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_11

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    :cond_11
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {p0, v1}, Landroid/view/View;->setFocusable(Z)V

    sget-object v1, Lkhh;->C:[I

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v1, v0, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v2, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    invoke-virtual {p0, p2}, Lcom/opera/android/custom_views/RadioButton;->setChecked(Z)V

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public final isChecked()Z
    .registers 1

    iget-boolean p0, p0, Lcom/opera/android/custom_views/RadioButton;->n:Z

    return p0
.end method

.method public final onCreateDrawableState(I)[I
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/custom_views/RadioButton;->n:Z

    if-eqz v0, :cond_11

    add-int/lit8 p1, p1, 0x1

    invoke-super {p0, p1}, Landroid/view/View;->onCreateDrawableState(I)[I

    move-result-object p0

    sget-object p1, Lcom/opera/android/custom_views/RadioButton;->o:[I

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

    iget-boolean p0, p0, Lcom/opera/android/custom_views/RadioButton;->n:Z

    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityRecord;->setChecked(Z)V

    return-void
.end method

.method public final onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    iget-boolean p0, p0, Lcom/opera/android/custom_views/RadioButton;->n:Z

    invoke-static {p1, p0}, Lf03;->g0(Landroid/view/accessibility/AccessibilityNodeInfo;Z)V

    return-void
.end method

.method public final performClick()Z
    .registers 3

    invoke-virtual {p0}, Lcom/opera/android/custom_views/RadioButton;->toggle()V

    invoke-super {p0}, Landroid/view/View;->performClick()Z

    move-result v0

    if-nez v0, :cond_d

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/view/View;->playSoundEffect(I)V

    :cond_d
    return v0
.end method

.method public final setChecked(Z)V
    .registers 7

    iget-boolean v0, p0, Lcom/opera/android/custom_views/RadioButton;->n:Z

    if-eq v0, p1, :cond_42

    iput-boolean p1, p0, Lcom/opera/android/custom_views/RadioButton;->n:Z

    invoke-virtual {p0}, Landroid/view/View;->refreshDrawableState()V

    iget-object v0, p0, Lcom/opera/android/custom_views/RadioButton;->m:Lyhe;

    if-eqz v0, :cond_2a

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v1

    iget-object v0, v0, Lyhe;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/OperaRadioGroup;

    iget-boolean v2, v0, Lcom/opera/android/custom_views/OperaRadioGroup;->b:Z

    if-nez v2, :cond_2a

    const/4 v2, 0x1

    iput-boolean v2, v0, Lcom/opera/android/custom_views/OperaRadioGroup;->b:Z

    iget v2, v0, Lcom/opera/android/custom_views/OperaRadioGroup;->a:I

    const/4 v3, -0x1

    const/4 v4, 0x0

    if-eq v2, v3, :cond_25

    invoke-virtual {v0, v2, v4}, Lcom/opera/android/custom_views/OperaRadioGroup;->c(IZ)V

    :cond_25
    iput-boolean v4, v0, Lcom/opera/android/custom_views/OperaRadioGroup;->b:Z

    invoke-virtual {v0, v1}, Lcom/opera/android/custom_views/OperaRadioGroup;->b(I)V

    :cond_2a
    if-eqz p1, :cond_42

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-eqz p1, :cond_42

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    new-instance v0, Lpih;

    invoke-direct {v0, p0, p0}, Lpih;-><init>(Lcom/opera/android/custom_views/RadioButton;Lcom/opera/android/custom_views/RadioButton;)V

    const-class p0, Lcom/opera/android/custom_views/RadioButton;

    invoke-static {p1, p0, v0}, Lq9n;->J(Landroid/view/View;Ljava/lang/Class;Lp9n;)V

    :cond_42
    return-void
.end method

.method public final toggle()V
    .registers 2

    iget-boolean v0, p0, Lcom/opera/android/custom_views/RadioButton;->n:Z

    if-nez v0, :cond_8

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/RadioButton;->setChecked(Z)V

    :cond_8
    return-void
.end method
