.class public final Lrhj;
.super Lmq3;
.source "SourceFile"


# instance fields
.field public final a:Landroid/view/View;

.field public final b:F

.field public final c:I

.field public final d:F

.field public e:F

.field public final f:Lwq3;


# direct methods
.method public constructor <init>(Lwq3;Lz46;Landroid/view/View;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lrhj;->e:F

    iput-object p3, p0, Lrhj;->a:Landroid/view/View;

    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0700a4

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Lrhj;->b:F

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0700a3

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lrhj;->c:I

    const v1, 0x7f040007

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Lf03;->w(ILandroid/content/Context;I)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lrhj;->d:F

    new-instance v0, Llzb;

    const/16 v1, 0xf

    invoke-direct {v0, p0, v1}, Llzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v1

    if-eqz v1, :cond_43

    invoke-static {v1, p3, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_43
    new-instance v0, Lz22;

    const/16 v1, 0xb

    invoke-direct {v0, p0, v1}, Lz22;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    if-eqz p2, :cond_59

    new-instance p3, Lzd7;

    const/4 v0, 0x1

    invoke-direct {p3, p0, v0}, Lzd7;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p3}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    goto :goto_5c

    :cond_59
    invoke-virtual {p0}, Lrhj;->d()V

    :goto_5c
    iput-object p1, p0, Lrhj;->f:Lwq3;

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .registers 2

    invoke-virtual {p0}, Lrhj;->d()V

    return-void
.end method

.method public final c(ILandroid/view/View;)V
    .registers 3

    const/4 p2, 0x5

    if-ne p1, p2, :cond_a

    iget-object p0, p0, Lrhj;->f:Lwq3;

    sget-object p1, Lhjm;->a:Lhjm;

    invoke-virtual {p0, p1}, Lvq3;->Q(Lhjm;)V

    :cond_a
    return-void
.end method

.method public final d()V
    .registers 7

    iget-object v0, p0, Lrhj;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v2

    add-int/2addr v2, v1

    int-to-float v1, v2

    iget v2, p0, Lrhj;->d:F

    sub-float v1, v2, v1

    div-float/2addr v1, v2

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    const/high16 v3, 0x3f800000    # 1.0f

    sub-float/2addr v3, v1

    iput v3, p0, Lrhj;->e:F

    iget v1, p0, Lrhj;->c:I

    int-to-float v1, v1

    mul-float/2addr v3, v1

    const/high16 v4, 0x3f000000    # 0.5f

    cmpl-float v4, v3, v4

    if-gtz v4, :cond_31

    move v3, v2

    :cond_31
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v4

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v5

    if-gt v4, v5, :cond_42

    move v1, v3

    :cond_42
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    const-class v4, Landroid/graphics/drawable/GradientDrawable;

    invoke-virtual {v4, v3}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_55

    invoke-virtual {v4, v3}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/drawable/Drawable;

    goto :goto_56

    :cond_55
    const/4 v3, 0x0

    :goto_56
    check-cast v3, Landroid/graphics/drawable/GradientDrawable;

    if-eqz v3, :cond_7c

    invoke-virtual {v3}, Landroid/graphics/drawable/GradientDrawable;->mutate()Landroid/graphics/drawable/Drawable;

    const/16 v4, 0x8

    new-array v4, v4, [F

    const/4 v5, 0x0

    aput v1, v4, v5

    const/4 v5, 0x1

    aput v1, v4, v5

    const/4 v5, 0x2

    aput v1, v4, v5

    const/4 v5, 0x3

    aput v1, v4, v5

    const/4 v1, 0x4

    aput v2, v4, v1

    const/4 v1, 0x5

    aput v2, v4, v1

    const/4 v1, 0x6

    aput v2, v4, v1

    const/4 v1, 0x7

    aput v2, v4, v1

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    :cond_7c
    iget v1, p0, Lrhj;->b:F

    iget p0, p0, Lrhj;->e:F

    mul-float/2addr v1, p0

    invoke-virtual {v0, v1}, Landroid/view/View;->setElevation(F)V

    return-void
.end method
