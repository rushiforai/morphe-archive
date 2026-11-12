.class public final Lju8;
.super Lou8;
.source "SourceFile"


# virtual methods
.method public final V(Lja2;Z)V
    .registers 3

    invoke-super {p0, p1, p2}, Lou8;->V(Lja2;Z)V

    iget-object p0, p0, Lou8;->i:Lov0;

    if-eqz p0, :cond_19

    iget-object p0, p0, Lov0;->b:Landroid/view/View;

    check-cast p0, Landroid/widget/LinearLayout;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setFocusable(Z)V

    :cond_19
    return-void
.end method

.method public final c0()Lcmg;
    .registers 1

    sget-object p0, Lcmg;->d:Lcmg;

    return-object p0
.end method
