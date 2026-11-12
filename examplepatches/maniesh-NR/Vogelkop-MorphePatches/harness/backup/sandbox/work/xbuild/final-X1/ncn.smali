.class public final Lncn;
.super Lf3d;
.source "SourceFile"


# instance fields
.field public final I:I

.field public final J:Lmcn;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lmcn;)V
    .registers 3

    invoke-direct {p0}, Lf3d;-><init>()V

    iput-object p2, p0, Lncn;->J:Lmcn;

    const/high16 p2, 0x41c00000    # 24.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {p2, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    iput p1, p0, Lncn;->I:I

    return-void
.end method


# virtual methods
.method public final getIntrinsicHeight()I
    .registers 1

    iget p0, p0, Lncn;->I:I

    return p0
.end method

.method public final getIntrinsicWidth()I
    .registers 1

    iget p0, p0, Lncn;->I:I

    return p0
.end method

.method public final o(Lp2d;)Z
    .registers 2

    invoke-super {p0, p1}, Lf3d;->o(Lp2d;)Z

    move-result p1

    if-eqz p1, :cond_11

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object p1

    if-eqz p1, :cond_f

    invoke-interface {p1, p0}, Landroid/graphics/drawable/Drawable$Callback;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_f
    const/4 p0, 0x1

    return p0

    :cond_11
    const/4 p0, 0x0

    return p0
.end method

.method public final setVisible(ZZ)Z
    .registers 3

    invoke-super {p0, p1, p2}, Lf3d;->setVisible(ZZ)Z

    move-result p1

    if-eqz p1, :cond_d

    iget-object p0, p0, Lncn;->J:Lmcn;

    invoke-virtual {p0}, Lmcn;->run()V

    const/4 p0, 0x1

    return p0

    :cond_d
    const/4 p0, 0x0

    return p0
.end method
