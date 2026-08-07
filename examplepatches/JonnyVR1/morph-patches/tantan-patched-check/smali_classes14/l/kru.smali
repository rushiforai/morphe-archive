.class public Ll/kru;
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

.method public static synthetic W2(Ll/kru;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kru;->a3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;)V

    return-void
.end method

.method public static synthetic X2(Ll/kru;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/kru;->Z2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic Y2(Ll/kru;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kru;->b3(Ljava/lang/Throwable;)V

    return-void
.end method

.method private Z2(Ljava/lang/String;)V
    .locals 0

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
    invoke-static {p1}, Ll/yuk0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

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
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->l()V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-static {p1}, Ll/yuk0;->a(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iget-object p1, p0, Ll/mhu;->g:Ll/icl0;

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/icl0;->f()V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->e()V

    .line 46
    .line 47
    .line 48
    :cond_1
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
    new-instance v1, Ll/jru;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/jru;-><init>(Ll/kru;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 37
    .line 38
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1}, Ll/xnu;->w()Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->randomMatch:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->q(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/mhu;->g:Ll/icl0;

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/icl0;->d()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ll/kru;->c3()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public U2()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mhu;->g:Ll/icl0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/icl0;->f()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/btu;->f:Ljava/lang/String;

    .line 7
    .line 8
    sget-object v1, Ll/btu;->l:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/xnu;->A()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Ll/yuk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    sget-object v0, Ll/yuk0;->h:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {}, Ll/btu;->g()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    sget-object v0, Ll/yuk0;->e:Ljava/lang/String;

    .line 44
    .line 45
    :goto_0
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0, v0}, Ll/xnu;->S(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Ll/xnu;->w()Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->randomMatch:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;->id:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    const/4 v0, 0x1

    .line 72
    invoke-virtual {p0, v0}, Ll/ahu;->L2(Z)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_2
    invoke-virtual {p0}, Ll/ahu;->H2()Ll/xnu;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Ll/xnu;->w()Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->randomMatch:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;

    .line 85
    .line 86
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;->id:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {v0}, Ll/jwu;->X(Ljava/lang/String;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    new-instance v1, Ll/hru;

    .line 93
    .line 94
    invoke-direct {v1, p0}, Ll/hru;-><init>(Ll/kru;)V

    .line 95
    .line 96
    .line 97
    new-instance v2, Ll/iru;

    .line 98
    .line 99
    invoke-direct {v2, p0}, Ll/iru;-><init>(Ll/kru;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

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

.method public final synthetic a3(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/ahu;->L2(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic b3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/ahu;->L2(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public c3()V
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
    sget-object v1, Ll/btu;->l:Ljava/lang/String;

    .line 9
    .line 10
    const-string v2, "LiveVChatRandomMatchModule"

    .line 11
    .line 12
    invoke-direct {v0, v1, v2}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/mhu;->f:Ll/l4g0;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/l4g0;->i()V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/mhu;->f:Ll/l4g0;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 23
    .line 24
    .line 25
    return-void
.end method
