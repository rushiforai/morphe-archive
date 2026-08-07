.class public Ll/r7e;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/x7e;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Landroid/widget/FrameLayout;

.field public l:Landroid/widget/LinearLayout;

.field public m:Lv/VDraweeView;

.field public n:Landroid/widget/LinearLayout;

.field public o:Landroid/widget/TextView;

.field public p:J

.field public q:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/x7e;)V
    .locals 1

    .line 1
    sget v0, Ll/yec0;->h3:I

    .line 2
    .line 3
    invoke-direct {p0, v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/r7e;->q:Z

    .line 8
    .line 9
    const/16 p1, 0x11

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->A(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic F(Ll/r7e;Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/r7e;->P(Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;)V

    return-void
.end method

.method public static synthetic G(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic H(Ll/r7e;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/r7e;->O(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/r7e;ZLcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/r7e;->Q(ZLcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic J(Ll/r7e;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/r7e;->q:Z

    return p0
.end method

.method public static synthetic L(Ll/r7e;)Ll/y8s;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic O(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private S(Ljava/lang/String;)V
    .locals 2

    .line 1
    const/16 v0, 0x273

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/r7e$a;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Ll/r7e$a;-><init>(Ll/r7e;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 17
    .line 18
    check-cast p0, Ll/x7e;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->reloadGiftWithAction()Ll/v3f$d;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final K(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s7e;->a(Ll/r7e;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public M(Ll/x7e;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final N(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Landroid/view/View;
    .locals 2

    .line 1
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    invoke-direct {v0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 5
    .line 6
    .line 7
    if-eqz p4, :cond_0

    .line 8
    .line 9
    const/high16 p4, 0x3f800000    # 1.0f

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/high16 p4, 0x40e00000    # 7.0f

    .line 13
    .line 14
    :goto_0
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p4

    .line 18
    iput p4, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 19
    .line 20
    new-instance p4, Landroid/widget/TextView;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 23
    .line 24
    check-cast v1, Ll/x7e;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-direct {p4, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-virtual {p4, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 41
    .line 42
    .line 43
    const/high16 p1, 0x41600000    # 14.0f

    .line 44
    .line 45
    invoke-virtual {p4, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 46
    .line 47
    .line 48
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_1

    .line 53
    .line 54
    new-instance p1, Landroid/widget/LinearLayout;

    .line 55
    .line 56
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 57
    .line 58
    check-cast p3, Ll/x7e;

    .line 59
    .line 60
    invoke-virtual {p3}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 61
    .line 62
    .line 63
    move-result-object p3

    .line 64
    invoke-direct {p1, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 65
    .line 66
    .line 67
    const/4 p3, 0x0

    .line 68
    invoke-virtual {p1, p3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 69
    .line 70
    .line 71
    const/16 p3, 0x11

    .line 72
    .line 73
    invoke-virtual {p1, p3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 74
    .line 75
    .line 76
    new-instance p3, Lv/VDraweeView;

    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 79
    .line 80
    check-cast p0, Ll/x7e;

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-direct {p3, p0}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 87
    .line 88
    .line 89
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 90
    .line 91
    sget v1, Ll/qa00;->v:I

    .line 92
    .line 93
    invoke-direct {p0, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 94
    .line 95
    .line 96
    sget v1, Ll/qa00;->f:I

    .line 97
    .line 98
    iput v1, p0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 99
    .line 100
    invoke-virtual {p3, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    .line 102
    .line 103
    const-string p0, "context_livingAct"

    .line 104
    .line 105
    invoke-static {p0, p3, p2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p1, p4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 115
    .line 116
    .line 117
    return-object p1

    .line 118
    :cond_1
    invoke-virtual {p4, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 119
    .line 120
    .line 121
    return-object p4
.end method

.method public final synthetic P(Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;->rewards:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveDownBoxRewards;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDownBoxRewards;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-direct {p0, p1}, Ll/r7e;->S(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic Q(ZLcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;Landroid/view/View;)V
    .locals 5

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    if-nez p3, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    check-cast p3, Ll/x7e;

    .line 10
    .line 11
    invoke-virtual {p3}, Ll/xzs;->R2()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 16
    .line 17
    check-cast v1, Ll/x7e;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {p3, v1}, Ll/z7e;->c(Ljava/lang/String;Ll/oo2;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    check-cast p3, Ll/x7e;

    .line 28
    .line 29
    invoke-virtual {p3}, Ll/xzs;->R2()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 34
    .line 35
    check-cast v1, Ll/x7e;

    .line 36
    .line 37
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;->rewards:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveDownBoxRewards;

    .line 48
    .line 49
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveDownBoxRewards;->id:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p3, v1, v2}, Ll/z7e;->e(Ljava/lang/String;Ll/oo2;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 55
    .line 56
    .line 57
    if-eqz p1, :cond_2

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 60
    .line 61
    check-cast p0, Ll/x7e;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    new-instance p1, Ll/bae0$a;

    .line 74
    .line 75
    const/16 p3, 0x273

    .line 76
    .line 77
    invoke-direct {p1, p3}, Ll/bae0$a;-><init>(I)V

    .line 78
    .line 79
    .line 80
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;->jump:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 81
    .line 82
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->schema:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p1, p2}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-virtual {p1}, Ll/bae0$a;->c()Ll/bae0;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 97
    .line 98
    .line 99
    move-result-wide v1

    .line 100
    iget-wide v3, p0, Ll/r7e;->p:J

    .line 101
    .line 102
    sub-long/2addr v1, v3

    .line 103
    const-wide/16 v3, 0x3e8

    .line 104
    .line 105
    cmp-long p1, v1, v3

    .line 106
    .line 107
    if-gez p1, :cond_3

    .line 108
    .line 109
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 110
    .line 111
    check-cast p1, Ll/x7e;

    .line 112
    .line 113
    new-instance p3, Ll/n7e;

    .line 114
    .line 115
    invoke-direct {p3, p0, p2}, Ll/n7e;-><init>(Ll/r7e;Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1, v1, v2, p3}, Ll/i6t;->z3(JLjava/lang/Runnable;)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_3
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;->rewards:Ljava/util/List;

    .line 123
    .line 124
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveDownBoxRewards;

    .line 129
    .line 130
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDownBoxRewards;->id:Ljava/lang/String;

    .line 131
    .line 132
    invoke-direct {p0, p1}, Ll/r7e;->S(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public R(Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;Ljava/lang/String;Z)V
    .locals 8

    .line 1
    if-eqz p1, :cond_6

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;->contents:Ljava/util/List;

    .line 4
    .line 5
    if-eqz v0, :cond_6

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;->rewards:Ljava/util/List;

    .line 8
    .line 9
    if-eqz v0, :cond_6

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_3

    .line 18
    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Ll/r7e;->q:Z

    .line 21
    .line 22
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 23
    .line 24
    .line 25
    move-result-wide v1

    .line 26
    iput-wide v1, p0, Ll/r7e;->p:J

    .line 27
    .line 28
    iget-object v1, p0, Ll/r7e;->n:Landroid/widget/LinearLayout;

    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 31
    .line 32
    .line 33
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;->contents:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_4

    .line 40
    .line 41
    move v1, v0

    .line 42
    :goto_0
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;->contents:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    const/4 v3, 0x1

    .line 49
    if-ge v1, v2, :cond_2

    .line 50
    .line 51
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;->contents:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 58
    .line 59
    iget-object v4, p0, Ll/r7e;->n:Landroid/widget/LinearLayout;

    .line 60
    .line 61
    iget-object v5, v2, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->text:Ljava/lang/String;

    .line 62
    .line 63
    iget-object v6, v2, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->icon:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->color:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v7, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;->contents:Ljava/util/List;

    .line 68
    .line 69
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 70
    .line 71
    .line 72
    move-result v7

    .line 73
    add-int/lit8 v1, v1, 0x1

    .line 74
    .line 75
    if-le v7, v1, :cond_1

    .line 76
    .line 77
    iget-object v7, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;->contents:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v7

    .line 83
    check-cast v7, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 84
    .line 85
    iget-object v7, v7, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->icon:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result v7

    .line 91
    if-nez v7, :cond_1

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_1
    move v3, v0

    .line 95
    :goto_1
    invoke-virtual {p0, v5, v6, v2, v3}, Ll/r7e;->N(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_2
    iget-object v1, p0, Ll/r7e;->o:Landroid/widget/TextView;

    .line 104
    .line 105
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 110
    .line 111
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;->contents:Ljava/util/List;

    .line 112
    .line 113
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 114
    .line 115
    .line 116
    move-result v4

    .line 117
    sub-int/2addr v4, v3

    .line 118
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 123
    .line 124
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->icon:Ljava/lang/String;

    .line 125
    .line 126
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    if-eqz v2, :cond_3

    .line 131
    .line 132
    const/high16 v2, 0x41880000    # 17.0f

    .line 133
    .line 134
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 139
    .line 140
    goto :goto_2

    .line 141
    :cond_3
    const/high16 v2, 0x41300000    # 11.0f

    .line 142
    .line 143
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 148
    .line 149
    :goto_2
    iget-object v2, p0, Ll/r7e;->o:Landroid/widget/TextView;

    .line 150
    .line 151
    invoke-virtual {v2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 152
    .line 153
    .line 154
    :cond_4
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;->rewards:Ljava/util/List;

    .line 155
    .line 156
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveDownBoxRewards;

    .line 161
    .line 162
    iget-object v2, p0, Ll/r7e;->m:Lv/VDraweeView;

    .line 163
    .line 164
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveDownBoxRewards;->icon:Ljava/lang/String;

    .line 165
    .line 166
    const-string v4, "context_livingAct"

    .line 167
    .line 168
    invoke-static {v4, v2, v3}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    iget-object v2, p0, Ll/r7e;->o:Landroid/widget/TextView;

    .line 172
    .line 173
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;->jump:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 174
    .line 175
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->text:Ljava/lang/String;

    .line 176
    .line 177
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 178
    .line 179
    .line 180
    iget-object v2, p0, Ll/r7e;->o:Landroid/widget/TextView;

    .line 181
    .line 182
    new-instance v3, Ll/m7e;

    .line 183
    .line 184
    invoke-direct {v3, p0, p3, p1}, Ll/m7e;-><init>(Ll/r7e;ZLcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;)V

    .line 185
    .line 186
    .line 187
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 188
    .line 189
    .line 190
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 191
    .line 192
    if-eqz p3, :cond_5

    .line 193
    .line 194
    check-cast v2, Ll/x7e;

    .line 195
    .line 196
    invoke-virtual {v2}, Ll/xzs;->R2()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 201
    .line 202
    check-cast p0, Ll/x7e;

    .line 203
    .line 204
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    invoke-static {p1, p0}, Ll/z7e;->d(Ljava/lang/String;Ll/oo2;)V

    .line 209
    .line 210
    .line 211
    return-void

    .line 212
    :cond_5
    check-cast v2, Ll/x7e;

    .line 213
    .line 214
    iget-object p3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveDownBoxRewards;->id:Ljava/lang/String;

    .line 215
    .line 216
    invoke-virtual {v2, p3, p2}, Ll/x7e;->Z3(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 220
    .line 221
    check-cast p2, Ll/x7e;

    .line 222
    .line 223
    invoke-virtual {p2}, Ll/xzs;->R2()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object p2

    .line 227
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 228
    .line 229
    check-cast p0, Ll/x7e;

    .line 230
    .line 231
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDownChestRewardInfo;->rewards:Ljava/util/List;

    .line 236
    .line 237
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveDownBoxRewards;

    .line 242
    .line 243
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDownBoxRewards;->id:Ljava/lang/String;

    .line 244
    .line 245
    invoke-static {p2, p0, p1}, Ll/z7e;->f(Ljava/lang/String;Ll/oo2;Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    :cond_6
    :goto_3
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->destroy()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/r7e;->q:Z

    .line 6
    .line 7
    iget-object p0, p0, Ll/r7e;->o:Landroid/widget/TextView;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/x7e;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/r7e;->M(Ll/x7e;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public m(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/r7e;->K(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/r7e;->o:Landroid/widget/TextView;

    .line 8
    .line 9
    const v0, -0xc600

    .line 10
    .line 11
    .line 12
    const/16 v1, -0x7ad6

    .line 13
    .line 14
    filled-new-array {v0, v1}, [I

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 19
    .line 20
    const/high16 v2, 0x40c00000    # 6.0f

    .line 21
    .line 22
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    int-to-float v2, v2

    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-static {v0, v1, v2, v3}, Ll/fc2;->e([ILandroid/graphics/drawable/GradientDrawable$Orientation;FZ)Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/r7e;->k:Landroid/widget/FrameLayout;

    .line 36
    .line 37
    new-instance v0, Ll/k7e;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/k7e;-><init>(Ll/r7e;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/r7e;->l:Landroid/widget/LinearLayout;

    .line 46
    .line 47
    new-instance p1, Ll/l7e;

    .line 48
    .line 49
    invoke-direct {p1}, Ll/l7e;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/x7e;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/r7e;->M(Ll/x7e;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
