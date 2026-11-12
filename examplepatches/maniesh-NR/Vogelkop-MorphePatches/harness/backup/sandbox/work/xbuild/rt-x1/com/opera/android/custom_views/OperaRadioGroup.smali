.class public Lcom/opera/android/custom_views/OperaRadioGroup;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Z

.field public c:Lyvi;

.field public final d:Lwx4;

.field public final e:Lyhe;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, -0x1

    iput v0, p0, Lcom/opera/android/custom_views/OperaRadioGroup;->a:I

    new-instance v1, Lyhe;

    const/4 v2, 0x6

    invoke-direct {v1, p0, v2}, Lyhe;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lcom/opera/android/custom_views/OperaRadioGroup;->e:Lyhe;

    new-instance v1, Lwx4;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lwx4;-><init>(Landroid/view/ViewGroup;B)V

    iput-object v1, p0, Lcom/opera/android/custom_views/OperaRadioGroup;->d:Lwx4;

    invoke-super {p0, v1}, Landroid/view/ViewGroup;->setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V

    invoke-virtual {p0, v2}, Landroid/view/View;->setImportantForAccessibility(I)V

    sget-object v1, Lkhh;->v:[I

    const/4 v3, 0x0

    invoke-virtual {p1, p2, v1, v3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v3, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    if-eq p2, v0, :cond_2b

    iput p2, p0, Lcom/opera/android/custom_views/OperaRadioGroup;->a:I

    :cond_2b
    invoke-virtual {p1, v2, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 5

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_40

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Lcom/opera/android/custom_views/RadioButton;

    if-eqz v3, :cond_23

    check-cast v2, Lcom/opera/android/custom_views/RadioButton;

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_3d

    invoke-virtual {v2}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3d

    goto :goto_3b

    :cond_23
    instance-of v3, v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v3, :cond_3d

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_3d

    iget-object v2, v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->A:Lbpd;

    invoke-virtual {v2}, Lbpd;->D()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3d

    :goto_3b
    add-int/lit8 v1, v1, 0x1

    :cond_3d
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_40
    return v1
.end method

.method public final addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .registers 7

    instance-of v0, p1, Lcom/opera/android/custom_views/RadioButton;

    if-nez v0, :cond_8

    instance-of v0, p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v0, :cond_26

    :cond_8
    move-object v0, p1

    check-cast v0, Landroid/widget/Checkable;

    invoke-interface {v0}, Landroid/widget/Checkable;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_26

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/custom_views/OperaRadioGroup;->b:Z

    iget v0, p0, Lcom/opera/android/custom_views/OperaRadioGroup;->a:I

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_1d

    invoke-virtual {p0, v0, v2}, Lcom/opera/android/custom_views/OperaRadioGroup;->c(IZ)V

    :cond_1d
    iput-boolean v2, p0, Lcom/opera/android/custom_views/OperaRadioGroup;->b:Z

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/OperaRadioGroup;->b(I)V

    :cond_26
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public final b(I)V
    .registers 5

    iput p1, p0, Lcom/opera/android/custom_views/OperaRadioGroup;->a:I

    iget-object p0, p0, Lcom/opera/android/custom_views/OperaRadioGroup;->c:Lyvi;

    if-eqz p0, :cond_47

    iget-object p0, p0, Lyvi;->a:Lawi;

    iget-object v0, p0, Lawi;->r:Lvzk;

    sget-object v1, Lawi;->y:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ll7j;

    iget-object v0, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v0, Lwc7;

    iget-object v0, v0, Lwc7;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v2, "dns_over_https_mode"

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    invoke-virtual {v0, v1, v2}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    iget-object v0, p0, Lawi;->u:Lei;

    iget-object v0, v0, Lei;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lawi;->u:Lei;

    if-ne p1, v0, :cond_3b

    iget-object p1, v1, Lei;->e:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_44

    :cond_3b
    iget-object p1, v1, Lei;->e:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :goto_44
    invoke-virtual {p0}, Lawi;->J0()V

    :cond_47
    return-void
.end method

.method public final c(IZ)V
    .registers 3

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    instance-of p1, p0, Landroid/widget/Checkable;

    if-eqz p1, :cond_d

    check-cast p0, Landroid/widget/Checkable;

    invoke-interface {p0, p2}, Landroid/widget/Checkable;->setChecked(Z)V

    :cond_d
    return-void
.end method

.method public final getAccessibilityClassName()Ljava/lang/CharSequence;
    .registers 1

    const-class p0, Landroid/widget/RadioGroup;

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final onFinishInflate()V
    .registers 3

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    iget v0, p0, Lcom/opera/android/custom_views/OperaRadioGroup;->a:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_16

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/opera/android/custom_views/OperaRadioGroup;->b:Z

    invoke-virtual {p0, v0, v1}, Lcom/opera/android/custom_views/OperaRadioGroup;->c(IZ)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/custom_views/OperaRadioGroup;->b:Z

    iget v0, p0, Lcom/opera/android/custom_views/OperaRadioGroup;->a:I

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/OperaRadioGroup;->b(I)V

    :cond_16
    return-void
.end method

.method public final onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 5

    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_17

    invoke-virtual {p0}, Lcom/opera/android/custom_views/OperaRadioGroup;->a()I

    move-result p0

    invoke-static {v2, p0, v1, v2}, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;->obtain(IIZI)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCollectionInfo(Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;)V

    return-void

    :cond_17
    invoke-virtual {p0}, Lcom/opera/android/custom_views/OperaRadioGroup;->a()I

    move-result p0

    invoke-static {p0, v2, v1, v2}, Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;->obtain(IIZI)Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setCollectionInfo(Landroid/view/accessibility/AccessibilityNodeInfo$CollectionInfo;)V

    return-void
.end method

.method public final setOnHierarchyChangeListener(Landroid/view/ViewGroup$OnHierarchyChangeListener;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/custom_views/OperaRadioGroup;->d:Lwx4;

    iput-object p1, p0, Lwx4;->b:Landroid/view/ViewGroup$OnHierarchyChangeListener;

    return-void
.end method
