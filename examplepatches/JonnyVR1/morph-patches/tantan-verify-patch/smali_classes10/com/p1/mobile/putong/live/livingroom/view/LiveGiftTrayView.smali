.class public Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;
    }
.end annotation


# instance fields
.field public A:Z

.field public B:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$b;",
            ">;"
        }
    .end annotation
.end field

.field public C:Landroid/animation/Animator;

.field public D:Landroid/animation/Animator;

.field public E:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

.field public e:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;

.field public f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public g:Lv/VDraweeView;

.field public h:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

.field public i:Lv/VText;

.field public j:Lv/VDraweeView;

.field public k:Lv/VImage;

.field public l:Lv/VText;

.field public m:Landroid/widget/LinearLayout;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public q:Lv/VDraweeView;

.field public r:Lv/VDraweeView;

.field public s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

.field public t:Ljava/lang/Integer;

.field public u:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

.field public v:Landroid/animation/ObjectAnimator;

.field public w:Landroid/animation/AnimatorSet;

.field public x:Landroid/animation/ObjectAnimator;

.field public y:Landroid/animation/ValueAnimator;

.field public z:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;->empty:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->u:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->A:Z

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;->empty:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->u:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->A:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 16
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;->empty:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->u:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->A:Z

    return-void
.end method

.method private E0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;->empty:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->u:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->y:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->end()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private G0()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;->dismissing:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->u:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 6
    .line 7
    iget v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->d:I

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->u(I)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->e:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->B()V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->f1()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private H0(Ll/y20;)V
    .locals 7

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->z:Ll/y20;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    neg-int p1, p1

    .line 8
    int-to-float p1, p1

    .line 9
    const/high16 v0, 0x42100000    # 36.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-float v0, v0

    .line 16
    const/4 v1, 0x3

    .line 17
    new-array v2, v1, [F

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    aput p1, v2, v3

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    aput v0, v2, p1

    .line 24
    .line 25
    const/4 v0, 0x2

    .line 26
    const/4 v4, 0x0

    .line 27
    aput v4, v2, v0

    .line 28
    .line 29
    const-string v5, "translationX"

    .line 30
    .line 31
    invoke-static {p0, v5, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->v:Landroid/animation/ObjectAnimator;

    .line 36
    .line 37
    const-wide/16 v5, 0x258

    .line 38
    .line 39
    invoke-virtual {v2, v5, v6}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    new-instance v5, Landroid/view/animation/OvershootInterpolator;

    .line 44
    .line 45
    invoke-direct {v5}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2, v5}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 49
    .line 50
    .line 51
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->v:Landroid/animation/ObjectAnimator;

    .line 52
    .line 53
    invoke-virtual {v2}, Landroid/animation/Animator;->removeAllListeners()V

    .line 54
    .line 55
    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->v:Landroid/animation/ObjectAnimator;

    .line 57
    .line 58
    new-instance v5, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$d;

    .line 59
    .line 60
    invoke-direct {v5, p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$d;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2, v5}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 64
    .line 65
    .line 66
    const/high16 v2, 0x40400000    # 3.0f

    .line 67
    .line 68
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    neg-int v5, v5

    .line 73
    int-to-float v5, v5

    .line 74
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    int-to-float v2, v2

    .line 79
    const/4 v6, 0x5

    .line 80
    new-array v6, v6, [F

    .line 81
    .line 82
    aput v4, v6, v3

    .line 83
    .line 84
    aput v5, v6, p1

    .line 85
    .line 86
    aput v4, v6, v0

    .line 87
    .line 88
    aput v2, v6, v1

    .line 89
    .line 90
    const/4 p1, 0x4

    .line 91
    aput v4, v6, p1

    .line 92
    .line 93
    invoke-static {v6}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->y:Landroid/animation/ValueAnimator;

    .line 98
    .line 99
    const-wide/16 v0, 0x578

    .line 100
    .line 101
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    const/4 v0, -0x1

    .line 106
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->y:Landroid/animation/ValueAnimator;

    .line 110
    .line 111
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    .line 112
    .line 113
    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->y:Landroid/animation/ValueAnimator;

    .line 120
    .line 121
    const-wide/16 v0, 0x12c

    .line 122
    .line 123
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->y:Landroid/animation/ValueAnimator;

    .line 127
    .line 128
    new-instance v0, Ll/cms;

    .line 129
    .line 130
    invoke-direct {v0, p0}, Ll/cms;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->y:Landroid/animation/ValueAnimator;

    .line 137
    .line 138
    new-instance v0, Ll/dms;

    .line 139
    .line 140
    invoke-direct {v0, p0}, Ll/dms;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)V

    .line 141
    .line 142
    .line 143
    new-instance v1, Ll/ems;

    .line 144
    .line 145
    invoke-direct {v1, p0}, Ll/ems;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)V

    .line 146
    .line 147
    .line 148
    invoke-static {p1, v0, v1}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method private synthetic L0(Landroid/animation/ValueAnimator;)V
    .locals 2

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->j:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->e()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isNamed:Z

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->k:Lv/VImage;

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->l:Lv/VText;

    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method private synthetic N0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->j:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->e()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isNamed:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->k:Lv/VImage;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->l:Lv/VText;

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method private synthetic O0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->j:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->e()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isNamed:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->k:Lv/VImage;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->l:Lv/VText;

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method private Q0(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->R0(ZI)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private R0(ZI)V
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;->combo:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->u:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->C()Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->t:Ljava/lang/Integer;

    .line 14
    .line 15
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->t:Ljava/lang/Integer;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v0, "  "

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->o:Lv/VText;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->w:Landroid/animation/AnimatorSet;

    .line 40
    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/animation/Animator;->removeAllListeners()V

    .line 44
    .line 45
    .line 46
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->w:Landroid/animation/AnimatorSet;

    .line 47
    .line 48
    if-nez p1, :cond_2

    .line 49
    .line 50
    new-instance p1, Landroid/animation/AnimatorSet;

    .line 51
    .line 52
    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->w:Landroid/animation/AnimatorSet;

    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->m:Landroid/widget/LinearLayout;

    .line 58
    .line 59
    const/4 v0, 0x2

    .line 60
    new-array v1, v0, [F

    .line 61
    .line 62
    fill-array-data v1, :array_0

    .line 63
    .line 64
    .line 65
    const-string v2, "alpha"

    .line 66
    .line 67
    invoke-static {p1, v2, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    const-wide/16 v1, 0xc8

    .line 72
    .line 73
    invoke-virtual {p1, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->w:Landroid/animation/AnimatorSet;

    .line 77
    .line 78
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->m:Landroid/widget/LinearLayout;

    .line 79
    .line 80
    sget-object v3, Ll/gt0;->i:Landroid/util/Property;

    .line 81
    .line 82
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 83
    .line 84
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 85
    .line 86
    .line 87
    new-array v9, v0, [F

    .line 88
    .line 89
    fill-array-data v9, :array_1

    .line 90
    .line 91
    .line 92
    const-wide/16 v4, 0x0

    .line 93
    .line 94
    const-wide/16 v6, 0x8c

    .line 95
    .line 96
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->m:Landroid/widget/LinearLayout;

    .line 105
    .line 106
    sget-object v3, Ll/gt0;->i:Landroid/util/Property;

    .line 107
    .line 108
    new-instance v8, Landroid/view/animation/LinearInterpolator;

    .line 109
    .line 110
    invoke-direct {v8}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 111
    .line 112
    .line 113
    new-array v9, v0, [F

    .line 114
    .line 115
    fill-array-data v9, :array_2

    .line 116
    .line 117
    .line 118
    const-wide/16 v4, 0x8c

    .line 119
    .line 120
    const-wide/16 v6, 0xa0

    .line 121
    .line 122
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->E:Ll/y20;

    .line 134
    .line 135
    if-eqz v0, :cond_2

    .line 136
    .line 137
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->setIntlFlyMicListener(Landroid/animation/ObjectAnimator;)V

    .line 138
    .line 139
    .line 140
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->w:Landroid/animation/AnimatorSet;

    .line 141
    .line 142
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$c;

    .line 143
    .line 144
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$c;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 148
    .line 149
    .line 150
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->w:Landroid/animation/AnimatorSet;

    .line 151
    .line 152
    int-to-long v0, p2

    .line 153
    invoke-virtual {p1, v0, v1}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 154
    .line 155
    .line 156
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->w:Landroid/animation/AnimatorSet;

    .line 157
    .line 158
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    nop

    .line 163
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    :array_1
    .array-data 4
        0x40400000    # 3.0f
        0x3f333333    # 0.7f
    .end array-data

    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    :array_2
    .array-data 4
        0x3f333333    # 0.7f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private S0()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->A:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->V0()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->Z0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->u:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;->dismissing:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 18
    .line 19
    if-eq v0, v1, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->Q0(Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;->pending:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->u:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->T0()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private T0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->x:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    neg-int v0, v0

    .line 11
    int-to-float v0, v0

    .line 12
    const/4 v1, 0x2

    .line 13
    new-array v1, v1, [F

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    const/4 v3, 0x0

    .line 17
    aput v2, v1, v3

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    aput v0, v1, v2

    .line 21
    .line 22
    sget-object v0, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 23
    .line 24
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->x:Landroid/animation/ObjectAnimator;

    .line 29
    .line 30
    const-wide/16 v1, 0x96

    .line 31
    .line 32
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 37
    .line 38
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->x:Landroid/animation/ObjectAnimator;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 47
    .line 48
    iget-wide v1, v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->i:J

    .line 49
    .line 50
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->x:Landroid/animation/ObjectAnimator;

    .line 54
    .line 55
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$b;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->x:Landroid/animation/ObjectAnimator;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method private V0()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    neg-int v0, v0

    .line 6
    int-to-float v0, v0

    .line 7
    const/4 v1, 0x2

    .line 8
    new-array v1, v1, [F

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x0

    .line 12
    aput v2, v1, v3

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    aput v0, v1, v2

    .line 16
    .line 17
    const-string v0, "translationX"

    .line 18
    .line 19
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-wide/16 v1, 0x96

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 30
    .line 31
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 35
    .line 36
    .line 37
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$a;

    .line 38
    .line 39
    invoke-direct {v1, p0, v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;Landroid/animation/ObjectAnimator;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method private d1()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->I:Z

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-static {v0}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 13
    .line 14
    iget-object v3, v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->B:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->J:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 17
    .line 18
    invoke-virtual {v0, v3, v1, v2}, Ll/nsv;->c(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)Ll/nsv;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-static {v0}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->J:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/nsv;->e(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)Ll/nsv;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 36
    .line 37
    sget v1, Ll/qa00;->A:I

    .line 38
    .line 39
    new-instance v3, Ll/fms;

    .line 40
    .line 41
    invoke-direct {v3, v0}, Ll/fms;-><init>(Ll/nsv;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p0, v1, v0, v3, v2}, Ll/biv;->c(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;Ll/qcj;I)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->N0()V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->P0(Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->L0(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic k0(Ll/nsv;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->z:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->O0()V

    return-void
.end method

.method public static bridge synthetic m0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->E:Ll/y20;

    return-object p0
.end method

.method public static bridge synthetic n0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->y:Landroid/animation/ValueAnimator;

    return-object p0
.end method

.method public static bridge synthetic o0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->t:Ljava/lang/Integer;

    return-object p0
.end method

.method public static bridge synthetic p0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->z:Ll/y20;

    return-object p0
.end method

.method public static bridge synthetic q0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Landroid/animation/ObjectAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->v:Landroid/animation/ObjectAnimator;

    return-object p0
.end method

.method private r()V
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->d1()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->h:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->A:Ljava/lang/String;

    .line 9
    .line 10
    sget v2, Ll/n9c0;->e1:I

    .line 11
    .line 12
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 17
    .line 18
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->J:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 19
    .line 20
    if-eqz v3, :cond_0

    .line 21
    .line 22
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userNameGradientColors:Ljava/util/List;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v3, 0x0

    .line 26
    :goto_0
    invoke-static {v0, v1, v2, v3}, Ll/und0;->b(Landroid/widget/TextView;Ljava/lang/CharSequence;ILjava/util/List;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->i:Lv/VText;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->v:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->j:Lv/VDraweeView;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->w:Ljava/lang/String;

    .line 43
    .line 44
    sget v2, Ll/qa00;->B:I

    .line 45
    .line 46
    const-string v3, "context_livingAct"

    .line 47
    .line 48
    invoke-static {v3, v0, v1, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->o:Lv/VText;

    .line 52
    .line 53
    new-instance v1, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->t:Ljava/lang/Integer;

    .line 59
    .line 60
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v4, "  "

    .line 64
    .line 65
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 76
    .line 77
    iget v1, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->d:I

    .line 78
    .line 79
    const/4 v4, 0x1

    .line 80
    if-ne v1, v4, :cond_1

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->e:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;

    .line 83
    .line 84
    sget-object v5, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;->first:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;

    .line 85
    .line 86
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->H:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v1, v5, v0}, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->v(Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_1
    const/16 v5, 0x64

    .line 93
    .line 94
    if-ne v1, v5, :cond_2

    .line 95
    .line 96
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->e:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;

    .line 97
    .line 98
    sget-object v5, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;->second:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;

    .line 99
    .line 100
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->H:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {v1, v5, v0}, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->v(Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_2
    const/16 v5, 0xc8

    .line 107
    .line 108
    if-ne v1, v5, :cond_3

    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->e:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;

    .line 111
    .line 112
    sget-object v5, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;->third:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;

    .line 113
    .line 114
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->H:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {v1, v5, v0}, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->v(Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_3
    const/16 v5, 0x12c

    .line 121
    .line 122
    if-ne v1, v5, :cond_4

    .line 123
    .line 124
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->e:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;

    .line 125
    .line 126
    sget-object v5, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;->fourth:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;

    .line 127
    .line 128
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->H:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {v1, v5, v0}, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->v(Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 134
    .line 135
    const/4 v1, 0x0

    .line 136
    if-eqz v0, :cond_5

    .line 137
    .line 138
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->R:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 139
    .line 140
    if-eqz v0, :cond_5

    .line 141
    .line 142
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;->background:Ljava/lang/String;

    .line 143
    .line 144
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-nez v0, :cond_5

    .line 149
    .line 150
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->e:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;

    .line 151
    .line 152
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 153
    .line 154
    iget-object v5, v5, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->R:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;

    .line 155
    .line 156
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBriefTray;->background:Ljava/lang/String;

    .line 157
    .line 158
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->setBackgroundImg(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    goto :goto_2

    .line 162
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->e:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;

    .line 163
    .line 164
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->b:Lv/VDraweeView;

    .line 165
    .line 166
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 167
    .line 168
    .line 169
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->e:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;

    .line 170
    .line 171
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->a:Landroid/view/View;

    .line 172
    .line 173
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 174
    .line 175
    .line 176
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->k:Lv/VImage;

    .line 177
    .line 178
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 179
    .line 180
    invoke-virtual {v5}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->e()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 181
    .line 182
    .line 183
    move-result-object v5

    .line 184
    iget-boolean v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isNamed:Z

    .line 185
    .line 186
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 187
    .line 188
    .line 189
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->l:Lv/VText;

    .line 190
    .line 191
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 192
    .line 193
    invoke-virtual {v5}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->e()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 194
    .line 195
    .line 196
    move-result-object v5

    .line 197
    iget-boolean v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->isNamed:Z

    .line 198
    .line 199
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 200
    .line 201
    .line 202
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->l:Lv/VText;

    .line 203
    .line 204
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    if-eqz v0, :cond_6

    .line 209
    .line 210
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->l:Lv/VText;

    .line 211
    .line 212
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 217
    .line 218
    .line 219
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 220
    .line 221
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->U:Ljava/lang/String;

    .line 222
    .line 223
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->g:Lv/VDraweeView;

    .line 228
    .line 229
    if-eqz v0, :cond_7

    .line 230
    .line 231
    invoke-static {v5, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 232
    .line 233
    .line 234
    goto :goto_3

    .line 235
    :cond_7
    invoke-static {v5, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 236
    .line 237
    .line 238
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->g:Lv/VDraweeView;

    .line 239
    .line 240
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 241
    .line 242
    iget-object v5, v5, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->U:Ljava/lang/String;

    .line 243
    .line 244
    sget v6, Ll/qa00;->j:I

    .line 245
    .line 246
    invoke-static {v3, v0, v5, v2, v6}, Ll/izs;->u(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 247
    .line 248
    .line 249
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 250
    .line 251
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->V:Ljava/lang/String;

    .line 252
    .line 253
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 254
    .line 255
    .line 256
    move-result v0

    .line 257
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->r:Lv/VDraweeView;

    .line 258
    .line 259
    if-nez v0, :cond_8

    .line 260
    .line 261
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 262
    .line 263
    .line 264
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->r:Lv/VDraweeView;

    .line 265
    .line 266
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 267
    .line 268
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->V:Ljava/lang/String;

    .line 269
    .line 270
    invoke-static {v3, v0, p0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    return-void

    .line 274
    :cond_8
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 275
    .line 276
    .line 277
    return-void
.end method

.method public static bridge synthetic r0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    return-object p0
.end method

.method public static bridge synthetic s0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->A:Z

    return-void
.end method

.method private setIntlFlyMicListener(Landroid/animation/ObjectAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/Animator;->removeAllListeners()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$e;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$e;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic t0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;Ll/y20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->z:Ll/y20;

    return-void
.end method

.method public static bridge synthetic u0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->E0()V

    return-void
.end method

.method public static bridge synthetic v0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->G0()V

    return-void
.end method

.method public static bridge synthetic w0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;ZI)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->R0(ZI)V

    return-void
.end method

.method public static bridge synthetic y0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->S0()V

    return-void
.end method

.method public static bridge synthetic z0(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->g1(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    return-void
.end method


# virtual methods
.method public final B0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/gms;->a(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public D0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->A:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->u:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;->pending:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;->combo:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->u:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->x:Landroid/animation/ObjectAnimator;

    .line 16
    .line 17
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 21
    .line 22
    iget p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->k:I

    .line 23
    .line 24
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->c(Ljava/lang/Integer;)V

    .line 29
    .line 30
    .line 31
    const/4 p1, 0x0

    .line 32
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->Q0(Z)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 37
    .line 38
    iget p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->k:I

    .line 39
    .line 40
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->c(Ljava/lang/Integer;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public I0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->A:Z

    .line 3
    .line 4
    return-void
.end method

.method public J0(Ljava/lang/String;)Z
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->K0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->q:Z

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    return v1
.end method

.method public K0()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->u:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;->empty:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 4
    .line 5
    if-eq p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final synthetic P0(Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->B:Ll/y20;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;->getDiamond()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    new-array v0, v0, [I

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 21
    .line 22
    .line 23
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$b;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;->getComboId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;->getDiamond()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const/4 v3, 0x1

    .line 34
    aget v0, v0, v3

    .line 35
    .line 36
    int-to-float v0, v0

    .line 37
    invoke-direct {v1, v2, p1, v0, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$b;-><init>(Ljava/lang/String;Ljava/lang/String;FZ)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->B:Ll/y20;

    .line 41
    .line 42
    invoke-interface {p0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public U0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->x:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->x:Landroid/animation/ObjectAnimator;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->V0()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public X0(Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->q:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;->getReward()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "context_livingAct"

    .line 8
    .line 9
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->q:Lv/VDraweeView;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->C:Landroid/animation/Animator;

    .line 19
    .line 20
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->D:Landroid/animation/Animator;

    .line 24
    .line 25
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->q:Lv/VDraweeView;

    .line 29
    .line 30
    const/4 v1, 0x2

    .line 31
    new-array v2, v1, [F

    .line 32
    .line 33
    fill-array-data v2, :array_0

    .line 34
    .line 35
    .line 36
    sget-object v3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 37
    .line 38
    invoke-static {v0, v3, v2}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-wide/16 v4, 0xc8

    .line 43
    .line 44
    invoke-virtual {v0, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->q:Lv/VDraweeView;

    .line 49
    .line 50
    sget-object v6, Ll/gt0;->i:Landroid/util/Property;

    .line 51
    .line 52
    new-array v7, v1, [F

    .line 53
    .line 54
    fill-array-data v7, :array_1

    .line 55
    .line 56
    .line 57
    invoke-static {v2, v6, v7}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    const-wide/16 v6, 0x1f4

    .line 62
    .line 63
    invoke-virtual {v2, v6, v7}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    filled-new-array {v0, v2}, [Landroid/animation/Animator;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->C:Landroid/animation/Animator;

    .line 76
    .line 77
    sget-object v2, Ll/gt0;->e:Landroid/view/animation/Interpolator;

    .line 78
    .line 79
    invoke-virtual {v0, v2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->C:Landroid/animation/Animator;

    .line 83
    .line 84
    new-instance v2, Ll/bms;

    .line 85
    .line 86
    invoke-direct {v2, p0, p1}, Ll/bms;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v0, v2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->q:Lv/VDraweeView;

    .line 93
    .line 94
    new-array v0, v1, [F

    .line 95
    .line 96
    fill-array-data v0, :array_2

    .line 97
    .line 98
    .line 99
    invoke-static {p1, v3, v0}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p1, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    filled-new-array {p1}, [Landroid/animation/Animator;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-static {p1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->D:Landroid/animation/Animator;

    .line 116
    .line 117
    const-wide/16 v0, 0x7d0

    .line 118
    .line 119
    invoke-virtual {p1, v0, v1}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->D:Landroid/animation/Animator;

    .line 123
    .line 124
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 125
    .line 126
    .line 127
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->C:Landroid/animation/Animator;

    .line 128
    .line 129
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public Y0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    invoke-static {v0}, Ll/muj;->m0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;->show:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->u:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 13
    .line 14
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->p:Z

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->v:Landroid/animation/ObjectAnimator;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public Z0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->t()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public a1(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->C()Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->t:Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->r()V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->H0(Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public e1()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->d()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->E0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final f1()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->q:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->D:Landroid/animation/Animator;

    .line 8
    .line 9
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->C:Landroid/animation/Animator;

    .line 13
    .line 14
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->X:Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->B:Ll/y20;

    .line 27
    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;->getDiamond()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-nez v2, :cond_1

    .line 39
    .line 40
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$b;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;->getComboId()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;->getDiamond()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const/4 v4, 0x0

    .line 51
    invoke-direct {v2, v3, v0, v4, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$b;-><init>(Ljava/lang/String;Ljava/lang/String;FZ)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->B:Ll/y20;

    .line 55
    .line 56
    invoke-interface {p0, v2}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    :goto_0
    return-void
.end method

.method public final g1(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->X:Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;->getReward()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->X0(Lcom/p1/mobile/longlink/msg/intlluckygift/LongLinkIntlLuckyGiftMessage$IntlLuckyGiftTray;)V

    .line 20
    .line 21
    .line 22
    :cond_2
    :goto_0
    return-void
.end method

.method public getPlayingComboId()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->u:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;->empty:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView$TrayStatus;

    .line 8
    .line 9
    if-eq p0, v1, :cond_0

    .line 10
    .line 11
    iget-object p0, v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->n:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public getPlayingGiftPriority()Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->i()Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData$GiftPriority;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->B:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->B0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->n:Lv/VText;

    .line 8
    .line 9
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->o:Lv/VText;

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setComboPlayCallBack(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->E:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public setRewardPlayAction(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/e$b;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->B:Ll/y20;

    .line 2
    .line 3
    return-void
.end method
