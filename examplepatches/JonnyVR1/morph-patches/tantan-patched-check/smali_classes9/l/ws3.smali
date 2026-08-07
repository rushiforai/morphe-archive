.class public Ll/ws3;
.super Ll/tz0;
.source "SourceFile"


# instance fields
.field public y:Z

.field public z:Ll/x20;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1
    const/4 v6, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move-object v5, p5

    .line 8
    move-object v7, p6

    .line 9
    invoke-direct/range {v0 .. v7}, Ll/tz0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;ILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    iput-boolean p0, v0, Ll/ws3;->y:Z

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    iput-object p0, v0, Ll/ws3;->z:Ll/x20;

    .line 17
    .line 18
    return-void
.end method

.method private synthetic A4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ws3;->w4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic B4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ws3;->C4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private D4(Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;)V
    .locals 6

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->firstEnterLiveRoomTime:J

    .line 6
    .line 7
    const/16 v4, 0x48

    .line 8
    .line 9
    invoke-static {v2, v3, v4}, Ll/tzi0;->d(JI)J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    cmp-long v0, v0, v2

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    if-gtz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->activityArray:Ljava/util/List;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeActivity;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 29
    .line 30
    .line 31
    move-result-wide v2

    .line 32
    iget-wide v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->firstEnterLiveRoomTime:J

    .line 33
    .line 34
    const/16 v0, 0xa8

    .line 35
    .line 36
    invoke-static {v4, v5, v0}, Ll/tzi0;->d(JI)J

    .line 37
    .line 38
    .line 39
    move-result-wide v4

    .line 40
    cmp-long v0, v2, v4

    .line 41
    .line 42
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->activityArray:Ljava/util/List;

    .line 43
    .line 44
    if-gtz v0, :cond_1

    .line 45
    .line 46
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeActivity;

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    const/4 v0, 0x2

    .line 54
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeActivity;

    .line 59
    .line 60
    :goto_0
    invoke-direct {p0, p1, v0}, Ll/ws3;->F4(Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeActivity;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v1}, Ll/e80;->b4(Z)V

    .line 64
    .line 65
    .line 66
    new-instance v1, Ll/vs3;

    .line 67
    .line 68
    invoke-direct {v1, p0, v0, p1}, Ll/vs3;-><init>(Ll/ws3;Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeActivity;Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;)V

    .line 69
    .line 70
    .line 71
    iput-object v1, p0, Ll/ws3;->z:Ll/x20;

    .line 72
    .line 73
    return-void
.end method

