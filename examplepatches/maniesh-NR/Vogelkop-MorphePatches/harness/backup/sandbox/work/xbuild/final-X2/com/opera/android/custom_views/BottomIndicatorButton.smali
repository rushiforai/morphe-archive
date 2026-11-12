.class public Lcom/opera/android/custom_views/BottomIndicatorButton;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static final synthetic c:I


# instance fields
.field public final a:Lov0;

.field public b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const-string p2, ""

    iput-object p2, p0, Lcom/opera/android/custom_views/BottomIndicatorButton;->b:Ljava/lang/String;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0d009c

    invoke-virtual {p1, p2, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a0aad

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    if-eqz v1, :cond_4e

    const p2, 0x7f0a069d

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    if-eqz v2, :cond_4e

    new-instance p2, Lov0;

    check-cast p1, Landroid/widget/FrameLayout;

    const/4 v3, 0x5

    invoke-direct {p2, p1, v1, v2, v3}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p2, p0, Lcom/opera/android/custom_views/BottomIndicatorButton;->a:Lov0;

    new-instance p1, Ltp3;

    invoke-direct {p1, p0, v0}, Ltp3;-><init>(Lcom/opera/android/custom_views/BottomIndicatorButton;B)V

    invoke-static {v2, p1}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {p1, v2}, Ltp3;->a(Landroid/view/View;)V

    new-instance p1, Ltp3;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Ltp3;-><init>(Lcom/opera/android/custom_views/BottomIndicatorButton;B)V

    invoke-static {v1, p1}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {p1, v1}, Ltp3;->a(Landroid/view/View;)V

    return-void

    :cond_4e
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final a()Z
    .registers 1

    iget-object p0, p0, Lcom/opera/android/custom_views/BottomIndicatorButton;->a:Lov0;

    iget-object p0, p0, Lov0;->c:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p0

    if-nez p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public final b()V
    .registers 4

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_19

    const v1, 0x7f0409be

    const v2, 0x7f0601a3

    invoke-static {v1, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_2c

    :cond_19
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    move-result v1

    if-eqz v1, :cond_28

    invoke-static {v0}, Lf03;->C(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    goto :goto_2c

    :cond_28
    invoke-static {v0}, Lf03;->F(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    :goto_2c
    iget-object p0, p0, Lcom/opera/android/custom_views/BottomIndicatorButton;->a:Lov0;

    iget-object p0, p0, Lov0;->c:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    filled-new-array {v0}, [I

    move-result-object v0

    invoke-virtual {p0, v0}, Lo83;->f([I)V

    return-void
.end method

.method public final c()V
    .registers 5

    invoke-virtual {p0}, Lcom/opera/android/custom_views/BottomIndicatorButton;->a()Z

    move-result v0

    iget-object v1, p0, Lcom/opera/android/custom_views/BottomIndicatorButton;->a:Lov0;

    if-eqz v0, :cond_12

    iget-object p0, v1, Lov0;->d:Ljava/lang/Object;

    check-cast p0, Landroid/widget/TextView;

    const-string v0, ""

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_12
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v2

    if-nez v2, :cond_27

    const v2, 0x7f0409be

    const v3, 0x7f0601a3

    invoke-static {v2, v0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    goto :goto_3a

    :cond_27
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    move-result v2

    if-eqz v2, :cond_32

    invoke-static {v0}, Lf03;->C(Landroid/content/Context;)I

    move-result v0

    goto :goto_3a

    :cond_32
    invoke-static {v0}, Lf03;->F(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    :goto_3a
    iget-object v2, v1, Lov0;->d:Ljava/lang/Object;

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, v1, Lov0;->d:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    iget-object p0, p0, Lcom/opera/android/custom_views/BottomIndicatorButton;->b:Ljava/lang/String;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final performClick()Z
    .registers 3

    invoke-super {p0}, Landroid/view/View;->performClick()Z

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;

    invoke-virtual {v1, p0}, Lcom/opera/android/custom_views/BottomIndicatorButtonGroup;->a(Lcom/opera/android/custom_views/BottomIndicatorButton;)V

    return v0
.end method

.method public final setEnabled(Z)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {p0}, Lcom/opera/android/custom_views/BottomIndicatorButton;->c()V

    invoke-virtual {p0}, Lcom/opera/android/custom_views/BottomIndicatorButton;->b()V

    return-void
.end method

.method public final setSelected(Z)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->setSelected(Z)V

    invoke-virtual {p0}, Lcom/opera/android/custom_views/BottomIndicatorButton;->c()V

    invoke-virtual {p0}, Lcom/opera/android/custom_views/BottomIndicatorButton;->b()V

    return-void
.end method
