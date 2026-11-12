.class public Lplf;
.super Luup;
.source "SourceFile"


# instance fields
.field public h:Limf;


# virtual methods
.method public G(Lpxh;)V
    .registers 3

    sget v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C:I

    iget-object p0, p0, Lplf;->h:Limf;

    if-nez p0, :cond_7

    const/4 p0, 0x0

    :cond_7
    iget-object p0, p0, Limf;->c:Landroid/widget/ImageView;

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

    iget-object p0, p0, Lplf;->h:Limf;

    if-nez p0, :cond_5

    const/4 p0, 0x0

    :cond_5
    iget-object p0, p0, Limf;->c:Landroid/widget/ImageView;

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public final I(Z)V
    .registers 2

    iget-object p0, p0, Lplf;->h:Limf;

    if-nez p0, :cond_5

    const/4 p0, 0x0

    :cond_5
    iget-object p0, p0, Limf;->c:Landroid/widget/ImageView;

    if-eqz p1, :cond_b

    const/4 p1, 0x1

    goto :goto_c

    :cond_b
    const/4 p1, 0x2

    :goto_c
    invoke-virtual {p0, p1}, Landroid/view/View;->setImportantForAccessibility(I)V

    return-void
.end method

.method public J()Z
    .registers 1

    iget-object p0, p0, Lplf;->h:Limf;

    if-nez p0, :cond_5

    const/4 p0, 0x0

    :cond_5
    iget-object p0, p0, Limf;->c:Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/view/View;->hasOnClickListeners()Z

    move-result p0

    return p0
.end method

.method public O(Lb8h;)V
    .registers 4

    iget-object p0, p0, Lplf;->h:Limf;

    const/4 v0, 0x0

    if-eqz p0, :cond_7

    move-object v1, p0

    goto :goto_8

    :cond_7
    move-object v1, v0

    :goto_8
    iget-object v1, v1, Limf;->c:Landroid/widget/ImageView;

    if-nez p0, :cond_d

    move-object p0, v0

    :cond_d
    iget-object p0, p0, Limf;->c:Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1, p0}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public v(Landroid/view/ViewGroup;)V
    .registers 5

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d0310

    invoke-virtual {v1, v2, p1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const v1, 0x7f0a0573

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    if-eqz v2, :cond_25

    new-instance v1, Limf;

    invoke-direct {v1, p1, v2, v0}, Limf;-><init>(Landroid/view/View;Landroid/widget/ImageView;B)V

    iput-object v1, p0, Lplf;->h:Limf;

    return-void

    :cond_25
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
