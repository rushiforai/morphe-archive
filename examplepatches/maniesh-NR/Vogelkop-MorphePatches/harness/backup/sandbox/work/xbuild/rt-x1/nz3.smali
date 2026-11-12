.class public final Lnz3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkz3;
.implements Lcll;


# instance fields
.field public final a:Landroid/widget/ImageView;

.field public final b:Ldll;

.field public c:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/widget/ImageView;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnz3;->a:Landroid/widget/ImageView;

    sget-object v0, Lq9n;->c:Ll5b;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object p1

    iput-object p1, p0, Lnz3;->b:Ldll;

    return-void
.end method


# virtual methods
.method public final K()V
    .registers 1

    invoke-virtual {p0}, Lnz3;->a()V

    return-void
.end method

.method public final a()V
    .registers 7

    iget-object p0, p0, Lnz3;->a:Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lf03;->q(Landroid/content/Context;)I

    move-result v1

    const/high16 v2, 0x42200000    # 40.0f

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v2, v3}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v2

    new-instance v3, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v4, Landroid/graphics/drawable/shapes/OvalShape;

    invoke-direct {v4}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    invoke-direct {v3, v4}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    invoke-virtual {v3, v2}, Landroid/graphics/drawable/ShapeDrawable;->setIntrinsicWidth(I)V

    invoke-virtual {v3, v2}, Landroid/graphics/drawable/ShapeDrawable;->setIntrinsicHeight(I)V

    invoke-virtual {v3}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v2

    const v4, 0x3df5c28f    # 0.12f

    invoke-static {v4, v1}, Lp37;->a0(FI)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    const v2, 0x7f0805c4

    invoke-static {v2, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0, v1}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    new-instance v1, Landroid/graphics/drawable/LayerDrawable;

    new-instance v2, Lw3a;

    const/16 v4, 0x77

    const/4 v5, 0x0

    invoke-direct {v2, v3, v4, v5}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    new-instance v3, Lw3a;

    const/16 v4, 0x11

    invoke-direct {v3, v0, v4, v5}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    const/4 v0, 0x2

    new-array v0, v0, [Landroid/graphics/drawable/Drawable;

    aput-object v2, v0, v5

    const/4 v2, 0x1

    aput-object v3, v0, v2

    invoke-direct {v1, v0}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1, v5, v5}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    invoke-virtual {v1, v2, v2}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    new-instance v0, Lb0j;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v3, v2}, [Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lb0j;-><init>(Landroid/graphics/drawable/LayerDrawable;[Ljava/lang/Integer;)V

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final b(Lhjm;)V
    .registers 3

    iget-object p1, p0, Lnz3;->a:Landroid/widget/ImageView;

    iget-object v0, p0, Lnz3;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Lnz3;->b:Ldll;

    if-eqz p1, :cond_e

    invoke-virtual {p1, p0}, Ldll;->b(Lcll;)V

    :cond_e
    return-void
.end method

.method public final g(Llz3;)V
    .registers 2

    iget-object p1, p0, Lnz3;->a:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lnz3;->c:Landroid/graphics/drawable/Drawable;

    iget-object p1, p0, Lnz3;->b:Ldll;

    if-eqz p1, :cond_f

    invoke-virtual {p1, p0}, Ldll;->a(Lcll;)V

    :cond_f
    invoke-virtual {p0}, Lnz3;->a()V

    return-void
.end method
