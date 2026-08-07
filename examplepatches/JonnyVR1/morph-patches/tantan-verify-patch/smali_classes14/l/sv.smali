.class public Ll/sv;
.super Ll/lu;
.source "SourceFile"


# instance fields
.field public c:Landroid/animation/ValueAnimator;

.field public d:F

.field public e:[Landroid/view/View;

.field public f:Ll/qow;

.field public g:Landroid/view/View;

.field public h:Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/lu;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/sv;->d:F

    .line 6
    .line 7
    new-instance v0, Ll/sv$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/sv$a;-><init>(Ll/sv;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/sv;->h:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    .line 13
    .line 14
    return-void
.end method

.method public static bridge synthetic k(Ll/sv;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sv;->g:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic l(Ll/sv;)F
    .locals 0

    .line 1
    iget p0, p0, Ll/sv;->d:F

    return p0
.end method

.method public static bridge synthetic m(Ll/sv;)[Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sv;->e:[Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic n(Ll/sv;F[Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/sv;->r(F[Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public b()V
    .locals 2

    .line 1
    const/high16 v0, 0x42b40000    # 90.0f

    .line 2
    .line 3
    const/high16 v1, -0x3d4c0000    # -90.0f

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ll/sv;->s(FF)V

    .line 6
    .line 7
    .line 8
    iput v1, p0, Ll/sv;->d:F

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/sv;->p()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    const/high16 v0, -0x3d4c0000    # -90.0f

    .line 2
    .line 3
    const/high16 v1, 0x42b40000    # 90.0f

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ll/sv;->s(FF)V

    .line 6
    .line 7
    .line 8
    iput v1, p0, Ll/sv;->d:F

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/sv;->p()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public d()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x3e8

    .line 2
    .line 3
    return-wide v0
.end method

.method public h()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/high16 v1, 0x42b40000    # 90.0f

    .line 3
    .line 4
    invoke-virtual {p0, v0, v1}, Ll/sv;->s(FF)V

    .line 5
    .line 6
    .line 7
    iput v1, p0, Ll/sv;->d:F

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/sv;->p()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    iget v0, p0, Ll/sv;->d:F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Ll/sv;->s(FF)V

    .line 5
    .line 6
    .line 7
    iput v1, p0, Ll/sv;->d:F

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/sv;->p()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public j()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/high16 v1, -0x3d4c0000    # -90.0f

    .line 3
    .line 4
    invoke-virtual {p0, v0, v1}, Ll/sv;->s(FF)V

    .line 5
    .line 6
    .line 7
    iput v1, p0, Ll/sv;->d:F

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/sv;->p()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final o()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sv;->c:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/sv;->c:Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    iget-object v1, p0, Ll/sv;->h:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/sv;->c:Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    new-instance v1, Ll/sv$b;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/sv$b;-><init>(Ll/sv;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final p()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sv;->f:Ll/qow;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget v0, p0, Ll/sv;->d:F

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    cmpl-float v1, v0, v1

    .line 13
    .line 14
    iget-object p0, p0, Ll/sv;->f:Ll/qow;

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, v0}, Ll/qow;->W(I)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const/high16 v1, 0x43340000    # 180.0f

    .line 24
    .line 25
    add-float/2addr v0, v1

    .line 26
    float-to-int v0, v0

    .line 27
    invoke-virtual {p0, v0}, Ll/qow;->W(I)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public q(Ll/qow;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sv;->f:Ll/qow;

    .line 2
    .line 3
    return-void
.end method

.method public final r(F[Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    array-length p0, p2

    .line 8
    if-lez p0, :cond_1

    .line 9
    .line 10
    array-length p0, p2

    .line 11
    const/4 v0, 0x0

    .line 12
    :goto_0
    if-ge v0, p0, :cond_1

    .line 13
    .line 14
    aget-object v1, p2, v0

    .line 15
    .line 16
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1, p1}, Landroid/view/View;->setRotation(F)V

    .line 23
    .line 24
    .line 25
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    return-void
.end method

.method public final s(FF)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/sv;->o()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/sv;->c:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    new-array v1, v1, [F

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    aput p1, v1, v2

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    aput p2, v1, p1

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/sv;->c:Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    const-wide/16 v0, 0xc8

    .line 21
    .line 22
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/sv;->c:Landroid/animation/ValueAnimator;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 28
    .line 29
    .line 30
    return-void
.end method
