.class public Ll/xx10;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/ImageView;

.field public d:Landroid/widget/ImageView;

.field public e:Landroid/widget/ImageView;

.field public f:Landroid/widget/ImageView;

.field public g:Ll/c020;

.field public h:Z

.field public i:Landroid/view/View;

.field public j:Landroid/animation/ValueAnimator;

.field public k:Landroid/view/View;

.field public l:Landroidx/appcompat/widget/AppCompatSeekBar;

.field public final m:Ljava/lang/Runnable;

.field public n:Landroid/animation/Animator;

.field public o:Landroid/animation/Animator;

.field public p:Landroid/view/View;

.field public q:Landroid/view/View;


# direct methods
.method public constructor <init>(Ll/c020;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/nx10;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/nx10;-><init>(Ll/xx10;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/xx10;->m:Ljava/lang/Runnable;

    .line 10
    .line 11
    iput-object p1, p0, Ll/xx10;->g:Ll/c020;

    .line 12
    .line 13
    invoke-virtual {p0, p2}, Ll/xx10;->o(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ll/xx10;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xx10;->u()V

    return-void
.end method

.method public static synthetic c(Ll/xx10;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xx10;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/xx10;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xx10;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/xx10;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xx10;->p()V

    return-void
.end method

.method public static synthetic f(Ll/xx10;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xx10;->r(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Ll/xx10;FLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xx10;->v(FLandroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic h(Ll/xx10;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xx10;->m()V

    return-void
.end method

.method public static synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j(Ll/xx10;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xx10;->t(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic k(Ll/xx10;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xx10;->m:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic l(Ll/xx10;)Ll/c020;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xx10;->g:Ll/c020;

    return-object p0
.end method


# virtual methods
.method public A()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xx10;->j:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/xx10;->i:Landroid/view/View;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setRotation(F)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/xx10;->a:Lv/VDraweeView;

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Landroid/view/View;->setRotation(F)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final B()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/xx10;->h:Z

    .line 2
    .line 3
    iget-object p0, p0, Ll/xx10;->g:Ll/c020;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/c020;->B2()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/c020;->y2()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public C(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xx10;->n()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final D()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/xx10;->n:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/xx10;->o:Landroid/animation/Animator;

    .line 7
    .line 8
    invoke-static {v0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/xx10;->k:Landroid/view/View;

    .line 12
    .line 13
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 14
    .line 15
    const/4 v2, 0x2

    .line 16
    new-array v3, v2, [F

    .line 17
    .line 18
    fill-array-data v3, :array_0

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1, v3}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-wide/16 v3, 0x64

    .line 26
    .line 27
    invoke-virtual {v0, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v5, p0, Ll/xx10;->l:Landroidx/appcompat/widget/AppCompatSeekBar;

    .line 32
    .line 33
    new-array v2, v2, [F

    .line 34
    .line 35
    fill-array-data v2, :array_1

    .line 36
    .line 37
    .line 38
    invoke-static {v5, v1, v2}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const-wide/16 v2, 0xc8

    .line 47
    .line 48
    invoke-virtual {v1, v2, v3}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 49
    .line 50
    .line 51
    filled-new-array {v0, v1}, [Landroid/animation/Animator;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, p0, Ll/xx10;->o:Landroid/animation/Animator;

    .line 60
    .line 61
    new-instance v1, Ll/wx10;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/wx10;-><init>(Ll/xx10;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/xx10;->o:Landroid/animation/Animator;

    .line 70
    .line 71
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/xx10;->l:Landroidx/appcompat/widget/AppCompatSeekBar;

    .line 75
    .line 76
    iget-object v1, p0, Ll/xx10;->m:Ljava/lang/Runnable;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/xx10;->l:Landroidx/appcompat/widget/AppCompatSeekBar;

    .line 82
    .line 83
    iget-object p0, p0, Ll/xx10;->m:Ljava/lang/Runnable;

    .line 84
    .line 85
    const-wide/16 v1, 0x514

    .line 86
    .line 87
    invoke-virtual {v0, p0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 92
    .line 93
    .line 94
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public E(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xx10;->p:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Ll/xx10;->p:Landroid/view/View;

    .line 9
    .line 10
    new-instance v0, Ll/ox10;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/ox10;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/xx10;->o:Landroid/animation/Animator;

    .line 19
    .line 20
    invoke-static {p1}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/xx10;->n:Landroid/animation/Animator;

    .line 24
    .line 25
    invoke-static {p1}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/xx10;->l:Landroidx/appcompat/widget/AppCompatSeekBar;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/xx10;->k:Landroid/view/View;

    .line 35
    .line 36
    const/high16 p1, 0x3f800000    # 1.0f

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public F(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xx10;->b:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->title:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->filePath:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v0, p0, Ll/xx10;->a:Lv/VDraweeView;

    .line 11
    .line 12
    sget v1, Ll/nbc0;->G:I

    .line 13
    .line 14
    invoke-static {p1, v0, v1}, Ll/m120;->a(Ljava/lang/String;Landroid/widget/ImageView;I)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/xz10;->f1()Ll/xz10;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ll/xz10;->m1()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object v0, p0, Ll/xx10;->d:Landroid/widget/ImageView;

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    sget p1, Ll/nbc0;->P:I

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    sget p1, Ll/nbc0;->N:I

    .line 33
    .line 34
    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/xx10;->f:Landroid/widget/ImageView;

    .line 38
    .line 39
    sget v0, Ll/nbc0;->T:I

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/xx10;->e:Landroid/widget/ImageView;

    .line 45
    .line 46
    sget p1, Ll/nbc0;->K:I

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public G(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xx10;->q:Landroid/view/View;

    .line 2
    .line 3
    xor-int/lit8 v1, p1, 0x1

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/xx10;->q:Landroid/view/View;

    .line 11
    .line 12
    new-instance p1, Ll/vx10;

    .line 13
    .line 14
    invoke-direct {p1}, Ll/vx10;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final H()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xx10;->i:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getRotation()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/xx10;->j:Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    invoke-static {v1}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    new-array v1, v1, [F

    .line 14
    .line 15
    fill-array-data v1, :array_0

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, p0, Ll/xx10;->j:Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    const-wide/16 v2, 0x2710

    .line 25
    .line 26
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/xx10;->j:Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    const/4 v2, -0x1

    .line 32
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Ll/xx10;->j:Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Ll/xx10;->j:Landroid/animation/ValueAnimator;

    .line 42
    .line 43
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 44
    .line 45
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Ll/xx10;->j:Landroid/animation/ValueAnimator;

    .line 52
    .line 53
    new-instance v2, Ll/ux10;

    .line 54
    .line 55
    invoke-direct {v2, p0, v0}, Ll/ux10;-><init>(Ll/xx10;F)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Ll/xx10;->j:Landroid/animation/ValueAnimator;

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final m()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/xx10;->n:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/xx10;->o:Landroid/animation/Animator;

    .line 7
    .line 8
    invoke-static {v0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/xx10;->l:Landroidx/appcompat/widget/AppCompatSeekBar;

    .line 12
    .line 13
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 14
    .line 15
    const/4 v2, 0x2

    .line 16
    new-array v3, v2, [F

    .line 17
    .line 18
    fill-array-data v3, :array_0

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1, v3}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-wide/16 v3, 0x64

    .line 26
    .line 27
    invoke-virtual {v0, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v5, p0, Ll/xx10;->k:Landroid/view/View;

    .line 32
    .line 33
    new-array v2, v2, [F

    .line 34
    .line 35
    fill-array-data v2, :array_1

    .line 36
    .line 37
    .line 38
    invoke-static {v5, v1, v2}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const-wide/16 v2, 0xc8

    .line 47
    .line 48
    invoke-virtual {v1, v2, v3}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 49
    .line 50
    .line 51
    filled-new-array {v0, v1}, [Landroid/animation/Animator;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, p0, Ll/xx10;->n:Landroid/animation/Animator;

    .line 60
    .line 61
    new-instance v1, Ll/tx10;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/tx10;-><init>(Ll/xx10;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/xx10;->n:Landroid/animation/Animator;

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xx10;->c:Landroid/widget/ImageView;

    .line 2
    .line 3
    sget v1, Ll/nbc0;->L:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/xx10;->d:Landroid/widget/ImageView;

    .line 9
    .line 10
    sget v1, Ll/nbc0;->I:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/xx10;->e:Landroid/widget/ImageView;

    .line 16
    .line 17
    sget v1, Ll/nbc0;->J:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/xx10;->f:Landroid/widget/ImageView;

    .line 23
    .line 24
    sget v1, Ll/nbc0;->S:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/xx10;->b:Landroid/widget/TextView;

    .line 30
    .line 31
    sget v1, Lcom/p1/mobile/putong/live/external/R$string;->d:I

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/xx10;->a:Lv/VDraweeView;

    .line 37
    .line 38
    sget v0, Ll/nbc0;->G:I

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public o(Landroid/view/View;)V
    .locals 2

    .line 1
    sget v0, Ll/ldc0;->R:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VDraweeView;

    .line 8
    .line 9
    iput-object v0, p0, Ll/xx10;->a:Lv/VDraweeView;

    .line 10
    .line 11
    sget v0, Ll/ldc0;->Q:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/xx10;->i:Landroid/view/View;

    .line 18
    .line 19
    sget v0, Ll/ldc0;->Z0:I

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Landroid/widget/TextView;

    .line 26
    .line 27
    iput-object v0, p0, Ll/xx10;->b:Landroid/widget/TextView;

    .line 28
    .line 29
    sget v0, Ll/ldc0;->g1:I

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Landroid/widget/ImageView;

    .line 36
    .line 37
    iput-object v0, p0, Ll/xx10;->c:Landroid/widget/ImageView;

    .line 38
    .line 39
    sget v0, Ll/ldc0;->X0:I

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Landroid/widget/ImageView;

    .line 46
    .line 47
    iput-object v0, p0, Ll/xx10;->d:Landroid/widget/ImageView;

    .line 48
    .line 49
    sget v0, Ll/ldc0;->e1:I

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Landroid/widget/ImageView;

    .line 56
    .line 57
    iput-object v0, p0, Ll/xx10;->e:Landroid/widget/ImageView;

    .line 58
    .line 59
    sget v0, Ll/ldc0;->I2:I

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Landroid/widget/ImageView;

    .line 66
    .line 67
    iput-object v0, p0, Ll/xx10;->f:Landroid/widget/ImageView;

    .line 68
    .line 69
    sget v0, Ll/ldc0;->H2:I

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iput-object v0, p0, Ll/xx10;->k:Landroid/view/View;

    .line 76
    .line 77
    sget v0, Ll/ldc0;->G2:I

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Landroidx/appcompat/widget/AppCompatSeekBar;

    .line 84
    .line 85
    iput-object v0, p0, Ll/xx10;->l:Landroidx/appcompat/widget/AppCompatSeekBar;

    .line 86
    .line 87
    sget v0, Ll/ldc0;->V0:I

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iput-object v0, p0, Ll/xx10;->p:Landroid/view/View;

    .line 94
    .line 95
    sget v0, Ll/ldc0;->a0:I

    .line 96
    .line 97
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    iput-object p1, p0, Ll/xx10;->q:Landroid/view/View;

    .line 102
    .line 103
    iget-object p1, p0, Ll/xx10;->a:Lv/VDraweeView;

    .line 104
    .line 105
    const/high16 v0, 0x41800000    # 16.0f

    .line 106
    .line 107
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    invoke-static {p1, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Ll/xx10;->e:Landroid/widget/ImageView;

    .line 115
    .line 116
    new-instance v0, Ll/px10;

    .line 117
    .line 118
    invoke-direct {v0, p0}, Ll/px10;-><init>(Ll/xx10;)V

    .line 119
    .line 120
    .line 121
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Ll/xx10;->c:Landroid/widget/ImageView;

    .line 125
    .line 126
    new-instance v0, Ll/qx10;

    .line 127
    .line 128
    invoke-direct {v0, p0}, Ll/qx10;-><init>(Ll/xx10;)V

    .line 129
    .line 130
    .line 131
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 132
    .line 133
    .line 134
    iget-object p1, p0, Ll/xx10;->d:Landroid/widget/ImageView;

    .line 135
    .line 136
    new-instance v0, Ll/rx10;

    .line 137
    .line 138
    invoke-direct {v0, p0}, Ll/rx10;-><init>(Ll/xx10;)V

    .line 139
    .line 140
    .line 141
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 142
    .line 143
    .line 144
    iget-object p1, p0, Ll/xx10;->f:Landroid/widget/ImageView;

    .line 145
    .line 146
    new-instance v0, Ll/sx10;

    .line 147
    .line 148
    invoke-direct {v0, p0}, Ll/sx10;-><init>(Ll/xx10;)V

    .line 149
    .line 150
    .line 151
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p0}, Ll/xx10;->n()V

    .line 155
    .line 156
    .line 157
    iget-object p1, p0, Ll/xx10;->l:Landroidx/appcompat/widget/AppCompatSeekBar;

    .line 158
    .line 159
    invoke-static {}, Ll/xz10;->f1()Ll/xz10;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {v0}, Ll/xz10;->d()F

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    const/high16 v1, 0x42c80000    # 100.0f

    .line 168
    .line 169
    mul-float/2addr v0, v1

    .line 170
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 175
    .line 176
    .line 177
    iget-object p1, p0, Ll/xx10;->l:Landroidx/appcompat/widget/AppCompatSeekBar;

    .line 178
    .line 179
    new-instance v0, Ll/xx10$a;

    .line 180
    .line 181
    invoke-direct {v0, p0}, Ll/xx10$a;-><init>(Ll/xx10;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 185
    .line 186
    .line 187
    return-void
.end method

.method public final synthetic p()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xx10;->l:Landroidx/appcompat/widget/AppCompatSeekBar;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/xx10;->f:Landroid/widget/ImageView;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic q(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xx10;->g:Ll/c020;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/c020;->A2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic r(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xx10;->B()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic s(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xx10;->w()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic t(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xx10;->D()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic u()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xx10;->l:Landroidx/appcompat/widget/AppCompatSeekBar;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/xx10;->l:Landroidx/appcompat/widget/AppCompatSeekBar;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/xx10;->f:Landroid/widget/ImageView;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic v(FLandroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    const/high16 v0, 0x43b40000    # 360.0f

    .line 12
    .line 13
    mul-float/2addr p2, v0

    .line 14
    iget-object v0, p0, Ll/xx10;->i:Landroid/view/View;

    .line 15
    .line 16
    add-float/2addr p1, p2

    .line 17
    invoke-virtual {v0, p1}, Landroid/view/View;->setRotation(F)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/xx10;->a:Lv/VDraweeView;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/view/View;->setRotation(F)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final w()V
    .locals 2

    .line 1
    invoke-static {}, Ll/xz10;->f1()Ll/xz10;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xz10;->m1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Ll/xx10;->d:Landroid/widget/ImageView;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget v0, Ll/nbc0;->N:I

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    sget v0, Ll/nbc0;->P:I

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 22
    .line 23
    .line 24
    :goto_0
    iget-object p0, p0, Ll/xx10;->g:Ll/c020;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/c020;->r2()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public x(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xx10;->c:Landroid/widget/ImageView;

    .line 2
    .line 3
    sget v1, Ll/nbc0;->M:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/xx10;->j:Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Ll/xz10;->s:Ljava/lang/String;

    .line 14
    .line 15
    const-string v1, "control panel onMusicPause"

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Ll/xx10;->h:Z

    .line 22
    .line 23
    iget-object v0, p0, Ll/xx10;->b:Landroid/widget/TextView;

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;->author:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/xx10;->F(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public y(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/xx10;->c:Landroid/widget/ImageView;

    .line 2
    .line 3
    sget v0, Ll/nbc0;->O:I

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xx10;->H()V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Ll/xx10;->h:Z

    .line 13
    .line 14
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/xx10;->h:Z

    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Ll/xx10;->G(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xx10;->H()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/xx10;->F(Lcom/p1/mobile/putong/live/livingroom/voice/intl/play/IntlMusicBean;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/xx10;->c:Landroid/widget/ImageView;

    .line 15
    .line 16
    sget p1, Ll/nbc0;->O:I

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
