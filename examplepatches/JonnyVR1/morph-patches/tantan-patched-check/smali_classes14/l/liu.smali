.class public Ll/liu;
.super Ll/ahu;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ahu<",
        "Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;",
        ">;"
    }
.end annotation


# instance fields
.field public f:I

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ahu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic R2(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "loadLiveCampaigns message = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "[live]campaign"

    .line 20
    .line 21
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic S2(Ll/liu;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/liu;->j3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic T2(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;->getType()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignType;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignType;->List:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignType;

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic U2(Ll/liu;Ll/md4;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/liu;->q3(Ll/md4;)V

    return-void
.end method

.method public static synthetic V2(Ll/liu;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/liu;->n3(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic W2(Ll/liu;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/liu;->x3(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic X2(Ll/liu;JLcom/p1/mobile/putong/live/base/data/BLiveCampaign;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/liu;->m3(JLcom/p1/mobile/putong/live/base/data/BLiveCampaign;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic Y2(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic Z2(Ll/liu;Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/liu;->p3(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V

    return-void
.end method

.method public static synthetic a3(Ll/liu;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$PopUp;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/liu;->o3(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$PopUp;)V

    return-void
.end method

.method public static synthetic b3(Ll/liu;Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/liu;->k3(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private c3(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;J)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/biu;

    .line 6
    .line 7
    invoke-direct {v1, p0, p2, p3, p1}, Ll/biu;-><init>(Ll/liu;JLcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/xnu;->R(Ll/y20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private d3(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/aiu;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/aiu;-><init>(Ll/liu;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/liu;->g:Ljava/util/List;

    .line 11
    .line 12
    return-object p1
.end method

.method private h3(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/liu;->g:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/jiu;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/jiu;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/liu;->r3(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method private i3(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;J)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCampaignNotifyData;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCampaignNotifyData;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->id:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaignNotifyData;->campaignId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Ll/xnu;->v()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaignNotifyData;->roomId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ll/xnu;->s()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaignNotifyData;->liveId:Ljava/lang/String;

    .line 28
    .line 29
    iput-wide p2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaignNotifyData;->duration:J

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Ll/xnu;->o()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaignNotifyData;->anchorId:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0}, Ll/aiv;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveCampaignNotifyData;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method private j3(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "calling"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v0, Landroid/view/View;

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/liu;->s3()V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Ll/liu;->t3()V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;

    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->setAutoplay(Z)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->m()V

    .line 36
    .line 37
    .line 38
    const/4 p1, 0x0

    .line 39
    iput p1, p0, Ll/liu;->f:I

    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    iput-object p1, p0, Ll/liu;->h:Ljava/lang/String;

    .line 43
    .line 44
    return-void
.end method

.method private k3(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)Ljava/lang/Boolean;
    .locals 8

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->validPeriod:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_3

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->validPeriod:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 v0, 0x1

    .line 16
    if-gt p0, v0, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 22
    .line 23
    .line 24
    move-result-wide v1

    .line 25
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->validPeriod:Ljava/util/List;

    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ljava/lang/Long;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 35
    .line 36
    .line 37
    move-result-wide v4

    .line 38
    const-wide/16 v6, 0x3e8

    .line 39
    .line 40
    mul-long/2addr v4, v6

    .line 41
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->validPeriod:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, Ljava/lang/Long;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 50
    .line 51
    .line 52
    move-result-wide p0

    .line 53
    mul-long/2addr p0, v6

    .line 54
    cmp-long v6, v1, v4

    .line 55
    .line 56
    if-gez v6, :cond_1

    .line 57
    .line 58
    sub-long/2addr v4, v1

    .line 59
    const-wide/16 v6, 0x1388

    .line 60
    .line 61
    cmp-long v4, v4, v6

    .line 62
    .line 63
    if-gtz v4, :cond_2

    .line 64
    .line 65
    :cond_1
    cmp-long p0, v1, p0

    .line 66
    .line 67
    if-gtz p0, :cond_2

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    move v0, v3

    .line 71
    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_3
    :goto_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 77
    .line 78
    return-object p0
.end method

.method private t3()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/xnu;->c:Ll/ecl0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/ecl0;->l()Ll/aj1;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/aj1;->c()Lrx/c;

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
    new-instance v1, Ll/iiu;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/iiu;-><init>(Ll/liu;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private u3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/liu;->g:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/kiu;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/kiu;-><init>(Ll/liu;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private v3()V
    .locals 2

    .line 1
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/hiv;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/hiv;->g()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/hiu;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/hiu;-><init>(Ll/liu;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private x3(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/liu;->s3()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    new-instance v0, Ll/eiu;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/eiu;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/liu;->s3()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_2
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 32
    .line 33
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->x(Ljava/util/List;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/zhu;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/zhu;-><init>(Ll/liu;)V

    .line 7
    .line 8
    .line 9
    const-class v1, Ll/df4;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0}, Ll/ahu;->F2(Ljava/lang/Class;Ll/qcj;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Ll/xnu;->c:Ll/ecl0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/ecl0;->l()Ll/aj1;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/aj1;->w()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/ciu;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/ciu;-><init>(Ll/liu;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ll/xnu;->z()Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const/4 v1, 0x0

    .line 53
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/diu;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/diu;-><init>(Ll/liu;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    invoke-direct {p0}, Ll/liu;->v3()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public e3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/liu;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f3()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/na5;->c(Landroid/content/Context;)Ll/na5;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/na5;->b()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    return-object v1

    .line 21
    :cond_0
    :try_start_0
    const-string v0, "tantan:.*\u9080\u8bf7\u7801\uff1a[A-Z|1-9]{4,}"

    .line 22
    .line 23
    invoke-static {v0, p0}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    const-string v0, "[A-Z|1-9]{4,}"

    .line 30
    .line 31
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->groupCount()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    return-object p0

    .line 51
    :catch_0
    move-exception p0

    .line 52
    goto :goto_0

    .line 53
    :cond_1
    return-object v1

    .line 54
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    return-object v1
.end method

.method public g3(Ll/xsl;)I
    .locals 1

    .line 1
    iget p1, p0, Ll/liu;->f:I

    .line 2
    .line 3
    const/16 v0, 0x258

    .line 4
    .line 5
    if-le p1, v0, :cond_0

    .line 6
    .line 7
    iput v0, p0, Ll/liu;->f:I

    .line 8
    .line 9
    :cond_0
    iget p0, p0, Ll/liu;->f:I

    .line 10
    .line 11
    return p0
.end method

.method public final synthetic m3(JLcom/p1/mobile/putong/live/base/data/BLiveCampaign;Ljava/lang/Long;)V
    .locals 2

    .line 1
    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    cmp-long p4, v0, p1

    .line 6
    .line 7
    if-nez p4, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p3, p1, p2}, Ll/liu;->i3(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;J)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic n3(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ll/liu;->d3(Ljava/util/List;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->z(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0}, Ll/liu;->u3()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic o3(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$PopUp;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$PopUp;->getCampaignId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0, p1}, Ll/liu;->h3(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic p3(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->popUpRules:Lcom/p1/mobile/putong/live/base/data/BLivePopUpRules;

    .line 2
    .line 3
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePopUpRules;->liveWatchDuration:J

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v4, v0, v2

    .line 8
    .line 9
    if-lez v4, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, p1, v0, v1}, Ll/liu;->c3(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;J)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->popUpRules:Lcom/p1/mobile/putong/live/base/data/BLivePopUpRules;

    .line 21
    .line 22
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePopUpRules;->anchorLiveDuration:J

    .line 23
    .line 24
    cmp-long v2, v0, v2

    .line 25
    .line 26
    if-lez v2, :cond_1

    .line 27
    .line 28
    invoke-direct {p0, p1, v0, v1}, Ll/liu;->c3(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;J)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public final synthetic q3(Ll/md4;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/md4;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/md4;->a()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-direct {p0, p1}, Ll/liu;->h3(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p1}, Ll/md4;->c()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->SchemeHandleEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$f;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$f;->a()Ll/v3f$d;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance v0, Ll/aae0$a;

    .line 32
    .line 33
    const/16 v1, 0x514

    .line 34
    .line 35
    invoke-direct {v0, v1}, Ll/aae0$a;-><init>(I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Ll/md4;->a()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {v0, p1}, Ll/aae0$a;->e(Ljava/lang/String;)Ll/aae0$a;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Ll/aae0$a;->c()Ll/aae0;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public r3(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->schema:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->SchemeHandleEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$f;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$f;->a()Ll/v3f$d;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v0, Ll/aae0$a;

    .line 20
    .line 21
    const/16 v1, 0x514

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ll/aae0$a;-><init>(I)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->schema:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ll/aae0$a;->e(Ljava/lang/String;)Ll/aae0$a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Ll/aae0$a;->c()Ll/aae0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVChatOpenH5Event:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$d;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$d;->b()Ll/v3f$d;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    const/16 v0, 0x1f4

    .line 51
    .line 52
    invoke-static {v0}, Ll/ypu;->c(I)Ll/ypu$a;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0, p1}, Ll/ypu$a;->p(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)Ll/ypu$a;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Ll/ypu$a;->o()Ll/ypu;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public s3()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xnu;->o()Ljava/lang/String;

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
    invoke-virtual {p0}, Ll/liu;->f3()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->userId:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v0, v1, v2}, Ll/jwu;->M(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/fiu;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/fiu;-><init>(Ll/liu;)V

    .line 50
    .line 51
    .line 52
    new-instance p0, Ll/giu;

    .line 53
    .line 54
    invoke-direct {p0}, Ll/giu;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

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

.method public w3(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/liu;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
