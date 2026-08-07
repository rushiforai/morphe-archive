.class public Ll/qgu;
.super Ll/mhu;
.source "SourceFile"


# instance fields
.field public h:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;

.field public i:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/mhu;-><init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic W2(Ll/qgu;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qgu;->d3(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic X2(Ll/qgu;Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatAnchorCallResult;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qgu;->c3(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatAnchorCallResult;)V

    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/mhu;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVideoChatEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$e;->e()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/ngu;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/ngu;-><init>(Ll/qgu;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/ahu;->I2(Ll/v3f$b;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Ll/xnu;->c:Ll/ecl0;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/ecl0;->l()Ll/aj1;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/aj1;->o0()Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/ogu;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/ogu;-><init>(Ll/qgu;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public U2()V
    .locals 1

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
    invoke-static {v0}, Ll/yuk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/yuk0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p0}, Ll/qgu;->Y2()V

    .line 31
    .line 32
    .line 33
    sget-object p0, Ll/btu;->d:Ljava/lang/String;

    .line 34
    .line 35
    sget-object v0, Ll/btu;->h:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    :goto_0
    const-string p0, "\u6b63\u5728\u63a5\u901a\u4e2d"

    .line 42
    .line 43
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public Y2()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qgu;->i:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/mhu;->g:Ll/icl0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/icl0;->f()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->e()V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Ll/qgu;->h:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;

    .line 20
    .line 21
    return-void
.end method

.method public final Z2(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qgu;->h:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/qgu;->Y2()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public a3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/qgu;->h:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;

    .line 2
    .line 3
    iget-object v0, p0, Ll/mhu;->g:Ll/icl0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/icl0;->d()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->n(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;->anchorId:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;->userId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, v0, p1}, Ll/qgu;->f3(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sget-object p1, Ll/tbs;->b:Ll/vwt;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/vwt;->O5()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    int-to-long v0, p1

    .line 29
    sget-object p1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 30
    .line 31
    invoke-static {v0, v1, p1}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p0, p1, v0}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const/4 v0, 0x1

    .line 41
    invoke-virtual {p1, v0}, Lrx/c;->take(I)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    new-instance v0, Ll/pgu;

    .line 54
    .line 55
    invoke-direct {v0, p0}, Ll/pgu;-><init>(Ll/qgu;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iput-object p1, p0, Ll/qgu;->i:Ll/kcg0;

    .line 67
    .line 68
    return-void
.end method

.method public b3(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/qgu;->h:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p1}, Ll/yuk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    sget-object v0, Ll/yuk0;->a:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ll/xnu;->S(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;

    .line 32
    .line 33
    const-string v0, "\u63a5\u901a\u4e2d\uff0c\u8bf7\u7a0d\u5019"

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->setTitle(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/qgu;->i:Ll/kcg0;

    .line 39
    .line 40
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Ll/yuk0;->a(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-nez p1, :cond_3

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-static {p1}, Ll/yuk0;->g(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_2

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_2
    :goto_0
    return-void

    .line 73
    :cond_3
    :goto_1
    invoke-virtual {p0}, Ll/qgu;->Y2()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final synthetic c3(Lcom/p1/mobile/longlink/msg/videoChat/LongLinkVideoChat$LiveVideoChatAnchorCallResult;)V
    .locals 0

    .line 1
    const-string p1, "\u5bf9\u65b9\u5fd9\u7ebf\u4e2d"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qgu;->Z2(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic d3(Ljava/lang/Long;)V
    .locals 0

    .line 1
    const-string p1, "\u5bf9\u65b9\u65e0\u5e94\u7b54"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qgu;->Z2(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qgu;->h:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;->id:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorCallId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/qgu;->Y2()V

    .line 18
    .line 19
    .line 20
    return v1

    .line 21
    :cond_1
    const/4 p0, 0x1

    .line 22
    return p0
.end method

.method public f3(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mhu;->f:Ll/l4g0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/l4g0;

    .line 7
    .line 8
    sget-object v1, Ll/btu;->h:Ljava/lang/String;

    .line 9
    .line 10
    const-string v2, "LiveVChatAnchorRecallModule"

    .line 11
    .line 12
    invoke-direct {v0, v1, v2}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/mhu;->f:Ll/l4g0;

    .line 16
    .line 17
    const-string v1, "sender_id"

    .line 18
    .line 19
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v1, "receiver_id"

    .line 24
    .line 25
    invoke-static {v1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    filled-new-array {p1, p2}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {v0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/mhu;->f:Ll/l4g0;

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/l4g0;->i()V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/mhu;->f:Ll/l4g0;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 44
    .line 45
    .line 46
    return-void
.end method
