.class public final Lig2;
.super Lf3d;
.source "SourceFile"


# instance fields
.field public final I:I

.field public J:Z

.field public K:I


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .registers 5

    invoke-direct {p0}, Lf3d;-><init>()V

    iput p2, p0, Lig2;->I:I

    const/4 p2, -0x1

    iput p2, p0, Lig2;->K:I

    iget-object v0, p0, Lf3d;->b:Lp3d;

    invoke-virtual {v0, p2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    const p2, 0x7f130039

    invoke-static {p2, p1}, Lu2d;->j(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lu2d;->e(Landroid/content/Context;ILjava/lang/String;)Ln3d;

    move-result-object p1

    new-instance p2, Lhg2;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lhg2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Ln3d;->b(Lj3d;)V

    new-instance p1, Ldvb;

    const-string p2, "**"

    const-string v0, "fill color"

    filled-new-array {p2, v0, p2}, [Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ldvb;-><init>([Ljava/lang/String;)V

    sget-object p2, Lk3d;->a:Landroid/graphics/PointF;

    const/4 p2, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    new-instance v0, Lva2;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lva2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1, p2, v0}, Lf3d;->a(Ldvb;Ljava/lang/Integer;Lykj;)V

    return-void
.end method


# virtual methods
.method public final getIntrinsicHeight()I
    .registers 1

    iget p0, p0, Lig2;->I:I

    return p0
.end method

.method public final getIntrinsicWidth()I
    .registers 1

    iget p0, p0, Lig2;->I:I

    return p0
.end method

.method public final o(Lp2d;)Z
    .registers 2

    invoke-super {p0, p1}, Lf3d;->o(Lp2d;)Z

    move-result p1

    if-nez p1, :cond_8

    const/4 p0, 0x0

    return p0

    :cond_8
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getCallback()Landroid/graphics/drawable/Drawable$Callback;

    move-result-object p1

    if-eqz p1, :cond_11

    invoke-interface {p1, p0}, Landroid/graphics/drawable/Drawable$Callback;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_11
    const/4 p0, 0x1

    return p0
.end method
