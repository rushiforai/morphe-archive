.class public Lcom/opera/android/custom_views/ThemeSelector;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/widget/Checkable;


# static fields
.field public static final synthetic f:I


# instance fields
.field public a:Lxj;

.field public b:Z

.field public final c:Landroid/widget/TextView;

.field public final d:Landroid/view/View;

.field public final e:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x1

    invoke-virtual {p0, p2}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {p0, p2}, Landroid/view/View;->setFocusable(Z)V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d0411

    invoke-virtual {v0, v1, p0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    const p2, 0x7f0a069d

    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/opera/android/custom_views/ThemeSelector;->c:Landroid/widget/TextView;

    const p2, 0x7f0a0972

    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/opera/android/custom_views/ThemeSelector;->d:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    const p2, 0x7f0a0973

    invoke-virtual {p0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/opera/android/custom_views/ThemeSelector;->e:Landroid/view/View;

    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    new-instance p2, Lhxh;

    const v0, 0x7f04035c

    invoke-direct {p2, v0}, Lhxh;-><init>(I)V

    invoke-virtual {p2, p1}, Ly7h;->k(Landroid/content/Context;)I

    move-result p2

    invoke-static {p2, p1}, Lsfe;->M(ILandroid/content/Context;)Luf9;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    new-instance p1, Lsvk;

    const/4 p2, 0x6

    invoke-direct {p1, p0, p2}, Lsvk;-><init>(Ljava/lang/Object;B)V

    sget-object p2, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object p2

    if-nez p2, :cond_60

    return-void

    :cond_60
    invoke-static {p2, p0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final isChecked()Z
    .registers 1

    iget-boolean p0, p0, Lcom/opera/android/custom_views/ThemeSelector;->b:Z

    return p0
.end method

.method public final onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    iget-boolean p0, p0, Lcom/opera/android/custom_views/ThemeSelector;->b:Z

    invoke-virtual {p1, p0}, Landroid/view/accessibility/AccessibilityRecord;->setChecked(Z)V

    return-void
.end method

.method public final onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    iget-boolean p0, p0, Lcom/opera/android/custom_views/ThemeSelector;->b:Z

    invoke-static {p1, p0}, Lf03;->g0(Landroid/view/accessibility/AccessibilityNodeInfo;Z)V

    return-void
.end method

.method public final performClick()Z
    .registers 3

    invoke-virtual {p0}, Lcom/opera/android/custom_views/ThemeSelector;->toggle()V

    invoke-super {p0}, Landroid/view/View;->performClick()Z

    move-result v0

    if-nez v0, :cond_d

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/view/View;->playSoundEffect(I)V

    :cond_d
    return v0
.end method

.method public final setChecked(Z)V
    .registers 4

    iget-boolean v0, p0, Lcom/opera/android/custom_views/ThemeSelector;->b:Z

    if-eq v0, p1, :cond_50

    iput-boolean p1, p0, Lcom/opera/android/custom_views/ThemeSelector;->b:Z

    if-eqz p1, :cond_a

    const/4 p1, 0x0

    goto :goto_c

    :cond_a
    const/16 p1, 0x8

    :goto_c
    iget-object v0, p0, Lcom/opera/android/custom_views/ThemeSelector;->d:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/opera/android/custom_views/ThemeSelector;->e:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lcom/opera/android/custom_views/ThemeSelector;->a:Lxj;

    if-eqz p0, :cond_50

    iget-object p1, p0, Lxj;->b:Ljava/lang/Object;

    check-cast p1, Lbv1;

    iget-object p0, p0, Lxj;->c:Ljava/lang/Object;

    check-cast p0, Lf7j;

    iget-object v0, p1, Lbv1;->e:Ljava/lang/Object;

    check-cast v0, Lf7j;

    if-eq v0, p0, :cond_38

    iget-object v1, p1, Lbv1;->d:Ljava/util/List;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    iput-object p0, p1, Lbv1;->e:Ljava/lang/Object;

    const/4 v1, -0x1

    if-le v0, v1, :cond_38

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    :cond_38
    iget-object p1, p1, Lbv1;->c:Ljava/lang/Object;

    check-cast p1, Lmu1;

    iget-object p1, p1, Lmu1;->b:Lpu1;

    invoke-virtual {p1}, Lpu1;->I0()Ldv1;

    move-result-object p1

    iget-object p1, p1, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "app_theme"

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    invoke-virtual {p1, p0, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_50
    return-void
.end method

.method public final toggle()V
    .registers 2

    iget-boolean v0, p0, Lcom/opera/android/custom_views/ThemeSelector;->b:Z

    if-nez v0, :cond_8

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/ThemeSelector;->setChecked(Z)V

    :cond_8
    return-void
.end method
