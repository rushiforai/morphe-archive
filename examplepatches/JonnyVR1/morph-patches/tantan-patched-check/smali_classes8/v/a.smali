.class public Lv/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv/a$b;
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/view/View;

.field public c:Ljava/lang/String;

.field public d:F

.field public e:F

.field public f:F

.field public g:F

.field public h:F

.field public i:F

.field public j:F

.field public k:F

.field public l:F

.field public m:F

.field public n:F

.field public o:F

.field public p:F

.field public q:F

.field public r:Z

.field public s:F

.field public t:F

.field public u:F

.field public v:F

.field public w:F

.field public x:F

.field public y:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lv/a;->c:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v0, Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lv/a;->y:Landroid/graphics/Rect;

    .line 13
    .line 14
    iput-object p1, p0, Lv/a;->a:Landroid/view/View;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Lv/a$b;Landroid/view/View;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    instance-of v0, p1, Lv/a$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lv/a$b;

    .line 7
    .line 8
    invoke-interface {v0}, Lv/a$b;->k()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-interface {p0}, Lv/a$b;->k()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {v0}, Lv/a$b;->k()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {p0}, Lv/a$b;->k()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    new-instance p0, Landroid/graphics/Rect;

    .line 35
    .line 36
    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, p0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 49
    .line 50
    return-object p0
.end method

