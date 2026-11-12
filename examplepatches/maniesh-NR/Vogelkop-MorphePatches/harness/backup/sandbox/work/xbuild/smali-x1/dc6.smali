.class public final Ldc6;
.super Lb23;
.source "SourceFile"


# instance fields
.field public final b:J

.field public final c:I


# direct methods
.method public constructor <init>(JI)V
    .registers 5

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lb23;-><init>(B)V

    iput-wide p1, p0, Ldc6;->b:J

    iput p3, p0, Ldc6;->c:I

    return-void
.end method

.method public static q(Ljava/lang/String;Landroid/widget/LinearLayout;)V
    .registers 3

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-static {v0, p1}, Lcc6;->b(Landroid/view/LayoutInflater;Landroid/widget/LinearLayout;)Lcc6;

    move-result-object p1

    iget-object p1, p1, Lcc6;->c:Landroid/widget/TextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method public final f(Landroid/content/Context;)Landroid/view/View;
    .registers 10

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-static {v0}, Lov0;->h(Landroid/view/LayoutInflater;)Lov0;

    move-result-object v0

    iget-object v1, v0, Lov0;->d:Ljava/lang/Object;

    check-cast v1, Landroid/widget/LinearLayout;

    const-wide/16 v2, 0x0

    iget-wide v4, p0, Ldc6;->b:J

    cmp-long v2, v4, v2

    const v3, 0x7f120024

    iget p0, p0, Ldc6;->c:I

    if-lez v2, :cond_69

    const v2, 0x7f120023

    if-lez p0, :cond_46

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v3, p0, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v1}, Ldc6;->q(Ljava/lang/String;Landroid/widget/LinearLayout;)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    long-to-int p1, v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, p1, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v1}, Ldc6;->q(Ljava/lang/String;Landroid/widget/LinearLayout;)V

    goto :goto_8c

    :cond_46
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    long-to-int v3, v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v2, v3, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v1}, Ldc6;->q(Ljava/lang/String;Landroid/widget/LinearLayout;)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f140531

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v1}, Ldc6;->q(Ljava/lang/String;Landroid/widget/LinearLayout;)V

    goto :goto_8c

    :cond_69
    if-lez p0, :cond_91

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v3, p0, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v1}, Ldc6;->q(Ljava/lang/String;Landroid/widget/LinearLayout;)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const p1, 0x7f14052e

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v1}, Ldc6;->q(Ljava/lang/String;Landroid/widget/LinearLayout;)V

    :goto_8c
    iget-object p0, v0, Lov0;->b:Landroid/view/View;

    check-cast p0, Landroid/widget/LinearLayout;

    return-object p0

    :cond_91
    const/4 p0, 0x0

    return-object p0
.end method

.method public final g(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 7

    iget-wide v0, p0, Ldc6;->b:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    iget p0, p0, Ldc6;->c:I

    if-lez v4, :cond_14

    if-lez p0, :cond_14

    const p0, 0x7f140529

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_14
    cmp-long v0, v0, v2

    if-gtz v0, :cond_22

    if-gtz p0, :cond_22

    const p0, 0x7f14052f

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_22
    const p0, 0x7f140528

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f140812

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
    .registers 6

    iget-wide v0, p0, Ldc6;->b:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_14

    iget p0, p0, Ldc6;->c:I

    if-gtz p0, :cond_14

    const p0, 0x7f140530

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_14
    const p0, 0x7f14052a

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final j(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 6

    iget-wide v0, p0, Ldc6;->b:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_14

    iget p0, p0, Ldc6;->c:I

    if-gtz p0, :cond_14

    const p0, 0x7f080576

    invoke-static {p0, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :cond_14
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
    .registers 2

    sget-object p1, Lhjm;->a:Lhjm;

    invoke-virtual {p0, p1}, Ld63;->finish(Lhjm;)V

    return-void
.end method
