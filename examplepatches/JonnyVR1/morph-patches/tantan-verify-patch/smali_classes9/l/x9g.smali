.class public Ll/x9g;
.super Ll/vk2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/vk2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Ll/x9g;Ll/ycg;Ll/y20;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/x9g;->m(Ll/ycg;Ll/y20;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public f(Ll/ycg;Ll/y20;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ycg;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->r0()Ll/v5g;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    .line 10
    .line 11
    iget-object v1, v1, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 12
    .line 13
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ll/v5g;->c(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;->userId:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;->anchorId:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEntryEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEntryEvent;

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEntryEvent;->companyFansGift()Ll/v3f$d;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    new-instance v2, Ll/co5;

    .line 58
    .line 59
    iget-object v3, p1, Ll/ycg;->k:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;->toJson()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v4, Ll/w9g;

    .line 66
    .line 67
    invoke-direct {v4, p0, p1, p2}, Ll/w9g;-><init>(Ll/x9g;Ll/ycg;Ll/y20;)V

    .line 68
    .line 69
    .line 70
    invoke-direct {v2, v3, v0, v4}, Ll/co5;-><init>(Ljava/lang/String;Ljava/lang/String;Ll/y20;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1, v2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 78
    .line 79
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final synthetic m(Ll/ycg;Ll/y20;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ll/e9g;

    .line 2
    .line 3
    const/16 v1, 0x1b59

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/e9g;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, p1, v0}, Ll/x9g;->o(Ll/ycg;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    const-string v1, "1"

    .line 20
    .line 21
    invoke-static {v1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p3

    .line 25
    if-eqz p3, :cond_2

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0, p1, v0}, Ll/x9g;->n(Ll/ycg;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 39
    .line 40
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final n(Ll/ycg;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 8

    .line 1
    iget v0, p1, Ll/ycg;->l:I

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    iget-object v4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->name:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object v6, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v7, p1, Ll/ycg;->k:Ljava/lang/String;

    .line 26
    .line 27
    const-string v2, "fans_club_accompany"

    .line 28
    .line 29
    const/4 v5, 0x1

    .line 30
    invoke-static/range {v0 .. v7}, Ll/qzj;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final o(Ll/ycg;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 8

    .line 1
    iget v0, p1, Ll/ycg;->l:I

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    iget-object v4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->name:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object v6, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v7, p1, Ll/ycg;->k:Ljava/lang/String;

    .line 26
    .line 27
    const-string v2, "fans_club_accompany"

    .line 28
    .line 29
    const/4 v5, 0x1

    .line 30
    invoke-static/range {v0 .. v7}, Ll/qzj;->b(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
