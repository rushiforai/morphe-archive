.class public Ll/yo1;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Landroid/widget/TextView;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic b(Landroid/widget/TextView;Landroid/animation/ValueAnimator;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    float-to-double v0, p1

    .line 12
    const-wide v2, 0x3fc999999999999aL    # 0.2

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    cmpg-double v2, v0, v2

    .line 18
    .line 19
    const v3, 0x3e4ccccd    # 0.2f

    .line 20
    .line 21
    .line 22
    const v4, 0x3dcccccd    # 0.1f

    .line 23
    .line 24
    .line 25
    const/high16 v5, 0x3f800000    # 1.0f

    .line 26
    .line 27
    if-gez v2, :cond_0

    .line 28
    .line 29
    div-float/2addr p1, v3

    .line 30
    mul-float/2addr p1, v4

    .line 31
    sub-float/2addr v5, p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    const-wide v6, 0x3fd6666666666666L    # 0.35

    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    cmpg-double v2, v0, v6

    .line 39
    .line 40
    if-gez v2, :cond_1

    .line 41
    .line 42
    sub-float/2addr p1, v3

    .line 43
    const v0, 0x3e19999a    # 0.15f

    .line 44
    .line 45
    .line 46
    div-float/2addr p1, v0

    .line 47
    mul-float/2addr p1, v0

    .line 48
    const v0, 0x3f666666    # 0.9f

    .line 49
    .line 50
    .line 51
    :goto_0
    add-float v5, p1, v0

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    const-wide v2, 0x3fdccccccccccccdL    # 0.45

    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    cmpg-double v2, v0, v2

    .line 60
    .line 61
    if-gez v2, :cond_2

    .line 62
    .line 63
    const v0, 0x3eb33333    # 0.35f

    .line 64
    .line 65
    .line 66
    sub-float/2addr p1, v0

    .line 67
    div-float/2addr p1, v4

    .line 68
    mul-float/2addr p1, v4

    .line 69
    const v0, 0x3f866666    # 1.05f

    .line 70
    .line 71
    .line 72
    sub-float v5, v0, p1

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_2
    const-wide v2, 0x3fe199999999999aL    # 0.55

    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    cmpg-double v0, v0, v2

    .line 81
    .line 82
    if-gtz v0, :cond_3

    .line 83
    .line 84
    const v0, 0x3ee66666    # 0.45f

    .line 85
    .line 86
    .line 87
    sub-float/2addr p1, v0

    .line 88
    div-float/2addr p1, v4

    .line 89
    const v0, 0x3d4ccccd    # 0.05f

    .line 90
    .line 91
    .line 92
    mul-float/2addr p1, v0

    .line 93
    const v0, 0x3f733333    # 0.95f

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_3
    :goto_1
    invoke-virtual {p0, v5}, Landroid/view/View;->setScaleX(F)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0, v5}, Landroid/view/View;->setScaleY(F)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public static synthetic c(Landroid/widget/TextView;)V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->D4:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic d(Landroid/widget/TextView;Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;)V
    .locals 1

    .line 1
    sget v0, Ll/obc0;->z0:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic e(ZLandroid/widget/TextView;Landroid/widget/FrameLayout;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/cxv;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    :cond_0
    const-string p0, ""

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    :cond_1
    sget p0, Ll/obc0;->z0:I

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    invoke-static {p1, p0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    invoke-static {p2, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;ILandroid/widget/TextView;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 6
    .line 7
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic g(Landroid/widget/TextView;)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleX(F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleY(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic h(Landroid/widget/TextView;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/cxv;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;->setProcess(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic j(Landroid/widget/TextView;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static k(Ll/dw40;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-static {}, Ll/tfs;->k()Ll/tfs$a;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ll/tfs$a;->h(Ljava/lang/String;)Ll/tfs$a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    const-string p2, "liveRoom_topleft"

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v3, "liveRoom_topleft_"

    .line 29
    .line 30
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    :goto_0
    invoke-virtual {v1, p2}, Ll/tfs$a;->e(Ljava/lang/String;)Ll/tfs$a;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p2, v0}, Ll/tfs$a;->d(Ljava/lang/String;)Ll/tfs$a;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p0}, Ll/dw40;->A2()Ll/ew40;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Ll/ew40;->c()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    if-eqz p0, :cond_1

    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p2, v0}, Ll/tfs$a;->f(Ljava/lang/String;)Ll/tfs$a;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 67
    .line 68
    invoke-virtual {v0, p0}, Ll/tfs$a;->g(Lcom/p1/mobile/putong/live/base/data/BLiveState;)Ll/tfs$a;

    .line 69
    .line 70
    .line 71
    :cond_1
    invoke-virtual {p2}, Ll/tfs$a;->a()Ll/tfs;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {p1, p0}, Ll/afu;->d(Ljava/lang/String;Ll/tfs;)V

    .line 76
    .line 77
    .line 78
    :cond_2
    return-void
.end method

.method public static l(Landroid/content/Context;ILandroid/widget/TextView;)Landroid/animation/Animator;
    .locals 4

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->F4:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/high16 v0, 0x41800000    # 16.0f

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/16 v1, 0xc

    .line 14
    .line 15
    invoke-static {v1, p0}, Ll/ynp0;->s(ILjava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    add-int/2addr v0, p0

    .line 20
    filled-new-array {v0, p1}, [I

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-wide/16 v0, 0x190

    .line 29
    .line 30
    invoke-virtual {p0, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance p1, Ll/oo1;

    .line 35
    .line 36
    invoke-direct {p1, p2}, Ll/oo1;-><init>(Landroid/widget/TextView;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 40
    .line 41
    .line 42
    new-instance p1, Ll/po1;

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ll/po1;-><init>(Landroid/widget/TextView;)V

    .line 45
    .line 46
    .line 47
    new-instance v2, Ll/qo1;

    .line 48
    .line 49
    invoke-direct {v2, p2}, Ll/qo1;-><init>(Landroid/widget/TextView;)V

    .line 50
    .line 51
    .line 52
    invoke-static {p0, p1, v2}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 53
    .line 54
    .line 55
    const/4 p1, 0x2

    .line 56
    new-array v2, p1, [F

    .line 57
    .line 58
    fill-array-data v2, :array_0

    .line 59
    .line 60
    .line 61
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    new-instance v3, Ll/ro1;

    .line 66
    .line 67
    invoke-direct {v3, p2}, Ll/ro1;-><init>(Landroid/widget/TextView;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 71
    .line 72
    .line 73
    new-instance v3, Ll/so1;

    .line 74
    .line 75
    invoke-direct {v3, p2}, Ll/so1;-><init>(Landroid/widget/TextView;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v2, v3}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2, v0, v1}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 82
    .line 83
    .line 84
    const-wide/16 v0, 0x226

    .line 85
    .line 86
    invoke-virtual {v2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 87
    .line 88
    .line 89
    new-array p1, p1, [Landroid/animation/Animator;

    .line 90
    .line 91
    const/4 p2, 0x0

    .line 92
    aput-object p0, p1, p2

    .line 93
    .line 94
    const/4 p0, 0x1

    .line 95
    aput-object v2, p1, p0

    .line 96
    .line 97
    invoke-static {p1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    return-object p0

    .line 102
    nop

    .line 103
    :array_0
    .array-data 4
        0x0
        0x3f0ccccd    # 0.55f
    .end array-data
.end method

.method public static m(Landroid/content/Context;ILandroid/widget/TextView;Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;Landroid/widget/FrameLayout;Z)Landroid/animation/Animator;
    .locals 5

    .line 1
    if-eqz p5, :cond_0

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->F4:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->N3:I

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :goto_0
    const/high16 v0, 0x41800000    # 16.0f

    .line 17
    .line 18
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/16 v1, 0xc

    .line 23
    .line 24
    invoke-static {v1, p0}, Ll/ynp0;->s(ILjava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    add-int/2addr v0, v1

    .line 29
    filled-new-array {p1, v0}, [I

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-wide/16 v1, 0x190

    .line 38
    .line 39
    invoke-virtual {p1, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance v3, Ll/to1;

    .line 44
    .line 45
    invoke-direct {v3, p2}, Ll/to1;-><init>(Landroid/widget/TextView;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 49
    .line 50
    .line 51
    new-instance v3, Ll/uo1;

    .line 52
    .line 53
    invoke-direct {v3, p5, p2, p4}, Ll/uo1;-><init>(ZLandroid/widget/TextView;Landroid/widget/FrameLayout;)V

    .line 54
    .line 55
    .line 56
    invoke-static {p1, v3}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 57
    .line 58
    .line 59
    const/4 p4, 0x2

    .line 60
    new-array p5, p4, [F

    .line 61
    .line 62
    fill-array-data p5, :array_0

    .line 63
    .line 64
    .line 65
    invoke-static {p5}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 66
    .line 67
    .line 68
    move-result-object p5

    .line 69
    const-wide/16 v3, 0x4b0

    .line 70
    .line 71
    invoke-virtual {p5, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 72
    .line 73
    .line 74
    move-result-object p5

    .line 75
    new-instance v3, Ll/vo1;

    .line 76
    .line 77
    invoke-direct {v3, p3}, Ll/vo1;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p5, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 81
    .line 82
    .line 83
    new-instance v3, Landroid/view/animation/DecelerateInterpolator;

    .line 84
    .line 85
    invoke-direct {v3}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p5, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p5, v1, v2}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 92
    .line 93
    .line 94
    new-instance v1, Ll/wo1;

    .line 95
    .line 96
    invoke-direct {v1, p3, v0, p2, p0}, Ll/wo1;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;ILandroid/widget/TextView;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    new-instance p0, Ll/xo1;

    .line 100
    .line 101
    invoke-direct {p0, p2, p3}, Ll/xo1;-><init>(Landroid/widget/TextView;Lcom/p1/mobile/putong/live/livingroom/common/avatar/view/AvatarShineView;)V

    .line 102
    .line 103
    .line 104
    invoke-static {p5, v1, p0}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 105
    .line 106
    .line 107
    new-array p0, p4, [Landroid/animation/Animator;

    .line 108
    .line 109
    const/4 p2, 0x0

    .line 110
    aput-object p1, p0, p2

    .line 111
    .line 112
    const/4 p1, 0x1

    .line 113
    aput-object p5, p0, p1

    .line 114
    .line 115
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    return-object p0

    .line 120
    nop

    .line 121
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
