.class Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;
.super Landroid/widget/ImageView;
.source "SourceFile"

# interfaces
.implements Ll/zm50;
.implements Ll/dw5;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor",
        "AppCompatCustomView"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;,
        Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;,
        Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$c;
    }
.end annotation


# instance fields
.field public a:Landroid/graphics/Matrix;

.field public b:Ll/phx;

.field public c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;

.field public d:Landroid/graphics/RectF;

.field public e:Landroid/graphics/RectF;

.field public f:Landroid/graphics/RectF;

.field public g:Ll/km50;

.field public h:Ll/wvb;

.field public i:Z

.field public j:Ll/mhx;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/wvb;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/mhx;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/mhx;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->j:Ll/mhx;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->A(Ll/wvb;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->D()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->C(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->d:Landroid/graphics/RectF;

    return-object p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)Ll/wvb;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->h:Ll/wvb;

    return-object p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->e:Landroid/graphics/RectF;

    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    return-object p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->i:Z

    return p0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)Ll/phx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->b:Ll/phx;

    return-object p0
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->q()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)F
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->s()F

    move-result p0

    return p0
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;FFF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->M(FFF)V

    return-void
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;FF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->R(FF)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->S()V

    return-void
.end method


# virtual methods
.method public final A(Ll/wvb;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->h:Ll/wvb;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ll/wvb;->a(Ll/dw5;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Landroid/graphics/RectF;

    .line 7
    .line 8
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->e:Landroid/graphics/RectF;

    .line 12
    .line 13
    new-instance p1, Landroid/graphics/RectF;

    .line 14
    .line 15
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->d:Landroid/graphics/RectF;

    .line 19
    .line 20
    new-instance p1, Landroid/graphics/RectF;

    .line 21
    .line 22
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->f:Landroid/graphics/RectF;

    .line 26
    .line 27
    new-instance p1, Ll/phx;

    .line 28
    .line 29
    invoke-direct {p1}, Ll/phx;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->b:Ll/phx;

    .line 33
    .line 34
    new-instance p1, Landroid/graphics/Matrix;

    .line 35
    .line 36
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    .line 40
    .line 41
    sget-object p1, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 44
    .line 45
    .line 46
    new-instance p1, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;

    .line 47
    .line 48
    invoke-direct {p1, p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)V

    .line 49
    .line 50
    .line 51
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;

    .line 52
    .line 53
    return-void
.end method

.method public B()Z
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->f:Landroid/graphics/RectF;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Landroid/graphics/Matrix;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 19
    .line 20
    .line 21
    new-instance v1, Landroid/graphics/RectF;

    .line 22
    .line 23
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->f:Landroid/graphics/RectF;

    .line 24
    .line 25
    invoke-direct {v1, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 29
    .line 30
    .line 31
    iget v0, v1, Landroid/graphics/RectF;->left:F

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->d:Landroid/graphics/RectF;

    .line 34
    .line 35
    iget v2, p0, Landroid/graphics/RectF;->left:F

    .line 36
    .line 37
    sub-float/2addr v0, v2

    .line 38
    const v2, 0x3dcccccd    # 0.1f

    .line 39
    .line 40
    .line 41
    cmpl-float v0, v0, v2

    .line 42
    .line 43
    if-gtz v0, :cond_1

    .line 44
    .line 45
    iget v0, v1, Landroid/graphics/RectF;->top:F

    .line 46
    .line 47
    iget v3, p0, Landroid/graphics/RectF;->top:F

    .line 48
    .line 49
    sub-float/2addr v0, v3

    .line 50
    cmpl-float v0, v0, v2

    .line 51
    .line 52
    if-gtz v0, :cond_1

    .line 53
    .line 54
    iget v0, v1, Landroid/graphics/RectF;->right:F

    .line 55
    .line 56
    iget v2, p0, Landroid/graphics/RectF;->right:F

    .line 57
    .line 58
    sub-float/2addr v0, v2

    .line 59
    const v2, -0x42333333    # -0.1f

    .line 60
    .line 61
    .line 62
    cmpg-float v0, v0, v2

    .line 63
    .line 64
    if-ltz v0, :cond_1

    .line 65
    .line 66
    iget v0, v1, Landroid/graphics/RectF;->bottom:F

    .line 67
    .line 68
    iget p0, p0, Landroid/graphics/RectF;->bottom:F

    .line 69
    .line 70
    sub-float/2addr v0, p0

    .line 71
    cmpg-float p0, v0, v2

    .line 72
    .line 73
    if-gez p0, :cond_0

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    const/4 p0, 0x0

    .line 77
    return p0

    .line 78
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 79
    return p0
.end method

.method public final synthetic C(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Landroid/graphics/Matrix;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->S()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic D()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->h:Ll/wvb;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wvb;->l()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->i:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    :goto_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->r(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public E()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->S()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    int-to-float v0, v0

    .line 9
    const/high16 v1, 0x40000000    # 2.0f

    .line 10
    .line 11
    div-float/2addr v0, v1

    .line 12
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->e:Landroid/graphics/RectF;

    .line 13
    .line 14
    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    sub-float/2addr v0, v2

    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    int-to-float v2, v2

    .line 24
    div-float/2addr v2, v1

    .line 25
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->e:Landroid/graphics/RectF;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    sub-float/2addr v2, v1

    .line 32
    invoke-virtual {p0, v0, v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->R(FF)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public F(Landroid/graphics/RectF;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->S()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    int-to-float v0, v0

    .line 9
    const/high16 v1, 0x40000000    # 2.0f

    .line 10
    .line 11
    div-float/2addr v0, v1

    .line 12
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    sub-float/2addr v0, v2

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    int-to-float v2, v2

    .line 22
    div-float/2addr v2, v1

    .line 23
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    sub-float/2addr v2, p1

    .line 28
    invoke-virtual {p0, v0, v2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->R(FF)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public G()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->g:Ll/km50;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/RectF;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->e:Landroid/graphics/RectF;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    const/4 v3, 0x0

    .line 21
    invoke-static {v3, v3, v1, v2, v0}, Ll/gwb;->c(IIIILandroid/graphics/RectF;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->g:Ll/km50;

    .line 25
    .line 26
    invoke-interface {p0, v0}, Ll/km50;->b(Landroid/graphics/RectF;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final H()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->S()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->E()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->h:Ll/wvb;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/wvb;->k()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/high16 v1, -0x40800000    # -1.0f

    .line 14
    .line 15
    cmpl-float v0, v0, v1

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$a;->a:[I

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->h:Ll/wvb;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/wvb;->h()Lcom/p1/mobile/android/ui/cropiwa/config/InitialPosition;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    aget v0, v0, v1

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    if-eq v0, v1, :cond_1

    .line 35
    .line 36
    const/4 v1, 0x2

    .line 37
    if-eq v0, v1, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->I()V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->J()V

    .line 45
    .line 46
    .line 47
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->h:Ll/wvb;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->s()F

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    invoke-virtual {v0, v1}, Ll/wvb;->v(F)Ll/wvb;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Ll/wvb;->b()V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->h:Ll/wvb;

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/wvb;->k()F

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->Q(F)V

    .line 68
    .line 69
    .line 70
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->G()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final I()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->w()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->t()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-ge v0, v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-float v0, v0

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->t()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    :goto_0
    int-to-float v1, v1

    .line 21
    div-float/2addr v0, v1

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    int-to-float v0, v0

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->w()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    goto :goto_0

    .line 33
    :goto_1
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->L(F)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final J()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-ge v0, v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-float v0, v0

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->t()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    :goto_0
    int-to-float v1, v1

    .line 21
    div-float/2addr v0, v1

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    int-to-float v0, v0

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->w()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    goto :goto_0

    .line 33
    :goto_1
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->L(F)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public K(F)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->e:Landroid/graphics/RectF;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->e:Landroid/graphics/RectF;

    .line 10
    .line 11
    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-virtual {v0, p1, v1, v2}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->S()V

    .line 24
    .line 25
    .line 26
    const/4 p1, 0x0

    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->r(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final L(F)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->S()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->e:Landroid/graphics/RectF;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->e:Landroid/graphics/RectF;

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->M(FFF)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final M(FFF)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p1, p2, p3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->S()V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->b:Ll/phx;

    .line 15
    .line 16
    iget-object p2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Ll/phx;->c(Landroid/graphics/Matrix;)F

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iget-object p2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->b:Ll/phx;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    .line 29
    .line 30
    invoke-virtual {p2, p0}, Ll/phx;->b(Landroid/graphics/Matrix;)F

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    sget-object p1, Ll/phx;->b:Lrx/subjects/b;

    .line 43
    .line 44
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p1, p0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public N(Ll/km50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->g:Ll/km50;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->z()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->S()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->G()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public O(Landroid/graphics/Matrix;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->j:Ll/mhx;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/mhx;->c()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->getImageMatrix()Landroid/graphics/Matrix;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public P(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->i:Z

    .line 2
    .line 3
    return-void
.end method

.method public final Q(F)V
    .locals 2
    .param p1    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.009999999776482582
            to = 1.0
        .end annotation
    .end param

    .line 1
    const v0, 0x3c23d70a    # 0.01f

    .line 2
    .line 3
    .line 4
    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    const/high16 v0, 0x3f800000    # 1.0f

    .line 9
    .line 10
    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->h:Ll/wvb;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/wvb;->j()F

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->h:Ll/wvb;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/wvb;->i()F

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    mul-float/2addr v1, p1

    .line 27
    add-float/2addr v0, v1

    .line 28
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->b:Ll/phx;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Ll/phx;->c(Landroid/graphics/Matrix;)F

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    div-float/2addr v0, p1

    .line 37
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->L(F)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final R(FF)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 9
    .line 10
    .line 11
    const v0, 0x3c23d70a    # 0.01f

    .line 12
    .line 13
    .line 14
    cmpl-float p1, p1, v0

    .line 15
    .line 16
    if-gtz p1, :cond_1

    .line 17
    .line 18
    cmpl-float p1, p2, v0

    .line 19
    .line 20
    if-lez p1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void

    .line 24
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->S()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final S()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->f:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->y()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    int-to-float v1, v1

    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->x()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    int-to-float v2, v2

    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->e:Landroid/graphics/RectF;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->f:Landroid/graphics/RectF;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->e:Landroid/graphics/RectF;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public a()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->s()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->h:Ll/wvb;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/wvb;->k()F

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sub-float/2addr v0, v1

    .line 12
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const v1, 0x3a83126f    # 0.001f

    .line 17
    .line 18
    .line 19
    cmpl-float v0, v0, v1

    .line 20
    .line 21
    if-lez v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->h:Ll/wvb;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/wvb;->k()F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->Q(F)V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->r(Z)V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->h:Ll/wvb;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/wvb;->e()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public b(Landroid/graphics/RectF;Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->S()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->d:Landroid/graphics/RectF;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->z()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->r(Z)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance p1, Lcom/p1/mobile/android/ui/cropiwa/a;

    .line 23
    .line 24
    invoke-direct {p1, p0}, Lcom/p1/mobile/android/ui/cropiwa/a;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 28
    .line 29
    .line 30
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->S()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public c(FFF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->M(FFF)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->h:Ll/wvb;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->s()F

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-virtual {p1, p0}, Ll/wvb;->v(F)Ll/wvb;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/wvb;->b()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public getImageMatrix()Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/ImageView;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->h:Ll/wvb;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/wvb;->w()Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->z()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->H()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final q()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->i:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->r(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final r(Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->S()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->f:Landroid/graphics/RectF;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->d:Landroid/graphics/RectF;

    .line 9
    .line 10
    invoke-static {v0, v1, v2}, Ll/phx;->a(Landroid/graphics/RectF;Landroid/graphics/Matrix;Landroid/graphics/RectF;)Landroid/graphics/Matrix;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->j:Ll/mhx;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    .line 19
    .line 20
    new-instance v2, Lcom/p1/mobile/android/ui/cropiwa/b;

    .line 21
    .line 22
    invoke-direct {v2, p0}, Lcom/p1/mobile/android/ui/cropiwa/b;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, p1, v0, v2}, Ll/mhx;->b(Landroid/graphics/Matrix;Landroid/graphics/Matrix;Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {v1}, Ll/mhx;->c()V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final s()F
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->b:Ll/phx;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->a:Landroid/graphics/Matrix;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/phx;->c(Landroid/graphics/Matrix;)F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->h:Ll/wvb;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/wvb;->j()F

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    sub-float/2addr v0, v1

    .line 16
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->h:Ll/wvb;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/wvb;->i()F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    div-float/2addr v0, p0

    .line 23
    const p0, 0x3c23d70a    # 0.01f

    .line 24
    .line 25
    .line 26
    add-float/2addr v0, p0

    .line 27
    const/high16 v1, 0x3f800000    # 1.0f

    .line 28
    .line 29
    invoke-static {v0, p0, v1}, Ll/gwb;->a(FFF)F

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0
.end method

.method public t()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->e:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    float-to-int p0, p0

    .line 8
    return p0
.end method

.method public u()Landroid/graphics/RectF;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->S()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/RectF;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->e:Landroid/graphics/RectF;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public v()Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public w()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->e:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    float-to-int p0, p0

    .line 8
    return p0
.end method

.method public x()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, -0x1

    .line 13
    return p0
.end method

.method public y()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, -0x1

    .line 13
    return p0
.end method

.method public z()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->y()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->x()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eq p0, v1, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method