.method public static synthetic b(Lv/a;ZFLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lv/a;->t(ZFLandroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic c(Lv/a;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/a;->s(Z)V

    return-void
.end method

.method public static bridge synthetic d(Lv/a;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/a;->b:Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic e(Lv/a;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/a;->r:Z

    return-void
.end method

.method public static bridge synthetic f(Lv/a;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/a;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final A(F)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/bnl0;->S(F)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lv/a;->a:Landroid/view/View;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lv/a;->a:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public B(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/a;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final C()I
    .locals 6

    .line 1
    invoke-virtual {p0}, Lv/a;->v()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lv/a;->u()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    cmpl-float v0, v0, v1

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    const/4 v2, 0x0

    .line 13
    const/4 v3, 0x2

    .line 14
    if-lez v0, :cond_2

    .line 15
    .line 16
    iget v0, p0, Lv/a;->l:F

    .line 17
    .line 18
    iget v4, p0, Lv/a;->m:F

    .line 19
    .line 20
    cmpl-float v5, v0, v4

    .line 21
    .line 22
    if-lez v5, :cond_0

    .line 23
    .line 24
    return v3

    .line 25
    :cond_0
    div-float/2addr v4, v0

    .line 26
    invoke-virtual {p0}, Lv/a;->m()F

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual {p0}, Lv/a;->n()F

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    div-float/2addr v0, p0

    .line 35
    cmpg-float p0, v4, v0

    .line 36
    .line 37
    if-gez p0, :cond_1

    .line 38
    .line 39
    return v2

    .line 40
    :cond_1
    return v1

    .line 41
    :cond_2
    iget v0, p0, Lv/a;->m:F

    .line 42
    .line 43
    iget v4, p0, Lv/a;->l:F

    .line 44
    .line 45
    cmpl-float v5, v0, v4

    .line 46
    .line 47
    if-lez v5, :cond_4

    .line 48
    .line 49
    div-float/2addr v0, v4

    .line 50
    invoke-virtual {p0}, Lv/a;->m()F

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    invoke-virtual {p0}, Lv/a;->n()F

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    div-float/2addr v3, p0

    .line 59
    cmpg-float p0, v0, v3

    .line 60
    .line 61
    if-gez p0, :cond_3

    .line 62
    .line 63
    return v2

    .line 64
    :cond_3
    return v1

    .line 65
    :cond_4
    return v3
.end method

.method public final D(Z)Landroid/animation/ValueAnimator;
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lv/a;->r:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lv/a;->x()F

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lv/a;->a:Landroid/view/View;

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/view/View;->getTranslationX()F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iput v1, p0, Lv/a;->p:F

    .line 17
    .line 18
    iget-object v1, p0, Lv/a;->a:Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/view/View;->getTranslationY()F

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    iput v1, p0, Lv/a;->q:F

    .line 25
    .line 26
    iget-object v1, p0, Lv/a;->a:Landroid/view/View;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroid/view/View;->getScaleX()F

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    iput v1, p0, Lv/a;->x:F

    .line 33
    .line 34
    :cond_0
    iget v1, p0, Lv/a;->j:F

    .line 35
    .line 36
    iget v2, p0, Lv/a;->h:F

    .line 37
    .line 38
    const/high16 v3, 0x40000000    # 2.0f

    .line 39
    .line 40
    div-float/2addr v2, v3

    .line 41
    add-float/2addr v1, v2

    .line 42
    invoke-virtual {p0}, Lv/a;->n()F

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    div-float/2addr v2, v3

    .line 47
    sub-float/2addr v1, v2

    .line 48
    iput v1, p0, Lv/a;->n:F

    .line 49
    .line 50
    iget v1, p0, Lv/a;->k:F

    .line 51
    .line 52
    iget v2, p0, Lv/a;->i:F

    .line 53
    .line 54
    div-float/2addr v2, v3

    .line 55
    add-float/2addr v1, v2

    .line 56
    invoke-virtual {p0}, Lv/a;->m()F

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    div-float/2addr v2, v3

    .line 61
    sub-float/2addr v1, v2

    .line 62
    iput v1, p0, Lv/a;->o:F

    .line 63
    .line 64
    iget-object v1, p0, Lv/a;->a:Landroid/view/View;

    .line 65
    .line 66
    invoke-virtual {p0}, Lv/a;->n()F

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    div-float/2addr v2, v3

    .line 71
    invoke-virtual {v1, v2}, Landroid/view/View;->setPivotX(F)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Lv/a;->a:Landroid/view/View;

    .line 75
    .line 76
    invoke-virtual {p0}, Lv/a;->m()F

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    div-float/2addr v2, v3

    .line 81
    invoke-virtual {v1, v2}, Landroid/view/View;->setPivotY(F)V

    .line 82
    .line 83
    .line 84
    const/4 v1, 0x2

    .line 85
    new-array v1, v1, [F

    .line 86
    .line 87
    fill-array-data v1, :array_0

    .line 88
    .line 89
    .line 90
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    const-wide/16 v2, 0xb4

    .line 95
    .line 96
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    new-instance v2, Ll/syh0;

    .line 101
    .line 102
    invoke-direct {v2, p0, p1, v0}, Ll/syh0;-><init>(Lv/a;ZF)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 106
    .line 107
    .line 108
    new-instance v0, Lv/a$a;

    .line 109
    .line 110
    invoke-direct {v0, p0, p1}, Lv/a$a;-><init>(Lv/a;Z)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 114
    .line 115
    .line 116
    return-object v1

    .line 117
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final E(ZLandroid/view/ViewGroup;)Landroid/animation/ValueAnimator;
    .locals 3

    .line 1
    iget-object v0, p0, Lv/a;->a:Landroid/view/View;

    .line 2
    .line 3
    check-cast v0, Lv/a$b;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p2}, Lv/a;->h(Lv/a$b;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iput-object p2, p0, Lv/a;->b:Landroid/view/View;

    .line 10
    .line 11
    iget-object v0, p0, Lv/a;->a:Landroid/view/View;

    .line 12
    .line 13
    instance-of v0, v0, Lv/a$b;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    invoke-static {p2}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    iget v0, p2, Ll/bnl0$g;->c:I

    .line 24
    .line 25
    int-to-float v0, v0

    .line 26
    iput v0, p0, Lv/a;->h:F

    .line 27
    .line 28
    iget v0, p2, Ll/bnl0$g;->d:I

    .line 29
    .line 30
    int-to-float v0, v0

    .line 31
    iput v0, p0, Lv/a;->i:F

    .line 32
    .line 33
    iget v0, p2, Ll/bnl0$g;->a:I

    .line 34
    .line 35
    int-to-float v0, v0

    .line 36
    iput v0, p0, Lv/a;->j:F

    .line 37
    .line 38
    iget p2, p2, Ll/bnl0$g;->b:I

    .line 39
    .line 40
    invoke-static {}, Ll/bnl0;->F0()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    sub-int/2addr p2, v0

    .line 45
    int-to-float p2, p2

    .line 46
    iput p2, p0, Lv/a;->k:F

    .line 47
    .line 48
    iget-object p2, p0, Lv/a;->b:Landroid/view/View;

    .line 49
    .line 50
    new-instance v0, Ll/qyh0;

    .line 51
    .line 52
    invoke-direct {v0, p0, p1}, Ll/qyh0;-><init>(Lv/a;Z)V

    .line 53
    .line 54
    .line 55
    const-wide/16 v1, 0xa

    .line 56
    .line 57
    invoke-virtual {p2, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p1}, Lv/a;->D(Z)Landroid/animation/ValueAnimator;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :cond_0
    const/4 p0, 0x0

    .line 66
    return-object p0
.end method

.method public F()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/a;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public G(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0, p1}, Lv/a;->E(ZLandroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public H(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1}, Lv/a;->E(ZLandroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public g(Landroid/graphics/Canvas;)V
    .locals 3
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-boolean v0, p0, Lv/a;->r:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lv/a;->s:F

    .line 6
    .line 7
    iget v1, p0, Lv/a;->t:F

    .line 8
    .line 9
    iget v2, p0, Lv/a;->u:F

    .line 10
    .line 11
    iget p0, p0, Lv/a;->v:F

    .line 12
    .line 13
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->clipRect(FFFF)Z

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final h(Lv/a$b;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    new-instance p0, Ll/ryh0;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/ryh0;-><init>(Lv/a$b;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2, p0}, Ll/bnl0;->q(Landroid/view/ViewGroup;Ll/qcj;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public i()F
    .locals 0

    .line 1
    iget p0, p0, Lv/a;->m:F

    .line 2
    .line 3
    return p0
.end method

.method public j()F
    .locals 0

    .line 1
    iget p0, p0, Lv/a;->l:F

    .line 2
    .line 3
    return p0
.end method

.method public final k()F
    .locals 2

    .line 1
    invoke-virtual {p0}, Lv/a;->C()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lv/a;->m()F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Lv/a;->n()F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p0}, Lv/a;->u()F

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    div-float/2addr v0, p0

    .line 22
    return v0
.end method

.method public final l()F
    .locals 2

    .line 1
    invoke-virtual {p0}, Lv/a;->C()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lv/a;->m()F

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0}, Lv/a;->u()F

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    mul-float/2addr v0, p0

    .line 17
    return v0

    .line 18
    :cond_0
    invoke-virtual {p0}, Lv/a;->n()F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public final m()F
    .locals 0

    .line 1
    iget-object p0, p0, Lv/a;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    int-to-float p0, p0

    .line 8
    return p0
.end method

.method public final n()F
    .locals 0

    .line 1
    iget-object p0, p0, Lv/a;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    int-to-float p0, p0

    .line 8
    return p0
.end method

.method public final o(FF)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lv/a;->C()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x40000000    # 2.0f

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lv/a;->k()F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p0}, Lv/a;->v()F

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    div-float/2addr v0, v3

    .line 19
    invoke-virtual {p0}, Lv/a;->u()F

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    mul-float/2addr v0, v3

    .line 24
    invoke-virtual {p0}, Lv/a;->m()F

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    sub-float/2addr v3, v0

    .line 29
    mul-float/2addr v3, p1

    .line 30
    add-float/2addr v0, v3

    .line 31
    iput v0, p0, Lv/a;->g:F

    .line 32
    .line 33
    invoke-virtual {p0}, Lv/a;->n()F

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput v0, p0, Lv/a;->e:F

    .line 38
    .line 39
    iput v2, p0, Lv/a;->d:F

    .line 40
    .line 41
    invoke-virtual {p0}, Lv/a;->m()F

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iget v2, p0, Lv/a;->g:F

    .line 46
    .line 47
    sub-float/2addr v0, v2

    .line 48
    div-float/2addr v0, v1

    .line 49
    iput v0, p0, Lv/a;->f:F

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    invoke-virtual {p0}, Lv/a;->C()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    const/4 v3, 0x1

    .line 57
    if-ne v0, v3, :cond_1

    .line 58
    .line 59
    invoke-virtual {p0}, Lv/a;->l()F

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    invoke-virtual {p0}, Lv/a;->v()F

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    div-float/2addr v0, v3

    .line 68
    invoke-virtual {p0}, Lv/a;->m()F

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    sub-float/2addr v3, v0

    .line 73
    mul-float/2addr v3, p1

    .line 74
    add-float/2addr v0, v3

    .line 75
    iput v0, p0, Lv/a;->g:F

    .line 76
    .line 77
    invoke-virtual {p0}, Lv/a;->n()F

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    iput v0, p0, Lv/a;->e:F

    .line 82
    .line 83
    iput v2, p0, Lv/a;->d:F

    .line 84
    .line 85
    invoke-virtual {p0}, Lv/a;->m()F

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    iget v2, p0, Lv/a;->g:F

    .line 90
    .line 91
    sub-float/2addr v0, v2

    .line 92
    div-float/2addr v0, v1

    .line 93
    iput v0, p0, Lv/a;->f:F

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_1
    invoke-virtual {p0}, Lv/a;->C()I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    const/4 v3, 0x2

    .line 101
    if-ne v0, v3, :cond_2

    .line 102
    .line 103
    invoke-virtual {p0}, Lv/a;->k()F

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    invoke-virtual {p0}, Lv/a;->v()F

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    mul-float/2addr v0, v3

    .line 112
    invoke-virtual {p0}, Lv/a;->n()F

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    sub-float/2addr v3, v0

    .line 117
    mul-float/2addr v3, p1

    .line 118
    add-float/2addr v0, v3

    .line 119
    iput v0, p0, Lv/a;->e:F

    .line 120
    .line 121
    invoke-virtual {p0}, Lv/a;->m()F

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    iput v0, p0, Lv/a;->g:F

    .line 126
    .line 127
    iput v2, p0, Lv/a;->f:F

    .line 128
    .line 129
    invoke-virtual {p0}, Lv/a;->n()F

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    iget v2, p0, Lv/a;->e:F

    .line 134
    .line 135
    sub-float/2addr v0, v2

    .line 136
    div-float/2addr v0, v1

    .line 137
    iput v0, p0, Lv/a;->d:F

    .line 138
    .line 139
    :cond_2
    :goto_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 140
    .line 141
    sub-float v1, v0, p2

    .line 142
    .line 143
    mul-float/2addr v1, p1

    .line 144
    add-float/2addr p2, v1

    .line 145
    iput p2, p0, Lv/a;->w:F

    .line 146
    .line 147
    invoke-virtual {p0, p2}, Lv/a;->A(F)V

    .line 148
    .line 149
    .line 150
    iget-object p2, p0, Lv/a;->a:Landroid/view/View;

    .line 151
    .line 152
    iget v1, p0, Lv/a;->n:F

    .line 153
    .line 154
    sub-float/2addr v0, p1

    .line 155
    mul-float/2addr v1, v0

    .line 156
    invoke-virtual {p2, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 157
    .line 158
    .line 159
    iget-object p2, p0, Lv/a;->a:Landroid/view/View;

    .line 160
    .line 161
    iget v1, p0, Lv/a;->o:F

    .line 162
    .line 163
    mul-float/2addr v1, v0

    .line 164
    invoke-virtual {p2, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 165
    .line 166
    .line 167
    iget p2, p0, Lv/a;->d:F

    .line 168
    .line 169
    iput p2, p0, Lv/a;->s:F

    .line 170
    .line 171
    iget v0, p0, Lv/a;->f:F

    .line 172
    .line 173
    iput v0, p0, Lv/a;->t:F

    .line 174
    .line 175
    iget v1, p0, Lv/a;->e:F

    .line 176
    .line 177
    add-float/2addr p2, v1

    .line 178
    iput p2, p0, Lv/a;->u:F

    .line 179
    .line 180
    iget p2, p0, Lv/a;->g:F

    .line 181
    .line 182
    add-float/2addr v0, p2

    .line 183
    iput v0, p0, Lv/a;->v:F

    .line 184
    .line 185
    invoke-virtual {p0, p1}, Lv/a;->p(F)V

    .line 186
    .line 187
    .line 188
    return-void
.end method

.method public final p(F)V
    .locals 9

    .line 1
    iget-object v0, p0, Lv/a;->b:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lv/a;->y:Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->getLocalVisibleRect(Landroid/graphics/Rect;)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lv/a;->y:Landroid/graphics/Rect;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    goto/16 :goto_2

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lv/a;->y:Landroid/graphics/Rect;

    .line 21
    .line 22
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 23
    .line 24
    iget v1, v0, Landroid/graphics/Rect;->right:I

    .line 25
    .line 26
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 27
    .line 28
    int-to-float v1, v1

    .line 29
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 30
    .line 31
    int-to-float v0, v0

    .line 32
    const/4 v2, 0x0

    .line 33
    cmpl-float v3, v1, v2

    .line 34
    .line 35
    iget v4, p0, Lv/a;->i:F

    .line 36
    .line 37
    const/4 v5, 0x1

    .line 38
    const/high16 v6, 0x40000000    # 2.0f

    .line 39
    .line 40
    const/4 v7, 0x2

    .line 41
    const/high16 v8, 0x3f800000    # 1.0f

    .line 42
    .line 43
    if-eqz v3, :cond_6

    .line 44
    .line 45
    div-float/2addr v1, v4

    .line 46
    invoke-virtual {p0}, Lv/a;->k()F

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    cmpl-float v3, p1, v8

    .line 51
    .line 52
    if-eqz v3, :cond_5

    .line 53
    .line 54
    invoke-virtual {p0}, Lv/a;->C()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-ne v3, v7, :cond_2

    .line 59
    .line 60
    invoke-virtual {p0}, Lv/a;->m()F

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    sub-float/2addr v2, v0

    .line 65
    div-float/2addr v2, v6

    .line 66
    mul-float/2addr v0, v1

    .line 67
    sub-float/2addr v8, p1

    .line 68
    mul-float/2addr v0, v8

    .line 69
    add-float/2addr v2, v0

    .line 70
    iput v2, p0, Lv/a;->t:F

    .line 71
    .line 72
    return-void

    .line 73
    :cond_2
    invoke-virtual {p0}, Lv/a;->C()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_3

    .line 78
    .line 79
    invoke-virtual {p0}, Lv/a;->k()F

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    invoke-virtual {p0}, Lv/a;->v()F

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    div-float/2addr v0, v2

    .line 88
    invoke-virtual {p0}, Lv/a;->u()F

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    mul-float/2addr v2, v0

    .line 93
    goto :goto_0

    .line 94
    :cond_3
    invoke-virtual {p0}, Lv/a;->C()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-ne v0, v5, :cond_4

    .line 99
    .line 100
    invoke-virtual {p0}, Lv/a;->l()F

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    invoke-virtual {p0}, Lv/a;->v()F

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    div-float v2, v0, v2

    .line 109
    .line 110
    :cond_4
    :goto_0
    mul-float/2addr v2, v1

    .line 111
    sub-float/2addr v8, p1

    .line 112
    mul-float/2addr v2, v8

    .line 113
    iget p1, p0, Lv/a;->f:F

    .line 114
    .line 115
    add-float/2addr p1, v2

    .line 116
    iput p1, p0, Lv/a;->t:F

    .line 117
    .line 118
    return-void

    .line 119
    :cond_5
    iget p1, p0, Lv/a;->f:F

    .line 120
    .line 121
    iput p1, p0, Lv/a;->t:F

    .line 122
    .line 123
    return-void

    .line 124
    :cond_6
    cmpl-float v1, v0, v4

    .line 125
    .line 126
    if-eqz v1, :cond_a

    .line 127
    .line 128
    sub-float v0, v4, v0

    .line 129
    .line 130
    div-float/2addr v0, v4

    .line 131
    invoke-virtual {p0}, Lv/a;->k()F

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    cmpl-float v3, p1, v8

    .line 136
    .line 137
    if-eqz v3, :cond_a

    .line 138
    .line 139
    invoke-virtual {p0}, Lv/a;->C()I

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    if-ne v3, v7, :cond_7

    .line 144
    .line 145
    iget v2, p0, Lv/a;->f:F

    .line 146
    .line 147
    iget v3, p0, Lv/a;->g:F

    .line 148
    .line 149
    add-float/2addr v2, v3

    .line 150
    invoke-virtual {p0}, Lv/a;->m()F

    .line 151
    .line 152
    .line 153
    move-result v3

    .line 154
    sub-float/2addr v3, v1

    .line 155
    div-float/2addr v3, v6

    .line 156
    mul-float/2addr v1, v0

    .line 157
    sub-float/2addr v8, p1

    .line 158
    mul-float/2addr v1, v8

    .line 159
    add-float/2addr v3, v1

    .line 160
    sub-float/2addr v2, v3

    .line 161
    iput v2, p0, Lv/a;->v:F

    .line 162
    .line 163
    return-void

    .line 164
    :cond_7
    invoke-virtual {p0}, Lv/a;->C()I

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    if-nez v1, :cond_8

    .line 169
    .line 170
    invoke-virtual {p0}, Lv/a;->k()F

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    invoke-virtual {p0}, Lv/a;->v()F

    .line 175
    .line 176
    .line 177
    move-result v2

    .line 178
    div-float/2addr v1, v2

    .line 179
    invoke-virtual {p0}, Lv/a;->u()F

    .line 180
    .line 181
    .line 182
    move-result v2

    .line 183
    mul-float/2addr v2, v1

    .line 184
    goto :goto_1

    .line 185
    :cond_8
    invoke-virtual {p0}, Lv/a;->C()I

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    if-ne v1, v5, :cond_9

    .line 190
    .line 191
    invoke-virtual {p0}, Lv/a;->l()F

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    invoke-virtual {p0}, Lv/a;->v()F

    .line 196
    .line 197
    .line 198
    move-result v2

    .line 199
    div-float v2, v1, v2

    .line 200
    .line 201
    :cond_9
    :goto_1
    mul-float/2addr v2, v0

    .line 202
    sub-float/2addr v8, p1

    .line 203
    mul-float/2addr v2, v8

    .line 204
    iget p1, p0, Lv/a;->f:F

    .line 205
    .line 206
    iget v0, p0, Lv/a;->g:F

    .line 207
    .line 208
    add-float/2addr p1, v0

    .line 209
    sub-float/2addr p1, v2

    .line 210
    iput p1, p0, Lv/a;->v:F

    .line 211
    .line 212
    :cond_a
    :goto_2
    return-void
.end method

.method public final q(FF)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lv/a;->C()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x40000000    # 2.0f

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lv/a;->k()F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p0}, Lv/a;->v()F

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    div-float/2addr v0, v3

    .line 19
    invoke-virtual {p0}, Lv/a;->u()F

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    mul-float/2addr v0, v3

    .line 24
    invoke-virtual {p0}, Lv/a;->m()F

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    invoke-virtual {p0}, Lv/a;->m()F

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    sub-float/2addr v4, v0

    .line 33
    mul-float/2addr v4, p1

    .line 34
    sub-float/2addr v3, v4

    .line 35
    iput v3, p0, Lv/a;->g:F

    .line 36
    .line 37
    invoke-virtual {p0}, Lv/a;->n()F

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput v0, p0, Lv/a;->e:F

    .line 42
    .line 43
    iput v2, p0, Lv/a;->d:F

    .line 44
    .line 45
    invoke-virtual {p0}, Lv/a;->m()F

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iget v2, p0, Lv/a;->g:F

    .line 50
    .line 51
    sub-float/2addr v0, v2

    .line 52
    div-float/2addr v0, v1

    .line 53
    iput v0, p0, Lv/a;->f:F

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    invoke-virtual {p0}, Lv/a;->C()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    const/4 v3, 0x1

    .line 61
    if-ne v0, v3, :cond_1

    .line 62
    .line 63
    invoke-virtual {p0}, Lv/a;->l()F

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    invoke-virtual {p0}, Lv/a;->v()F

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    div-float/2addr v0, v3

    .line 72
    invoke-virtual {p0}, Lv/a;->m()F

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    invoke-virtual {p0}, Lv/a;->m()F

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    sub-float/2addr v4, v0

    .line 81
    mul-float/2addr v4, p1

    .line 82
    sub-float/2addr v3, v4

    .line 83
    iput v3, p0, Lv/a;->g:F

    .line 84
    .line 85
    invoke-virtual {p0}, Lv/a;->n()F

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    iput v0, p0, Lv/a;->e:F

    .line 90
    .line 91
    iput v2, p0, Lv/a;->d:F

    .line 92
    .line 93
    invoke-virtual {p0}, Lv/a;->m()F

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    iget v2, p0, Lv/a;->g:F

    .line 98
    .line 99
    sub-float/2addr v0, v2

    .line 100
    div-float/2addr v0, v1

    .line 101
    iput v0, p0, Lv/a;->f:F

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_1
    invoke-virtual {p0}, Lv/a;->C()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    const/4 v3, 0x2

    .line 109
    if-ne v0, v3, :cond_2

    .line 110
    .line 111
    invoke-virtual {p0}, Lv/a;->k()F

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    invoke-virtual {p0}, Lv/a;->v()F

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    mul-float/2addr v0, v3

    .line 120
    invoke-virtual {p0}, Lv/a;->n()F

    .line 121
    .line 122
    .line 123
    move-result v3

    .line 124
    invoke-virtual {p0}, Lv/a;->n()F

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    sub-float/2addr v4, v0

    .line 129
    mul-float/2addr v4, p1

    .line 130
    sub-float/2addr v3, v4

    .line 131
    iput v3, p0, Lv/a;->e:F

    .line 132
    .line 133
    invoke-virtual {p0}, Lv/a;->m()F

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    iput v0, p0, Lv/a;->g:F

    .line 138
    .line 139
    iput v2, p0, Lv/a;->f:F

    .line 140
    .line 141
    invoke-virtual {p0}, Lv/a;->n()F

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    iget v2, p0, Lv/a;->e:F

    .line 146
    .line 147
    sub-float/2addr v0, v2

    .line 148
    div-float/2addr v0, v1

    .line 149
    iput v0, p0, Lv/a;->d:F

    .line 150
    .line 151
    :cond_2
    :goto_0
    iget v0, p0, Lv/a;->x:F

    .line 152
    .line 153
    sub-float p2, v0, p2

    .line 154
    .line 155
    mul-float/2addr p2, p1

    .line 156
    sub-float/2addr v0, p2

    .line 157
    iput v0, p0, Lv/a;->w:F

    .line 158
    .line 159
    invoke-virtual {p0, v0}, Lv/a;->A(F)V

    .line 160
    .line 161
    .line 162
    iget-object p2, p0, Lv/a;->a:Landroid/view/View;

    .line 163
    .line 164
    iget v0, p0, Lv/a;->p:F

    .line 165
    .line 166
    iget v1, p0, Lv/a;->n:F

    .line 167
    .line 168
    sub-float/2addr v1, v0

    .line 169
    mul-float/2addr v1, p1

    .line 170
    add-float/2addr v0, v1

    .line 171
    invoke-virtual {p2, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 172
    .line 173
    .line 174
    iget-object p2, p0, Lv/a;->a:Landroid/view/View;

    .line 175
    .line 176
    iget v0, p0, Lv/a;->q:F

    .line 177
    .line 178
    iget v1, p0, Lv/a;->o:F

    .line 179
    .line 180
    sub-float/2addr v1, v0

    .line 181
    mul-float/2addr v1, p1

    .line 182
    add-float/2addr v0, v1

    .line 183
    invoke-virtual {p2, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 184
    .line 185
    .line 186
    iget p2, p0, Lv/a;->d:F

    .line 187
    .line 188
    iput p2, p0, Lv/a;->s:F

    .line 189
    .line 190
    iget v0, p0, Lv/a;->f:F

    .line 191
    .line 192
    iput v0, p0, Lv/a;->t:F

    .line 193
    .line 194
    iget v1, p0, Lv/a;->e:F

    .line 195
    .line 196
    add-float/2addr p2, v1

    .line 197
    iput p2, p0, Lv/a;->u:F

    .line 198
    .line 199
    iget p2, p0, Lv/a;->g:F

    .line 200
    .line 201
    add-float/2addr v0, p2

    .line 202
    iput v0, p0, Lv/a;->v:F

    .line 203
    .line 204
    invoke-virtual {p0, p1}, Lv/a;->r(F)V

    .line 205
    .line 206
    .line 207
    return-void
.end method

.method public final r(F)V
    .locals 8

    .line 1
    iget-object v0, p0, Lv/a;->b:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lv/a;->y:Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lv/a;->b:Landroid/view/View;

    .line 14
    .line 15
    iget-object v1, p0, Lv/a;->y:Landroid/graphics/Rect;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->getLocalVisibleRect(Landroid/graphics/Rect;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lv/a;->y:Landroid/graphics/Rect;

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    goto/16 :goto_2

    .line 29
    .line 30
    :cond_1
    iget-object v0, p0, Lv/a;->y:Landroid/graphics/Rect;

    .line 31
    .line 32
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 33
    .line 34
    iget v1, v0, Landroid/graphics/Rect;->right:I

    .line 35
    .line 36
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 37
    .line 38
    int-to-float v1, v1

    .line 39
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 40
    .line 41
    int-to-float v0, v0

    .line 42
    const/4 v2, 0x0

    .line 43
    cmpl-float v3, v1, v2

    .line 44
    .line 45
    iget v4, p0, Lv/a;->i:F

    .line 46
    .line 47
    const/4 v5, 0x1

    .line 48
    const/high16 v6, 0x40000000    # 2.0f

    .line 49
    .line 50
    const/4 v7, 0x2

    .line 51
    if-eqz v3, :cond_5

    .line 52
    .line 53
    div-float/2addr v1, v4

    .line 54
    invoke-virtual {p0}, Lv/a;->k()F

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    invoke-virtual {p0}, Lv/a;->C()I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-ne v3, v7, :cond_2

    .line 63
    .line 64
    invoke-virtual {p0}, Lv/a;->m()F

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    sub-float/2addr v2, v0

    .line 69
    div-float/2addr v2, v6

    .line 70
    mul-float/2addr v0, v1

    .line 71
    mul-float/2addr v0, p1

    .line 72
    add-float/2addr v2, v0

    .line 73
    iput v2, p0, Lv/a;->t:F

    .line 74
    .line 75
    return-void

    .line 76
    :cond_2
    invoke-virtual {p0}, Lv/a;->C()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_3

    .line 81
    .line 82
    invoke-virtual {p0}, Lv/a;->k()F

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    invoke-virtual {p0}, Lv/a;->v()F

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    div-float/2addr v0, v2

    .line 91
    invoke-virtual {p0}, Lv/a;->u()F

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    mul-float/2addr v2, v0

    .line 96
    goto :goto_0

    .line 97
    :cond_3
    invoke-virtual {p0}, Lv/a;->C()I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-ne v0, v5, :cond_4

    .line 102
    .line 103
    invoke-virtual {p0}, Lv/a;->l()F

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    invoke-virtual {p0}, Lv/a;->v()F

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    div-float v2, v0, v2

    .line 112
    .line 113
    :cond_4
    :goto_0
    mul-float/2addr v2, v1

    .line 114
    mul-float/2addr v2, p1

    .line 115
    iget p1, p0, Lv/a;->f:F

    .line 116
    .line 117
    add-float/2addr p1, v2

    .line 118
    iput p1, p0, Lv/a;->t:F

    .line 119
    .line 120
    return-void

    .line 121
    :cond_5
    cmpl-float v1, v0, v4

    .line 122
    .line 123
    if-eqz v1, :cond_9

    .line 124
    .line 125
    sub-float v0, v4, v0

    .line 126
    .line 127
    div-float/2addr v0, v4

    .line 128
    invoke-virtual {p0}, Lv/a;->k()F

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    invoke-virtual {p0}, Lv/a;->C()I

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    if-ne v3, v7, :cond_6

    .line 137
    .line 138
    iget v2, p0, Lv/a;->f:F

    .line 139
    .line 140
    iget v3, p0, Lv/a;->g:F

    .line 141
    .line 142
    add-float/2addr v2, v3

    .line 143
    invoke-virtual {p0}, Lv/a;->m()F

    .line 144
    .line 145
    .line 146
    move-result v3

    .line 147
    sub-float/2addr v3, v1

    .line 148
    div-float/2addr v3, v6

    .line 149
    mul-float/2addr v1, v0

    .line 150
    mul-float/2addr v1, p1

    .line 151
    add-float/2addr v3, v1

    .line 152
    sub-float/2addr v2, v3

    .line 153
    iput v2, p0, Lv/a;->v:F

    .line 154
    .line 155
    return-void

    .line 156
    :cond_6
    invoke-virtual {p0}, Lv/a;->C()I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    if-nez v1, :cond_7

    .line 161
    .line 162
    invoke-virtual {p0}, Lv/a;->k()F

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    invoke-virtual {p0}, Lv/a;->v()F

    .line 167
    .line 168
    .line 169
    move-result v2

    .line 170
    div-float/2addr v1, v2

    .line 171
    invoke-virtual {p0}, Lv/a;->u()F

    .line 172
    .line 173
    .line 174
    move-result v2

    .line 175
    mul-float/2addr v2, v1

    .line 176
    goto :goto_1

    .line 177
    :cond_7
    invoke-virtual {p0}, Lv/a;->C()I

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    if-ne v1, v5, :cond_8

    .line 182
    .line 183
    invoke-virtual {p0}, Lv/a;->l()F

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    invoke-virtual {p0}, Lv/a;->v()F

    .line 188
    .line 189
    .line 190
    move-result v2

    .line 191
    div-float v2, v1, v2

    .line 192
    .line 193
    :cond_8
    :goto_1
    mul-float/2addr v2, v0

    .line 194
    mul-float/2addr v2, p1

    .line 195
    iget p1, p0, Lv/a;->f:F

    .line 196
    .line 197
    iget v0, p0, Lv/a;->g:F

    .line 198
    .line 199
    add-float/2addr p1, v0

    .line 200
    sub-float/2addr p1, v2

    .line 201
    iput p1, p0, Lv/a;->v:F

    .line 202
    .line 203
    :cond_9
    :goto_2
    return-void
.end method

.method public final synthetic s(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/a;->b:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget p0, p0, Lv/a;->q:F

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    cmpl-float p0, p0, p1

    .line 11
    .line 12
    if-lez p0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x4

    .line 16
    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic t(ZFLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1, p2}, Lv/a;->o(FF)V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p0, p1, p2}, Lv/a;->q(FF)V

    .line 16
    .line 17
    .line 18
    :goto_0
    iget-object p0, p0, Lv/a;->a:Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final u()F
    .locals 1

    .line 1
    iget v0, p0, Lv/a;->l:F

    .line 2
    .line 3
    iget p0, p0, Lv/a;->m:F

    .line 4
    .line 5
    div-float/2addr v0, p0

    .line 6
    return v0
.end method

.method public final v()F
    .locals 1

    .line 1
    iget v0, p0, Lv/a;->h:F

    .line 2
    .line 3
    iget p0, p0, Lv/a;->i:F

    .line 4
    .line 5
    div-float/2addr v0, p0

    .line 6
    return v0
.end method

.method public final w()F
    .locals 1

    .line 1
    invoke-virtual {p0}, Lv/a;->n()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lv/a;->m()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    div-float/2addr v0, p0

    .line 10
    return v0
.end method

.method public final x()F
    .locals 2

    .line 1
    invoke-virtual {p0}, Lv/a;->w()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lv/a;->u()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    cmpl-float v0, v0, v1

    .line 10
    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    iget v0, p0, Lv/a;->h:F

    .line 14
    .line 15
    invoke-virtual {p0}, Lv/a;->m()F

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {p0}, Lv/a;->u()F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    mul-float/2addr v1, p0

    .line 24
    div-float/2addr v0, v1

    .line 25
    return v0

    .line 26
    :cond_0
    iget v0, p0, Lv/a;->m:F

    .line 27
    .line 28
    iget v1, p0, Lv/a;->l:F

    .line 29
    .line 30
    cmpl-float v0, v0, v1

    .line 31
    .line 32
    if-lez v0, :cond_1

    .line 33
    .line 34
    iget v0, p0, Lv/a;->h:F

    .line 35
    .line 36
    invoke-virtual {p0}, Lv/a;->n()F

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    div-float/2addr v0, p0

    .line 41
    return v0

    .line 42
    :cond_1
    iget v0, p0, Lv/a;->i:F

    .line 43
    .line 44
    invoke-virtual {p0}, Lv/a;->n()F

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {p0}, Lv/a;->u()F

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    div-float/2addr v1, p0

    .line 53
    div-float/2addr v0, v1

    .line 54
    return v0
.end method

.method public y(F)V
    .locals 0

    .line 1
    iput p1, p0, Lv/a;->m:F

    .line 2
    .line 3
    return-void
.end method

.method public z(F)V
    .locals 0

    .line 1
    iput p1, p0, Lv/a;->l:F

    .line 2
    .line 3
    return-void
.end method
