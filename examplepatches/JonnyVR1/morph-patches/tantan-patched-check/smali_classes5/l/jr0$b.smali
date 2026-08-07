.class public Ll/jr0$b;
.super Landroid/view/animation/Animation;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jr0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:F

.field public b:F

.field public final c:Z

.field public final d:Z

.field public e:Landroid/graphics/Camera;


# direct methods
.method public constructor <init>(ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/jr0$b;->c:Z

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/jr0$b;->d:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(F)F
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/jr0$b;->c:Z

    .line 2
    .line 3
    iget-boolean p0, p0, Ll/jr0$b;->d:Z

    .line 4
    .line 5
    const/high16 v1, 0x42b40000    # 90.0f

    .line 6
    .line 7
    const/high16 v2, -0x3d4c0000    # -90.0f

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    const/high16 v0, 0x3f800000    # 1.0f

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sub-float/2addr v0, p1

    .line 16
    mul-float/2addr v0, v2

    .line 17
    return v0

    .line 18
    :cond_0
    sub-float/2addr v0, p1

    .line 19
    mul-float/2addr v0, v1

    .line 20
    return v0

    .line 21
    :cond_1
    if-eqz p0, :cond_2

    .line 22
    .line 23
    mul-float/2addr p1, v1

    .line 24
    return p1

    .line 25
    :cond_2
    mul-float/2addr p1, v2

    .line 26
    return p1
.end method

.method public applyTransformation(FLandroid/view/animation/Transformation;)V
    .locals 3

    .line 1
    iget v0, p0, Ll/jr0$b;->a:F

    .line 2
    .line 3
    iget v1, p0, Ll/jr0$b;->b:F

    .line 4
    .line 5
    iget-object v2, p0, Ll/jr0$b;->e:Landroid/graphics/Camera;

    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {v2}, Landroid/graphics/Camera;->save()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/jr0$b;->a(F)F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-virtual {v2, p0}, Landroid/graphics/Camera;->rotateX(F)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2, p2}, Landroid/graphics/Camera;->getMatrix(Landroid/graphics/Matrix;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2}, Landroid/graphics/Camera;->restore()V

    .line 25
    .line 26
    .line 27
    neg-float p0, v0

    .line 28
    neg-float p1, v1

    .line 29
    invoke-virtual {p2, p0, p1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2, v0, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public initialize(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/animation/Animation;->initialize(IIII)V

    .line 2
    .line 3
    .line 4
    new-instance p3, Landroid/graphics/Camera;

    .line 5
    .line 6
    invoke-direct {p3}, Landroid/graphics/Camera;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p3, p0, Ll/jr0$b;->e:Landroid/graphics/Camera;

    .line 10
    .line 11
    int-to-float p1, p1

    .line 12
    const/high16 p3, 0x40000000    # 2.0f

    .line 13
    .line 14
    div-float/2addr p1, p3

    .line 15
    iput p1, p0, Ll/jr0$b;->a:F

    .line 16
    .line 17
    int-to-float p1, p2

    .line 18
    div-float/2addr p1, p3

    .line 19
    iput p1, p0, Ll/jr0$b;->b:F

    .line 20
    .line 21
    return-void
.end method
