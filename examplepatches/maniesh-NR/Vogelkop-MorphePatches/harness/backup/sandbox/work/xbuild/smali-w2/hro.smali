.class public final Lhro;
.super Lijo;
.source "SourceFile"


# instance fields
.field public h:Landroid/widget/TextView;

.field public i:Landroid/widget/ImageView;

.field public j:Landroid/widget/ImageView;

.field public k:Landroid/widget/ImageView;

.field public l:Landroid/widget/TextView;


# virtual methods
.method public final c(Lcie;)V
    .registers 9

    iget-object v0, p1, Lcie;->p:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    iget-object v1, p0, Lijo;->b:Landroid/widget/ImageView;

    const/4 v2, 0x0

    const/16 v3, 0x8

    if-nez v0, :cond_2a

    invoke-virtual {p0}, Lijo;->b()V

    iget-object v0, p1, Lcie;->p:Ljava/lang/String;

    iget-object v4, p1, Lcie;->q:Ljava/lang/String;

    iget-object v5, p1, Lcie;->v:Ljava/lang/String;

    iget-object v6, p0, Lijo;->c:Landroid/widget/TextView;

    if-eqz v6, :cond_1d

    invoke-virtual {v6, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1d
    iget-object v4, p0, Lijo;->d:Landroid/widget/TextView;

    if-eqz v4, :cond_24

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_24
    if-eqz v1, :cond_4f

    invoke-static {v1, v0}, Lejo;->e(Landroid/widget/ImageView;Ljava/lang/String;)V

    goto :goto_4f

    :cond_2a
    invoke-virtual {p0}, Lijo;->b()V

    iget-object v0, p0, Lijo;->f:Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_3c

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v4

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v5

    invoke-virtual {v0, v4, v2, v5, v2}, Landroid/view/View;->setPadding(IIII)V

    :cond_3c
    iget-object v0, p0, Lijo;->g:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_43

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_43
    if-eqz v1, :cond_48

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_48
    iget-object v0, p0, Lijo;->e:Landroid/widget/TextView;

    if-eqz v0, :cond_4f

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_4f
    :goto_4f
    iget-object v0, p1, Lcie;->r:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    iget-object v4, p0, Lhro;->h:Landroid/widget/TextView;

    if-eqz v1, :cond_5d

    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_65

    :cond_5d
    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lhro;->h:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_65
    iget-boolean v0, p1, Lcie;->s:Z

    iget-object v1, p0, Lhro;->l:Landroid/widget/TextView;

    if-eqz v0, :cond_76

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lhro;->l:Landroid/widget/TextView;

    iget-object v1, p1, Lcie;->t:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_79

    :cond_76
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    :goto_79
    iget-object v0, p1, Lcie;->w:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_88

    iget-object v0, p0, Lhro;->i:Landroid/widget/ImageView;

    iget-object v1, p1, Lcie;->w:Ljava/lang/String;

    invoke-static {v0, v1}, Lejo;->e(Landroid/widget/ImageView;Ljava/lang/String;)V

    :cond_88
    iget-object v0, p1, Lcie;->x:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_97

    iget-object v0, p0, Lhro;->j:Landroid/widget/ImageView;

    iget-object v1, p1, Lcie;->x:Ljava/lang/String;

    invoke-static {v0, v1}, Lejo;->e(Landroid/widget/ImageView;Ljava/lang/String;)V

    :cond_97
    iget-object v0, p1, Lcie;->y:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_a6

    iget-object p0, p0, Lhro;->k:Landroid/widget/ImageView;

    iget-object p1, p1, Lcie;->y:Ljava/lang/String;

    invoke-static {p0, p1}, Lejo;->e(Landroid/widget/ImageView;Ljava/lang/String;)V

    :cond_a6
    return-void
.end method

.method public final f()V
    .registers 3

    iget-object v0, p0, Lejo;->a:Ljava/lang/Object;

    check-cast v0, Landroid/widget/RelativeLayout;

    const v1, 0x7f0a00b1

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lhro;->h:Landroid/widget/TextView;

    const v1, 0x7f0a00b2

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lhro;->i:Landroid/widget/ImageView;

    const v1, 0x7f0a00b3

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lhro;->j:Landroid/widget/ImageView;

    const v1, 0x7f0a00b4

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lhro;->k:Landroid/widget/ImageView;

    const v1, 0x7f0a009f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lhro;->l:Landroid/widget/TextView;

    return-void
.end method

.method public final g()V
    .registers 3

    const/4 v0, 0x0

    iget-object v1, p0, Lijo;->b:Landroid/widget/ImageView;

    if-eqz v1, :cond_8

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_8
    iget-object v1, p0, Lhro;->i:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    iget-object v1, p0, Lhro;->j:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    iget-object p0, p0, Lhro;->k:Landroid/widget/ImageView;

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void
.end method
