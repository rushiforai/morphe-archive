.class public Ll/asj0;
.super Ll/bsj0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bsj0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic W(Landroid/widget/ImageView;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bsj0;->r(Landroid/view/View;)Landroid/animation/Animator;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {p0, p2}, Ll/gt0;->b(Landroid/view/View;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    invoke-interface {p1}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic X(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Y(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static Z(Landroid/widget/ImageView;Ll/x20;)V
    .locals 1

    .line 1
    new-instance v0, Ll/srj0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/srj0;-><init>(Landroid/widget/ImageView;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static a0(Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Y:Lcom/p1/mobile/putong/core/api/w;

    .line 4
    .line 5
    const-string v1, "-1"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/w;->d3(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v2, Ll/nrj0;

    .line 12
    .line 13
    invoke-direct {v2}, Ll/nrj0;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v3, Ll/qrj0;

    .line 17
    .line 18
    invoke-direct {v3}, Ll/qrj0;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-static {p0, v1, v0, v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static b0(Ll/vql;Lv/VDraweeView;)Landroid/animation/Animator;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, p1, v0}, Ll/asj0;->c0(Ll/vql;Lv/VDraweeView;Z)Landroid/animation/Animator;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static c0(Ll/vql;Lv/VDraweeView;Z)Landroid/animation/Animator;
    .locals 14

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-wide/16 v1, 0x3e8

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Landroid/view/animation/ScaleAnimation;

    .line 18
    .line 19
    const/4 v8, 0x1

    .line 20
    const/high16 v9, 0x3f000000    # 0.5f

    .line 21
    .line 22
    const/high16 v2, 0x3f800000    # 1.0f

    .line 23
    .line 24
    const v3, 0x3f8f5c29    # 1.12f

    .line 25
    .line 26
    .line 27
    const/high16 v4, 0x3f800000    # 1.0f

    .line 28
    .line 29
    const v5, 0x3f8f5c29    # 1.12f

    .line 30
    .line 31
    .line 32
    const/4 v6, 0x1

    .line 33
    const/high16 v7, 0x3f000000    # 0.5f

    .line 34
    .line 35
    invoke-direct/range {v1 .. v9}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    .line 36
    .line 37
    .line 38
    const-wide/16 v2, 0x1f4

    .line 39
    .line 40
    invoke-virtual {v1, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 41
    .line 42
    .line 43
    new-instance v4, Landroid/view/animation/AccelerateInterpolator;

    .line 44
    .line 45
    invoke-direct {v4}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, v4}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 49
    .line 50
    .line 51
    const/4 v4, 0x1

    .line 52
    invoke-virtual {v1, v4}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 53
    .line 54
    .line 55
    new-instance v5, Landroid/view/animation/ScaleAnimation;

    .line 56
    .line 57
    const/4 v12, 0x1

    .line 58
    const/high16 v13, 0x3f000000    # 0.5f

    .line 59
    .line 60
    const v6, 0x3f8f5c29    # 1.12f

    .line 61
    .line 62
    .line 63
    const/high16 v7, 0x3f800000    # 1.0f

    .line 64
    .line 65
    const v8, 0x3f8f5c29    # 1.12f

    .line 66
    .line 67
    .line 68
    const/high16 v9, 0x3f800000    # 1.0f

    .line 69
    .line 70
    const/4 v10, 0x1

    .line 71
    const/high16 v11, 0x3f000000    # 0.5f

    .line 72
    .line 73
    invoke-direct/range {v5 .. v13}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v5, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 77
    .line 78
    .line 79
    new-instance v2, Landroid/view/animation/DecelerateInterpolator;

    .line 80
    .line 81
    invoke-direct {v2}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v5, v2}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 85
    .line 86
    .line 87
    const/4 v2, 0x0

    .line 88
    invoke-virtual {v5, v2}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 89
    .line 90
    .line 91
    new-instance v2, Ll/asj0$a;

    .line 92
    .line 93
    move/from16 v3, p2

    .line 94
    .line 95
    invoke-direct {v2, p0, v3, p1, v5}, Ll/asj0$a;-><init>(Ll/vql;ZLv/VDraweeView;Landroid/view/animation/ScaleAnimation;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1, v2}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 99
    .line 100
    .line 101
    const/4 v2, -0x1

    .line 102
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 103
    .line 104
    .line 105
    new-instance v2, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 106
    .line 107
    invoke-direct {v2}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 111
    .line 112
    .line 113
    move-object v4, v1

    .line 114
    new-instance v1, Ll/asj0$b;

    .line 115
    .line 116
    move-object v6, p0

    .line 117
    move v2, v3

    .line 118
    move-object v3, p1

    .line 119
    invoke-direct/range {v1 .. v6}, Ll/asj0$b;-><init>(ZLv/VDraweeView;Landroid/view/animation/ScaleAnimation;Landroid/view/animation/ScaleAnimation;Ll/vql;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 123
    .line 124
    .line 125
    return-object v0

    .line 126
    nop

    .line 127
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static d0()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/jm5;->a:Ll/jxd0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    sget-object v0, Ll/jm5;->c:Ll/jxd0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/lang/Boolean;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    :cond_0
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    sget-object v0, Ll/jm5;->c:Ll/jxd0;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ljava/lang/Boolean;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    :cond_1
    const/4 v0, 0x1

    .line 56
    return v0

    .line 57
    :cond_2
    const/4 v0, 0x0

    .line 58
    return v0
.end method

.method public static e0()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->d:Ll/wr2;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wr2;->o()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_2

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/lang/Integer;

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v2, 0x1

    .line 28
    if-eq v1, v2, :cond_1

    .line 29
    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    sget-object v3, Lcom/p1/mobile/putong/core/CoreBusinessModule;->d:Ll/wr2;

    .line 33
    .line 34
    const/4 v4, 0x2

    .line 35
    invoke-virtual {v3, v4}, Ll/wr2;->n(I)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-nez v3, :cond_1

    .line 40
    .line 41
    invoke-static {v1}, Ll/u17;->v(I)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-nez v3, :cond_1

    .line 46
    .line 47
    invoke-static {v1}, Ll/u17;->w(I)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_0

    .line 52
    .line 53
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 56
    .line 57
    const-string v1, "ongoing"

    .line 58
    .line 59
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const-string v3, "removed"

    .line 64
    .line 65
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-virtual {v0, v1, v3, v2, v2}, Lcom/p1/mobile/putong/core/api/g;->Wp(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;ZZ)Lrx/c;

    .line 70
    .line 71
    .line 72
    :cond_2
    return-void
.end method

.method public static f0(Ljava/lang/String;)V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->d:Ll/wr2;

    .line 2
    .line 3
    invoke-static {p0}, Ll/u17;->r(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Ll/wr2;->n(I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->d:Ll/wr2;

    .line 14
    .line 15
    invoke-static {p0}, Ll/u17;->t(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0, v1}, Ll/wr2;->n(I)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->d:Ll/wr2;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {v0, v1}, Ll/wr2;->n(I)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/CoreBusinessModule;->d:Ll/wr2;

    .line 35
    .line 36
    const/4 v1, 0x2

    .line 37
    invoke-virtual {v0, v1}, Ll/wr2;->n(I)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    return-void

    .line 45
    :cond_1
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 48
    .line 49
    const-string v1, "ongoing"

    .line 50
    .line 51
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    const-string v3, "removed"

    .line 56
    .line 57
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-virtual {v0, v2, v4, p0}, Lcom/p1/mobile/putong/core/api/g;->Vp(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Ljava/lang/String;)Lrx/c;

    .line 62
    .line 63
    .line 64
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 67
    .line 68
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/NotificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->Vp(Lcom/p1/mobile/putong/core/data/NotificationStatus;Lcom/p1/mobile/putong/core/data/NotificationStatus;Ljava/lang/String;)Lrx/c;

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public static p(Landroid/graphics/Bitmap;III)Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    const/high16 v0, 0x41400000    # 12.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p0, p1, p2, p3, v0}, Ll/asj0;->q(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static q(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;
    .locals 11
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 1
    int-to-float p2, p2

    .line 2
    const/high16 v0, 0x3f800000    # 1.0f

    .line 3
    .line 4
    mul-float v1, p2, v0

    .line 5
    .line 6
    int-to-float p1, p1

    .line 7
    div-float/2addr v1, p1

    .line 8
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    int-to-float v2, v2

    .line 13
    mul-float/2addr v2, v0

    .line 14
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    int-to-float v3, v3

    .line 19
    div-float/2addr v2, v3

    .line 20
    cmpl-float v1, v1, v2

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    if-lez v1, :cond_0

    .line 24
    .line 25
    move v1, v2

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v1, 0x0

    .line 28
    :goto_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    int-to-float v3, v3

    .line 33
    mul-float/2addr v3, v0

    .line 34
    div-float/2addr v3, p1

    .line 35
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    int-to-float v4, v4

    .line 40
    mul-float/2addr v4, v0

    .line 41
    div-float/2addr v4, p2

    .line 42
    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    invoke-static {v0, p2}, Ljava/lang/Math;->min(FF)F

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    const/4 v3, 0x2

    .line 51
    invoke-static {p4, v3}, Ljava/lang/Math;->max(II)I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    int-to-float v3, v3

    .line 56
    const/high16 v4, 0x3e800000    # 0.25f

    .line 57
    .line 58
    div-float/2addr v4, v3

    .line 59
    const/high16 v3, 0x40000000    # 2.0f

    .line 60
    .line 61
    mul-float/2addr v4, v3

    .line 62
    const/high16 v5, 0x3f000000    # 0.5f

    .line 63
    .line 64
    invoke-static {p2, v5}, Ljava/lang/Math;->min(FF)F

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    invoke-static {p2, v4}, Ljava/lang/Math;->max(FF)F

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    if-nez v1, :cond_2

    .line 73
    .line 74
    mul-float/2addr p2, p1

    .line 75
    float-to-int p2, p2

    .line 76
    div-int/lit8 v1, p2, 0x4

    .line 77
    .line 78
    mul-int/lit8 v1, v1, 0x4

    .line 79
    .line 80
    invoke-static {v1, p2}, Ljava/lang/Math;->max(II)I

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    int-to-float v1, p2

    .line 85
    mul-float/2addr v1, v0

    .line 86
    div-float p1, v1, p1

    .line 87
    .line 88
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eq p2, v0, :cond_1

    .line 93
    .line 94
    new-instance v9, Landroid/graphics/Matrix;

    .line 95
    .line 96
    invoke-direct {v9}, Landroid/graphics/Matrix;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v9, p1, p1}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 103
    .line 104
    .line 105
    move-result v7

    .line 106
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 107
    .line 108
    .line 109
    move-result v8

    .line 110
    const/4 v10, 0x0

    .line 111
    const/4 v5, 0x0

    .line 112
    const/4 v6, 0x0

    .line 113
    move-object v4, p0

    .line 114
    invoke-static/range {v4 .. v10}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    :goto_1
    move p2, p1

    .line 119
    goto :goto_2

    .line 120
    :cond_1
    move-object v4, p0

    .line 121
    goto :goto_1

    .line 122
    :cond_2
    move-object v4, p0

    .line 123
    :goto_2
    int-to-float p1, p4

    .line 124
    mul-float/2addr p1, p2

    .line 125
    invoke-static {p1, v3}, Ljava/lang/Math;->max(FF)F

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    invoke-static {p0, p1, v2}, Ll/t43;->a(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isMutable()Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    if-nez p1, :cond_3

    .line 142
    .line 143
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-virtual {p0, p1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    :cond_3
    new-instance p1, Landroid/graphics/Canvas;

    .line 152
    .line 153
    invoke-direct {p1, p0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p1, p3}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 157
    .line 158
    .line 159
    return-object p0
.end method
