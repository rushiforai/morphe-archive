.class public final Lec6;
.super Lb23;
.source "SourceFile"


# instance fields
.field public final b:Ljm3;

.field public final c:Lv5g;


# direct methods
.method public constructor <init>(Ljm3;Lv5g;)V
    .registers 4

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lb23;-><init>(B)V

    iput-object p1, p0, Lec6;->b:Ljm3;

    iput-object p2, p0, Lec6;->c:Lv5g;

    return-void
.end method


# virtual methods
.method public final f(Landroid/content/Context;)Landroid/view/View;
    .registers 10

    iget-object v0, p0, Lec6;->b:Ljm3;

    iget-boolean v1, v0, Ljm3;->a:Z

    iget-object p0, p0, Lec6;->c:Lv5g;

    if-eqz v1, :cond_e

    iget-boolean v1, p0, Lv5g;->a:Z

    if-eqz v1, :cond_12

    goto/16 :goto_b0

    :cond_e
    iget-boolean v1, p0, Lv5g;->a:Z

    if-eqz v1, :cond_b0

    :cond_12
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-static {v1}, Lov0;->h(Landroid/view/LayoutInflater;)Lov0;

    move-result-object v1

    iget-object v2, v1, Lov0;->b:Landroid/view/View;

    check-cast v2, Landroid/widget/LinearLayout;

    iget-object v3, v1, Lov0;->d:Ljava/lang/Object;

    check-cast v3, Landroid/widget/LinearLayout;

    iget-object v1, v1, Lov0;->c:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    iget-boolean v4, v0, Ljm3;->a:Z

    const/4 v5, 0x0

    if-eqz v4, :cond_74

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget-wide v6, v0, Ljm3;->b:J

    long-to-int v0, v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    const v7, 0x7f120023

    invoke-virtual {v4, v7, v0, v6}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    invoke-static {v4, v3}, Lcc6;->b(Landroid/view/LayoutInflater;Landroid/widget/LinearLayout;)Lcc6;

    move-result-object v3

    iget-object v3, v3, Lcc6;->c:Landroid/widget/TextView;

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lv5g;->c:Ly2b;

    sget-object v0, Ly2b;->c:Ly2b;

    if-ne p0, v0, :cond_66

    const p0, 0x7f140533

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    return-object v2

    :cond_66
    const p0, 0x7f140534

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    return-object v2

    :cond_74
    iget-boolean v0, p0, Lv5g;->a:Z

    if-eqz v0, :cond_b0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget p0, p0, Lv5g;->b:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const v6, 0x7f120024

    invoke-virtual {v0, v6, p0, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-static {v0, v3}, Lcc6;->b(Landroid/view/LayoutInflater;Landroid/widget/LinearLayout;)Lcc6;

    move-result-object v0

    iget-object v0, v0, Lcc6;->c:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f140527

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    return-object v2

    :cond_b0
    :goto_b0
    const/4 p0, 0x0

    return-object p0
.end method

.method public final g(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    const p0, 0x7f140529

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Lec6;->q()Z

    move-result p0

    if-eqz p0, :cond_e

    const p0, 0x7f140812

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_e
    const p0, 0x7f1412e1

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getTheme()I
    .registers 1

    const p0, 0x7f15028e

    return p0
.end method

.method public final i(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    invoke-virtual {p0}, Lec6;->q()Z

    move-result p0

    if-eqz p0, :cond_e

    const p0, 0x7f14052a

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_e
    const p0, 0x7f140532

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final j(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 2

    const p0, 0x7f08053a

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public final k(Landroid/content/Context;)I
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final l(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method

.method public final m(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 3

    const p0, 0x7f0402c8

    const v0, 0x7f06063b

    invoke-static {p0, p1, v0}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0
.end method

.method public final o()Ljava/lang/Integer;
    .registers 1

    const p0, 0x7f07006f

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 7

    invoke-virtual {p0}, Lec6;->q()Z

    move-result v0

    if-eqz v0, :cond_c

    sget-object p1, Lhjm;->a:Lhjm;

    invoke-virtual {p0, p1}, Ld63;->finish(Lhjm;)V

    return-void

    :cond_c
    sget v0, Lcom/opera/android/import_data/ImportChromeDataActivity;->d0:I

    invoke-virtual {p1}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lec6;->b:Ljm3;

    iget-boolean v1, v0, Ljm3;->a:Z

    const/4 v2, 0x1

    iget-object p0, p0, Lec6;->c:Lv5g;

    if-eqz v1, :cond_27

    iget-boolean v3, p0, Lv5g;->a:Z

    if-nez v3, :cond_27

    sget-object p0, Lj2b;->c:Lj2b;

    iget-wide v0, v0, Ljm3;->b:J

    invoke-static {p1, p0, v2, v0, v1}, Lir5;->e(Landroid/content/Context;Lj2b;ZJ)V

    return-void

    :cond_27
    iget-boolean v0, p0, Lv5g;->a:Z

    if-eqz v0, :cond_35

    if-nez v1, :cond_35

    sget-object v0, Lj2b;->d:Lj2b;

    iget p0, p0, Lv5g;->b:I

    int-to-long v3, p0

    invoke-static {p1, v0, v2, v3, v4}, Lir5;->e(Landroid/content/Context;Lj2b;ZJ)V

    :cond_35
    return-void
.end method

.method public final q()Z
    .registers 2

    iget-object p0, p0, Lec6;->c:Lv5g;

    iget-boolean v0, p0, Lv5g;->a:Z

    if-nez v0, :cond_e

    iget-object p0, p0, Lv5g;->c:Ly2b;

    sget-object v0, Ly2b;->c:Ly2b;

    if-ne p0, v0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method
