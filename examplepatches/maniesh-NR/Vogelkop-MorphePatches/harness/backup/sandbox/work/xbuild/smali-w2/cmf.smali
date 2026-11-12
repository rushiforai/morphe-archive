.class public abstract Lcmf;
.super Li41;
.source "SourceFile"

# interfaces
.implements Landroid/widget/Checkable;


# virtual methods
.method public final D()Landroid/view/View;
    .registers 1

    invoke-virtual {p0}, Lcmf;->t0()Landroid/widget/CompoundButton;

    move-result-object p0

    return-object p0
.end method

.method public final W()V
    .registers 1

    invoke-virtual {p0}, Lcmf;->toggle()V

    return-void
.end method

.method public final g0()V
    .registers 2

    invoke-virtual {p0}, Lcmf;->t0()Landroid/widget/CompoundButton;

    move-result-object p0

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Landroid/view/View;->setImportantForAccessibility(I)V

    return-void
.end method

.method public final isChecked()Z
    .registers 1

    invoke-virtual {p0}, Lcmf;->t0()Landroid/widget/CompoundButton;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result p0

    return p0
.end method

.method public final setChecked(Z)V
    .registers 2

    invoke-virtual {p0}, Lcmf;->t0()Landroid/widget/CompoundButton;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    return-void
.end method

.method public abstract t0()Landroid/widget/CompoundButton;
.end method

.method public final toggle()V
    .registers 1

    invoke-virtual {p0}, Lcmf;->t0()Landroid/widget/CompoundButton;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/CompoundButton;->toggle()V

    return-void
.end method
