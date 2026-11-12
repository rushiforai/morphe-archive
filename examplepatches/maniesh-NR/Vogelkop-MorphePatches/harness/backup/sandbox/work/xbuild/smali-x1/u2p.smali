.class public final Lu2p;
.super Laoo;
.source "SourceFile"


# instance fields
.field public u:Landroid/widget/ImageView;

.field public v:Landroid/widget/TextView;

.field public w:Z


# virtual methods
.method public final i(Landroid/view/View;)V
    .registers 4

    invoke-super {p0, p1}, Laoo;->i(Landroid/view/View;)V

    iget-object p1, p0, Laoo;->j:Landroid/view/View;

    if-nez p1, :cond_8

    move-object p1, p0

    :cond_8
    new-instance v0, Lg2p;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lg2p;-><init>(Laoo;B)V

    iget-object p0, p0, Laoo;->c:Lami;

    invoke-virtual {p0, p1, v0}, Lami;->b(Landroid/view/View;Looo;)V

    return-void
.end method

.method public final k()Landroid/view/View;
    .registers 4

    new-instance v0, Landroid/widget/ImageView;

    iget-object v1, p0, Laoo;->a:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lu2p;->u:Landroid/widget/ImageView;

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Lu2p;->u:Landroid/widget/ImageView;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setAdjustViewBounds(Z)V

    iget-object v1, p0, Lu2p;->u:Landroid/widget/ImageView;

    invoke-virtual {p0, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p0, p0, Lu2p;->u:Landroid/widget/ImageView;

    return-object p0
.end method

.method public final p()V
    .registers 4

    iget-object v0, p0, Lu2p;->u:Landroid/widget/ImageView;

    const/4 v1, 0x0

    if-eqz v0, :cond_e

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    iget-object v0, p0, Lu2p;->u:Landroid/widget/ImageView;

    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_e
    iget-object v0, p0, Lu2p;->v:Landroid/widget/TextView;

    if-eqz v0, :cond_17

    invoke-static {v0}, Lupj;->j(Landroid/view/View;)V

    iput-object v1, p0, Lu2p;->v:Landroid/widget/TextView;

    :cond_17
    iget-object p0, p0, Laoo;->o:Lsc;

    if-eqz p0, :cond_1e

    invoke-virtual {p0}, Lsc;->a()V

    :cond_1e
    return-void
.end method
