.class public final Ldw8;
.super Lmv9;
.source "SourceFile"


# instance fields
.field public final e:Lcom/opera/android/custom_views/StylingImageView;

.field public final synthetic f:Lew8;


# direct methods
.method public constructor <init>(Lew8;Landroid/view/View;)V
    .registers 8

    iput-object p1, p0, Ldw8;->f:Lew8;

    invoke-direct {p0, p1, p2}, Lmv9;-><init>(Lnv9;Landroid/view/View;)V

    const v0, 0x7f0a01c0

    invoke-static {v0, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_5f

    invoke-static {v1}, Lov0;->c(Landroid/view/View;)Lov0;

    move-result-object v0

    iget-object v1, v0, Lov0;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/CapturableButton;

    iget-object v0, v0, Lov0;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/CapturableButton;

    const v2, 0x7f0a04b5

    invoke-static {v2, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v3, :cond_5e

    const v2, 0x7f0a051d

    invoke-static {v2, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v4, :cond_5e

    const v2, 0x7f0a06b5

    invoke-static {v2, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v4, :cond_5e

    check-cast p2, Lcom/opera/android/custom_views/CardView;

    iput-object v3, p0, Ldw8;->e:Lcom/opera/android/custom_views/StylingImageView;

    const p0, 0x7f14092a

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(I)V

    new-instance p0, Lcw8;

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Lcw8;-><init>(Lew8;B)V

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p0, 0x7f140d97

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(I)V

    new-instance p0, Lcw8;

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Lcw8;-><init>(Lew8;B)V

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_5e
    move v0, v2

    :cond_5f
    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final V(Lja2;Z)V
    .registers 4

    iget-object p1, p0, Ldw8;->f:Lew8;

    iget-object p1, p1, Lew8;->p:Llvc;

    new-instance p2, Lbn7;

    const/16 v0, 0x17

    invoke-direct {p2, p0, v0}, Lbn7;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p1, Llvc;->f:Lbn7;

    invoke-virtual {p0}, Ldw8;->e0()V

    return-void
.end method

.method public final Y()V
    .registers 2

    iget-object p0, p0, Ldw8;->f:Lew8;

    iget-object p0, p0, Lew8;->p:Llvc;

    const/4 v0, 0x0

    iput-object v0, p0, Llvc;->f:Lbn7;

    return-void
.end method

.method public final e0()V
    .registers 7

    iget-object v0, p0, Ldw8;->f:Lew8;

    iget-object v0, v0, Lew8;->p:Llvc;

    iget-object p0, p0, Ldw8;->e:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget-object v0, v0, Llvc;->e:Ljava/lang/String;

    const v3, 0x7f0803c5

    invoke-static {v3, v0}, Lvtp;->K(ILjava/lang/String;)I

    move-result v0

    invoke-static {v2, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    const/4 v3, 0x1

    const/high16 v4, 0x42200000    # 40.0f

    invoke-static {v3, v4, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    const/high16 v5, 0x41a00000    # 20.0f

    invoke-static {v3, v5, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v3

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    sget-object v4, Ls8i;->d:Landroid/view/animation/PathInterpolator;

    new-instance v4, Lp8i;

    invoke-direct {v4, v2, v3, v1, v0}, Lp8i;-><init>(IILandroid/content/Context;Landroid/graphics/Bitmap;)V

    invoke-virtual {p0, v4}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
