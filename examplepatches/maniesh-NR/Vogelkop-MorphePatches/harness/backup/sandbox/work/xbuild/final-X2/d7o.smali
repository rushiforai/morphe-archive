.class public abstract Ld7o;
.super Lm6k;
.source "SourceFile"

# interfaces
.implements Ly9n;


# instance fields
.field public final f:Lkotlin/jvm/functions/Function1;

.field public final g:La5n;

.field public final h:Ly6o;

.field public final i:I

.field public final j:F


# direct methods
.method public constructor <init>(Lkf;Ltsd;Ltsd;ILkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;)V
    .registers 8

    invoke-direct {p0, p1, p2, p3}, Lm6k;-><init>(Lkf;Ltsd;Ltsd;)V

    iput-object p7, p0, Ld7o;->f:Lkotlin/jvm/functions/Function1;

    iget-object p1, p0, Lm6k;->d:Lkf;

    iget-object p2, p1, Lkf;->c:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/startpage/SoftwareClipMaxWidthLinearLayout;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    iget-object p1, p1, Lkf;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/startpage/SoftwareClipMaxWidthLinearLayout;

    const/4 p3, 0x1

    invoke-virtual {p2, p4, p1, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-interface {p5, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, La5n;

    iput-object p1, p0, Ld7o;->g:La5n;

    invoke-interface {p6, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ly6o;

    iput-object p1, p0, Ld7o;->h:Ly6o;

    new-instance p2, Ljxh;

    const p3, 0x7f070a3f

    invoke-direct {p2, p3}, Ljxh;-><init>(I)V

    iget-object p3, p1, Ly6o;->c:Landroid/widget/ImageView;

    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-virtual {p2, p3}, Ly7h;->k(Landroid/content/Context;)I

    move-result p2

    iput p2, p0, Ld7o;->i:I

    new-instance p2, Ljxh;

    const p3, 0x7f070a40

    invoke-direct {p2, p3}, Ljxh;-><init>(I)V

    iget-object p1, p1, Ly6o;->c:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-virtual {p2, p3}, Ly7h;->k(Landroid/content/Context;)I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Ld7o;->j:F

    new-instance p2, Loon;

    const/4 p3, 0x4

    invoke-direct {p2, p0, p3}, Loon;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_62

    return-void

    :cond_62
    invoke-static {p0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final T(Landroid/view/View;II)V
    .registers 4

    const/16 p1, 0x64

    if-ne p2, p1, :cond_11

    if-eq p3, p1, :cond_11

    iget-object p1, p0, Lab2;->b:Lja2;

    check-cast p1, Lp6o;

    if-eqz p1, :cond_11

    iget-object p0, p0, Ld7o;->f:Lkotlin/jvm/functions/Function1;

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_11
    return-void
.end method

.method public final V(Lja2;Z)V
    .registers 12

    move-object p2, p1

    check-cast p2, Lp6o;

    iget-object v0, p0, Ld7o;->h:Ly6o;

    iget-object v1, v0, Ly6o;->c:Landroid/widget/ImageView;

    iget-object v2, p2, Lp6o;->c:Llxh;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v3}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iget-object v3, v0, Ly6o;->c:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f0402ef

    const v5, 0x7f06063b

    invoke-static {v4, v3, v5}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v3

    instance-of v4, v2, Landroid/graphics/drawable/BitmapDrawable;

    const/4 v5, 0x0

    if-eqz v4, :cond_29

    check-cast v2, Landroid/graphics/drawable/BitmapDrawable;

    goto :goto_2a

    :cond_29
    move-object v2, v5

    :goto_2a
    if-eqz v2, :cond_63

    invoke-virtual {v2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    if-eqz v2, :cond_63

    new-instance v5, Lc7o;

    new-instance v4, Lhq4;

    const/4 v6, -0x1

    invoke-direct {v4, v2, v6}, Lhq4;-><init>(Landroid/graphics/Bitmap;I)V

    new-instance v2, Lp05;

    iget v7, p0, Ld7o;->j:F

    invoke-direct {v2, v7, v3, v6}, Lp05;-><init>(FII)V

    const/4 v3, 0x2

    new-array v3, v3, [Landroid/graphics/drawable/Drawable;

    const/4 v6, 0x0

    aput-object v4, v3, v6

    const/4 v4, 0x1

    aput-object v2, v3, v4

    invoke-direct {v5, v3}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    iget v2, p0, Ld7o;->i:I

    int-to-float v3, v2

    const/high16 v8, 0x40000000    # 2.0f

    mul-float/2addr v8, v7

    sub-float/2addr v3, v8

    float-to-int v3, v3

    const/16 v7, 0x11

    invoke-virtual {v5, v6, v7}, Landroid/graphics/drawable/LayerDrawable;->setLayerGravity(II)V

    invoke-virtual {v5, v6, v3, v3}, Landroid/graphics/drawable/LayerDrawable;->setLayerSize(III)V

    invoke-virtual {v5, v4, v7}, Landroid/graphics/drawable/LayerDrawable;->setLayerGravity(II)V

    invoke-virtual {v5, v4, v2, v2}, Landroid/graphics/drawable/LayerDrawable;->setLayerSize(III)V

    :cond_63
    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, v0, Ly6o;->e:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object v2, p2, Lp6o;->d:Lpxh;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v2, v3}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Ly6o;->d:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object v2, p2, Lp6o;->e:Lrxh;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v2, v3}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, v0, Ly6o;->b:Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v1, Lgwc;

    const/4 v2, 0x5

    invoke-direct {v1, p1, v2}, Lgwc;-><init>(Lja2;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Ld7o;->g:La5n;

    invoke-virtual {p0, p1, p2}, Ld7o;->b0(La5n;Lp6o;)V

    return-void
.end method

.method public b0(La5n;Lp6o;)V
    .registers 5

    check-cast p1, Lz6o;

    check-cast p2, Lo6o;

    iget-object p0, p1, Lz6o;->b:Lcom/google/android/material/button/MaterialButton;

    new-instance v0, Lobn;

    const/16 v1, 0xb

    invoke-direct {v0, p2, p1, v1}, Lobn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
