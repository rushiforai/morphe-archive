.class public final Lps5;
.super Lbud;
.source "SourceFile"

# interfaces
.implements Landroid/view/ContextMenu;


# instance fields
.field public d:Ljava/lang/CharSequence;

.field public e:Leog;


# virtual methods
.method public final clearHeader()V
    .registers 2

    const-string v0, ""

    iput-object v0, p0, Lps5;->d:Ljava/lang/CharSequence;

    invoke-virtual {p0}, Lps5;->e()V

    return-void
.end method

.method public final e()V
    .registers 4

    iget-object v0, p0, Lps5;->e:Leog;

    if-eqz v0, :cond_39

    iget-object p0, p0, Lps5;->d:Ljava/lang/CharSequence;

    iget-object v1, v0, Leog;->f:Landroid/view/View;

    if-eqz v1, :cond_39

    const v1, 0x7f0a068a

    if-eqz p0, :cond_2e

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-eqz v2, :cond_2e

    iget-object v2, v0, Leog;->f:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, v0, Leog;->f:Landroid/view/View;

    const v1, 0x7f0a068c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_2e
    iget-object p0, v0, Leog;->f:Landroid/view/View;

    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_39
    return-void
.end method

.method public final setHeaderIcon(I)Landroid/view/ContextMenu;
    .registers 2

    return-object p0
.end method

.method public final setHeaderIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/ContextMenu;
    .registers 2

    .line 1
    return-object p0
.end method

.method public final setHeaderTitle(I)Landroid/view/ContextMenu;
    .registers 3

    iget-object v0, p0, Lbud;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lps5;->d:Ljava/lang/CharSequence;

    invoke-virtual {p0}, Lps5;->e()V

    return-object p0
.end method

.method public final setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;
    .registers 2

    .line 16
    iput-object p1, p0, Lps5;->d:Ljava/lang/CharSequence;

    .line 17
    invoke-virtual {p0}, Lps5;->e()V

    return-object p0
.end method

.method public final setHeaderView(Landroid/view/View;)Landroid/view/ContextMenu;
    .registers 2

    return-object p0
.end method
