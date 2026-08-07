.class public Ll/cfv;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Ll/iev;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ljava/lang/String;

.field public k:Ll/ve4;

.field public l:Ljava/lang/String;

.field public m:Z

.field public n:Landroid/view/View;


# direct methods
.method public constructor <init>(Ll/dum;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/cfv;->i:Ljava/util/Map;

    .line 10
    .line 11
    iput-object p2, p0, Ll/cfv;->n:Landroid/view/View;

    .line 12
    .line 13
    return-void
.end method

.method private synthetic A4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/cfv;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p0, Ll/iev;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/iev;->x(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private E4(Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast v0, Ll/iev;

    .line 17
    .line 18
    invoke-virtual {v0, p1, p3, p4, p5}, Ll/iev;->F(Ljava/lang/String;ZZLl/x20;)V

    .line 19
    .line 20
    .line 21
    iget-boolean p3, p0, Ll/cfv;->m:Z

    .line 22
    .line 23
    if-eqz p3, :cond_1

    .line 24
    .line 25
    iget-object p3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 26
    .line 27
    check-cast p3, Ll/iev;

    .line 28
    .line 29
    invoke-virtual {p3}, Ll/iev;->E()V

    .line 30
    .line 31
    .line 32
    const/4 p3, 0x0

    .line 33
    iput-boolean p3, p0, Ll/cfv;->m:Z

    .line 34
    .line 35
    :cond_1
    iget-object p3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 36
    .line 37
    check-cast p3, Ll/iev;

    .line 38
    .line 39
    invoke-virtual {p3, p2}, Ll/iev;->p(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 40
    .line 41
    .line 42
    invoke-direct {p0, p1}, Ll/cfv;->G4(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    :goto_0
    return-void
.end method

.method private G4(Ljava/lang/String;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/cfv;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v0, v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Ll/cfv;->i:Ljava/util/Map;

    .line 12
    .line 13
    const-string v1, "H5-Authorization"

    .line 14
    .line 15
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v0, p0, Ll/cfv;->l:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/wrv;->a()Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/pev;

    .line 41
    .line 42
    invoke-direct {v1, p0, p1}, Ll/pev;-><init>(Ll/cfv;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    new-instance v2, Ll/qev;

    .line 46
    .line 47
    invoke-direct {v2, p0, p1}, Ll/qev;-><init>(Ll/cfv;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 59
    .line 60
    check-cast v0, Ll/iev;

    .line 61
    .line 62
    iget-object v1, p0, Ll/cfv;->l:Ljava/lang/String;

    .line 63
    .line 64
    iget-object p0, p0, Ll/cfv;->i:Ljava/util/Map;

    .line 65
    .line 66
    invoke-virtual {v0, v1, p1, p0}, Ll/iev;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 71
    .line 72
    check-cast v0, Ll/iev;

    .line 73
    .line 74
    iget-object p0, p0, Ll/cfv;->i:Ljava/util/Map;

    .line 75
    .line 76
    invoke-virtual {v0, p1, p0}, Ll/iev;->z(Ljava/lang/String;Ljava/util/Map;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method private H4(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$PopUpContentUpdateNotice;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cfv;->k:Ll/ve4;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v0, Ll/iev;

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$PopUpContentUpdateNotice;->getUrl()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/iev;->q(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;->newBuilder()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo$Builder;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$PopUpContentUpdateNotice;->getUpdateType()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo$Builder;->setUpdateType(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo$Builder;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$PopUpContentUpdateNotice;->getData()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {v0, p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo$Builder;->setData(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo$Builder;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;

    .line 45
    .line 46
    iget-object p0, p0, Ll/cfv;->k:Ll/ve4;

    .line 47
    .line 48
    invoke-interface {p0, p1}, Ll/ve4;->a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic J3(Ll/cfv;Ll/crp0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cfv;->t4(Ll/crp0;)V

    return-void
.end method

.method public static synthetic K3(Ll/cfv;Ll/ztp0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cfv;->n4(Ll/ztp0;)V

    return-void
.end method

.method public static synthetic L3(Ll/cfv;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/cfv;->z4(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic M3(Ll/cfv;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cfv;->r4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic N3(Ll/bcg0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method private O1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->FastRechargeEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$FastRechargeEventGroup;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$FastRechargeEventGroup;->showFastRechargeDialog()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/bkg$a;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/bkg$a;-><init>()V

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Ll/bkg$a;->g(I)Ll/bkg$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "js"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/bkg$a;->i(Ljava/lang/String;)Ll/bkg$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "liveGiftH5Click"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ll/bkg$a;->j(Ljava/lang/String;)Ll/bkg$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ll/bkg$a;->e()Ll/bkg;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic O3(Ll/cfv;Ll/bcg0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cfv;->u4(Ll/bcg0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P3(Ll/cfv;Ll/px50;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cfv;->m4(Ll/px50;)V

    return-void
.end method

.method public static synthetic R3(Ll/cfv;Ll/px50;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cfv;->l4(Ll/px50;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S3(Ll/cfv;[IZIIZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p10}, Ll/cfv;->q4([IZIIZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V

    return-void
.end method

.method public static synthetic T3(Ll/cfv;Ll/bcg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cfv;->v4(Ll/bcg0;)V

    return-void
.end method

.method public static synthetic U3(Ll/cfv;Ll/bcg0;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cfv;->j4(Ll/bcg0;)Z

    move-result p0

    return p0
.end method

.method public static synthetic V3(Ll/cfv;Ll/lx50;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cfv;->o4(Ll/lx50;)V

    return-void
.end method

.method public static synthetic W3(Ll/cfv;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cfv;->A4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic X3(Ll/cfv;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cfv;->s4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic Y3(Ll/cfv;[IZIIZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p10}, Ll/cfv;->p4([IZIIZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V

    return-void
.end method

.method public static synthetic Z3(Ll/cfv;Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$PopUpContentUpdateNotice;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cfv;->H4(Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$PopUpContentUpdateNotice;)V

    return-void
.end method

.method public static synthetic a4(Ll/cfv;Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/cfv;->x4(Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V

    return-void
.end method

.method public static synthetic b4(Ll/cfv;Ljava/lang/String;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/cfv;->y4(Ljava/lang/String;Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method

.method public static synthetic c4(Ll/cfv;Ll/crp0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cfv;->w4(Ll/crp0;)V

    return-void
.end method

.method private e4(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "tantanapp://live/room/"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const-string p0, "tantanapp://voice-live/room/"

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method private j4(Ll/bcg0;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->D2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget p1, p1, Ll/bcg0;->b:I

    .line 8
    .line 9
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Ll/iev;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/iev;->l()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-ne p1, p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method private synthetic u4(Ll/bcg0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method private synthetic y4(Ljava/lang/String;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 1

    .line 1
    iget-object p2, p2, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/cfv;->l:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v0, Ll/iev;

    .line 8
    .line 9
    iget-object p0, p0, Ll/cfv;->i:Ljava/util/Map;

    .line 10
    .line 11
    invoke-virtual {v0, p2, p1, p0}, Ll/iev;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic z4(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/iev;

    .line 4
    .line 5
    const-string v1, ""

    .line 6
    .line 7
    iget-object p0, p0, Ll/cfv;->i:Ljava/util/Map;

    .line 8
    .line 9
    invoke-virtual {v0, v1, p1, p0}, Ll/iev;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 10
    .line 11
    .line 12
    new-instance p0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string p1, "accessOutterToken"

    .line 15
    .line 16
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p1, "[live]webDialog"

    .line 31
    .line 32
    invoke-static {p1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public B4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cfv;->i:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/cfv;->n:Landroid/view/View;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public C4()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cfv;->n:Landroid/view/View;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public D4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;->closeLiveCampaignDialog()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lrx/c;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/zev;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/zev;-><init>(Ll/cfv;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;->showRechargeDialog()Ll/v3f$c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lrx/c;

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Ll/afv;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/afv;-><init>(Ll/cfv;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;->jumpToRoom()Ll/v3f$d;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    check-cast v0, Lrx/c;

    .line 96
    .line 97
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    new-instance v1, Ll/bfv;

    .line 110
    .line 111
    invoke-direct {v1, p0}, Ll/bfv;-><init>(Ll/cfv;)V

    .line 112
    .line 113
    .line 114
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 126
    .line 127
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;->subscribeCampaign()Ll/v3f$d;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    check-cast v0, Lrx/c;

    .line 136
    .line 137
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    new-instance v1, Ll/kev;

    .line 142
    .line 143
    invoke-direct {v1}, Ll/kev;-><init>()V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    new-instance v1, Ll/lev;

    .line 151
    .line 152
    invoke-direct {v1, p0}, Ll/lev;-><init>(Ll/cfv;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    new-instance v1, Ll/mev;

    .line 160
    .line 161
    invoke-direct {v1, p0}, Ll/mev;-><init>(Ll/cfv;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    new-instance v1, Ll/nev;

    .line 169
    .line 170
    invoke-direct {v1, p0}, Ll/nev;-><init>(Ll/cfv;)V

    .line 171
    .line 172
    .line 173
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 178
    .line 179
    .line 180
    sget-object v0, Ll/htd0;->d:Ll/htd0;

    .line 181
    .line 182
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    check-cast v0, Ll/urv;

    .line 187
    .line 188
    invoke-virtual {v0}, Ll/urv;->a()Lrx/c;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    new-instance v1, Ll/oev;

    .line 205
    .line 206
    invoke-direct {v1, p0}, Ll/oev;-><init>(Ll/cfv;)V

    .line 207
    .line 208
    .line 209
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 214
    .line 215
    .line 216
    return-void
.end method

.method public F4(Ljava/lang/String;[IZILcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZIZLl/x20;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/cfv;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "_bid"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    const/4 v3, 0x1

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    check-cast v1, Ll/iev;

    .line 25
    .line 26
    invoke-virtual {v1, v3, p1, p5}, Ll/iev;->m(ZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    check-cast v1, Ll/iev;

    .line 31
    .line 32
    invoke-virtual {v1, v2, p1, p5}, Ll/iev;->m(ZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 33
    .line 34
    .line 35
    :goto_0
    aget v0, p2, v2

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    aget v0, p2, v3

    .line 40
    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-virtual/range {p0 .. p10}, Ll/cfv;->i4(Ljava/lang/String;[IZILcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZIZLl/x20;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    move-object p3, p5

    .line 48
    move p4, p6

    .line 49
    move p5, p7

    .line 50
    move-object p6, p10

    .line 51
    invoke-virtual {p0}, Ll/xzs;->K2()Ll/t8s;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    sget-object p7, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->WEBVIEW:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 56
    .line 57
    invoke-virtual {p2, p7}, Ll/t8s;->m(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Z

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    if-eqz p2, :cond_2

    .line 62
    .line 63
    const-wide/16 p7, 0x64

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_2
    const-wide/16 p7, 0x0

    .line 67
    .line 68
    :goto_1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object p9

    .line 72
    move-object p2, p1

    .line 73
    move-object p1, p0

    .line 74
    new-instance p0, Ll/yev;

    .line 75
    .line 76
    invoke-direct/range {p0 .. p6}, Ll/yev;-><init>(Ll/cfv;Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V

    .line 77
    .line 78
    .line 79
    invoke-static {p9, p0, p7, p8}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/jev;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/jev;-><init>(Ll/cfv;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/tev;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/tev;-><init>(Ll/cfv;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->WebViewDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$WebViewDialogEvent;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$WebViewDialogEvent;->dismiss()Ll/v3f$d;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lrx/c;

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/uev;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/uev;-><init>(Ll/cfv;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->openGiftDialogEvent()Ll/v3f$d;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Lrx/c;

    .line 92
    .line 93
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    new-instance v1, Ll/vev;

    .line 98
    .line 99
    invoke-direct {v1, p0}, Ll/vev;-><init>(Ll/cfv;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public d4()V
    .locals 1

    .line 1
    new-instance v0, Ll/iev;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/iev;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public f4(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cfv;->j:Ljava/lang/String;

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
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    check-cast p0, Ll/iev;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/iev;->j()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public g4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/iev;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/iev;->j()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final h4(Ljava/lang/String;Ll/px50;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-virtual {p2}, Ll/px50;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x1f4

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/cfv;->m:Z

    .line 11
    .line 12
    const-string v0, "vipCooperation"

    .line 13
    .line 14
    invoke-virtual {p2}, Ll/px50;->e()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    new-instance p1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2}, Ll/px50;->n()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v0, "?watchLiveSeconds="

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/df4;

    .line 42
    .line 43
    invoke-direct {v0, v1}, Ll/df4;-><init>(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    new-instance v0, Ll/df4;

    .line 54
    .line 55
    invoke-direct {v0, v1}, Ll/df4;-><init>(I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string p0, "&id="

    .line 66
    .line 67
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p2}, Ll/px50;->g()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    :cond_0
    return-object p1
.end method

.method public final i4(Ljava/lang/String;[IZILcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZIZLl/x20;)V
    .locals 12

    .line 1
    new-instance v0, Ll/rev;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v7, p1

    .line 5
    move-object v2, p2

    .line 6
    move v3, p3

    .line 7
    move/from16 v4, p4

    .line 8
    .line 9
    move-object/from16 v8, p5

    .line 10
    .line 11
    move/from16 v9, p6

    .line 12
    .line 13
    move/from16 v10, p7

    .line 14
    .line 15
    move/from16 v5, p8

    .line 16
    .line 17
    move/from16 v6, p9

    .line 18
    .line 19
    move-object/from16 v11, p10

    .line 20
    .line 21
    invoke-direct/range {v0 .. v11}, Ll/rev;-><init>(Ll/cfv;[IZIIZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public isShowing()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/iev;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/iev;->isShowing()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public k4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 8
    .line 9
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->c7:I

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/vp20;->n()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->b3:I

    .line 38
    .line 39
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 44
    .line 45
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1}, Ll/oo2;->o0()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->t(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->r(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 81
    .line 82
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->v(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->w(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->u(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    sget-object p2, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;->CHANGE_SOURCE_WITH_BACK:Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;

    .line 115
    .line 116
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->n(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomType;)Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData$a;->m()Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->JumpRoomEvent:Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;

    .line 129
    .line 130
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$JumpRoomEvent;->jumpRoom()Ll/v3f$d;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public final synthetic l4(Ll/px50;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/px50;->n()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0, p1}, Ll/cfv;->e4(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic m4(Ll/px50;)V
    .locals 12

    .line 1
    invoke-virtual {p1}, Ll/px50;->n()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0, p1}, Ll/cfv;->h4(Ljava/lang/String;Ll/px50;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {p1}, Ll/px50;->m()[I

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {p1}, Ll/px50;->i()Z

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    invoke-virtual {p1}, Ll/px50;->h()I

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    invoke-virtual {p1}, Ll/px50;->b()Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    invoke-virtual {p1}, Ll/px50;->k()Z

    .line 26
    .line 27
    .line 28
    move-result v7

    .line 29
    invoke-virtual {p1}, Ll/px50;->j()Z

    .line 30
    .line 31
    .line 32
    move-result v8

    .line 33
    invoke-virtual {p1}, Ll/px50;->f()I

    .line 34
    .line 35
    .line 36
    move-result v9

    .line 37
    invoke-virtual {p1}, Ll/px50;->l()Z

    .line 38
    .line 39
    .line 40
    move-result v10

    .line 41
    invoke-virtual {p1}, Ll/px50;->d()Ll/x20;

    .line 42
    .line 43
    .line 44
    move-result-object v11

    .line 45
    move-object v1, p0

    .line 46
    invoke-virtual/range {v1 .. v11}, Ll/cfv;->F4(Ljava/lang/String;[IZILcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZIZLl/x20;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/cfv;->k:Ll/ve4;

    .line 6
    .line 7
    return-void
.end method

.method public final synthetic n4(Ll/ztp0;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/ztp0;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cfv;->f4(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic o4(Ll/lx50;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cfv;->g4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic p4([IZIIZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Ll/iev;

    .line 5
    .line 6
    move-object v2, p1

    .line 7
    move v3, p2

    .line 8
    move v4, p3

    .line 9
    move v5, p4

    .line 10
    move v6, p5

    .line 11
    invoke-virtual/range {v1 .. v6}, Ll/iev;->B([IZIIZ)V

    .line 12
    .line 13
    .line 14
    move-object v2, p0

    .line 15
    move-object v3, p6

    .line 16
    move-object v4, p7

    .line 17
    move/from16 v5, p8

    .line 18
    .line 19
    move/from16 v6, p9

    .line 20
    .line 21
    move-object/from16 v7, p10

    .line 22
    .line 23
    invoke-direct/range {v2 .. v7}, Ll/cfv;->E4(Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic q4([IZIIZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V
    .locals 15

    .line 1
    invoke-virtual {p0}, Ll/xzs;->K2()Ll/t8s;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->WEBVIEW:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/t8s;->m(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-wide/16 v0, 0x64

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-wide/16 v0, 0x0

    .line 17
    .line 18
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    new-instance v3, Ll/sev;

    .line 23
    .line 24
    move-object v4, p0

    .line 25
    move-object/from16 v5, p1

    .line 26
    .line 27
    move/from16 v6, p2

    .line 28
    .line 29
    move/from16 v7, p3

    .line 30
    .line 31
    move/from16 v8, p4

    .line 32
    .line 33
    move/from16 v9, p5

    .line 34
    .line 35
    move-object/from16 v10, p6

    .line 36
    .line 37
    move-object/from16 v11, p7

    .line 38
    .line 39
    move/from16 v12, p8

    .line 40
    .line 41
    move/from16 v13, p9

    .line 42
    .line 43
    move-object/from16 v14, p10

    .line 44
    .line 45
    invoke-direct/range {v3 .. v14}, Ll/sev;-><init>(Ll/cfv;[IZIIZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v2, v3, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic r4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cfv;->g4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic s4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cfv;->O1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/cfv;->D4()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/aj1;->g()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/wev;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/wev;-><init>(Ll/cfv;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;->executeJs()Ll/v3f$d;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lrx/c;

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/xev;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/xev;-><init>(Ll/cfv;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final synthetic t4(Ll/crp0;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/crp0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p1, Ll/crp0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Ll/crp0;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1, p1}, Ll/cfv;->k4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic v4(Ll/bcg0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/bcg0;->c:Ll/ve4;

    .line 2
    .line 3
    iput-object v0, p0, Ll/cfv;->k:Ll/ve4;

    .line 4
    .line 5
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Ll/iev;

    .line 8
    .line 9
    iget-object v0, p1, Ll/bcg0;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/iev;->q(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    iget-object p1, p1, Ll/bcg0;->d:Ll/y20;

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public final synthetic w4(Ll/crp0;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/crp0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p1, Ll/crp0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Ll/crp0;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1, p1}, Ll/cfv;->k4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic x4(Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Ll/cfv;->E4(Ljava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZLl/x20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
