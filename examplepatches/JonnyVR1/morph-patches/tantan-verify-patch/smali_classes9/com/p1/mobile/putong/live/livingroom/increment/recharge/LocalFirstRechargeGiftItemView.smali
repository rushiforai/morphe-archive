.class public Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VText;

.field public e:Lv/VDraweeView;

.field public f:Lv/VImage;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public j:Lv/VText;

.field public k:Lv/VImage;

.field public l:Lv/VImage;

.field public m:Landroid/animation/Animator;

.field public n:Landroid/animation/ObjectAnimator;

.field public o:Landroid/animation/ObjectAnimator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Ll/x20;Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveBonus;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance p1, Ll/bae0$a;

    .line 15
    .line 16
    const/16 p3, 0xbb8

    .line 17
    .line 18
    invoke-direct {p1, p3}, Ll/bae0$a;-><init>(I)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBonus;->schema:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ll/bae0$a;->c()Ll/bae0;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic i0(Ljava/lang/String;Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveBonus;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string p3, "notice"

    .line 5
    .line 6
    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p3

    .line 10
    if-nez p3, :cond_1

    .line 11
    .line 12
    const-string p3, "animation"

    .line 13
    .line 14
    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-nez p0, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBonus;->noticeText:Ljava/lang/String;

    .line 26
    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBonus;->resourceId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p0, p1, p2}, Ll/lpc0;->g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBonus;->noticeText:Ljava/lang/String;

    .line 38
    .line 39
    const/4 p2, 0x0

    .line 40
    invoke-static {p0, p1, p2}, Ll/lpc0;->g(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public final j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rvv;->a(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final k0()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->n:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x2

    .line 5
    const/4 v3, 0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->l:Lv/VImage;

    .line 9
    .line 10
    const/high16 v0, 0x42180000    # 38.0f

    .line 11
    .line 12
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    neg-int v0, v0

    .line 17
    int-to-float v0, v0

    .line 18
    const/high16 v5, 0x43040000    # 132.0f

    .line 19
    .line 20
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    int-to-float v5, v5

    .line 25
    new-array v11, v2, [F

    .line 26
    .line 27
    aput v0, v11, v1

    .line 28
    .line 29
    aput v5, v11, v3

    .line 30
    .line 31
    sget-object v5, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 32
    .line 33
    const-wide/16 v6, 0x190

    .line 34
    .line 35
    const-wide/16 v8, 0x320

    .line 36
    .line 37
    const/4 v10, 0x0

    .line 38
    invoke-static/range {v4 .. v11}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Landroid/animation/ObjectAnimator;

    .line 43
    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->n:Landroid/animation/ObjectAnimator;

    .line 45
    .line 46
    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 47
    .line 48
    .line 49
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->o:Landroid/animation/ObjectAnimator;

    .line 50
    .line 51
    if-nez v0, :cond_1

    .line 52
    .line 53
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->l:Lv/VImage;

    .line 54
    .line 55
    new-array v11, v2, [F

    .line 56
    .line 57
    fill-array-data v11, :array_0

    .line 58
    .line 59
    .line 60
    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 61
    .line 62
    const-wide/16 v6, 0x190

    .line 63
    .line 64
    const-wide/16 v8, 0x320

    .line 65
    .line 66
    const/4 v10, 0x0

    .line 67
    invoke-static/range {v4 .. v11}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Landroid/animation/ObjectAnimator;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->o:Landroid/animation/ObjectAnimator;

    .line 74
    .line 75
    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 76
    .line 77
    .line 78
    :cond_1
    new-instance v5, Landroid/view/animation/LinearInterpolator;

    .line 79
    .line 80
    invoke-direct {v5}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 81
    .line 82
    .line 83
    new-instance v8, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView$a;

    .line 84
    .line 85
    invoke-direct {v8, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->o:Landroid/animation/ObjectAnimator;

    .line 89
    .line 90
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->n:Landroid/animation/ObjectAnimator;

    .line 91
    .line 92
    new-array v9, v2, [Landroid/animation/Animator;

    .line 93
    .line 94
    aput-object v0, v9, v1

    .line 95
    .line 96
    aput-object v4, v9, v3

    .line 97
    .line 98
    const/4 v4, 0x1

    .line 99
    const-wide/16 v6, 0x320

    .line 100
    .line 101
    invoke-static/range {v4 .. v9}, Ll/gt0;->t(ZLandroid/view/animation/Interpolator;JLandroid/animation/Animator$AnimatorListener;[Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->m:Landroid/animation/Animator;

    .line 106
    .line 107
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public l0(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveBonus;ZLl/x20;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->g:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBonus;->title:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->g:Lv/VText;

    .line 9
    .line 10
    if-eqz p3, :cond_0

    .line 11
    .line 12
    sget v1, Ll/n9c0;->T0:I

    .line 13
    .line 14
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    sget v1, Ll/n9c0;->D:I

    .line 20
    .line 21
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->i:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 29
    .line 30
    invoke-static {v0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->h:Lv/VText;

    .line 34
    .line 35
    xor-int/lit8 v1, p3, 0x1

    .line 36
    .line 37
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->h:Lv/VText;

    .line 41
    .line 42
    if-eqz p3, :cond_1

    .line 43
    .line 44
    const/high16 v1, 0x41000000    # 8.0f

    .line 45
    .line 46
    :goto_1
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    goto :goto_2

    .line 51
    :cond_1
    const/high16 v1, 0x40000000    # 2.0f

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :goto_2
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->d:Lv/VText;

    .line 58
    .line 59
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBonus;->banner:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    xor-int/lit8 v1, v1, 0x1

    .line 66
    .line 67
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBonus;->banner:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_2

    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->d:Lv/VText;

    .line 79
    .line 80
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBonus;->banner:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    :cond_2
    if-eqz p3, :cond_3

    .line 86
    .line 87
    invoke-virtual {p0, p1, p2, p4}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->m0(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveBonus;Ll/x20;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->n0(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveBonus;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public final m0(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveBonus;Ll/x20;)V
    .locals 4

    .line 1
    sget v0, Ll/obc0;->I0:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->e:Lv/VDraweeView;

    .line 11
    .line 12
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBonus;->bonusIcon:Ljava/lang/String;

    .line 13
    .line 14
    const-string v2, "context_livingAct"

    .line 15
    .line 16
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBonus;->schema:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    xor-int/lit8 v1, v0, 0x1

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->j:Lv/VText;

    .line 28
    .line 29
    iget-object v3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBonus;->bonusDescription:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->j:Lv/VText;

    .line 35
    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    sget v3, Ll/n9c0;->D:I

    .line 39
    .line 40
    invoke-static {v3}, Ll/n3d0;->a(I)I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    sget v3, Ll/n9c0;->T0:I

    .line 46
    .line 47
    invoke-static {v3}, Ll/n3d0;->a(I)I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    :goto_0
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 52
    .line 53
    .line 54
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->k:Lv/VImage;

    .line 55
    .line 56
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->g:Lv/VText;

    .line 60
    .line 61
    const/high16 v2, 0x41000000    # 8.0f

    .line 62
    .line 63
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    invoke-static {v1, v2}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->i:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 71
    .line 72
    if-nez v0, :cond_1

    .line 73
    .line 74
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 75
    .line 76
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    sget v3, Ll/obc0;->G0:I

    .line 81
    .line 82
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    goto :goto_1

    .line 87
    :cond_1
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 88
    .line 89
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    sget v3, Ll/obc0;->H0:I

    .line 94
    .line 95
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    :goto_1
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 100
    .line 101
    .line 102
    if-nez v0, :cond_2

    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->k0()V

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->i:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 108
    .line 109
    new-instance v0, Ll/pvv;

    .line 110
    .line 111
    invoke-direct {v0, p3, p1, p2}, Ll/pvv;-><init>(Ll/x20;Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveBonus;)V

    .line 112
    .line 113
    .line 114
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 115
    .line 116
    .line 117
    :cond_2
    return-void
.end method

.method public final n0(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveBonus;)V
    .locals 3

    .line 1
    sget v0, Ll/obc0;->K0:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->e:Lv/VDraweeView;

    .line 11
    .line 12
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBonus;->icon:Ljava/lang/String;

    .line 13
    .line 14
    const-string v2, "context_livingAct"

    .line 15
    .line 16
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->h:Lv/VText;

    .line 20
    .line 21
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBonus;->description:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->h:Lv/VText;

    .line 27
    .line 28
    const/high16 v1, 0x41200000    # 10.0f

    .line 29
    .line 30
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBonus;->clickAction:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->f:Lv/VImage;

    .line 44
    .line 45
    if-nez v1, :cond_1

    .line 46
    .line 47
    const/4 v1, 0x1

    .line 48
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    const-string v1, "animation"

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_0

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->f:Lv/VImage;

    .line 60
    .line 61
    sget v2, Ll/obc0;->X1:I

    .line 62
    .line 63
    invoke-static {v2}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v1, v2}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    const-string v1, "notice"

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-eqz v1, :cond_2

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->f:Lv/VImage;

    .line 80
    .line 81
    sget v2, Ll/obc0;->Y1:I

    .line 82
    .line 83
    invoke-static {v2}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-virtual {v1, v2}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    const/4 v1, 0x0

    .line 92
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 93
    .line 94
    .line 95
    :cond_2
    :goto_0
    new-instance v1, Ll/qvv;

    .line 96
    .line 97
    invoke-direct {v1, v0, p1, p2}, Ll/qvv;-><init>(Ljava/lang/String;Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveBonus;)V

    .line 98
    .line 99
    .line 100
    invoke-static {p0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->m:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/recharge/LocalFirstRechargeGiftItemView;->j0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
