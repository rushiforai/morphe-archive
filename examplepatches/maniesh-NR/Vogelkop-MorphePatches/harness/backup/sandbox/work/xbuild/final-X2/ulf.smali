.class public abstract Lulf;
.super Luup;
.source "SourceFile"

# interfaces
.implements Landroid/widget/Checkable;


# virtual methods
.method public final G(Lpxh;)V
    .registers 3

    sget v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C:I

    invoke-virtual {p0}, Lulf;->O()Landroid/widget/CompoundButton;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1, v0}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setTooltipText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final H(Z)V
    .registers 2

    invoke-virtual {p0}, Lulf;->O()Landroid/widget/CompoundButton;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public final I(Z)V
    .registers 2

    invoke-virtual {p0}, Lulf;->O()Landroid/widget/CompoundButton;

    move-result-object p0

    if-eqz p1, :cond_8

    const/4 p1, 0x1

    goto :goto_9

    :cond_8
    const/4 p1, 0x2

    :goto_9
    invoke-virtual {p0, p1}, Landroid/view/View;->setImportantForAccessibility(I)V

    return-void
.end method

.method public final J()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public abstract O()Landroid/widget/CompoundButton;
.end method

.method public final isChecked()Z
    .registers 1

    invoke-virtual {p0}, Lulf;->O()Landroid/widget/CompoundButton;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result p0

    return p0
.end method

.method public final setChecked(Z)V
    .registers 2

    invoke-virtual {p0}, Lulf;->O()Landroid/widget/CompoundButton;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    return-void
.end method

.method public final toggle()V
    .registers 1

    invoke-virtual {p0}, Lulf;->O()Landroid/widget/CompoundButton;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/CompoundButton;->toggle()V

    return-void
.end method

.method public final x()V
    .registers 1

    invoke-virtual {p0}, Lulf;->toggle()V

    return-void
.end method
