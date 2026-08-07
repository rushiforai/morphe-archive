.class public Ll/ced0;
.super Ll/vn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/oo2;",
        ">",
        "Ll/vn2<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final x:Ll/jxd0;

.field public final y:Ll/jxd0;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/bubble/LiveBubbleView;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TT;>;",
            "Lcom/p1/mobile/putong/live/livingroom/common/bubble/LiveBubbleView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/vn2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/jxd0;

    .line 5
    .line 6
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    const-string v1, "first_recharge_bubble_show"

    .line 9
    .line 10
    invoke-direct {p1, v1, v0}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/ced0;->x:Ll/jxd0;

    .line 14
    .line 15
    new-instance p1, Ll/jxd0;

    .line 16
    .line 17
    const-string v1, "bottom_vip_service_bubble_show"

    .line 18
    .line 19
    invoke-direct {p1, v1, v0}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll/ced0;->y:Ll/jxd0;

    .line 23
    .line 24
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic c5(Ll/ced0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ced0;->g5(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic d5(Ll/ced0;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ced0;->f5([Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic e5(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/fwk;->g(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic g5(Ljava/lang/Long;)V
    .locals 3

    .line 1
    sget-object p1, Ll/htd0;->f:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/civ;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/civ;->i()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_2

    .line 14
    .line 15
    iget-object p1, p0, Ll/ced0;->x:Ll/jxd0;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_2

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;

    .line 41
    .line 42
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;-><init>()V

    .line 43
    .line 44
    .line 45
    const-string v1, "firstRechargeBubble"

    .line 46
    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 48
    .line 49
    const-string v1, "-1"

    .line 50
    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->id:Ljava/lang/String;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    const/4 v2, 0x6

    .line 60
    if-le v1, v2, :cond_1

    .line 61
    .line 62
    const/4 v1, 0x0

    .line 63
    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    const-string v1, "%s..."

    .line 72
    .line 73
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    :cond_1
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 78
    .line 79
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Qd:I

    .line 80
    .line 81
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {v1, v2, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-static {p1}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 94
    .line 95
    const-string p1, "FF8817"

    .line 96
    .line 97
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

    .line 98
    .line 99
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 100
    .line 101
    const/16 p1, 0xa

    .line 102
    .line 103
    iput p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleDisappear:I

    .line 104
    .line 105
    invoke-virtual {p0, v0}, Ll/g4;->V4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)V

    .line 106
    .line 107
    .line 108
    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public I4(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "vipServiceBubble"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ced0;->y:Ll/jxd0;

    .line 10
    .line 11
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public Z4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;Ll/gg3;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "firstRechargeBubble"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/ced0;->x:Ll/jxd0;

    .line 12
    .line 13
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-super {p0, p1, p2}, Ll/g4;->Z4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;Ll/gg3;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public a5(Ll/g4$a;Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)V
    .locals 7

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FollowGuideEvent:Lcom/tantan/live/eventbus/LiveEventBus$FollowGuideEvent;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FollowGuideEvent;->onBubbleShow()Ll/v3f$c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    const/4 v3, 0x1

    .line 37
    new-array v4, v3, [Ljava/lang/String;

    .line 38
    .line 39
    new-instance v5, Ll/zvk;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    invoke-direct {v5, v6}, Ll/zvk;-><init>(Landroid/content/Context;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v5, v0}, Ll/zvk;->u(Ljava/lang/String;)Ll/zvk;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const/high16 v5, 0x40800000    # 4.0f

    .line 53
    .line 54
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    invoke-virtual {v0, v5}, Ll/zvk;->o(I)Ll/zvk;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleDisappear:I

    .line 63
    .line 64
    mul-int/lit16 p2, p2, 0x3e8

    .line 65
    .line 66
    int-to-long v5, p2

    .line 67
    invoke-virtual {v0, v5, v6}, Ll/zvk;->a(J)Ll/zvk;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    const-string v0, "#f79533"

    .line 72
    .line 73
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    const-string v5, "#f7c333"

    .line 78
    .line 79
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    move-result v5

    .line 83
    filled-new-array {v0, v5}, [I

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {p2, v0}, Ll/zvk;->e([I)Ll/zvk;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-virtual {p2, v3}, Ll/zvk;->k(Z)Ll/zvk;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    const/16 v0, 0xc

    .line 96
    .line 97
    invoke-virtual {p2, v0}, Ll/zvk;->t(I)Ll/zvk;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    invoke-virtual {p2, v1}, Ll/zvk;->v(Z)Ll/zvk;

    .line 102
    .line 103
    .line 104
    move-result-object p2

    .line 105
    new-instance v0, Ll/zdd0;

    .line 106
    .line 107
    invoke-direct {v0}, Ll/zdd0;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p2, v0}, Ll/zvk;->b(Ll/zvk$a;)Ll/zvk;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    sget v0, Ll/zvk;->A:I

    .line 115
    .line 116
    invoke-virtual {p2, v0}, Ll/zvk;->i(I)Ll/zvk;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    new-instance v0, Ll/aed0;

    .line 121
    .line 122
    invoke-direct {v0, p0, v4}, Ll/aed0;-><init>(Ll/ced0;[Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p2, v0}, Ll/zvk;->d(Ll/zvk$b;)Ll/zvk;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    iget-object p1, p1, Ll/g4$a;->a:Landroid/view/View;

    .line 130
    .line 131
    invoke-virtual {p0}, Ll/xzs;->Q2()Landroid/view/ViewGroup;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v2, p2, p1, v0}, Ll/fwk;->r(Ll/zvk;Landroid/view/View;Landroid/view/ViewGroup;)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    aput-object p1, v4, v1

    .line 140
    .line 141
    iget-object p0, p0, Ll/g4;->v:Ljava/util/List;

    .line 142
    .line 143
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public final synthetic f5([Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g4;->v:Ljava/util/List;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    aget-object p1, p1, p2

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public k4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;Ll/gg3;)Z
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x1

    .line 12
    const/4 v4, -0x1

    .line 13
    sparse-switch v1, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    goto/16 :goto_0

    .line 17
    .line 18
    :sswitch_0
    const-string v1, "newUserTreasureBoxTakeBubble"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v4, 0x7

    .line 28
    goto :goto_0

    .line 29
    :sswitch_1
    const-string v1, "vipServiceBubble"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const/4 v4, 0x6

    .line 39
    goto :goto_0

    .line 40
    :sswitch_2
    const-string v1, "firstRechargeBubble"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    const/4 v4, 0x5

    .line 50
    goto :goto_0

    .line 51
    :sswitch_3
    const-string v1, "stickerBubble"

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_3

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    const/4 v4, 0x4

    .line 61
    goto :goto_0

    .line 62
    :sswitch_4
    const-string v1, "newUserTreasureBoxGetBubble"

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_4

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_4
    const/4 v4, 0x3

    .line 72
    goto :goto_0

    .line 73
    :sswitch_5
    const-string v1, "fastGiftButtonBubble"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_5

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_5
    const/4 v4, 0x2

    .line 83
    goto :goto_0

    .line 84
    :sswitch_6
    const-string v1, "anchorDailyTaskBubble"

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-nez v0, :cond_6

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_6
    move v4, v3

    .line 94
    goto :goto_0

    .line 95
    :sswitch_7
    const-string v1, "localFollowLiveButtonBubble"

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-nez v0, :cond_7

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_7
    move v4, v2

    .line 105
    :goto_0
    const/16 v0, 0x6a4

    .line 106
    .line 107
    packed-switch v4, :pswitch_data_0

    .line 108
    .line 109
    .line 110
    invoke-super {p0, p1, p2}, Ll/g4;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;Ll/gg3;)Z

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    return p0

    .line 115
    :pswitch_0
    new-instance v1, Ll/hf4;

    .line 116
    .line 117
    invoke-direct {v1, v0}, Ll/hf4;-><init>(I)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Ljava/lang/Boolean;

    .line 125
    .line 126
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-eqz v0, :cond_8

    .line 131
    .line 132
    invoke-super {p0, p1, p2}, Ll/g4;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;Ll/gg3;)Z

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    if-eqz p0, :cond_8

    .line 137
    .line 138
    return v3

    .line 139
    :cond_8
    return v2

    .line 140
    :pswitch_1
    iget-object p0, p0, Ll/ced0;->y:Ll/jxd0;

    .line 141
    .line 142
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    check-cast p0, Ljava/lang/Boolean;

    .line 147
    .line 148
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 149
    .line 150
    .line 151
    move-result p0

    .line 152
    :goto_1
    xor-int/2addr p0, v3

    .line 153
    return p0

    .line 154
    :pswitch_2
    return v3

    .line 155
    :pswitch_3
    new-instance v1, Ll/gf4;

    .line 156
    .line 157
    invoke-direct {v1, v0}, Ll/gf4;-><init>(I)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    check-cast v0, Ljava/lang/Boolean;

    .line 165
    .line 166
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    if-eqz v0, :cond_9

    .line 171
    .line 172
    invoke-super {p0, p1, p2}, Ll/g4;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;Ll/gg3;)Z

    .line 173
    .line 174
    .line 175
    move-result p0

    .line 176
    if-eqz p0, :cond_9

    .line 177
    .line 178
    return v3

    .line 179
    :cond_9
    return v2

    .line 180
    :pswitch_4
    sget-object v0, Ll/htd0;->f:Ll/htd0;

    .line 181
    .line 182
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    check-cast v0, Ll/civ;

    .line 187
    .line 188
    invoke-virtual {v0}, Ll/civ;->j()Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-nez v0, :cond_a

    .line 193
    .line 194
    invoke-super {p0, p1, p2}, Ll/g4;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;Ll/gg3;)Z

    .line 195
    .line 196
    .line 197
    move-result p0

    .line 198
    if-eqz p0, :cond_a

    .line 199
    .line 200
    return v3

    .line 201
    :cond_a
    :pswitch_5
    return v2

    .line 202
    :pswitch_6
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    invoke-virtual {p0}, Ll/oo2;->R0()Z

    .line 207
    .line 208
    .line 209
    move-result p0

    .line 210
    goto :goto_1

    .line 211
    :sswitch_data_0
    .sparse-switch
        -0x797a8b7a -> :sswitch_7
        -0x67fbde0b -> :sswitch_6
        -0x4bd98bd6 -> :sswitch_5
        -0x215e0f8f -> :sswitch_4
        0x25c50829 -> :sswitch_3
        0x2aa270e3 -> :sswitch_2
        0x3cc00a84 -> :sswitch_1
        0x4ad918e4 -> :sswitch_0
    .end sparse-switch

    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_5
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public l4()Z
    .locals 2

    .line 1
    new-instance v0, Ll/xcd0;

    .line 2
    .line 3
    const/16 v1, 0x6a4

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/xcd0;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/g4;->t()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/htd0;->f:Ll/htd0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ll/civ;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/civ;->i()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/ced0;->x:Ll/jxd0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ljava/lang/Boolean;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x2

    .line 37
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    .line 38
    .line 39
    invoke-virtual {v0, v1, v2}, Ll/oo2;->j2(ILjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/4 v1, 0x1

    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/bed0;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/bed0;-><init>(Ll/ced0;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    :cond_0
    return-void
.end method
