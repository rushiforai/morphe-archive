.class public final Ld0b;
.super Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;
.source "SourceFile"


# instance fields
.field public a:Z

.field public final synthetic b:Lydb;


# direct methods
.method public constructor <init>(Lydb;)V
    .registers 2

    iput-object p1, p0, Ld0b;->b:Lydb;

    invoke-direct {p0}, Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Ld0b;->a:Z

    return-void
.end method


# virtual methods
.method public final onScale(Landroid/view/ScaleGestureDetector;)Z
    .registers 7

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getCurrentSpan()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getPreviousSpan()F

    move-result v1

    sub-float/2addr v0, v1

    iget-object v1, p0, Ld0b;->b:Lydb;

    invoke-virtual {v1}, Lydb;->h()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v3

    mul-float/2addr v3, v2

    iget-boolean v2, v1, Lydb;->E:Z

    const/4 v4, 0x1

    if-eqz v2, :cond_49

    iget-boolean v2, p0, Ld0b;->a:Z

    if-eqz v2, :cond_47

    const/4 p0, 0x0

    cmpl-float p0, v0, p0

    if-eqz p0, :cond_49

    iput-boolean v4, v1, Lydb;->e:Z

    invoke-virtual {v1}, Lydb;->f()F

    move-result p0

    invoke-virtual {v1}, Lydb;->g()F

    move-result v0

    const v2, 0x3dcccccd    # 0.1f

    sub-float/2addr v0, v2

    invoke-static {v3, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-static {p0, v0}, Ljava/lang/Math;->min(FF)F

    move-result p0

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result p1

    invoke-virtual {v1, p0, v0, p1}, Lydb;->o(FFF)V

    invoke-virtual {v1}, Landroid/view/View;->invalidate()V

    return v4

    :cond_47
    iput-boolean v4, p0, Ld0b;->a:Z

    :cond_49
    return v4
.end method
