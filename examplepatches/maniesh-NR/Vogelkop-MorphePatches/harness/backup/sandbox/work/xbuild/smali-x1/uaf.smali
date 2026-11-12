.class public final Luaf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ltaf;

.field public b:I

.field public c:I

.field public d:I

.field public e:Landroid/graphics/drawable/Drawable;

.field public f:Landroid/graphics/drawable/LayerDrawable;

.field public g:Lkce;

.field public h:Lncn;

.field public i:I

.field public j:I

.field public k:Z

.field public l:I

.field public m:Z

.field public n:Landroid/content/res/ColorStateList;

.field public o:I


# direct methods
.method public constructor <init>(Ltaf;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luaf;->a:Ltaf;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)V
    .registers 8

    iget-boolean v0, p0, Luaf;->m:Z

    const v1, 0x7f0600a7

    if-eqz v0, :cond_10

    const v0, 0x7f040755

    invoke-static {v0, p1, v1}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Luaf;->n:Landroid/content/res/ColorStateList;

    :cond_10
    iget-object v0, p0, Luaf;->h:Lncn;

    if-eqz v0, :cond_18

    invoke-virtual {v0}, Lf3d;->invalidateSelf()V

    return-void

    :cond_18
    iget-object v0, p0, Luaf;->e:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8e

    iget v2, p0, Luaf;->i:I

    const/4 v3, 0x0

    if-eqz v2, :cond_2c

    invoke-static {v2, p1, v3}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    goto :goto_37

    :cond_2c
    iget v2, p0, Luaf;->j:I

    if-eqz v2, :cond_37

    invoke-virtual {p1, v2}, Landroid/content/Context;->getColor(I)I

    move-result v2

    invoke-static {v0, v2}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    :cond_37
    :goto_37
    iget-boolean v2, p0, Luaf;->k:Z

    if-eqz v2, :cond_7a

    iget v2, p0, Luaf;->l:I

    const/high16 v4, 0x41c00000    # 24.0f

    if-eqz v2, :cond_56

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-static {v4, v5}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v4

    invoke-static {v2, p1, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-static {v4, p1}, Lj14;->D(II)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object p1

    invoke-static {p1, v0}, Lj14;->p(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/LayerDrawable;

    move-result-object v0

    goto :goto_7a

    :cond_56
    const v2, 0x7f0402b9

    const v5, 0x7f06063b

    invoke-static {v2, p1, v5}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-static {v4, v5}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v4

    const v5, 0x7f0402d7

    invoke-static {v5, p1, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-static {v4, p1}, Lj14;->D(II)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object p1

    invoke-static {v0, v2}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    invoke-static {p1, v0}, Lj14;->p(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/LayerDrawable;

    move-result-object v0

    :cond_7a
    :goto_7a
    iget-object p1, p0, Luaf;->f:Landroid/graphics/drawable/LayerDrawable;

    const/4 v1, 0x1

    invoke-virtual {p1, v1, v0}, Landroid/graphics/drawable/LayerDrawable;->setDrawableByLayerId(ILandroid/graphics/drawable/Drawable;)Z

    iget-object p1, p0, Luaf;->f:Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result p1

    invoke-virtual {v0, p1, v3}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    iget-object p0, p0, Luaf;->f:Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_8e
    return-void
.end method

.method public final b(Landroid/graphics/drawable/Drawable;)V
    .registers 4

    iput-object p1, p0, Luaf;->e:Landroid/graphics/drawable/Drawable;

    new-instance p1, Landroid/graphics/drawable/LayerDrawable;

    iget-object v0, p0, Luaf;->e:Landroid/graphics/drawable/Drawable;

    filled-new-array {v0}, [Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    iput-object p1, p0, Luaf;->f:Landroid/graphics/drawable/LayerDrawable;

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    iget-object p1, p0, Luaf;->f:Landroid/graphics/drawable/LayerDrawable;

    invoke-virtual {p1, v1, v1}, Landroid/graphics/drawable/LayerDrawable;->setVisible(ZZ)Z

    new-instance p1, Lkce;

    iget-object v0, p0, Luaf;->f:Landroid/graphics/drawable/LayerDrawable;

    invoke-direct {p1, v0}, Lkce;-><init>(Landroid/graphics/drawable/LayerDrawable;)V

    iput-object p1, p0, Luaf;->g:Lkce;

    return-void
.end method
