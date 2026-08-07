.class public Ll/mqf;
.super Ll/hqf;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/hqf<",
        "Ll/i7m;",
        ">;"
    }
.end annotation


# instance fields
.field private final g:Landroid/graphics/PointF;

.field private final h:Landroid/graphics/PointF;

.field private i:Landroid/animation/TimeInterpolator;


# direct methods
.method public constructor <init>(Ll/i7m;FFFFLandroid/animation/TimeInterpolator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hqf;-><init>(Ll/yol;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/PointF;

    .line 5
    .line 6
    invoke-direct {p1, p2, p3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/mqf;->g:Landroid/graphics/PointF;

    .line 10
    .line 11
    new-instance p1, Landroid/graphics/PointF;

    .line 12
    .line 13
    invoke-direct {p1, p4, p5}, Landroid/graphics/PointF;-><init>(FF)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/mqf;->h:Landroid/graphics/PointF;

    .line 17
    .line 18
    iput-object p6, p0, Ll/mqf;->i:Landroid/animation/TimeInterpolator;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public d(F)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/hqf;->a:Ll/yol;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/mqf;->i:Landroid/animation/TimeInterpolator;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0, p1}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    :cond_0
    iget-object v0, p0, Ll/mqf;->g:Landroid/graphics/PointF;

    .line 14
    .line 15
    iget v1, v0, Landroid/graphics/PointF;->x:F

    .line 16
    .line 17
    iget-object v2, p0, Ll/mqf;->h:Landroid/graphics/PointF;

    .line 18
    .line 19
    iget v3, v2, Landroid/graphics/PointF;->x:F

    .line 20
    .line 21
    sub-float/2addr v3, v1

    .line 22
    mul-float/2addr v3, p1

    .line 23
    add-float/2addr v1, v3

    .line 24
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 25
    .line 26
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 27
    .line 28
    sub-float/2addr v2, v0

    .line 29
    mul-float/2addr v2, p1

    .line 30
    add-float/2addr v0, v2

    .line 31
    iget-object p1, p0, Ll/hqf;->a:Ll/yol;

    .line 32
    .line 33
    check-cast p1, Ll/i7m;

    .line 34
    .line 35
    invoke-interface {p1, v1}, Ll/i7m;->c(F)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/hqf;->a:Ll/yol;

    .line 39
    .line 40
    check-cast p0, Ll/i7m;

    .line 41
    .line 42
    invoke-interface {p0, v0}, Ll/i7m;->b(F)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method
