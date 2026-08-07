.class public Ll/c55;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/c55$c;
    }
.end annotation


# static fields
.field public static final g:Landroid/view/animation/Interpolator;

.field public static final h:Landroid/view/animation/Interpolator;

.field public static final i:[I


# instance fields
.field public final a:Ll/c55$c;

.field public b:F

.field public c:Landroid/content/res/Resources;

.field public d:Landroid/animation/Animator;

.field public e:F

.field public f:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/c55;->g:Landroid/view/animation/Interpolator;

    .line 7
    .line 8
    new-instance v0, Ll/zjg;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/zjg;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/c55;->h:Landroid/view/animation/Interpolator;

    .line 14
    .line 15
    const/high16 v0, -0x1000000

    .line 16
    .line 17
    filled-new-array {v0}, [I

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sput-object v0, Ll/c55;->i:[I

    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/yn80;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Landroid/content/Context;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/c55;->c:Landroid/content/res/Resources;

    .line 15
    .line 16
    new-instance p1, Ll/c55$c;

    .line 17
    .line 18
    invoke-direct {p1}, Ll/c55$c;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Ll/c55;->a:Ll/c55$c;

    .line 22
    .line 23
    sget-object v0, Ll/c55;->i:[I

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ll/c55$c;->u([I)V

    .line 26
    .line 27
    .line 28
    const/high16 p1, 0x40200000    # 2.5f

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/c55;->k(F)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/c55;->m()V

    .line 34
    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public final a(FLl/c55$c;)V
    .locals 4

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/c55;->n(FLl/c55$c;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ll/c55$c;->j()F

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const v0, 0x3f4ccccd    # 0.8f

    .line 9
    .line 10
    .line 11
    div-float/2addr p0, v0

    .line 12
    float-to-double v0, p0

    .line 13
    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 18
    .line 19
    add-double/2addr v0, v2

    .line 20
    double-to-float p0, v0

    .line 21
    invoke-virtual {p2}, Ll/c55$c;->k()F

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p2}, Ll/c55$c;->i()F

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const v2, 0x3c23d70a    # 0.01f

    .line 30
    .line 31
    .line 32
    sub-float/2addr v1, v2

    .line 33
    invoke-virtual {p2}, Ll/c55$c;->k()F

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    sub-float/2addr v1, v2

    .line 38
    mul-float/2addr v1, p1

    .line 39
    add-float/2addr v0, v1

    .line 40
    invoke-virtual {p2, v0}, Ll/c55$c;->y(F)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p2}, Ll/c55$c;->i()F

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-virtual {p2, v0}, Ll/c55$c;->v(F)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p2}, Ll/c55$c;->j()F

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    invoke-virtual {p2}, Ll/c55$c;->j()F

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    sub-float/2addr p0, v1

    .line 59
    mul-float/2addr p0, p1

    .line 60
    add-float/2addr v0, p0

    .line 61
    invoke-virtual {p2, v0}, Ll/c55$c;->w(F)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public b(FLl/c55$c;Z)V
    .locals 7

    .line 1
    iget-boolean v0, p0, Ll/c55;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/c55;->a(FLl/c55$c;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    cmpl-float v1, p1, v0

    .line 12
    .line 13
    if-nez v1, :cond_2

    .line 14
    .line 15
    if-eqz p3, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    return-void

    .line 19
    :cond_2
    :goto_0
    invoke-virtual {p2}, Ll/c55$c;->j()F

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    const/high16 v1, 0x3f000000    # 0.5f

    .line 24
    .line 25
    cmpg-float v2, p1, v1

    .line 26
    .line 27
    const v3, 0x3c23d70a    # 0.01f

    .line 28
    .line 29
    .line 30
    const v4, 0x3f4a3d71    # 0.79f

    .line 31
    .line 32
    .line 33
    if-gez v2, :cond_3

    .line 34
    .line 35
    div-float v0, p1, v1

    .line 36
    .line 37
    invoke-virtual {p2}, Ll/c55$c;->k()F

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    sget-object v2, Ll/c55;->h:Landroid/view/animation/Interpolator;

    .line 42
    .line 43
    invoke-interface {v2, v0}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    mul-float/2addr v0, v4

    .line 48
    add-float/2addr v0, v3

    .line 49
    add-float/2addr v0, v1

    .line 50
    goto :goto_1

    .line 51
    :cond_3
    sub-float v2, p1, v1

    .line 52
    .line 53
    div-float/2addr v2, v1

    .line 54
    invoke-virtual {p2}, Ll/c55$c;->k()F

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    add-float/2addr v1, v4

    .line 59
    sget-object v5, Ll/c55;->h:Landroid/view/animation/Interpolator;

    .line 60
    .line 61
    invoke-interface {v5, v2}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    sub-float/2addr v0, v2

    .line 66
    mul-float/2addr v0, v4

    .line 67
    add-float/2addr v0, v3

    .line 68
    sub-float v0, v1, v0

    .line 69
    .line 70
    move v6, v1

    .line 71
    move v1, v0

    .line 72
    move v0, v6

    .line 73
    :goto_1
    const v2, 0x3e570a3c    # 0.20999998f

    .line 74
    .line 75
    .line 76
    mul-float/2addr v2, p1

    .line 77
    add-float/2addr p3, v2

    .line 78
    iget v2, p0, Ll/c55;->e:F

    .line 79
    .line 80
    add-float/2addr p1, v2

    .line 81
    const/high16 v2, 0x43580000    # 216.0f

    .line 82
    .line 83
    mul-float/2addr p1, v2

    .line 84
    invoke-virtual {p2, v1}, Ll/c55$c;->y(F)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p2, v0}, Ll/c55$c;->v(F)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p2, p3}, Ll/c55$c;->w(F)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0, p1}, Ll/c55;->h(F)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public final c(FII)I
    .locals 5

    .line 1
    shr-int/lit8 p0, p2, 0x18

    .line 2
    .line 3
    and-int/lit16 p0, p0, 0xff

    .line 4
    .line 5
    shr-int/lit8 v0, p2, 0x10

    .line 6
    .line 7
    and-int/lit16 v0, v0, 0xff

    .line 8
    .line 9
    shr-int/lit8 v1, p2, 0x8

    .line 10
    .line 11
    and-int/lit16 v1, v1, 0xff

    .line 12
    .line 13
    and-int/lit16 p2, p2, 0xff

    .line 14
    .line 15
    shr-int/lit8 v2, p3, 0x18

    .line 16
    .line 17
    and-int/lit16 v2, v2, 0xff

    .line 18
    .line 19
    shr-int/lit8 v3, p3, 0x10

    .line 20
    .line 21
    and-int/lit16 v3, v3, 0xff

    .line 22
    .line 23
    shr-int/lit8 v4, p3, 0x8

    .line 24
    .line 25
    and-int/lit16 v4, v4, 0xff

    .line 26
    .line 27
    and-int/lit16 p3, p3, 0xff

    .line 28
    .line 29
    sub-int/2addr v2, p0

    .line 30
    int-to-float v2, v2

    .line 31
    mul-float/2addr v2, p1

    .line 32
    float-to-int v2, v2

    .line 33
    add-int/2addr p0, v2

    .line 34
    shl-int/lit8 p0, p0, 0x18

    .line 35
    .line 36
    sub-int/2addr v3, v0

    .line 37
    int-to-float v2, v3

    .line 38
    mul-float/2addr v2, p1

    .line 39
    float-to-int v2, v2

    .line 40
    add-int/2addr v0, v2

    .line 41
    shl-int/lit8 v0, v0, 0x10

    .line 42
    .line 43
    or-int/2addr p0, v0

    .line 44
    sub-int/2addr v4, v1

    .line 45
    int-to-float v0, v4

    .line 46
    mul-float/2addr v0, p1

    .line 47
    float-to-int v0, v0

    .line 48
    add-int/2addr v1, v0

    .line 49
    shl-int/lit8 v0, v1, 0x8

    .line 50
    .line 51
    or-int/2addr p0, v0

    .line 52
    sub-int/2addr p3, p2

    .line 53
    int-to-float p3, p3

    .line 54
    mul-float/2addr p1, p3

    .line 55
    float-to-int p1, p1

    .line 56
    add-int/2addr p2, p1

    .line 57
    or-int/2addr p0, p2

    .line 58
    return p0
.end method

.method public d(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c55;->a:Ll/c55$c;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/c55$c;->x(Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/c55;->b:F

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterX()F

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterY()F

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    invoke-virtual {p1, v1, v2, v3}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/c55;->a:Ll/c55$c;

    .line 22
    .line 23
    invoke-virtual {p0, p1, v0}, Ll/c55$c;->a(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public e(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c55;->a:Ll/c55$c;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/c55$c;->p(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public varargs f([I)V
    .locals 1
    .param p1    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/c55;->a:Ll/c55$c;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/c55$c;->u([I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/c55;->a:Ll/c55$c;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Ll/c55$c;->t(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public g(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c55;->a:Ll/c55$c;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/c55$c;->w(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public getAlpha()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c55;->a:Ll/c55$c;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/c55$c;->c()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x3

    .line 2
    return p0
.end method

.method public final h(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/c55;->b:F

    .line 2
    .line 3
    return-void
.end method

.method public final i(FFFF)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c55;->a:Ll/c55$c;

    .line 2
    .line 3
    iget-object p0, p0, Ll/c55;->c:Landroid/content/res/Resources;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 10
    .line 11
    mul-float/2addr p2, p0

    .line 12
    invoke-virtual {v0, p2}, Ll/c55$c;->z(F)V

    .line 13
    .line 14
    .line 15
    mul-float/2addr p1, p0

    .line 16
    invoke-virtual {v0, p1}, Ll/c55$c;->q(F)V

    .line 17
    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-virtual {v0, p1}, Ll/c55$c;->t(I)V

    .line 21
    .line 22
    .line 23
    mul-float/2addr p3, p0

    .line 24
    mul-float/2addr p4, p0

    .line 25
    invoke-virtual {v0, p3, p4}, Ll/c55$c;->o(FF)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public isRunning()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c55;->d:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/animation/Animator;->isRunning()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public j(FF)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c55;->a:Ll/c55$c;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/c55$c;->y(F)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/c55;->a:Ll/c55$c;

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Ll/c55$c;->v(F)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public k(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c55;->a:Ll/c55$c;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/c55$c;->z(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public l(I)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/high16 p1, 0x41400000    # 12.0f

    .line 4
    .line 5
    const/high16 v0, 0x40c00000    # 6.0f

    .line 6
    .line 7
    const/high16 v1, 0x41300000    # 11.0f

    .line 8
    .line 9
    const/high16 v2, 0x40400000    # 3.0f

    .line 10
    .line 11
    invoke-virtual {p0, v1, v2, p1, v0}, Ll/c55;->i(FFFF)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/high16 p1, 0x41200000    # 10.0f

    .line 16
    .line 17
    const/high16 v0, 0x40a00000    # 5.0f

    .line 18
    .line 19
    const/high16 v1, 0x40f00000    # 7.5f

    .line 20
    .line 21
    const/high16 v2, 0x40200000    # 2.5f

    .line 22
    .line 23
    invoke-virtual {p0, v1, v2, p1, v0}, Ll/c55;->i(FFFF)V

    .line 24
    .line 25
    .line 26
    :goto_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final m()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/c55;->a:Ll/c55$c;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    new-array v1, v1, [F

    .line 5
    .line 6
    fill-array-data v1, :array_0

    .line 7
    .line 8
    .line 9
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ll/c55$a;

    .line 14
    .line 15
    invoke-direct {v2, p0, v0}, Ll/c55$a;-><init>(Ll/c55;Ll/c55$c;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 19
    .line 20
    .line 21
    const/4 v2, -0x1

    .line 22
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 23
    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 27
    .line 28
    .line 29
    sget-object v2, Ll/c55;->g:Landroid/view/animation/Interpolator;

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 32
    .line 33
    .line 34
    new-instance v2, Ll/c55$b;

    .line 35
    .line 36
    invoke-direct {v2, p0, v0}, Ll/c55$b;-><init>(Ll/c55;Ll/c55$c;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 40
    .line 41
    .line 42
    iput-object v1, p0, Ll/c55;->d:Landroid/animation/Animator;

    .line 43
    .line 44
    return-void

    .line 45
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public n(FLl/c55$c;)V
    .locals 2

    .line 1
    const/high16 v0, 0x3f400000    # 0.75f

    .line 2
    .line 3
    cmpl-float v1, p1, v0

    .line 4
    .line 5
    if-lez v1, :cond_0

    .line 6
    .line 7
    sub-float/2addr p1, v0

    .line 8
    const/high16 v0, 0x3e800000    # 0.25f

    .line 9
    .line 10
    div-float/2addr p1, v0

    .line 11
    invoke-virtual {p2}, Ll/c55$c;->h()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p2}, Ll/c55$c;->e()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {p0, p1, v0, v1}, Ll/c55;->c(FII)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-virtual {p2, p0}, Ll/c55$c;->r(I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p2}, Ll/c55$c;->h()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    invoke-virtual {p2, p0}, Ll/c55$c;->r(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public setAlpha(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c55;->a:Ll/c55$c;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/c55$c;->n(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c55;->a:Ll/c55$c;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/c55$c;->s(Landroid/graphics/ColorFilter;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public start()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/c55;->d:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/c55;->a:Ll/c55$c;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/c55$c;->A()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/c55;->a:Ll/c55$c;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/c55$c;->d()F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Ll/c55;->a:Ll/c55$c;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/c55$c;->g()F

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    cmpl-float v0, v0, v1

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    iput-boolean v0, p0, Ll/c55;->f:Z

    .line 29
    .line 30
    iget-object v0, p0, Ll/c55;->d:Landroid/animation/Animator;

    .line 31
    .line 32
    const-wide/16 v1, 0x29a

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/c55;->d:Landroid/animation/Animator;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    iget-object v0, p0, Ll/c55;->a:Ll/c55$c;

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-virtual {v0, v1}, Ll/c55$c;->t(I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/c55;->a:Ll/c55$c;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/c55$c;->m()V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/c55;->d:Landroid/animation/Animator;

    .line 55
    .line 56
    const-wide/16 v1, 0x534

    .line 57
    .line 58
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Ll/c55;->d:Landroid/animation/Animator;

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public stop()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c55;->d:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Ll/c55;->h(F)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/c55;->a:Ll/c55$c;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Ll/c55$c;->x(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/c55;->a:Ll/c55$c;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/c55$c;->t(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/c55;->a:Ll/c55$c;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/c55$c;->m()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    .line 27
    .line 28
    .line 29
    return-void
.end method