.method private F4(Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeActivity;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->firstEnterLiveRoomTime:J

    .line 6
    .line 7
    const/16 v4, 0x18

    .line 8
    .line 9
    invoke-static {v2, v3, v4}, Ll/tzi0;->d(JI)J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    cmp-long v0, v0, v2

    .line 14
    .line 15
    if-ltz v0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Ll/pzi0;->o()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->firstEnterLiveRoomTime:J

    .line 22
    .line 23
    const/16 v4, 0x48

    .line 24
    .line 25
    invoke-static {v2, v3, v4}, Ll/tzi0;->d(JI)J

    .line 26
    .line 27
    .line 28
    move-result-wide v2

    .line 29
    cmp-long v0, v0, v2

    .line 30
    .line 31
    if-gtz v0, :cond_0

    .line 32
    .line 33
    sget-object v0, Ll/htd0;->f:Ll/htd0;

    .line 34
    .line 35
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ll/civ;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/civ;->i()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_0

    .line 46
    .line 47
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->isCoinRecharged:Z

    .line 48
    .line 49
    if-nez v0, :cond_0

    .line 50
    .line 51
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeActivity;->id:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->detailUrl:Ljava/lang/String;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->detailInset:Ljava/util/List;

    .line 56
    .line 57
    invoke-virtual {p0, p2, v0, p1}, Ll/ws3;->E4(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    return-void
.end method

.method public static synthetic o4(Ll/ws3;Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeActivity;Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ws3;->y4(Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeActivity;Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;)V

    return-void
.end method

.method public static synthetic p4(Ll/ws3;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ws3;->A4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic q4(Ll/ws3;Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ws3;->v4(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V

    return-void
.end method

.method public static synthetic r4(Ll/ws3;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ws3;->z4(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic s4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->type:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "complete_first_recharge"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic t4(Ll/ws3;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ws3;->B4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V

    return-void
.end method

.method public static synthetic u4(Ll/ws3;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ws3;->x4(Ljava/lang/Throwable;)V

    return-void
.end method

.method private v4(Lcom/p1/mobile/putong/live/base/data/BLiveData;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->firstChargeCampaigns:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;

    .line 4
    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->isCoinRecharged:Z

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->firstChargeStatus:Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeStatus;

    .line 12
    .line 13
    const-string v1, "completed"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->activityArray:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v1, 0x3

    .line 28
    if-eq v0, v1, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-direct {p0, p1}, Ll/ws3;->D4(Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    :goto_0
    invoke-direct {p0}, Ll/ws3;->w4()V

    .line 36
    .line 37
    .line 38
    :cond_2
    return-void
.end method

.method private w4()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/e80;->b4(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic x4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method private synthetic y4(Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeActivity;Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;)V
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeActivity;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->detailUrl:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFirstChargeCampaign;->detailInset:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0, p2}, Ll/ws3;->E4(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic z4(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ws3;->C4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method public C4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->z1()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/ts3;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/ts3;-><init>(Ll/ws3;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/us3;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Ll/us3;-><init>(Ll/ws3;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public E4(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p2, "?giftPackageID="

    .line 26
    .line 27
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string p1, "&anchorId="

    .line 34
    .line 35
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object p1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailUrl:Ljava/lang/String;

    .line 48
    .line 49
    iput-object p3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->detailInset:Ljava/util/List;

    .line 50
    .line 51
    const/4 p1, 0x0

    .line 52
    iput-boolean p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->isNeedCloseBtn:Z

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const/16 p1, 0x1f4

    .line 65
    .line 66
    invoke-static {p1}, Ll/px50;->c(I)Ll/px50$a;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1, v0}, Ll/px50$a;->r(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)Ll/px50$a;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p1}, Ll/px50$a;->q()Ll/px50;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    sget-object p0, Ll/htd0;->f:Ll/htd0;

    .line 82
    .line 83
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    check-cast p0, Ll/civ;

    .line 88
    .line 89
    const/4 p1, 0x1

    .line 90
    invoke-virtual {p0, p1}, Ll/civ;->x(Z)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public V3(Landroid/view/View;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/ws3;->y:Z

    .line 3
    .line 4
    iget-object v1, p0, Ll/kf2;->k:Landroid/view/View;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ws3;->f4()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/BottomItemView;->g0(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-super {p0, p1}, Ll/e80;->V3(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->dismissBubble()Ll/v3f$d;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v1, "firstRechargeBubble"

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/ws3;->z:Ll/x20;

    .line 36
    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    invoke-interface {p1}, Ll/x20;->call()V

    .line 40
    .line 41
    .line 42
    :cond_1
    invoke-virtual {p0, v0}, Ll/e80;->b4(Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public X3()Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;
    .locals 0

    .line 1
    const-string p0, "firstRechargeButton"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public f4()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ws3;->y:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Ll/kf2;->f4()Z

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

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ws3;->C4()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/ps3;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/ps3;-><init>(Ll/ws3;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->hideFirstRecharge()Ll/v3f$c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lrx/c;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/qs3;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/qs3;-><init>(Ll/ws3;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ll/oo2;->n1()Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/rs3;

    .line 76
    .line 77
    invoke-direct {v1}, Ll/rs3;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v1, Ll/ss3;

    .line 85
    .line 86
    invoke-direct {v1, p0}, Ll/ss3;-><init>(Ll/ws3;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    return-void
.end method
