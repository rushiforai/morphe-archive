.class public Ll/tgu;
.super Ll/mhu;
.source "SourceFile"


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

.method public static synthetic W2(Ll/tgu;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tgu;->Z2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;)V

    return-void
.end method

.method public static synthetic X2(Ll/tgu;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tgu;->Y2(Ljava/lang/String;)V

    return-void
.end method

.method private Y2(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ll/yuk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->m()V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/mhu;->g:Ll/icl0;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/icl0;->d()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->userId:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ll/xnu;->o()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, p1, v0}, Ll/tgu;->a3(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {p1}, Ll/yuk0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_1

    .line 61
    .line 62
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 63
    .line 64
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->l()V

    .line 67
    .line 68
    .line 69
    :cond_1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-static {p1}, Ll/yuk0;->a(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_2

    .line 82
    .line 83
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 84
    .line 85
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;

    .line 86
    .line 87
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->e()V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Ll/mhu;->g:Ll/icl0;

    .line 91
    .line 92
    invoke-virtual {p1}, Ll/icl0;->f()V

    .line 93
    .line 94
    .line 95
    :cond_2
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-static {p1}, Ll/yuk0;->g(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    if-eqz p1, :cond_3

    .line 108
    .line 109
    iget-object p0, p0, Ll/mhu;->g:Ll/icl0;

    .line 110
    .line 111
    invoke-virtual {p0}, Ll/icl0;->f()V

    .line 112
    .line 113
    .line 114
    :cond_3
    return-void
.end method

.method private synthetic Z2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->p(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method


# virtual methods
.method public T()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/mhu;->T()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->m()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/xnu;->z()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v2, Ll/rgu;

    .line 29
    .line 30
    invoke-direct {v2, p0}, Ll/rgu;-><init>(Ll/tgu;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/xnu;->w()Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->chat:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->liveId:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v0}, Ll/jwu;->H(Ljava/lang/String;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/sgu;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/sgu;-><init>(Ll/tgu;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public U2()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mhu;->g:Ll/icl0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/icl0;->f()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Ll/yuk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    sget-object v0, Ll/yuk0;->h:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {}, Ll/btu;->g()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget-object v0, Ll/yuk0;->e:Ljava/lang/String;

    .line 27
    .line 28
    :goto_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0, v0}, Ll/xnu;->S(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public a3(Ljava/lang/String;Ljava/lang/String;)V
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
    sget-object v1, Ll/btu;->k:Ljava/lang/String;

    .line 9
    .line 10
    const-string v2, "LiveVChatDialingModule"

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
