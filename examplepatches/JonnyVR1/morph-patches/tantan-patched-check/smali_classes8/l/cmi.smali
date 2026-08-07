.class public Ll/cmi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/media/widget/FilterScrollMoreViewPager;

.field public b:Landroid/animation/ValueAnimator;

.field public c:I

.field public d:F

.field public e:Landroid/animation/Animator;

.field public f:Landroid/widget/TextView;

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;"
        }
    .end annotation
.end field

.field public volatile i:Z

.field public j:Ll/xvx;

.field public k:Ll/azy;

.field public l:Ll/kcg0;

.field public volatile m:Z

.field public final n:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;Ll/xvx;Ll/azy;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/cmi;->c:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput v1, p0, Ll/cmi;->d:F

    .line 9
    .line 10
    new-instance v1, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Ll/cmi;->h:Ljava/util/List;

    .line 16
    .line 17
    iput-boolean v0, p0, Ll/cmi;->i:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Ll/cmi;->m:Z

    .line 20
    .line 21
    new-instance v0, Ll/wli;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/wli;-><init>(Ll/cmi;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/cmi;->n:Ll/y20;

    .line 27
    .line 28
    iput-object p2, p0, Ll/cmi;->j:Ll/xvx;

    .line 29
    .line 30
    iput-object p3, p0, Ll/cmi;->k:Ll/azy;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/cmi;->s(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static synthetic a(Ll/cmi;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cmi;->v(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic b(Ll/cmi;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cmi;->w(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic c(Ll/cmi;IZLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/cmi;->z(IZLandroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic d(Ll/cmi;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cmi;->x()V

    return-void
.end method

.method public static synthetic e(Ll/cmi;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cmi;->y()V

    return-void
.end method

.method public static synthetic f(Ll/kd4;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kd4;->a(Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static bridge synthetic g(Ll/cmi;)F
    .locals 0

    .line 1
    iget p0, p0, Ll/cmi;->d:F

    return p0
.end method

.method public static bridge synthetic h(Ll/cmi;)Ll/xvx;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cmi;->j:Ll/xvx;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/cmi;)Ll/azy;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cmi;->k:Ll/azy;

    return-object p0
.end method

.method public static bridge synthetic j(Ll/cmi;F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/cmi;->d:F

    return-void
.end method

.method public static bridge synthetic k(Ll/cmi;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cmi;->u()Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic l(Ll/cmi;IZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cmi;->A(IZ)V

    return-void
.end method

.method public static bridge synthetic m(Ll/cmi;ZF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/cmi;->E(ZF)V

    return-void
.end method

.method public static bridge synthetic n(Ll/cmi;ZZZJ)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/cmi;->F(ZZZJ)V

    return-void
.end method


# virtual methods
.method public final A(IZ)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cmi;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-le v0, p1, :cond_2

    .line 8
    .line 9
    if-gez p1, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget v0, p0, Ll/cmi;->c:I

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    if-ne v0, p1, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    goto :goto_0

    .line 19
    :cond_1
    move v0, v1

    .line 20
    :goto_0
    iput p1, p0, Ll/cmi;->c:I

    .line 21
    .line 22
    iget-object v2, p0, Ll/cmi;->j:Ll/xvx;

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    invoke-virtual {v2, p1, v1, v3}, Ll/xvx;->b(IZF)V

    .line 26
    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0, p2}, Ll/cmi;->C(Z)V

    .line 31
    .line 32
    .line 33
    :cond_2
    :goto_1
    return-void
.end method

.method public B(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cmi;->a:Lcom/p1/mobile/putong/core/ui/messages/media/widget/FilterScrollMoreViewPager;

    .line 2
    .line 3
    new-instance v1, Ll/cmi$a;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/cmi$a;-><init>(Ll/cmi;Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/FilterScrollMoreViewPager;->setOnIntercept(Lcom/p1/mobile/putong/core/ui/messages/media/widget/FilterScrollMoreViewPager$c;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final C(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cmi;->g:Ljava/util/List;

    .line 2
    .line 3
    iget v1, p0, Ll/cmi;->c:I

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/momo/mcamera/filtermanager/MMFilter;->getFilterName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object v1, p0, Ll/cmi;->f:Landroid/widget/TextView;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/cmi;->D(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final D(Z)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/cmi;->f:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/gt0;->e(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/cmi;->e:Landroid/animation/Animator;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/cmi;->e:Landroid/animation/Animator;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v1, p0, Ll/cmi;->f:Landroid/widget/TextView;

    .line 20
    .line 21
    sget-object v7, Ll/gt0;->a:Landroid/view/animation/Interpolator;

    .line 22
    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    const/high16 p1, -0x3d380000    # -100.0f

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const/high16 p1, 0x42c80000    # 100.0f

    .line 29
    .line 30
    :goto_0
    const/4 v0, 0x2

    .line 31
    new-array v8, v0, [F

    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    aput p1, v8, v2

    .line 35
    .line 36
    const/4 p1, 0x1

    .line 37
    const/4 v2, 0x0

    .line 38
    aput v2, v8, p1

    .line 39
    .line 40
    const-string v2, "translationX"

    .line 41
    .line 42
    const-wide/16 v3, 0x0

    .line 43
    .line 44
    const-wide/16 v5, 0x12c

    .line 45
    .line 46
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object v1, p0, Ll/cmi;->f:Landroid/widget/TextView;

    .line 51
    .line 52
    sget-object v7, Ll/gt0;->d:Landroid/view/animation/Interpolator;

    .line 53
    .line 54
    new-array v8, v0, [F

    .line 55
    .line 56
    fill-array-data v8, :array_0

    .line 57
    .line 58
    .line 59
    const-string v2, "alpha"

    .line 60
    .line 61
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iget-object v2, p0, Ll/cmi;->f:Landroid/widget/TextView;

    .line 66
    .line 67
    new-array v9, v0, [F

    .line 68
    .line 69
    fill-array-data v9, :array_1

    .line 70
    .line 71
    .line 72
    const-string v3, "alpha"

    .line 73
    .line 74
    const-wide/16 v4, 0x708

    .line 75
    .line 76
    move-object v8, v7

    .line 77
    const-wide/16 v6, 0x258

    .line 78
    .line 79
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    filled-new-array {p1, v1, v0}, [Landroid/animation/Animator;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-static {p1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iput-object p1, p0, Ll/cmi;->e:Landroid/animation/Animator;

    .line 92
    .line 93
    new-instance v0, Ll/ami;

    .line 94
    .line 95
    invoke-direct {v0, p0}, Ll/ami;-><init>(Ll/cmi;)V

    .line 96
    .line 97
    .line 98
    invoke-static {p1, v0}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Ll/cmi;->e:Landroid/animation/Animator;

    .line 102
    .line 103
    new-instance v0, Ll/bmi;

    .line 104
    .line 105
    invoke-direct {v0, p0}, Ll/bmi;-><init>(Ll/cmi;)V

    .line 106
    .line 107
    .line 108
    invoke-static {p1, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Ll/cmi;->e:Landroid/animation/Animator;

    .line 112
    .line 113
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :array_0
    .array-data 4
        0x0
        0x3f99999a    # 1.2f
    .end array-data

    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    :array_1
    .array-data 4
        0x3f99999a    # 1.2f
        0x0
    .end array-data
.end method

.method public final E(ZF)V
    .locals 2

    .line 1
    iget v0, p0, Ll/cmi;->c:I

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    neg-float p2, p2

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    sub-float p2, v1, p2

    .line 10
    .line 11
    :goto_0
    iput p2, p0, Ll/cmi;->d:F

    .line 12
    .line 13
    iget-object p0, p0, Ll/cmi;->j:Ll/xvx;

    .line 14
    .line 15
    invoke-virtual {p0, v0, p1, p2}, Ll/xvx;->b(IZF)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final F(ZZZJ)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/cmi;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget v1, p0, Ll/cmi;->c:I

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    const/4 v3, -0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_1
    move v3, v2

    .line 18
    :goto_0
    add-int/2addr v3, v1

    .line 19
    if-eqz p3, :cond_2

    .line 20
    .line 21
    move v3, v1

    .line 22
    :cond_2
    const/4 v4, 0x0

    .line 23
    if-gez v3, :cond_3

    .line 24
    .line 25
    add-int/lit8 v3, v0, -0x1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_3
    if-lt v3, v0, :cond_4

    .line 29
    .line 30
    move v0, v1

    .line 31
    move v3, v4

    .line 32
    goto :goto_1

    .line 33
    :cond_4
    move v0, v1

    .line 34
    :goto_1
    if-eqz p2, :cond_8

    .line 35
    .line 36
    if-eqz p3, :cond_5

    .line 37
    .line 38
    move p2, p1

    .line 39
    goto :goto_2

    .line 40
    :cond_5
    xor-int/lit8 p2, p1, 0x1

    .line 41
    .line 42
    :goto_2
    iget-object p3, p0, Ll/cmi;->b:Landroid/animation/ValueAnimator;

    .line 43
    .line 44
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p3

    .line 48
    if-eqz p3, :cond_6

    .line 49
    .line 50
    iget-object p3, p0, Ll/cmi;->b:Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 53
    .line 54
    .line 55
    move-result p3

    .line 56
    if-eqz p3, :cond_6

    .line 57
    .line 58
    iget-object p3, p0, Ll/cmi;->b:Landroid/animation/ValueAnimator;

    .line 59
    .line 60
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->cancel()V

    .line 61
    .line 62
    .line 63
    :cond_6
    iget-object p3, p0, Ll/cmi;->b:Landroid/animation/ValueAnimator;

    .line 64
    .line 65
    if-nez p3, :cond_7

    .line 66
    .line 67
    new-instance p3, Landroid/animation/ValueAnimator;

    .line 68
    .line 69
    invoke-direct {p3}, Landroid/animation/ValueAnimator;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object p3, p0, Ll/cmi;->b:Landroid/animation/ValueAnimator;

    .line 73
    .line 74
    :cond_7
    iget-object p3, p0, Ll/cmi;->b:Landroid/animation/ValueAnimator;

    .line 75
    .line 76
    invoke-virtual {p3, p4, p5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 77
    .line 78
    .line 79
    iget-object p3, p0, Ll/cmi;->b:Landroid/animation/ValueAnimator;

    .line 80
    .line 81
    iget p4, p0, Ll/cmi;->d:F

    .line 82
    .line 83
    int-to-float p2, p2

    .line 84
    const/4 p5, 0x2

    .line 85
    new-array p5, p5, [F

    .line 86
    .line 87
    aput p4, p5, v4

    .line 88
    .line 89
    aput p2, p5, v2

    .line 90
    .line 91
    invoke-virtual {p3, p5}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 92
    .line 93
    .line 94
    iget-object p2, p0, Ll/cmi;->b:Landroid/animation/ValueAnimator;

    .line 95
    .line 96
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 97
    .line 98
    .line 99
    iget-object p2, p0, Ll/cmi;->b:Landroid/animation/ValueAnimator;

    .line 100
    .line 101
    invoke-virtual {p2}, Landroid/animation/Animator;->removeAllListeners()V

    .line 102
    .line 103
    .line 104
    iget-object p2, p0, Ll/cmi;->b:Landroid/animation/ValueAnimator;

    .line 105
    .line 106
    new-instance p3, Ll/zli;

    .line 107
    .line 108
    invoke-direct {p3, p0, v0, p1}, Ll/zli;-><init>(Ll/cmi;IZ)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 112
    .line 113
    .line 114
    iget-object p2, p0, Ll/cmi;->b:Landroid/animation/ValueAnimator;

    .line 115
    .line 116
    new-instance p3, Ll/cmi$c;

    .line 117
    .line 118
    invoke-direct {p3, p0, v3, p1}, Ll/cmi$c;-><init>(Ll/cmi;IZ)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p2, p3}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 122
    .line 123
    .line 124
    iget-object p0, p0, Ll/cmi;->b:Landroid/animation/ValueAnimator;

    .line 125
    .line 126
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_8
    invoke-virtual {p0, v3, p1}, Ll/cmi;->A(IZ)V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public o()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/cmi;->n:Ll/y20;

    .line 6
    .line 7
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->n(Ll/y20;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/cmi;->m:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/cmi;->l:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final q(Ljava/util/List;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cmi;->g:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Ll/r97;->D2()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "_"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    array-length v1, v0

    .line 25
    const/4 v2, 0x0

    .line 26
    move v3, v2

    .line 27
    :goto_0
    if-ge v3, v1, :cond_3

    .line 28
    .line 29
    aget-object v4, v0, v3

    .line 30
    .line 31
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    :cond_0
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 36
    .line 37
    .line 38
    move-result v6

    .line 39
    if-eqz v6, :cond_2

    .line 40
    .line 41
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    check-cast v6, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 46
    .line 47
    invoke-virtual {v6}, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->getmFilterId()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v7

    .line 51
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v7

    .line 55
    if-eqz v7, :cond_0

    .line 56
    .line 57
    const-string v7, "0"

    .line 58
    .line 59
    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v7

    .line 63
    iget-object v8, p0, Ll/cmi;->g:Ljava/util/List;

    .line 64
    .line 65
    if-eqz v7, :cond_1

    .line 66
    .line 67
    invoke-interface {v8, v2, v6}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_1
    invoke-interface {v8, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_3
    iget-object p0, p0, Ll/cmi;->g:Ljava/util/List;

    .line 79
    .line 80
    return-object p0
.end method

.method public r()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cmi;->h:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget v1, p0, Ll/cmi;->c:I

    .line 10
    .line 11
    if-le v0, v1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/cmi;->h:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/momo/mcamera/filtermanager/MMPresetFilter;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->getmFilterId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    const-string p0, "0"

    .line 27
    .line 28
    return-object p0
.end method

.method public final s(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getFilterView()Lcom/p1/mobile/putong/core/ui/messages/media/widget/FilterScrollMoreViewPager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/cmi;->a:Lcom/p1/mobile/putong/core/ui/messages/media/widget/FilterScrollMoreViewPager;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getFilterNameView()Landroid/widget/TextView;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/cmi;->f:Landroid/widget/TextView;

    .line 12
    .line 13
    new-instance p1, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/cmi;->g:Ljava/util/List;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/cmi;->o()V

    .line 21
    .line 22
    .line 23
    new-instance p1, Ll/kd4;

    .line 24
    .line 25
    iget-object v0, p0, Ll/cmi;->j:Ll/xvx;

    .line 26
    .line 27
    invoke-direct {p1, v0}, Ll/kd4;-><init>(Ll/xvx;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/cmi;->a:Lcom/p1/mobile/putong/core/ui/messages/media/widget/FilterScrollMoreViewPager;

    .line 31
    .line 32
    new-instance v1, Ll/yli;

    .line 33
    .line 34
    invoke-direct {v1, p1}, Ll/yli;-><init>(Ll/kd4;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/FilterScrollMoreViewPager;->setBeforeCheckEnableTouchListener(Lcom/p1/mobile/putong/core/ui/messages/media/widget/FilterScrollMoreViewPager$b;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/cmi;->a:Lcom/p1/mobile/putong/core/ui/messages/media/widget/FilterScrollMoreViewPager;

    .line 41
    .line 42
    new-instance v0, Ll/cmi$b;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Ll/cmi$b;-><init>(Ll/cmi;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/FilterScrollMoreViewPager;->setOnVerticalFlingListener(Lcom/p1/mobile/putong/core/ui/messages/media/widget/FilterScrollMoreViewPager$d;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public t(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/filtermanager/MMPresetFilter;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-le v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/cmi;->j:Ll/xvx;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ll/xvx;->g(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/cmi;->j:Ll/xvx;

    .line 16
    .line 17
    iget p0, p0, Ll/cmi;->c:I

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p1, p0, v1, v0}, Ll/xvx;->b(IZF)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final u()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cmi;->b:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final synthetic v(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Ll/cmi;->i:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    iput-boolean p1, p0, Ll/cmi;->i:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/cmi;->o()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final synthetic w(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/cmi;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Ll/cmi;->h:Ljava/util/List;

    .line 7
    .line 8
    if-eqz p1, :cond_2

    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/4 v0, 0x1

    .line 15
    if-gt p1, v0, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    iget-object p1, p0, Ll/cmi;->h:Ljava/util/List;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/cmi;->q(Ljava/util/List;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Ll/cmi;->t(Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_2
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->filter()Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v0, Ll/xli;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/xli;-><init>(Ll/cmi;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Ll/cmi;->l:Ll/kcg0;

    .line 50
    .line 51
    return-void
.end method

.method public final synthetic x()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cmi;->f:Landroid/widget/TextView;

    .line 2
    .line 3
    const v1, 0x3fcccccd    # 1.6f

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/cmi;->f:Landroid/widget/TextView;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/cmi;->f:Landroid/widget/TextView;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic y()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/cmi;->e:Landroid/animation/Animator;

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z(IZLandroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    check-cast p3, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    const/high16 v0, 0x3f800000    # 1.0f

    .line 12
    .line 13
    cmpl-float v0, p3, v0

    .line 14
    .line 15
    if-gez v0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    cmpg-float v0, p3, v0

    .line 19
    .line 20
    if-gtz v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p0, p0, Ll/cmi;->j:Ll/xvx;

    .line 24
    .line 25
    xor-int/lit8 p2, p2, 0x1

    .line 26
    .line 27
    invoke-virtual {p0, p1, p2, p3}, Ll/xvx;->b(IZF)V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    return-void
.end method
