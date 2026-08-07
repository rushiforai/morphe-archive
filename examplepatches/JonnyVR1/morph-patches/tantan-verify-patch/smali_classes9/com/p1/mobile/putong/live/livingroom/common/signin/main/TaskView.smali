.class public Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;
.super Lcom/p1/mobile/putong/live/base/view/RatioLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VImage;

.field public b:Lcom/p1/mobile/putong/live/base/view/RatioLayout;

.field public c:Lv/VDraweeView;

.field public d:Landroid/widget/HorizontalScrollView;

.field public e:Lcom/p1/mobile/putong/live/base/view/MaxSizeLayout;

.field public f:Landroid/widget/LinearLayout;

.field public g:Lv/VText;

.field public h:Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignInProgressView;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public m:Z

.field public n:Landroid/view/ViewGroup$MarginLayoutParams;


# direct methods
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

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/view/RatioLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 5
    .line 6
    sget p2, Ll/qa00;->F:I

    .line 7
    .line 8
    invoke-direct {p1, p2, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->n:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 12
    .line 13
    sget p0, Ll/qa00;->i:I

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;ZLcom/p1/mobile/putong/live/livingroom/common/signin/a;Ljava/lang/String;Ljava/lang/String;ILcom/p1/mobile/putong/live/base/data/BLiveSignInReward;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->i(ZLcom/p1/mobile/putong/live/livingroom/common/signin/a;Ljava/lang/String;Ljava/lang/String;ILcom/p1/mobile/putong/live/base/data/BLiveSignInReward;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->g(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(ZLcom/p1/mobile/putong/live/livingroom/common/signin/a;Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;ILandroid/view/View;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->rewardId:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->rewards:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {p1, p4, v0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/a;->Z3(Ljava/lang/String;Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    iget-object p4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->rewardId:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->taskId:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p1, p4, v0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/a;->z4(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->taskType:Ljava/lang/String;

    .line 18
    .line 19
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->title:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p1, p4, p2, p3, p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/a;->B4(Ljava/lang/String;Ljava/lang/String;IZ)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;Lcom/p1/mobile/putong/live/livingroom/common/signin/a;Ljava/lang/String;Ljava/lang/String;IZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->h(Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;Lcom/p1/mobile/putong/live/livingroom/common/signin/a;Ljava/lang/String;Ljava/lang/String;IZLandroid/view/View;)V

    return-void
.end method

.method private synthetic g(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->b:Lcom/p1/mobile/putong/live/base/view/RatioLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qoi0;->a(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic h(Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;Lcom/p1/mobile/putong/live/livingroom/common/signin/a;Ljava/lang/String;Ljava/lang/String;IZLandroid/view/View;)V
    .locals 1

    .line 1
    iget-object p7, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;->target:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p7

    .line 7
    if-eqz p7, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->b:Lcom/p1/mobile/putong/live/base/view/RatioLayout;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p2}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance p7, Ll/bae0$a;

    .line 26
    .line 27
    const/16 v0, 0x271

    .line 28
    .line 29
    invoke-direct {p7, v0}, Ll/bae0$a;-><init>(I)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;->target:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p7, p1}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Ll/bae0$a;->c()Ll/bae0;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p2, p3, p4, p5, p6}, Lcom/p1/mobile/putong/live/livingroom/common/signin/a;->B4(Ljava/lang/String;Ljava/lang/String;IZ)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic i(ZLcom/p1/mobile/putong/live/livingroom/common/signin/a;Ljava/lang/String;Ljava/lang/String;ILcom/p1/mobile/putong/live/base/data/BLiveSignInReward;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v2, Ll/yec0;->M5:I

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-static {v0, v2, v3}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    move-object v8, v0

    .line 13
    check-cast v8, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskRewardView;

    .line 14
    .line 15
    invoke-virtual {v8, p6, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskRewardView;->b(Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->f:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->n:Landroid/view/ViewGroup$MarginLayoutParams;

    .line 21
    .line 22
    invoke-virtual {v0, v8, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Ll/poi0;

    .line 26
    .line 27
    move-object v1, p0

    .line 28
    move v7, p1

    .line 29
    move-object v3, p2

    .line 30
    move-object v4, p3

    .line 31
    move-object v5, p4

    .line 32
    move v6, p5

    .line 33
    move-object v2, p6

    .line 34
    invoke-direct/range {v0 .. v7}, Ll/poi0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;Lcom/p1/mobile/putong/live/livingroom/common/signin/a;Ljava/lang/String;Ljava/lang/String;IZ)V

    .line 35
    .line 36
    .line 37
    invoke-static {v8, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;IZLcom/p1/mobile/putong/live/livingroom/common/signin/a;)V
    .locals 2

    .line 1
    iput-boolean p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->m:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->b:Lcom/p1/mobile/putong/live/base/view/RatioLayout;

    .line 4
    .line 5
    new-instance v1, Ll/moi0;

    .line 6
    .line 7
    invoke-direct {v1, p3, p4, p1, p2}, Ll/moi0;-><init>(ZLcom/p1/mobile/putong/live/livingroom/common/signin/a;Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;I)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->e:Lcom/p1/mobile/putong/live/base/view/MaxSizeLayout;

    .line 14
    .line 15
    new-instance v1, Ll/noi0;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/noi0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    if-eqz p3, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, p1, p4, p2}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->l(Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;Lcom/p1/mobile/putong/live/livingroom/common/signin/a;I)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-virtual {p0, p1, p4, p2}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->n(Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;Lcom/p1/mobile/putong/live/livingroom/common/signin/a;I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final l(Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;Lcom/p1/mobile/putong/live/livingroom/common/signin/a;I)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->l:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->a:Lv/VImage;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->j:Lv/VText;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->k:Lv/VText;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->g:Lv/VText;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->h:Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignInProgressView;

    .line 29
    .line 30
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->i:Lv/VText;

    .line 34
    .line 35
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->c:Lv/VDraweeView;

    .line 39
    .line 40
    sget v3, Ll/obc0;->o8:I

    .line 41
    .line 42
    invoke-static {v0, v3}, Ll/izs;->x(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->j:Lv/VText;

    .line 46
    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->title:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->descriptionAdditional:Ljava/util/List;

    .line 53
    .line 54
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->descriptionAdditional:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    const/4 v3, 0x2

    .line 67
    if-ge v0, v3, :cond_0

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->k:Lv/VText;

    .line 71
    .line 72
    new-instance v3, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    .line 76
    .line 77
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->description:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->descriptionAdditional:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v2, "/"

    .line 92
    .line 93
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->descriptionAdditional:Ljava/util/List;

    .line 97
    .line 98
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->k:Lv/VText;

    .line 114
    .line 115
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->description:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 118
    .line 119
    .line 120
    :goto_1
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->rewards:Ljava/util/List;

    .line 121
    .line 122
    iget-object v6, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->taskType:Ljava/lang/String;

    .line 123
    .line 124
    iget-object v7, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->title:Ljava/lang/String;

    .line 125
    .line 126
    const/4 v4, 0x1

    .line 127
    move-object v2, p0

    .line 128
    move-object v5, p2

    .line 129
    move v8, p3

    .line 130
    invoke-virtual/range {v2 .. v8}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->m(Ljava/util/List;ZLcom/p1/mobile/putong/live/livingroom/common/signin/a;Ljava/lang/String;Ljava/lang/String;I)V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public final m(Ljava/util/List;ZLcom/p1/mobile/putong/live/livingroom/common/signin/a;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;",
            ">;Z",
            "Lcom/p1/mobile/putong/live/livingroom/common/signin/a;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->f:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance v1, Ll/ooi0;

    .line 14
    .line 15
    move-object v2, p0

    .line 16
    move v3, p2

    .line 17
    move-object v4, p3

    .line 18
    move-object v5, p4

    .line 19
    move-object v6, p5

    .line 20
    move v7, p6

    .line 21
    invoke-direct/range {v1 .. v7}, Ll/ooi0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;ZLcom/p1/mobile/putong/live/livingroom/common/signin/a;Ljava/lang/String;Ljava/lang/String;I)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final n(Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;Lcom/p1/mobile/putong/live/livingroom/common/signin/a;I)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->l:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->l:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->a:Lv/VImage;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->j:Lv/VText;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->k:Lv/VText;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->g:Lv/VText;

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->h:Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignInProgressView;

    .line 34
    .line 35
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->descriptionAdditional:Ljava/util/List;

    .line 39
    .line 40
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_0

    .line 45
    .line 46
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->descriptionAdditional:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-le v0, v2, :cond_0

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->h:Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignInProgressView;

    .line 55
    .line 56
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->i:Lv/VText;

    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->h:Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignInProgressView;

    .line 65
    .line 66
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->description:Ljava/lang/String;

    .line 67
    .line 68
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->descriptionAdditional:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    check-cast v1, Ljava/lang/Integer;

    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->descriptionAdditional:Ljava/util/List;

    .line 81
    .line 82
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    check-cast v2, Ljava/lang/Integer;

    .line 87
    .line 88
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    invoke-virtual {v0, v3, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignInProgressView;->b(Ljava/lang/String;II)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->h:Lcom/p1/mobile/putong/live/livingroom/common/signin/prize/LiveSignInProgressView;

    .line 97
    .line 98
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->i:Lv/VText;

    .line 102
    .line 103
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->i:Lv/VText;

    .line 107
    .line 108
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->description:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    .line 112
    .line 113
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->c:Lv/VDraweeView;

    .line 114
    .line 115
    sget-object v1, Ll/zft;->w:Ljava/lang/String;

    .line 116
    .line 117
    const-string v2, "context_square"

    .line 118
    .line 119
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->g:Lv/VText;

    .line 123
    .line 124
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->title:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 127
    .line 128
    .line 129
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->rewards:Ljava/util/List;

    .line 130
    .line 131
    iget-object v6, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->taskType:Ljava/lang/String;

    .line 132
    .line 133
    iget-object v7, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->title:Ljava/lang/String;

    .line 134
    .line 135
    const/4 v4, 0x0

    .line 136
    move-object v2, p0

    .line 137
    move-object v5, p2

    .line 138
    move v8, p3

    .line 139
    invoke-virtual/range {v2 .. v8}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->m(Ljava/util/List;ZLcom/p1/mobile/putong/live/livingroom/common/signin/a;Ljava/lang/String;Ljava/lang/String;I)V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->m:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->l:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 9
    .line 10
    const-string v0, "https://auto.tancdn.com/v1/raw/69763ee9-316b-4dc5-89ab-2c66aa2ecaad10.so"

    .line 11
    .line 12
    const/4 v1, -0x1

    .line 13
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
