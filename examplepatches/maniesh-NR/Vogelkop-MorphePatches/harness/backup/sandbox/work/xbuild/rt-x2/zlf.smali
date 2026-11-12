.class public final Lzlf;
.super Li41;
.source "SourceFile"


# instance fields
.field public l:Limf;


# virtual methods
.method public final D()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lzlf;->l:Limf;

    if-nez p0, :cond_5

    const/4 p0, 0x0

    :cond_5
    iget-object p0, p0, Limf;->c:Landroid/widget/ImageView;

    return-object p0
.end method

.method public final F(Landroid/view/ViewGroup;)V
    .registers 3

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-static {v0, p1}, Limf;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Limf;

    move-result-object p1

    iput-object p1, p0, Lzlf;->l:Limf;

    return-void
.end method
