.class public Ll/nq40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sxl0;


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VText;

.field public c:Landroid/view/View;

.field public d:Landroid/animation/Animator;

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/nq40;->e:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/nq40;->f:Z

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic h(Landroid/view/View;IFLandroid/animation/ValueAnimator;)V
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
    const v0, 0x3f99999a    # 1.2f

    .line 12
    .line 13
    .line 14
    cmpl-float v0, p3, v0

    .line 15
    .line 16
    if-lez v0, :cond_0

    .line 17
    .line 18
    const/high16 v0, 0x3f800000    # 1.0f

    .line 19
    .line 20
    sub-float/2addr p3, v0

    .line 21
    int-to-float p1, p1

    .line 22
    mul-float/2addr p1, p3

    .line 23
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 24
    .line 25
    .line 26
    mul-float/2addr p3, p2

    .line 27
    invoke-virtual {p0, p3}, Landroid/view/View;->setRotation(F)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/sxl0;->a()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/nq40;->e:Z

    .line 6
    .line 7
    iget-object v1, p0, Ll/nq40;->d:Landroid/animation/Animator;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/animation/Animator;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Ll/nq40;->d:Landroid/animation/Animator;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/animation/Animator;->end()V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ll/nq40;->d:Landroid/animation/Animator;

    .line 23
    .line 24
    invoke-virtual {v1}, Landroid/animation/Animator;->cancel()V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/nq40;->c:Landroid/view/View;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    instance-of v1, v1, Landroid/view/View;

    .line 34
    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    iget-object v1, p0, Ll/nq40;->c:Landroid/view/View;

    .line 38
    .line 39
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Landroid/view/View;

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, v2}, Landroid/view/View;->setRotation(F)V

    .line 50
    .line 51
    .line 52
    :cond_0
    iget-boolean v1, p0, Ll/nq40;->f:Z

    .line 53
    .line 54
    if-nez v1, :cond_1

    .line 55
    .line 56
    const-string v1, "profile_update_guidance_type"

    .line 57
    .line 58
    const-string v2, "swipe_right"

    .line 59
    .line 60
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    filled-new-array {v1}, [Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    const-string v2, "e_profile_update_guidance"

    .line 69
    .line 70
    const-string v3, "p_suggest_users_home_view"

    .line 71
    .line 72
    invoke-static {v2, v3, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 73
    .line 74
    .line 75
    iput-boolean v0, p0, Ll/nq40;->f:Z

    .line 76
    .line 77
    :cond_1
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/core/card/VSwipeCard;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/core/data/VirtualCardType;)Landroid/view/View;
    .locals 2

    .line 1
    sget p3, Ll/nec0;->e:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/nq40;->c:Landroid/view/View;

    .line 9
    .line 10
    sget p2, Ll/cdc0;->P:I

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lv/VDraweeView;

    .line 17
    .line 18
    iput-object p1, p0, Ll/nq40;->a:Lv/VDraweeView;

    .line 19
    .line 20
    iget-object p1, p0, Ll/nq40;->c:Landroid/view/View;

    .line 21
    .line 22
    sget p2, Ll/cdc0;->N:I

    .line 23
    .line 24
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lv/VText;

    .line 29
    .line 30
    iput-object p1, p0, Ll/nq40;->b:Lv/VText;

    .line 31
    .line 32
    const-string p2, "\u559c\u6b22"

    .line 33
    .line 34
    filled-new-array {p2}, [Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    const p3, -0x181e3

    .line 43
    .line 44
    .line 45
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 46
    .line 47
    const-string v1, "\u53f3\u6ed1\u8868\u793a\u559c\u6b22"

    .line 48
    .line 49
    invoke-static {v1, p2, p3, v0}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    const-string p1, "profile_update_guidance_type"

    .line 57
    .line 58
    const-string p2, "swipe_right"

    .line 59
    .line 60
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    filled-new-array {p1}, [Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    const-string p2, "e_profile_update_guidance"

    .line 69
    .line 70
    const-string p3, "p_suggest_users_home_view"

    .line 71
    .line 72
    invoke-static {p2, p3, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Ll/nq40;->c:Landroid/view/View;

    .line 76
    .line 77
    return-object p0
.end method

.method public e(Landroid/view/View;ILcom/p1/mobile/putong/core/data/VirtualCardType;Landroid/view/View;)V
    .locals 1
    .param p4    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 p3, 0x1

    .line 10
    invoke-interface {p1, p3, p4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Pl(ZLandroid/view/View;)V

    .line 11
    .line 12
    .line 13
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 14
    .line 15
    iget-object p3, p0, Ll/nq40;->a:Lv/VDraweeView;

    .line 16
    .line 17
    const-string v0, "https://auto.tancdn.com/v1/raw/af204a43-7d1a-4339-abaf-743f0f956e1714.jpg"

    .line 18
    .line 19
    invoke-virtual {p1, p3, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/nq40;->d:Landroid/animation/Animator;

    .line 23
    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    if-eqz p1, :cond_2

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/animation/Animator;->isRunning()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    iget-object p1, p0, Ll/nq40;->d:Landroid/animation/Animator;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/animation/Animator;->end()V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/nq40;->d:Landroid/animation/Animator;

    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 42
    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    invoke-virtual {p4, p0}, Landroid/view/View;->setTranslationX(F)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p4, p0}, Landroid/view/View;->setRotation(F)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    if-nez p1, :cond_1

    .line 53
    .line 54
    invoke-virtual {p0, p4}, Ll/nq40;->j(Landroid/view/View;)Landroid/animation/Animator;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, p0, Ll/nq40;->d:Landroid/animation/Animator;

    .line 59
    .line 60
    :cond_1
    iget-object p1, p0, Ll/nq40;->d:Landroid/animation/Animator;

    .line 61
    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/animation/Animator;->isRunning()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-nez p1, :cond_2

    .line 69
    .line 70
    iget-boolean p1, p0, Ll/nq40;->e:Z

    .line 71
    .line 72
    if-nez p1, :cond_2

    .line 73
    .line 74
    iget-object p0, p0, Ll/nq40;->d:Landroid/animation/Animator;

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 77
    .line 78
    .line 79
    :cond_2
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public g(Lcom/p1/mobile/putong/core/data/SwipeDirection;Ll/jam;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nq40;->i()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->xe()V

    .line 13
    .line 14
    .line 15
    const-string p0, "profile_update_guidance_type"

    .line 16
    .line 17
    const-string p1, "swipe_right"

    .line 18
    .line 19
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    filled-new-array {p0}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "e_profile_update_guidance"

    .line 28
    .line 29
    const-string p2, "p_suggest_users_home_view"

    .line 30
    .line 31
    invoke-static {p1, p2, p0}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 35
    .line 36
    return-object p0
.end method

.method public final i()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nq40;->d:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/nq40;->d:Landroid/animation/Animator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/nq40;->d:Landroid/animation/Animator;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final j(Landroid/view/View;)Landroid/animation/Animator;
    .locals 5

    .line 1
    sget p0, Ll/qa00;->y:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    new-array v1, v0, [F

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
    const-wide/16 v2, 0x3e8

    .line 14
    .line 15
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    const v3, 0x3f147ae1    # 0.58f

    .line 20
    .line 21
    .line 22
    const/high16 v4, 0x3f800000    # 1.0f

    .line 23
    .line 24
    invoke-static {v2, v2, v3, v4}, Ll/zi60;->a(FFFF)Landroid/view/animation/Interpolator;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 29
    .line 30
    .line 31
    const/4 v2, -0x1

    .line 32
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 36
    .line 37
    .line 38
    new-instance v0, Ll/mq40;

    .line 39
    .line 40
    const/high16 v2, 0x40400000    # 3.0f

    .line 41
    .line 42
    invoke-direct {v0, p1, p0, v2}, Ll/mq40;-><init>(Landroid/view/View;IF)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 46
    .line 47
    .line 48
    return-object v1

    .line 49
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x40000000    # 2.0f
    .end array-data
.end method
