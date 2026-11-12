.class public final Le6o;
.super Ld7o;
.source "SourceFile"


# instance fields
.field public final k:I

.field public final l:F


# direct methods
.method public constructor <init>(Lkf;Ltsd;Ltsd;Llrk;)V
    .registers 13

    sget-object v5, Ld6o;->a:Ld6o;

    new-instance v6, Lq0n;

    const/16 v0, 0x15

    invoke-direct {v6, v0}, Lq0n;-><init>(B)V

    const v4, 0x7f0d0497

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v7, p4

    invoke-direct/range {v0 .. v7}, Ld7o;-><init>(Lkf;Ltsd;Ltsd;ILkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V

    new-instance p0, Ljxh;

    const p1, 0x7f070a41

    invoke-direct {p0, p1}, Ljxh;-><init>(I)V

    iget-object p1, v0, Ld7o;->g:La5n;

    check-cast p1, Lx6o;

    iget-object p1, p1, Lx6o;->a:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Ly7h;->k(Landroid/content/Context;)I

    move-result p0

    iput p0, v0, Le6o;->k:I

    new-instance p0, Ljxh;

    const p1, 0x7f070a42

    invoke-direct {p0, p1}, Ljxh;-><init>(I)V

    iget-object p1, v0, Ld7o;->g:La5n;

    check-cast p1, Lx6o;

    iget-object p1, p1, Lx6o;->a:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Ly7h;->k(Landroid/content/Context;)I

    move-result p0

    int-to-float p0, p0

    iput p0, v0, Le6o;->l:F

    iget-object p0, v0, Ld7o;->g:La5n;

    check-cast p0, Lx6o;

    iget-object p0, p0, Lx6o;->c:Landroid/widget/ImageView;

    new-instance p1, Lb6o;

    const/4 p2, 0x0

    invoke-direct {p1, v0, p2}, Lb6o;-><init>(Le6o;B)V

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p2

    if-eqz p2, :cond_5a

    invoke-static {p2, p0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_5a
    iget-object p0, v0, Ld7o;->g:La5n;

    check-cast p0, Lx6o;

    iget-object p0, p0, Lx6o;->g:Landroid/widget/ImageView;

    new-instance p1, Lb6o;

    const/4 p2, 0x1

    invoke-direct {p1, v0, p2}, Lb6o;-><init>(Le6o;B)V

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p2

    if-nez p2, :cond_6d

    return-void

    :cond_6d
    invoke-static {p2, p0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final b0(La5n;Lp6o;)V
    .registers 8

    check-cast p1, Lx6o;

    check-cast p2, Li6o;

    iget-object v0, p1, Lx6o;->c:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lr7o;->h:Lr7o;

    iget-object v3, v2, Lr7o;->d:Llxh;

    iget-object v4, p1, Lx6o;->c:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {p0, v1, v3}, Le6o;->c0(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)Lc7o;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p1, Lx6o;->d:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object v1, v2, Lr7o;->c:Lrxh;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v1, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p1, Lx6o;->b:Landroid/widget/LinearLayout;

    new-instance v1, Lc6o;

    const/4 v2, 0x0

    invoke-direct {v1, p2, p1, v2}, Lc6o;-><init>(Li6o;Lx6o;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p1, Lx6o;->g:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lr7o;->i:Lr7o;

    iget-object v3, v2, Lr7o;->d:Llxh;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {p0, v1, v3}, Le6o;->c0(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)Lc7o;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p0, p1, Lx6o;->h:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object v0, v2, Lr7o;->c:Lrxh;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v0, v1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p1, Lx6o;->f:Landroid/widget/LinearLayout;

    new-instance v0, Lc6o;

    const/4 v1, 0x1

    invoke-direct {v0, p2, p1, v1}, Lc6o;-><init>(Li6o;Lx6o;B)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final c0(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)Lc7o;
    .registers 7

    const v0, 0x7f0402d4

    const v1, 0x7f06063b

    invoke-static {v0, p1, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    instance-of v0, p2, Landroid/graphics/drawable/BitmapDrawable;

    const/4 v1, 0x0

    if-eqz v0, :cond_12

    check-cast p2, Landroid/graphics/drawable/BitmapDrawable;

    goto :goto_13

    :cond_12
    move-object p2, v1

    :goto_13
    if-eqz p2, :cond_4d

    invoke-virtual {p2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p2

    if-eqz p2, :cond_4d

    new-instance v0, Lc7o;

    new-instance v1, Lhq4;

    const/4 v2, -0x1

    invoke-direct {v1, p2, v2}, Lhq4;-><init>(Landroid/graphics/Bitmap;I)V

    new-instance p2, Lp05;

    iget v3, p0, Le6o;->l:F

    invoke-direct {p2, v3, p1, v2}, Lp05;-><init>(FII)V

    const/4 p1, 0x2

    new-array p1, p1, [Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x0

    aput-object v1, p1, v2

    const/4 v1, 0x1

    aput-object p2, p1, v1

    invoke-direct {v0, p1}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    iget p0, p0, Le6o;->k:I

    int-to-float p1, p0

    const/high16 p2, 0x40000000    # 2.0f

    mul-float/2addr p2, v3

    sub-float/2addr p1, p2

    float-to-int p1, p1

    const/16 p2, 0x11

    invoke-virtual {v0, v2, p2}, Landroid/graphics/drawable/LayerDrawable;->setLayerGravity(II)V

    invoke-virtual {v0, v2, p1, p1}, Landroid/graphics/drawable/LayerDrawable;->setLayerSize(III)V

    invoke-virtual {v0, v1, p2}, Landroid/graphics/drawable/LayerDrawable;->setLayerGravity(II)V

    invoke-virtual {v0, v1, p0, p0}, Landroid/graphics/drawable/LayerDrawable;->setLayerSize(III)V

    return-object v0

    :cond_4d
    return-object v1
.end method
