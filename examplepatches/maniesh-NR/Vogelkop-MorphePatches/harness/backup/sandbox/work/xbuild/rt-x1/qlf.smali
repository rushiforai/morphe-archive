.class public final Lqlf;
.super Lplf;
.source "SourceFile"


# virtual methods
.method public final G(Lpxh;)V
    .registers 4

    sget v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C:I

    iget-object p0, p0, Lplf;->h:Limf;

    if-nez p0, :cond_7

    const/4 p0, 0x0

    :cond_7
    iget-object p0, p0, Limf;->c:Landroid/widget/ImageView;

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    new-instance v0, Lsxh;

    const v1, 0x7f1412a6

    invoke-direct {v0, v1, p1}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {v0, p1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setTooltipText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final J()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final O(Lb8h;)V
    .registers 2

    return-void
.end method

.method public final v(Landroid/view/ViewGroup;)V
    .registers 2

    invoke-super {p0, p1}, Lplf;->v(Landroid/view/ViewGroup;)V

    iget-object p0, p0, Lplf;->h:Limf;

    if-nez p0, :cond_8

    const/4 p0, 0x0

    :cond_8
    iget-object p0, p0, Limf;->c:Landroid/widget/ImageView;

    const p1, 0x7f08058f

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method
