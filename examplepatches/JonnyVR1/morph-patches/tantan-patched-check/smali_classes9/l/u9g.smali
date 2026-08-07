.class public Ll/u9g;
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

.method public static synthetic l(Ll/y20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic m(Ll/u9g;Ll/ycg;Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/u9g;->o(Ll/ycg;Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    return-void
.end method

.method public static synthetic n(Ll/y20;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f(Ll/ycg;Ll/y20;)V
    .locals 9
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
    iget-object v0, p1, Ll/ycg;->j:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->rule:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;->giftId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p1, Ll/ycg;->j:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/u9g;->q(Ll/ycg;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/hne0$a;

    .line 37
    .line 38
    invoke-direct {v1}, Ll/hne0$a;-><init>()V

    .line 39
    .line 40
    .line 41
    sget-object v2, Ll/htd0;->c:Ll/htd0;

    .line 42
    .line 43
    invoke-static {v2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    check-cast v2, Ll/hiv;

    .line 48
    .line 49
    iget-object v3, p1, Ll/ycg;->j:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;

    .line 50
    .line 51
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->rule:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;

    .line 52
    .line 53
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;->giftId:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v2, v3}, Ll/hiv;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    new-instance v3, Ll/r9g;

    .line 60
    .line 61
    invoke-direct {v3, p0, p1, p2}, Ll/r9g;-><init>(Ll/u9g;Ll/ycg;Ll/y20;)V

    .line 62
    .line 63
    .line 64
    new-instance v4, Ll/s9g;

    .line 65
    .line 66
    invoke-direct {v4, p2}, Ll/s9g;-><init>(Ll/y20;)V

    .line 67
    .line 68
    .line 69
    new-instance v5, Ll/t9g;

    .line 70
    .line 71
    invoke-direct {v5, p2}, Ll/t9g;-><init>(Ll/y20;)V

    .line 72
    .line 73
    .line 74
    const-string p0, "sweetaccompany"

    .line 75
    .line 76
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 81
    .line 82
    .line 83
    move-result-object v8

    .line 84
    const/4 v6, 0x1

    .line 85
    const/4 v7, 0x1

    .line 86
    invoke-virtual/range {v1 .. v8}, Ll/hne0$a;->w(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/y20;Ll/y20;Ll/y20;ZILcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/hne0;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public final synthetic o(Ll/ycg;Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    iget-object p3, p1, Ll/ycg;->j:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/u9g;->p(Ll/ycg;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-interface {p2, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final p(Ll/ycg;)V
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
    iget-object v2, p1, Ll/ycg;->m:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p1, Ll/ycg;->j:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->rule:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;

    .line 12
    .line 13
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;->giftId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;->giftName:Ljava/lang/String;

    .line 16
    .line 17
    iget v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;->giftAmount:I

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object v6, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v7, p1, Ll/ycg;->k:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static/range {v0 .. v7}, Ll/qzj;->a(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final q(Ll/ycg;)V
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
    iget-object v2, p1, Ll/ycg;->m:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p1, Ll/ycg;->j:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->rule:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;

    .line 12
    .line 13
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;->giftId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;->giftName:Ljava/lang/String;

    .line 16
    .line 17
    iget v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;->giftAmount:I

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object v6, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v7, p1, Ll/ycg;->k:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static/range {v0 .. v7}, Ll/qzj;->b(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
