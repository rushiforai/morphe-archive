.class public final Lgro;
.super Lijo;
.source "SourceFile"


# instance fields
.field public h:Landroid/widget/TextView;

.field public i:Landroid/widget/ImageView;

.field public j:Landroid/widget/TextView;


# virtual methods
.method public final c(Lcie;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Lijo;->b()V

    iget-object v0, p1, Lcie;->p:Ljava/lang/String;

    iget-object v1, p1, Lcie;->q:Ljava/lang/String;

    iget-object v2, p1, Lcie;->v:Ljava/lang/String;

    iget-object v3, p0, Lijo;->c:Landroid/widget/TextView;

    if-eqz v3, :cond_13

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_13
    iget-object v1, p0, Lijo;->d:Landroid/widget/TextView;

    if-eqz v1, :cond_1a

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1a
    iget-object v1, p0, Lijo;->b:Landroid/widget/ImageView;

    if-eqz v1, :cond_21

    invoke-static {v1, v0}, Lejo;->e(Landroid/widget/ImageView;Ljava/lang/String;)V

    :cond_21
    iget-object v0, p0, Lgro;->h:Landroid/widget/TextView;

    iget-object v1, p1, Lcie;->r:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-boolean v0, p1, Lcie;->s:Z

    iget-object v1, p0, Lgro;->j:Landroid/widget/TextView;

    if-eqz v0, :cond_3a

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lgro;->j:Landroid/widget/TextView;

    iget-object v1, p1, Lcie;->t:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_3f

    :cond_3a
    const/16 v0, 0x8

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    :goto_3f
    iget-object p0, p0, Lgro;->i:Landroid/widget/ImageView;

    iget-object p1, p1, Lcie;->o:Ljava/lang/String;

    invoke-static {p0, p1}, Lejo;->e(Landroid/widget/ImageView;Ljava/lang/String;)V

    return-void
.end method

.method public final f()V
    .registers 3

    iget-object v0, p0, Lejo;->a:Ljava/lang/Object;

    check-cast v0, Landroid/widget/RelativeLayout;

    const v1, 0x7f0a00ac

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lgro;->i:Landroid/widget/ImageView;

    const v1, 0x7f0a00ab

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lgro;->h:Landroid/widget/TextView;

    const v1, 0x7f0a009f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lgro;->j:Landroid/widget/TextView;

    return-void
.end method

.method public final g()V
    .registers 3

    const/4 v0, 0x0

    iget-object v1, p0, Lijo;->b:Landroid/widget/ImageView;

    if-eqz v1, :cond_8

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_8
    iget-object p0, p0, Lgro;->i:Landroid/widget/ImageView;

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void
.end method
