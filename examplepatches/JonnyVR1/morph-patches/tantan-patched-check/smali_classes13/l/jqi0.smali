.class public Ll/jqi0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/jqi0$a;
    }
.end annotation


# instance fields
.field public a:F

.field public b:F

.field public c:Ll/jqi0$a;

.field public d:Ll/jqi0$a;

.field public e:Landroid/view/animation/Interpolator;

.field public f:F

.field public g:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    .line 5
    .line 6
    const/high16 v1, 0x40000000    # 2.0f

    .line 7
    .line 8
    invoke-direct {v0, v1}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/jqi0;->e:Landroid/view/animation/Interpolator;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a(FLl/jqi0$a;)F
    .locals 5

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    cmpl-float v1, p1, v1

    .line 7
    .line 8
    const/high16 v2, 0x3f800000    # 1.0f

    .line 9
    .line 10
    if-ltz v1, :cond_0

    .line 11
    .line 12
    move v1, v2

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/high16 v1, -0x40800000    # -1.0f

    .line 15
    .line 16
    :goto_0
    cmpl-float v2, v1, v2

    .line 17
    .line 18
    if-nez v2, :cond_1

    .line 19
    .line 20
    invoke-virtual {p2}, Ll/jqi0$a;->b()F

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    invoke-virtual {p2}, Ll/jqi0$a;->a()F

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    :goto_1
    cmpg-float v2, v0, p2

    .line 30
    .line 31
    if-gez v2, :cond_2

    .line 32
    .line 33
    return p1

    .line 34
    :cond_2
    sub-float p1, v0, p2

    .line 35
    .line 36
    iget v2, p0, Ll/jqi0;->a:F

    .line 37
    .line 38
    add-float/2addr v2, p2

    .line 39
    iget v3, p0, Ll/jqi0;->b:F

    .line 40
    .line 41
    add-float v4, v3, p2

    .line 42
    .line 43
    cmpl-float v0, v0, v4

    .line 44
    .line 45
    if-ltz v0, :cond_3

    .line 46
    .line 47
    mul-float/2addr v2, v1

    .line 48
    return v2

    .line 49
    :cond_3
    div-float/2addr p1, v3

    .line 50
    iget-object v0, p0, Ll/jqi0;->e:Landroid/view/animation/Interpolator;

    .line 51
    .line 52
    invoke-interface {v0, p1}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    iget p0, p0, Ll/jqi0;->a:F

    .line 57
    .line 58
    mul-float/2addr p1, p0

    .line 59
    add-float/2addr p2, p1

    .line 60
    mul-float/2addr p2, v1

    .line 61
    return p2
.end method

.method public b(F)F
    .locals 2

    .line 1
    iget v0, p0, Ll/jqi0;->f:F

    .line 2
    .line 3
    sub-float/2addr p1, v0

    .line 4
    iget-object v1, p0, Ll/jqi0;->d:Ll/jqi0$a;

    .line 5
    .line 6
    invoke-virtual {p0, p1, v1}, Ll/jqi0;->a(FLl/jqi0$a;)F

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    add-float/2addr v0, p0

    .line 11
    return v0
.end method

.method public c(F)F
    .locals 2

    .line 1
    iget v0, p0, Ll/jqi0;->g:F

    .line 2
    .line 3
    sub-float/2addr p1, v0

    .line 4
    iget-object v1, p0, Ll/jqi0;->c:Ll/jqi0$a;

    .line 5
    .line 6
    invoke-virtual {p0, p1, v1}, Ll/jqi0;->a(FLl/jqi0$a;)F

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    add-float/2addr v0, p0

    .line 11
    return v0
.end method

.method public d(FFLandroid/graphics/RectF;Landroid/graphics/RectF;)V
    .locals 2

    .line 1
    iput p1, p0, Ll/jqi0;->f:F

    .line 2
    .line 3
    iput p2, p0, Ll/jqi0;->g:F

    .line 4
    .line 5
    invoke-virtual {p3}, Landroid/graphics/RectF;->width()F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p3}, Landroid/graphics/RectF;->height()F

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const p2, 0x3e4ccccd    # 0.2f

    .line 18
    .line 19
    .line 20
    mul-float/2addr p1, p2

    .line 21
    iput p1, p0, Ll/jqi0;->a:F

    .line 22
    .line 23
    const/high16 p2, 0x41200000    # 10.0f

    .line 24
    .line 25
    mul-float/2addr p1, p2

    .line 26
    iput p1, p0, Ll/jqi0;->b:F

    .line 27
    .line 28
    new-instance p1, Ll/jqi0$a;

    .line 29
    .line 30
    iget p2, p3, Landroid/graphics/RectF;->right:F

    .line 31
    .line 32
    iget v0, p4, Landroid/graphics/RectF;->right:F

    .line 33
    .line 34
    sub-float/2addr p2, v0

    .line 35
    iget v0, p4, Landroid/graphics/RectF;->left:F

    .line 36
    .line 37
    iget v1, p3, Landroid/graphics/RectF;->left:F

    .line 38
    .line 39
    sub-float/2addr v0, v1

    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-direct {p1, p2, v0, v1}, Ll/jqi0$a;-><init>(FFLl/kqi0;)V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Ll/jqi0;->d:Ll/jqi0$a;

    .line 45
    .line 46
    new-instance p1, Ll/jqi0$a;

    .line 47
    .line 48
    iget p2, p3, Landroid/graphics/RectF;->bottom:F

    .line 49
    .line 50
    iget v0, p4, Landroid/graphics/RectF;->bottom:F

    .line 51
    .line 52
    sub-float/2addr p2, v0

    .line 53
    iget p4, p4, Landroid/graphics/RectF;->top:F

    .line 54
    .line 55
    iget p3, p3, Landroid/graphics/RectF;->top:F

    .line 56
    .line 57
    sub-float/2addr p4, p3

    .line 58
    invoke-direct {p1, p2, p4, v1}, Ll/jqi0$a;-><init>(FFLl/kqi0;)V

    .line 59
    .line 60
    .line 61
    iput-object p1, p0, Ll/jqi0;->c:Ll/jqi0$a;

    .line 62
    .line 63
    return-void
.end method
