.class public final Lrp8;
.super Lifc;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lsp8;

.field public final synthetic b:Landroidx/recyclerview/widget/f;


# direct methods
.method public constructor <init>(Lsp8;Landroidx/recyclerview/widget/f;Landroid/content/Context;)V
    .registers 4

    iput-object p1, p0, Lrp8;->a:Lsp8;

    iput-object p2, p0, Lrp8;->b:Landroidx/recyclerview/widget/f;

    invoke-direct {p0, p3}, Lifc;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final calculateSpeedPerPixel(Landroid/util/DisplayMetrics;)F
    .registers 2

    iget p0, p1, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float p0, p0

    const/high16 p1, 0x41c80000    # 25.0f

    div-float/2addr p1, p0

    return p1
.end method

.method public final onTargetFound(Landroid/view/View;Lvph;Lsph;)V
    .registers 6

    iget-object p2, p0, Lrp8;->a:Lsp8;

    iget-object v0, p0, Lrp8;->b:Landroidx/recyclerview/widget/f;

    invoke-virtual {p2, v0, p1}, Lqtj;->calculateDistanceToFinalSnap(Landroidx/recyclerview/widget/f;Landroid/view/View;)[I

    move-result-object p1

    const/4 p2, 0x0

    aget p2, p1, p2

    const/4 v0, 0x1

    aget p1, p1, v0

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result v0

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lifc;->calculateTimeForDeceleration(I)I

    move-result v0

    if-lez v0, :cond_25

    iget-object p0, p0, Lifc;->mDecelerateInterpolator:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p3, p2, p1, v0, p0}, Lsph;->b(IIILandroid/view/animation/Interpolator;)V

    :cond_25
    return-void
.end method
