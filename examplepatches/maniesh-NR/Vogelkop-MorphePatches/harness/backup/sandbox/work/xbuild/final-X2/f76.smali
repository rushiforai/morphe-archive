.class public final Lf76;
.super Lbb5;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ljava/util/List;I)V
    .registers 4

    sget-object v0, Leya;->f:Leya;

    invoke-direct {p0, p1, p2, v0}, Lbb5;-><init>(Ljava/util/List;ILeya;)V

    iget-object p0, p0, Lf83;->h:Landroid/graphics/Paint;

    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object p2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    return-void
.end method


# virtual methods
.method public final f(Lkk7;)Landroid/graphics/Paint;
    .registers 6

    iget-boolean v0, p1, Lkk7;->d:Z

    if-eqz v0, :cond_7

    iget v0, p0, Lbb5;->i:I

    goto :goto_8

    :cond_7
    const/4 v0, 0x0

    :goto_8
    iget-object v1, p0, Lf83;->h:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget-boolean v0, p1, Lkk7;->d:Z

    if-eqz v0, :cond_2b

    iget-object v0, p1, Lkk7;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    const/4 v2, 0x1

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v2, v3, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    int-to-float v0, v0

    const/high16 v2, -0x1000000

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v3, v3, v2}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    goto :goto_2e

    :cond_2b
    invoke-virtual {v1}, Landroid/graphics/Paint;->clearShadowLayer()V

    :goto_2e
    invoke-super {p0, p1}, Lbb5;->f(Lkk7;)Landroid/graphics/Paint;

    move-result-object p0

    return-object p0
.end method
