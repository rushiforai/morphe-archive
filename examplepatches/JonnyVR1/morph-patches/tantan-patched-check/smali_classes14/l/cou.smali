.class public Ll/cou;
.super Ll/ahu;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ahu<",
        "Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatInfoView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatInfoView;)V
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

.method public static synthetic R2(Ll/cou;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cou;->Y2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S2(Ll/cou;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cou;->V2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic T2(Ll/cou;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cou;->X2(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic U2(Ll/cou;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cou;->W2(Ll/vxj0;)V

    return-void
.end method

.method private synthetic V2(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cou;->a3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic W2(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatInfoView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatInfoView;->d()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private a3()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v1}, Ll/yuk0;->a(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->players:Ljava/util/List;

    .line 24
    .line 25
    new-instance v2, Ll/bou;

    .line 26
    .line 27
    invoke-direct {v2, p0}, Ll/bou;-><init>(Ll/cou;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 35
    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 39
    .line 40
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatInfoView;

    .line 41
    .line 42
    iget-wide v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->startedTime:J

    .line 43
    .line 44
    invoke-virtual {p0, v1, v2, v3}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatInfoView;->j(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;J)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void

    .line 48
    :cond_1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 49
    .line 50
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatInfoView;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatInfoView;->e()V

    .line 53
    .line 54
    .line 55
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
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/xnu;->z()Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/ynu;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/ynu;-><init>(Ll/cou;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->b()Ll/v3f$c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/znu;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/znu;-><init>(Ll/cou;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v0, v1}, Ll/ahu;->I2(Ll/v3f$b;Ll/y20;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/aou;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/aou;-><init>(Ll/cou;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ll/xnu;->R(Ll/y20;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final synthetic X2(Ljava/lang/Long;)V
    .locals 4

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatInfoView;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    const-wide/16 v2, 0x3e8

    .line 10
    .line 11
    mul-long/2addr v0, v2

    .line 12
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatInfoView;->i(J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic Y2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "attendee"

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->role:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const-string p0, "anchor"

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->role:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public Z2()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->getAnchor()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->userId:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/ahu;->N2()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->userId:Ljava/lang/String;

    .line 25
    .line 26
    move-object v3, v1

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    move-object v3, v2

    .line 29
    :goto_0
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p0}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->liveId:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->roomId:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {}, Ll/pzi0;->o()J

    .line 42
    .line 43
    .line 44
    move-result-wide v6

    .line 45
    const-wide/16 v8, 0x3e8

    .line 46
    .line 47
    div-long/2addr v6, v8

    .line 48
    invoke-static/range {v2 .. v7}, Ll/efv;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->d2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {v1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
