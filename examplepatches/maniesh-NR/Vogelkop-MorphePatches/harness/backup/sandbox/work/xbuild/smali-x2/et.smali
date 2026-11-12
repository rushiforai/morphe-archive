.class public final Let;
.super Lfr8;
.source "SourceFile"


# instance fields
.field public A:I

.field public s:Lst;

.field public t:Ljl6;

.field public u:Lgk6;

.field public v:Ldt;

.field public w:I

.field public x:Ljava/lang/String;

.field public y:Lvmj;

.field public z:I


# virtual methods
.method public final n(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .registers 9

    iget-object v0, p0, Let;->t:Ljl6;

    if-nez v0, :cond_24

    iget-object v1, p0, Let;->y:Lvmj;

    if-nez v1, :cond_24

    iget-object v1, p0, Let;->u:Lgk6;

    if-nez v1, :cond_24

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v0

    iget v1, p0, Lfr8;->b:I

    iget-object v2, p0, Lfr8;->a:Lgjf;

    invoke-virtual {v2, v0, v1}, Lgjf;->b(II)Lbcd;

    move-result-object v0

    iget v1, p2, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    iget p2, p2, Landroid/graphics/Rect;->top:I

    int-to-float p2, p2

    iget p0, p0, Let;->z:I

    invoke-virtual {v0, p1, v1, p2, p0}, Lbcd;->b(Landroid/graphics/Canvas;FFI)V

    return-void

    :cond_24
    if-eqz v0, :cond_37

    iget p0, p0, Lfr8;->f:I

    iput p0, v0, Ljl6;->c:I

    iget v2, p2, Landroid/graphics/Rect;->left:I

    iget v3, p2, Landroid/graphics/Rect;->top:I

    iget v4, p2, Landroid/graphics/Rect;->right:I

    iget v5, p2, Landroid/graphics/Rect;->bottom:I

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Ljl6;->g(Landroid/graphics/Canvas;IIII)V

    return-void

    :cond_37
    move-object v1, p1

    iget-object p1, p0, Let;->u:Lgk6;

    if-eqz p1, :cond_43

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    invoke-virtual {p1, v1}, Lgk6;->draw(Landroid/graphics/Canvas;)V

    return-void

    :cond_43
    iget-object p0, p0, Let;->y:Lvmj;

    if-eqz p0, :cond_4d

    invoke-virtual {p0, p2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    invoke-virtual {p0, v1}, Lvmj;->draw(Landroid/graphics/Canvas;)V

    :cond_4d
    return-void
.end method

.method public final o()V
    .registers 4

    invoke-super {p0}, Lfr8;->o()V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f04047c

    const v2, 0x7f061084

    invoke-static {v1, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iput v0, p0, Let;->z:I

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0402d4

    const v2, 0x7f06063b

    invoke-static {v1, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iput v0, p0, Let;->A:I

    iget-object v0, p0, Let;->u:Lgk6;

    if-eqz v0, :cond_4b

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Let;->A:I

    invoke-virtual {v0, v2, v1}, Lgk6;->a(ILandroid/content/Context;)V

    iget-object v0, p0, Let;->u:Lgk6;

    const/4 v1, 0x0

    iput-object v1, p0, Let;->t:Ljl6;

    iput-object v1, p0, Let;->v:Ldt;

    iput-object v0, p0, Let;->u:Lgk6;

    if-eqz v0, :cond_3f

    invoke-virtual {p0}, Lfr8;->l()V

    goto :goto_48

    :cond_3f
    invoke-virtual {p0}, Let;->v()V

    invoke-virtual {p0}, Let;->w()V

    invoke-virtual {p0}, Lfr8;->l()V

    :goto_48
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_4b
    return-void
.end method

.method public final q(Z)V
    .registers 10

    iget-object p1, p0, Let;->s:Lst;

    if-eqz p1, :cond_b7

    iget-object v2, p1, Lst;->b:Ljava/lang/String;

    iget v0, p0, Let;->w:I

    iget v1, p0, Lfr8;->c:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eq v0, v1, :cond_10

    move v0, v3

    goto :goto_11

    :cond_10
    move v0, v4

    :goto_11
    iget-object v5, p1, Lst;->c:Ljava/lang/String;

    iget-object p1, p1, Lst;->l:Landroid/graphics/Bitmap;

    if-eqz p1, :cond_1d

    if-nez v0, :cond_1d

    invoke-virtual {p0, p1}, Let;->u(Landroid/graphics/Bitmap;)V

    return-void

    :cond_1d
    if-eqz v5, :cond_41

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result p1

    if-eqz p1, :cond_41

    if-eqz v0, :cond_b7

    iput v1, p0, Let;->w:I

    invoke-virtual {p0}, Let;->v()V

    const-string p1, "/"

    invoke-static {v5, p1, v4}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_3c

    const-string p1, "file://"

    invoke-static {v5, p1, v4}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_3d

    :cond_3c
    move v3, v4

    :cond_3d
    invoke-virtual {p0, v1, v5, v3}, Let;->t(ILjava/lang/String;Z)V

    return-void

    :cond_41
    sget-object p1, Lhk6;->e:La36;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2}, La36;->p(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_85

    invoke-virtual {p0}, Let;->v()V

    invoke-static {v2}, La36;->s(Ljava/lang/String;)Lhk6;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_6b

    sget v1, Lgk6;->j:I

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget v3, p1, Lhk6;->b:I

    iget-object v4, p1, Lhk6;->c:Ljava/lang/Integer;

    iget v6, p0, Let;->A:I

    const/16 v7, 0x10

    iget v5, p0, Lfr8;->c:I

    invoke-static/range {v2 .. v7}, Ls16;->t(Landroid/content/Context;ILjava/lang/Integer;III)Lgk6;

    move-result-object p1

    goto :goto_6c

    :cond_6b
    move-object p1, v0

    :goto_6c
    iput-object v0, p0, Let;->t:Ljl6;

    iput-object v0, p0, Let;->v:Ldt;

    iput-object p1, p0, Let;->u:Lgk6;

    if-eqz p1, :cond_78

    invoke-virtual {p0}, Lfr8;->l()V

    goto :goto_81

    :cond_78
    invoke-virtual {p0}, Let;->v()V

    invoke-virtual {p0}, Let;->w()V

    invoke-virtual {p0}, Lfr8;->l()V

    :goto_81
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :cond_85
    sget-object p1, Lwqm;->a:[Ljava/lang/String;

    :try_start_87
    new-instance p1, Ljava/net/URI;

    invoke-direct {p1, v2}, Ljava/net/URI;-><init>(Ljava/lang/String;)V
    :try_end_8c
    .catch Ljava/net/URISyntaxException; {:try_start_87 .. :try_end_8c} :catch_b8

    const-string p1, "https://"

    invoke-static {v2, p1, v3}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_9c

    const-string p1, "http://"

    invoke-static {v2, p1, v3}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_b8

    :cond_9c
    if-eqz v0, :cond_b7

    iput v1, p0, Let;->w:I

    invoke-virtual {p0}, Let;->v()V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    new-instance v6, Lab;

    const/4 p1, 0x1

    invoke-direct {v6, p0, p1}, Lab;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lcom/opera/android/favorites/SpeedDialDataFetcher;

    const/4 v1, 0x0

    invoke-static {v4}, Lnr8;->e(Landroid/content/Context;)I

    move-result v5

    invoke-direct/range {v0 .. v6}, Lcom/opera/android/favorites/SpeedDialDataFetcher;-><init>(Lorg/chromium/content_public/browser/WebContents;Ljava/lang/String;ILandroid/content/Context;ILcom/opera/api/Callback;)V

    :cond_b7
    return-void

    :catch_b8
    :cond_b8
    invoke-virtual {p0}, Let;->v()V

    invoke-virtual {p0}, Let;->w()V

    invoke-virtual {p0}, Lfr8;->l()V

    return-void
.end method

.method public final s()V
    .registers 3

    iget-object v0, p0, Let;->s:Lst;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-boolean v1, p0, Lfr8;->l:Z

    if-nez v1, :cond_14

    iget-object v0, v0, Lst;->a:Lpxh;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v0, v1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_16

    :cond_14
    const-string v0, " "

    :goto_16
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final t(ILjava/lang/String;Z)V
    .registers 5

    new-instance v0, Ldt;

    invoke-direct {v0, p0, p3, p2, p1}, Ldt;-><init>(Let;ZLjava/lang/String;I)V

    iput-object v0, p0, Let;->v:Ldt;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2}, Lqbe;->G(Landroid/content/Context;ILjava/lang/String;)Ldwh;

    move-result-object p0

    if-eqz p3, :cond_18

    const/4 p1, 0x3

    const/4 p2, 0x0

    new-array p2, p2, [I

    invoke-virtual {p0, p1, p2}, Ldwh;->i(I[I)V

    :cond_18
    invoke-virtual {p0, v0}, Ldwh;->f(Lacl;)V

    return-void
.end method

.method public final u(Landroid/graphics/Bitmap;)V
    .registers 7

    iget-object v0, p0, Let;->s:Lst;

    if-eqz v0, :cond_6

    iput-object p1, v0, Lst;->l:Landroid/graphics/Bitmap;

    :cond_6
    const/4 v0, 0x0

    if-eqz p1, :cond_15

    new-instance v1, Ljl6;

    iget v2, p0, Lfr8;->b:I

    iget v3, p0, Lfr8;->f:I

    iget-object v4, p0, Lfr8;->a:Lgjf;

    invoke-direct {v1, p1, v4, v2, v3}, Ljl6;-><init>(Landroid/graphics/Bitmap;Lgjf;II)V

    goto :goto_16

    :cond_15
    move-object v1, v0

    :goto_16
    iput-object v1, p0, Let;->t:Ljl6;

    iput-object v0, p0, Let;->v:Ldt;

    if-nez v1, :cond_26

    invoke-virtual {p0}, Let;->v()V

    invoke-virtual {p0}, Let;->w()V

    invoke-virtual {p0}, Lfr8;->l()V

    goto :goto_29

    :cond_26
    invoke-virtual {p0}, Lfr8;->l()V

    :goto_29
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final v()V
    .registers 3

    iget-object v0, p0, Let;->v:Ldt;

    if-eqz v0, :cond_9

    sget-object v1, Lyne;->b:Ldeg;

    invoke-virtual {v1, v0}, Ldeg;->a(Ljava/lang/Object;)V

    :cond_9
    const/4 v0, 0x0

    iput-object v0, p0, Let;->v:Ldt;

    iput-object v0, p0, Let;->t:Ljl6;

    iput-object v0, p0, Let;->u:Lgk6;

    return-void
.end method

.method public final w()V
    .registers 5

    iget-object v0, p0, Let;->s:Lst;

    if-eqz v0, :cond_23

    iget-object v0, v0, Lst;->b:Ljava/lang/String;

    iget-object v1, p0, Let;->x:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_23

    iput-object v0, p0, Let;->x:Ljava/lang/String;

    sget v1, Lvmj;->g:I

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lfr8;->c:I

    const/16 v3, 0x30

    invoke-static {v1, v0, v2, v2, v3}, Ltmj;->j(Landroid/content/Context;Ljava/lang/String;III)Lvmj;

    move-result-object v0

    iput-object v0, p0, Let;->y:Lvmj;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_23
    return-void
.end method
