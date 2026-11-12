.class public abstract Lnjk;
.super Lcom/opera/android/custom_views/StylingImageButton;
.source "SourceFile"

# interfaces
.implements Landroid/widget/Checkable;


# static fields
.field public static final m:[I


# instance fields
.field public k:Z

.field public l:Lnen;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const v0, 0x10100a0

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lnjk;->m:[I

    return-void
.end method


# virtual methods
.method public final isChecked()Z
    .registers 1

    iget-boolean p0, p0, Lnjk;->k:Z

    return p0
.end method

.method public final onCreateDrawableState(I)[I
    .registers 3

    iget-boolean v0, p0, Lnjk;->k:Z

    if-eqz v0, :cond_11

    add-int/lit8 p1, p1, 0x1

    invoke-super {p0, p1}, Landroid/view/View;->onCreateDrawableState(I)[I

    move-result-object p0

    sget-object p1, Lnjk;->m:[I

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

    if-eqz p1, :cond_a

    iget-boolean p0, p0, Lnjk;->k:Z

    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityRecord;->setChecked(Z)V

    :cond_a
    return-void
.end method

.method public final onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    if-eqz p1, :cond_a

    iget-boolean p0, p0, Lnjk;->k:Z

    invoke-static {p1, p0}, Lf03;->g0(Landroid/view/accessibility/AccessibilityNodeInfo;Z)V

    :cond_a
    return-void
.end method

.method public final performClick()Z
    .registers 3

    invoke-super {p0}, Landroid/view/View;->performClick()Z

    move-result v0

    invoke-virtual {p0}, Lnjk;->toggle()V

    if-nez v0, :cond_d

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/view/View;->playSoundEffect(I)V

    :cond_d
    return v0
.end method

.method public final setChecked(Z)V
    .registers 5

    iget-boolean v0, p0, Lnjk;->k:Z

    if-eq p1, v0, :cond_2f

    iput-boolean p1, p0, Lnjk;->k:Z

    invoke-virtual {p0}, Landroid/view/View;->refreshDrawableState()V

    iget-object p1, p0, Lnjk;->l:Lnen;

    if-eqz p1, :cond_2f

    iget-boolean v0, p0, Lnjk;->k:Z

    if-eqz v0, :cond_2f

    iget-object p1, p1, Lnen;->a:Lwtm;

    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p1, Lwtm;->c:Ljava/lang/Object;

    check-cast p1, Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Loen;

    const/4 v1, 0x0

    const/4 v2, 0x6

    invoke-static {v0, p0, v1, v2}, Loen;->a(Loen;Ljava/lang/Integer;Ljava/lang/CharSequence;I)Loen;

    move-result-object p0

    invoke-virtual {p1, p0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_2f
    return-void
.end method

.method public toggle()V
    .registers 2

    iget-boolean v0, p0, Lnjk;->k:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lnjk;->setChecked(Z)V

    return-void
.end method
